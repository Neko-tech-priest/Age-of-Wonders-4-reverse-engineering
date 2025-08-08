const std = @import("std");

const Vulkan = @import("Vulkan.zig");

pub const Image = struct
{
	data: [*]const u8,
    size: u32,
	mipSize: u32,
	width: u16,
	height: u16,
	mipsCount: u8,
	alignment: u8,
	format: Vulkan.VkFormat,
};