const std = @import("std");
const builtin = @import("builtin");
const linux = std.os.linux;
const print = std.debug.print;
const exit = std.process.exit;

const SDL = @import("SDL3.zig");
const Vulkan = @import("Vulkan.zig");
// pub usingnamespace @import("Vulkan.zig");
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
// pub usingnamespace @import("CustomMem.zig");
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
const Image = @import("Image.zig").Image;
const Texture = @import("Texture.zig").Texture;
//
const AoW3_clb_custom = @import("AoW3_clb_custom.zig");
const AoW4_clb_custom = @import("AoW4_clb_custom.zig");
// const AoW4_clb = @import("AoW4_clb.zig");
// const AoW4_SGH = @import("AoW4_SGH.zig");
// const clb_custom = @import("clb_custom.zig");

const Pipelines = @import("Pipelines.zig");
const Square = @import("Square.zig");
const Hex = @import("Hex.zig");
const Simplexnoise1234 = @import("Simplexnoise1234.zig");

const ResourceID = struct
{
    @"SM_Fertile_Plains_Grass_01_TerrainTexture.tga": u16,
    @"LushGrass_Temperate_[DIFF_DXT5].tga": u16,
    @"BirchTrees_[DIFF_DXT5].tga": u16,
    @"PineTrees_[DIFF_DXT5].tga": u16,
    @"Temp_Fertile_Fern_01_LushGrass": u16,
    @"Temperate_Tree_03_BirchTrees1": u16,
    @"Temperate_Forest_06_PineTrees": u16,
};
pub const hashes: [std.meta.fields(ResourceID).len]u64 = blk:
{
    const resourceStrings = std.meta.fieldNames(ResourceID);
    var localHashes: [std.meta.fields(ResourceID).len]u64 = undefined;
    for (&localHashes, resourceStrings) |*hash, res| hash.* = std.hash.RapidHash.hash(0, res);
    break :blk localHashes;
};
pub var resourceID: ResourceID = undefined;
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
//     const resourceStrings = std.meta.fieldNames(ResourceID);
//     print("{s}\n", .{resourceStrings[0]});
//     comptime calculateHashes();
//     var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
//     defer arena.deinit();
//     const arenaAllocator = arena.allocator();

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

//     const AoW3_dirfd_dst: std.posix.fd_t = CustomFS.open("AoW3", .{.ACCMODE = .RDONLY, .DIRECTORY = true});
//     defer _ = CustomFS.close(AoW3_dirfd_dst);
//
//     var AoW3_archive: AoW3_clb_custom.ArchiveGPU = undefined;
//     defer AoW3_archive.unload();
// //

//     _ = GlobalState.arena.reset(.free_all);

    const AoW4_dirfd: std.posix.fd_t = CustomFS.open("./", .{.ACCMODE = .RDONLY, .DIRECTORY = true});
    defer _ = CustomFS.close(AoW4_dirfd);

    var AoW4_archive: AoW4_clb_custom.ArchiveGPU = undefined;
    defer AoW4_archive.unload();
//     Title/Libraries/Strategic/Terrain_Textures_Strategic.clb
//     for(0..20) |_|
//     {
//         AoW4_clb_custom.clb_custom_read(AoW4_dirfd, "customArchive.clb", &AoW4_archive);
//         AoW4_archive.unload();
//     }
    AoW4_clb_custom.clb_custom_read(AoW4_dirfd, "customArchive.clb", &AoW4_archive);
