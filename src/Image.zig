const std = @import("std");

// const VulkanInclude = @import("VulkanInclude.zig");
const Vulkan = @import("Vulkan.zig");

const VulkanGlobalState = @import("VulkanGlobalState.zig");

pub const Image = struct
{
	data: [*]u8,
	mipSize: u32,
	size: u32,
	width: u16,
	height: u16,
	mipsCount: u8,
	alignment: u8,
	format: Vulkan.VkFormat,
};
pub const Texture = struct
{
	vkImage: Vulkan.VkImage,
	vkImageView: Vulkan.VkImageView,
	pub fn unload(self: Texture) void
	{
		Vulkan.vkDestroyImage(VulkanGlobalState._device, self.vkImage, null);
		Vulkan.vkDestroyImageView(VulkanGlobalState._device, self.vkImageView, null);
	}
};