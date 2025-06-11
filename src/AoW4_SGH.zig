const std = @import("std");
const mem = std.mem;
const c = std.c;
const linux = std.os.linux;
const print = std.debug.print;
const exit = std.process.exit;

const lzma = @import("lzma.zig");

const customMem = @import("customMem.zig");

const Tables = @import("Tables.zig");
const readTable = Tables.readTable;
const readTableNear = Tables.readTableNear;

pub fn import(arenaAllocator: std.mem.Allocator, path: [*:0]const u8, ) void
{
    var file: std.fs.File = std.fs.cwd().openFileZ(path[0..], .{}) catch
    {
        print("save not found!\n", .{});exit(0);
    };
//     defer file.close();
    const stat = file.stat() catch unreachable;
    const fileSize: usize = stat.size;
    var fileBuffer = (arenaAllocator.alignedAlloc(u8, customMem.alingment, fileSize) catch unreachable).ptr;
    _ = file.read(fileBuffer[0..fileSize]) catch unreachable;
    file.close();
    var bufferPtrItr: [*]u8 = fileBuffer;

    const SGH_signature = [4]u8{0x53, 0x47, 0x48, 0};
    if(@as(*u32, @alignCast(@ptrCast(bufferPtrItr))).* != @as(u32, @bitCast(SGH_signature)))
    {
        print("incorrect SGH signature!", .{});
        exit(0);
    }
    bufferPtrItr = fileBuffer+@as(*u32, @ptrCast(fileBuffer+8)).*+32;
//     print("{x}\n", .{@intFromPtr(bufferPtrItr)-@intFromPtr(fileBuffer)});
    const compressedSize: u64 = @as(*align(1)u32, @ptrCast(bufferPtrItr)).*;
    const uncompressedSize: u64 = @as(*align(1)u32, @ptrCast(bufferPtrItr+4)).*;
//     const data: [*]u8 = (arenaAllocator.alignedAlloc(u8, customMem.alingment, uncompressedSize) catch unreachable).ptr;
    _ = linux.unlink("save");
    const mode: linux.mode_t = 0o755;
    const file_fd: i32 = @intCast(linux.open("save.lzma", .{.ACCMODE = .WRONLY, .CREAT = true, .TRUNC = true}, mode));
    _ = linux.write(file_fd, bufferPtrItr+12, 5);
    _ = linux.write(file_fd, @ptrCast(&uncompressedSize), 8);
    _ = linux.write(file_fd, bufferPtrItr+12+5, @intCast(compressedSize-8-5));
    _ = linux.close(file_fd);
    const pid = linux.fork();
    if (pid==0)
    {
        const argv: [*:null]const ?[*:0]const u8 = &.{"/bin/xz", "-k", "-d", "save.lzma", null};
        const envp: [*:null]const ?[*:0]const u8 = &.{null};
        _ = linux.execve("/bin/xz", argv, envp);
    }
    var status: u32 = undefined;
    _ = linux.waitpid(@intCast(pid), &status, 0);

    file = std.fs.cwd().openFileZ("save", .{}) catch unreachable;
    fileBuffer = (arenaAllocator.alignedAlloc(u8, customMem.alingment, uncompressedSize) catch unreachable).ptr;
    _ = file.read(fileBuffer[0..uncompressedSize]) catch unreachable;
    file.close();
    bufferPtrItr = fileBuffer;

//     const lzmaStream = lzma.lzma_stream
//     {
//         .next_in = bufferPtrItr+12,
//         .avail_in = compressedSize,
//         .total_in = compressedSize,
//         .next_out = data,
//         .avail_out = uncompressedSize,
//         .total_out = uncompressedSize,
//     };
//     lzma.lzma_alone_decoder(lzmaStream, uncompressedSize);
//     lzma.lzma_
//     lzma.lzma
//     print("result: {d}\n", .{result});

    // read save
	const baseTable = readTable(arenaAllocator, bufferPtrItr);
	{
		bufferPtrItr = baseTable.dataAfterHeaderPtr;
		baseTable.printDataOffsets(fileBuffer, 4);
		if(baseTable.header[3][0] != 0x0e)
		{
			print("header[3][0] != 0x0e!\n", .{});
			exit(0);
		}
		bufferPtrItr = baseTable.dataAfterHeaderPtr + baseTable.header[3][1];
		print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
		bufferPtrItr+=4;
		const unknownTable_1 = Tables.readTable(arenaAllocator, bufferPtrItr);
		{
			unknownTable_1.printDataOffsets(fileBuffer, 4);
			bufferPtrItr = unknownTable_1.dataAfterHeaderPtr;
			print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
			bufferPtrItr+=4;
			const unknownTable_2 = Tables.read_0x80Table(bufferPtrItr);
			{
				unknownTable_2.printDataOffsets(fileBuffer, 4);
				bufferPtrItr = unknownTable_2.dataAfterHeaderPtr;
				print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
				const unknownTable_3 = Tables.readTable(arenaAllocator, bufferPtrItr);
				{
					unknownTable_3.printDataOffsets(fileBuffer, 4);
					bufferPtrItr = unknownTable_3.dataAfterHeaderPtr + unknownTable_3.header[1][1];
					print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
					bufferPtrItr+=3;
					const unknownTable_4 = Tables.readTable(arenaAllocator, bufferPtrItr);
					{
						unknownTable_4.printDataOffsets(fileBuffer, 4);
						bufferPtrItr = unknownTable_4.dataAfterHeaderPtr;
						print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                        bufferPtrItr+=4;
                        const unknownTable_5 = Tables.read_0x80Table(bufferPtrItr);
                        {
                            unknownTable_5.printDataOffsets(fileBuffer, 4);
                            bufferPtrItr = unknownTable_5.dataAfterHeaderPtr;
                            print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                            const unknownTable_6 = Tables.readTable(arenaAllocator, bufferPtrItr);
                            {
//                                 print("tables count:{d}\n", .{unknownTable_6.tablesCount});
//                                 unknownTable_6.printDataOffsets(fileBuffer, 4);
                                bufferPtrItr = unknownTable_6.dataAfterHeaderPtr;
                                print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                                const width: u64 = @as(*align(1)u32, @ptrCast(bufferPtrItr)).*;
                                const height: u64 = @as(*align(1)u32, @ptrCast(bufferPtrItr+4)).*;
                                print("    width: {d}\n    height: {d}\n", .{width, height});
                                var hexChunkIndex: u64 = 0;
                                while(unknownTable_6.header[hexChunkIndex][0] != 0x64)
                                    hexChunkIndex+=1;
                                bufferPtrItr = unknownTable_6.dataAfterHeaderPtr + unknownTable_6.header[hexChunkIndex][1];
                                print("    {x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                            }
                        }
					}
                    // const unknownTable_4 = Tables.read_0x80Table(bufferPtrItr);
//                  {
//                      unknownTable_4.printDataOffsets(fileBuffer, 4);
//                      bufferPtrItr = unknownTable_4.dataAfterHeaderPtr;
//                      print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
//                      const unknownTable_5 = Tables.readTable(arenaAllocator, bufferPtrItr);
                        // {
                            // unknownTable_5.printDataOffsets(fileBuffer, 4);
                            // bufferPtrItr = unknownTable_5.dataAfterHeaderPtr;
                            // print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                            // bufferPtrItr+=3;
                            // const unknownTable_6 = Tables.readTable(arenaAllocator, bufferPtrItr);
                            // {
                                // unknownTable_6.printDataOffsets(fileBuffer, 4);
                                // bufferPtrItr = unknownTable_6.dataAfterHeaderPtr;
                                // print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                                // bufferPtrItr+=4;
                                // const unknownTable_7 = Tables.read_0x80Table(bufferPtrItr);
                                // {
                                    // unknownTable_7.printDataOffsets(fileBuffer, 4);
                                    // bufferPtrItr = unknownTable_7.dataAfterHeaderPtr;
                                    // print("{x}\n", .{@intFromPtr(bufferPtrItr) - @intFromPtr(fileBuffer)});
                                // }
                            // }
                        // }
                    // }
				}
			}
		}
	}
}
