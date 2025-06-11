const std = @import("std");
const mem = std.mem;
const c = std.c;
const linux = std.os.linux;
const print = std.debug.print;
const exit = std.process.exit;

const customMem = @import("customMem.zig");

const Tables = @import("Tables.zig");
const readTable = Tables.readTable;
const readTableNear = Tables.readTableNear;

pub fn import(arenaAllocator: std.mem.Allocator, path: [*:0]const u8, ) void
{
    const file: std.fs.File = std.fs.cwd().openFileZ(@ptrCast(path), .{}) catch
    {
        print(".model not found!\n", .{});exit(0);
    };
    defer file.close();
    const stat = file.stat() catch unreachable;
    const fileSize: usize = stat.size;
    const fileBuffer = (arenaAllocator.alignedAlloc(u8, customMem.alingment, fileSize) catch unreachable).ptr;
    _ = file.read(fileBuffer[0..fileSize]) catch unreachable;
    var bufferPtrItr: [*]u8 = fileBuffer;

    const RMG_signature = [4]u8{0x47, 0x4d, 0x50, 0};
    if(@as(*u32, @alignCast(@ptrCast(bufferPtrItr))).* != @as(u32, @bitCast(RMG_signature)))
    {
        print("incorrect RMG signature!", .{});
        exit(0);
    }
    bufferPtrItr = fileBuffer+0x2b;
    const _0x2b_Table = readTable(arenaAllocator, bufferPtrItr);
    {
        bufferPtrItr = _0x2b_Table.dataAfterHeaderPtr;
        bufferPtrItr += _0x2b_Table.header[2][1];
        const PNG_size: usize = @as(*align(1)u32, @ptrCast(bufferPtrItr)).*;
        print("PNG_size: {d}\n", .{PNG_size});
        bufferPtrItr = _0x2b_Table.dataAfterHeaderPtr + _0x2b_Table.header[3][1];
//         print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
//         const mode: linux.mode_t = 0o755;
//         const texture_fd: i32 = @intCast(linux.open("image.png", .{.ACCMODE = .WRONLY, .CREAT = true, .TRUNC = true}, mode));
//         defer _ = linux.close(texture_fd);
//         _ = linux.write(texture_fd, bufferPtrItr+4, @intCast(PNG_size));
    }
    const _0x0C_offset_Table = readTable(arenaAllocator, fileBuffer+@as(*u32, @ptrCast(fileBuffer+0x0C)).*+36);
    {
        bufferPtrItr = _0x0C_offset_Table.dataAfterHeaderPtr;
        print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
        const unknownTable_1 = Tables.readTable(arenaAllocator, bufferPtrItr);
        {
            bufferPtrItr = unknownTable_1.dataAfterHeaderPtr;
            print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
        }
//         for(0.._0x0C_offset_Table.tablesCount) |tableIndex|
//         {
//             bufferPtrItr = _0x0C_offset_Table.dataAfterHeaderPtr + _0x0C_offset_Table.header[tableIndex][1];
//             print("    {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
//         }
//         bufferPtrItr = _0x0C_offset_Table.dataAfterHeaderPtr + _0x0C_offset_Table.header[15][1];
//         print("type: {x}\n", .{_0x0C_offset_Table.header[15][0]});
//         print("offset: {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
//         print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
//         bufferPtrItr += _0x0C_offset_Table.header[10][1];
//         print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
//         print("    {d}\n", .{@as(*align(1)f32, @ptrCast(bufferPtrItr+0)).*});
//         print("    {d}\n", .{@as(*align(1)f32, @ptrCast(bufferPtrItr+4)).*});
//         print("    {d}\n", .{@as(*align(1)f32, @ptrCast(bufferPtrItr+8)).*});
//         bufferPtrItr = _0x0C_offset_Table.dataAfterHeaderPtr + _0x0C_offset_Table.header[11][1];
//         print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
//         print("    {d}\n", .{@as(*align(1)f32, @ptrCast(bufferPtrItr+0)).*});
//         print("    {d}\n", .{@as(*align(1)f32, @ptrCast(bufferPtrItr+4)).*});
//         print("    {d}\n", .{@as(*align(1)f32, @ptrCast(bufferPtrItr+8)).*});
//         bufferPtrItr = _0x0C_offset_Table.dataAfterHeaderPtr + _0x0C_offset_Table.header[12][1];
//         print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
//         bufferPtrItr = _0x0C_offset_Table.dataAfterHeaderPtr + _0x0C_offset_Table.header[13][1];
//         print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
    }
}
