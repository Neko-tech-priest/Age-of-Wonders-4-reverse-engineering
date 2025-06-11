

// const SDL = @import("SDL.zig").SDL2;
const SDL = @import("SDL3.zig");

// const VulkanInclude = @import("VulkanInclude.zig");
const Vulkan = @import("Vulkan.zig");

pub var _windowExtent = Vulkan.VkExtent2D{.width = 512, .height = 512};
pub var _window: ?*SDL.SDL_Window = null;
pub const _window_flags: SDL.SDL_WindowFlags = (SDL.SDL_WINDOW_RESIZABLE | SDL.SDL_WINDOW_VULKAN);
