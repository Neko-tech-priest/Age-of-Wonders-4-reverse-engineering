const std = @import("std");
const builtin = @import("builtin");
const mem = std.mem;
const linux = std.os.linux;
const print = std.debug.print;
const exit = std.process.exit;

// const lz4 = @import("lz4.zig");
// const Vulkan = @import("Vulkan.zig");
const Vulkan = @import("Vulkan.zig");

const GlobalState = @import("GlobalState.zig");
const stdout = GlobalState.stdout;
const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;

// const PageAllocator = @import("PageAllocator.zig");
const CustomMem = @import("CustomMem.zig");
const alignPtrCast = CustomMem.alignPtrCast;
const allocInFixedBuffer = CustomMem.allocInFixedBuffer;
const allocInFixedBufferT = CustomMem.allocInFixedBufferT;
const readFromPtr = CustomMem.readFromPtr;
const memcpy = CustomMem.memcpy;
const memcpyDstAlign = CustomMem.memcpyDstAlign;
const ptrOnValue = CustomMem.ptrOnValue;

const Image = @import("Image.zig");
const VkImage = @import("VkImage.zig");
const VkBuffer = @import("VkBuffer.zig");

pub const ArchiveGPU = struct
{
    pub const Meshes_AoS = struct
    {
        vkBuffers: [*]Vulkan.VkBuffer,
//         indicesVkBuffers: [*]Vulkan.VkBuffer,
        indicesCounts: [*]u16,
//         vertexVkBuffer: Vulkan.VkBuffer,
//         indexVkBuffer: Vulkan.VkBuffer,
//         indicesCount: u16,

        pub fn unload(self: Meshes_AoS, count: u64) void
        {
            for(0..count*2) |i|
            {
                Vulkan.vkDestroyBuffer(VulkanGlobalState._device, self.vkBuffers[i], null);
//                 Vulkan.vkDestroyBuffer(VulkanGlobalState._device, self.vkBuffers[i+1], null);
            }
        }
    };
    textures: [*]Image.Texture,
    meshes_AoS: Meshes_AoS,
    texturesCount: u16,
    meshesCount: u16,
    texturesVkDeviceMemory: Vulkan.VkDeviceMemory,
    meshesVkDeviceMemory: Vulkan.VkDeviceMemory,
    descriptorSetLayout: Vulkan.VkDescriptorSetLayout,
    descriptorPool: Vulkan.VkDescriptorPool,
    descriptorSet: Vulkan.VkDescriptorSet,
    pub fn unload(self: ArchiveGPU) void
    {
        for(0..self.texturesCount) |i|
            self.textures[i].unload();
        Vulkan.vkFreeMemory(VulkanGlobalState._device, self.texturesVkDeviceMemory, null);
//         for(0..self.meshesCount)
        self.meshes_AoS.unload(self.meshesCount);
        Vulkan.vkFreeMemory(VulkanGlobalState._device, self.meshesVkDeviceMemory, null);
//         Vulkan.vkDestroyDescriptorSetLayout(VulkanGlobalState._device, self.descriptorSetLayout, null);

        GlobalState.allocator.free(self.textures[0..self.texturesCount]);
        GlobalState.allocator.free(CustomMem.ptrCast([*]align(8)u8, self.meshes_AoS.vkBuffers)[0..self.meshesCount*16+self.meshesCount*2]);
//         Vulkan.vkDestroyDescriptorPool(VulkanGlobalState._device, self.descriptorPool, null);
    }
};

