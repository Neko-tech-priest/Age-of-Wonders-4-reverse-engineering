const std = @import("std");
const print = std.debug.print;
const exit = std.process.exit;

const GlobalState = @import("GlobalState.zig");

// const VulkanInclude = @import("VulkanInclude.zig");
const Vulkan = @import("Vulkan.zig");

const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;

pub fn createShaderModule(path: [*:0]const u8) Vulkan.VkShaderModule
{
    const file: std.fs.File = std.fs.cwd().openFileZ(path, .{}) catch
    {
        print("shader not found!\n", .{});exit(0);
    };// catch exit(0)
    defer file.close();

    const stat = file.stat() catch unreachable;
    const file_size: usize = stat.size;
    var fileBuffer: [*]u8 = (GlobalState.arenaAllocator.alignedAlloc(u8, 4, file_size + ((4 - file_size % 4) % 4)) catch unreachable).ptr;
    _ = file.read(fileBuffer[0..file_size]) catch unreachable;

    const createInfo = Vulkan.VkShaderModuleCreateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO,
        .codeSize = file_size,
        .pCode = @ptrCast(@alignCast(fileBuffer)),
    };

    var shaderModule: Vulkan.VkShaderModule = undefined;
    VK_CHECK(Vulkan.vkCreateShaderModule(VulkanGlobalState._device, &createInfo, null, &shaderModule));

    return shaderModule;
}
