const std = @import("std");
const linux = std.os.linux;
const print = std.debug.print;

pub inline fn ptrOnValue(comptime T: type, ptr: anytype) *align(1)T
{
    return @ptrCast(ptr);
}
pub const SIMDalignment = std.simd.suggestVectorLength(u8) orelse 8;
pub const SIMDalignment64 = std.simd.suggestVectorLength(u64) orelse 1;
pub inline fn memcpyInline(noalias dst: [*]u8, noalias src: [*]const u8, comptime sizeIn: u64) void
{
    //     @setRuntimeSafety(false);
    comptime var offset: u64 = 0;
    inline while(offset < sizeIn) : (offset+=SIMDalignment)
    {
        @as(*align(1) @Vector(SIMDalignment64, u64), @ptrCast(@alignCast(dst+offset))).* = @as(*align(1) @Vector(SIMDalignment64, u64), @ptrCast(@constCast((src+offset)))).*;
    }
}
fn configRebuild(binaryName: [*:0]u8) void
{
    var srcName: [32]u8 = undefined;
    var dstName: [32]u8 = undefined;
    const srcNamePtr: [*:0]const u8 = @ptrCast(&srcName);
    const dstNamePtr: [*:0]const u8 = @ptrCast(&dstName);
    const zigExt = [4]u8{'.', 'z', 'i', 'g'};
    const newExt = [4]u8{'-', 'n', 'e', 'w'};
    var srcInfo: std.posix.Stat = undefined;
    var dstInfo: std.posix.Stat = undefined;

    memcpyInline(&srcName, binaryName+2, 32);
    var ptr: [*]u8 = @ptrCast(&srcName);
    while(ptr[0] != 0)
        ptr+=1;
    ptrOnValue(u32, ptr).* = @bitCast(zigExt);
    ptr[4] = 0;
    _ = linux.stat(srcNamePtr, &srcInfo);
    _ = linux.stat(binaryName, &dstInfo);
    if(srcInfo.mtim.sec < dstInfo.mtim.sec)
        return;
    memcpyInline(&dstName, &srcName, 32);
    const index: u64 = @intFromPtr(ptr)-@intFromPtr(srcNamePtr);
    ptrOnValue(u32, &dstName[index]).* = @bitCast(newExt);
    print("rebuild buildconfig...\n", .{});
    const pid: i32 = @intCast(linux.fork());
    if(pid == 0)
    {
        const zig = "/bin/zig";
        const execveCompileFlags: [*:null]const ?[*:0]const u8 = &.{zig, "build-exe", srcNamePtr, "--name", dstNamePtr, "--global-cache-dir","/tmp/.zig-cache-buildsystem","-OReleaseSmall","-fstrip",null};
        _ = linux.execve(zig, execveCompileFlags, @ptrCast(std.os.environ));
    }
    var status: u32 = undefined;
    _ = linux.waitpid(-1, &status, 0);
//     _ = linux.unlink(binaryName);
    _ = linux.rename(dstNamePtr, binaryName);
    const relaunchCommand: [*:null]const ?[*:0]const u8 = &.{binaryName, null};
    _ = linux.execve(binaryName, relaunchCommand, @ptrCast(std.os.environ));
}
pub fn main() void
{
    var timespec1: linux.timespec = undefined;
    _ = linux.clock_gettime(linux.CLOCK.REALTIME, &timespec1);
    configRebuild(std.os.argv[0]);
    print("build project...\n", .{});
    const mode: linux.mode_t = 0o655;
    const src_fd: i32 = @intCast(linux.open("src", .{.ACCMODE = .RDONLY}, mode));
    _ = linux.unlink("src/Vulkan.zig");
    _ = linux.symlinkat("Vulkan_Linux.zig", src_fd, "Vulkan.zig");
    _ = linux.close(src_fd);
    const pid: i32 = @intCast(linux.fork());
    if(pid == 0)
    {
        const zig = "/bin/zig";
        const execveCompileFlags: [*:null]const ?[*:0]const u8 = &.{zig, "build-exe", "src/ArchiveConverter.zig","--global-cache-dir","/tmp/.zig-cache x86_64_v3","--cache-dir",".zig-cache-debug","-target","x86_64-linux-gnu","-mcpu=x86_64_v3","-L","/usr/lib","-search_dylibs_only","-fno-llvm","-fstrip","-lc","-llz4",null};
        _ = linux.execve(zig, execveCompileFlags, @ptrCast(std.os.environ));
    }
    var status: u32 = undefined;
    _ = linux.waitpid(-1, &status, 0);
    var timespec2: linux.timespec = undefined;
    _ = linux.clock_gettime(linux.CLOCK.REALTIME, &timespec2);
    const time: isize = (timespec2.sec-timespec1.sec)*1000 + (@as(i64, @intCast(@as(u64, @intCast(timespec2.nsec))/1000000)) - @as(i64, @intCast(@as(u64, @intCast(timespec1.nsec))/1000000)));
    print("time: {d} ms\n", .{time});
    const binaryName = "ArchiveConverter";
    const launchExeCommand: [*:null]const ?[*:0]const u8 = &.{binaryName, null};
    _ = linux.execve(binaryName, launchExeCommand, @ptrCast(std.os.environ));
}