//     print("{d}\n", .{resourceIDs[@intFromEnum(ResourceID.@"Temp_Fertile_Fern_01_LushGrass")]});
    // Palette
{
    // Grassland 00
//     var colorTable = [4*8]u8
//     {
//         98, 71, 41, 255,
//         58, 71, 20, 255,
//         84, 89, 32, 255,
//         61, 92, 15, 255,
//         61, 84, 20, 255,
//         55, 92, 14, 255,
//         46, 113, 19, 255,
//         75, 109, 20, 255,
//     };
    // Grassland 00 (Tropical)
//     var colorTable = [4*8]u8
//     {
//         129, 79,  43, 255,
//         129, 79,  43, 255,
//         62,  102, 17, 255,
//         90,  102, 11, 255,
//         129, 79,  43, 255,
//         81,  102, 14, 255,
//         59,  76,  20, 255,
//         59,  36,  13, 255,
//     };
    // Grassland 01
//      var colorTable = [4*8]u8
//      {
//          98, 71,  41, 255,
//          58, 71,  20, 255,
//          84, 89,  32, 255,
//          54, 82,  11, 255,
//          67, 91,  21, 255,
//          81, 103, 29, 255,
//          39, 53,  12, 255,
//          86, 99,  16, 255,
//      };
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
//     var colorTable = [4*8]u8
//     {
//         125, 107, 62, 255,
//         118, 101, 59, 255,
//         111, 96,  56, 255,
//         104, 90,  52, 255,
//         97, 85, 50, 255,
//         90, 79, 47, 255,
//         83, 74, 44, 255,
//         77, 69, 41, 255,
//     };
    // Rocky Limestone
//     var colorTable = [4*8]u8
//     {
//         78, 100,  14, 255,
//         49,  99,  16, 255,
//         51,  81,  16, 255,
//         91,  94,  44, 255,
//         106, 87,  61, 255,
//         115, 113, 62, 255,
//         158, 129, 91, 255,
//         9,   52,  4,  255,
// //         255, 255, 255,255,
//     };
}
    var colorTable = [4*8]u8
    {
        98, 71, 41, 255,
        58, 71, 20, 255,
        84, 89, 32, 255,
        61, 92, 15, 255,
        61, 84, 20, 255,
        55, 92, 14, 255,
        46, 113, 19, 255,
        75, 109, 20, 255,
    };
    const palette = Image
    {
        .data = &colorTable,
        .mipSize = 4*8,
        .size = 4*8,
        .width = 8,
        .height = 1,
        .mipsCount = 1,
        .alignment = 1,
        .format = Vulkan.VK_FORMAT_R8G8B8A8_SRGB,
    };
//     _ = palette;
    var paletteTexture: Texture = undefined;
    var paletteVkDeviceMemory: Vulkan.VkDeviceMemory = undefined;
    VkImage.createVkImages__VkImageViews__VkDeviceMemory(@ptrCast(&palette), @ptrCast(&paletteTexture), 1, &paletteVkDeviceMemory);
    defer
    {
        paletteTexture.unload();
        Vulkan.vkFreeMemory(VulkanGlobalState._device, paletteVkDeviceMemory, null);
    }
    Hex.createHexPaletteSampler();
    defer Vulkan.vkDestroySampler(VulkanGlobalState._device, Hex._paletteSampler, null);
//     var palette_DescriptorSetLayout: Vulkan.VkDescriptorSetLayout = undefined;
//     var palette_DescriptorPool: Vulkan.VkDescriptorPool = undefined;
//     var palette_DescriptorSet: Vulkan.VkDescriptorSet = undefined;
    Hex.createPaletteDescriptorsData(paletteTexture.vkImageView, &Hex.palette_DescriptorSetLayout, &Hex.palette_DescriptorPool, &Hex.palette_DescriptorSet);

//     Hex.Create_palette_VkDescriptorPool(&palette_DescriptorPool);
//     Hex.Create_palette_VkDescriptorSet(paletteTexture.vkImageView, palette_DescriptorSetLayout, palette_DescriptorPool, &palette_DescriptorSet);
    defer
    {
        Vulkan.vkDestroyDescriptorSetLayout(VulkanGlobalState._device, Hex.palette_DescriptorSetLayout, null);
        Vulkan.vkDestroyDescriptorPool(VulkanGlobalState._device, Hex.palette_DescriptorPool, null);
    }
