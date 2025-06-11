const std = @import("std");
const builtin = @import("builtin");
const linux = std.os.linux;
const print = std.debug.print;
const exit = std.process.exit;

const SDL = @import("SDL3.zig");
const Vulkan = @import("Vulkan.zig");
// const Vulkan = switch (builtin.os.tag) {
//     .windows => @import("Vulkan_Windows.zig"),
//     .linux => @import("Vulkan_Linux.zig"),
//     else => @compileError("Unsupported OS")
// };

const GlobalState = @import("GlobalState.zig");
const WindowGlobalState = @import("WindowGlobalState.zig");
const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;
//
const CustomMem = @import("CustomMem.zig");
const CustomFS = @import("CustomFS.zig");
// const PageAllocator = @import("PageAllocator.zig");
// const memcpy = CustomMem.memcpy;
// // const memcmp = CustomMem.memcmp;
//
const VkBuffer = @import("VkBuffer.zig");
const VkImage = @import("VkImage.zig");
//
const InitVulkan = @import("InitVulkan.zig");
const VkSwapchain = @import("VkSwapchain.zig");
//
const Camera = @import("Camera.zig");
const Image = @import("Image.zig");
//
const AoW3_clb_custom = @import("AoW3_clb_custom.zig");
const AoW4_clb_custom = @import("AoW4_clb_custom.zig");
// const AoW4_clb = @import("AoW4_clb.zig");
// const AoW4_SGH = @import("AoW4_SGH.zig");
// const clb_custom = @import("clb_custom.zig");

const Square = @import("Square.zig");
const Hex = @import("Hex.zig");
const Simplexnoise1234 = @import("Simplexnoise1234.zig");

