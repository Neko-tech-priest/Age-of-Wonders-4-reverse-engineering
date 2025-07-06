const std = @import("std");
const print = std.debug.print;
const exit = std.process.exit;

const SDL = @import("SDL3.zig");
const Vulkan = @import("Vulkan.zig");
const VulkanFunctionsLoader = @import("VulkanFunctionsLoader.zig");

const GlobalState = @import("GlobalState.zig");
const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;
const WindowGlobalState = @import("WindowGlobalState.zig");

const CustomMem = @import("CustomMem.zig");

fn debugCallback(messageSeverity: Vulkan.VkDebugUtilsMessageSeverityFlagBitsEXT, messageType: Vulkan.VkDebugUtilsMessageTypeFlagsEXT, pCallbackData: [*c]const Vulkan.VkDebugUtilsMessengerCallbackDataEXT, pUserData: ?*anyopaque) callconv(.C) Vulkan.VkBool32
{
    _ = messageSeverity;
    _ = messageType;
    _ = pUserData;
    print("validation layer: {s}\n", .{pCallbackData.*.pMessage});
    return Vulkan.VK_FALSE;
}
fn createVkInstance(stackMemoryPtr: [*]u8) void
{
    const validationLayers = [_][]const u8{"VK_LAYER_KHRONOS_validation"};
    if(VulkanGlobalState.enableValidationLayers)
    {
        var layerCount: u32 = undefined;
        _ = Vulkan.vkEnumerateInstanceLayerProperties(&layerCount, 0);
        const availableLayers: [*]Vulkan.VkLayerProperties = @alignCast(@ptrCast(stackMemoryPtr));
        _ = Vulkan.vkEnumerateInstanceLayerProperties(&layerCount, @ptrCast(availableLayers));
        for(validationLayers) |requiredLayer|
        {
            std.debug.print("{s}\n", .{requiredLayer});
            var layerFound: bool = false;
            for(availableLayers[0..layerCount]) |availableLayer|
            {
                //mem.eql(u8, requiredLayer, availableLayer.layerName[0..requiredLayer.len])
                if(CustomMem.memcmp(requiredLayer.ptr, &availableLayer.layerName, requiredLayer.len))
                {
                    layerFound = true;
                    break;
                }
            }
            //         std.debug.assert(layerFound);
            if (!layerFound)
            {
                print("validation layers requested, but not available!\n", .{});
                exit(0);
            }
        }
    }
    var usedNumberOfInstanceExtensions: u32 = 4;
    var requiredExtensions: [4][*:0]const u8 = undefined;
    const returnedExtensions = SDL.SDL_Vulkan_GetInstanceExtensions(&usedNumberOfInstanceExtensions);
    requiredExtensions[0] = returnedExtensions[0];
    requiredExtensions[1] = returnedExtensions[1];
    requiredExtensions[2] = "VK_KHR_get_surface_capabilities2";
    requiredExtensions[3] = "VK_EXT_surface_maintenance1";
    //     if(VulkanGlobalState.enableValidationLayers)
    //     {
    //         requiredExtensions[usedNumberOfInstanceExtensions] = "VK_EXT_debug_utils";
    //         usedNumberOfInstanceExtensions+=1;
    //     }

    const appInfo = Vulkan.VkApplicationInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_APPLICATION_INFO,
        .apiVersion = Vulkan.VK_API_VERSION_1_3,
    };

    var instanseCreateInfo = Vulkan.VkInstanceCreateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO,
        .pApplicationInfo = &appInfo,

        .enabledExtensionCount = requiredExtensions.len,
        .ppEnabledExtensionNames = @ptrCast(&requiredExtensions),
    };

    //     var debugCreateInfo = Vulkan.VkDebugUtilsMessengerCreateInfoEXT{};


    if (VulkanGlobalState.enableValidationLayers)
    {
        instanseCreateInfo.enabledLayerCount = validationLayers.len;
        instanseCreateInfo.ppEnabledLayerNames = @ptrCast(&validationLayers);


        //         debugCreateInfo.sType = Vulkan.VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT;
        //         debugCreateInfo.messageSeverity = Vulkan.VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT | Vulkan.VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT | Vulkan.VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT;
        //         debugCreateInfo.messageType = Vulkan.VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT | Vulkan.VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT | Vulkan.VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT;
        //         debugCreateInfo.pfnUserCallback = debugCallback;
        //
        //         instanseCreateInfo.pNext = &debugCreateInfo;
    } else
    {
        instanseCreateInfo.enabledLayerCount = 0;
        instanseCreateInfo.pNext = null;
    }
    VK_CHECK(Vulkan.vkCreateInstance(&instanseCreateInfo, 0, &VulkanGlobalState._instance));
}
fn createVkDevice(stackMemoryPtr: [*]u8) void
{
    const deviceExtensions = [_][*:0]const u8
    {
        "VK_KHR_swapchain",
//         "VK_EXT_descriptor_indexing",
//         "VK_KHR_dynamic_rendering",
        //     "VK_KHR_synchronization2",
    };
    var physicaldeviceCount: u32 = undefined;
    _ = (Vulkan.vkEnumeratePhysicalDevices(VulkanGlobalState._instance, &physicaldeviceCount, null));
    // print("{d}\n", .{physicaldeviceCount});
    //     if (physicaldeviceCount == 0)
    //     {
    //         print("failed to find GPUs with Vulkan support!\n", .{});
    //         exit(0);
    //     }
    var physicalDevices: [2]Vulkan.VkPhysicalDevice = undefined;
    _ = (Vulkan.vkEnumeratePhysicalDevices(VulkanGlobalState._instance, &physicaldeviceCount, @ptrCast(&physicalDevices)));
    // підтримувані розширення
    var extensionProperties: [*]Vulkan.VkExtensionProperties = undefined;
    var extensionCount: u32 = undefined;
    // підтримувані сімейства черг
    var queueFamiliesProperties: [*]Vulkan.VkQueueFamilyProperties = undefined;
    var queueFamilyCount: u32 = undefined;
    for(physicalDevices[0..physicaldeviceCount]) |physicalDevice|
    {
        // отримання відомостей про пристрій
        Vulkan.vkGetPhysicalDeviceProperties(physicalDevice, &VulkanGlobalState._deviceProperties);
        Vulkan.vkGetPhysicalDeviceFeatures(physicalDevice, &VulkanGlobalState._deviceFeatures);

        _ = Vulkan.vkEnumerateDeviceExtensionProperties(physicalDevice, null, &extensionCount, null);
        extensionProperties = @alignCast(@ptrCast(stackMemoryPtr));
        _ = Vulkan.vkEnumerateDeviceExtensionProperties(physicalDevice, null, &extensionCount, extensionProperties);
        {
        // перевірка на підтримку необхідних розширень пристрою
        //         var extensionFound: bool = undefined;
        //         for(deviceExtensions) |deviceExtension|
        //         {
        //             extensionFound = false;
        //             for(extensionProperties[0..extensionCount]) |availableExtension|
        //             {
        //                 var len: usize = 0;
        //                 while(availableExtension.extensionName[len] != 0)
        //                     len+=1;
        //                 if(CustomMem.memcmp(deviceExtension, &availableExtension.extensionName, len))
        //                 {
        //                     extensionFound = true;
        //                     break;
        //                 }
        //             }
        //             if(!extensionFound)
        //             {
        //                 print("Extension not found: {s}\n", .{deviceExtension});
        //                 break;
        //             }
        //         }
        //         if(!extensionFound)
        //         {
        //             continue;
        //         }
        }
        // перевірка підтримки потрібних фіч
        Vulkan.vkGetPhysicalDeviceQueueFamilyProperties(physicalDevice, &queueFamilyCount, null);
        //     queueFamiliesProperties = (globalState.pageAllocator.alloc(Vulkan.VkQueueFamilyProperties, queueFamilyCount) catch unreachable).ptr;
        queueFamiliesProperties = @alignCast(@ptrCast(stackMemoryPtr));
        Vulkan.vkGetPhysicalDeviceQueueFamilyProperties(physicalDevice, &queueFamilyCount, queueFamiliesProperties);

        // перевірка на наявність потрібного сімейства черг
        var checkQueueFamily: bool = false;
        var indexQueueFamily: u32 = 0;
        while(indexQueueFamily < queueFamilyCount)
        {
            if(queueFamiliesProperties[indexQueueFamily].queueFlags & Vulkan.VK_QUEUE_GRAPHICS_BIT > 0)
            {
                var presentSupport: u32 = 0;//Vulkan.VkBool32
                _ = Vulkan.vkGetPhysicalDeviceSurfaceSupportKHR(physicalDevice, indexQueueFamily, VulkanGlobalState._surface, &presentSupport);
                if(presentSupport > 0)
                {
                    checkQueueFamily = true;
                    VulkanGlobalState._graphicsQueueFamily = indexQueueFamily;
                    break;
                }
            }
            indexQueueFamily+=1;
        }
        if(!checkQueueFamily)
        {
            continue;
        }
        VulkanGlobalState._physicalDevice = physicalDevice;
//         print("gpu: {s}\n", .{VulkanGlobalState._deviceProperties.deviceName});
        print("gpu: {s}\n", .{std.mem.sliceTo(&VulkanGlobalState._deviceProperties.deviceName, 0)});
        if(VulkanGlobalState._deviceProperties.deviceType == Vulkan.VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU)
            break;
    }
    if(VulkanGlobalState._physicalDevice == null)
    {
        print("failed to find suidable device!\n", .{});
        exit(0);
    }
    // завантаження певних глобальних відомостей про пристрій
    Vulkan.vkGetPhysicalDeviceMemoryProperties(VulkanGlobalState._physicalDevice, &VulkanGlobalState._memoryProperties);
    // створення однієї графічної черги
    const queuePriority: f32 = 1.0;
    const queueCreateInfo = Vulkan.VkDeviceQueueCreateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO,
        .queueFamilyIndex = VulkanGlobalState._graphicsQueueFamily,
        .queueCount = 1,
        .pQueuePriorities = &queuePriority,
    };

    // активація фіч
    var features13 = Vulkan.VkPhysicalDeviceVulkan13Features
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES,
        .dynamicRendering = Vulkan.VK_TRUE,
        .synchronization2 = Vulkan.VK_TRUE,
    };
