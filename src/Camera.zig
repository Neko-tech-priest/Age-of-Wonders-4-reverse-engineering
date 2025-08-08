const std = @import("std");

const CustomMem = @import("CustomMem.zig");
const memcpy = CustomMem.memcpy;
// const memcpyDstAlign = customMem.memcpyDstAlign;

const Math = @import("Math.zig");
const Vulkan = @import("Vulkan.zig");

const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;
const WindowGlobalState = @import("WindowGlobalState.zig");

const VkBuffer = @import("VkBuffer.zig");

pub var _cameraBuffers: [VulkanGlobalState.FRAME_OVERLAP]Vulkan.VkBuffer = undefined;
pub var _cameraBuffersMemory: [VulkanGlobalState.FRAME_OVERLAP]Vulkan.VkDeviceMemory = undefined;
pub var _cameraBuffersMapped: [VulkanGlobalState.FRAME_OVERLAP]?*anyopaque = undefined;

pub var _cameraDescriptorSetLayout: Vulkan.VkDescriptorSetLayout = undefined;
pub var _cameraDescriptorPool: Vulkan.VkDescriptorPool = undefined;
pub var _cameraDescriptorSets: [VulkanGlobalState.FRAME_OVERLAP]Vulkan.VkDescriptorSet = undefined;

pub var camera_translate_x: f32 = 0;
pub var camera_translate_y: f32 = 0;
pub var camera_translate_z: f32 = -4;
pub var camera_rotate_x: f32 = 0;
pub var camera_rotate_y: f32 = 0;
pub var camera_rotate_z: f32 = 0;

const CameraBufferObject = struct
{
	view: Math.Mat,
	proj: Math.Mat,
};
pub fn createCameraBuffers() void
{
	const bufferSize: Vulkan.VkDeviceSize = @sizeOf(CameraBufferObject);
	var i: usize = 0;
	while(i < VulkanGlobalState.FRAME_OVERLAP)
	{
		VkBuffer.createVkBuffer__VkDeviceMemory__HV_DL(Vulkan.VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT, bufferSize, &_cameraBuffers[i], &_cameraBuffersMemory[i]);
		_ = Vulkan.vkMapMemory(VulkanGlobalState._device, _cameraBuffersMemory[i], 0, bufferSize, 0, &_cameraBuffersMapped[i]);
		i+=1;
	}
}
pub fn destroyCameraBuffers() void
{
	var i: usize = 0;
	while(i < VulkanGlobalState.FRAME_OVERLAP)
	{
		Vulkan.vkDestroyBuffer(VulkanGlobalState._device, _cameraBuffers[i], null);
		Vulkan.vkFreeMemory(VulkanGlobalState._device, _cameraBuffersMemory[i], null);
		i+=1;
	}
}
pub fn createCameraVkDescriptorSetLayout() void
{
	const cameraLayoutBinding = Vulkan.VkDescriptorSetLayoutBinding
	{
		.binding = 0,
		.descriptorCount = 1,
		.descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,
		.pImmutableSamplers = null,
		.stageFlags = Vulkan.VK_SHADER_STAGE_VERTEX_BIT,
	};
	const layoutInfo = Vulkan.VkDescriptorSetLayoutCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO,
		.bindingCount = 1,
		.pBindings = &cameraLayoutBinding,
	};
	VK_CHECK(Vulkan.vkCreateDescriptorSetLayout(VulkanGlobalState._device, &layoutInfo, null, &_cameraDescriptorSetLayout));
}
pub fn createCameraVkDescriptorPool() void
{
	const poolSizes = Vulkan.VkDescriptorPoolSize
	{
		.type = Vulkan.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,
		.descriptorCount = VulkanGlobalState.FRAME_OVERLAP,
	};
	const poolInfo = Vulkan.VkDescriptorPoolCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO,
		.poolSizeCount = 1,
		.pPoolSizes = &poolSizes,
		.maxSets = VulkanGlobalState.FRAME_OVERLAP,
	};
	VK_CHECK(Vulkan.vkCreateDescriptorPool(VulkanGlobalState._device, &poolInfo, null, &_cameraDescriptorPool));
}
pub fn createCameraVkDescriptorSets() void
{
	var layouts: [VulkanGlobalState.FRAME_OVERLAP]Vulkan.VkDescriptorSetLayout = undefined;
	var i: usize = 0;
	while(i < VulkanGlobalState.FRAME_OVERLAP)
	{
		layouts[i] = _cameraDescriptorSetLayout;
		i+=1;
	}
	const allocInfo = Vulkan.VkDescriptorSetAllocateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO,
		.descriptorPool = _cameraDescriptorPool,
		.descriptorSetCount = VulkanGlobalState.FRAME_OVERLAP,
		.pSetLayouts = &layouts,
	};
	VK_CHECK(Vulkan.vkAllocateDescriptorSets(VulkanGlobalState._device, &allocInfo, &_cameraDescriptorSets));
	i = 0;
	var descriptorWrites = [1]Vulkan.VkWriteDescriptorSet
	{
		.{},
	};
	while(i < VulkanGlobalState.FRAME_OVERLAP)
	{
		const bufferInfo = Vulkan.VkDescriptorBufferInfo
		{
			.buffer = _cameraBuffers[i],
			.offset = 0,
			.range = @sizeOf(CameraBufferObject),
		};

		descriptorWrites[0].sType = Vulkan.VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
		descriptorWrites[0].dstSet = _cameraDescriptorSets[i];
		descriptorWrites[0].dstBinding = 0;
		descriptorWrites[0].dstArrayElement = 0;
		descriptorWrites[0].descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER;
		descriptorWrites[0].descriptorCount = 1;
		descriptorWrites[0].pBufferInfo = &bufferInfo;

		Vulkan.vkUpdateDescriptorSets(VulkanGlobalState._device, descriptorWrites.len, &descriptorWrites, 0, null);
		i+=1;
	}
}
pub fn updateCameraBuffer(currentFrame: usize) void
{
	var camera: CameraBufferObject = undefined;

//  const cameraScale = math.matScaling(1.0, 1.0, 1.0);
    const cameraRotate = Math.matRotation(camera_rotate_x, 'x');
	const cameraTranslate = Math.matTranslation(0+camera_translate_x, camera_translate_y, camera_translate_z);
//     camera.view = Math.mulMat(cameraRotate, cameraTranslate);
    camera.view = Math.mulMatFast(cameraRotate, cameraTranslate);
    camera.proj = Math.matPerspectiveReversedInfinity(90.0, @as(f32, @floatFromInt(WindowGlobalState._windowExtent.width)) / @as(f32, @floatFromInt(WindowGlobalState._windowExtent.height)), 1.0/1024.0);
    camera.proj = Math.mulMatFast(camera.view, camera.proj);
	CustomMem.memcpyInline(@ptrCast(_cameraBuffersMapped[currentFrame]), @ptrCast(&camera), @sizeOf(CameraBufferObject));
}
