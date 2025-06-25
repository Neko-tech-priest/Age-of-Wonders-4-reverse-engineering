const std = @import("std");
const mem = std.mem;
const linux = std.os.linux;
const print = std.debug.print;
const exit = std.process.exit;

// const Vulkan = @import("Vulkan.zig");
const Vulkan = @import("Vulkan.zig");

const GlobalState = @import("GlobalState.zig");
const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;

const CustomMem = @import("CustomMem.zig");
const ptrCast = CustomMem.ptrCast;
const memcpy = CustomMem.memcpy;
const allocInFixedBufferT = CustomMem.allocInFixedBufferT;
const readFromPtr = CustomMem.readFromPtr;

const CustomFS = @import("CustomFS.zig");
const fd_t = std.posix.fd_t;

const Image = @import("Image.zig");
const Texture = @import("Texture.zig").Texture;
const VkImage = @import("VkImage.zig");

const Hex = @import("Hex.zig");

pub const ArchiveGPU = struct
{
//     pub const Texture = struct
//     {
//         vkImage: Vulkan.VkImage,
//         vkImageView: Vulkan.VkImageView,
//         pub fn unload(self: Texture) void
//         {
//             Vulkan.vkDestroyImage(VulkanGlobalState._device, self.vkImage, null);
//             Vulkan.vkDestroyImageView(VulkanGlobalState._device, self.vkImageView, null);
//         }
//     };
	textures: [*]Texture,
	texturesCount: u16,
	texturesVkDeviceMemory: Vulkan.VkDeviceMemory,
	descriptorSetLayout: Vulkan.VkDescriptorSetLayout,
	descriptorPool: Vulkan.VkDescriptorPool,
	descriptorSet: Vulkan.VkDescriptorSet,
	pub fn unload(self: ArchiveGPU) void
	{
		for(0..self.texturesCount) |i|
			self.textures[i].unload();
		Vulkan.vkFreeMemory(VulkanGlobalState._device, self.texturesVkDeviceMemory, null);
		Vulkan.vkDestroyDescriptorSetLayout(VulkanGlobalState._device, self.descriptorSetLayout, null);
		Vulkan.vkDestroyDescriptorPool(VulkanGlobalState._device, self.descriptorPool, null);
	}
};
pub fn clb_custom_read(allocator: mem.Allocator, path: []const u8, dirfd: fd_t, archive: *ArchiveGPU) void//dirfd: i32,
{
//     _ = allocator;
//     _ = archive;
//     const file: std.fs.File = std.fs.cwd().openFileZ(path, .{}) catch
//     {
//         print("custom clb not found!\n", .{});exit(0);
//     };
//     defer file.close();
//     const stat = file.stat() catch unreachable;
//     const mode: linux.mode_t = 0o655;
    const filefd: fd_t = CustomFS.openat(dirfd, @ptrCast(path.ptr), .{.ACCMODE = .RDONLY});
    defer _ = CustomFS.close(filefd);
    var fileStat: linux.Stat = undefined;
    _ = CustomFS.fstat(filefd, &fileStat);
    const fileSize: u64 = @intCast(fileStat.size);
    const fileBuffer: [*]u8 = (GlobalState.arenaAllocator.alloc(u8, fileSize) catch unreachable).ptr;
    _ = CustomFS.read(filefd, fileBuffer, fileSize);
    var fileBufferPtrItr = fileBuffer;
    if(@as(*u32, @alignCast(@ptrCast(fileBufferPtrItr))).* != @as(u32, @bitCast([4]u8{'C', 'R', 'L', 'C'})))
    {
        print("incorrect clb signature!\n", .{});
        exit(0);
    }
    archive.texturesCount = fileBufferPtrItr[4];
    fileBufferPtrItr+=5;
    archive.textures = (allocator.alloc(Texture, archive.texturesCount) catch unreachable).ptr;
    var images: [256]Image.Image = undefined;
    for(images[0..archive.texturesCount]) |*image|
    {
        const nameLen: u64 = fileBufferPtrItr[0];
        print("{s}\n", .{(fileBufferPtrItr+1)[0..nameLen]});
        fileBufferPtrItr+=1+nameLen;
        image.size = readFromPtr(u32, fileBufferPtrItr);
        image.mipSize = readFromPtr(u32, fileBufferPtrItr+4);
        image.width = readFromPtr(u16, fileBufferPtrItr+8);
        image.height = readFromPtr(u16, fileBufferPtrItr+10);
        image.format = readFromPtr(Vulkan.VkFormat, fileBufferPtrItr+12);
        image.alignment = fileBufferPtrItr[16];
        image.mipsCount = fileBufferPtrItr[17];
        fileBufferPtrItr+=18;
        image.data = fileBufferPtrItr;
        fileBufferPtrItr+=image.size;
    }
    print("\n", .{});
    if(archive.texturesCount > 0)
    {
        VkImage.createVkImages__VkImageViews__VkDeviceMemory_AoS_dst(&images, @ptrCast(archive.textures), @sizeOf(Texture), archive.texturesCount, &archive.texturesVkDeviceMemory);
    }
//     Hex.Create_DiffuseMaterial_VkDescriptorSetLayout(&archive.descriptorSetLayout);
//     Hex.Create_DiffuseMaterial_VkDescriptorPool(&archive.descriptorPool, @intCast(archive.texturesCount));
//     for(archive.textures[0..archive.texturesCount]) |*texture|
//     {
//     texture.Create_DiffuseMaterial_VkDescriptorSet(archive.descriptorSetLayout, archive.descriptorPool);
//     }
}
