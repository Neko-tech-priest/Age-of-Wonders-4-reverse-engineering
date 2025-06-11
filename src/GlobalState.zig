const std = @import("std");
const heap = std.heap;

// pub var jdz = jdz_allocator.JdzAllocator(.{}).init();
// pub var allocator = jdz.allocator();

pub var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
pub const arenaAllocator = arena.allocator();

pub var debugAllocator = std.heap.DebugAllocator(.{.stack_trace_frames = 0, .safety = true, .verbose_log = true}){};//.safety = false

pub var allocator: std.mem.Allocator = undefined;
// pub var stackMemory: [4096*16]u8 align(4096) = undefined;

// pub const allocator: std.mem.Allocator = std.heap.smp_allocator;
// pub const pageAllocator = std.heap.page_allocator;


const stdout_file = std.io.getStdOut().writer();
pub var bw = std.io.bufferedWriter(stdout_file);
pub const stdout = bw.writer();