//     var PhysicalDeviceDynamicRenderingFeaturesKHR = Vulkan.VkPhysicalDeviceDynamicRenderingFeaturesKHR
//     {
//         .sType = Vulkan.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR,
//         .dynamicRendering = Vulkan.VK_TRUE,
//     };
    var features12 = Vulkan.VkPhysicalDeviceVulkan12Features
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES,
//         .descriptorIndexing = Vulkan.VK_TRUE,
        .bufferDeviceAddress = Vulkan.VK_TRUE,
        .runtimeDescriptorArray = Vulkan.VK_TRUE,
        .shaderSampledImageArrayNonUniformIndexing = Vulkan.VK_TRUE,
        .scalarBlockLayout = Vulkan.VK_TRUE,
        .pNext = @ptrCast(&features13),
//         .pNext = @ptrCast(&PhysicalDeviceDynamicRenderingFeaturesKHR),
    };
    var VkPD_Features2 = Vulkan.VkPhysicalDeviceFeatures2
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2,
        .features = Vulkan.VkPhysicalDeviceFeatures
        {
            .samplerAnisotropy = Vulkan.VK_TRUE,
        },
        .pNext = @ptrCast(&features12),
    };
    //     var PhysicalDeviceDynamicRenderingFeaturesKHR = Vulkan.VkPhysicalDeviceDynamicRenderingFeaturesKHR
    //     {
    //         .sType = Vulkan.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR,
    //         .dynamicRendering = Vulkan.VK_TRUE,
    //     };
    //     VkPD_Features2.pNext = @ptrCast(&PhysicalDeviceDynamicRenderingFeaturesKHR);
    //     var PhysicalDeviceVulkan12Features = Vulkan.VkPhysicalDeviceVulkan12Features
    //     {
    //         .sType = Vulkan.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES,
    //         .shaderSampledImageArrayNonUniformIndexing = Vulkan.VK_TRUE,
    //         //     .descriptorIndexing = Vulkan.VK_TRUE,
    //         .runtimeDescriptorArray = Vulkan.VK_TRUE,
    //     };
    //     PhysicalDeviceDynamicRenderingFeaturesKHR.pNext = @ptrCast(&PhysicalDeviceVulkan12Features);
    //     var VkPhysicalDeviceVulkan13Features = Vulkan.VkPhysicalDeviceVulkan13Features
    //     {
    //         .sType = Vulkan.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES,
    //         .synchronization2 = Vulkan.VK_TRUE,
    //     };
    //     PhysicalDeviceVulkan12Features.pNext = @ptrCast(&VkPhysicalDeviceVulkan13Features);
    const deviceCreateInfo = Vulkan.VkDeviceCreateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO,
        .pNext = &VkPD_Features2,
        .pQueueCreateInfos = &queueCreateInfo,
        .queueCreateInfoCount = 1,

        .enabledExtensionCount = deviceExtensions.len,
        .ppEnabledExtensionNames = (&deviceExtensions),
    };
