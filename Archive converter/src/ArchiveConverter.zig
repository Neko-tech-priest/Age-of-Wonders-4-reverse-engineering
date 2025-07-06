const std = @import("std");
const builtin = @import("builtin");
const linux = std.os.linux;
const print = std.debug.print;
const exit = std.process.exit;

const PageAllocator = @import("PageAllocator.zig");
const CustomFS = @import("CustomFS.zig");

const AoW4_clb = @import("AoW4_clb.zig");

const GlobalState = @import("GlobalState.zig");

const archivesPaths = [_][*:0]const u8
{
    "Title/Libraries/Strategic/Terrain_Textures_Strategic.clb",
//     "Title/Libraries/Strategic/Terrain_Textures_Strategic.clb",
    "Title/Libraries/Strategic/Terrain_Temperate_Decorations_Strategic.clb",
//     "Title/Libraries/Strategic/Pickup_Strategic.clb",
};
pub fn main() void
{
    GlobalState.stdout = std.io.getStdOut().writer();
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
//     print("{*}\n", .{std.heap.next_mmap_addr_hint});
//     var memory: []u8 = undefined;
//     memory.ptr = PageAllocator.map(4096);
//     print("{*}\n", .{memory.ptr});
//     var memory2: []u8 = undefined;
//     memory2.ptr = PageAllocator.map(4096);
//     print("{*}\n", .{memory2.ptr});
//     PageAllocator.unmap(memory2);
    //../Age of Wonders 4/Content
    const AoW4_srcDirfd: std.posix.fd_t = CustomFS.open("Age of Wonders 4/Content", .{.ACCMODE = .RDONLY, .DIRECTORY = true});
    const AoW4_dstDirfd: std.posix.fd_t = CustomFS.open("../", .{.ACCMODE = .RDONLY, .DIRECTORY = true});
    defer _ = CustomFS.close(AoW4_srcDirfd);
    defer _ = CustomFS.close(AoW4_dstDirfd);
//     exit(0);
    AoW4_clb.convertArchives(&archivesPaths, AoW4_srcDirfd, AoW4_dstDirfd);
//     AoW4_clb.clb_convert("Title/Libraries/Strategic/Pickup_Strategic.clb", AoW4_srcDirfd, AoW4_dstDirfd);
//     AoW4_clb.clb_convert("Title/Libraries/Strategic/CrystalTree_Strategic.clb", AoW4_srcDirfd, AoW4_dstDirfd);
}