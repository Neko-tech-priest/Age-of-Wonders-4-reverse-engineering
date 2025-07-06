const std = @import("std");
const print = std.debug.print;

const CustomMem = @import("CustomMem.zig");
const memcpy = CustomMem.memcpy;
const memcpyDstAlign = CustomMem.memcpyDstAlign;

// const GlobalState = @import("GlobalState.zig");
// const Vulkan = @import("Vulkan.zig");
const Vulkan = @import("Vulkan.zig");

const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;

const VkBuffer = @import("VkBuffer.zig");
const VkDeviceMemory = @import("VkDeviceMemory.zig");

const Image = @import("Image.zig").Image;
const Texture = @import("Texture.zig").Texture;

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
pub fn createVkImageView(mipsCount: u32, image: Vulkan.VkImage, format: Vulkan.VkFormat, aspectFlags: Vulkan.VkImageAspectFlags, imageView: *Vulkan.VkImageView) void
{
	//_ = mipsCount;
	//print("mipsCount(createVkImageView): {d}\n", .{mipsCount});
	const viewInfo = Vulkan.VkImageViewCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO,
		.image = image,
		.viewType = Vulkan.VK_IMAGE_VIEW_TYPE_2D,
		.format = format,
		.subresourceRange = Vulkan.VkImageSubresourceRange
		{
			.aspectMask = aspectFlags,
			.baseMipLevel = 0,
			.levelCount = mipsCount,
			.baseArrayLayer = 0,
			.layerCount = 1,
		},
	};

	VK_CHECK(Vulkan.vkCreateImageView(VulkanGlobalState._device, &viewInfo, null, imageView));
}
pub fn createVkImages__VkImageViews__VkDeviceMemory(images: [*]const Image, textures: [*]Texture, numImages: usize, dstDeviceMemory: *Vulkan.VkDeviceMemory) void
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
	var data: ?*anyopaque = undefined;
	_ = Vulkan.vkMapMemory(VulkanGlobalState._device, stagingDeviceMemory, 0, sizeDeviceMemory, 0, &data);
	for(0..numImages) |imageIndex|
	{
		const image = &images[imageIndex];
		VK_CHECK(Vulkan.vkBindImageMemory(VulkanGlobalState._device, textures[imageIndex].vkImage, dstDeviceMemory.*, deviceOffset));
		createVkImageView(image.mipsCount, textures[imageIndex].vkImage, image.format, Vulkan.VK_IMAGE_ASPECT_COLOR_BIT, &textures[imageIndex].vkImageView);
		memcpyDstAlign((@as([*]u8, @ptrCast(data))+deviceOffset), image.data, image.size);
		deviceOffset += images_full_sizes[imageIndex];
	}
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
pub fn createVkImages__VkImageViews__VkDeviceMemory_AoS_dst(images: [*]Image, descriptors: [*]u8, descriptorsStructSize: u32, numImages: usize, dstDeviceMemory: *Vulkan.VkDeviceMemory) void
{
	var sizeDeviceMemory: usize = 0;
	var images_full_sizes: [512]u64 = undefined;
	for(0..numImages) |imageIndex|
	{
		const image = &images[imageIndex];
		createVkImage(image, Vulkan.VK_IMAGE_USAGE_TRANSFER_DST_BIT | Vulkan.VK_IMAGE_USAGE_SAMPLED_BIT, @as(*Vulkan.VkImage, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex))));
		var memRequirements: Vulkan.VkMemoryRequirements = undefined;
		Vulkan.vkGetImageMemoryRequirements(VulkanGlobalState._device, @as(*Vulkan.VkImage, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex))).*, &memRequirements);
		images_full_sizes[imageIndex] = (memRequirements.size + ((memRequirements.alignment - memRequirements.size % memRequirements.alignment) % memRequirements.alignment));
		sizeDeviceMemory += images_full_sizes[imageIndex];
		//print("imageFullSize: {d}\n", .{images_full_sizes[imageIndex]});
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
	var data: ?*anyopaque = undefined;
	_ = Vulkan.vkMapMemory(VulkanGlobalState._device, stagingDeviceMemory, 0, sizeDeviceMemory, 0, &data);
	for(0..numImages) |imageIndex|
	{
		const image = &images[imageIndex];
		VK_CHECK(Vulkan.vkBindImageMemory(VulkanGlobalState._device, @as(*Vulkan.VkImage, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex))).*, dstDeviceMemory.*, deviceOffset));
		createVkImageView(image.mipsCount, @as(*Vulkan.VkImage, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex))).*, image.format, Vulkan.VK_IMAGE_ASPECT_COLOR_BIT, @as(*Vulkan.VkImageView, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex+8))));
		memcpyDstAlign((@as([*]u8, @ptrCast(data))+deviceOffset), image.data, image.size);
		deviceOffset += images_full_sizes[imageIndex];
	}
	Vulkan.vkUnmapMemory(VulkanGlobalState._device, stagingDeviceMemory);
	
	//
	const cmdBeginInfo = Vulkan.VkCommandBufferBeginInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO,
		.flags = Vulkan.VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT,
	};
	// = Vulkan.vkBeginCommandBuffer(VulkanGlobalState._commandBuffers[0], &cmdBeginInfo);
	//
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
		barrier.image = @as(*Vulkan.VkImage, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex))).*;
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
	
	//копіювання
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
            if(mipHeight == 0)
            {
//                 print("mipHeight = 0! imageIndex = {d}\n\n", .{imageIndex});
                mipHeight = 1;
            }
			region.imageSubresource.mipLevel = @intCast(mipIndex);
			region.bufferOffset = bufferOffset;
			region.imageExtent.width = @intCast(mipWidth);
			region.imageExtent.height = @intCast(mipHeight);
			Vulkan.vkCmdCopyBufferToImage(VulkanGlobalState._commandBuffers[0], stagingBuffer, @as(*Vulkan.VkImage, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex))).*, Vulkan.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, &region);
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
		barrier.image = @as(*Vulkan.VkImage, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex))).*;
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
pub fn createVkImages__VkImageViews__VkDeviceMemory_AoS(srcStructArray: [*]u8, srcStructSize: u32, descriptors: [*]u8, descriptorsStructSize: u32, numImages: usize, dstDeviceMemory: *Vulkan.VkDeviceMemory) void
{
    var sizeDeviceMemory: usize = 0;
    var images_full_sizes: [512]u64 = undefined;
    for(0..numImages) |imageIndex|
    {
        const image = @as(*Image.Image, @alignCast(@ptrCast(srcStructArray+srcStructSize*imageIndex)));
        createVkImage(image, Vulkan.VK_IMAGE_USAGE_TRANSFER_DST_BIT | Vulkan.VK_IMAGE_USAGE_SAMPLED_BIT, @as(*Vulkan.VkImage, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex))));
        var memRequirements: Vulkan.VkMemoryRequirements = undefined;
        Vulkan.vkGetImageMemoryRequirements(VulkanGlobalState._device, @as(*Vulkan.VkImage, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex))).*, &memRequirements);
        images_full_sizes[imageIndex] = (memRequirements.size + ((memRequirements.alignment - memRequirements.size % memRequirements.alignment) % memRequirements.alignment));
        sizeDeviceMemory += images_full_sizes[imageIndex];