// }
    // Hex
    const distanceSize = 1;
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
    const HexIndices = [12]u16{
        0, 2, 4,
        0, 1, 2,
        2, 3, 4,
        4, 5, 0,
    };
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
    var HexVkIndexBuffer: Vulkan.VkBuffer = undefined;
    var HexVkIndexDeviceMemory: Vulkan.VkDeviceMemory = undefined;
    VkBuffer.createVkBuffer__VkDeviceMemory(Vulkan.VK_BUFFER_USAGE_INDEX_BUFFER_BIT, @ptrCast(&HexIndices), @sizeOf(u16)*12, &HexVkIndexBuffer, &HexVkIndexDeviceMemory);
//     VkBuffer.createVkBuffer__VkDeviceMemory(Vulkan.VK_BUFFER_USAGE_INDEX_BUFFER_BIT, @ptrCast(&SquareIndices), @sizeOf(u16)*6, &HexVkIndexBuffer, &HexVkIndexDeviceMemory);
    defer
    {
        Vulkan.vkDestroyBuffer(VulkanGlobalState._device, HexVkIndexBuffer, null);
        Vulkan.vkFreeMemory(VulkanGlobalState._device, HexVkIndexDeviceMemory, null);
    }
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
    const mapRadius = 0;
    comptime var hexsCount: u64 = 1;
    comptime
    {
        var countAddition: u64 = 0;
        for(0..mapRadius) |_|
        {
            countAddition+=6;
            hexsCount+=countAddition;
        }
    }
