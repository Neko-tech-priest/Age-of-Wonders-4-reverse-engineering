const std = @import("std");
const builtin = @import("builtin");
const native_os = builtin.os.tag;
const mem = std.mem;
const windows = std.os.windows;
const linux = std.os.linux;
const posix = std.posix;

const kernel32 = windows.kernel32;
pub inline fn map(n: usize) []u8
{
    const page_size = std.heap.pageSize();
    switch (native_os)
    {
        .windows =>
        {
            const ptr = kernel32.VirtualAlloc(null, n, windows.MEM_COMMIT | windows.MEM_RESERVE, windows.PAGE_READWRITE);
            return @ptrCast(ptr);
        },
        .linux =>
        {
            const aligned_len = n + ((page_size - n % page_size) % page_size);
            const hint = @atomicLoad(@TypeOf(std.heap.next_mmap_addr_hint), &std.heap.next_mmap_addr_hint, .unordered);
            const ptr: [*]u8 = @ptrFromInt(linux.mmap(hint,
                                                      aligned_len,
                                                      posix.PROT.READ | posix.PROT.WRITE,
                                                      .{ .TYPE = .PRIVATE, .ANONYMOUS = true },
                                                      -1,
                                                      0,));
            _ = @cmpxchgStrong(@TypeOf(std.heap.next_mmap_addr_hint), &std.heap.next_mmap_addr_hint, hint, @alignCast(ptr), .monotonic, .monotonic);
            return ptr[0..n];
        },
        else => @compileError("unsupported target")
    }
}

pub fn unmap(memory: []u8) void {
    if (native_os == .windows) {
        _ = kernel32.VirtualFree(memory.ptr, 0, windows.MEM_RELEASE);
    } else {
//         const page_aligned_len = mem.alignForward(usize, memory.len, std.heap.pageSize());
        _ = linux.munmap(memory.ptr, memory.len);
    }
}