//         print("imageFullSize: {d}\n", .{images_full_sizes[imageIndex]});
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
    var data: ?*anyopaque = undefined;
    _ = Vulkan.vkMapMemory(VulkanGlobalState._device, stagingDeviceMemory, 0, sizeDeviceMemory, 0, &data);
    for(0..numImages) |imageIndex|
    {
        const image = @as(*Image.Image, @alignCast(@ptrCast(srcStructArray+srcStructSize*imageIndex)));
        VK_CHECK(Vulkan.vkBindImageMemory(VulkanGlobalState._device, @as(*Vulkan.VkImage, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex))).*, dstDeviceMemory.*, deviceOffset));
//         createVkImageView(image.mipsCount, @as(*Vulkan.VkImage, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex))).*, image.format, Vulkan.VK_IMAGE_ASPECT_COLOR_BIT, @as(*Vulkan.VkImageView, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex+8))));
//     @memcpy((@as([*]u8, @ptrCast(data))+deviceOffset), image.data[0..image.size]);
//      @memcpy((@as([*]u8, @ptrCast(data))+deviceOffset), image.data[0..image.size]);
        memcpy((@as([*]u8, @ptrCast(data))+deviceOffset), image.data, image.size);
        deviceOffset += images_full_sizes[imageIndex];
    }
    Vulkan.vkUnmapMemory(VulkanGlobalState._device, stagingDeviceMemory);
    
    //
    const cmdBeginInfo = Vulkan.VkCommandBufferBeginInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO,
        .flags = Vulkan.VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT,
    };
    // = Vulkan.vkBeginCommandBuffer(VulkanGlobalState._commandBuffers[0], &cmdBeginInfo);
    //
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
        barrier.image = @as(*Vulkan.VkImage, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex))).*;
        barrier.subresourceRange.levelCount = @as(*Image.Image, @alignCast(@ptrCast(srcStructArray+srcStructSize*imageIndex))).mipsCount;
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
    
    //копіювання