//     print("hexsCount: {d}\n", .{hexsCount});
    var hexsData: [hexsCount]Hex.HexData = undefined;
    //
    const verticalSpacing = 1.5 * distanceSize;
    const horizontalSpacing = @sqrt(3.0) * distanceSize;
    for(0..hexsCount) |i|
    {
//         hexsData[i].textureIndex = 14;
//         hexsData[i].textureIndex = resourceIDs[@intFromEnum(ResourceEnum.@"SM_Fertile_Plains_Grass_01_TerrainTexture.tga")];
        hexsData[i].textureIndex = resourceID.@"SM_Fertile_Plains_Grass_01_TerrainTexture.tga";
    }
    const x_coordStatic = mapRadius * -1 * horizontalSpacing;
    var hexIndex: u64 = 0;
    for(1..mapRadius+1) |row|
    {
        const x_coord = x_coordStatic + horizontalSpacing * 0.5 * CustomMem.u64Tof32(row);
        const y_coord = -verticalSpacing * CustomMem.u64Tof32(row);
        for(0..mapRadius*2+1-row) |i|
        {
            hexsData[hexIndex].x = x_coord + horizontalSpacing * CustomMem.u64Tof32(i);
            hexsData[hexIndex].y = y_coord;
            hexIndex+=1;
        }
    }
    for(0..mapRadius*2+1) |i|
    {
        hexsData[hexIndex].x = x_coordStatic + horizontalSpacing * CustomMem.u64Tof32(i);
        hexsData[hexIndex].y = 0;
        hexIndex+=1;
    }
    for(1..mapRadius+1) |row|
    {
        const x_coord = x_coordStatic + horizontalSpacing * 0.5 * CustomMem.u64Tof32(row);
        const y_coord = verticalSpacing * CustomMem.u64Tof32(row);
        for(0..mapRadius*2+1-row) |i|
        {
            hexsData[hexIndex].x = x_coord + horizontalSpacing * CustomMem.u64Tof32(i);
            hexsData[hexIndex].y = y_coord;
            hexIndex+=1;
        }
    }
{
//     var _000_025: u64 = 0;
//     var _025_050: u64 = 0;
//     var _050_075: u64 = 0;
//     var _075_100: u64 = 0;
//     for(0..mapDimension) |y|
//     {
//         for(0..mapDimension) |x|
//         {
//             const i = mapDimension*y+x;
//             const horisontal: f32 =  horizontalSpacing * CustomMem.u64Tof32(x);
//             const vertical: f32 = verticalSpacing * CustomMem.u64Tof32(y);
//             if(y % 2 == 0)
//             {
//                 hexsData[i].x = horisontal;
//                 hexsData[i].y = vertical;
//             }
//             else
//             {
//                 hexsData[i].x = horisontal - @sqrt(3.0)/2.0*distanceSize;
//                 hexsData[i].y = vertical;
//             }
//             const frequency = 1.0/32.0;
//             const noiseRes = (Simplexnoise1234.snoise2(hexsData[i].x*frequency, hexsData[i].y*frequency));
// //             const amplitude = 1.0+0.5+0.25;
// //             var noiseRes = (Simplexnoise1234.snoise2(CustomMem.u64Tof32(x)*frequency, CustomMem.u64Tof32(y)*frequency)) +
// //             0.5*(Simplexnoise1234.snoise2(2*CustomMem.u64Tof32(x)*frequency, 2*CustomMem.u64Tof32(y)*frequency)) +
// //             0.25*(Simplexnoise1234.snoise2(4*CustomMem.u64Tof32(x)*frequency, 4*CustomMem.u64Tof32(y)*frequency));
// //             noiseRes /= amplitude;
//             if(noiseRes < 0.25)
//             {
// //                 _000_025+=1;
//                 hexsData[i].textureIndex = 4;
//             }
//             else if(noiseRes < 0.5)
//             {
// //                 _025_050+=1;
//                 hexsData[i].textureIndex = 5;
//             }
//             else if(noiseRes < 0.75)
//             {
// //                 _050_075+=1;
//                 hexsData[i].textureIndex = 9;
//             }
//             else
//             {
// //                 _075_100+=1;
//                 hexsData[i].textureIndex = 11;
//             }
// //          17 — Forest 00
// //          14 — Grass 01
// //             hexsData[i].textureIndex = 9;
// //          if(i % 4 == 0)
// //          {
// //             hexsData[i].textureIndex = 4;
// //         }
// //         else if(i % 4 == 1)
// //         {
// //             hexsData[i].textureIndex = 5;
// //         }
// //         else if(i % 4 == 2)
// //         {
// //             hexsData[i].textureIndex = 9;
// //         }
// //         else if(i % 4 == 3)
// //         {
// //             hexsData[i].textureIndex = 11;
// //         }
// //         else
// //         {hexsData[i].textureIndex = 0;}
//         }
//     }
//     print("00 — 25: {d}\n", .{_000_025});
//     print("25 — 50: {d}\n", .{_025_050});
//     print("50 — 75: {d}\n", .{_050_075});
//     print("75 — 100: {d}\n", .{_075_100});
}
    // Vertex instance buffer
    var hexsDataVkDeviceAddress: Vulkan.VkDeviceAddress = undefined;
    var hexsDataBuffer: Vulkan.VkBuffer = undefined;
    var hexsDataVkDeviceMemory: Vulkan.VkDeviceMemory = undefined;
    VkBuffer.createVkBuffer__VkDeviceMemory__VkDeviceAddress(Vulkan.VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT, @ptrCast(&hexsData), @sizeOf(Hex.HexData)*hexsCount, &hexsDataVkDeviceAddress,&hexsDataBuffer, &hexsDataVkDeviceMemory);
    defer
    {
        Vulkan.vkDestroyBuffer(VulkanGlobalState._device, hexsDataBuffer, null);
        Vulkan.vkFreeMemory(VulkanGlobalState._device, hexsDataVkDeviceMemory, null);
    }
    Hex.Create_Hex_Pipeline(AoW4_archive.descriptorSetLayout, Hex.palette_DescriptorSetLayout, &Hex.Hex_PipelineLayout, &Hex.Hex_Pipeline);
    defer
    {
        Vulkan.vkDestroyPipeline(VulkanGlobalState._device, Hex.Hex_Pipeline, null);
        Vulkan.vkDestroyPipelineLayout(VulkanGlobalState._device, Hex.Hex_PipelineLayout, null);
    }
    Pipelines.Create_PNUCT_Pipeline(AoW4_archive.descriptorSetLayout, &Pipelines.PNUCT_PipelineLayout, &Pipelines.PNUCT_Pipeline);
    defer
    {
        Vulkan.vkDestroyPipeline(VulkanGlobalState._device, Pipelines.PNUCT_Pipeline, null);
        Vulkan.vkDestroyPipelineLayout(VulkanGlobalState._device, Pipelines.PNUCT_PipelineLayout, null);
    }
    Pipelines.Create_PNUCTP_Pipeline();
    defer
    {
        Vulkan.vkDestroyPipeline(VulkanGlobalState._device, Pipelines.PNUCTP_Pipeline, null);
//         Vulkan.vkDestroyPipelineLayout(VulkanGlobalState._device, AoW4.PNUCT_PipelineLayout, null);
    }