//     print("{s}{d}\n", .{"device extensions: ", deviceExtensions.len});
    VK_CHECK(Vulkan.vkCreateDevice(VulkanGlobalState._physicalDevice, &deviceCreateInfo, null, &VulkanGlobalState._device));
}
pub fn initBaseVulkan() void
{
    var stackMemory: [4096*16]u8 align(4096) = undefined;
    Vulkan.vkGetInstanceProcAddr = @ptrCast(SDL.SDL_Vulkan_GetVkGetInstanceProcAddr());
//     print("{*}\n", .{Vulkan.vkGetInstanceProcAddr});
    VulkanFunctionsLoader.loadBaseFunctions();
    createVkInstance(&stackMemory);
    VulkanFunctionsLoader.loadInstanceFunctions();
    //     if (VulkanGlobalState.enableValidationLayers)
    //         VK_CHECK(Vulkan.vkCreateDebugUtilsMessengerEXT(VulkanGlobalState._instance, &debugCreateInfo, 0, &VulkanGlobalState._debugMessenger));
    if (!SDL.SDL_Vulkan_CreateSurface(WindowGlobalState._window, @ptrCast(VulkanGlobalState._instance), null, @ptrCast(&VulkanGlobalState._surface)))
    {
        print("failed to create window surface!\n", .{});
        exit(0);
    }
    createVkDevice(&stackMemory);
    VulkanFunctionsLoader.loadDeviceFunctions();
    Vulkan.vkGetDeviceQueue(VulkanGlobalState._device, VulkanGlobalState._graphicsQueueFamily, 0, &VulkanGlobalState._graphicsQueue);
}
pub fn deinitBaseVulkan() void
{
    Vulkan.vkDestroyDevice(VulkanGlobalState._device, 0);
    Vulkan.vkDestroySurfaceKHR(VulkanGlobalState._instance, VulkanGlobalState._surface, 0);
    //     if (VulkanGlobalState.enableValidationLayers)
    //         Vulkan.vkDestroyDebugUtilsMessengerEXT(VulkanGlobalState._instance, VulkanGlobalState._debugMessenger, 0);
    Vulkan.vkDestroyInstance(VulkanGlobalState._instance, 0);
}

