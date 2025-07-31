const std = @import("std");
const builtin = @import("builtin");
// std.builtin.BranchHint.
const linux = std.os.linux;
const windows = std.os.windows;

const native_os = builtin.os.tag;
pub fn exit() noreturn
{
    @branchHint(.cold);
//     if (builtin.link_libc)
//     {
//         std.c.exit(0);
//     }
    if (native_os == .linux and !builtin.single_threaded)
    {
        linux.exit_group(0);
    }
    if (native_os == .windows)
    {
        windows.kernel32.ExitProcess(0);
    }
//     @trap();
    @compileError("unsupported target");
}