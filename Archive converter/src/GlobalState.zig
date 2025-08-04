const std = @import("std");
const heap = std.heap;

pub var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
pub const arenaAllocator = arena.allocator();

pub var debugAllocator = std.heap.DebugAllocator(.{.stack_trace_frames = 0, .safety = true, .verbose_log = true}){};//.safety = false

pub var allocator: std.mem.Allocator = undefined;
