const std = @import("std");
const linux = std.os.linux;
const Vulkan = @import("Vulkan.zig");

const GlobalState = @import("GlobalState.zig");
const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;

const PageAllocator = @import("PageAllocator.zig");
const CustomFS = @import("CustomFS.zig");
const CustomThreads = @import("CustomThreads.zig");
const exit = CustomThreads.exit;

pub fn createShaderModule(path: [*:0]const u8) Vulkan.VkShaderModule
{
//     const file: std.fs.File = std.fs.cwd().openFileZ(path, .{}) catch
    const file = CustomFS.open(path, .{.ACCMODE = .RDONLY});
//     const string = "shader not found!\n";
//     _ = CustomFS.write(1, string, string.len);
//     exit();
    var fileStat: linux.Stat = undefined;
    _ = CustomFS.fstat(file, &fileStat);
    const fileSize: u64 = @intCast(fileStat.size);
//     var fileBuffer: [*]u8 = (GlobalState.arenaAllocator.alignedAlloc(u8, 4, fileSize + ((4 - fileSize % 4) % 4)) catch unreachable).ptr;
//     _ = file.read(fileBuffer[0..fileSize]) catch unreachable;

    const fileBuffer = PageAllocator.map(fileSize);
    _ = CustomFS.read(file, fileBuffer, fileSize);
    _ = CustomFS.close(file);
    defer PageAllocator.unmap(fileBuffer, fileSize);

    const createInfo = Vulkan.VkShaderModuleCreateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO,
        .codeSize = fileSize,
        .pCode = @ptrCast(@alignCast(fileBuffer)),
    };

    var shaderModule: Vulkan.VkShaderModule = undefined;
    VK_CHECK(Vulkan.vkCreateShaderModule(VulkanGlobalState._device, &createInfo, null, &shaderModule));

    return shaderModule;
}
