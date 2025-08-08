const std = @import("std");
const builtin = @import("builtin");
const meta = std.meta;

const SDL = @import("SDL3.zig");
const Vulkan = @import("Vulkan.zig");

const GlobalState = @import("GlobalState.zig");
const WindowGlobalState = @import("WindowGlobalState.zig");
const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;

const Math = @import("Math.zig");
const CustomMem = @import("CustomMem.zig");
const alignPtrCast = CustomMem.alignPtrCast;

const CustomFS = @import("CustomFS.zig");
const CustomIO = @import("CustomIO.zig");
// const CustomThreads = @import("CustomThreads.zig");
const PageAllocator = @import("PageAllocator.zig");
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
// const AoW3_clb_custom = @import("AoW3_clb_custom.zig");
const AoW4_clb_custom = @import("AoW4_clb_custom.zig");
// const AoW4_clb = @import("AoW4_clb.zig");
// const AoW4_SGH = @import("AoW4_SGH.zig");
// const clb_custom = @import("clb_custom.zig");

const Pipelines = @import("Pipelines.zig");
const Square = @import("Square.zig");
const Hex = @import("Hex.zig");
const Simplexnoise1234 = @import("Simplexnoise1234.zig");

const RAPID_SECRET: [3]u64 = .{ 0x2d358dccaa6c78a5, 0x8bb84b93962eacc9, 0x4b33a62ed433d4a3 };
inline fn mum(a: *u64, b: *u64) void {
    const r = @as(u128, a.*) * b.*;
    a.* = @truncate(r);
    b.* = @truncate(r >> 64);
}
inline fn mix(a: u64, b: u64) u64 {
    var copy_a = a;
    var copy_b = b;
    mum(&copy_a, &copy_b);
    return copy_a ^ copy_b;
}
inline fn r32(p: []const u8) u64 {
    return p[0..4];
}
inline fn r64(p: []const u8) u64 {
    return @bitCast(p[0..8].*);
}
pub fn rapidHash(seed: u64, input: []const u8) u64 {
    const sc = RAPID_SECRET;
    const len = input.len;
    var a: u64 = 0;
    var b: u64 = 0;
    var k = input;
    var is: [3]u64 = .{ seed, 0, 0 };

    is[0] ^= mix(seed ^ sc[0], sc[1]) ^ len;

    if (len <= 16) {
        if (len >= 4) {
            const d: u64 = ((len & 24) >> @intCast(len >> 3));
            const e = len - 4;
            a = (r32(k) << 32) | r32(k[e..]);
            b = ((r32(k[d..]) << 32) | r32(k[(e - d)..]));
        } else if (len > 0)
            a = (@as(u64, k[0]) << 56) | (@as(u64, k[len >> 1]) << 32) | @as(u64, k[len - 1]);
    } else {
        var remain = len;
        if (len > 48) {
            is[1] = is[0];
            is[2] = is[0];
            while (remain >= 96) {
                inline for (0..6) |i| {
                    const m1 = r64(k[8 * i * 2 ..]);
                    const m2 = r64(k[8 * (i * 2 + 1) ..]);
                    is[i % 3] = mix(m1 ^ sc[i % 3], m2 ^ is[i % 3]);
                }
                k = k[96..];
                remain -= 96;
            }
            if (remain >= 48) {
                inline for (0..3) |i| {
                    const m1 = r64(k[8 * i * 2 ..]);
                    const m2 = r64(k[8 * (i * 2 + 1) ..]);
                    is[i] = mix(m1 ^ sc[i], m2 ^ is[i]);
                }
                k = k[48..];
                remain -= 48;
            }

            is[0] ^= is[1] ^ is[2];
        }

        if (remain > 16) {
            is[0] = mix(r64(k) ^ sc[2], r64(k[8..]) ^ is[0] ^ sc[1]);
            if (remain > 32) {
                is[0] = mix(r64(k[16..]) ^ sc[2], r64(k[24..]) ^ is[0]);
            }
        }

        a = r64(input[len - 16 ..]);
        b = r64(input[len - 8 ..]);
    }

    a ^= sc[1];
    b ^= is[0];
    mum(&a, &b);
    return mix(a ^ sc[0] ^ len, b ^ sc[1]);
}
const ResourceID = struct
{
    @"SM_Fertile_Plains_Grass_01_TerrainTexture.tga": u16,
    @"SM_Forest_Forest_01_TerrainTexture.tga": u16,
    @"LushGrass_Temperate_[DIFF_DXT5].tga": u16,
    @"BirchTrees_[DIFF_DXT5].tga": u16,
    @"PineTrees_[DIFF_DXT5].tga": u16,
    @"Temp_Fertile_Fern_01_LushGrass": u16,
    @"Temperate_Tree_03_BirchTrees1": u16,
    @"Temperate_Forest_06_PineTrees": u16,
};
pub const hashes: [meta.fields(ResourceID).len]u64 = blk:
{
    const resourceStrings = meta.fieldNames(ResourceID);
    var localHashes: [meta.fields(ResourceID).len]u64 = undefined;
    for (&localHashes, resourceStrings) |*hash, res| hash.* = rapidHash(0, res);
    break :blk localHashes;
};
pub var resourceID: ResourceID = undefined;
const ColorTable = struct
{
    Arctic_Forest_00: [32]u8 =
    .{
        128, 134, 143, 255,
        128, 134, 143, 255,
        64,  33,  57,  255,
        23,  27,  50,  255,
        82,  48,  17,  255,
        85,  65,  45,  255,
        75,  67,  53,  255,
        80,  64,  17,  255,
    },
    Sahara_Forest_00: [32]u8 =
    .{
        99,  83,  21,  255,
        92,  75,  16,  255,
        85,  67,  15,  255,
        73,  55,  12,  255,
        54,  42,  13,  255,
        130, 91,  45,  255,
        158, 119, 52,  255,
        158, 119, 52,  255,
    },
    Temperate_Grassland_00: [32]u8 =
    .{
        98, 71, 41, 255,
        58, 71, 20, 255,
        84, 89, 32, 255,
        61, 92, 15, 255,
        61, 84, 20, 255,
        55, 92, 14, 255,
        46, 113, 19, 255,
        75, 109, 20, 255,
    },
    Temperate_Forest_00: [32]u8 =
    .{
        72, 85, 20, 255,
        80, 82, 34, 255,
        57, 64, 34, 255,
        41, 50, 28, 255,
        82, 48, 17, 255,
        85, 65, 45, 255,
        75, 67, 53, 255,
        80, 64, 17, 255,
    },
};
const TexturesEnum = enum(u64)
{
    Arctic_Forest_00,
    Sahara_Forest_00,
    Temperate_Grassland_00,
    Temperate_Forest_00,
};
// const TexturesEnum = ret:
// {
//     const palettesStrings = meta.fieldNames(ColorTable);
//     var fields: [palettesStrings.len]std.builtin.Type.EnumField = undefined;
//     for(&fields, palettesStrings, 0..) |*field, paletteString, i|
//     {
//         field.name = paletteString;
//         field.value = i;
//     }
//     break :ret @Type(.{
//         .Enum = .{
//             .tag_type = std.math.IntFittingRange(0, fields.len),
//                      .fields = fields,
//                      .decls = &.{},
//                      .is_exhaustive = true,
//         },
//     });
// };
// noinline fn test_switch() void
// {
//     const stdout = GlobalState.stdout;
//     goto: switch (enum { exit,block1, block2 }.block1)
//     {
//         .exit =>
//         {
//             exit();
//         },
//         .block1 =>
//         {
//             stdout.print("block 1\n", .{}) catch unreachable;
//             continue :goto .block2;
//         },
//         .block2 =>
//         {
//             stdout.print("block 2\n", .{}) catch unreachable;
//             continue :goto .exit;
//         },
//     }
// }
noinline fn test_invSqrt() void
{
    //     const reader = @import("std").io.getStdIn().reader();
    //     print("enter: ", .{});
    //     var buf: [8]u8 = undefined;
    //     @memset(&buf, 0);
    //     buf[0] = try reader.readByte();
    //     const value: f32 = try std.fmt.parseFloat(f32, buf[0..1]);
    //     const value: f32 = try std.fmt.parseFloat(f32, "2.0");
    //     print("value: {d}\n", .{Math.invSqrt32(value)});
    //     print("value: {d}\n", .{Math.invSqrt32Fast(value)});
    //     print("value: {d}\n", .{Math.invSqrt64(value)});
    //     print("value: {d}\n", .{Math.invSqrt64Fast(value)});
    //     print("value: {d}\n", .{@as(u32, @bitCast(Math.invSqrt32(value)))});
    //     print("value: {d}\n", .{@as(u32, @bitCast(Math.invSqrt32Fast(value)))});
    //     exit(0);
}
const HexVertices = Hex.createHexVertices();
const HexIndices = Hex.createHexIndices();
pub fn main() !void
{
    if(builtin.os.tag == .windows)
        CustomIO.stdoutFD = std.os.windows.peb().ProcessParameters.hStdOutput;
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
//     const float: f64 = -1.0;
//     const int: u64 = undefined;
//     CustomIO.print("x\n", .{int});
//     const stdout = CustomIO.stdout;
//     const hello = "hello";
//     const int: i32 = -113;
//     stdout.print("{any}\n", @TypeOf(hello));
//     stdout.print("{s}\n", .{@typeName(@TypeOf(int))}) catch unreachable;
//     CustomIO.print("s\nd\n", .{hello, int});
    _ = SDL.SDL_Init(SDL.SDL_INIT_VIDEO);
    defer _ = SDL.SDL_Quit();
    WindowGlobalState._window = SDL.SDL_CreateWindow(
        "Vulkan Engine",
        @intCast(WindowGlobalState._windowExtent.width),
        @intCast(WindowGlobalState._windowExtent.height),
        WindowGlobalState._window_flags
    );
    defer _ = SDL.SDL_DestroyWindow(WindowGlobalState._window);
    InitVulkan.initBaseVulkan();
    defer InitVulkan.deinitBaseVulkan();
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
    AoW4_clb_custom.clb_custom_read(AoW4_dirfd, "/tmp/customArchive.clb", &AoW4_archive);
    // Palette
{
    // Temperate
    // Grassland 00 (Tropical)
//     const Tropical_Grassland_00 = [4*8]u8
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
//      const colorTable = [4*8]u8
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
    const palettesCount = 4;
    const colorTable = comptime ret:
    {
        const palettesStrings = meta.fieldNames(ColorTable);
        const colorTable = ColorTable{};
        var colorTableLocal: [palettesCount][32]u8 = undefined;
        for(0..palettesStrings.len) |i|
        {
            colorTableLocal[i] = @field(colorTable, palettesStrings[i]);
        }
        break :ret colorTableLocal;
    };
    const palette = Image
    {
        .data = @ptrCast(&colorTable),
        .mipSize = 4*8*palettesCount,
        .size = 4*8*palettesCount,
        .width = 8,
        .height = 1*palettesCount,
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
    const distanceSize = 2;
    var HexVkVertexBufferAddress: Vulkan.VkDeviceAddress = undefined;
    var HexVkVertexBuffer: Vulkan.VkBuffer = undefined;
    var HexVkVertexDeviceMemory: Vulkan.VkDeviceMemory = undefined;
    VkBuffer.createVkBuffer__VkDeviceMemory__VkDeviceAddress(Vulkan.VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT, @ptrCast(&HexVertices), @sizeOf([2]f32)*19, &HexVkVertexBufferAddress, &HexVkVertexBuffer, &HexVkVertexDeviceMemory);
//     VkBuffer.createVkBuffer__VkDeviceMemory(Vulkan.VK_BUFFER_USAGE_VERTEX_BUFFER_BIT, @ptrCast(&SquareVertices), @sizeOf(Square.Vertex)*4, &HexVkVertexBuffer, &HexVkVertexDeviceMemory);
    defer
    {
        Vulkan.vkDestroyBuffer(VulkanGlobalState._device, HexVkVertexBuffer, null);
        Vulkan.vkFreeMemory(VulkanGlobalState._device, HexVkVertexDeviceMemory, null);
    }
    var HexVkIndexBuffer: Vulkan.VkBuffer = undefined;
    var HexVkIndexDeviceMemory: Vulkan.VkDeviceMemory = undefined;
    VkBuffer.createVkBuffer__VkDeviceMemory(Vulkan.VK_BUFFER_USAGE_INDEX_BUFFER_BIT, @ptrCast(&HexIndices), @sizeOf(u16)*72, &HexVkIndexBuffer, &HexVkIndexDeviceMemory);
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
//     var Square_Pipeline: Vulkan.VkPipeline = null;
//     var Square_PipelineLayout: Vulkan.VkPipelineLayout = null;
//     Square.Create_Square_Pipeline(noiseMap_DescriptorSetLayout, &Square_PipelineLayout, &Square_Pipeline);
//     defer
//     {
//         Vulkan.vkDestroyPipeline(VulkanGlobalState._device, Square_Pipeline, null);
//         Vulkan.vkDestroyPipelineLayout(VulkanGlobalState._device, Square_PipelineLayout, null);
//     }
}
    const mapRadius = 50;
    comptime var hexesCount: u64 = 1;
    comptime
    {
        var countAddition: u64 = 0;
        for(0..mapRadius) |_|
        {
            countAddition+=6;
            hexesCount+=countAddition;
        }
    }
    CustomIO.print("sd\n", .{"hexesCount: ", hexesCount});
    var hexesData: [hexesCount]Hex.HexData = undefined;
    for(0..hexesCount) |i|
    {
        hexesData[i].x = 0;
        hexesData[i].y = 0;
        hexesData[i].textureIndex = resourceID.@"SM_Fertile_Plains_Grass_01_TerrainTexture.tga";
//         hexesData[i].textureIndex = resourceID.@"SM_Forest_Forest_01_TerrainTexture.tga";
        hexesData[i].paletteIndex = @intFromEnum(TexturesEnum.Temperate_Grassland_00);
//         hexesData[i].paletteIndex = @intFromEnum(TexturesEnum.Temperate_Forest_00);
    }
    const verticalSpacing = 1.5 * distanceSize;
    const horizontalSpacing = @sqrt(3.0) * distanceSize;
    const x_coordStatic = mapRadius * -1 * horizontalSpacing;
    {
        var hexIndex: u64 = 0;
        var row: i64 = -mapRadius;
        //     for(@as(isize, @intCast(-mapRadius))..0) |row|
        while(row < 0)
        {
            const x_coord = x_coordStatic + horizontalSpacing * 0.5 * CustomMem.i64Tof32(-row);
            const y_coord = verticalSpacing * CustomMem.i64Tof32(row);
            for(0..@intCast(mapRadius*2+1+row)) |column|
            {
                hexesData[hexIndex].x = x_coord + horizontalSpacing * CustomMem.u64Tof32(column);
                hexesData[hexIndex].y = y_coord;
                hexIndex+=1;
            }
            row+=1;
        }
        for(0..mapRadius*2+1) |i|
        {
            hexesData[hexIndex].x = x_coordStatic + horizontalSpacing * CustomMem.u64Tof32(i);
            hexesData[hexIndex].y = 0;
            hexIndex+=1;
        }
        row = 1;
        while(row < mapRadius+1)
        {
            const x_coord = x_coordStatic + horizontalSpacing * 0.5 * CustomMem.i64Tof32(row);
            const y_coord = verticalSpacing * CustomMem.i64Tof32(row);
            for(0..@intCast(mapRadius*2+1-row)) |i|
            {
                hexesData[hexIndex].x = x_coord + horizontalSpacing * CustomMem.u64Tof32(i);
                hexesData[hexIndex].y = y_coord;
                hexIndex+=1;
            }
            row+=1;
        }
    }
    var hexexHeights: [hexesCount][HexVertices.len]f32 = undefined;
    for(0..hexesCount) |hexIndex|
    {
        for(0..HexVertices.len) |vertexIndex|
        {
            const frequency = 1.0/32.0;
            const coord: [2]f32 = [2]f32{hexesData[hexIndex].x + HexVertices[vertexIndex][0], hexesData[hexIndex].y + HexVertices[vertexIndex][1]};
            hexexHeights[hexIndex][vertexIndex] = Simplexnoise1234.snoise2(coord[0]*frequency, coord[1]*frequency)*4;
        }
    }
{
    var _000_025: u64 = 0;
    var _025_050: u64 = 0;
    var _050_075: u64 = 0;
    var _075_100: u64 = 0;
    for(0..hexesCount) |i|
    {
        const frequency = 1.0/32.0;
        const noiseRes = (Simplexnoise1234.snoise2(hexesData[i].x*frequency, hexesData[i].y*frequency));
//         hexesData[i].z = noiseRes*4;
        hexesData[i].z = 0;
        if(noiseRes < 0.25)
        {
            _000_025+=1;
            hexesData[i].textureIndex = resourceID.@"SM_Forest_Forest_01_TerrainTexture.tga";
            hexesData[i].paletteIndex = @intFromEnum(TexturesEnum.Arctic_Forest_00);
        }
        else if(noiseRes < 0.5)
        {
            _025_050+=1;
            hexesData[i].textureIndex = resourceID.@"SM_Fertile_Plains_Grass_01_TerrainTexture.tga";
            hexesData[i].paletteIndex = @intFromEnum(TexturesEnum.Temperate_Grassland_00);
        }
        else if(noiseRes < 0.75)
        {
            _050_075+=1;
            hexesData[i].textureIndex = resourceID.@"SM_Forest_Forest_01_TerrainTexture.tga";
            hexesData[i].paletteIndex = @intFromEnum(TexturesEnum.Temperate_Forest_00);
        }
        else
        {
            _075_100+=1;
            hexesData[i].textureIndex = resourceID.@"SM_Forest_Forest_01_TerrainTexture.tga";
            hexesData[i].paletteIndex = @intFromEnum(TexturesEnum.Sahara_Forest_00);
        }
    }
//             const frequency = 1.0/32.0;
//             const noiseRes = (Simplexnoise1234.snoise2(hexesData[i].x*frequency, hexesData[i].y*frequency));
// //             const amplitude = 1.0+0.5+0.25;
// //             var noiseRes = (Simplexnoise1234.snoise2(CustomMem.u64Tof32(x)*frequency, CustomMem.u64Tof32(y)*frequency)) +
// //             0.5*(Simplexnoise1234.snoise2(2*CustomMem.u64Tof32(x)*frequency, 2*CustomMem.u64Tof32(y)*frequency)) +
// //             0.25*(Simplexnoise1234.snoise2(4*CustomMem.u64Tof32(x)*frequency, 4*CustomMem.u64Tof32(y)*frequency));
// //             noiseRes /= amplitude;
    CustomIO.print("sd\n", .{"00 — 25: ",_000_025});
    CustomIO.print("sd\n", .{"25 — 50: ",_025_050});
    CustomIO.print("sd\n", .{"50 — 75: ",_050_075});
    CustomIO.print("sd\n", .{"75 — 100: ",_075_100});
}
    // Hex vertices heights
    var hexesHeightVkDeviceAddress: Vulkan.VkDeviceAddress = undefined;
    var hexesHeightBuffer: Vulkan.VkBuffer = undefined;
    var hexesHeightVkDeviceMemory: Vulkan.VkDeviceMemory = undefined;
    VkBuffer.createVkBuffer__VkDeviceMemory__VkDeviceAddress(Vulkan.VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT, @ptrCast(&hexexHeights), 4*hexesCount*HexVertices.len, &hexesHeightVkDeviceAddress,&hexesHeightBuffer, &hexesHeightVkDeviceMemory);


    // Vertex instance buffer
    var hexesDataVkDeviceAddress: Vulkan.VkDeviceAddress = undefined;
    var hexesDataBuffer: Vulkan.VkBuffer = undefined;
    var hexesDataVkDeviceMemory: Vulkan.VkDeviceMemory = undefined;
    VkBuffer.createVkBuffer__VkDeviceMemory__VkDeviceAddress(Vulkan.VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT, @ptrCast(&hexesData), @sizeOf(Hex.HexData)*hexesCount, &hexesDataVkDeviceAddress,&hexesDataBuffer, &hexesDataVkDeviceMemory);


    var hexesPosVkDeviceAddress: Vulkan.VkDeviceAddress = undefined;
    var hexesPosBuffer: Vulkan.VkBuffer = undefined;
    var hexesPosVkDeviceMemory: Vulkan.VkDeviceMemory = undefined;
    VkBuffer.createVkBuffer__VkDeviceMemory__VkDeviceAddress(Vulkan.VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT, @ptrCast(&hexesData), 8*hexesCount, &hexesPosVkDeviceAddress,&hexesPosBuffer, &hexesPosVkDeviceMemory);
    var hexesPosMapped: ?*anyopaque = undefined;
    _ = Vulkan.vkMapMemory(VulkanGlobalState._device, hexesPosVkDeviceMemory, 0, 8*hexesCount, 0, &hexesPosMapped);
    for(0..hexesCount) |hexIndex|
    {
        alignPtrCast([*][2]f32, hexesPosMapped)[hexIndex][0] = hexesData[hexIndex].x;
        alignPtrCast([*][2]f32, hexesPosMapped)[hexIndex][1] = hexesData[hexIndex].y;
    }
    defer
    {
        Vulkan.vkDestroyBuffer(VulkanGlobalState._device, hexesHeightBuffer, null);
        Vulkan.vkFreeMemory(VulkanGlobalState._device, hexesHeightVkDeviceMemory, null);

        Vulkan.vkDestroyBuffer(VulkanGlobalState._device, hexesDataBuffer, null);
        Vulkan.vkFreeMemory(VulkanGlobalState._device, hexesDataVkDeviceMemory, null);

        Vulkan.vkDestroyBuffer(VulkanGlobalState._device, hexesPosBuffer, null);
        Vulkan.vkFreeMemory(VulkanGlobalState._device, hexesPosVkDeviceMemory, null);
    }
//     var timespec1: linux.timespec = undefined;
//     _ = linux.clock_gettime(linux.CLOCK.REALTIME, &timespec1);
    Hex.Create_Hex_Pipeline(AoW4_archive.descriptorSetLayout, Hex.palette_DescriptorSetLayout, &Hex.Hex_PipelineLayout, &Hex.Hex_Pipeline);
    defer
    {
        Vulkan.vkDestroyPipeline(VulkanGlobalState._device, Hex.Hex_Pipeline, null);
        Vulkan.vkDestroyPipelineLayout(VulkanGlobalState._device, Hex.Hex_PipelineLayout, null);
    }
    Pipelines.CreatePipelineLayout(AoW4_archive.descriptorSetLayout);
    defer Vulkan.vkDestroyPipelineLayout(VulkanGlobalState._device, Pipelines.FernSolid_PipelineLayout, null);
    Pipelines.Create_FernSolid_Pipeline();
//     Pipelines.Create_DepthTransparency_Pipeline();
    Pipelines.Create_FernTransparency_Pipeline();
//     var timespec2: linux.timespec = undefined;
//     _ = linux.clock_gettime(linux.CLOCK.REALTIME, &timespec2);
//     const time: isize = (timespec2.sec-timespec1.sec)*1000 + (@as(i64, @intCast(@as(u64, @intCast(timespec2.nsec))/1000000)) - @as(i64, @intCast(@as(u64, @intCast(timespec1.nsec))/1000000)));
//     print("pipelines time: {d} ms\n", .{time});

    Pipelines.Create_TreesSolid_Pipeline();
    Pipelines.Create_TreesTransparency_Pipeline();
    defer
    {
        Vulkan.vkDestroyPipeline(VulkanGlobalState._device, Pipelines.FernSolid_Pipeline, null);
        Vulkan.vkDestroyPipeline(VulkanGlobalState._device, Pipelines.FernTransparency_Pipeline, null);
        Vulkan.vkDestroyPipeline(VulkanGlobalState._device, Pipelines.TreesSolid_Pipeline, null);
        Vulkan.vkDestroyPipeline(VulkanGlobalState._device, Pipelines.TreesTransparency_Pipeline, null);
    }
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

    var e: SDL.SDL_Event = undefined;
    var bQuit: bool = false;
    // //     bQuit = true;
    var windowPresent: bool = true;
    //
    var currentFrame: usize = 0;
    const cameraMove = 2;
    const cameraRotate = 5;
//     var frame: u64 = 0;
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
                        },
                        SDL.SDL_SCANCODE_P =>
                        {
                        },
                        SDL.SDL_SCANCODE_K =>
                        {
                        },
                        SDL.SDL_SCANCODE_L =>
                        {
                        },
                        // повороты
                        SDL.SDL_SCANCODE_UP =>
                        {
                            Camera.camera_rotate_x-=cameraRotate;
                        },
                        SDL.SDL_SCANCODE_DOWN =>
                        {
                            Camera.camera_rotate_x+=cameraRotate;
                        },
                        SDL.SDL_SCANCODE_LEFT =>
                        {
//                             Camera.camera_rotate_y+=cameraRotate;
                            Camera.camera_rotate_z-=cameraRotate;
                        },
                        SDL.SDL_SCANCODE_RIGHT =>
                        {
//                             Camera.camera_rotate_y-=cameraRotate;
                            Camera.camera_rotate_z+=cameraRotate;
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
//             Camera.camera_rotate_z+=0.5;
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
                    .depth = 0.0,
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

            var hexPushConstants: [32]u8 align(8) = undefined;
            alignPtrCast(*u64, &hexPushConstants[0]).* = HexVkVertexBufferAddress;
            alignPtrCast(*u64, &hexPushConstants[8]).* = hexesDataVkDeviceAddress;
            alignPtrCast(*u64, &hexPushConstants[16]).* = hexesHeightVkDeviceAddress;
            Vulkan.vkCmdPushConstants(cmd, Hex.Hex_PipelineLayout, Vulkan.VK_SHADER_STAGE_VERTEX_BIT, 0, 24, &hexPushConstants);
            var descriptorSets: [3]Vulkan.VkDescriptorSet = undefined;
            descriptorSets[0] = Camera._cameraDescriptorSets[currentFrame];
            descriptorSets[1] = AoW4_archive.descriptorSet;
            descriptorSets[2] = Hex.palette_DescriptorSet;
            Vulkan.vkCmdBindDescriptorSets(VulkanGlobalState._commandBuffers[currentFrame], Vulkan.VK_PIPELINE_BIND_POINT_GRAPHICS, Hex.Hex_PipelineLayout, 0, 3, &descriptorSets, 0, null);
//             Vulkan.vkCmdDraw(VulkanGlobalState._commandBuffers[currentFrame], 12, hexesCount, 0, 0);
            Vulkan.vkCmdBindIndexBuffer(VulkanGlobalState._commandBuffers[currentFrame], HexVkIndexBuffer, 0, Vulkan.VK_INDEX_TYPE_UINT16);
            Vulkan.vkCmdDrawIndexed(VulkanGlobalState._commandBuffers[currentFrame], 72, hexesCount, 0, 0, 0);

            // ferns
            Vulkan.vkCmdBindDescriptorSets(VulkanGlobalState._commandBuffers[currentFrame], Vulkan.VK_PIPELINE_BIND_POINT_GRAPHICS, Pipelines.FernSolid_PipelineLayout, 0, 2, &descriptorSets, 0, null);
            alignPtrCast(*u64, &hexPushConstants[0]).* = hexesPosVkDeviceAddress;
            alignPtrCast(*u64, &hexPushConstants[8]).* = AoW4_archive.meshesVkDeviceAddress+AoW4_archive.meshes[resourceID.@"Temp_Fertile_Fern_01_LushGrass"].vertexVkBufferOffset;
            alignPtrCast(*u32, &hexPushConstants[16]).* = AoW4_archive.meshes[resourceID.@"Temp_Fertile_Fern_01_LushGrass"].verticesCount;
            alignPtrCast(*u32, &hexPushConstants[20]).* = resourceID.@"LushGrass_Temperate_[DIFF_DXT5].tga";
            Vulkan.vkCmdPushConstants(cmd, Pipelines.FernSolid_PipelineLayout, Vulkan.VK_SHADER_STAGE_VERTEX_BIT, 0, 20, &hexPushConstants);
            Vulkan.vkCmdPushConstants(cmd, Pipelines.FernSolid_PipelineLayout, Vulkan.VK_SHADER_STAGE_FRAGMENT_BIT, 20, 4, &hexPushConstants[20]);

            Vulkan.vkCmdBindIndexBuffer(VulkanGlobalState._commandBuffers[currentFrame], AoW4_archive.meshesVkBuffer, AoW4_archive.meshes[resourceID.@"Temp_Fertile_Fern_01_LushGrass"].indexVkBufferOffset, Vulkan.VK_INDEX_TYPE_UINT16);

//             const camera_x = -Camera.camera_translate_x;
//             const camera_y = -Camera.camera_translate_y;
//             const camera_z = -Camera.camera_translate_z;

//             var hexesDrawCount: u32 = 0;
//             for(0..hexesCount) |hexIndex|
//             {
//                 if(hexesData[hexIndex].x < camera_x+camera_z
//                     and hexesData[hexIndex].x > camera_x-camera_z
//                     and hexesData[hexIndex].y < camera_y+camera_z
//                     and hexesData[hexIndex].y > camera_y-camera_z)
//                 {
//                     if(hexesData[hexIndex].paletteIndex == @intFromEnum(TexturesEnum.Temperate_Grassland_00))
//                     {
//                         alignPtrCast([*][2]f32, hexesPosMapped)[hexesDrawCount][0] = hexesData[hexIndex].x;
//                         alignPtrCast([*][2]f32, hexesPosMapped)[hexesDrawCount][1] = hexesData[hexIndex].y;
//                         hexesDrawCount+=1;
//                     }
// //                     alignPtrCast([*][2]f32, hexesPosMapped)[hexesDrawCount][0] = hexesData[hexIndex].x;
// //                     alignPtrCast([*][2]f32, hexesPosMapped)[hexesDrawCount][1] = hexesData[hexIndex].y;
// //                     hexesDrawCount+=1;
//                 }
//             }
//             Vulkan.vkCmdBindPipeline(VulkanGlobalState._commandBuffers[currentFrame], Vulkan.VK_PIPELINE_BIND_POINT_GRAPHICS, Pipelines.FernSolid_Pipeline);
//             Vulkan.vkCmdDrawIndexed(VulkanGlobalState._commandBuffers[currentFrame], AoW4_archive.meshes[resourceID.@"Temp_Fertile_Fern_01_LushGrass"].indicesCount, hexesDrawCount, 0, 0, 0);
//             Vulkan.vkCmdBindPipeline(VulkanGlobalState._commandBuffers[currentFrame], Vulkan.VK_PIPELINE_BIND_POINT_GRAPHICS, Pipelines.FernTransparency_Pipeline);
//             Vulkan.vkCmdDrawIndexed(VulkanGlobalState._commandBuffers[currentFrame], AoW4_archive.meshes[resourceID.@"Temp_Fertile_Fern_01_LushGrass"].indicesCount, hexesDrawCount, 0, 0, 0);

            // trees
            alignPtrCast(*u64, &hexPushConstants[8]).* = AoW4_archive.meshesVkDeviceAddress+AoW4_archive.meshes[resourceID.@"Temperate_Forest_06_PineTrees"].vertexVkBufferOffset;
            alignPtrCast(*u32, &hexPushConstants[16]).* = AoW4_archive.meshes[resourceID.@"Temperate_Forest_06_PineTrees"].verticesCount;
            alignPtrCast(*u32, &hexPushConstants[20]).* = resourceID.@"PineTrees_[DIFF_DXT5].tga";
            Vulkan.vkCmdPushConstants(cmd, Pipelines.FernSolid_PipelineLayout, Vulkan.VK_SHADER_STAGE_VERTEX_BIT, 0, 20, &hexPushConstants);
            Vulkan.vkCmdPushConstants(cmd, Pipelines.FernSolid_PipelineLayout, Vulkan.VK_SHADER_STAGE_FRAGMENT_BIT, 20, 4, &hexPushConstants[20]);
            Vulkan.vkCmdBindIndexBuffer(VulkanGlobalState._commandBuffers[currentFrame], AoW4_archive.meshesVkBuffer, AoW4_archive.meshes[resourceID.@"Temperate_Forest_06_PineTrees"].indexVkBufferOffset, Vulkan.VK_INDEX_TYPE_UINT16);

//             Vulkan.vkCmdBindPipeline(VulkanGlobalState._commandBuffers[currentFrame], Vulkan.VK_PIPELINE_BIND_POINT_GRAPHICS, Pipelines.TreesSolid_Pipeline);
//             Vulkan.vkCmdDrawIndexed(VulkanGlobalState._commandBuffers[currentFrame], AoW4_archive.meshes[resourceID.@"Temperate_Forest_06_PineTrees"].indicesCount, hexesDrawCount, 0, 0, 0);
//             Vulkan.vkCmdBindPipeline(VulkanGlobalState._commandBuffers[currentFrame], Vulkan.VK_PIPELINE_BIND_POINT_GRAPHICS, Pipelines.TreesTransparency_Pipeline);
//             Vulkan.vkCmdDrawIndexed(VulkanGlobalState._commandBuffers[currentFrame], AoW4_archive.meshes[resourceID.@"Temperate_Forest_06_PineTrees"].indicesCount, hexesDrawCount, 0, 0, 0);

            Vulkan.vkCmdEndRendering(VulkanGlobalState._commandBuffers[currentFrame]);
            VkImage.transitionImage(cmd, VulkanGlobalState._swapchainImages[swapchainImageIndex],
                            //Vulkan.VK_PIPELINE_STAGE_2_CLEAR_BIT
                            //Vulkan.VK_ACCESS_2_TRANSFER_WRITE_BIT
                            Vulkan.VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT,
                            Vulkan.VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT,
                            Vulkan.VK_ACCESS_2_COLOR_ATTACHMENT_WRITE_BIT,
                            0,
                            Vulkan.VK_IMAGE_LAYOUT_ATTACHMENT_OPTIMAL, Vulkan.VK_IMAGE_LAYOUT_PRESENT_SRC_KHR);

            VK_CHECK(Vulkan.vkEndCommandBuffer(cmd));
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
