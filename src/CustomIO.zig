const std = @import("std");
const builtin = @import("builtin");
const native_os = builtin.os.tag;

const CustomMem = @import("CustomMem.zig");
const CustomFS = @import("CustomFS.zig");

const fd_t = std.posix.fd_t;

pub var stdoutFD:fd_t = blk:
{
    if(native_os == .linux)
    {
        break :blk 1;
    }
    else
    {
        break :blk undefined;
    }
};
fn formatInt(stackBufferPtr: [*]u8, value: anytype, comptime base: u8) [*]u8
{
    var buf: [64]u8 = undefined;
    const value_info = @typeInfo(@TypeOf(value)).int;
    const abs_value = @abs(value);
    var a = abs_value;
    var index: u64 = 32;
    if (base == 10)
    {
        while (a >= 100) : (a = @divTrunc(a, 100))
        {
            index -= 2;
            buf[index..][0..2].* = digits2(@intCast(a % 100));
        }

        if (a < 10)
        {
            index -= 1;
            buf[index] = '0' + @as(u8, @intCast(a));
        } else
        {
            index -= 2;
            buf[index..][0..2].* = digits2(@intCast(a));
        }
    }
    if (value_info.signedness == .signed)
    {
        if (value < 0)
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
    CustomMem.memcpy(stackBufferPtr, @ptrCast(&buf[index]), 32-index);
    return stackBufferPtr+(32-index);
}
fn formatHex(stackBufferPtr: [*]u8, value: anytype) [*]u8
{
    const hex_charset: [16]u8 = "0123456789abcdef".*;
    const value_info = @typeInfo(@TypeOf(value)).int;
    if (value_info.signedness == .signed)
        @compileError("fmt: signed in x tuple");
    const byteTypeSize = @sizeOf(@TypeOf(value));
    const bitTypeSize:comptime_int = @intCast(byteTypeSize*8);
    var buf: [byteTypeSize * 2]u8 = undefined;

//     for(0..byteTypeSize) |i|
//     {
//         const byte: u8 = @as([byteTypeSize]u8, @bitCast(value))[byteTypeSize-1-i];
//         buf[i * 2 + 0] = hex_charset[byte >> 4];
//         buf[i * 2 + 1] = hex_charset[byte & 15];
//     }
//     var i: u64 = 0;
//     while (i < buf.len / 2) : (i += 1) {
//         const byte: u8 = @truncate(value >> @intCast(8 * i));
//         buf[i * 2 + 0] = hex_charset[byte >> 4];
//         buf[i * 2 + 1] = hex_charset[byte & 15];
//     }

    var stripBytes:u64 = bitTypeSize;
    for(0..byteTypeSize) |i|
    {
        stripBytes-=8;
        const byte:u8 = @truncate(value >> @intCast(stripBytes));
        buf[i * 2 + 0] = hex_charset[byte >> 4];
        buf[i * 2 + 1] = hex_charset[byte & 15];
    }
//     var shiftedValue: u64 = value;
//     var bufPtr: [*]u8 = CustomMem.ptrCast([*]u8, &buf)+buf.len-2;
//     for(0..byteTypeSize) |_|
//     {
//         const byte:u8 = @truncate(shiftedValue);
//         bufPtr[0] = hex_charset[byte >> 4];
//         bufPtr[1] = hex_charset[byte & 15];
//         shiftedValue = shiftedValue>>8;
//         bufPtr-=2;
//     }
    CustomMem.memcpy(stackBufferPtr, @ptrCast(&buf), buf.len);
    return stackBufferPtr+buf.len;
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
//         const arg = args[argIndex];
        switch(fmtType)
        {
            's' =>
            {
                CustomMem.memcpy(stackBufferPtr, @ptrCast(args[argIndex]), args[argIndex].len);
                stackBufferPtr+=args[argIndex].len;
                argIndex+=1;
            },
            'd' =>
            {
                stackBufferPtr = formatInt(stackBufferPtr, args[argIndex], 10);
                argIndex+=1;
            },
            'x' =>
            {
                stackBufferPtr = formatHex(stackBufferPtr, args[argIndex]);
                argIndex+=1;
            },
            'c' =>
            {
                stackBufferPtr[0] = args[argIndex];
                stackBufferPtr+=1;
            },
            '\n' =>
            {
                stackBufferPtr[0] = fmtType;
                stackBufferPtr+=1;
            },
            else =>
            {
                @compileError("fmt: unknown fmtType");
            }
        }
    }
    _ = CustomFS.write(stdoutFD, &stackBuffer, @intFromPtr(stackBufferPtr)-@intFromPtr(&stackBuffer));
}