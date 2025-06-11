const std = @import("std");
const mem = std.mem;
const print = std.debug.print;
const exit = std.process.exit;
// const SDL = @import("SDL.zig");

// const Vulkan = @import("Vulkan.zig");
const Vulkan = @import("Vulkan.zig");

const GlobalState = @import("GlobalState.zig");
const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;
const WindowGlobalState = @import("WindowGlobalState.zig");

const VkDeviceMemory = @import("VkDeviceMemory.zig");
const VkImage = @import("VkImage.zig");

pub fn createVkSwapchain() void
{
	var capabilities :Vulkan.VkSurfaceCapabilitiesKHR = undefined;
	var formats: [4]Vulkan.VkSurfaceFormatKHR = undefined;
	var presentModes: [4]Vulkan.VkPresentModeKHR = undefined;

	_ = Vulkan.vkGetPhysicalDeviceSurfaceCapabilitiesKHR(VulkanGlobalState._physicalDevice, VulkanGlobalState._surface, &capabilities);

	var formatCount: u32 = undefined;
	_ = Vulkan.vkGetPhysicalDeviceSurfaceFormatsKHR(VulkanGlobalState._physicalDevice, VulkanGlobalState._surface, &formatCount, null);
	//print("formatCount: {d}\n", .{formatCount});
	if (formatCount != 0)
	{
		_ = Vulkan.vkGetPhysicalDeviceSurfaceFormatsKHR(VulkanGlobalState._physicalDevice, VulkanGlobalState._surface, &formatCount, &formats);
	}

	var presentModeCount: u32 = undefined;
	_ = Vulkan.vkGetPhysicalDeviceSurfacePresentModesKHR(VulkanGlobalState._physicalDevice, VulkanGlobalState._surface, &presentModeCount, null);
	//print("presentModeCount: {d}\n", .{presentModeCount});
	if (presentModeCount != 0)
	{
		_ = Vulkan.vkGetPhysicalDeviceSurfacePresentModesKHR(VulkanGlobalState._physicalDevice, VulkanGlobalState._surface, &presentModeCount, &presentModes);
	}
	var formatFound: bool = false;
	for(formats[0..formatCount]) |format|
	{
		if (format.format == Vulkan.VK_FORMAT_B8G8R8A8_SRGB and format.colorSpace == Vulkan.VK_COLOR_SPACE_SRGB_NONLINEAR_KHR)
		{
			formatFound = true;
			break;
		}
	}
	if(!formatFound)
	{
		print("swapchain format not found!\n", .{});
		exit(0);
	}
//     var presentModeFound: bool = false;
//     for(presentModes[0..presentModeCount]) |presentMode|
//     {
//         //VK_PRESENT_MODE_IMMEDIATE_KHR
//         //VK_PRESENT_MODE_MAILBOX_KHR
//         //VK_PRESENT_MODE_FIFO_KHR
//         //VK_PRESENT_MODE_FIFO_RELAXED_KHR
//         if(presentMode == Vulkan.VK_PRESENT_MODE_FIFO_KHR)
//         {
//             presentModeFound = true;
//             break;
//         }
//     }
//     if(!presentModeFound)
//     {
//         print("swapchain present mode not found!\n", .{});
//         exit(0);
//     }

	const surfaceFormat = Vulkan.VkSurfaceFormatKHR
	{
		.format = Vulkan.VK_FORMAT_B8G8R8A8_SRGB,
		.colorSpace = Vulkan.VK_COLOR_SPACE_SRGB_NONLINEAR_KHR,
	};
	const presentMode: Vulkan.VkPresentModeKHR = Vulkan.VK_PRESENT_MODE_FIFO_RELAXED_KHR;
	WindowGlobalState._windowExtent = capabilities.currentExtent;

// VulkanGlobalState._swapchainImagesCount = capabilities.minImageCount;
	const swapchainCreateInfo = Vulkan.VkSwapchainCreateInfoKHR
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR,
		.surface = VulkanGlobalState._surface,
		.minImageCount = 2,
		.imageFormat = surfaceFormat.format,
		.imageColorSpace = surfaceFormat.colorSpace,
		.imageExtent = capabilities.currentExtent,
		.imageArrayLayers = 1,
		.imageUsage = Vulkan.VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT, //VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT,
		//за графику и представление отвечает одна и та же очередь
		.imageSharingMode = Vulkan.VK_SHARING_MODE_EXCLUSIVE,
//         .queueFamilyIndexCount = 0, // Optional
//         .pQueueFamilyIndices = null, // Optional
		//никаких трансформаций
		.preTransform = capabilities.currentTransform,
		//игнорирование альфы
		.compositeAlpha = Vulkan.VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR,
		.presentMode = presentMode,
		//отсечение пикселей, которых не видно для лучшей производительности
		.clipped = Vulkan.VK_TRUE,
		.oldSwapchain = null,
	};
	VK_CHECK(Vulkan.vkCreateSwapchainKHR(VulkanGlobalState._device, &swapchainCreateInfo, null, &VulkanGlobalState._swapchain));
//
    _ = Vulkan.vkGetSwapchainImagesKHR(VulkanGlobalState._device, VulkanGlobalState._swapchain, &VulkanGlobalState._swapchainImagesCount, null);
