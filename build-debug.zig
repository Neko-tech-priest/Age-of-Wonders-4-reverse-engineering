const std = @import("std");
const linux = std.os.linux;

pub inline fn ptrOnValue(comptime T: type, ptr: anytype) *align(1)T
{
    return @ptrCast(ptr);
}
pub const SIMDalignment = std.simd.suggestVectorLength(u8) orelse 8;
pub const SIMDalignment64 = std.simd.suggestVectorLength(u64) orelse 1;
pub inline fn memcpyInline(noalias dst: [*]u8, noalias src: [*]const u8, comptime sizeIn: u64) void
{
    comptime var offset: u64 = 0;
    inline while(offset < sizeIn) : (offset+=SIMDalignment)
    {
        @as(*align(1) @Vector(SIMDalignment64, u64), @ptrCast(@alignCast(dst+offset))).* = @as(*align(1) @Vector(SIMDalignment64, u64), @ptrCast(@constCast((src+offset)))).*;
    }
}
pub inline fn memcpy(noalias dst: [*]u8, noalias src: [*]const u8, sizeIn: u64) void
{
    @setRuntimeSafety(false);
    var offset: u64 = 0;
    while(offset < sizeIn) : (offset+=SIMDalignment)
    {
        @as(*align(1) @Vector(SIMDalignment64, u64), @ptrCast(@alignCast(dst+offset))).* = @as(*const align(1) @Vector(SIMDalignment64, u64), @ptrCast((src+offset))).*;
    }
}
fn digits2(value: u8) [2]u8
{
    return .{ @intCast('0' + value / 10), @intCast('0' + value % 10) };
}
pub fn print(comptime fmt: []const u8, args: anytype) void
{
    var stackBuffer: [4096]u8 = undefined;
    var stackBufferPtr: [*]u8 = &stackBuffer;
    const ArgsType = @TypeOf(args);
    const args_type_info = @typeInfo(ArgsType);
    if (args_type_info != .@"struct")
    {
        @compileError("expected tuple or struct argument, found " ++ @typeName(ArgsType));
    }
    //     const argsStrings = std.meta.fieldNames(ArgsType);
    //     const argFields = std.meta.fields(ArgsType);
    //     const fields_info = args_type_info.@"struct".fields;
    comptime var argIndex = 0;
    inline for(fmt) |fmtType|
    {
        switch(fmtType)
        {
            's' =>
            {
                memcpy(stackBufferPtr, @ptrCast(args[argIndex]), args[argIndex].len);
                stackBufferPtr+=args[argIndex].len;
                argIndex+=1;
            },
            'd' =>
            {
                var buf: [64]u8 = undefined;
                const value_info = @typeInfo(@TypeOf(args[argIndex])).int;
                const abs_value = @abs(args[argIndex]);
                var a = abs_value;
                var index: u64 = 32;
                while (a >= 100) : (a = @divTrunc(a, 100)) {
                    index -= 2;
                    buf[index..32][0..2].* = digits2(@intCast(a % 100));
                }

                if (a < 10) {
                    index -= 1;
                    buf[index] = '0' + @as(u8, @intCast(a));
                } else {
                    index -= 2;
                    buf[index..32][0..2].* = digits2(@intCast(a));
                }
                if (value_info.signedness == .signed)
                {
                    if (args[argIndex] < 0)
                    {
                        // Negative integer
                        index -= 1;
                        buf[index] = '-';
                    }
                    //                     else
                    //                     {
                    //                         // Positive integer
                    //                         index -= 1;
                    //                         buf[index] = '+';
                    //                     }
                }
                memcpy(stackBufferPtr, @ptrCast(&buf[index]), 32-index);
                stackBufferPtr+=(32-index);
                argIndex+=1;
            },
            '\n' =>
            {
                stackBufferPtr[0] = '\n';
                stackBufferPtr+=1;
            },
            ' ' =>
            {
                stackBufferPtr[0] = ' ';
                stackBufferPtr+=1;
            },
            else =>
            {
                @compileError("fmt: unknown fmtType");
            }
        }
    }
    _ = linux.write(1, &stackBuffer, @intFromPtr(stackBufferPtr)-@intFromPtr(&stackBuffer));
}
fn configRebuild(binaryName: [*:0]u8) void
{
    var srcName: [32]u8 = undefined;
    const srcNamePtr: [*:0]const u8 = @ptrCast(&srcName);
    const zigExt = [4]u8{'.', 'z', 'i', 'g'};
    var srcInfo: linux.Stat = undefined;
    var dstInfo: linux.Stat = undefined;

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
    const string = "rebuild buildconfig...\n";
    _ = linux.write(1, string, string.len);
//     _ = linux.unlink(binaryName);
    const pid: i32 = @intCast(linux.fork());
    if(pid == 0)
    {
        const zig = "/bin/zig";
        const execveCompileFlags: [*:null]const ?[*:0]const u8 = &.{zig, "build-exe",srcNamePtr,"--global-cache-dir","/tmp/.zig-cache-buildsystem","--cache-dir",".zig-cache-buildsystem","-OReleaseSmall","-fstrip",null};
        _ = linux.execve(zig, execveCompileFlags, @ptrCast(std.os.environ));
    }
    var status: u32 = undefined;
    _ = linux.waitpid(-1, &status, 0);
    const relaunchCommand: [*:null]const ?[*:0]const u8 = &.{binaryName, null};
    _ = linux.execve(binaryName, relaunchCommand, @ptrCast(std.os.environ));
}
pub fn main() void
{
    var timespec1: linux.timespec = undefined;
    _ = linux.clock_gettime(linux.CLOCK.REALTIME, &timespec1);
    configRebuild(std.os.argv[0]);
    const string = "build project...\n";
    _ = linux.write(1, string, string.len);
    const mode: linux.mode_t = 0o655;
    const targetName = "main";
    const src_fd: i32 = @intCast(linux.open("src", .{.ACCMODE = .RDONLY}, mode));
    _ = linux.unlink(targetName);
    _ = linux.unlink("src/Vulkan.zig");
    _ = linux.symlinkat("Vulkan_Linux.zig", src_fd, "Vulkan.zig");
    _ = linux.close(src_fd);
    const pid: i32 = @intCast(linux.fork());
    if(pid == 0)
    {
        const zig = "/bin/zig";
        const execveCompileFlags: [*:null]const ?[*:0]const u8 = &.{zig, "build-exe", "src/main.zig","--global-cache-dir","/tmp/.zig-cache-debug","--cache-dir","/tmp/.Age of Wonders 4","-L","/usr/lib","-search_dylibs_only","-fno-llvm","-fno-ubsan-rt","-fno-llvm","-fstrip","-lc","-lSDL3",null};
        _ = linux.execve(zig, execveCompileFlags, @ptrCast(std.os.environ));
    }
    var status: u32 = undefined;
    _ = linux.waitpid(-1, &status, 0);
    var timespec2: linux.timespec = undefined;
    _ = linux.clock_gettime(linux.CLOCK.REALTIME, &timespec2);
    const time: isize = (timespec2.sec-timespec1.sec)*1000 + (@as(i64, @intCast(@as(u64, @intCast(timespec2.nsec))/1000000)) - @as(i64, @intCast(@as(u64, @intCast(timespec1.nsec))/1000000)));
    print("sds\n", .{"time: ",time,"ms"});
    const launchExeCommand: [*:null]const ?[*:0]const u8 = &.{targetName, null};
    _ = linux.execve(targetName, launchExeCommand, @ptrCast(std.os.environ));
}