pub fn clb_custom_read(allocator: mem.Allocator, path: [*:0]const u8, archive: *ArchiveGPU) void
{
    _ = allocator;
    const file: std.fs.File = std.fs.cwd().openFileZ(path, .{}) catch
    {
        print("custom clb not found!\n", .{});exit(0);
    };
    defer file.close();
    const stat = file.stat() catch unreachable;
    const file_size: usize = stat.size;
    const fileBuffer: [*]u8 = (GlobalState.arenaAllocator.alloc(u8, file_size) catch unreachable).ptr;
    _ = file.read(fileBuffer[0..file_size]) catch unreachable;
    var fileBufferPtrItr = fileBuffer;
    if(alignPtrCast(*u32, fileBufferPtrItr).* != @as(u32, @bitCast([4]u8{'C', 'R', 'L', 'C'})))
    {
        print("incorrect clb signature!\n", .{});
        exit(0);
    }
    archive.texturesCount = fileBufferPtrItr[4];
    archive.meshesCount = fileBufferPtrItr[5];
    fileBufferPtrItr+=6;
    archive.textures = (GlobalState.allocator.alloc(Image.Texture, archive.texturesCount) catch unreachable).ptr;
//     archive.meshes_AoS = (allocator.alloc(ArchiveGPU.Meshes_AoS, archive.meshesCount) catch unreachable).ptr;
    const meshesAlloc = (GlobalState.allocator.alignedAlloc(u8, 8, archive.meshesCount*8*2+archive.meshesCount*2) catch unreachable).ptr;
//     const meshesAlloc = (globalState.allocator.alignedAlloc(u8, 8, archive.meshesCount*8*2) catch unreachable).ptr;
    archive.meshes_AoS.vkBuffers = @ptrCast(meshesAlloc);
    archive.meshes_AoS.indicesCounts = @alignCast(@ptrCast(meshesAlloc + archive.meshesCount*8*2));
    var images: [256]Image.Image = undefined;
    for(images[0..archive.texturesCount]) |*image|
    {
        const nameLen: u64 = fileBufferPtrItr[0];
        stdout.print("{s}\n", .{(fileBufferPtrItr+1)[0..nameLen]}) catch unreachable;
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
    var buffers: [512][*]u8 = undefined;
    var buffersSizes: [512]u64 = undefined;

    for(0..archive.meshesCount) |index|
    {
        const nameLen: u64 = fileBufferPtrItr[0];
        stdout.print("{s}\n", .{(fileBufferPtrItr+1)[0..nameLen]}) catch unreachable;
        fileBufferPtrItr+=1+nameLen;
        buffersSizes[index+archive.meshesCount] = readFromPtr(u32, fileBufferPtrItr);
        buffersSizes[index] = readFromPtr(u32, fileBufferPtrItr+4);
        archive.meshes_AoS.indicesCounts[index] = @intCast(buffersSizes[index] >> 1);
        fileBufferPtrItr+=8;
        buffers[index+archive.meshesCount] = fileBufferPtrItr;
        fileBufferPtrItr+=buffersSizes[index+archive.meshesCount];
        buffers[index] = fileBufferPtrItr;
        fileBufferPtrItr+=buffersSizes[index];
    }
    if(archive.texturesCount > 0)
    {
        VkImage.createVkImages__VkImageViews__VkDeviceMemory_AoS_dst(&images, @ptrCast(archive.textures), @sizeOf(Image.Texture), archive.texturesCount, &archive.texturesVkDeviceMemory);
    }
    if(archive.meshesCount > 0)
    {
        VkBuffer.createVkBuffers__VkDeviceMemory_SoA(Vulkan.VK_BUFFER_USAGE_STORAGE_BUFFER_BIT, &buffers, &buffersSizes, archive.meshes_AoS.vkBuffers, archive.meshesCount*2, &archive.meshesVkDeviceMemory);
    }
    GlobalState.bw.flush() catch unreachable;
//     const Mesh = extern struct
//     {
//         verticesBufferSize: u32,
//         indicesBufferSize: u32,
//         indicesCount: u16,
//     };
//     print("Mesh struct size: {d}\n", .{@sizeOf(Mesh)});
}
pub fn createDescriptorsData(archive: *ArchiveGPU) void
{
    const descriptorSetLayoutBindings = [1]Vulkan.VkDescriptorSetLayoutBinding
    {
        .{
            .binding = 0,
            .descriptorCount = 1,
            .descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_STORAGE_BUFFER,
            .pImmutableSamplers = null,
            .stageFlags = Vulkan.VK_SHADER_STAGE_VERTEX_BIT,
        },
//         .{
//             .binding = 0,
//             .descriptorCount = archive.texturesCount,
//             .descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE,
//             .pImmutableSamplers = null,
//             .stageFlags = Vulkan.VK_SHADER_STAGE_FRAGMENT_BIT,
//         },
//         .{
//             .binding = 1,
//             .descriptorCount = 1,
//             .descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_SAMPLER,
//             .pImmutableSamplers = &VulkanGlobalState._textureSampler,
//             .stageFlags = Vulkan.VK_SHADER_STAGE_FRAGMENT_BIT,
//         },
    };
    const layoutInfo = Vulkan.VkDescriptorSetLayoutCreateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO,
        .bindingCount = descriptorSetLayoutBindings.len,
        .pBindings = &descriptorSetLayoutBindings,
    };
    VK_CHECK(Vulkan.vkCreateDescriptorSetLayout(VulkanGlobalState._device, &layoutInfo, null, &archive.descriptorSetLayout));

    const poolSizes = [1]Vulkan.VkDescriptorPoolSize
    {
        .{
            .type = Vulkan.VK_DESCRIPTOR_TYPE_STORAGE_BUFFER,
            .descriptorCount = archive.meshesCount,
        },
//         .{
//             .type = Vulkan.VK_DESCRIPTOR_TYPE_SAMPLER,
//             .descriptorCount = 1,
//         },
    };

    const poolInfo = Vulkan.VkDescriptorPoolCreateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO,
        .poolSizeCount = poolSizes.len,
        .pPoolSizes = &poolSizes,
        .maxSets = 1,
    };
    //
    VK_CHECK(Vulkan.vkCreateDescriptorPool(VulkanGlobalState._device, &poolInfo, null, &archive.descriptorPool));
}