//     print("VulkanGlobalState._swapchainImagesCount: {d}\n", .{VulkanGlobalState._swapchainImagesCount});
//     VulkanGlobalState._swapchainImagesCount = 2;
    _ = Vulkan.vkGetSwapchainImagesKHR(VulkanGlobalState._device, VulkanGlobalState._swapchain, &VulkanGlobalState._swapchainImagesCount, &VulkanGlobalState._swapchainImages);
    var imageViewCreateInfo = Vulkan.VkImageViewCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO,
	// .image = _swapChainImages[i];
		.viewType = Vulkan.VK_IMAGE_VIEW_TYPE_2D,
		.format = Vulkan.VK_FORMAT_B8G8R8A8_SRGB,
		// переключения цветовых каналов, значение по умолчанию
		.components = Vulkan.VkComponentMapping
		{
			.r = Vulkan.VK_COMPONENT_SWIZZLE_IDENTITY,
			.g = Vulkan.VK_COMPONENT_SWIZZLE_IDENTITY,
			.b = Vulkan.VK_COMPONENT_SWIZZLE_IDENTITY,
			.a = Vulkan.VK_COMPONENT_SWIZZLE_IDENTITY,
		},
		// к какой части изображения стоит обращаться
		.subresourceRange = Vulkan.VkImageSubresourceRange
		{
			.aspectMask = Vulkan.VK_IMAGE_ASPECT_COLOR_BIT,
			.baseMipLevel = 0,
			.levelCount = 1,
			.baseArrayLayer = 0,
			.layerCount = 1,
		},
	};
	var i: usize = 0;
	while(i < VulkanGlobalState._swapchainImagesCount)
	{
		imageViewCreateInfo.image = VulkanGlobalState._swapchainImages[i];
		VK_CHECK(Vulkan.vkCreateImageView(VulkanGlobalState._device, &imageViewCreateInfo, null, &VulkanGlobalState._swapchainImageViews[i]));
		i+=1;
	}
}
pub fn createDepthResources() void
{
	const imageInfo = Vulkan.VkImageCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO,
		.imageType = Vulkan.VK_IMAGE_TYPE_2D,
		.extent = Vulkan.VkExtent3D
		{
			.width = WindowGlobalState._windowExtent.width,
			.height = WindowGlobalState._windowExtent.height,
			.depth = 1,
		},
		.mipLevels = 1,
		.arrayLayers = 1,
		.format = VulkanGlobalState._depthFormat,
		.tiling = Vulkan.VK_IMAGE_TILING_OPTIMAL,
		.initialLayout = Vulkan.VK_IMAGE_LAYOUT_UNDEFINED,
		.usage = Vulkan.VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT,
		.samples = Vulkan.VK_SAMPLE_COUNT_1_BIT,
		.sharingMode = Vulkan.VK_SHARING_MODE_EXCLUSIVE,
	};
	VK_CHECK(Vulkan.vkCreateImage(VulkanGlobalState._device, &imageInfo, null, &VulkanGlobalState._depthImage));
//VkImage.createVkImage(WindowGlobalState._windowExtent.width, WindowGlobalState._windowExtent.height, VulkanGlobalState._depthFormat, Vulkan.VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT, &VulkanGlobalState._depthImage);
	var memRequirements: Vulkan.VkMemoryRequirements = undefined;
	Vulkan.vkGetImageMemoryRequirements(VulkanGlobalState._device, VulkanGlobalState._depthImage, &memRequirements);

	VkDeviceMemory.createVkDeviceMemory(memRequirements, Vulkan.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT, &VulkanGlobalState._depthDeviceMemory);

	VK_CHECK(Vulkan.vkBindImageMemory(VulkanGlobalState._device, VulkanGlobalState._depthImage, VulkanGlobalState._depthDeviceMemory, 0));
	VkImage.createVkImageView(1, VulkanGlobalState._depthImage, VulkanGlobalState._depthFormat, Vulkan.VK_IMAGE_ASPECT_DEPTH_BIT, &VulkanGlobalState._depthImageView);
}
pub fn destroyDepthResources() void
{
	Vulkan.vkDestroyImageView(VulkanGlobalState._device, VulkanGlobalState._depthImageView, null);
	Vulkan.vkDestroyImage(VulkanGlobalState._device, VulkanGlobalState._depthImage, null);
	Vulkan.vkFreeMemory(VulkanGlobalState._device, VulkanGlobalState._depthDeviceMemory, null);
}
pub fn destroyVkSwapchain() void
{
	var i: usize = 0;
	while(i < VulkanGlobalState._swapchainImagesCount)
	{
		Vulkan.vkDestroyImageView(VulkanGlobalState._device, VulkanGlobalState._swapchainImageViews[i], null);
		i+=1;
	}
    Vulkan.vkDestroySwapchainKHR(VulkanGlobalState._device, VulkanGlobalState._swapchain, null);
//     c.free(@ptrCast(@alignCast(VulkanGlobalState._swapchainImages)));
//     c.free(@ptrCast(@alignCast(VulkanGlobalState._swapchainImageViews)));
}
pub inline fn recreateVkSwapchainKHR() void
{
	_ = Vulkan.vkDeviceWaitIdle(VulkanGlobalState._device);
	destroyDepthResources();
	destroyVkSwapchain();
	createVkSwapchain();
	createDepthResources();
}
