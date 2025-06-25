const std = @import("std");

// const VulkanInclude = @import("VulkanInclude.zig");
const Vulkan = @import("Vulkan.zig");

const VulkanGlobalState = @import("VulkanGlobalState.zig");

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