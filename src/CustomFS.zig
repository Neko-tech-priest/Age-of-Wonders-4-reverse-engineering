const std = @import("std");
const builtin = @import("builtin");
const native_os = builtin.os.tag;

const linux = std.os.linux;
const posix = std.posix;

const windows = std.os.windows;
const kernel32 = windows.kernel32;
const ntdll = windows.ntdll;
const print = std.debug.print;
const exit = std.process.exit;

const CustomMem = @import("CustomMem.zig");

const fd_t = std.posix.fd_t;

// pub const _close = switch (native_os) {
//     .linux => linux.close,
//     .windows => ntdll.NtClose,
//     else => @compileError("unsupported target"),
// };
// const i32_HANDLE = switch (native_os)
// {
//     .linux => i32,
//     .windows => windows.HANDLE,
//     else => @compileError("unsupported target"),
// };
// pub extern "ntdll" fn NtOpenFile(FileHandle: *windows.HANDLE, DesiredAccess: windows.ACCESS_MASK, ObjectAttributes: *windows.OBJECT_ATTRIBUTES, IoStatusBlock: *windows.IO_STATUS_BLOCK,   ShareAccess: windows.ULONG, OpenOptions: windows.ULONG ) callconv(.winapi) windows.NTSTATUS;

inline fn asciiToWide(src: [*:0]const u8, dst: [*:0]u16) void
{
    var i: u64 = 0;
    while(src[i] != 0)
    {
//         dst[i] = src[i];
        if(src[i] != '/')
        {
            dst[i] = src[i];
        }
        else
        {
            dst[i] = '\\';
        }
        i+=1;
    }
    dst[i] = 0;
}
const usize_NTSTATUS = switch (native_os)
{
    .linux => usize,
    .windows => windows.NTSTATUS,
    else => @compileError("unsupported target"),
};
const mode: linux.mode_t = 0o655;
pub inline fn close(fd: fd_t) usize_NTSTATUS
{
    return switch (native_os)
    {
        .linux => linux.close(fd),
        .windows =>ntdll.NtClose(fd),
        else => @compileError("unsupported target")
    };
}
pub const FILE_STAT_INFORMATION = extern struct
{
    FileId: windows.LARGE_INTEGER,
    CreationTime: windows.LARGE_INTEGER,
    LastAccessTime: windows.LARGE_INTEGER,
    LastWriteTime: windows.LARGE_INTEGER,
    ChangeTime: windows.LARGE_INTEGER,
    AllocationSize: windows.LARGE_INTEGER,
    EndOfFile: windows.LARGE_INTEGER,
    FileAttributes: windows.ULONG,
    ReparseTag: windows.ULONG,
    NumberOfLinks: windows.ULONG,
    EffectiveAccess:windows.ACCESS_MASK,
};
pub fn fstat(fd: fd_t, stat_buf: *linux.Stat) usize_NTSTATUS
{
    switch (native_os)
    {
        .linux => return linux.fstat(fd, stat_buf),
        .windows =>
        {
            var IoStatusBlock: windows.IO_STATUS_BLOCK = undefined;
            var StatInformation: FILE_STAT_INFORMATION = undefined;
            const rc = ntdll.NtQueryInformationFile(fd, &IoStatusBlock, &StatInformation, @sizeOf(FILE_STAT_INFORMATION), .FileStatInformation);
            print("NtQueryInformationFile: {d}\n", .{rc});
            stat_buf.* = std.mem.zeroes(linux.Stat);
            stat_buf.size = StatInformation.EndOfFile;
            stat_buf.atim.sec = StatInformation.LastAccessTime;
            stat_buf.mtim.sec = StatInformation.LastWriteTime;
            stat_buf.ctim.sec = StatInformation.ChangeTime;
//             stat_buf.mtim.sec
            return rc;
//             switch (rc) {
//                 .SUCCESS => {},
//                 // Buffer overflow here indicates that there is more information available than was able to be stored in the buffer
//                 // size provided. This is treated as success because the type of variable-length information that this would be relevant for
//                 // (name, volume name, etc) we don't care about.
//                 .BUFFER_OVERFLOW => {},
//                 .INVALID_PARAMETER => unreachable,
//                 .ACCESS_DENIED => return error.AccessDenied,
//                 else => return windows.unexpectedStatus(rc),
//             }
        },
        else => @compileError("unsupported target")
    }
}
pub fn open(path: [*:0]const u8, comptime flags: linux.O) fd_t
{
    switch (native_os)
    {
        .linux =>
        {
            return @intCast(linux.open(path, flags, mode));
        },
        .windows =>
        {
            var stack: [4096]u16 align(4096) = undefined;
            asciiToWide(path, @ptrCast(&stack));
            var length: u64 = 0;
            while(path[length] != 0)
                length+=1;
            length*=2;
            var FileHandle: windows.HANDLE = undefined;
            const DesiredAccess = windows.STANDARD_RIGHTS_READ | windows.FILE_READ_ATTRIBUTES | windows.FILE_READ_EA | windows.SYNCHRONIZE | windows.FILE_TRAVERSE;
            var ObjectName = windows.UNICODE_STRING
            {
                .Length = @intCast(length),
                .MaximumLength = @intCast(length),
                .Buffer = &stack,
            };
            var ObjectAttributes =  windows.OBJECT_ATTRIBUTES
            {
                .Length = @sizeOf(windows.OBJECT_ATTRIBUTES),
                .RootDirectory = windows.peb().ProcessParameters.CurrentDirectory.Handle,
                .ObjectName = &ObjectName,
                .Attributes = 0,
                .SecurityDescriptor = null,
                .SecurityQualityOfService = null,
            };
            var IoStatusBlock: windows.IO_STATUS_BLOCK = undefined;
            const ShareAccess = comptime switch((flags.ACCMODE))
            {
                posix.ACCMODE.RDONLY => windows.FILE_SHARE_READ,
                posix.ACCMODE.WRONLY =>windows.FILE_SHARE_WRITE | windows.FILE_SHARE_DELETE,
                posix.ACCMODE.RDWR =>windows.FILE_SHARE_READ | windows.FILE_SHARE_WRITE | windows.FILE_SHARE_DELETE,
            };
            const CreateOptions: u32 = switch(flags.DIRECTORY)
            {
                true => windows.FILE_DIRECTORY_FILE | windows.FILE_SYNCHRONOUS_IO_NONALERT | windows.FILE_OPEN_FOR_BACKUP_INTENT,
                false => windows.FILE_NON_DIRECTORY_FILE | windows.FILE_SYNCHRONOUS_IO_NONALERT | windows.FILE_OPEN_FOR_BACKUP_INTENT,
            };
            const rc = ntdll.NtCreateFile(
                &FileHandle,
                DesiredAccess,
                &ObjectAttributes,
                &IoStatusBlock,
                null,
                windows.FILE_ATTRIBUTE_NORMAL,
                ShareAccess,
                windows.FILE_OPEN,
                CreateOptions,
                null,
                0,
            );
            print("NtCreateFile: {d}\n", .{rc});
            return FileHandle;
        },
        else => @compileError("unsupported target")
    }
}
pub fn openat(dirfd: fd_t, path: [*:0]const u8, comptime flags: linux.O) fd_t
{
    switch (native_os)
    {
        .linux =>
        {
            return @intCast(linux.openat(dirfd, path, flags, mode));
        },
        .windows =>
        {
            var stack: [4096]u16 align(4096) = undefined;
            asciiToWide(path, @ptrCast(&stack));
            var length: u64 = 0;
            while(path[length] != 0)
                length+=1;
            length*=2;
            var FileHandle: windows.HANDLE = undefined;
            const DesiredAccess = comptime switch((flags.ACCMODE))
            {
                posix.ACCMODE.RDONLY => windows.GENERIC_READ,
                posix.ACCMODE.WRONLY =>windows.GENERIC_WRITE,
                posix.ACCMODE.RDWR =>windows.GENERIC_READ | windows.GENERIC_WRITE,
            };
//             const DesiredAccess = windows.STANDARD_RIGHTS_READ | windows.FILE_READ_ATTRIBUTES | windows.FILE_READ_EA | windows.SYNCHRONIZE | windows.FILE_TRAVERSE;
            var ObjectName = windows.UNICODE_STRING
            {
                .Length = @intCast(length),
                .MaximumLength = @intCast(length),
                .Buffer = &stack,
            };
            var ObjectAttributes =  windows.OBJECT_ATTRIBUTES
            {
                .Length = @sizeOf(windows.OBJECT_ATTRIBUTES),
                .RootDirectory = dirfd,
                .ObjectName = &ObjectName,
                .Attributes = 0,
                .SecurityDescriptor = null,
                .SecurityQualityOfService = null,
            };
            var IoStatusBlock: windows.IO_STATUS_BLOCK = undefined;
//             const ShareAccess = comptime switch((flags.ACCMODE))
//             {
//                 posix.ACCMODE.RDONLY => windows.FILE_SHARE_READ,
//                 posix.ACCMODE.WRONLY =>windows.FILE_SHARE_WRITE | windows.FILE_SHARE_DELETE,
//                 posix.ACCMODE.RDWR =>windows.FILE_SHARE_READ | windows.FILE_SHARE_WRITE | windows.FILE_SHARE_DELETE,
//             };
            const CreateOptions: u32 = switch(flags.DIRECTORY)
            {
                true => windows.FILE_DIRECTORY_FILE | windows.FILE_SYNCHRONOUS_IO_NONALERT | windows.FILE_OPEN_FOR_BACKUP_INTENT,
                false => windows.FILE_NON_DIRECTORY_FILE | windows.FILE_SYNCHRONOUS_IO_NONALERT | windows.FILE_OPEN_FOR_BACKUP_INTENT,
            };
            const rc = ntdll.NtCreateFile(
                &FileHandle,
                DesiredAccess,
                &ObjectAttributes,
                &IoStatusBlock,
                null,
                windows.FILE_ATTRIBUTE_NORMAL,
                windows.FILE_SHARE_READ,
                windows.FILE_OPEN,
                CreateOptions,
                null,
                0,
            );
            print("NtCreateFile: {d}\n", .{rc});
            return FileHandle;
        },
        else => @compileError("unsupported target")
    }
}
pub extern "ntdll" fn NtReadFile(
    FileHandle: windows.HANDLE,
    Event: ?*windows.HANDLE,
    ApcRoutine: ?*windows.IO_APC_ROUTINE,
    ApcContext: ?*anyopaque,
    IoStatusBlock: *windows.IO_STATUS_BLOCK,
    Buffer: *anyopaque,
    Length: windows.ULONG,
    ByteOffset: ?*windows.LARGE_INTEGER,
    Key: ?*windows.ULONG,
//     ObjectAttributes: *windows.OBJECT_ATTRIBUTES,
//     IoStatusBlock: *windows.IO_STATUS_BLOCK,
//     AllocationSize: ?*windows.LARGE_INTEGER,
//     FileAttributes: windows.ULONG,
//     ShareAccess: windows.ULONG,
//     CreateDisposition:windows. ULONG,
//     CreateOptions: windows.ULONG,
//     EaBuffer: ?*anyopaque,
//     EaLength: windows.ULONG,
) callconv(.winapi) windows.NTSTATUS;
pub fn read(fd: fd_t, buf: [*]u8, count: usize) usize_NTSTATUS
{
    switch (native_os)
    {
        .linux => return linux.read(fd, buf, count),
        .windows =>
        {
            var IoStatusBlock: windows.IO_STATUS_BLOCK = undefined;
//             var ByteOffset: windows.LARGE_INTEGER = 0;
            const rc = NtReadFile(fd, null, null, null, &IoStatusBlock, buf, @intCast(count), null, null);
            print("NtReadFile: {d}\n", .{rc});
            return rc;
        },
        else => @compileError("unsupported target")
    }
}