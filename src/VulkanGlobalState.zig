const std = @import("std");
const print = std.debug.print;

const Vulkan = @import("Vulkan.zig");

pub const enableValidationLayers: bool = std.debug.runtime_safety;// std.debug.runtime_safety

pub const FRAME_OVERLAP: comptime_int = 2;

pub var _instance: Vulkan.VkInstance = undefined;
pub var _debugMessenger: Vulkan.VkDebugUtilsMessengerEXT = undefined;
pub var _physicalDevice: Vulkan.VkPhysicalDevice = null;
pub var _device: Vulkan.VkDevice = undefined;
pub var _graphicsQueue: Vulkan.VkQueue = undefined;
pub var _graphicsQueueFamily: u32 = undefined;

pub var _commandPools: [FRAME_OVERLAP]Vulkan.VkCommandPool = undefined;
pub var _commandBuffers: [FRAME_OVERLAP]Vulkan.VkCommandBuffer = undefined;

pub var _swapchainSemaphores: [FRAME_OVERLAP]Vulkan.VkSemaphore = undefined;
pub var _renderSemaphores: [FRAME_OVERLAP]Vulkan.VkSemaphore = undefined;
pub var _renderFences: [FRAME_OVERLAP]Vulkan.VkFence = undefined;

pub var _surface: Vulkan.VkSurfaceKHR = undefined;
pub var _swapchain: Vulkan.VkSwapchainKHR = undefined;
pub var _swapchainImages: [4]Vulkan.VkImage = undefined;
pub var _swapchainImageViews: [4]Vulkan.VkImageView = undefined;
pub var _swapchainImageFormat: c_uint = Vulkan.VK_FORMAT_B8G8R8A8_SRGB;
pub var _swapchainImagesCount: u32 = 3;

pub const _depthFormat: Vulkan.VkFormat = Vulkan.VK_FORMAT_D16_UNORM;
pub var _depthImage: Vulkan.VkImage = undefined;
pub var _depthImageView: Vulkan.VkImageView = undefined;
pub var _depthDeviceMemory: Vulkan.VkDeviceMemory = undefined;

pub var _textureSampler: Vulkan.VkSampler = undefined;

pub var _deviceProperties: Vulkan.VkPhysicalDeviceProperties = undefined;
pub var _deviceFeatures: Vulkan.VkPhysicalDeviceFeatures = undefined;

pub var _memoryProperties: Vulkan.VkPhysicalDeviceMemoryProperties = undefined;

// const VK_CHECK_string = "Detected Vulkan error: ";
pub fn VK_CHECK(err: Vulkan.VkResult) void
{
    if (err != 0)
    {
        print("Detected Vulkan error: {d}\n", .{err});
        // print("{s}{d}\n", .{VK_CHECK_string, err});
        std.c.exit(-1);
    }
}
