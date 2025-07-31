const std = @import("std");

const CustomMem = @import("CustomMem.zig");
const readFromPtr = CustomMem.readFromPtr;
const memcpy = CustomMem.memcpy;
const memcpyDstAlign = CustomMem.memcpyDstAlign;

const GlobalState = @import("GlobalState.zig");
const Vulkan = @import("Vulkan.zig");

const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;

const VkDeviceMemory = @import("VkDeviceMemory.zig");

pub fn createVkBuffer(size: usize, usage:Vulkan.VkBufferUsageFlags, buffer: *Vulkan.VkBuffer) void
{
	const bufferInfo = Vulkan.VkBufferCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO,
		.size = size,
		.usage = usage,
		.sharingMode = Vulkan.VK_SHARING_MODE_EXCLUSIVE,
	};

	VK_CHECK(Vulkan.vkCreateBuffer(VulkanGlobalState._device, &bufferInfo, null, buffer));
}
pub fn createVkBuffer__VkDeviceMemory__HV_DL(usage: Vulkan.VkBufferUsageFlags, size: u32, vkBuffer: *Vulkan.VkBuffer, deviceMemory: *Vulkan.VkDeviceMemory) void
{
	var sizeDeviceMemory: usize = 0;
	var memRequirements: Vulkan.VkMemoryRequirements = undefined;
	createVkBuffer(size, usage, vkBuffer);
	Vulkan.vkGetBufferMemoryRequirements(VulkanGlobalState._device, vkBuffer.*, &memRequirements);
	sizeDeviceMemory = (memRequirements.size + ((memRequirements.alignment - memRequirements.size % memRequirements.alignment) % memRequirements.alignment));

	var memoryTypeIndex: u32 = undefined;
	memoryTypeIndex = VkDeviceMemory.findMemoryType(Vulkan.VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | Vulkan.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);

	const allocInfo = Vulkan.VkMemoryAllocateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO,
		.allocationSize = sizeDeviceMemory,
		.memoryTypeIndex = memoryTypeIndex,
	};
	VK_CHECK(Vulkan.vkAllocateMemory(VulkanGlobalState._device, &allocInfo, null, deviceMemory));
	//createVkBuffer(sizeDeviceMemory, VK_BUFFER_USAGE_TRANSFER_DST_BIT, vkBuffer);
	VK_CHECK(Vulkan.vkBindBufferMemory(VulkanGlobalState._device, vkBuffer.*, deviceMemory.*, 0));
}
pub fn createVkBuffer__VkDeviceMemory(usage: Vulkan.VkBufferUsageFlags, buffer: [*]const u8, size: usize, vkBuffer: *Vulkan.VkBuffer, vkDeviceMemory: *Vulkan.VkDeviceMemory) void
{
	var sizeDeviceMemory: usize = 0;
	var memRequirements: Vulkan.VkMemoryRequirements = undefined;
	createVkBuffer(size, usage, vkBuffer);
	Vulkan.vkGetBufferMemoryRequirements(VulkanGlobalState._device, vkBuffer.*, &memRequirements);
	sizeDeviceMemory = (memRequirements.size + ((memRequirements.alignment - memRequirements.size % memRequirements.alignment) % memRequirements.alignment));
	
	var dstBuffer: Vulkan.VkBuffer = undefined;
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
	createVkBuffer(sizeDeviceMemory, Vulkan.VK_BUFFER_USAGE_TRANSFER_SRC_BIT, &stagingBuffer);
	VK_CHECK(Vulkan.vkBindBufferMemory(VulkanGlobalState._device, stagingBuffer, stagingDeviceMemory, 0));
	
	memoryTypeIndex = VkDeviceMemory.findMemoryType(Vulkan.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
	allocInfo.memoryTypeIndex = memoryTypeIndex;
	VK_CHECK(Vulkan.vkAllocateMemory(VulkanGlobalState._device, &allocInfo, null, vkDeviceMemory));
	createVkBuffer(sizeDeviceMemory, Vulkan.VK_BUFFER_USAGE_TRANSFER_DST_BIT, &dstBuffer);
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
    memcpy(@ptrCast(data), buffer, size);
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
pub fn createVkBuffer__VkDeviceMemory__VkDeviceAddress(usage: Vulkan.VkBufferUsageFlags, buffer: [*]const u8, size: usize, deviceAddress: *Vulkan.VkDeviceAddress, vkBuffer: *Vulkan.VkBuffer, vkDeviceMemory: *Vulkan.VkDeviceMemory) void
{
    var sizeDeviceMemory: usize = 0;
    var memRequirements: Vulkan.VkMemoryRequirements = undefined;
    createVkBuffer(size, usage, vkBuffer);
    Vulkan.vkGetBufferMemoryRequirements(VulkanGlobalState._device, vkBuffer.*, &memRequirements);
    sizeDeviceMemory = (memRequirements.size + ((memRequirements.alignment - memRequirements.size % memRequirements.alignment) % memRequirements.alignment));

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
    createVkBuffer(sizeDeviceMemory, Vulkan.VK_BUFFER_USAGE_TRANSFER_SRC_BIT, &stagingBuffer);
    VK_CHECK(Vulkan.vkBindBufferMemory(VulkanGlobalState._device, stagingBuffer, stagingDeviceMemory, 0));

    memoryTypeIndex = VkDeviceMemory.findMemoryType(Vulkan.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT | Vulkan.VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT);
    allocInfo.memoryTypeIndex = memoryTypeIndex;
    VK_CHECK(Vulkan.vkAllocateMemory(VulkanGlobalState._device, &allocInfo, null, vkDeviceMemory));
    createVkBuffer(sizeDeviceMemory, Vulkan.VK_BUFFER_USAGE_TRANSFER_DST_BIT, &dstBuffer);
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

    const VkBufferDeviceAddressInfo = Vulkan.VkBufferDeviceAddressInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO,
        .buffer = vkBuffer.*
    };
    deviceAddress.* = Vulkan.vkGetBufferDeviceAddress(VulkanGlobalState._device, &VkBufferDeviceAddressInfo);

    memcpy(@ptrCast(data), buffer, size);
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
pub fn createVkBuffers__VkDeviceMemory_AoS(usage: Vulkan.VkBufferUsageFlags, srcStructArray: [*]u8, srcStructSize: u32, sizeOffset: u32, VkBufferStructArray: [*]u8, VkBufferStructSize: u32, numBuffers: usize, dstDeviceMemory: *Vulkan.VkDeviceMemory) void
{
    var sizeDeviceMemory: usize = 0;
	var buffers_full_sizes: [512]u64 = undefined;
//     const buffers_full_sizes: [*]u64 = (globalState.arenaAllocator.alloc(u64, numBuffers) catch unreachable).ptr;
    for(0..numBuffers) |bufferIndex|
    {
        createVkBuffer(readFromPtr(u32, srcStructArray+srcStructSize*bufferIndex+sizeOffset), usage, @as(*Vulkan.VkBuffer, @ptrCast(@alignCast(VkBufferStructArray+VkBufferStructSize*bufferIndex))));
        var memRequirements: Vulkan.VkMemoryRequirements = undefined;
        Vulkan.vkGetBufferMemoryRequirements(VulkanGlobalState._device, @as(*Vulkan.VkBuffer, @ptrCast(@alignCast(VkBufferStructArray+VkBufferStructSize*bufferIndex))).*, &memRequirements);

        buffers_full_sizes[bufferIndex] = (memRequirements.size + ((memRequirements.alignment - memRequirements.size % memRequirements.alignment) % memRequirements.alignment));
        sizeDeviceMemory += buffers_full_sizes[bufferIndex];
//         print("buffer size: {d}\n", .{buffers_full_sizes[bufferIndex]});
    }
    var dstBuffer: Vulkan.VkBuffer = undefined;
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
	createVkBuffer(sizeDeviceMemory, Vulkan.VK_BUFFER_USAGE_TRANSFER_SRC_BIT, &stagingBuffer);
	VK_CHECK(Vulkan.vkBindBufferMemory(VulkanGlobalState._device, stagingBuffer, stagingDeviceMemory, 0));
	memoryTypeIndex = VkDeviceMemory.findMemoryType(Vulkan.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
	allocInfo.memoryTypeIndex = memoryTypeIndex;
	VK_CHECK(Vulkan.vkAllocateMemory(VulkanGlobalState._device, &allocInfo, null, dstDeviceMemory));
	createVkBuffer(sizeDeviceMemory, Vulkan.VK_BUFFER_USAGE_TRANSFER_DST_BIT, &dstBuffer);
	VK_CHECK(Vulkan.vkBindBufferMemory(VulkanGlobalState._device, dstBuffer, dstDeviceMemory.*, 0));
	defer
	{
		Vulkan.vkDestroyBuffer(VulkanGlobalState._device, dstBuffer, null);
		Vulkan.vkDestroyBuffer(VulkanGlobalState._device, stagingBuffer, null);
		Vulkan.vkFreeMemory(VulkanGlobalState._device, stagingDeviceMemory, null);
	}
	var deviceOffset: usize = 0;
	var data: ?*anyopaque = undefined;
	_ = Vulkan.vkMapMemory(VulkanGlobalState._device, stagingDeviceMemory, 0, sizeDeviceMemory, 0, &data);
	for(0..numBuffers) |bufferIndex|
	{
		const PtrStruct = struct
		{
			data: [*]u8 = undefined,
		};
		VK_CHECK(Vulkan.vkBindBufferMemory(VulkanGlobalState._device,  @as(*Vulkan.VkBuffer, @ptrCast(@alignCast(VkBufferStructArray+VkBufferStructSize*bufferIndex))).*, dstDeviceMemory.*, deviceOffset));
		memcpy((@as([*]u8, @ptrCast(data))+deviceOffset), (@as(*PtrStruct, @ptrCast(@alignCast(srcStructArray+srcStructSize*bufferIndex)))).*.data, @as(*u32,@ptrCast(@alignCast(srcStructArray+srcStructSize*bufferIndex+sizeOffset))).*);
		deviceOffset += buffers_full_sizes[bufferIndex];
	}
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
pub fn createVkBuffers__VkDeviceMemory_AoS_Dst(usage: Vulkan.VkBufferUsageFlags, buffersArray: [*][*]u8, sizesArray: [*]usize, VkBufferStructArray: [*]u8, VkBufferStructSize: u32, numBuffers: usize, dstDeviceMemory: *Vulkan.VkDeviceMemory) void
{
	var sizeDeviceMemory: usize = 0;
	const buffers_full_sizes: [*]u64 = (GlobalState.arenaAllocator.alloc(u64, numBuffers) catch unreachable).ptr;
	for(0..numBuffers) |bufferIndex|
    {
//         print("buffer size: {d}\n", .{sizesArray[bufferIndex]});
        createVkBuffer(sizesArray[bufferIndex], usage, @as(*Vulkan.VkBuffer, @ptrCast(@alignCast(VkBufferStructArray+VkBufferStructSize*bufferIndex))));
		var memRequirements: Vulkan.VkMemoryRequirements = undefined;
		Vulkan.vkGetBufferMemoryRequirements(VulkanGlobalState._device, @as(*Vulkan.VkBuffer, @ptrCast(@alignCast(VkBufferStructArray+VkBufferStructSize*bufferIndex))).*, &memRequirements);
		
		buffers_full_sizes[bufferIndex] = (memRequirements.size + ((memRequirements.alignment - memRequirements.size % memRequirements.alignment) % memRequirements.alignment));
		sizeDeviceMemory += buffers_full_sizes[bufferIndex];
	}
	var dstBuffer: Vulkan.VkBuffer = undefined;
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
	createVkBuffer(sizeDeviceMemory, Vulkan.VK_BUFFER_USAGE_TRANSFER_SRC_BIT, &stagingBuffer);
	VK_CHECK(Vulkan.vkBindBufferMemory(VulkanGlobalState._device, stagingBuffer, stagingDeviceMemory, 0));
	memoryTypeIndex = VkDeviceMemory.findMemoryType(Vulkan.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
	allocInfo.memoryTypeIndex = memoryTypeIndex;
	VK_CHECK(Vulkan.vkAllocateMemory(VulkanGlobalState._device, &allocInfo, null, dstDeviceMemory));
	createVkBuffer(sizeDeviceMemory, Vulkan.VK_BUFFER_USAGE_TRANSFER_DST_BIT, &dstBuffer);
	VK_CHECK(Vulkan.vkBindBufferMemory(VulkanGlobalState._device, dstBuffer, dstDeviceMemory.*, 0));
	defer
	{
		Vulkan.vkDestroyBuffer(VulkanGlobalState._device, dstBuffer, null);
		Vulkan.vkDestroyBuffer(VulkanGlobalState._device, stagingBuffer, null);
		Vulkan.vkFreeMemory(VulkanGlobalState._device, stagingDeviceMemory, null);
	}
	var deviceOffset: usize = 0;
	var data: ?*anyopaque = undefined;
	_ = Vulkan.vkMapMemory(VulkanGlobalState._device, stagingDeviceMemory, 0, sizeDeviceMemory, 0, &data);
	for(0..numBuffers) |bufferIndex|
	{
		VK_CHECK(Vulkan.vkBindBufferMemory(VulkanGlobalState._device,  @as(*Vulkan.VkBuffer, @ptrCast(@alignCast(VkBufferStructArray+VkBufferStructSize*bufferIndex))).*, dstDeviceMemory.*, deviceOffset));
		memcpyDstAlign((@as([*]u8, @ptrCast(data))+deviceOffset), buffersArray[bufferIndex], sizesArray[bufferIndex]);
		deviceOffset += buffers_full_sizes[bufferIndex];
	}
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
pub fn createVkBuffers__VkDeviceMemory_SoA(usage: Vulkan.VkBufferUsageFlags, buffersArray: [*][*]u8, sizesArray: [*]u64, vkBuffersArray: [*]Vulkan.VkBuffer, numBuffers: usize, dstDeviceMemory: *Vulkan.VkDeviceMemory) void
{
    var sizeDeviceMemory: usize = 0;
    var bufferAllocationSizes: [512]u64 = undefined;
    for(0..numBuffers) |bufferIndex|
    {
//         print("buffer size: {d}\n", .{sizesArray[bufferIndex]});
        createVkBuffer(sizesArray[bufferIndex], usage, &vkBuffersArray[bufferIndex]);
        var memRequirements: Vulkan.VkMemoryRequirements = undefined;
        Vulkan.vkGetBufferMemoryRequirements(VulkanGlobalState._device, vkBuffersArray[bufferIndex], &memRequirements);

        bufferAllocationSizes[bufferIndex] = (memRequirements.size + ((memRequirements.alignment - memRequirements.size % memRequirements.alignment) % memRequirements.alignment));
        sizeDeviceMemory += bufferAllocationSizes[bufferIndex];
//         print("buffer size: {d}\n", .{bufferAllocationSizes[bufferIndex]});
    }
    var dstBuffer: Vulkan.VkBuffer = undefined;
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
    createVkBuffer(sizeDeviceMemory, Vulkan.VK_BUFFER_USAGE_TRANSFER_SRC_BIT, &stagingBuffer);
    VK_CHECK(Vulkan.vkBindBufferMemory(VulkanGlobalState._device, stagingBuffer, stagingDeviceMemory, 0));
    memoryTypeIndex = VkDeviceMemory.findMemoryType(Vulkan.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
    allocInfo.memoryTypeIndex = memoryTypeIndex;
    VK_CHECK(Vulkan.vkAllocateMemory(VulkanGlobalState._device, &allocInfo, null, dstDeviceMemory));
    createVkBuffer(sizeDeviceMemory, Vulkan.VK_BUFFER_USAGE_TRANSFER_DST_BIT, &dstBuffer);
    VK_CHECK(Vulkan.vkBindBufferMemory(VulkanGlobalState._device, dstBuffer, dstDeviceMemory.*, 0));
    defer
    {
        Vulkan.vkDestroyBuffer(VulkanGlobalState._device, dstBuffer, null);
        Vulkan.vkDestroyBuffer(VulkanGlobalState._device, stagingBuffer, null);
        Vulkan.vkFreeMemory(VulkanGlobalState._device, stagingDeviceMemory, null);
    }
    var deviceOffset: usize = 0;
    var data: ?*anyopaque = undefined;
    _ = Vulkan.vkMapMemory(VulkanGlobalState._device, stagingDeviceMemory, 0, sizeDeviceMemory, 0, &data);
    for(0..numBuffers) |bufferIndex|
    {
        VK_CHECK(Vulkan.vkBindBufferMemory(VulkanGlobalState._device,  vkBuffersArray[bufferIndex], dstDeviceMemory.*, deviceOffset));
        memcpy((@as([*]u8, @ptrCast(data))+deviceOffset), buffersArray[bufferIndex], sizesArray[bufferIndex]);
        deviceOffset += bufferAllocationSizes[bufferIndex];
    }
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