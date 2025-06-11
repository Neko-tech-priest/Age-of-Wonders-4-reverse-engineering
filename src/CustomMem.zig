const std = @import("std");

// const page_size_min = std.heap.page_size_min;
pub const pageAlignment = std.mem.Alignment.fromByteUnits(std.heap.page_size_min);
pub fn allocInFixedBuffer(bufferPtr: *[*]u8, size: u64, comptime alignment: u64) [*]u8
{
    const ptrAsValue: u64 = @intFromPtr(bufferPtr.*);
    const retPtr = @as([*]u8, @ptrFromInt(ptrAsValue + ((alignment - ptrAsValue % alignment) % alignment)));
    bufferPtr.* = retPtr + size;
    return retPtr;
}
pub fn allocInFixedBufferT(bufferPtr: *[*]u8, size: u64, comptime T: type) [*]T
{
    const alignment: u64 = @sizeOf(T);
    const ptrAsValue: u64 = @intFromPtr(bufferPtr.*);
    const retPtr = @as([*]T, @ptrFromInt(ptrAsValue + ((alignment - ptrAsValue % alignment) % alignment)));
    bufferPtr.* = @as([*]u8, @ptrCast(retPtr)) + size;
    return retPtr;
}
// pub inline fn align1PtrCast(comptime T: type, ptr: [*]u8) T
// {
//     return @ptrCast(ptr);
// }
pub inline fn alignPtrCast(comptime T: type, ptr: anytype) T
{
    return @alignCast(@ptrCast(ptr));
}
pub inline fn ptrCast(comptime T: type, ptr: anytype) T
{
    return @ptrCast(ptr);
}
pub inline fn ptrOnValue(comptime T: type, ptr: anytype) *align(1)T
{
    return @ptrCast(ptr);
}
pub inline fn readFromPtr(comptime T: type, ptr: anytype) T
{
    return @as(*align(1)T, @ptrCast(ptr)).*;
}
pub inline fn u64Tof32(value: u64) f32
{
    return @floatFromInt(@as(i32, @intCast(value)));
}
pub inline fn i32Tof32(value: i32) f32
{
    return @floatFromInt(value);
}
pub const SIMDalignment = std.simd.suggestVectorLength(u8) orelse 8;
pub const SIMDalignment64 = std.simd.suggestVectorLength(u64) orelse 1;
// comptime {
//     @export(memcpyExport, .{ .name = "memcpy", .linkage = .strong });
// }
// pub fn memcpyExport(noalias dst: [*]u8, noalias src: [*]const u8, sizeIn: u64)callconv(.C) void
// {
//     //     @setRuntimeSafety(false);
//     var offset: u64 = 0;
//     while(offset < sizeIn) : (offset+=SIMDalignment)
//     {
//         @as(*align(1) @Vector(SIMDalignment64, u64), @ptrCast(@alignCast(dst+offset))).* = @as(*align(1) @Vector(SIMDalignment64, u64), @ptrCast(@constCast((src+offset)))).*;
//     }
// }
pub inline fn memcpyInline(noalias dst: [*]u8, noalias src: [*]const u8, comptime sizeIn: u64) void
{
    //     @setRuntimeSafety(false);
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
        @as(*align(1) @Vector(SIMDalignment64, u64), @ptrCast(@alignCast(dst+offset))).* = @as(*align(1) @Vector(SIMDalignment64, u64), @ptrCast(@constCast((src+offset)))).*;
    }
}
// pub fn memcpyNoalign(noalias dst: [*]u8, noalias src: [*]const u8, sizeIn: u64) void
// {
//     //     @setRuntimeSafety(false);
//     var offset: u64 = 0;
//     while(offset < sizeIn) : (offset+=SIMDalignment)
//     {
//         @as(*align(1) @Vector(SIMDalignment64, u64), @ptrCast(@alignCast(dst+offset))).* = @as(*align(1) @Vector(SIMDalignment64, u64), @ptrCast(@constCast((src+offset)))).*;
//     }
// }
// pub fn memcpyAlign(noalias dst: [*]u8, noalias src: [*]u8, sizeIn: u64) void
// {
//     @setRuntimeSafety(false);
//     const u64Count: u64 = SIMDalignment>>3;
//     var offset: u64 = 0;
//     while(offset < sizeIn) : (offset+=SIMDalignment)
//     {
//         @as(*@Vector(u64Count, u64), @ptrCast(@alignCast(dst+offset))).* = @as(*@Vector(u64Count, u64), @ptrCast(@alignCast(src+offset))).*;
//     }
// }
pub inline fn memcpyDstAlign(noalias dst: [*]u8, noalias src: [*]const u8, sizeIn: u64) void
{
//     @setRuntimeSafety(false);
    const vectorSize_u8: u64 = SIMDalignment;
    const vectorSize_u64: u64 = SIMDalignment>>3;
    var offset: u64 = 0;
    while(offset < sizeIn) : (offset+=vectorSize_u8)
    {
        @as(*@Vector(vectorSize_u64, u64), @ptrCast(@alignCast(dst+offset))).* = @as(*align(1) @Vector(vectorSize_u64, u64), @ptrCast(@constCast((src+offset)))).*;
    }
}
pub inline fn memcmp(noalias src1: [*]const u8, noalias src2: [*]const u8, sizeIn: u64) bool
{
    var offset: u64 = 0;
    while(offset < sizeIn) : (offset+=1)
    {
        if(src1[offset] != src2[offset])
            return false;
    }
    return true;
}
// pub inline fn memZeroComptime(buffer: [*]u8, comptime sizeIn: u64) void
// {
//     const size = sizeIn - (sizeIn % SIMDalignment);
//     var offset: u64 = 0;
//     while(offset < size) : (offset+=SIMDalignment)
//     {
//         @as(*@Vector(SIMDalignment64, u64), @ptrCast(@alignCast(buffer+offset))).* = 0;
//     }
// }
