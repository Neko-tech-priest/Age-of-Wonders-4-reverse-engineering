const std = @import("std");
const mem = std.mem;
const c = std.c;
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
        print(".RMG not found!\n", .{});exit(0);
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

    const _0x0C_offset_Table = readTable(arenaAllocator, fileBuffer+@as(*u32, @ptrCast(fileBuffer+0x0C)).*+36);
    {
        bufferPtrItr = _0x0C_offset_Table.dataAfterHeaderPtr;
        bufferPtrItr+=4;
        const unknownTable_1 = Tables.read_0x80Table(bufferPtrItr);
        {
            bufferPtrItr = unknownTable_1.dataAfterHeaderPtr;//0x3e4
            print("\n", .{});
            const unknownTable_2 = Tables.readTable(arenaAllocator, bufferPtrItr);
            {
                bufferPtrItr = unknownTable_2.dataAfterHeaderPtr + unknownTable_2.header[1][1] + 3;//0x7000
                print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                const unknownTable_3 = Tables.readTable(arenaAllocator, bufferPtrItr);
                {
                    bufferPtrItr = unknownTable_3.dataAfterHeaderPtr;
                    bufferPtrItr+=4;
                    const unknownTable_4 = Tables.read_0x80Table(bufferPtrItr);
                    {
                        bufferPtrItr = unknownTable_4.dataAfterHeaderPtr;
                        // very big table
                        const unknownTable_5 = Tables.readTable(arenaAllocator, bufferPtrItr);
                        {
                            bufferPtrItr = unknownTable_5.dataAfterHeaderPtr;//0x1425d
                            print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                            const width: u64 = @as(*align(1)u32, @ptrCast(bufferPtrItr)).*;
                            const height: u64 = @as(*align(1)u32, @ptrCast(bufferPtrItr+4)).*;
                            print("width: {d}\nheight: {d}\n", .{width, height});
// // //                             const unknown_float: u64 = @as(*align(1)f32, @ptrCast(bufferPtrItr+8)).*;
// //                             print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                            var hexChunkIndex: u64 = 0;
                            while(unknownTable_5.header[hexChunkIndex][0] != 0x64)
                                hexChunkIndex+=1;
                            const offset = width*1;
                            for(0+offset..width+offset) |hexIndex|//unknown_width*unknown_height
                            {
//                                 _ = i;
                                bufferPtrItr = unknownTable_5.dataAfterHeaderPtr + unknownTable_5.header[hexIndex+hexChunkIndex][1];
                                print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                                const hexTable_1 = Tables.read_0x80Table(bufferPtrItr);
                                {
                                    bufferPtrItr = hexTable_1.dataAfterHeaderPtr;
//                                     print("  {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
//                                     print("    value: {d}\n", .{@as(*align(1)u32, @ptrCast(bufferPtrItr+5)).*});
//                                     print("    value: {d}\n", .{@as(*align(1)u32, @ptrCast(bufferPtrItr+9)).*});
                                    bufferPtrItr = hexTable_1.dataAfterHeaderPtr + hexTable_1.header[1][1];
//                                     print("  {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                                    const hexTable_2 = Tables.readTableNear(bufferPtrItr);
                                    {
//                                         hexTable_2.printDataOffsets(fileBuffer, 4);
//                                         for(0..3) |i|
//                                         {
//                                             bufferPtrItr  = hexTable_2.dataAfterHeaderPtr + hexTable_2.dataPtr[i*2+1];
//                                             print("    value: {d} {d}\n", .{@as(*align(1)i32, @ptrCast(bufferPtrItr+3)).*, @as(*align(1)i32, @ptrCast(bufferPtrItr+7)).*});
//                                         }
                                        bufferPtrItr = hexTable_2.dataAfterHeaderPtr + hexTable_2.dataPtr[3*2+1];
                                        bufferPtrItr+=7;
                                        const hexTable_3 = Tables.read_0x80Table(bufferPtrItr);
                                        {
                                            bufferPtrItr = hexTable_3.dataAfterHeaderPtr;
//                                             print("      {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                                            const hexTable_4 = Tables.readTableNear(bufferPtrItr);
                                            {
//                                                 hexTable_4.printDataOffsets(fileBuffer, 8);
//                                                 print("  {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                                                print("\tvalue: {d} {d}\n", .{@as(*align(1)i16, @ptrCast(hexTable_4.dataAfterHeaderPtr)).*, @as(*align(1)i16, @ptrCast(hexTable_4.dataAfterHeaderPtr+2)).*});
                                                const hexTable_5 = Tables.readTableNear(hexTable_4.dataAfterHeaderPtr + hexTable_4.dataPtr[2+1]);
                                                {
                                                    bufferPtrItr = hexTable_5.dataAfterHeaderPtr+1;
//                                                     print("\t  value: {d}\n", .{@as(*align(1)u32, @ptrCast(bufferPtrItr)).*});
//                                                     print("\t  value: {d}\n", .{@as(*align(1)u32, @ptrCast(bufferPtrItr+4)).*});
                                                }
                                                bufferPtrItr = hexTable_4.dataAfterHeaderPtr + hexTable_4.dataPtr[2*2+1];
                                                print("    value: {d}\n", .{@as(*align(1)i32, @ptrCast(bufferPtrItr)).*});
                                                print("    value: {d}\n", .{@as(*align(1)i32, @ptrCast(bufferPtrItr+4)).*});
                                            }
                                        }
                                    }
                                    bufferPtrItr = hexTable_1.dataAfterHeaderPtr + hexTable_1.header[2][1];
//                                     print("  {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                                    print("    value: {d}\n", .{@as(*align(1)u32, @ptrCast(bufferPtrItr-4)).*});
                                }
                            }
                        }
//                         const unknownTable_5_2 = Tables.readTable(arenaAllocator, fileBuffer+0x76b4b);
                        {
//                             bufferPtrItr = unknownTable_5_2.dataAfterHeaderPtr;//0x1425d
//                             print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
//                             const width: u64 = @as(*align(1)u32, @ptrCast(bufferPtrItr)).*;
//                             const height: u64 = @as(*align(1)u32, @ptrCast(bufferPtrItr+4)).*;
//                             print("width: {d}\nheight: {d}\n", .{width, height});
//                             // //                             const unknown_float: u64 = @as(*align(1)f32, @ptrCast(bufferPtrItr+8)).*;
//                             //                             print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
//                             var hexChunkIndex: u64 = 0;
//                             while(unknownTable_5_2.header[hexChunkIndex][0] != 0x64)
//                                 hexChunkIndex+=1;
//                             //                             const ptr = unknownTable_5_2.dataAfterHeaderPtr + unknownTable_5_2.header[hexChunkIndex][1];
//                             for(0..width) |hexIndex|//unknown_width*unknown_height
//                             {
//                                 //                                 _ = i;
//                                 bufferPtrItr = unknownTable_5_2.dataAfterHeaderPtr + unknownTable_5_2.header[hexIndex+hexChunkIndex][1];
//                                 print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
//                                 //                                 if(!customMem.memcmp(ptr, bufferPtrItr, 38))
//                                 //                                 {
//                                 //                                     print("{d}\n", .{i});
//                                 //                         //             print("{x}\n", .{@intFromPtr(_0x7028Table.dataAfterHeaderPtr + _0x7028Table.header[i][1]) - @intFromPtr(fileBuffer)});
//                                 //                                     break;
//                                 //                                 }
//                                 //                                 print("    {d}\n", .{@as(*align(1)f32, @ptrCast(bufferPtrItr+38)).*});
//                                 const hexTable_1 = Tables.read_0x80Table(bufferPtrItr);
//                                 {
//                                     bufferPtrItr = hexTable_1.dataAfterHeaderPtr;
// //                                     hexTable_1.printDataOffsets(fileBuffer, 2);
// //                                     print("  {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
// // //                                     print("    value: {d}\n", .{@as(*align(1)u32, @ptrCast(bufferPtrItr+5)).*});
// // //                                     print("    value: {d}\n", .{@as(*align(1)u32, @ptrCast(bufferPtrItr+9)).*});
//                                     bufferPtrItr = hexTable_1.dataAfterHeaderPtr + hexTable_1.header[1][1];
// //                                                                         print("  {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
//                                     const hexTable_2 = Tables.readTableNear(bufferPtrItr);
//                                     {
// //                                                                                 hexTable_2.printDataOffsets(fileBuffer, 4);
// //                                         hexTable_2.printDataOffsets(fileBuffer, 4);
// //                                         print("\n", .{});
//                                         for(0..3) |i|
//                                         {
//                                             bufferPtrItr  = hexTable_2.dataAfterHeaderPtr + hexTable_2.dataPtr[i*2+1];
//                                             print("    value: {d} {d}\n", .{@as(*align(1)i32, @ptrCast(bufferPtrItr+3)).*, @as(*align(1)i32, @ptrCast(bufferPtrItr+7)).*});
//                                         }
//                                         bufferPtrItr  = hexTable_2.dataAfterHeaderPtr + hexTable_2.dataPtr[3*2+1];
//                                         if(bufferPtrItr[0] != 0)
//                                         {
//                                             print("!= 0!\n{x}", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
//                                             exit(0);
//                                         }
// //                                         bufferPtrItr = hexTable_2.dataAfterHeaderPtr + hexTable_2.dataPtr[3*2+1];
// //                                         bufferPtrItr+=7;
// //                                         print("      {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
// //                                         const hexTable_3 = Tables.read_0x80Table(bufferPtrItr);
// //                                         {
// //                                             bufferPtrItr = hexTable_3.dataAfterHeaderPtr;
// //                                             //                                             print("      {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
// //                                             const hexTable_4 = Tables.readTableNear(bufferPtrItr);
// //                                             {
// //                                                 //                                                 hexTable_4.printDataOffsets(fileBuffer, 8);
// //                                                 //                                                 print("  {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
// //                                                 print("\tvalue: {d} {d}\n", .{@as(*align(1)i16, @ptrCast(hexTable_4.dataAfterHeaderPtr)).*, @as(*align(1)i16, @ptrCast(hexTable_4.dataAfterHeaderPtr+2)).*});
// //                                                 const hexTable_5 = Tables.readTableNear(hexTable_4.dataAfterHeaderPtr + hexTable_4.dataPtr[2+1]);
// //                                                 {
// //                                                     bufferPtrItr = hexTable_5.dataAfterHeaderPtr+1;
// // //                                                                                                         print("\t  value: {d}\n", .{@as(*align(1)u32, @ptrCast(bufferPtrItr)).*});
// // //                                                                                                         print("\t  value: {d}\n", .{@as(*align(1)u32, @ptrCast(bufferPtrItr+4)).*});
// //                                                 }
// //                                                 bufferPtrItr = hexTable_4.dataAfterHeaderPtr + hexTable_4.dataPtr[2*2+1];
// //                                                 print("    value: {d}\n", .{@as(*align(1)i32, @ptrCast(bufferPtrItr)).*});
// //                                                 print("    value: {d}\n", .{@as(*align(1)i32, @ptrCast(bufferPtrItr+4)).*});
// //                                             }
// //                                         }
//                                     }
//                                     bufferPtrItr = hexTable_1.dataAfterHeaderPtr + hexTable_1.header[2][1];
// //                                     print("  {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
//                                 }
// //                                 break;
//                             }
                        }
                    }
                }
            }
        }
    }

}
