const std = @import("std");
const linux = std.os.linux;
const mem = std.mem;
const print = std.debug.print;
const exit = std.process.exit;
const fd_t = std.posix.fd_t;
const builtin = @import("builtin");

const CustomFS = @import("CustomFS.zig");
const CustomMem = @import("CustomMem.zig");
const alignPtrCast = CustomMem.alignPtrCast;
const allocInFixedBuffer = CustomMem.allocInFixedBuffer;
const allocInFixedBufferT = CustomMem.allocInFixedBufferT;
const readFromPtr = CustomMem.readFromPtr;
const memcpy = CustomMem.memcpy;
const memcpyDstAlign = CustomMem.memcpyDstAlign;
const ptrOnValue = CustomMem.ptrOnValue;

const GlobalState = @import("GlobalState.zig");
const stdout = GlobalState.stdout;

// const Image = @import("Image.zig").Image;
const PageAllocator = @import("PageAllocator.zig");

const Texture = @import("Texture.zig").Texture;
const Vulkan = @import("Vulkan.zig");
const VkBuffer = @import("VkBuffer.zig");
const VkImage = @import("VkImage.zig");
const VkDeviceMemory = @import("VkDeviceMemory.zig");
const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;

// pub const ArchiveCPU = struct
// {
//     pub const Mesh = struct
//     {
//         indexBuffer: [*]u8,
//         vertexBuffer: [*]u8,
//         indexBufferSize: u32,
//         vertexBufferSize: u32,
// //         vertexBuffers: [*][*]u8,
// //         indexBuffers: [*][*]u16,
// //         vertexBuffersCount: u16,
//
//     };
// //     vertexBuffers: [*][*]u8,
// //     indexBuffers: [*][*]u16,
// //     vertexBuffersCount: u8,
// //     indexBuffersCount: u8,
//
//     textures: [*]Image,
//     meshes: [*]Mesh,
//     texturesCount: u8,
//     meshesCount: u8,
//     pub fn unload(self: ArchiveCPU) void
//     {
// //         _ =self;
//         for(self.textures[0..self.texturesCount]) |texture|
//         {
//             PageAllocator.unmap(texture.data[0..texture.size]);
//         }
//         GlobalState.allocator.free(self.textures[0..self.texturesCount]);
//         for(self.meshes[0..self.meshesCount]) |mesh|
//         {
//             PageAllocator.unmap(mesh.vertexBuffer[0..mesh.vertexBufferSize]);
//             PageAllocator.unmap(mesh.indexBuffer[0..mesh.indexBufferSize]);
//         }
//         GlobalState.allocator.free(self.meshes[0..self.meshesCount]);
//     }
// };
pub const ArchiveGPU = struct
{
//     pub const Meshes_AoS = struct
//     {
//         vkBuffers: [*]Vulkan.VkBuffer,
// //         indicesVkBuffers: [*]Vulkan.VkBuffer,
//         indicesCounts: [*]u16,
// //         vertexVkBuffer: Vulkan.VkBuffer,
// //         indexVkBuffer: Vulkan.VkBuffer,
// //         indicesCount: u16,
//
//         pub fn unload(self: Meshes_AoS, count: u64) void
//         {
//             for(0..count*2) |i|
//             {
//                 Vulkan.vkDestroyBuffer(VulkanGlobalState._device, self.vkBuffers[i], null);
// //                 Vulkan.vkDestroyBuffer(VulkanGlobalState._device, self.vkBuffers[i+1], null);
//             }
//         }
//     };
    textures: [*]Texture,
//     meshes_AoS: Meshes_AoS,
    texturesCount: u16,
//     meshesCount: u16,
    texturesVkDeviceMemory: Vulkan.VkDeviceMemory,
//     meshesVkDeviceMemory: Vulkan.VkDeviceMemory,
    descriptorSetLayout: Vulkan.VkDescriptorSetLayout,
    descriptorPool: Vulkan.VkDescriptorPool,
    descriptorSet: Vulkan.VkDescriptorSet,
    pub fn unload(self: ArchiveGPU) void
    {
        for(0..self.texturesCount) |i|
            self.textures[i].unload();
        Vulkan.vkFreeMemory(VulkanGlobalState._device, self.texturesVkDeviceMemory, null);
// //         for(0..self.meshesCount)
//         self.meshes_AoS.unload(self.meshesCount);
//         Vulkan.vkFreeMemory(VulkanGlobalState._device, self.meshesVkDeviceMemory, null);
//
        GlobalState.allocator.free(self.textures[0..self.texturesCount]);
//         GlobalState.allocator.free(CustomMem.ptrCast([*]align(8)u8, self.meshes_AoS.vkBuffers)[0..self.meshesCount*16+self.meshesCount*2]);
        Vulkan.vkDestroyDescriptorSetLayout(VulkanGlobalState._device, self.descriptorSetLayout, null);
        Vulkan.vkDestroyDescriptorPool(VulkanGlobalState._device, self.descriptorPool, null);
    }
};
const Image = struct
{
    size: u32,
    mipSize: u32,
    width: u16,
    height: u16,
    mipsCount: u8,
    alignment: u8,
    format: Vulkan.VkFormat,
};
pub fn createVkImage(image: *const Image, usage: Vulkan.VkImageUsageFlags, vkImage: *Vulkan.VkImage) void
{
    //print("mipsCount: {d}\n", .{image.mipsCount});
    const imageInfo = Vulkan.VkImageCreateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO,
        .imageType = Vulkan.VK_IMAGE_TYPE_2D,
        .extent = Vulkan.VkExtent3D
        {
            .width = image.width,
            .height = image.height,
            .depth = 1,
        },
        .mipLevels = image.mipsCount,
        .arrayLayers = 1,
        .format = image.format,
        .tiling = Vulkan.VK_IMAGE_TILING_OPTIMAL,
        .initialLayout = Vulkan.VK_IMAGE_LAYOUT_UNDEFINED,
        .usage = usage,
        .samples = Vulkan.VK_SAMPLE_COUNT_1_BIT,
        .sharingMode = Vulkan.VK_SHARING_MODE_EXCLUSIVE,
    };
    VK_CHECK(Vulkan.vkCreateImage(VulkanGlobalState._device, &imageInfo, null, vkImage));
}
fn loadTextures(buffer: [*]const u8, images: [*]const Image, textures: [*]Texture, numImages: u64, dstDeviceMemory: *Vulkan.VkDeviceMemory) void
{
    var sizeDeviceMemory: usize = 0;
    var images_full_sizes: [512]u64 = undefined;
    for(0..numImages) |imageIndex|
    {
        const image = &images[imageIndex];
        createVkImage(image, Vulkan.VK_IMAGE_USAGE_TRANSFER_DST_BIT | Vulkan.VK_IMAGE_USAGE_SAMPLED_BIT, &textures[imageIndex].vkImage);
        var memRequirements: Vulkan.VkMemoryRequirements = undefined;
        Vulkan.vkGetImageMemoryRequirements(VulkanGlobalState._device, textures[imageIndex].vkImage, &memRequirements);
        images_full_sizes[imageIndex] = (memRequirements.size + ((memRequirements.alignment - memRequirements.size % memRequirements.alignment) % memRequirements.alignment));
        sizeDeviceMemory += images_full_sizes[imageIndex];
    }
    var stagingBuffer: Vulkan.VkBuffer = undefined;
    var stagingDeviceMemory: Vulkan.VkDeviceMemory = undefined;

    var memoryTypeIndex: u32 = undefined;

    var allocInfo = Vulkan.VkMemoryAllocateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO,
        .allocationSize = sizeDeviceMemory,
    };
    memoryTypeIndex = VkDeviceMemory.findMemoryType(Vulkan.VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT);
    allocInfo.memoryTypeIndex = memoryTypeIndex;
    VK_CHECK(Vulkan.vkAllocateMemory(VulkanGlobalState._device, &allocInfo, null, &stagingDeviceMemory));
    VkBuffer.createVkBuffer(sizeDeviceMemory, Vulkan.VK_BUFFER_USAGE_TRANSFER_SRC_BIT, &stagingBuffer);
    VK_CHECK(Vulkan.vkBindBufferMemory(VulkanGlobalState._device, stagingBuffer, stagingDeviceMemory, 0));

    memoryTypeIndex = VkDeviceMemory.findMemoryType(Vulkan.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
    allocInfo.memoryTypeIndex = memoryTypeIndex;
    VK_CHECK(Vulkan.vkAllocateMemory(VulkanGlobalState._device, &allocInfo, null, dstDeviceMemory));
    defer
    {
        Vulkan.vkDestroyBuffer(VulkanGlobalState._device, stagingBuffer, null);
        Vulkan.vkFreeMemory(VulkanGlobalState._device, stagingDeviceMemory, null);
    }
    var deviceOffset: usize = 0;
    {
        var bufferOffset: usize = 0;
        var data: ?*anyopaque = undefined;
        _ = Vulkan.vkMapMemory(VulkanGlobalState._device, stagingDeviceMemory, 0, sizeDeviceMemory, 0, &data);
        for(0..numImages) |imageIndex|
        {
            const image = &images[imageIndex];
            VK_CHECK(Vulkan.vkBindImageMemory(VulkanGlobalState._device, textures[imageIndex].vkImage, dstDeviceMemory.*, deviceOffset));
            VkImage.createVkImageView(image.mipsCount, textures[imageIndex].vkImage, image.format, Vulkan.VK_IMAGE_ASPECT_COLOR_BIT, &textures[imageIndex].vkImageView);
            memcpyDstAlign((@as([*]u8, @ptrCast(data))+deviceOffset), buffer+bufferOffset, image.size);
            bufferOffset+=image.size;
            deviceOffset += images_full_sizes[imageIndex];
        }
    }
//     memcpyDstAlign(@ptrCast(data), buffer, sizeDeviceMemory);
    Vulkan.vkUnmapMemory(VulkanGlobalState._device, stagingDeviceMemory);

    const cmdBeginInfo = Vulkan.VkCommandBufferBeginInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO,
        .flags = Vulkan.VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT,
    };
    // = Vulkan.vkBeginCommandBuffer(VulkanGlobalState._commandBuffers[0], &cmdBeginInfo);

    const submitInfo = Vulkan.VkSubmitInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_SUBMIT_INFO,
        .commandBufferCount = 1,
        .pCommandBuffers = &VulkanGlobalState._commandBuffers[0],
    };

    // перший бар'єр
    var barrier = Vulkan.VkImageMemoryBarrier
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER,
        .oldLayout =Vulkan. VK_IMAGE_LAYOUT_UNDEFINED,
        .newLayout = Vulkan.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,
        .srcQueueFamilyIndex = Vulkan.VK_QUEUE_FAMILY_IGNORED,
        .dstQueueFamilyIndex = Vulkan.VK_QUEUE_FAMILY_IGNORED,
        .subresourceRange = Vulkan.VkImageSubresourceRange
        {
            .aspectMask = Vulkan.VK_IMAGE_ASPECT_COLOR_BIT,
            .baseMipLevel = 0,
            .levelCount = 1,
            .baseArrayLayer = 0,
            .layerCount = 1,
        },
    };

    barrier.srcAccessMask = 0;
    barrier.dstAccessMask = Vulkan.VK_ACCESS_TRANSFER_WRITE_BIT;
    _ = Vulkan.vkBeginCommandBuffer(VulkanGlobalState._commandBuffers[0], &cmdBeginInfo);
    for(0..numImages) |imageIndex|
    {
        barrier.image = textures[imageIndex].vkImage;
        barrier.subresourceRange.levelCount = images[imageIndex].mipsCount;
        Vulkan.vkCmdPipelineBarrier(
            VulkanGlobalState._commandBuffers[0],
            Vulkan.VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT, Vulkan.VK_PIPELINE_STAGE_TRANSFER_BIT,
            0,
            0, null,
            0, null,
            1, &barrier
        );
    }

    VK_CHECK(Vulkan.vkEndCommandBuffer(VulkanGlobalState._commandBuffers[0]));
    VK_CHECK(Vulkan.vkQueueSubmit(VulkanGlobalState._graphicsQueue, 1, &submitInfo, null));
    _ = Vulkan.vkQueueWaitIdle(VulkanGlobalState._graphicsQueue);

    // копіювання
    var region = Vulkan.VkBufferImageCopy
    {
        //.bufferOffset = 0,
        .bufferRowLength = 0,
        .bufferImageHeight = 0,

        .imageSubresource = Vulkan.VkImageSubresourceLayers
        {
            .aspectMask = Vulkan.VK_IMAGE_ASPECT_COLOR_BIT,
            .mipLevel = 0,
            .baseArrayLayer = 0,
            .layerCount = 1,
        },
        .imageOffset = .{.x = 0, .y = 0, .z = 0},
        .imageExtent = Vulkan.VkExtent3D
        {
            .depth = 1,
        },
    };
    VK_CHECK(Vulkan.vkBeginCommandBuffer(VulkanGlobalState._commandBuffers[0], &cmdBeginInfo));
    deviceOffset = 0;
    for(0..numImages) |imageIndex|
    {
        const image = &images[imageIndex];
        var mipWidth: usize = image.width;
        var mipHeight: usize = image.height;
        var mipSize: usize = image.mipSize;
        var bufferOffset: usize = deviceOffset;
        for(0..image.mipsCount) |mipIndex|
        {
            region.imageSubresource.mipLevel = @intCast(mipIndex);
            region.bufferOffset = bufferOffset;
            region.imageExtent.width = @intCast(mipWidth);
            region.imageExtent.height = @intCast(mipHeight);
            Vulkan.vkCmdCopyBufferToImage(VulkanGlobalState._commandBuffers[0], stagingBuffer, textures[imageIndex].vkImage, Vulkan.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, &region);
            bufferOffset += mipSize;
            mipWidth /= 2;
            mipHeight /= 2;
            mipSize /= 4;
            mipSize += ((image.alignment - mipSize % image.alignment) % image.alignment);
        }
        deviceOffset += images_full_sizes[imageIndex];
    }

    VK_CHECK(Vulkan.vkEndCommandBuffer(VulkanGlobalState._commandBuffers[0]));
    VK_CHECK(Vulkan.vkQueueSubmit(VulkanGlobalState._graphicsQueue, 1, &submitInfo, null));
    _ = Vulkan.vkQueueWaitIdle(VulkanGlobalState._graphicsQueue);

    //другий бар'єр
    barrier.oldLayout = Vulkan.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL;
    barrier.newLayout = Vulkan.VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;

    barrier.srcAccessMask = Vulkan.VK_ACCESS_TRANSFER_WRITE_BIT;
    barrier.dstAccessMask = Vulkan.VK_ACCESS_SHADER_READ_BIT;

    VK_CHECK(Vulkan.vkBeginCommandBuffer(VulkanGlobalState._commandBuffers[0], &cmdBeginInfo));

    for(0..numImages) |imageIndex|
    {
        barrier.image = textures[imageIndex].vkImage;
        barrier.subresourceRange.levelCount = images[imageIndex].mipsCount;
        Vulkan.vkCmdPipelineBarrier(
            VulkanGlobalState._commandBuffers[0],
            Vulkan.VK_PIPELINE_STAGE_TRANSFER_BIT, Vulkan.VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT,
            0,
            0, null,
            0, null,
            1, &barrier
        );
    }
    VK_CHECK(Vulkan.vkEndCommandBuffer(VulkanGlobalState._commandBuffers[0]));
    VK_CHECK(Vulkan.vkQueueSubmit(VulkanGlobalState._graphicsQueue, 1, &submitInfo, null));
    _ = Vulkan.vkQueueWaitIdle(VulkanGlobalState._graphicsQueue);
}
pub fn clb_custom_read(dirfd: fd_t, path: [*:0]const u8, archive: *ArchiveGPU) void
{
//     _ = archive;
//     const file: std.fs.File = std.fs.cwd().openFileZ(path, .{}) catch
//     {
//         print("custom clb not found!\n", .{});exit(0);
//     };
//     defer file.close();
//     const stat = file.stat() catch unreachable;
//     const file_size: usize = stat.size;
    const filefd: fd_t = CustomFS.openat(dirfd, path, .{.ACCMODE = .RDONLY});
    var fileStat: linux.Stat = undefined;
    _ = CustomFS.fstat(filefd, &fileStat);
    const fileSize: u64 = @intCast(fileStat.size);
    const memoryBuffer = PageAllocator.map(fileSize);
    defer PageAllocator.unmap(memoryBuffer);
    const fileBuffer = memoryBuffer.ptr;
    _ = CustomFS.read(filefd, fileBuffer, fileSize);
    _ = CustomFS.close(filefd);
    var fileBufferPtrItr = fileBuffer;
    if(alignPtrCast(*u32, fileBufferPtrItr).* != @as(u32, @bitCast([4]u8{'C', 'R', 'L', 'C'})))
    {
        print("incorrect clb signature!\n", .{});
        exit(0);
    }
    archive.texturesCount = fileBufferPtrItr[4];
//     archive.meshesCount = fileBufferPtrItr[5];
    fileBufferPtrItr+=6;
    stdout.print("texturesCount: {d}\n", .{archive.texturesCount}) catch unreachable;
//     stdout.print("meshesCount: {d}\n", .{archive.meshesCount}) catch unreachable;
    archive.textures = (GlobalState.allocator.alloc(Texture, archive.texturesCount) catch unreachable).ptr;
//     archive.meshes = (GlobalState.allocator.alloc(ArchiveCPU.Mesh, archive.meshesCount) catch unreachable).ptr;

    const textures = (GlobalState.allocator.alloc(Image, archive.texturesCount) catch unreachable).ptr;
    defer GlobalState.allocator.free(textures[0..archive.texturesCount]);
    var texturesSize: u64 = 0;
    for(textures[0..archive.texturesCount]) |*texture|
    {
        const nameLen: u64 = fileBufferPtrItr[0];
        fileBufferPtrItr+=1;
        stdout.print("{s}\n", .{fileBufferPtrItr[0..nameLen]}) catch unreachable;
        fileBufferPtrItr+=nameLen;
        texture.size = readFromPtr(u32, fileBufferPtrItr);
        texture.mipSize = readFromPtr(u32, fileBufferPtrItr+4);
        texture.width = readFromPtr(u16, fileBufferPtrItr+8);
        texture.height = readFromPtr(u16, fileBufferPtrItr+10);
        texture.format = readFromPtr(u32, fileBufferPtrItr+12);
        texture.alignment = fileBufferPtrItr[16];
        texture.mipsCount = fileBufferPtrItr[17];
//         const textureSize: u64 = readFromPtr(u32, fileBufferPtrItr);
        fileBufferPtrItr+=18;
        texturesSize+=texture.size;
    }
    const texturesBuffer = PageAllocator.map(texturesSize);
    memcpyDstAlign(texturesBuffer.ptr, fileBufferPtrItr, texturesSize);
    loadTextures(texturesBuffer.ptr, textures, archive.textures, archive.texturesCount, &archive.texturesVkDeviceMemory);
    PageAllocator.unmap(texturesBuffer);

//     for(archive.meshes[0..archive.meshesCount]) |*mesh|
//     {
//         const nameLen: u64 = fileBufferPtrItr[0];
//         fileBufferPtrItr+=1;
//         stdout.print("{s}\n", .{fileBufferPtrItr[0..nameLen]}) catch unreachable;
//         fileBufferPtrItr+=nameLen;
//         mesh.vertexBufferSize = readFromPtr(u32, fileBufferPtrItr);
//         mesh.indexBufferSize = readFromPtr(u32, fileBufferPtrItr+4);
//         fileBufferPtrItr+=8;
//         mesh.vertexBuffer = PageAllocator.map(mesh.vertexBufferSize);
//         mesh.indexBuffer = PageAllocator.map(mesh.indexBufferSize);
//         CustomMem.memcpy(mesh.vertexBuffer, fileBufferPtrItr, mesh.vertexBufferSize);
//         fileBufferPtrItr+=mesh.vertexBufferSize;
//         CustomMem.memcpy(mesh.indexBuffer, fileBufferPtrItr, mesh.indexBufferSize);
//         fileBufferPtrItr+=mesh.indexBufferSize;
//     }
//     var buffers: [512][*]u8 = undefined;
//     var buffersSizes: [512]u64 = undefined;
//
//     if(archive.texturesCount > 0)
//     {
//         VkImage.createVkImages__VkImageViews__VkDeviceMemory_AoS_dst(&images, @ptrCast(archive.textures), @sizeOf(Image.Texture), archive.texturesCount, &archive.texturesVkDeviceMemory);
//     }
//     if(archive.meshesCount > 0)
//     {
//         VkBuffer.createVkBuffers__VkDeviceMemory_SoA(Vulkan.VK_BUFFER_USAGE_STORAGE_BUFFER_BIT, &buffers, &buffersSizes, archive.meshes_AoS.vkBuffers, archive.meshesCount*2, &archive.meshesVkDeviceMemory);
//     }
//     GlobalState.bw.flush() catch unreachable;
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
    const descriptorSetLayoutBindings = [2]Vulkan.VkDescriptorSetLayoutBinding
    {
//         .{
//             .binding = 0,
//             .descriptorCount = 1,
//             .descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_STORAGE_BUFFER,
//             .pImmutableSamplers = null,
//             .stageFlags = Vulkan.VK_SHADER_STAGE_VERTEX_BIT,
//         },
        .{
            .binding = 0,
            .descriptorCount = archive.texturesCount,
            .descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE,
            .pImmutableSamplers = null,
            .stageFlags = Vulkan.VK_SHADER_STAGE_FRAGMENT_BIT,
        },
        .{
            .binding = 1,
            .descriptorCount = 1,
            .descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_SAMPLER,
            .pImmutableSamplers = &VulkanGlobalState._textureSampler,
            .stageFlags = Vulkan.VK_SHADER_STAGE_FRAGMENT_BIT,
        },
    };
    const layoutInfo = Vulkan.VkDescriptorSetLayoutCreateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO,
        .bindingCount = descriptorSetLayoutBindings.len,
        .pBindings = &descriptorSetLayoutBindings,
    };
    VK_CHECK(Vulkan.vkCreateDescriptorSetLayout(VulkanGlobalState._device, &layoutInfo, null, &archive.descriptorSetLayout));

    const poolSizes = [2]Vulkan.VkDescriptorPoolSize
    {
        .{
            .type = Vulkan.VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE,
            .descriptorCount = archive.texturesCount,
        },
//         .{
//             .type = Vulkan.VK_DESCRIPTOR_TYPE_STORAGE_BUFFER,
//             .descriptorCount = archive.meshesCount,
//         },
        .{
            .type = Vulkan.VK_DESCRIPTOR_TYPE_SAMPLER,
            .descriptorCount = 1,
        },
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

    const allocInfo = Vulkan.VkDescriptorSetAllocateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO,
        .descriptorPool = archive.descriptorPool,
        .descriptorSetCount = 1,
        .pSetLayouts = &archive.descriptorSetLayout,
    };

    VK_CHECK(Vulkan.vkAllocateDescriptorSets(VulkanGlobalState._device, &allocInfo, &archive.descriptorSet));

    var textureInfo: [256]Vulkan.VkDescriptorImageInfo = undefined;
    for(0..archive.texturesCount) |i|
    {
        textureInfo[i].imageLayout = Vulkan.VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;
        textureInfo[i].imageView = archive.textures[i].vkImageView;
        //      textureInfo[i].sampler = VulkanGlobalState._textureSampler;
    }

    const descriptorWrites = [1]Vulkan.VkWriteDescriptorSet
    {
        .{
            .sType = Vulkan.VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET,
            .dstSet = archive.descriptorSet,
            .dstBinding = 0,
            .dstArrayElement = 0,
            .descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE,
            .descriptorCount = archive.texturesCount,
            .pImageInfo = &textureInfo,
        },
        //         .{
        //             .sType = Vulkan.VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET,
        //             .dstSet = descriptorSet.*,
        //             .dstBinding = 1,
        //             .dstArrayElement = 0,
        //             .descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_SAMPLER,
        //             .descriptorCount = 1,
        //             .pImageInfo = &samplerInfo,
        //         },
    };

    Vulkan.vkUpdateDescriptorSets(VulkanGlobalState._device, descriptorWrites.len, &descriptorWrites, 0, null);
}
