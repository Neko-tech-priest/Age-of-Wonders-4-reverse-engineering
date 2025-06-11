const std = @import("std");
const c = std.c;
const print = std.debug.print;

// const Vulkan = @import("Vulkan.zig");
const Vulkan = @import("Vulkan.zig");

const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;

pub fn findMemoryType(propertyFlags: Vulkan.VkMemoryPropertyFlags) u32
{
	var i: usize = 0;
	while(i < VulkanGlobalState._memoryProperties.memoryTypeCount)
	{
		if((VulkanGlobalState._memoryProperties.memoryTypes[i].propertyFlags & propertyFlags) == propertyFlags)
			return @intCast(i);
		i+=1;
	}
	print("failed to find suitable memory type!\n", .{});
	c.exit(-1);
}
pub fn createVkDeviceMemory(memRequirements: Vulkan.VkMemoryRequirements, propertyFlags: Vulkan.VkMemoryPropertyFlags, deviceMemory: *Vulkan.VkDeviceMemory) void
{
// var memProperties: Vulkan.VkPhysicalDeviceMemoryProperties = undefined;
// Vulkan.vkGetPhysicalDeviceMemoryProperties(VulkanGlobalState._physicalDevice, &memProperties);
	var memoryTypeIndex: u32 = undefined;
//
	var i: u32 = 0;
	const one: usize = 1;
	while(i < VulkanGlobalState._memoryProperties.memoryTypeCount)
	{
		if((memRequirements.memoryTypeBits & (one << @intCast(i))) > 0 and (VulkanGlobalState._memoryProperties.memoryTypes[i].propertyFlags & propertyFlags) == propertyFlags)
		{
			memoryTypeIndex = i;
			const allocInfo = Vulkan.VkMemoryAllocateInfo
			{
				.sType = Vulkan.VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO,
				.allocationSize = memRequirements.size,
				.memoryTypeIndex = memoryTypeIndex,
			};

			VK_CHECK(Vulkan.vkAllocateMemory(VulkanGlobalState._device, &allocInfo, null, deviceMemory));
			return;
		}
		i+=1;
	}
	print("failed to find suitable memory type!\n", .{});
	std.c.exit(-1);
}
