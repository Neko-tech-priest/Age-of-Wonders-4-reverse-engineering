const std = @import("std");
// const Vulkan = @import("Vulkan.zig");
const Vulkan = @import("Vulkan.zig");

const CustomFS = @import("CustomFS.zig");
const CustomThreads = @import("CustomThreads.zig");
const exit = CustomThreads.exit;
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
	const string = "failed to find suitable memory type!\n";
    _ = CustomFS.write(1, string, string.len);
	exit();
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
	const string = "failed to find suitable memory type!\n";
    _ = CustomFS.write(1, string, string.len);
	exit();
}