//     var region = Vulkan.VkBufferImageCopy
//     {
//         //.bufferOffset = 0,
//         .bufferRowLength = 0,
//         .bufferImageHeight = 0,
//         
//         .imageSubresource = Vulkan.VkImageSubresourceLayers
//         {
//             .aspectMask = Vulkan.VK_IMAGE_ASPECT_COLOR_BIT,
//             .mipLevel = 0,
//             .baseArrayLayer = 0,
//             .layerCount = 1,
//         },
//         .imageOffset = .{.x = 0, .y = 0, .z = 0},
//         .imageExtent = Vulkan.VkExtent3D
//         {
//             .depth = 1,
//         },
//     };
//     VK_CHECK(Vulkan.vkBeginCommandBuffer(VulkanGlobalState._commandBuffers[0], &cmdBeginInfo));
//     deviceOffset = 0;
//     for(0..numImages) |imageIndex|
//     {
//         const image = @as(*Image.Image, @alignCast(@ptrCast(srcStructArray+srcStructSize*imageIndex)));
//         var mipWidth: usize = image.width;
//         var mipHeight: usize = image.height;
//         var mipSize: usize = image.mipSize;
//         var bufferOffset: usize = deviceOffset;
//         for(0..image.mipsCount) |mipIndex|
//         {
//             region.imageSubresource.mipLevel = @intCast(mipIndex);
//             region.bufferOffset = bufferOffset;
//             region.imageExtent.width = @intCast(mipWidth);
//             region.imageExtent.height = @intCast(mipHeight);
//             Vulkan.vkCmdCopyBufferToImage(VulkanGlobalState._commandBuffers[0], stagingBuffer, @as(*Vulkan.VkImage, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex))).*, Vulkan.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, &region);
//             bufferOffset += mipSize;
//             mipWidth /= 2;
//             mipHeight /= 2;
//             mipSize /= 4;
//         }
//         deviceOffset += images_full_sizes[imageIndex];
//     }
    VK_CHECK(Vulkan.vkBeginCommandBuffer(VulkanGlobalState._commandBuffers[0], &cmdBeginInfo));
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
    deviceOffset = 0;
    for(0..numImages) |imageIndex|
    {
        const image = @as(*Image.Image, @alignCast(@ptrCast(srcStructArray+srcStructSize*imageIndex)));
        var mipWidth: u32 = image.width;
        var mipHeight: u32 = image.height;
        var mipSize: usize = image.mipSize;
        var bufferOffset: usize = deviceOffset;
        for(0..image.mipsCount) |mipIndex|
        {
            regions[mipIndex].imageSubresource.mipLevel = @intCast(mipIndex);
            regions[mipIndex].bufferOffset = bufferOffset;
            regions[mipIndex].imageExtent.width = mipWidth;
            regions[mipIndex].imageExtent.height = mipHeight;
            bufferOffset += mipSize;
            mipWidth /= 2;
            mipHeight /= 2;
            mipSize /= 4;
            mipSize += ((image.alignment - mipSize % image.alignment) % image.alignment);
        }
        Vulkan.vkCmdCopyBufferToImage(VulkanGlobalState._commandBuffers[0], stagingBuffer, @as(*Vulkan.VkImage, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex))).*, Vulkan.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, image.mipsCount, &regions);
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
        barrier.image = @as(*Vulkan.VkImage, @ptrCast(@alignCast(descriptors+descriptorsStructSize*imageIndex))).*;
        barrier.subresourceRange.levelCount = @as(*Image.Image, @alignCast(@ptrCast(srcStructArray+srcStructSize*imageIndex))).mipsCount;
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
pub fn transitionImage(cmd: Vulkan.VkCommandBuffer, image: Vulkan.VkImage, srcStageMask: Vulkan.VkPipelineStageFlags2, dstStageMask: Vulkan.VkPipelineStageFlags2, srcAccessMask: Vulkan.VkAccessFlags2, dstAccessMask: Vulkan.VkAccessFlags2, currentLayout: Vulkan.VkImageLayout, newLayout: Vulkan.VkImageLayout) void
{
    const imageBarrier = Vulkan.VkImageMemoryBarrier2
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER_2,
        .srcStageMask = srcStageMask,
        .srcAccessMask = srcAccessMask,
        .dstStageMask = dstStageMask,
        .dstAccessMask = dstAccessMask,

        .oldLayout = currentLayout,
        .newLayout = newLayout,

        .subresourceRange = Vulkan.VkImageSubresourceRange
        {
            .aspectMask = Vulkan.VK_IMAGE_ASPECT_COLOR_BIT,
            .baseMipLevel = 0,
            // VK_REMAINING_MIP_LEVELS
            .levelCount = 1,
            .baseArrayLayer = 0,
            // VK_REMAINING_ARRAY_LAYERS
            .layerCount = 1,
        },
        .image = image,
    };
    const depInfo = Vulkan.VkDependencyInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_DEPENDENCY_INFO,

        .imageMemoryBarrierCount = 1,
        .pImageMemoryBarriers = &imageBarrier,

    };
    Vulkan.vkCmdPipelineBarrier2(cmd, &depInfo);
}
