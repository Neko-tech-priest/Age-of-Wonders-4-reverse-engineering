const std = @import("std");
const linux = std.os.linux;
const mem = std.mem;
const exit = std.process.exit;
const fd_t = std.posix.fd_t;
const builtin = @import("builtin");

const CustomFS = @import("CustomFS.zig");
const CustomMem = @import("CustomMem.zig");
const alignPtrCast = CustomMem.alignPtrCast;
// const allocInFixedBuffer = CustomMem.allocInFixedBuffer;
// const allocInFixedBufferT = CustomMem.allocInFixedBufferT;
const readFromPtr = CustomMem.readFromPtr;
const memcpy = CustomMem.memcpy;
const memcpyDstAlign = CustomMem.memcpyDstAlign;
const ptrOnValue = CustomMem.ptrOnValue;

const GlobalState = @import("GlobalState.zig");
const PageAllocator = @import("PageAllocator.zig");

const Texture = @import("Texture.zig").Texture;
const Vulkan = @import("Vulkan.zig");
const VkBuffer = @import("VkBuffer.zig");
const VkImage = @import("VkImage.zig");
const VkDeviceMemory = @import("VkDeviceMemory.zig");
const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;

const Hex = @import("Hex.zig");

const main = @import("main.zig");
pub const ArchiveGPU = struct
{
    const Mesh = struct
    {
        indexVkBufferOffset: u32,
        vertexVkBufferOffset: u32,
        verticesCount: u16,
        indicesCount: u16,
    };
    textures: [*]Texture,
    meshes: [*]Mesh,
    texturesCount: u16,
    meshesCount: u16,
    texturesVkDeviceMemory: Vulkan.VkDeviceMemory,
    meshesVkBuffer: Vulkan.VkBuffer,
    meshesVkDeviceMemory: Vulkan.VkDeviceMemory,
    meshesVkDeviceAddress: Vulkan.VkDeviceAddress,
    descriptorSetLayout: Vulkan.VkDescriptorSetLayout,
    descriptorPool: Vulkan.VkDescriptorPool,
    descriptorSet: Vulkan.VkDescriptorSet,
    pub fn unload(self: ArchiveGPU) void
    {
        for(0..self.texturesCount) |i|
            self.textures[i].unload();
        Vulkan.vkFreeMemory(VulkanGlobalState._device, self.texturesVkDeviceMemory, null);

        Vulkan.vkDestroyBuffer(VulkanGlobalState._device, self.meshesVkBuffer, null);
        Vulkan.vkFreeMemory(VulkanGlobalState._device, self.meshesVkDeviceMemory, null);
// //         for(0..self.meshesCount)
//         self.meshes_AoS.unload(self.meshesCount);
//         Vulkan.vkFreeMemory(VulkanGlobalState._device, self.meshesVkDeviceMemory, null);
//
        GlobalState.allocator.free(self.textures[0..self.texturesCount]);
        GlobalState.allocator.free(self.meshes[0..self.meshesCount]);
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
const MeshData = struct
{
    indicesBufferSize: u32,
    verticesBufferSize: u32,
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
fn loadTextures(buffer: [*]const u8, images: [*] Image, textures: [*]Texture, numImages: u64, dstDeviceMemory: *Vulkan.VkDeviceMemory) void
{
    var sizeDeviceMemory: usize = 0;
//     var images_full_sizes: [512]u64 = undefined;
    var imageBindingOffset: [512]u64 = undefined;
    for(0..numImages) |imageIndex|
    {
        const image = &images[imageIndex];
//         image.mipsCount = 1;
//         image.size = image.mipSize;
        createVkImage(image, Vulkan.VK_IMAGE_USAGE_TRANSFER_DST_BIT | Vulkan.VK_IMAGE_USAGE_SAMPLED_BIT, &textures[imageIndex].vkImage);
        var memRequirements: Vulkan.VkMemoryRequirements = undefined;
        Vulkan.vkGetImageMemoryRequirements(VulkanGlobalState._device, textures[imageIndex].vkImage, &memRequirements);
//         const alignment = 65536;
//         sizeDeviceMemory = sizeDeviceMemory + ((alignment - sizeDeviceMemory % alignment) % alignment);
//         imageBindingOffset[imageIndex] = sizeDeviceMemory;
//         sizeDeviceMemory += memRequirements.size;
//         print("imageBindingOffset: {d}\n", .{imageBindingOffset[imageIndex]});
//         print("sizeDeviceMemory: {d}\n", .{sizeDeviceMemory});
        imageBindingOffset[imageIndex] = sizeDeviceMemory + ((memRequirements.alignment - sizeDeviceMemory % memRequirements.alignment) % memRequirements.alignment);
        sizeDeviceMemory = imageBindingOffset[imageIndex] + memRequirements.size;
//         print("imageSize: {d}\n", .{image.size});
//         print("imageFullSize: {d}\n", .{imageFullSize});
//         print("alignment: {d}\n", .{memRequirements.alignment});
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
//             print("textuireIndex: {d}\n", .{imageIndex});
            const image = &images[imageIndex];
            deviceOffset = imageBindingOffset[imageIndex];
            VK_CHECK(Vulkan.vkBindImageMemory(VulkanGlobalState._device, textures[imageIndex].vkImage, dstDeviceMemory.*, deviceOffset));
//             exit(0);
            VkImage.createVkImageView(image.mipsCount, textures[imageIndex].vkImage, image.format, Vulkan.VK_IMAGE_ASPECT_COLOR_BIT, &textures[imageIndex].vkImageView);
            memcpyDstAlign((@as([*]u8, @ptrCast(data))+deviceOffset), buffer+bufferOffset, image.size);
            bufferOffset+=image.size;
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

    VK_CHECK(Vulkan.vkBeginCommandBuffer(VulkanGlobalState._commandBuffers[0], &cmdBeginInfo));
    // копіювання
    var regions: [16]Vulkan.VkBufferImageCopy = undefined;
    @memset(&regions,
            .{
                .imageSubresource = Vulkan.VkImageSubresourceLayers
                {
                    .aspectMask = Vulkan.VK_IMAGE_ASPECT_COLOR_BIT,
                    .layerCount = 1,
                },
                .imageExtent = Vulkan.VkExtent3D
                {
                    .depth = 1,
                },
            }
    );
    for(0..numImages) |imageIndex|
    {
        const image = &images[imageIndex];
        var mipWidth: usize = image.width;
        var mipHeight: usize = image.height;
        var mipSize: usize = image.mipSize;
        var bufferOffset: usize = imageBindingOffset[imageIndex];
        for(0..image.mipsCount) |mipIndex|
        {
            regions[mipIndex].imageSubresource.mipLevel = @intCast(mipIndex);
            regions[mipIndex].bufferOffset = bufferOffset;
            regions[mipIndex].imageExtent.width = @intCast(mipWidth);
            regions[mipIndex].imageExtent.height = @intCast(mipHeight);
            bufferOffset += mipSize;
            mipWidth /= 2;
//             if(mipWidth == 0)
//                 mipWidth = 1;
            mipHeight /= 2;
            if(mipHeight == 0)
                mipHeight = 1;
            mipSize /= 4;
            mipSize += ((image.alignment - mipSize % image.alignment) % image.alignment);
        }
        Vulkan.vkCmdCopyBufferToImage(VulkanGlobalState._commandBuffers[0], stagingBuffer, textures[imageIndex].vkImage, Vulkan.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, image.mipsCount, &regions);
    }
//     print("mipWidth {d}\nmipHeight: {d}\n", .{mipWidth, mipHeight});
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
fn loadMeshes(buffer: [*] u8, meshesData: [*]const MeshData, meshesOffsets: [*]ArchiveGPU.Mesh, meshesCount: u64, vkBuffer: *Vulkan.VkBuffer, vkDeviceMemory: *Vulkan.VkDeviceMemory) void
{
//     _ = buffer;
//     _ = meshesDescriptors;
//     _ = deviceMemory;
    var srcSize: u64 = 0;
    var sizeDeviceMemory: u64 = 0;
    var memRequirements: Vulkan.VkMemoryRequirements = undefined;
    var indexBufferOffsets: [512]u64 = undefined;
    var vertexBufferOffsets: [512]u64 = undefined;
//     var
    for(0..meshesCount) |bufferIndex|
    {
        indexBufferOffsets[bufferIndex] = sizeDeviceMemory;
        sizeDeviceMemory += meshesData[bufferIndex].indicesBufferSize;
        vertexBufferOffsets[bufferIndex] = sizeDeviceMemory;
        sizeDeviceMemory += meshesData[bufferIndex].verticesBufferSize;
        meshesOffsets[bufferIndex].indexVkBufferOffset = @intCast(indexBufferOffsets[bufferIndex]);
        meshesOffsets[bufferIndex].vertexVkBufferOffset = @intCast(vertexBufferOffsets[bufferIndex]);
    }
    srcSize = sizeDeviceMemory;
    VkBuffer.createVkBuffer(sizeDeviceMemory, Vulkan.VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT | Vulkan.VK_BUFFER_USAGE_INDEX_BUFFER_BIT, vkBuffer);
    Vulkan.vkGetBufferMemoryRequirements(VulkanGlobalState._device, vkBuffer.*, &memRequirements);
    sizeDeviceMemory = memRequirements.size;
//     print("alignment: {d}\n", .{memRequirements.alignment});
//     print("{d}\n", .{(memRequirements.alignment - memRequirements.size % memRequirements.alignment) % memRequirements.alignment});
    var dstBuffer: Vulkan.VkBuffer = undefined;
    var stagingBuffer: Vulkan.VkBuffer = undefined;
    var stagingDeviceMemory: Vulkan.VkDeviceMemory = undefined;

    var memoryTypeIndex: u32 = undefined;

    var memoryAllocateFlagsInfo = Vulkan.VkMemoryAllocateFlagsInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_FLAGS_INFO,
        .flags = Vulkan.VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_BIT,
    };
    var allocInfo = Vulkan.VkMemoryAllocateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO,
        .allocationSize = sizeDeviceMemory,
        .pNext = &memoryAllocateFlagsInfo
    };
    memoryTypeIndex = VkDeviceMemory.findMemoryType(Vulkan.VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT);
    allocInfo.memoryTypeIndex = memoryTypeIndex;
    VK_CHECK(Vulkan.vkAllocateMemory(VulkanGlobalState._device, &allocInfo, null, &stagingDeviceMemory));
    VkBuffer.createVkBuffer(sizeDeviceMemory, Vulkan.VK_BUFFER_USAGE_TRANSFER_SRC_BIT, &stagingBuffer);
    VK_CHECK(Vulkan.vkBindBufferMemory(VulkanGlobalState._device, stagingBuffer, stagingDeviceMemory, 0));

    memoryTypeIndex = VkDeviceMemory.findMemoryType(Vulkan.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
    allocInfo.memoryTypeIndex = memoryTypeIndex;
    VK_CHECK(Vulkan.vkAllocateMemory(VulkanGlobalState._device, &allocInfo, null, vkDeviceMemory));
    VkBuffer.createVkBuffer(sizeDeviceMemory, Vulkan.VK_BUFFER_USAGE_TRANSFER_DST_BIT, &dstBuffer);
    VK_CHECK(Vulkan.vkBindBufferMemory(VulkanGlobalState._device, dstBuffer, vkDeviceMemory.*, 0));

    defer
    {
        Vulkan.vkDestroyBuffer(VulkanGlobalState._device, dstBuffer, null);
        Vulkan.vkDestroyBuffer(VulkanGlobalState._device, stagingBuffer, null);
        Vulkan.vkFreeMemory(VulkanGlobalState._device, stagingDeviceMemory, null);
    }
    var data: ?*anyopaque = undefined;
    _ = Vulkan.vkMapMemory(VulkanGlobalState._device, stagingDeviceMemory, 0, sizeDeviceMemory, 0, &data);
    VK_CHECK(Vulkan.vkBindBufferMemory(VulkanGlobalState._device,  vkBuffer.*, vkDeviceMemory.*, 0));

//     var bufferOffset: u64 = 0;
//     for(0..meshesCount) |bufferIndex|
//     {
//         memcpy(@as([*]u8, @ptrCast(data))+indexBufferOffsets[bufferIndex], buffer+bufferOffset, meshesData[bufferIndex].indicesBufferSize);
//         bufferOffset+=meshesData[bufferIndex].indicesBufferSize;
//         memcpy(@as([*]u8, @ptrCast(data))+vertexBufferOffsets[bufferIndex], buffer+bufferOffset, meshesData[bufferIndex].verticesBufferSize);
//         bufferOffset+=meshesData[bufferIndex].verticesBufferSize;
//     }
//     memcpy(@ptrCast(data), buffer+indexBufferOffsets[160], sizeDeviceMemory);
    memcpy(@ptrCast(data), buffer, srcSize);
    Vulkan.vkUnmapMemory(VulkanGlobalState._device, stagingDeviceMemory);

    const cmdBeginInfo = Vulkan.VkCommandBufferBeginInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO,
        .flags = Vulkan.VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT,
    };
    _ = Vulkan.vkBeginCommandBuffer(VulkanGlobalState._commandBuffers[0], &cmdBeginInfo);

    const copyRegion = Vulkan.VkBufferCopy
    {
        .size = sizeDeviceMemory,
    };
    //copyRegion.srcOffset = 0; // Optional
    //copyRegion.dstOffset = 0; // Optional
    Vulkan.vkCmdCopyBuffer(VulkanGlobalState._commandBuffers[0], stagingBuffer, dstBuffer, 1, &copyRegion);

    _ = Vulkan.vkEndCommandBuffer(VulkanGlobalState._commandBuffers[0]);

    const submitInfo = Vulkan.VkSubmitInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_SUBMIT_INFO,
        .commandBufferCount = 1,
        .pCommandBuffers = &VulkanGlobalState._commandBuffers[0],
    };

    _ = Vulkan.vkQueueSubmit(VulkanGlobalState._graphicsQueue, 1, &submitInfo, null);
    _ = Vulkan.vkQueueWaitIdle(VulkanGlobalState._graphicsQueue);
}
pub fn clb_custom_read(dirfd: fd_t, path: []const u8, archive: *ArchiveGPU) void
{
    const stdout = GlobalState.stdout;
    const filefd: fd_t = CustomFS.openat(dirfd, @ptrCast(path.ptr), .{.ACCMODE = .RDONLY});
    var fileStat: linux.Stat = undefined;
    _ = CustomFS.fstat(filefd, &fileStat);
    const fileSize: u64 = @intCast(fileStat.size);
    const memoryBuffer = PageAllocator.map(fileSize);
    defer PageAllocator.unmap(memoryBuffer, fileSize);
    const fileBuffer = memoryBuffer;
    _ = CustomFS.read(filefd, fileBuffer, fileSize);
    _ = CustomFS.close(filefd);
    var fileBufferPtrItr = fileBuffer;
    if(alignPtrCast(*u32, fileBufferPtrItr).* != @as(u32, @bitCast([4]u8{'C', 'R', 'L', 'C'})))
    {
        const string = "incorrect clb signature!\n";
        _ = CustomFS.write(1, string, string.len);
        exit(0);
    }
//     archive.texturesCount = fileBufferPtrItr[4];
    archive.texturesCount = alignPtrCast(*u16, fileBufferPtrItr+4).*;
    archive.meshesCount = alignPtrCast(*u16, fileBufferPtrItr+6).*;
    fileBufferPtrItr+=8;
    stdout.print("texturesCount: {d}\n", .{archive.texturesCount}) catch unreachable;
    stdout.print("meshesCount: {d}\n", .{archive.meshesCount}) catch unreachable;
    const hashesCount: u64 = archive.texturesCount+archive.meshesCount;
    const resourceID: [*]u16 = @ptrCast(&main.resourceID);
    for(0..main.hashes.len) |enumHash|
    {
        for(0..archive.texturesCount) |archiveHash|
        {
            if(main.hashes[enumHash] == alignPtrCast([*]u64, fileBufferPtrItr)[archiveHash])
            {
//                 main.resourceIDs[enumHash] = @intCast(archiveHash);
                resourceID[enumHash] = @intCast(archiveHash);
                break;
            }
        }
        const meshesHashesPtr = fileBufferPtrItr+archive.texturesCount*8;
        for(0..archive.meshesCount) |archiveHash|
        {
            if(main.hashes[enumHash] == alignPtrCast([*]u64, meshesHashesPtr)[archiveHash])
            {
//                 main.resourceIDs[enumHash] = @intCast(archiveHash);
                resourceID[enumHash] = @intCast(archiveHash);
                break;
            }
        }
    }
    fileBufferPtrItr+=hashesCount*8;
//     exit(0);
//     stdout.print("meshesCount: {d}\n", .{archive.meshesCount}) catch unreachable;
    archive.textures = (GlobalState.allocator.alloc(Texture, archive.texturesCount) catch unreachable).ptr;
    archive.meshes = (GlobalState.allocator.alloc(ArchiveGPU.Mesh, archive.meshesCount) catch unreachable).ptr;
//     archive.meshes = (GlobalState.allocator.alloc(ArchiveCPU.Mesh, archive.meshesCount) catch unreachable).ptr;

    const textures = (GlobalState.allocator.alloc(Image, archive.texturesCount) catch unreachable).ptr;
    const meshes = (GlobalState.allocator.alloc(MeshData, archive.meshesCount) catch unreachable).ptr;
    defer GlobalState.allocator.free(textures[0..archive.texturesCount]);
    defer GlobalState.allocator.free(meshes[0..archive.meshesCount]);
    var texturesSize: u64 = 0;
    var meshesSize: u64 = 0;
    for(textures[0..archive.texturesCount]) |*texture|
    {
//         const nameLen: u64 = fileBufferPtrItr[0];
//         fileBufferPtrItr+=1;
//         stdout.print("{s}\n", .{fileBufferPtrItr[0..nameLen]}) catch unreachable;
//         fileBufferPtrItr+=nameLen;
        texture.size = readFromPtr(u32, fileBufferPtrItr);
        texture.mipSize = readFromPtr(u32, fileBufferPtrItr+4);
        texture.width = readFromPtr(u16, fileBufferPtrItr+8);
        texture.height = readFromPtr(u16, fileBufferPtrItr+10);
        texture.format = readFromPtr(u32, fileBufferPtrItr+12);
        texture.alignment = fileBufferPtrItr[16];
        texture.mipsCount = fileBufferPtrItr[17];
        fileBufferPtrItr+=18;
        texturesSize+=texture.size;
    }
    for(meshes[0..archive.meshesCount], archive.meshes[0..archive.meshesCount]) |*mesh, *meshGPU|
    {
        mesh.indicesBufferSize = readFromPtr(u32, fileBufferPtrItr);
        mesh.verticesBufferSize = readFromPtr(u32, fileBufferPtrItr+4);
        meshGPU.verticesCount = readFromPtr(u16, fileBufferPtrItr+8);
        meshGPU.indicesCount = @intCast(mesh.indicesBufferSize>>1);
        fileBufferPtrItr+=10;
        meshesSize += mesh.indicesBufferSize+mesh.verticesBufferSize;
    }
    loadTextures(fileBufferPtrItr, textures, archive.textures, archive.texturesCount, &archive.texturesVkDeviceMemory);
    fileBufferPtrItr+=texturesSize;
//     meshesSize = 0;
//     for(0..archive.meshesCount) |index|
//     {
//         const indicesBufferSize = meshes[index].indicesBufferSize;
//         const verticesBufferSize = meshes[index].verticesBufferSize;
//         if(index == main.resourceID.@"Temperate_Forest_06_PineTrees")
//         {
//             print("{d}\n", .{indicesBufferSize});
//             print("{d}\n", .{verticesBufferSize/64});
//             for(0..1) |i|
//             {
//                 print("{d}\t", .{readFromPtr(f32, fileBufferPtrItr+meshesSize+indicesBufferSize+52*288+i*12)});
//                 print("{d}\t", .{readFromPtr(f32, fileBufferPtrItr+meshesSize+indicesBufferSize+52*288+i*12+4)});
//                 print("{d}\t", .{readFromPtr(f32, fileBufferPtrItr+meshesSize+indicesBufferSize+52*288+i*12+8)});
//                 print("\n", .{});
//             }
//         }
//         meshesSize += indicesBufferSize+verticesBufferSize;
//     }
//     exit(0);
    loadMeshes(fileBufferPtrItr, meshes, archive.meshes, archive.meshesCount, &archive.meshesVkBuffer, &archive.meshesVkDeviceMemory);
    const VkBufferDeviceAddressInfo = Vulkan.VkBufferDeviceAddressInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO,
        .buffer = archive.meshesVkBuffer,
    };
    archive.meshesVkDeviceAddress = Vulkan.vkGetBufferDeviceAddress(VulkanGlobalState._device, &VkBufferDeviceAddressInfo);
//     PageAllocator.unmap(texturesBuffer);
//     PageAllocator.unmap(meshesBuffer);

    createDescriptorsData(archive);
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

    var textureInfo: [65536/24]Vulkan.VkDescriptorImageInfo = undefined;
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
pub fn bindDescriptorSets(archive: *ArchiveGPU) void
{
    const cmdBeginInfo = Vulkan.VkCommandBufferBeginInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO,
        .flags = Vulkan.VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT,
    };
    _ = Vulkan.vkBeginCommandBuffer(VulkanGlobalState._commandBuffers[0], &cmdBeginInfo);

//     Vulkan.vkCmdBindPipeline(VulkanGlobalState._commandBuffers[0], Vulkan.VK_PIPELINE_BIND_POINT_GRAPHICS, Hex.Hex_Pipeline);
    var descriptorSets: [2]Vulkan.VkDescriptorSet = undefined;
    descriptorSets[0] = archive.descriptorSet;
    descriptorSets[1] = Hex.palette_DescriptorSet;
    Vulkan.vkCmdBindDescriptorSets(VulkanGlobalState._commandBuffers[0], Vulkan.VK_PIPELINE_BIND_POINT_GRAPHICS, Hex.Hex_PipelineLayout, 1, descriptorSets.len, &descriptorSets, 0, null);

    _ = Vulkan.vkEndCommandBuffer(VulkanGlobalState._commandBuffers[0]);

    const submitInfo = Vulkan.VkSubmitInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_SUBMIT_INFO,
        .commandBufferCount = 1,
        .pCommandBuffers = &VulkanGlobalState._commandBuffers[0],
    };

    _ = Vulkan.vkQueueSubmit(VulkanGlobalState._graphicsQueue, 1, &submitInfo, null);
}