fn transitionImage(cmd: Vulkan.VkCommandBuffer, image: Vulkan.VkImage, srcStageMask: Vulkan.VkPipelineStageFlags2, dstStageMask: Vulkan.VkPipelineStageFlags2, srcAccessMask: Vulkan.VkAccessFlags2, dstAccessMask: Vulkan.VkAccessFlags2, currentLayout: Vulkan.VkImageLayout, newLayout: Vulkan.VkImageLayout) void
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
pub fn main() void
{
	defer GlobalState.arena.deinit();
    GlobalState.allocator, const is_debug = comptime switch(builtin.mode)
    {
        .Debug, .ReleaseSafe => .{GlobalState.debugAllocator.allocator(), true},
        .ReleaseFast, .ReleaseSmall => .{std.heap.smp_allocator, false},
    };
    defer
    {
        if(is_debug)
            _ = GlobalState.debugAllocator.deinit();
    }
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const arenaAllocator = arena.allocator();

//     const memoryTest: []u8 = globalState.PageAllocator.map(1024*1024, std.mem.Alignment.fromByteUnits(4096)).?;
//     globalState.PageAllocator.unmap(@alignCast(memoryTest));
//     const argv = std.os.argv;
//     std.debug.print("{s}\n", .{argv[0]});

    _ = SDL.SDL_Init(SDL.SDL_INIT_VIDEO);
    defer _ = SDL.SDL_Quit();
    WindowGlobalState._window = SDL.SDL_CreateWindow(
        "Vulkan Engine",
        //512, 512,
        @intCast(WindowGlobalState._windowExtent.width),
        @intCast(WindowGlobalState._windowExtent.height),
        WindowGlobalState._window_flags
    );
    defer _ = SDL.SDL_DestroyWindow(WindowGlobalState._window);
    InitVulkan.initBaseVulkan();
    defer InitVulkan.deinitBaseVulkan();
//     exit(0);
    VkSwapchain.createVkSwapchain();
    defer VkSwapchain.destroyVkSwapchain();
    VkSwapchain.createDepthResources();
    defer VkSwapchain.destroyDepthResources();
    InitVulkan.createVkCommandPool();
    defer InitVulkan.destroyVkCommandPool();
    InitVulkan.init_sync_structures();
    defer InitVulkan.deinit_sync_structures();
    InitVulkan.createTextureSampler();
    defer Vulkan.vkDestroySampler(VulkanGlobalState._device, VulkanGlobalState._textureSampler, null);
    Camera.createCameraBuffers();
    defer Camera.destroyCameraBuffers();
    Camera.createCameraVkDescriptorSetLayout();
    defer Vulkan.vkDestroyDescriptorSetLayout(VulkanGlobalState._device, Camera._cameraDescriptorSetLayout, null);
    Camera.createCameraVkDescriptorPool();
    defer Vulkan.vkDestroyDescriptorPool(VulkanGlobalState._device, Camera._cameraDescriptorPool, null);
    Camera.createCameraVkDescriptorSets();

//     print("{d}\n", .{@sizeOf(linux.Stat)});
//     const AoW3_dirfd: i32 = @intCast(linux.open("Age of Wonders 3/Content", .{.ACCMODE = .RDONLY}, mode));
// //     defer _ = linux.close(AoW3_dirfd);
//     defer _ = CustomFS.close(AoW3_dirfd);
    const AoW3_dirfd_dst: std.posix.fd_t = CustomFS.open("AoW3", .{.ACCMODE = .RDONLY, .DIRECTORY = true});
//     const AoW3_dirfd_dst: std.posix.fd_t = CustomFS.open("main", .{.ACCMODE = .RDONLY});
    defer _ = CustomFS.close(AoW3_dirfd_dst);
//
//     const AoW4_dirfd: i32 = @intCast(linux.open("Age of Wonders 4/Content", .{.ACCMODE = .RDONLY}, mode));
//     defer _ = linux.close(AoW4_dirfd);
//
//
//     var textureIndex: u64 = 0;
    var AoW3_archive: AoW3_clb_custom.ArchiveGPU = undefined;
//     AoW3_archive.texturesCount = 0;
    defer AoW3_archive.unload();
//     var AoW4_archive: AoW4_clb_custom.ArchiveGPU = undefined;
//     defer AoW4_archive.unload();
// //
//     var archiveTempMemory: []u8 = undefined;
// "Title/Libraries/Terrain/Temp_TerrainTextures.clb"
    AoW3_clb_custom.clb_custom_read(arenaAllocator, "Title/Libraries/Terrain/Temp_TerrainTextures.clb", AoW3_dirfd_dst, &AoW3_archive);
//     AoW4_clb_custom.clb_convert(&archiveTempMemory, "Title/Libraries/Strategic/Pickup_Strategic.clb", AoW4_dirfd);
//     PageAllocator.unmap(archiveTempMemory);
//     AoW4_clb_custom.clb_custom_read(arenaAllocator, "clb_custom.raw", &AoW4_archive);
//     print("fd: {d}\n", .{@sizeOf(std.posix.fd_t)});
//     print("NTSTATUS: {d}\n", .{@sizeOf(std.os.windows.NTSTATUS)});
    //     AoW4_clb_custom.createDescriptorsData(&AoW4_archive);
//     print("O: {d}\n", .{@sizeOf(linux.O)});
    Hex.Create_DiffuseMaterial_VkDescriptorSetLayout(AoW3_archive.texturesCount, &AoW3_archive.descriptorSetLayout);
    Hex.Create_DiffuseMaterial_VkDescriptorPool(AoW3_archive.texturesCount, &AoW3_archive.descriptorPool);
    Hex.Create_DiffuseMaterial_VkDescriptorSet(AoW3_archive.texturesCount, AoW3_archive.textures, AoW3_archive.descriptorSetLayout, AoW3_archive.descriptorPool, &AoW3_archive.descriptorSet);
    _ = GlobalState.arena.reset(.free_all);
//     print("{?}\n", .{globalState.gpa.detectLeaks()});
    // Palette
{

    // Grassland 00
//  var colorTable = [4*8]u8
//  {
//      98, 71, 41, 255,
//      58, 71, 20, 255,
//      84, 89, 32, 255,
//      61, 92, 15, 255,
//      61, 84, 20, 255,
//      55, 92, 14, 255,
//      46, 113, 19, 255,
//      75, 109, 20, 255,
//  };
    // Forest 00
//  var colorTable = [4*8]u8
//  {
//      72, 85, 20, 255,
//      80, 82, 34, 255,
//      57, 64, 34, 255,
//      41, 50, 28, 255,
//      82, 48, 17, 255,
//      85, 65, 45, 255,
//      75, 67, 53, 255,
//      80, 64, 17, 255,
//  };
    // Water Deep 00
//  var colorTable = [4*8]u8
//  {
//      125, 107, 62, 255,
//      118, 101, 59, 255,
//      111, 96, 56, 255,
//      104, 90, 52, 255,
//      97, 85, 50, 255,
//      90, 79, 47, 255,
//      83, 74, 44, 255,
//      77, 69, 41, 255,
//  };
//  const palette = Image.Image
//  {
//      .data = &colorTable,
//      .mipSize = 4*8,
//      .size = 4*8,
//      .width = 8,
//      .height = 1,
//      .mipsCount = 1,
//      .alignment = 1,
//      .format = Vulkan.VK_FORMAT_R8G8B8A8_SRGB,
//  };
//  var paletteTexture: Image.Texture = undefined;
//  var paletteVkDeviceMemory: Vulkan.VkDeviceMemory = undefined;
//  VkImage.createVkImages__VkImageViews__VkDeviceMemory(@ptrCast(&palette), @ptrCast(&paletteTexture), 1, &paletteVkDeviceMemory);
//  defer
//  {
//      paletteTexture.unload();
//      Vulkan.vkFreeMemory(VulkanGlobalState._device, paletteVkDeviceMemory, null);
//  }
//  Hex.createHexPaletteSampler();
//  defer Vulkan.vkDestroySampler(VulkanGlobalState._device, Hex._paletteSampler, null);
//  var HexsData_DescriptorSetLayout: Vulkan.VkDescriptorSetLayout = undefined;
//  var HexsData_DescriptorPool: Vulkan.VkDescriptorPool = undefined;
//  var HexsData_DescriptorSet: Vulkan.VkDescriptorSet = undefined;
//  Hex.Create_HexsData_VkDescriptorSetLayout(&HexsData_DescriptorSetLayout);
//  Hex.Create_HexsData_VkDescriptorPool(&HexsData_DescriptorPool);
//  Hex.Create_HexsData_VkDescriptorSet(paletteTexture.vkImageView, HexsData_DescriptorSetLayout, HexsData_DescriptorPool, &HexsData_DescriptorSet);
//  defer
//  {
//      Vulkan.vkDestroyDescriptorSetLayout(VulkanGlobalState._device, HexsData_DescriptorSetLayout, null);
//      Vulkan.vkDestroyDescriptorPool(VulkanGlobalState._device, HexsData_DescriptorPool, null);
//  }
}
    // Hex
    const distanceSize = 2;
    const HexVertices = [6]Hex.Vertex
    {
        .{
            .position = [3]f32{0, -1*distanceSize, 0},
        },
        .{
            .position = [3]f32{@sqrt(3.0)/2.0*distanceSize, -0.5*distanceSize, 0},
        },
        .{
            .position = [3]f32{@sqrt(3.0)/2.0*distanceSize, 0.5*distanceSize, 0},
        },
        .{
            .position = [3]f32{0, 1*distanceSize, 0},
        },
        .{
            .position = [3]f32{-@sqrt(3.0)/2.0*distanceSize, 0.5*distanceSize, 0},
        },
        .{
            .position = [3]f32{-@sqrt(3.0)/2.0*distanceSize, -0.5*distanceSize, 0},
        },
    };
//     const HexIndices = [12]u16{
//         0, 2, 4,
//         0, 1, 2,
//         2, 3, 4,
//         4, 5, 0,
//     };
    var HexVkVertexBufferAddress: Vulkan.VkDeviceAddress = undefined;
    var HexVkVertexBuffer: Vulkan.VkBuffer = undefined;
    var HexVkVertexDeviceMemory: Vulkan.VkDeviceMemory = undefined;
    VkBuffer.createVkBuffer__VkDeviceMemory__VkDeviceAddress(Vulkan.VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT, @ptrCast(&HexVertices), @sizeOf(Hex.Vertex)*6, &HexVkVertexBufferAddress, &HexVkVertexBuffer, &HexVkVertexDeviceMemory);
//     VkBuffer.createVkBuffer__VkDeviceMemory(Vulkan.VK_BUFFER_USAGE_VERTEX_BUFFER_BIT, @ptrCast(&SquareVertices), @sizeOf(Square.Vertex)*4, &HexVkVertexBuffer, &HexVkVertexDeviceMemory);
    defer
    {
        Vulkan.vkDestroyBuffer(VulkanGlobalState._device, HexVkVertexBuffer, null);
        Vulkan.vkFreeMemory(VulkanGlobalState._device, HexVkVertexDeviceMemory, null);
    }
//     var HexVkIndexBuffer: Vulkan.VkBuffer = undefined;
//     var HexVkIndexDeviceMemory: Vulkan.VkDeviceMemory = undefined;
//     VkBuffer.createVkBuffer__VkDeviceMemory(Vulkan.VK_BUFFER_USAGE_INDEX_BUFFER_BIT, @ptrCast(&HexIndices), @sizeOf(u16)*12, &HexVkIndexBuffer, &HexVkIndexDeviceMemory);
// //     VkBuffer.createVkBuffer__VkDeviceMemory(Vulkan.VK_BUFFER_USAGE_INDEX_BUFFER_BIT, @ptrCast(&SquareIndices), @sizeOf(u16)*6, &HexVkIndexBuffer, &HexVkIndexDeviceMemory);
//     defer
//     {
//         Vulkan.vkDestroyBuffer(VulkanGlobalState._device, HexVkIndexBuffer, null);
//         Vulkan.vkFreeMemory(VulkanGlobalState._device, HexVkIndexDeviceMemory, null);
//     }
    // Square
{
//     const SquareVertices = [4]Square.Vertex
//     {
//         .{
//             .position = [3]f32{-1, -1, 0},
//             .uv = [2]f32{0, 0},
//         },
//         .{
//             .position = [3]f32{1, -1, 0},
//             .uv = [2]f32{1, 0},
//         },
//         .{
//             .position = [3]f32{1, 1, 0},
//             .uv = [2]f32{1, 1},
//         },
//         .{
//             .position = [3]f32{-1, 1, 0},
//             .uv = [2]f32{0, 1},
//         }
//     };
//     const SquareIndices = [6]u16
//     {
//         0,1,2,
//         2,3,0
//     };
//     var SquareVkVertexBuffer: Vulkan.VkBuffer = undefined;
//     var SquareVkVertexDeviceMemory: Vulkan.VkDeviceMemory = undefined;
// //     VkBuffer.createVkBuffer__VkDeviceMemory(Vulkan.VK_BUFFER_USAGE_VERTEX_BUFFER_BIT, @ptrCast(&HexVertices), @sizeOf(Hex.Vertex)*6, &HexVkVertexBuffer, &HexVkVertexDeviceMemory);
//     VkBuffer.createVkBuffer__VkDeviceMemory(Vulkan.VK_BUFFER_USAGE_VERTEX_BUFFER_BIT, @ptrCast(&SquareVertices), @sizeOf(Square.Vertex)*4, &SquareVkVertexBuffer, &SquareVkVertexDeviceMemory);
//     defer
//     {
//         Vulkan.vkDestroyBuffer(VulkanGlobalState._device, SquareVkVertexBuffer, null);
//         Vulkan.vkFreeMemory(VulkanGlobalState._device, SquareVkVertexDeviceMemory, null);
//     }
//     var SquareVkIndexBuffer: Vulkan.VkBuffer = undefined;
//     var SquareVkIndexDeviceMemory: Vulkan.VkDeviceMemory = undefined;
// //     VkBuffer.createVkBuffer__VkDeviceMemory(Vulkan.VK_BUFFER_USAGE_INDEX_BUFFER_BIT, @ptrCast(&HexIndices), @sizeOf(u16)*12, &HexVkIndexBuffer, &HexVkIndexDeviceMemory);
//     VkBuffer.createVkBuffer__VkDeviceMemory(Vulkan.VK_BUFFER_USAGE_INDEX_BUFFER_BIT, @ptrCast(&SquareIndices), @sizeOf(u16)*6, &SquareVkIndexBuffer, &SquareVkIndexDeviceMemory);
//     defer
//     {
//         Vulkan.vkDestroyBuffer(VulkanGlobalState._device, SquareVkIndexBuffer, null);
//         Vulkan.vkFreeMemory(VulkanGlobalState._device, SquareVkIndexDeviceMemory, null);
//     }
}
    const mapDimension = 100;
    var hexsData: [mapDimension*mapDimension]Hex.HexData = undefined;
    //
    const verticalSpacing = 1.5 * distanceSize;
    const horizontalSpacing = @sqrt(3.0) * distanceSize;
//     var _000_025: u64 = 0;
//     var _025_050: u64 = 0;
//     var _050_075: u64 = 0;
//     var _075_100: u64 = 0;
    for(0..mapDimension) |y|
    {
        for(0..mapDimension) |x|
        {
            const i = mapDimension*y+x;
            const horisontal: f32 =  horizontalSpacing * CustomMem.u64Tof32(x);
            const vertical: f32 = verticalSpacing * CustomMem.u64Tof32(y);
            if(y % 2 == 0)
            {
                hexsData[i].x = horisontal;
                hexsData[i].y = vertical;
            }
            else
            {
                hexsData[i].x = horisontal - @sqrt(3.0)/2.0*distanceSize;
                hexsData[i].y = vertical;
            }
            const frequency = 1.0/32.0;
            const noiseRes = (Simplexnoise1234.snoise2(hexsData[i].x*frequency, hexsData[i].y*frequency));
//             const amplitude = 1.0+0.5+0.25;
//             var noiseRes = (Simplexnoise1234.snoise2(CustomMem.u64Tof32(x)*frequency, CustomMem.u64Tof32(y)*frequency)) +
//             0.5*(Simplexnoise1234.snoise2(2*CustomMem.u64Tof32(x)*frequency, 2*CustomMem.u64Tof32(y)*frequency)) +
//             0.25*(Simplexnoise1234.snoise2(4*CustomMem.u64Tof32(x)*frequency, 4*CustomMem.u64Tof32(y)*frequency));
//             noiseRes /= amplitude;
            if(noiseRes < 0.25)
            {
//                 _000_025+=1;
                hexsData[i].textureIndex = 4;
            }
            else if(noiseRes < 0.5)
            {
//                 _025_050+=1;
                hexsData[i].textureIndex = 5;
            }
            else if(noiseRes < 0.75)
            {
//                 _050_075+=1;
                hexsData[i].textureIndex = 9;
            }
            else
            {
//                 _075_100+=1;
                hexsData[i].textureIndex = 11;
            }
//          17 — Forest 00
//          14 — Grass 01
//             hexsData[i].textureIndex = 9;
//          if(i % 4 == 0)
//          {
//             hexsData[i].textureIndex = 4;
//         }
//         else if(i % 4 == 1)
//         {
//             hexsData[i].textureIndex = 5;
//         }
//         else if(i % 4 == 2)
//         {
//             hexsData[i].textureIndex = 9;
//         }
//         else if(i % 4 == 3)
//         {
//             hexsData[i].textureIndex = 11;
//         }
//         else
//         {hexsData[i].textureIndex = 0;}
        }
    }
//     print("00 — 25: {d}\n", .{_000_025});
//     print("25 — 50: {d}\n", .{_025_050});
//     print("50 — 75: {d}\n", .{_050_075});
//     print("75 — 100: {d}\n", .{_075_100});
// //
    // Vertex instance buffer
    var hexsDataVkDeviceAddress: Vulkan.VkDeviceAddress = undefined;
    var hexsDataBuffer: Vulkan.VkBuffer = undefined;
    var hexsDataVkDeviceMemory: Vulkan.VkDeviceMemory = undefined;
    VkBuffer.createVkBuffer__VkDeviceMemory__VkDeviceAddress(Vulkan.VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT, @ptrCast(&hexsData), @sizeOf(Hex.HexData)*mapDimension*mapDimension, &hexsDataVkDeviceAddress,&hexsDataBuffer, &hexsDataVkDeviceMemory);
    defer
    {
        Vulkan.vkDestroyBuffer(VulkanGlobalState._device, hexsDataBuffer, null);
        Vulkan.vkFreeMemory(VulkanGlobalState._device, hexsDataVkDeviceMemory, null);
    }
//     const VkBufferDeviceAddressInfo = Vulkan.VkBufferDeviceAddressInfo
//     {
//         .sType = Vulkan.VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO,
//         .buffer = HexsVertexDataVkVertexBuffer
//     };
//     const vertexDataVkVertexBufferAddress = Vulkan.vkGetBufferDeviceAddress(VulkanGlobalState._device, &VkBufferDeviceAddressInfo);
//     _ = vertexDataVkVertexBufferAddress;
    // Square noise map
    var noiseBuffer: [mapDimension*mapDimension]u8 = undefined;
    for(0..mapDimension) |y|
    {
        for(0..mapDimension) |x|
        {
            const i = mapDimension*y+x;
            noiseBuffer[i] = @intFromFloat((Simplexnoise1234.snoise2(CustomMem.u64Tof32(x), CustomMem.u64Tof32(y)) * 0.5 + 0.5)*255.0);
        }
    }
    const noiseMap = Image.Image
    {
        .data = &noiseBuffer,
        .mipSize = mapDimension*mapDimension,
        .size = mapDimension*mapDimension,
        .width = mapDimension,
        .height = mapDimension,
        .mipsCount = 1,
        .alignment = 1,
        .format = Vulkan.VK_FORMAT_R8_UNORM,
    };
    var noiseTexture: Image.Texture = undefined;
    var noiseVkDeviceMemory: Vulkan.VkDeviceMemory = undefined;
    VkImage.createVkImages__VkImageViews__VkDeviceMemory(@ptrCast(&noiseMap), @ptrCast(&noiseTexture), 1, &noiseVkDeviceMemory);
    defer
    {
        noiseTexture.unload();
        Vulkan.vkFreeMemory(VulkanGlobalState._device, noiseVkDeviceMemory, null);
    }
    //  Hex.createHexPaletteSampler();
//      defer Vulkan.vkDestroySampler(VulkanGlobalState._device, Hex._paletteSampler, null);
    var noiseMap_DescriptorSetLayout: Vulkan.VkDescriptorSetLayout = undefined;
    var noiseMap_DescriptorPool: Vulkan.VkDescriptorPool = undefined;
    var noiseMap_DescriptorSet: Vulkan.VkDescriptorSet = undefined;
    Hex.Create_DiffuseMaterial_VkDescriptorSetLayout(1, &noiseMap_DescriptorSetLayout);
    Hex.Create_DiffuseMaterial_VkDescriptorPool(1, &noiseMap_DescriptorPool);
    Hex.Create_DiffuseMaterial_VkDescriptorSet(1, @ptrCast(&noiseTexture), noiseMap_DescriptorSetLayout, noiseMap_DescriptorPool, &noiseMap_DescriptorSet);
    defer
    {
        Vulkan.vkDestroyDescriptorSetLayout(VulkanGlobalState._device, noiseMap_DescriptorSetLayout, null);
        Vulkan.vkDestroyDescriptorPool(VulkanGlobalState._device, noiseMap_DescriptorPool, null);
    }
    var Hex_Pipeline: Vulkan.VkPipeline = null;
    var Hex_PipelineLayout: Vulkan.VkPipelineLayout = null;
    Hex.Create_Hex_Pipeline(AoW3_archive.descriptorSetLayout, &Hex_PipelineLayout, &Hex_Pipeline);
    defer
    {
        Vulkan.vkDestroyPipeline(VulkanGlobalState._device, Hex_Pipeline, null);
        Vulkan.vkDestroyPipelineLayout(VulkanGlobalState._device, Hex_PipelineLayout, null);
    }
    var Square_Pipeline: Vulkan.VkPipeline = null;
    var Square_PipelineLayout: Vulkan.VkPipelineLayout = null;
    Square.Create_Square_Pipeline(noiseMap_DescriptorSetLayout, &Square_PipelineLayout, &Square_Pipeline);
    defer
    {
        Vulkan.vkDestroyPipeline(VulkanGlobalState._device, Square_Pipeline, null);
        Vulkan.vkDestroyPipelineLayout(VulkanGlobalState._device, Square_PipelineLayout, null);
    }
{
// //  AoW4_SGH.import(arenaAllocator, "/home/dima/Документи/Paradox Interactive/Age of Wonders 4/Storage/Save/580d6c33-3bad-4d62-b7a0-134a2a01a12b/Strategic Turn 1");
//     // Age of Wonders 4
//
//     // Figure_Skin
//         // Penguin_Skin
//         // Succubus_Skin
//     // Strategic
//         // SilvertongueFruit_Strategic
//         // FireforgeStone_Strategic
//         // Spawner_Dragons_Strategic
//         // Spawner_Graveyard_Strategic
//         // Spawner_Large_Monster_Strategic
//         // Spawner_Ritual_Strategic
//         // Spawner_Small_Monster_Strategic
//         // Terrain_Shared_Void_Strategic
//         // Terrain_Textures_Strategic
//         // Terrain
//             // Foam
//             // Terrain_Shared_LavaCoasts_Strategic
//     // Tactical
//         // Terrain_Textures_Tactical
//
//
// //     var meshes: [*]AoW4_clb.Mesh = undefined;
// //     var meshesVerticesVkDeviceMemory: Vulkan.VkDeviceMemory = undefined;
// //     var meshesIndicesVkDeviceMemory: Vulkan.VkDeviceMemory = undefined;
// //     var meshesCount: u64 = undefined;
//
// //     var modelsCount: u64 = undefined;
// //     var materialsCount: u64 = undefined;
// // //     print("{d}\n", .{@sizeOf(Vulkan.VkBufferImageCopy)});
//
// //  var textures: [*]AoW4_clb.Texture = undefined;
// //  var texturesVkDeviceMemory: Vulkan.VkDeviceMemory = undefined;
// //  var texturesCount: u64 = undefined;
// //  var meshes: [*]AoW4_clb.Mesh = undefined;
// //  var meshesVerticesVkDeviceMemory: Vulkan.VkDeviceMemory = undefined;
// //  var meshesIndicesVkDeviceMemory: Vulkan.VkDeviceMemory = undefined;
// //  var meshesCount: u64 = undefined;
// //  var modelsCount: u64 = undefined;
// //  var materialsCount: u64 = undefined;
// //     AoW4_clb.load(allocator, "Age of Wonders 4/Content/Title/Libraries/Strategic/Terrain_Textures_Strategic.clb", &textures, &texturesVkDeviceMemory, &texturesCount, &meshes, &meshesVerticesVkDeviceMemory, &meshesIndicesVkDeviceMemory, &meshesCount, &modelsCount, &materialsCount);
// //     defer if(meshesCount > 0)
// //     {
// //         for(0..meshesCount) |i|
// //             meshes[i].unload();
// //         Vulkan.vkFreeMemory(VulkanGlobalState._device, meshesVerticesVkDeviceMemory, null);
// //         Vulkan.vkFreeMemory(VulkanGlobalState._device, meshesIndicesVkDeviceMemory, null);
// //     };
}
    var e: SDL.SDL_Event = undefined;
    var bQuit: bool = false;
    // //     bQuit = true;
    var windowPresent: bool = true;
    //
    var currentFrame: usize = 0;
    const cameraMove = 1;
// var swapchainImageIndex: u32 = undefined;
    while (!bQuit)
    {
        //Handle events on queue
        while (SDL.SDL_PollEvent(&e))
        {
            switch(e.type)
            {
                SDL.SDL_EVENT_QUIT =>
                {
                    bQuit = true;
                },
    //              e.window.
                SDL.SDL_EVENT_WINDOW_SHOWN =>
                {
                    windowPresent = true;
                },
                SDL.SDL_EVENT_WINDOW_HIDDEN =>
                {
                    windowPresent = false;
                },
                SDL.SDL_EVENT_KEY_DOWN =>
                {
                    switch(e.key.scancode)
                    {
                        // камера
                        SDL.SDL_SCANCODE_D =>
                        {
                            Camera.camera_translate_x+=cameraMove;
                        },
                        SDL.SDL_SCANCODE_A =>
                        {
                            Camera.camera_translate_x-=cameraMove;
                        },
                        // Y
                        SDL.SDL_SCANCODE_W =>
                        {
                            Camera.camera_translate_z+=cameraMove;
                        },
                        SDL.SDL_SCANCODE_S =>
                        {
                            Camera.camera_translate_z-=cameraMove;
                        },
                        // Z
                        SDL.SDL_SCANCODE_E =>
                        {
                            Camera.camera_translate_y+=cameraMove;
                        },
                        SDL.SDL_SCANCODE_Q =>
                        {
                            Camera.camera_translate_y-=cameraMove;
                        },
                        SDL.SDL_SCANCODE_O =>
                        {
                            //AoW4_meshIndex-=1;
                            //if(AoW4_meshIndex < 0)
                                //AoW4_meshIndex = 0;
                        },
                        SDL.SDL_SCANCODE_P =>
                        {
                            //AoW4_meshIndex+=1;
                            //if(AoW4_meshIndex == AoW4_meshesCount)
                                //AoW4_meshIndex-=1;
                        },
                        SDL.SDL_SCANCODE_K =>
                        {
//                             if(textureIndex != 0)
//                                 textureIndex-=1;
    //                          if(textureIndex < 0)
    //                              textureIndex = 0;
                        },
                        SDL.SDL_SCANCODE_L =>
                        {
//                             textureIndex+=1;
//                             if(textureIndex == AoW3_archive.texturesCount)
//                                 textureIndex-=1;
                        },
                        // повороты
                        SDL.SDL_SCANCODE_UP =>
                        {
                            Camera.camera_rotate_x-=5;
                        },
                        SDL.SDL_SCANCODE_DOWN =>
                        {
                            Camera.camera_rotate_x+=5;
                        },
                        SDL.SDL_SCANCODE_LEFT =>
                        {
                            Camera.camera_rotate_z-=5;
                        },
                        SDL.SDL_SCANCODE_RIGHT =>
                        {
                            Camera.camera_rotate_z+=5;
                        },
                        else =>{}
                    }
                },
                else =>{}
            }
        }
        if (!windowPresent)//SDL_GetWindowFlags(_window) & SDL_WINDOW_MINIMIZED
        {
            SDL.SDL_Delay(50);
        }
        else
        {
            var swapchainImageIndex: u32 = 0;
            const cmd = VulkanGlobalState._commandBuffers[currentFrame];
            //wait until the gpu has finished rendering the last frame
            VK_CHECK(Vulkan.vkWaitForFences(VulkanGlobalState._device, 1, &VulkanGlobalState._renderFences[currentFrame], Vulkan.VK_TRUE, Vulkan.UINT64_MAX));
            VK_CHECK(Vulkan.vkResetFences(VulkanGlobalState._device, 1, &VulkanGlobalState._renderFences[currentFrame]));
            Camera.updateCameraBuffer(currentFrame);
            //request image from the swapchain
            var result: Vulkan.VkResult = undefined;
            result = Vulkan.vkAcquireNextImageKHR(VulkanGlobalState._device, VulkanGlobalState._swapchain, Vulkan.UINT64_MAX, VulkanGlobalState._swapchainSemaphores[currentFrame], null, &swapchainImageIndex);
            if (result == Vulkan.VK_ERROR_OUT_OF_DATE_KHR)
            {
                VkSwapchain.recreateVkSwapchainKHR();
            }
//             print("swapchainImageIndex: {d}\n", .{swapchainImageIndex});
            //now that we are sure that the commands finished executing, we can safely reset the command buffer to begin recording again
            VK_CHECK(Vulkan.vkResetCommandPool(VulkanGlobalState._device, VulkanGlobalState._commandPools[currentFrame], 0));
            //             VK_CHECK(Vulkan.vkResetCommandBuffer(cmd, 0));
            // begin the command buffer recording. We will use this command buffer exactly once, so we want to let Vulkan know that
            const cmdBeginInfo = Vulkan.VkCommandBufferBeginInfo
            {
                .sType = Vulkan.VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO,
                .flags = Vulkan.VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT,
            };
            //start the command buffer recording
            VK_CHECK(Vulkan.vkBeginCommandBuffer(cmd, &cmdBeginInfo));
// //             transitionImage(cmd, VulkanGlobalState._swapchainImages[swapchainImageIndex],
// //                             Vulkan.VK_PIPELINE_STAGE_2_ALL_COMMANDS_BIT, Vulkan.VK_PIPELINE_STAGE_2_ALL_COMMANDS_BIT,
// //                             Vulkan.VK_ACCESS_2_MEMORY_WRITE_BIT, Vulkan.VK_ACCESS_2_MEMORY_WRITE_BIT | Vulkan.VK_ACCESS_2_MEMORY_READ_BIT,
// //                             Vulkan.VK_IMAGE_LAYOUT_UNDEFINED, Vulkan.VK_IMAGE_LAYOUT_GENERAL);
            transitionImage(cmd, VulkanGlobalState._swapchainImages[swapchainImageIndex],
                            Vulkan.VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT,
                            Vulkan.VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT,
                            Vulkan.VK_ACCESS_2_COLOR_ATTACHMENT_READ_BIT | Vulkan.VK_ACCESS_2_COLOR_ATTACHMENT_WRITE_BIT,
                            Vulkan.VK_ACCESS_2_COLOR_ATTACHMENT_WRITE_BIT,
                            Vulkan.VK_IMAGE_LAYOUT_UNDEFINED, Vulkan.VK_IMAGE_LAYOUT_ATTACHMENT_OPTIMAL);

            const clearValue = Vulkan.VkClearValue
            {
                .color = Vulkan.VkClearColorValue
                {
                    .float32 = [4]f32{0.5, 0.5, 1.0, 1.0},//0.5, 0.5, 1.0, 1.0
                },
            };
            const depthClear = Vulkan.VkClearValue
            {
                .depthStencil = Vulkan.VkClearDepthStencilValue
                {
                    .depth = 1.0,
                }
            };
            const renderArea = Vulkan.VkRect2D
            {
                .offset = Vulkan.VkOffset2D{.x = 0, .y = 0},
                .extent = WindowGlobalState._windowExtent,
            };
            // VK_IMAGE_LAYOUT_ATTACHMENT_OPTIMAL_KHR
            const colorAttachmentInfo = Vulkan.VkRenderingAttachmentInfoKHR
            {
                .sType = Vulkan.VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO_KHR,
                .imageView = VulkanGlobalState._swapchainImageViews[swapchainImageIndex],
                .imageLayout = Vulkan.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,
                .loadOp = Vulkan.VK_ATTACHMENT_LOAD_OP_CLEAR,
                .storeOp = Vulkan.VK_ATTACHMENT_STORE_OP_STORE,
                .clearValue = clearValue,
            };
            const depthAttachmentInfo = Vulkan.VkRenderingAttachmentInfoKHR
            {
                .sType = Vulkan.VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO_KHR,
                .imageView = VulkanGlobalState._depthImageView,
                .imageLayout = Vulkan.VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL,//VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL
                .loadOp = Vulkan.VK_ATTACHMENT_LOAD_OP_CLEAR,
                .storeOp = Vulkan.VK_ATTACHMENT_STORE_OP_STORE,
                .clearValue = depthClear,
            };
            const renderInfo = Vulkan.VkRenderingInfoKHR
            {
                .sType = Vulkan.VK_STRUCTURE_TYPE_RENDERING_INFO_KHR,
                .renderArea = renderArea,
                .layerCount = 1,
                .colorAttachmentCount = 1,
                .pColorAttachments = &colorAttachmentInfo,
                .pDepthAttachment = &depthAttachmentInfo,
            };
            Vulkan.vkCmdBeginRendering(VulkanGlobalState._commandBuffers[currentFrame], &renderInfo);

            const viewport = Vulkan.VkViewport
            {
                .x = 0.0,
                .y = 0.0,
                .width = @floatFromInt(WindowGlobalState._windowExtent.width),
                .height = @floatFromInt(WindowGlobalState._windowExtent.height),
                .minDepth = 0.0,
                .maxDepth = 1.0,
            };
            Vulkan.vkCmdSetViewport(VulkanGlobalState._commandBuffers[currentFrame], 0, 1, &viewport);
            const scissor = Vulkan.VkRect2D
            {
                .offset = Vulkan.VkOffset2D{.x = 0, .y = 0},
                .extent = WindowGlobalState._windowExtent,
            };
            Vulkan.vkCmdSetScissor(VulkanGlobalState._commandBuffers[currentFrame], 0, 1, &scissor);

            Vulkan.vkCmdBindPipeline(VulkanGlobalState._commandBuffers[currentFrame], Vulkan.VK_PIPELINE_BIND_POINT_GRAPHICS, Hex_Pipeline);

            var hexPushConstants: [2]u64 = .{HexVkVertexBufferAddress, hexsDataVkDeviceAddress};
            Vulkan.vkCmdPushConstants(cmd, Hex_PipelineLayout, Vulkan.VK_SHADER_STAGE_VERTEX_BIT, 0, 16, &hexPushConstants);
//             Vulkan.vkCmdBindIndexBuffer(VulkanGlobalState._commandBuffers[currentFrame], HexVkIndexBuffer, 0, Vulkan.VK_INDEX_TYPE_UINT16);
            var descriptorSets: [2]Vulkan.VkDescriptorSet = undefined;
            descriptorSets[0] = Camera._cameraDescriptorSets[currentFrame];
            descriptorSets[1] = AoW3_archive.descriptorSet;
            Vulkan.vkCmdBindDescriptorSets(VulkanGlobalState._commandBuffers[currentFrame], Vulkan.VK_PIPELINE_BIND_POINT_GRAPHICS, Hex_PipelineLayout, 0, descriptorSets.len, &descriptorSets, 0, null);
            Vulkan.vkCmdDraw(VulkanGlobalState._commandBuffers[currentFrame], 12, mapDimension*mapDimension, 0, 0);
//             Vulkan.vkCmdDrawIndexed(VulkanGlobalState._commandBuffers[currentFrame], 12, mapDimension*mapDimension, 0, 0, 0);

            Vulkan.vkCmdEndRendering(VulkanGlobalState._commandBuffers[currentFrame]);
            transitionImage(cmd, VulkanGlobalState._swapchainImages[swapchainImageIndex],
                            //Vulkan.VK_PIPELINE_STAGE_2_CLEAR_BIT
                            //Vulkan.VK_ACCESS_2_TRANSFER_WRITE_BIT
                            Vulkan.VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT,
                            Vulkan.VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT,
                            Vulkan.VK_ACCESS_2_COLOR_ATTACHMENT_WRITE_BIT,
                            0,
                            Vulkan.VK_IMAGE_LAYOUT_ATTACHMENT_OPTIMAL, Vulkan.VK_IMAGE_LAYOUT_PRESENT_SRC_KHR);

            //finalize the command buffer (we can no longer add commands, but it can now be executed)
            VK_CHECK(Vulkan.vkEndCommandBuffer(cmd));
            //prepare the submission to the queue.
            //we want to wait on the _presentSemaphore, as that semaphore is signaled when the swapchain is ready
            //we will signal the _renderSemaphore, to signal that rendering has finished
            const commandBufferSubmitInfo = Vulkan.VkCommandBufferSubmitInfo
            {
                .sType = Vulkan.VK_STRUCTURE_TYPE_COMMAND_BUFFER_SUBMIT_INFO,
                .commandBuffer = cmd,
                .deviceMask = 0,
            };
            const waitInfo = Vulkan.VkSemaphoreSubmitInfo
            {
                .sType = Vulkan.VK_STRUCTURE_TYPE_SEMAPHORE_SUBMIT_INFO,
                .semaphore = VulkanGlobalState._swapchainSemaphores[currentFrame],
                .stageMask = Vulkan.VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT,
                .deviceIndex = 0,
                .value = 1,
            };
            const signalInfo = Vulkan.VkSemaphoreSubmitInfo
            {
                .sType = Vulkan.VK_STRUCTURE_TYPE_SEMAPHORE_SUBMIT_INFO,
                .semaphore = VulkanGlobalState._renderSemaphores[currentFrame],
                .stageMask = Vulkan.VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT,
                .deviceIndex = 0,
                .value = 1,
            };
            const submitInfo = Vulkan.VkSubmitInfo2
            {
                .sType = Vulkan.VK_STRUCTURE_TYPE_SUBMIT_INFO_2,

                .waitSemaphoreInfoCount = 1,
                .pWaitSemaphoreInfos = &waitInfo,

                .signalSemaphoreInfoCount = 1,
                .pSignalSemaphoreInfos = &signalInfo,

                .commandBufferInfoCount = 1,
                .pCommandBufferInfos = &commandBufferSubmitInfo,
            };
//
            //submit command buffer to the queue and execute it.
            // _renderFence will now block until the graphic commands finish execution
            VK_CHECK(Vulkan.vkQueueSubmit2(VulkanGlobalState._graphicsQueue, 1, &submitInfo, VulkanGlobalState._renderFences[currentFrame]));

            const presentInfo = Vulkan.VkPresentInfoKHR
            {
                .sType = Vulkan.VK_STRUCTURE_TYPE_PRESENT_INFO_KHR,
                .pSwapchains = &VulkanGlobalState._swapchain,
                .swapchainCount = 1,
                .pWaitSemaphores = &VulkanGlobalState._renderSemaphores[currentFrame],
                .waitSemaphoreCount = 1,
                .pImageIndices = &swapchainImageIndex,
            };

//             VK_CHECK(Vulkan.vkQueuePresentKHR(VulkanGlobalState._graphicsQueue, &presentInfo));
            result = (Vulkan.vkQueuePresentKHR(VulkanGlobalState._graphicsQueue, &presentInfo));
            if (result == Vulkan.VK_ERROR_OUT_OF_DATE_KHR or result == Vulkan.VK_SUBOPTIMAL_KHR)
                VkSwapchain.recreateVkSwapchainKHR();
            currentFrame+=1;
            if(currentFrame == VulkanGlobalState.FRAME_OVERLAP)
                currentFrame = 0;
// //             break;
        }
    }
    _ = Vulkan.vkDeviceWaitIdle(VulkanGlobalState._device);
}