pub fn createVkCommandPool() void
{
	// create a command pool for commands submitted to the graphics queue
	const commandPoolInfo = Vulkan.VkCommandPoolCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO,
		//the command pool will be one that can submit graphics commands
		.queueFamilyIndex = VulkanGlobalState._graphicsQueueFamily,
		//we also want the pool to allow for resetting of individual command buffers
        .flags = Vulkan.VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT,
	};
    for(0..VulkanGlobalState.FRAME_OVERLAP) |i|
    {
        _ = Vulkan.vkCreateCommandPool(VulkanGlobalState._device, &commandPoolInfo, null, &VulkanGlobalState._commandPools[i]);
        const cmdAllocInfo = Vulkan.VkCommandBufferAllocateInfo
        {
            .sType = Vulkan.VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO,
            //commands will be made from our _commandPool
            .commandPool = VulkanGlobalState._commandPools[i],
            .commandBufferCount = 1,
            // command level is Primary
            .level = Vulkan.VK_COMMAND_BUFFER_LEVEL_PRIMARY,
        };
        _ = Vulkan.vkAllocateCommandBuffers(VulkanGlobalState._device, &cmdAllocInfo, &VulkanGlobalState._commandBuffers[i]);
    }
}
pub fn destroyVkCommandPool() void
{
    for(0..VulkanGlobalState.FRAME_OVERLAP) |i|
    {
//         print("vkDestroyCommandPool: {?}\n", .{Vulkan.vkDestroyCommandPool});
        Vulkan.vkDestroyCommandPool(VulkanGlobalState._device, VulkanGlobalState._commandPools[i], null);
    }
}
pub fn init_sync_structures() void
{
    const fenceCreateInfo = Vulkan.VkFenceCreateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_FENCE_CREATE_INFO,
        //we want to create the fence with the Create Signaled flag, so we can wait on it before using it on a GPU command (for the first frame)
        .flags = Vulkan.VK_FENCE_CREATE_SIGNALED_BIT,
    };
    const semaphoreCreateInfo = Vulkan.VkSemaphoreCreateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO,
    };
//     print("vkCreateFence: {?}\n", .{Vulkan.vkCreateFence});
//     print("vkCreateSemaphore: {?}\n", .{Vulkan.vkCreateSemaphore});
    for(0..VulkanGlobalState.FRAME_OVERLAP) |i|
    {
//         print("vkCreateFence: {?}\n", .{Vulkan.vkCreateFence});
        VK_CHECK(Vulkan.vkCreateFence(VulkanGlobalState._device, &fenceCreateInfo, null, &VulkanGlobalState._renderFences[i]));
        VK_CHECK(Vulkan.vkCreateSemaphore(VulkanGlobalState._device, &semaphoreCreateInfo, null, &VulkanGlobalState._swapchainSemaphores[i]));
        VK_CHECK(Vulkan.vkCreateSemaphore(VulkanGlobalState._device, &semaphoreCreateInfo, null, &VulkanGlobalState._renderSemaphores[i]));
    }
