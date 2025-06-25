const std = @import("std");
const print = std.debug.print;
const exit = std.process.exit;

const CustomMem = @import("CustomMem.zig");
const readFromPtr = CustomMem.readFromPtr;
const allocInFixedBuffer = CustomMem.allocInFixedBuffer;
const allocInFixedBufferT = CustomMem.allocInFixedBufferT;

pub const Table = struct
{
    dataAfterHeaderPtr: [*]u8,
    header: [*][2]u32,
    tablesCount: u64,
	pub fn printDataOffsets(self: Table, fileBuffer: [*]u8, comptime spaceCount: u64) void
	{
		for(0..self.tablesCount) |i|
		{
			for(0..spaceCount) |_|
			{
				print(" ", .{});
			}
			print("{x:<4}{x}\n", .{self.header[i][0], @intFromPtr(self.dataAfterHeaderPtr) - @intFromPtr(fileBuffer) + self.header[i][1]});
		}
	}
};
pub const TableNear = struct
{
    dataPtr: [*]u8,
    dataAfterHeaderPtr: [*]u8,
    tablesCount: u64,
    pub fn printDataOffsets(self: TableNear, fileBuffer: [*]u8, comptime tabsCount: u64) void
    {
        for(0..self.tablesCount) |i|
        {
            for(0..tabsCount) |_|
            {
                print(" ", .{});
            }
            print("{x:<4}{x}\n", .{self.dataPtr[i*2], @intFromPtr(self.dataAfterHeaderPtr) - @intFromPtr(fileBuffer) + self.dataPtr[i*2+1]});
        }
    }
};
pub const Table_0x80 = struct
{
    dataAfterHeaderPtr: [*]u8,
    header: [*]align(1)[2]u32,
    tablesCount: u64,
    pub fn printDataOffsets(self: Table_0x80, fileBuffer: [*]u8, comptime tabsCount: u64) void
    {
        for(0..self.tablesCount) |i|
        {
            for(0..tabsCount) |t|
            {
                _ = t;
                print(" ", .{});
            }
            print("{x}\n", .{@intFromPtr(self.dataAfterHeaderPtr) - @intFromPtr(fileBuffer) + self.header[i][1]});
        }
    }
};
pub fn readTable(memoryBufferItr: *[*]u8, fileBufferPtrIteratorIn: [*]u8) Table
{
//     exit(0);
    var bufferPtrItr = fileBufferPtrIteratorIn;
    var table: Table = undefined;
    //     defer fileBufferPtrIteratorPtr.* = fileBufferPtrIterator;

    var nearBlocksCount: u64 = bufferPtrItr[0];
    bufferPtrItr+=1;
    var farBlocksCount: u64 = 0;
    var nearBlocksPtr: [*]u8 = undefined;
    var farBlocksPtr: [*]u8 = undefined;
    if(nearBlocksCount > 0x80)
    {
        farBlocksCount = readFromPtr(u32, bufferPtrItr);
        bufferPtrItr+=4;
        nearBlocksCount = nearBlocksCount & 127;
    }
    nearBlocksPtr = bufferPtrItr;
    bufferPtrItr+=(nearBlocksCount<<1);
    farBlocksPtr = bufferPtrItr;
    bufferPtrItr+=(farBlocksCount<<3);

    const blocksCount: u64 = nearBlocksCount+farBlocksCount;
    var header: [*][2]u32 = allocInFixedBufferT(memoryBufferItr, blocksCount*8, [2]u32);
    table.header = header;
    table.dataAfterHeaderPtr = bufferPtrItr;
    table.tablesCount = blocksCount;

    for(0..nearBlocksCount) |i|
    {
        header[i][0] = ((nearBlocksPtr+(i<<1)))[0];
        header[i][1] = ((nearBlocksPtr+(i<<1))+1)[0];
    }
    for(0..farBlocksCount) |i|
    {
        header[nearBlocksCount+i][0] = readFromPtr(u32, farBlocksPtr+(i<<3));
        header[nearBlocksCount+i][1] = readFromPtr(u32, farBlocksPtr+(i<<3)+4);
    }
    return table;
}
pub fn readTableNear(fileBufferPtrIteratorIn: [*]u8) TableNear
{
    var table: TableNear = undefined;

    table.tablesCount = fileBufferPtrIteratorIn[0];
    if(table.tablesCount >= 0x80)
    {
        print("it is a big table!\n", .{});
        exit(0);
    }
    table.dataPtr = fileBufferPtrIteratorIn+1;
    table.dataAfterHeaderPtr = table.dataPtr+(table.tablesCount<<1);

    return table;
}
pub fn read_0x80Table(fileBufferPtrIteratorIn: [*]u8) Table_0x80
{
    var bufferPtrItr = fileBufferPtrIteratorIn;
    if(bufferPtrItr[0] != 0x80)
    {
        print("!= 0x80!\n", .{});
        exit(0);
    }
    var table: Table_0x80 = undefined;
//     const nearBlocksCount: u64 = bufferPtrItr[0] & 127;
    const farBlocksCount: u64 = readFromPtr(u32, bufferPtrItr+1);
    bufferPtrItr+=5;
    table.header = @ptrCast(bufferPtrItr);
    table.tablesCount = farBlocksCount;
    table.dataAfterHeaderPtr = bufferPtrItr+farBlocksCount*8;
//     for(0..farBlocksCount) |i|
//     {
//         const buffer = @as(*align(1)u32, @ptrCast(bufferPtrItr+i*8)).*;
//         @as(*align(1)u32, @ptrCast(bufferPtrItr+i*8)).* = @as(*align(1)u32, @ptrCast(bufferPtrItr+i*8+4)).*;
//         @as(*align(1)u32, @ptrCast(bufferPtrItr+i*8+4)).* = buffer;
//     }
    return table;
}