//     var mappedMemory: ?*anyopaque = undefined;
//     _ = Vulkan.vkMapMemory(VulkanGlobalState._device, hexsDataVkDeviceMemory, 0, 16, 0, &mappedMemory);
//     print("{*}\n", .{@as(*anyopaque, @ptrFromInt(hexsDataVkDeviceAddress))});
//     print("{*}\n", .{mappedMemory});
//     print("value: {d}\n", .{(CustomMem.alignPtrCast([*]u32, mappedMemory))[2]});
    // Square noise map
{
//     var noiseBuffer: [mapDimension*mapDimension]u8 = undefined;
//     for(0..mapDimension) |y|
//     {
//         for(0..mapDimension) |x|
//         {
//             const i = mapDimension*y+x;
//             noiseBuffer[i] = @intFromFloat((Simplexnoise1234.snoise2(CustomMem.u64Tof32(x), CustomMem.u64Tof32(y)) * 0.5 + 0.5)*255.0);
//         }
//     }
//     const noiseMap = Image.Image
//     {
//         .data = &noiseBuffer,
//         .mipSize = mapDimension*mapDimension,
//         .size = mapDimension*mapDimension,
//         .width = mapDimension,
//         .height = mapDimension,
//         .mipsCount = 1,
//         .alignment = 1,
//         .format = Vulkan.VK_FORMAT_R8_UNORM,
//     };
//     var noiseTexture: Image.Texture = undefined;
//     var noiseVkDeviceMemory: Vulkan.VkDeviceMemory = undefined;
//     VkImage.createVkImages__VkImageViews__VkDeviceMemory(@ptrCast(&noiseMap), @ptrCast(&noiseTexture), 1, &noiseVkDeviceMemory);
//     defer
//     {
//         noiseTexture.unload();
//         Vulkan.vkFreeMemory(VulkanGlobalState._device, noiseVkDeviceMemory, null);
//     }
//     //  Hex.createHexPaletteSampler();
// //      defer Vulkan.vkDestroySampler(VulkanGlobalState._device, Hex._paletteSampler, null);
//     var noiseMap_DescriptorSetLayout: Vulkan.VkDescriptorSetLayout = undefined;
//     var noiseMap_DescriptorPool: Vulkan.VkDescriptorPool = undefined;
//     var noiseMap_DescriptorSet: Vulkan.VkDescriptorSet = undefined;
//     Hex.Create_DiffuseMaterial_VkDescriptorSetLayout(1, &noiseMap_DescriptorSetLayout);
//     Hex.Create_DiffuseMaterial_VkDescriptorPool(1, &noiseMap_DescriptorPool);
//     Hex.Create_DiffuseMaterial_VkDescriptorSet(1, @ptrCast(&noiseTexture), noiseMap_DescriptorSetLayout, noiseMap_DescriptorPool, &noiseMap_DescriptorSet);
//     defer
//     {
//         Vulkan.vkDestroyDescriptorSetLayout(VulkanGlobalState._device, noiseMap_DescriptorSetLayout, null);
//         Vulkan.vkDestroyDescriptorPool(VulkanGlobalState._device, noiseMap_DescriptorPool, null);
//     }
}
//     var Square_Pipeline: Vulkan.VkPipeline = null;
//     var Square_PipelineLayout: Vulkan.VkPipelineLayout = null;
//     Square.Create_Square_Pipeline(noiseMap_DescriptorSetLayout, &Square_PipelineLayout, &Square_Pipeline);
//     defer
//     {
//         Vulkan.vkDestroyPipeline(VulkanGlobalState._device, Square_Pipeline, null);
//         Vulkan.vkDestroyPipelineLayout(VulkanGlobalState._device, Square_PipelineLayout, null);
//     }

    var e: SDL.SDL_Event = undefined;
    var bQuit: bool = false;
    // //     bQuit = true;
    var windowPresent: bool = true;
    //
    var currentFrame: usize = 0;
    const cameraMove = 0.5;