//     VK_CHECK(Vulkan.vkCreateFence(VulkanGlobalState._device, &fenceCreateInfo, null, &VulkanGlobalState._renderFences[0]));
//     VK_CHECK(Vulkan.vkCreateSemaphore(VulkanGlobalState._device, &semaphoreCreateInfo, null, &VulkanGlobalState._swapchainSemaphores[0]));
//     for(0..3) |i|
//     {
//     //         VK_CHECK(Vulkan.vkCreateFence(VulkanGlobalState._device, &fenceCreateInfo, null, &VulkanGlobalState._renderFences[i]));
//
//     //         VK_CHECK(Vulkan.vkCreateSemaphore(VulkanGlobalState._device, &semaphoreCreateInfo, null, &VulkanGlobalState._swapchainSemaphores[i]));
//         VK_CHECK(Vulkan.vkCreateSemaphore(VulkanGlobalState._device, &semaphoreCreateInfo, null, &VulkanGlobalState._renderSemaphores[i]));
//     }
}
pub fn deinit_sync_structures() void
{
    for(0..VulkanGlobalState.FRAME_OVERLAP) |i|
    {
        _ = Vulkan.vkDestroyFence(VulkanGlobalState._device, VulkanGlobalState._renderFences[i], null);

        _ = Vulkan.vkDestroySemaphore(VulkanGlobalState._device, VulkanGlobalState._swapchainSemaphores[i], null);
        _ = Vulkan.vkDestroySemaphore(VulkanGlobalState._device, VulkanGlobalState._renderSemaphores[i], null);
    }
//     _ = Vulkan.vkDestroyFence(VulkanGlobalState._device, VulkanGlobalState._renderFences[0], null);
//     _ = Vulkan.vkDestroySemaphore(VulkanGlobalState._device, VulkanGlobalState._swapchainSemaphores[0], null);
//     for(0..3) |i|
//     {
//     //         _ = Vulkan.vkDestroyFence(VulkanGlobalState._device, VulkanGlobalState._renderFences[i], null);
//
//     //         _ = Vulkan.vkDestroySemaphore(VulkanGlobalState._device, VulkanGlobalState._swapchainSemaphores[i], null);
//         _ = Vulkan.vkDestroySemaphore(VulkanGlobalState._device, VulkanGlobalState._renderSemaphores[i], null);
//     }
}
pub fn createTextureSampler() void
{
	const samplerInfo = Vulkan.VkSamplerCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO,
		// VK_FILTER_NEAREST
		// VK_FILTER_LINEAR
		.magFilter = Vulkan.VK_FILTER_LINEAR,
		.minFilter = Vulkan.VK_FILTER_LINEAR,
		// VK_SAMPLER_MIPMAP_MODE_NEAREST
		// VK_SAMPLER_MIPMAP_MODE_LINEAR
        .mipmapMode = Vulkan.VK_SAMPLER_MIPMAP_MODE_LINEAR,
//         .mipmapMode = Vulkan.VK_SAMPLER_MIPMAP_MODE_NEAREST,
//     .addressModeU = Vulkan.VK_SAMPLER_ADDRESS_MODE_REPEAT,
//     .addressModeV = Vulkan.VK_SAMPLER_ADDRESS_MODE_REPEAT,
//     .addressModeW = Vulkan.VK_SAMPLER_ADDRESS_MODE_REPEAT,
//      .mipLodBias
        .anisotropyEnable = Vulkan.VK_TRUE,
        .maxAnisotropy = VulkanGlobalState._deviceProperties.limits.maxSamplerAnisotropy,
		.compareEnable = Vulkan.VK_FALSE,
		.compareOp = Vulkan.VK_COMPARE_OP_NEVER,//VK_COMPARE_OP_ALWAYS
		.minLod = 0.0,
		.maxLod = Vulkan.VK_LOD_CLAMP_NONE,
//         .borderColor = Vulkan.VK_BORDER_COLOR_INT_OPAQUE_BLACK,
//         .unnormalizedCoordinates = Vulkan.VK_FALSE,
	};
	VK_CHECK(Vulkan.vkCreateSampler(VulkanGlobalState._device, &samplerInfo, null, &VulkanGlobalState._textureSampler));
}
