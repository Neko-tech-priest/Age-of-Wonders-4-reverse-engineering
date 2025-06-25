const std = @import("std");
const mem = std.mem;
const linux = std.os.linux;
const print = std.debug.print;
const exit = std.process.exit;

const VulkanInclude = @import("VulkanInclude.zig");

const GlobalState = @import("GlobalState.zig");
const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;

const CustomMem = @import("CustomMem.zig");
const ptrCast = CustomMem.ptrCast;
const PageAllocator = @import("PageAllocator.zig");
const memcpy = CustomMem.memcpy;
const allocInFixedBufferT = CustomMem.allocInFixedBufferT;
const readFromPtr = CustomMem.readFromPtr;

const Image = @import("Image.zig");
const VkImage = @import("VkImage.zig");

const Tables = @import("Tables.zig");
const readTable = Tables.readTable;
const readTableNear = Tables.readTableNear;
const Table = Tables.Table;

const Hex = @import("Hex.zig");

// const AoW3_clb = @import("AoW3_clb.zig");

pub const Archive = struct
{
	const Texture = struct
	{
		name: [*]u8,
		nameLen: u8,
		image: Image.Image,
	};
	name: [*]const u8,
	nameLen: u8,
	textures: [*]Texture,
	texturesCount: u16,
};
pub const ArchiveGPU = struct
{
	pub const Texture = struct
	{
		vkImage: VulkanInclude.VkImage,
		vkImageView: VulkanInclude.VkImageView,
		pub fn unload(self: Texture) void
		{
			VulkanInclude.vkDestroyImage(VulkanGlobalState._device, self.vkImage, null);
			VulkanInclude.vkDestroyImageView(VulkanGlobalState._device, self.vkImageView, null);
		}
	};
	textures: [*]Image.Texture,
	texturesCount: u16,
	texturesVkDeviceMemory: VulkanInclude.VkDeviceMemory,
	descriptorSetLayout: VulkanInclude.VkDescriptorSetLayout,
	descriptorPool: VulkanInclude.VkDescriptorPool,
	descriptorSet: VulkanInclude.VkDescriptorSet,
	pub fn unload(self: ArchiveGPU) void
	{
		for(0..self.texturesCount) |i|
			self.textures[i].unload();
		VulkanInclude.vkFreeMemory(VulkanGlobalState._device, self.texturesVkDeviceMemory, null);
		VulkanInclude.vkDestroyDescriptorSetLayout(VulkanGlobalState._device, self.descriptorSetLayout, null);
		VulkanInclude.vkDestroyDescriptorPool(VulkanGlobalState._device, self.descriptorPool, null);
	}
};
fn readChunk_Effect(stackBufferItr: *[*]u8, fileBuffer: [*]u8, bufferPtrItrIn: [*]u8, dirfd: i32) void
{
    var stack: [256]u8 = undefined;
//     _ = dirfd;
    // _ = memoryBufferItr;
    print("{x}\n", .{@intFromPtr(bufferPtrItrIn)-@intFromPtr(fileBuffer)});
    var bufferPtrItr: [*]u8 = undefined;
    const blockTable = readTable(stackBufferItr, bufferPtrItrIn);
    {
        // blockTable.printDataOffsets(fileBuffer, 4);
        bufferPtrItr = blockTable.dataAfterHeaderPtr;
        const libraryNameLen: u64 = bufferPtrItr[0];
        bufferPtrItr+=4;
        print("{s}\n", .{bufferPtrItr[0..libraryNameLen]});
        bufferPtrItr+=libraryNameLen;
        const nameLen: u64 = bufferPtrItr[0];
        bufferPtrItr+=4;
        print("{s}\n", .{bufferPtrItr[0..nameLen]});
//         bufferPtrItr[nameLen] = 0;
        CustomMem.memcpyInline(&stack, bufferPtrItr, 32);
        const ext = "frag";
        stack[nameLen] = '.';
        CustomMem.ptrOnValue(u32, ptrCast([*]u8, &stack)+nameLen+1).* = readFromPtr(u32, @constCast(ext));
        stack[nameLen+5] = 0;
        const mode: linux.mode_t = 0o755;
        const filefd: i32 = @intCast(linux.openat(dirfd, ptrCast([*:0]u8, &stack), .{.ACCMODE = .WRONLY, .CREAT = true, .TRUNC = true}, mode));
        defer _ = linux.close(filefd);
        bufferPtrItr+=nameLen;
        if(readFromPtr(u16, bufferPtrItr) != 257)
        {
            print("!= 0x0101\n", .{});
            exit(0);
        }
        bufferPtrItr+=3;
        const table_1 = readTable(stackBufferItr, bufferPtrItr);
        {
            table_1.printDataOffsets(fileBuffer, 4);
            bufferPtrItr = table_1.dataAfterHeaderPtr;
            print("{x}\n", .{@intFromPtr(bufferPtrItr)-@intFromPtr(fileBuffer)});
            bufferPtrItr+=4;
            const table_2 = readTable(stackBufferItr, bufferPtrItr);
            {
                table_2.printDataOffsets(fileBuffer, 4);
                bufferPtrItr = table_2.dataAfterHeaderPtr;
                print("{x}\n", .{@intFromPtr(bufferPtrItr)-@intFromPtr(fileBuffer)});
                if(readFromPtr(u16, bufferPtrItr) != 257)
                {
                    print("!= 0x0101\n", .{});
                    exit(0);
                }
                bufferPtrItr+=3+7;
                const table_3 = readTable(stackBufferItr, bufferPtrItr);
                {
                    table_3.printDataOffsets(fileBuffer, 4);
                    bufferPtrItr = table_3.dataAfterHeaderPtr;
                    print("{x}\n", .{@intFromPtr(bufferPtrItr)-@intFromPtr(fileBuffer)});
                    bufferPtrItr+=4;
                    const table_4 = readTable(stackBufferItr, bufferPtrItr);
                    {
                        table_4.printDataOffsets(fileBuffer, 4);
//                         bufferPtrItr = table_4.dataAfterHeaderPtr;
                        var i: u64 = 0;
                        while(table_4.header[i][0] != 0x82){i+=1;}
                        bufferPtrItr = table_4.dataAfterHeaderPtr + table_4.header[i][1];
                        //              print("{x}\n", .{@intFromPtr(bufferPtrItr)-@intFromPtr(fileBuffer)});
                        const glslShaderSize: u64 = readFromPtr(u32, bufferPtrItr);
                        bufferPtrItr+=4;
                        _ = linux.write(filefd, bufferPtrItr, glslShaderSize);
                        bufferPtrItr+=glslShaderSize;
                        if(readFromPtr(u32, bufferPtrItr) != glslShaderSize)
                        {
                            print("!= glslShaderSize!\n", .{});
                            exit(0);
                        }
                    }
                }
//                 var i: u64 = 0;
//                 while(table_2.header[i][0] != 0x82){i+=1;}
//                 bufferPtrItr = table_2.dataAfterHeaderPtr + table_2.header[i][1];
//                 //              print("{x}\n", .{@intFromPtr(bufferPtrItr)-@intFromPtr(fileBuffer)});
//                 const glslShaderSize: u64 = readFromPtr(u32, bufferPtrItr);
//                 bufferPtrItr+=4;
//                 _ = linux.write(filefd, bufferPtrItr, glslShaderSize);
//                 bufferPtrItr+=glslShaderSize;
//                 if(readFromPtr(u32, bufferPtrItr) != glslShaderSize)
//                 {
//                     print("!= glslShaderSize!\n", .{});
//                     exit(0);
//                 }
            }
        }
    }
}
pub fn read_clb_Effects(memoryBuffer: *[]u8, path: [*:0]const u8, dirfd: i32,) void
{
    var stackBuffer: [0x100000]u8 align(0x1000) = undefined;
    var stackBufferPtr: [*]u8 = &stackBuffer;
    const mode: linux.mode_t = 0o755;
    const filefd: i32 = @intCast(linux.openat(dirfd, path, .{.ACCMODE = .RDONLY}, mode));
    var fileStat: linux.Stat = undefined;
    _ = linux.fstat(filefd, &fileStat);
    const fileSize: u64 = @intCast(fileStat.size);
    memoryBuffer.ptr = PageAllocator.map(fileSize);
    memoryBuffer.len = fileSize;
    const fileBuffer = memoryBuffer.ptr;
    //  var memoryBufferItr: [*]u8 = fileBuffer+fileSize;
    _ = linux.read(filefd, fileBuffer, fileSize);
    _ = linux.close(filefd);
    const clb_Signature: [8]u8 = .{0x43, 0x52, 0x4c, 0x00, 0x60, 0x00, 0x41, 0x00};
    if(CustomMem.ptrOnValue(u64, fileBuffer).* != @as(u64, @bitCast(clb_Signature)))
    {
        print("incorrect clb signature!", .{});
        exit(0);
    }
    var bufferPtrItr: [*]u8 = fileBuffer+24;
    var effectsCount: u64 = 0;
    const baseTable = readTable(&stackBufferPtr, bufferPtrItr);
    {
        //      baseTable.printDataOffsets(fileBuffer, 4);
        bufferPtrItr = baseTable.dataAfterHeaderPtr+baseTable.header[1][1];
        const libraryNameLength: u64 = bufferPtrItr[0];
        bufferPtrItr+=4;
        print("{s}\n", .{bufferPtrItr[0..libraryNameLength]});
        bufferPtrItr+=libraryNameLength;
        if(readFromPtr(u16, bufferPtrItr) != 257)
        {
            print("!= 0x0101\n", .{});
            exit(0);
        }
        if(bufferPtrItr[2] != 0)
        {
            print("!= 0\n", .{});
            exit(0);
        }
        bufferPtrItr+=3;
        const mainTable: Table = readTable(&stackBufferPtr, bufferPtrItr);
        {
            //          mainTable.printDataOffsets(fileBuffer, 4);
            for(0..mainTable.tablesCount) |tableIndex|
            {
                bufferPtrItr = mainTable.dataAfterHeaderPtr + mainTable.header[tableIndex][1];
                const chunkType: u64 = readFromPtr(u16, bufferPtrItr);
                switch(chunkType)
                {
                    0x1669 =>// PS
                    {
                        effectsCount+=1;
                    },
                    else =>
                    {
                    }
                }
            }
            effectsCount=0;
            const effectsDirfd: i32 = @intCast(linux.open("AoW3/shaders/Effects", .{.ACCMODE = .RDONLY}, mode));
            for(0..mainTable.tablesCount) |tableIndex|
            {
                bufferPtrItr = mainTable.dataAfterHeaderPtr + mainTable.header[tableIndex][1];
                const chunkType: u64 =  readFromPtr(u16, bufferPtrItr);
                if(chunkType == 0x1669)
                {
                    bufferPtrItr+=4;
                    readChunk_Effect(&stackBufferPtr, fileBuffer, bufferPtrItr, effectsDirfd);
                    print("\n", .{});
                }
            }
            _ = linux.close(effectsDirfd);
        }
    }
}
fn readChunk_Shader(stackBufferItr: *[*]u8, fileBuffer: [*]u8, bufferPtrItrIn: [*]u8, dirfd: i32, index: u64) void
{
	var bufferPtrItr: [*]u8 = undefined;
	const blockTable = readTable(stackBufferItr, bufferPtrItrIn);
	{
		// blockTable.printDataOffsets(fileBuffer, 4);
		bufferPtrItr = blockTable.dataAfterHeaderPtr;
		const libraryNameLen: u64 = bufferPtrItr[0];
		bufferPtrItr+=4;
		print("{s}\n", .{bufferPtrItr[0..libraryNameLen]});
		bufferPtrItr+=libraryNameLen;
		const nameLen: u64 = bufferPtrItr[0];
		bufferPtrItr+=4;
		print("{s}\n", .{bufferPtrItr[0..nameLen]});
		const exts = [2][*]const u8{".vert", ".frag"};
		CustomMem.ptrCast(u64, bufferPtrItr+nameLen).* = readFromPtr(u64, @constCast(exts[index]));
		const mode: linux.mode_t = 0o755;
		const filefd: i32 = @intCast(linux.openat(dirfd, @ptrCast(bufferPtrItr), .{.ACCMODE = .WRONLY, .CREAT = true, .TRUNC = true}, mode));
		defer _ = linux.close(filefd);
		bufferPtrItr+=nameLen;
		bufferPtrItr = blockTable.dataAfterHeaderPtr + blockTable.header[blockTable.tablesCount-1][1];
		if(readFromPtr(u16, bufferPtrItr) != 257)
		{
			print("!= 257\n", .{});
			exit(0);
		}
		bufferPtrItr+=3;
		const table_1 = readTable(stackBufferItr, bufferPtrItr);
		{
			table_1.printDataOffsets(fileBuffer, 4);
			bufferPtrItr = table_1.dataAfterHeaderPtr;
//          print("{x}\n", .{@intFromPtr(bufferPtrItr)-@intFromPtr(fileBuffer)});
			bufferPtrItr+=4;
			const table_2 = readTable(stackBufferItr, bufferPtrItr);
			{
//              table_2.printDataOffsets(fileBuffer, 4);
				var i: u64 = 0;
				while(table_2.header[i][0] != 0x82){i+=1;}
				bufferPtrItr = table_2.dataAfterHeaderPtr + table_2.header[i][1];
//              print("{x}\n", .{@intFromPtr(bufferPtrItr)-@intFromPtr(fileBuffer)});
				const glslShaderSize: u64 = readFromPtr(u32, bufferPtrItr);
				bufferPtrItr+=4;
				_ = linux.write(filefd, bufferPtrItr, glslShaderSize);
				bufferPtrItr+=glslShaderSize;
				if(readFromPtr(u32, bufferPtrItr) != glslShaderSize)
				{
					print("!= glslShaderSize!\n", .{});
					exit(0);
				}
			}
		}
	}
}
pub fn read_clb_Shaders(memoryBuffer: *[]u8, path: [*:0]const u8, dirfd: i32) void
{
    var stackBuffer: [0x10000]u8 align(0x1000) = undefined;
    var stackBufferPtr: [*]u8 = &stackBuffer;
	const mode: linux.mode_t = 0o755;
	const filefd: i32 = @intCast(linux.openat(dirfd, path, .{.ACCMODE = .RDONLY}, mode));
	var fileStat: linux.Stat = undefined;
	_ = linux.fstat(filefd, &fileStat);
	const fileSize: u64 = @intCast(fileStat.size);
	memoryBuffer.* = GlobalState.pageAllocator.alloc(u8, fileSize) catch unreachable;
	const fileBuffer = memoryBuffer.ptr;
//  var memoryBufferItr: [*]u8 = fileBuffer+fileSize;
	_ = linux.read(filefd, fileBuffer, fileSize);
	_ = linux.close(filefd);
	const clb_Signature: [8]u8 = .{0x43, 0x52, 0x4c, 0x00, 0x60, 0x00, 0x41, 0x00};
	if(CustomMem.alignPtrCast(u64, fileBuffer).* != @as(u64, @bitCast(clb_Signature)))
	{
		print("incorrect clb signature!", .{});
		exit(0);
	}
	var bufferPtrItr: [*]u8 = fileBuffer+24;
	var VS_Count: u64 = 0;
	var PS_Count: u64 = 0;
	const baseTable = readTable(&stackBufferPtr, bufferPtrItr);
	{
//      baseTable.printDataOffsets(fileBuffer, 4);
		bufferPtrItr = baseTable.dataAfterHeaderPtr+baseTable.header[1][1];
		const libraryNameLength: u64 = bufferPtrItr[0];
		bufferPtrItr+=4;
		print("{s}\n", .{bufferPtrItr[0..libraryNameLength]});
		bufferPtrItr+=libraryNameLength;
		if(readFromPtr(u16, bufferPtrItr) != 257)
		{
			print("!= 0x0101\n", .{});
			exit(0);
		}
		if(bufferPtrItr[2] != 0)
		{
			print("!= 0\n", .{});
			exit(0);
		}
		bufferPtrItr+=3;
		const mainTable: Table = readTable(&stackBufferPtr, bufferPtrItr);
		{
//          mainTable.printDataOffsets(fileBuffer, 4);
			for(0..mainTable.tablesCount) |tableIndex|
			{
				bufferPtrItr = mainTable.dataAfterHeaderPtr + mainTable.header[tableIndex][1];
				const chunkType: u64 = readFromPtr(u16, bufferPtrItr);
				switch(chunkType)
				{
					0x0002 =>// PS
					{
						VS_Count+=1;
					},
					0x0003 =>// PS
					{
						PS_Count+=1;
					},
					else =>
					{
						print("unknown chunk type: {x}\n", .{chunkType});
						print("{x}\n", .{@intFromPtr(bufferPtrItr)-@intFromPtr(fileBuffer)});
					}
				}
			}
			print("VS Count: {d}\n", .{VS_Count});
			print("PS Count: {d}\n", .{PS_Count});
			VS_Count=0;
			PS_Count=0;
			var dirfds: [2]i32 = undefined;
			dirfds[0] = @intCast(linux.open("AoW3/shaders/VS", .{.ACCMODE = .RDONLY}, mode));
			dirfds[1] = @intCast(linux.open("AoW3/shaders/PS", .{.ACCMODE = .RDONLY}, mode));
			for(0..mainTable.tablesCount) |tableIndex|
			{
				bufferPtrItr = mainTable.dataAfterHeaderPtr + mainTable.header[tableIndex][1];
				const chunkType: u64 =  readFromPtr(u16, bufferPtrItr);
//              if(chunkType == 0x0002)
//              {
//                  bufferPtrItr+=4;
//                  readChunk_Shader(&memoryBufferItr, fileBuffer, bufferPtrItr);
//                  print("\n", .{});
// //                   break;
//              }
					bufferPtrItr+=4;
					readChunk_Shader(&stackBufferPtr, fileBuffer, bufferPtrItr, dirfds[chunkType-2], chunkType-2);
					print("\n", .{});
			}
			_ = linux.close(dirfds[0]);
			_ = linux.close(dirfds[1]);
		}
	}
}
fn readChunk_Texture(stackBufferItr: *[*]u8, memoryBufferItr: *[*]u8, fileBuffer: [*]u8, bufferPtrItrIn: [*]u8, texture: *Archive.Texture) void
{
	// _ = fileBuffer;
	var bufferPtrItr: [*]u8 = undefined;
	const blockTable = readTable(stackBufferItr, bufferPtrItrIn);
	{
		// blockTable.printDataOffsets(fileBuffer, 4);
		bufferPtrItr = blockTable.dataAfterHeaderPtr;
		const libraryNameLen: u64 = bufferPtrItr[0];
		bufferPtrItr+=4;
		print("{s}\n", .{bufferPtrItr[0..libraryNameLen]});
		bufferPtrItr+=libraryNameLen;
		const nameLen: u64 = bufferPtrItr[0];
		bufferPtrItr+=4;
		print("{s}\n", .{bufferPtrItr[0..nameLen]});
		texture.name = bufferPtrItr;
		texture.nameLen = @intCast(nameLen);
		bufferPtrItr+=nameLen;
		for(2..blockTable.tablesCount) |tableIndex|
		{
			bufferPtrItr = blockTable.dataAfterHeaderPtr + blockTable.header[tableIndex][1];
			if(@as(*align(1)u16, @ptrCast(bufferPtrItr)).* == 0x0101)
			{
				bufferPtrItr+=3;
				const mipmapsHeaderOffsetsTable = readTable(stackBufferItr, bufferPtrItr);
				{
					bufferPtrItr = mipmapsHeaderOffsetsTable.dataAfterHeaderPtr+4+9;
					var mipSizes: [16]u64 = undefined;
					var mipPixels: [16][*]u8 = undefined;
					var tex_width: u64 = @as(*align(1)u32, @ptrCast(bufferPtrItr)).*;
					var tex_height: u64 = @as(*align(1)u32, @ptrCast(bufferPtrItr+4)).*;
					const tex_format: u64 = @as(*align(1)u32, @ptrCast(bufferPtrItr+8)).*;
					bufferPtrItr+=12;
					mipPixels[0] = bufferPtrItr;
					print("width: {d}\nheight: {d}\nformat: ", .{tex_width, tex_height});
					// var texture_size: u64 = 0;
					switch(tex_format)
					{
						0x05 =>
						{
							mipSizes[0] = (tex_width*tex_height)*4;
							texture.image.format = VulkanInclude.VK_FORMAT_A8B8G8R8_SRGB_PACK32;
							texture.image.alignment = 4;
							print("A8B8G8R8_SRGB_PACK32\n", .{});
						},
						0x07 =>
						{
							mipSizes[0] = (tex_width*tex_height)/2;
							mipSizes[0] += ((8 - mipSizes[0] % 8) % 8);
							texture.image.format = VulkanInclude.VK_FORMAT_BC1_RGB_SRGB_BLOCK;
							texture.image.alignment = 8;
							print("BC1_RGB_SRGB_BLOCK\n", .{});
						},
						0x09 =>
						{
							mipSizes[0] = (tex_width*tex_height);
							mipSizes[0] += ((16 - mipSizes[0] % 16) % 16);
							texture.image.format = VulkanInclude.VK_FORMAT_BC2_SRGB_BLOCK;
							texture.image.alignment = 16;
							print("BC2_SRGB_BLOCK\n", .{});
						},
						0x0b =>
						{
							mipSizes[0] = (tex_width*tex_height);
							mipSizes[0] += ((16 - mipSizes[0] % 16) % 16);
							// print("{d}\n", .{mipSizes[0]});
							texture.image.format = VulkanInclude.VK_FORMAT_BC3_SRGB_BLOCK;
							// VulkanInclude.VK_FORMAT_BC3_UNORM_BLOCK;
							texture.image.alignment = 16;
							print("BC3_UNORM_BLOCK\n", .{});
						},
						else =>
						{
							print("unknown texture image format\n", .{});
							exit(0);
						}
					}
					texture.image.width = @intCast(tex_width);
					texture.image.height = @intCast(tex_height);
					texture.image.mipSize = @intCast(mipSizes[0]);
					texture.image.mipsCount = @intCast(mipmapsHeaderOffsetsTable.tablesCount);
					for(1..mipmapsHeaderOffsetsTable.tablesCount) |mipLevel|
					{
						bufferPtrItr = mipmapsHeaderOffsetsTable.dataAfterHeaderPtr + mipmapsHeaderOffsetsTable.header[mipLevel][1];
						if(@as(*align(1)u32, @ptrCast(bufferPtrItr)).* != 0x00410024)
						{
							print("!= 0x00410024\n", .{});
							print("{x}\n", .{@intFromPtr(bufferPtrItr)-@intFromPtr(fileBuffer)});
							exit(0);
						}
						bufferPtrItr+=4;
						const mipTable = readTableNear(bufferPtrItr);
						bufferPtrItr = mipTable.dataAfterHeaderPtr;
						// print("{x}\n", .{@intFromPtr(bufferPtrItr)-@intFromPtr(fileBuffer)});
						tex_width = @as(*align(1)u32, @ptrCast(bufferPtrItr)).*;
						tex_height = @as(*align(1)u32, @ptrCast(bufferPtrItr+4)).*;
						// print("width: {d}\nheight: {d}\n", .{tex_width, tex_height});
						bufferPtrItr+=12;
						mipPixels[mipLevel] = bufferPtrItr;
						switch(tex_format)
						{
							0x05 =>
							{
								mipSizes[mipLevel] = (tex_width*tex_height)*4;
							},
							0x07 =>
							{
								mipSizes[mipLevel] = (tex_width*tex_height)/2;
								mipSizes[mipLevel] += ((8 - mipSizes[mipLevel] % 8) % 8);
							},
							0x09 =>
							{
								mipSizes[mipLevel] = (tex_width*tex_height);
								mipSizes[mipLevel] += ((16 - mipSizes[mipLevel] % 16) % 16);
							},
							0x0b =>
							{
								mipSizes[mipLevel] = (tex_width*tex_height);
								mipSizes[mipLevel] += ((16 - mipSizes[mipLevel] % 16) % 16);
							},
							else => unreachable,
						}
					}
					var texture_size: u64 = 0;
					for(0..mipmapsHeaderOffsetsTable.tablesCount) |i|
					{
						// print("{d}\n", .{mipSizes[i]});
						texture_size += mipSizes[i];
					}
					texture.image.size = @intCast(texture_size);
//                  texture.image.data = allocInFixedBuffer(memoryBufferItr, texture.image.size, u8);
					texture.image.data = CustomMem.allocInFixedBuffer(memoryBufferItr, texture.image.size, CustomMem.SIMDalignment);
					texture_size = 0;

//                  var timespec1: linux.timespec = undefined;
//                  _ = linux.clock_gettime(0, &timespec1);
//                  var memoryCopied: u64 = 0;
// for(0..1000*1000*4) |t|
// {
// _ = t;
// memcpy(texture.image.data+texture_size, mipPixels[0], mipSizes[0]);
// memoryCopied+=mipSizes[0];
// // customMem.memcpyBase(texture.image.data+texture_size, mipPixels[0], mipSizes[0]);
// // customMem.memcpyDstAlign(texture.image.data+texture_size, mipPixels[0], mipSizes[0]);
// // @memcpy(@as([*]align(8)u8, @alignCast(texture.image.data+texture_size)), mipPixels[0][0..mipSizes[0]]);
// }
// var timespec2: linux.timespec = undefined;
// _ = linux.clock_gettime(0, &timespec2);
// const time: isize = (timespec2.tv_sec-timespec1.tv_sec)*1000 + (@as(i64, @intCast(@as(u64, @intCast(timespec2.tv_nsec))/1000000)) - @as(i64, @intCast(@as(u64, @intCast(timespec1.tv_nsec))/1000000)));
// print("time: {d} ms\n", .{time});
// print("memoryCopied: {d} GiB", .{memoryCopied/1024/1024/1024});
// exit(0);
// print("");
					for(0..mipmapsHeaderOffsetsTable.tablesCount) |i|
					{
// customMem.memcpyNoalign(texture.image.data+texture_size, mipPixels[i], mipSizes[i]);
						memcpy(texture.image.data+texture_size, mipPixels[i], mipSizes[i]);
// customMem.memcpyTest(texture.image.data+texture_size, mipPixels[i], mipSizes[i]);
						texture_size += mipSizes[i];
					}
				}
			}
		}
	}
}
pub fn clb_Convert(memoryBuffer: *[]u8, path: []const u8, dirfd_src: i32, dirfd_dst: i32) void
{
	var stackBuffer: [0x10000]u8 align(0x1000) = undefined;
	var stackBufferPtr: [*]u8 = &stackBuffer;

	var archive: Archive = undefined;
	archive.name = path.ptr;
	const mode: linux.mode_t = 0o755;
	const filefd: i32 = @intCast(linux.openat(dirfd_src, @ptrCast(path.ptr), .{.ACCMODE = .RDONLY}, mode));
    defer _ = linux.close(filefd);
	var fileStat: linux.Stat = undefined;
	_ = linux.fstat(filefd, &fileStat);
	const fileSize: u64 = @intCast(fileStat.size);
    memoryBuffer.ptr = PageAllocator.map(fileSize*2);
    memoryBuffer.len = fileSize*2;
	const fileBuffer = memoryBuffer.ptr;
	var memoryBufferItr: [*]u8 = fileBuffer+fileSize;
	_ = linux.read(filefd, fileBuffer, fileSize);
//     _ = linux.close(filefd);
	const clb_Signature: [8]u8 = .{0x43, 0x52, 0x4c, 0x00, 0x60, 0x00, 0x41, 0x00};
	if(CustomMem.alignPtrCast(*u64, fileBuffer).* != @as(u64, @bitCast(clb_Signature)))
	{
		print("incorrect clb signature!", .{});
		exit(0);
	}
	var bufferPtrItr: [*]u8 = fileBuffer+24;
	const baseTable = readTable(&stackBufferPtr, bufferPtrItr);
	{
//      baseTable.printDataOffsets(fileBuffer, 4);
		bufferPtrItr = baseTable.dataAfterHeaderPtr+baseTable.header[1][1];
		const libraryNameLength: u64 = bufferPtrItr[0];
		bufferPtrItr+=4;
		print("{s}\n", .{bufferPtrItr[0..libraryNameLength]});
		bufferPtrItr+=libraryNameLength;
		//@as(*align(1)u16, @ptrCast(bufferPtrItr)).*
		if(readFromPtr(u16, bufferPtrItr) != 257)
		{
			print("!= 0x0101\n", .{});
			exit(0);
		}
		if(bufferPtrItr[2] != 0)
		{
			print("!= 0\n", .{});
			exit(0);
		}
		bufferPtrItr+=3;
		const mainTable: Table = readTable(&stackBufferPtr, bufferPtrItr);
		{
//          mainTable.printDataOffsets(fileBuffer, 4);
			var modelsCount: u64 = 0;
			// defer modelsCountPtr.* = @intCast(modelsCount);
			var meshesCount: u64 = 0;
			// defer meshesCountPtr.* = @intCast(meshesCount);
			var materialsCount: u64 = 0;
			// defer materialsCountPtr.* = @intCast(materialsCount);
			var texturesCount: u64 = 0;
			// var chunk_index: u64 = 0;
			for(0..mainTable.tablesCount) |tableIndex|
			{
				bufferPtrItr = mainTable.dataAfterHeaderPtr + mainTable.header[tableIndex][1];
				const chunkType: u64 =  @as(*align(1)u16, @ptrCast(bufferPtrItr)).*;
				switch(chunkType)
				{
					//             0x0005 =>//ANIM
					//             {
					//
					//             },
					0x004b =>//OBJ
					{
						modelsCount+=1;
					},
					0x166f =>//MAT
					{
						materialsCount+=1;
					},
					0x0035 =>//MESH
					{
						meshesCount+=1;
					},
					0x003d =>//TX
					{
						texturesCount+=1;
					},
					else =>
					{
						print("unknown chunk type: {x}\n", .{chunkType});
						print("{x}\n", .{@intFromPtr(bufferPtrItr)-@intFromPtr(fileBuffer)});
					}
				}
			}
			archive.texturesCount = @intCast(texturesCount);
			print("texturesCount: {d}\n", .{texturesCount});
			archive.textures = allocInFixedBufferT(&memoryBufferItr, @sizeOf(Archive.Texture)*texturesCount, Archive.Texture);
			texturesCount = 0;
// print("meshesCount: {d}\n", .{meshesCount});
			meshesCount = 0;
// print("materialsCount: {d}\n", .{materialsCount});
// materialsCount = 0;
			print("modelsCount: {d}\n", .{modelsCount});
			modelsCount = 0;
			for(0..mainTable.tablesCount) |tableIndex|
			{
				bufferPtrItr = mainTable.dataAfterHeaderPtr + mainTable.header[tableIndex][1];
				const chunkType: u64 =  @as(*align(1)u16, @ptrCast(bufferPtrItr)).*;
				if(chunkType == 0x003d)
				{
					bufferPtrItr+=4;
					readChunk_Texture(&stackBufferPtr, &memoryBufferItr, fileBuffer, bufferPtrItr, &archive.textures[texturesCount]);
					texturesCount+=1;
					print("\n", .{});
// break;
				}
			}
		}
	}
//  var pathStack: [1024]u8 align(customMem.SIMDalignment) = undefined;
//     customMem.memcpyDstAlign(&pathStack, path.ptr, path.len);
//     const filefd: i32 = @intCast(linux.openat(dirfd_src, @ptrCast(path.ptr), .{.ACCMODE = .RDONLY}, mode));
//     var fileStat: linux.Stat = undefined;
//     _ = linux.fstat(filefd, &fileStat);

	const clb_custom_fd: i32 = @intCast(linux.openat(dirfd_dst, @ptrCast(path.ptr), .{.ACCMODE = .WRONLY, .CREAT = true, .TRUNC = true}, mode));
	defer _ = linux.close(clb_custom_fd);
	var fileBufferStack: [4096]u8 align(CustomMem.SIMDalignment) = undefined;
	@as(*[4]u8, @ptrCast(&fileBufferStack)).* = [4]u8{'C', 'R', 'L', 'C'};
	var fileBufferStackPtr: [*]u8 = &fileBufferStack;
	fileBufferStackPtr[4] = @intCast(archive.texturesCount);
	fileBufferStackPtr = &fileBufferStack;
	_ = linux.write(clb_custom_fd, &fileBufferStack, 5);
	for(archive.textures[0..archive.texturesCount]) |texture|
	{
		fileBufferStackPtr = &fileBufferStack;
		fileBufferStackPtr[0] = @intCast(texture.nameLen);
//      @memcpy(fileBufferStackPtr+1, texture.name[0..texture.nameLen]);
//      customMem.memcpyNoalign(fileBufferStackPtr+1, texture.name, texture.nameLen);
		memcpy(fileBufferStackPtr+1, texture.name, texture.nameLen);
		fileBufferStackPtr+=texture.nameLen+1;
		@as(*align(1)u32, @ptrCast(fileBufferStackPtr)).* = texture.image.size;
		@as(*align(1)u32, @ptrCast(fileBufferStackPtr+4)).* = texture.image.mipSize;
		@as(*align(1)u32, @ptrCast(fileBufferStackPtr+8)).* = texture.image.width;
		@as(*align(1)u32, @ptrCast(fileBufferStackPtr+10)).* = texture.image.height;
		@as(*align(1)u32, @ptrCast(fileBufferStackPtr+12)).* = texture.image.format;
		fileBufferStackPtr[16] = texture.image.alignment;
		fileBufferStackPtr[17] = texture.image.mipsCount;
		fileBufferStackPtr+=18;
		_ = linux.write(clb_custom_fd, &fileBufferStack, 1+texture.nameLen+18);
		_ = linux.write(clb_custom_fd, texture.image.data, texture.image.size);
	}
}
pub fn clb_custom_read(allocator: mem.Allocator, path: []const u8, dirfd: i32, archive: *ArchiveGPU) void//dirfd: i32,
{
//     const file: std.fs.File = std.fs.cwd().openFileZ(path, .{}) catch
//     {
//         print("custom clb not found!\n", .{});exit(0);
//     };
//     defer file.close();
//     const stat = file.stat() catch unreachable;
    const mode: linux.mode_t = 0o755;
    const filefd: i32 = @intCast(linux.openat(dirfd, @ptrCast(path.ptr), .{.ACCMODE = .RDONLY}, mode));
    defer _ = linux.close(filefd);
    var fileStat: linux.Stat = undefined;
    _ = linux.fstat(filefd, &fileStat);
	const fileSize: u64 = @intCast(fileStat.size);
	const fileBuffer: [*]u8 = (GlobalState.arenaAllocator.alloc(u8, fileSize) catch unreachable).ptr;
    _ = linux.read(filefd, fileBuffer, fileSize);
// _ = file.read(fileBuffer[0..file_size]) catch unreachable;
	var fileBufferPtrItr = fileBuffer;
	if(@as(*u32, @alignCast(@ptrCast(fileBufferPtrItr))).* != @as(u32, @bitCast([4]u8{'C', 'R', 'L', 'C'})))
	{
		print("incorrect clb signature!\n", .{});
		exit(0);
	}
	archive.texturesCount = fileBufferPtrItr[4];
	fileBufferPtrItr+=5;
	archive.textures = (allocator.alloc(Image.Texture, archive.texturesCount) catch unreachable).ptr;
	var images: [256]Image.Image = undefined;
	for(images[0..archive.texturesCount]) |*image|
	{
		const nameLen: u64 = fileBufferPtrItr[0];
		print("{s}\n", .{(fileBufferPtrItr+1)[0..nameLen]});
		fileBufferPtrItr+=1+nameLen;
		image.size = readFromPtr(u32, fileBufferPtrItr);
		image.mipSize = readFromPtr(u32, fileBufferPtrItr+4);
		image.width = readFromPtr(u16, fileBufferPtrItr+8);
		image.height = readFromPtr(u16, fileBufferPtrItr+10);
		image.format = readFromPtr(u32, fileBufferPtrItr+12);
		image.alignment = fileBufferPtrItr[16];
		image.mipsCount = fileBufferPtrItr[17];
		fileBufferPtrItr+=18;
		image.data = fileBufferPtrItr;
		fileBufferPtrItr+=image.size;
	}
	print("\n", .{});
	if(archive.texturesCount > 0)
	{
		VkImage.createVkImages__VkImageViews__VkDeviceMemory_AoS_dst(&images, @ptrCast(archive.textures), @sizeOf(ArchiveGPU.Texture), archive.texturesCount, &archive.texturesVkDeviceMemory);
	}
//  Hex.Create_DiffuseMaterial_VkDescriptorSetLayout(&archive.descriptorSetLayout);
//  Hex.Create_DiffuseMaterial_VkDescriptorPool(&archive.descriptorPool, @intCast(archive.texturesCount));
//  for(archive.textures[0..archive.texturesCount]) |*texture|
//  {
//  texture.Create_DiffuseMaterial_VkDescriptorSet(archive.descriptorSetLayout, archive.descriptorPool);
//  }
}