//     var frame: u64 = 0;
//     _ = Vulkan.vkDeviceWaitIdle(VulkanGlobalState._device);
//     print("{d}\n", .{AoW4_archive.meshesVkDeviceAddress+AoW4_archive.meshes[resourceID.@"Temperate_Forest_06_PineTrees"].indexVkBufferOffset - AoW4_archive.meshesVkDeviceAddress+AoW4_archive.meshes[resourceID.@"Temperate_Forest_06_PineTrees"].vertexVkBufferOffset});
    print("{d}\n", .{resourceID.@"Temperate_Forest_06_PineTrees"});
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
//             AoW4_clb_custom.bindDescriptorSetsLoop(&AoW4_archive);
            VkImage.transitionImage(cmd, VulkanGlobalState._swapchainImages[swapchainImageIndex],
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

            Vulkan.vkCmdBindPipeline(VulkanGlobalState._commandBuffers[currentFrame], Vulkan.VK_PIPELINE_BIND_POINT_GRAPHICS, Hex.Hex_Pipeline);

            var hexPushConstants: [2]u64 = .{HexVkVertexBufferAddress, hexsDataVkDeviceAddress};
            Vulkan.vkCmdPushConstants(cmd, Hex.Hex_PipelineLayout, Vulkan.VK_SHADER_STAGE_VERTEX_BIT, 0, 16, &hexPushConstants);
//             AoW4_clb_custom.bindDescriptorSetsLoop(&AoW4_archive);
            var descriptorSets: [3]Vulkan.VkDescriptorSet = undefined;
            descriptorSets[0] = Camera._cameraDescriptorSets[currentFrame];
            descriptorSets[1] = AoW4_archive.descriptorSet;
            descriptorSets[2] = Hex.palette_DescriptorSet;
            Vulkan.vkCmdBindDescriptorSets(VulkanGlobalState._commandBuffers[currentFrame], Vulkan.VK_PIPELINE_BIND_POINT_GRAPHICS, Hex.Hex_PipelineLayout, 0, 3, &descriptorSets, 0, null);
//             Vulkan.vkCmdDraw(VulkanGlobalState._commandBuffers[currentFrame], 12, hexsCount, 0, 0);
            Vulkan.vkCmdBindIndexBuffer(VulkanGlobalState._commandBuffers[currentFrame], HexVkIndexBuffer, 0, Vulkan.VK_INDEX_TYPE_UINT16);
//             Vulkan.vkCmdDrawIndexed(VulkanGlobalState._commandBuffers[currentFrame], 12, hexsCount, 0, 0, 0);


            Vulkan.vkCmdBindPipeline(VulkanGlobalState._commandBuffers[currentFrame], Vulkan.VK_PIPELINE_BIND_POINT_GRAPHICS, Pipelines.PNUCT_Pipeline);
            Vulkan.vkCmdBindDescriptorSets(VulkanGlobalState._commandBuffers[currentFrame], Vulkan.VK_PIPELINE_BIND_POINT_GRAPHICS, Pipelines.PNUCT_PipelineLayout, 0, 2, &descriptorSets, 0, null);
            hexPushConstants[0] = AoW4_archive.meshesVkDeviceAddress+AoW4_archive.meshes[resourceID.@"Temp_Fertile_Fern_01_LushGrass"].vertexVkBufferOffset;
            hexPushConstants[1] = resourceID.@"LushGrass_Temperate_[DIFF_DXT5].tga";
            Vulkan.vkCmdPushConstants(cmd, Pipelines.PNUCT_PipelineLayout, Vulkan.VK_SHADER_STAGE_VERTEX_BIT, 0, 8, &hexPushConstants);
            Vulkan.vkCmdPushConstants(cmd, Pipelines.PNUCT_PipelineLayout, Vulkan.VK_SHADER_STAGE_FRAGMENT_BIT, 8, 4, &hexPushConstants[1]);
            Vulkan.vkCmdBindIndexBuffer(VulkanGlobalState._commandBuffers[currentFrame], AoW4_archive.meshesVkBuffer, AoW4_archive.meshes[resourceID.@"Temp_Fertile_Fern_01_LushGrass"].indexVkBufferOffset, Vulkan.VK_INDEX_TYPE_UINT16);
//             Vulkan.vkCmdDrawIndexed(VulkanGlobalState._commandBuffers[currentFrame], 3192*3, 1, 0, 0, 0);

//             hexPushConstants[0] = AoW4_archive.meshesVkDeviceAddress+AoW4_archive.meshes[161].vertexVkBufferOffset;
//             Vulkan.vkCmdPushConstants(cmd, AoW4.PNUCT_PipelineLayout, Vulkan.VK_SHADER_STAGE_VERTEX_BIT, 0, 8, &hexPushConstants);
//             Vulkan.vkCmdBindIndexBuffer(VulkanGlobalState._commandBuffers[currentFrame], AoW4_archive.meshesVkBuffer, AoW4_archive.meshes[161].indexVkBufferOffset, Vulkan.VK_INDEX_TYPE_UINT16);
//             Vulkan.vkCmdDrawIndexed(VulkanGlobalState._commandBuffers[currentFrame], 282*3, 1, 0, 0, 0);


            Vulkan.vkCmdBindPipeline(VulkanGlobalState._commandBuffers[currentFrame], Vulkan.VK_PIPELINE_BIND_POINT_GRAPHICS, Pipelines.PNUCTP_Pipeline);
            hexPushConstants[0] = AoW4_archive.meshesVkDeviceAddress+AoW4_archive.meshes[resourceID.@"Temperate_Forest_06_PineTrees"].vertexVkBufferOffset;
            hexPushConstants[1] = resourceID.@"PineTrees_[DIFF_DXT5].tga";
            Vulkan.vkCmdPushConstants(cmd, Pipelines.PNUCT_PipelineLayout, Vulkan.VK_SHADER_STAGE_VERTEX_BIT, 0, 8, &hexPushConstants);
            Vulkan.vkCmdPushConstants(cmd, Pipelines.PNUCT_PipelineLayout, Vulkan.VK_SHADER_STAGE_FRAGMENT_BIT, 8, 4, &hexPushConstants[1]);

            Vulkan.vkCmdBindIndexBuffer(VulkanGlobalState._commandBuffers[currentFrame], AoW4_archive.meshesVkBuffer, AoW4_archive.meshes[resourceID.@"Temperate_Forest_06_PineTrees"].indexVkBufferOffset, Vulkan.VK_INDEX_TYPE_UINT16);
            Vulkan.vkCmdDrawIndexed(VulkanGlobalState._commandBuffers[currentFrame], 144*3, 1, 0, 0, 0);


            Vulkan.vkCmdEndRendering(VulkanGlobalState._commandBuffers[currentFrame]);
            VkImage.transitionImage(cmd, VulkanGlobalState._swapchainImages[swapchainImageIndex],
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
//             frame+=1;
//             if(frame == 1)
//                 break;
//             break;
        }
    }
    _ = Vulkan.vkDeviceWaitIdle(VulkanGlobalState._device);
//     print("value: {d}\n", .{(CustomMem.alignPtrCast([*]u32, mappedMemory))[2]});
}
