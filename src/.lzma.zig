pub const __builtin_bswap16 = @import("std").zig.c_builtins.__builtin_bswap16;
pub const __builtin_bswap32 = @import("std").zig.c_builtins.__builtin_bswap32;
pub const __builtin_bswap64 = @import("std").zig.c_builtins.__builtin_bswap64;
pub const __builtin_signbit = @import("std").zig.c_builtins.__builtin_signbit;
pub const __builtin_signbitf = @import("std").zig.c_builtins.__builtin_signbitf;
pub const __builtin_popcount = @import("std").zig.c_builtins.__builtin_popcount;
pub const __builtin_ctz = @import("std").zig.c_builtins.__builtin_ctz;
pub const __builtin_clz = @import("std").zig.c_builtins.__builtin_clz;
pub const __builtin_sqrt = @import("std").zig.c_builtins.__builtin_sqrt;
pub const __builtin_sqrtf = @import("std").zig.c_builtins.__builtin_sqrtf;
pub const __builtin_sin = @import("std").zig.c_builtins.__builtin_sin;
pub const __builtin_sinf = @import("std").zig.c_builtins.__builtin_sinf;
pub const __builtin_cos = @import("std").zig.c_builtins.__builtin_cos;
pub const __builtin_cosf = @import("std").zig.c_builtins.__builtin_cosf;
pub const __builtin_exp = @import("std").zig.c_builtins.__builtin_exp;
pub const __builtin_expf = @import("std").zig.c_builtins.__builtin_expf;
pub const __builtin_exp2 = @import("std").zig.c_builtins.__builtin_exp2;
pub const __builtin_exp2f = @import("std").zig.c_builtins.__builtin_exp2f;
pub const __builtin_log = @import("std").zig.c_builtins.__builtin_log;
pub const __builtin_logf = @import("std").zig.c_builtins.__builtin_logf;
pub const __builtin_log2 = @import("std").zig.c_builtins.__builtin_log2;
pub const __builtin_log2f = @import("std").zig.c_builtins.__builtin_log2f;
pub const __builtin_log10 = @import("std").zig.c_builtins.__builtin_log10;
pub const __builtin_log10f = @import("std").zig.c_builtins.__builtin_log10f;
pub const __builtin_abs = @import("std").zig.c_builtins.__builtin_abs;
pub const __builtin_labs = @import("std").zig.c_builtins.__builtin_labs;
pub const __builtin_llabs = @import("std").zig.c_builtins.__builtin_llabs;
pub const __builtin_fabs = @import("std").zig.c_builtins.__builtin_fabs;
pub const __builtin_fabsf = @import("std").zig.c_builtins.__builtin_fabsf;
pub const __builtin_floor = @import("std").zig.c_builtins.__builtin_floor;
pub const __builtin_floorf = @import("std").zig.c_builtins.__builtin_floorf;
pub const __builtin_ceil = @import("std").zig.c_builtins.__builtin_ceil;
pub const __builtin_ceilf = @import("std").zig.c_builtins.__builtin_ceilf;
pub const __builtin_trunc = @import("std").zig.c_builtins.__builtin_trunc;
pub const __builtin_truncf = @import("std").zig.c_builtins.__builtin_truncf;
pub const __builtin_round = @import("std").zig.c_builtins.__builtin_round;
pub const __builtin_roundf = @import("std").zig.c_builtins.__builtin_roundf;
pub const __builtin_strlen = @import("std").zig.c_builtins.__builtin_strlen;
pub const __builtin_strcmp = @import("std").zig.c_builtins.__builtin_strcmp;
pub const __builtin_object_size = @import("std").zig.c_builtins.__builtin_object_size;
pub const __builtin___memset_chk = @import("std").zig.c_builtins.__builtin___memset_chk;
pub const __builtin_memset = @import("std").zig.c_builtins.__builtin_memset;
pub const __builtin___memcpy_chk = @import("std").zig.c_builtins.__builtin___memcpy_chk;
pub const __builtin_memcpy = @import("std").zig.c_builtins.__builtin_memcpy;
pub const __builtin_expect = @import("std").zig.c_builtins.__builtin_expect;
pub const __builtin_nanf = @import("std").zig.c_builtins.__builtin_nanf;
pub const __builtin_huge_valf = @import("std").zig.c_builtins.__builtin_huge_valf;
pub const __builtin_inff = @import("std").zig.c_builtins.__builtin_inff;
pub const __builtin_isnan = @import("std").zig.c_builtins.__builtin_isnan;
pub const __builtin_isinf = @import("std").zig.c_builtins.__builtin_isinf;
pub const __builtin_isinf_sign = @import("std").zig.c_builtins.__builtin_isinf_sign;
pub const __has_builtin = @import("std").zig.c_builtins.__has_builtin;
pub const __builtin_assume = @import("std").zig.c_builtins.__builtin_assume;
pub const __builtin_unreachable = @import("std").zig.c_builtins.__builtin_unreachable;
pub const __builtin_constant_p = @import("std").zig.c_builtins.__builtin_constant_p;
pub const __builtin_mul_overflow = @import("std").zig.c_builtins.__builtin_mul_overflow;
pub const ptrdiff_t = c_long;
pub const wchar_t = c_int;
pub const max_align_t = extern struct {
    __clang_max_align_nonce1: c_longlong align(8) = @import("std").mem.zeroes(c_longlong),
    __clang_max_align_nonce2: c_longdouble align(16) = @import("std").mem.zeroes(c_longdouble),
};
pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __suseconds64_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*anyopaque;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = [*c]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const int_least8_t = __int_least8_t;
pub const int_least16_t = __int_least16_t;
pub const int_least32_t = __int_least32_t;
pub const int_least64_t = __int_least64_t;
pub const uint_least8_t = __uint_least8_t;
pub const uint_least16_t = __uint_least16_t;
pub const uint_least32_t = __uint_least32_t;
pub const uint_least64_t = __uint_least64_t;
pub const int_fast8_t = i8;
pub const int_fast16_t = c_long;
pub const int_fast32_t = c_long;
pub const int_fast64_t = c_long;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = c_ulong;
pub const uint_fast32_t = c_ulong;
pub const uint_fast64_t = c_ulong;
pub const intmax_t = __intmax_t;
pub const uintmax_t = __uintmax_t;
pub const __gwchar_t = c_int;
pub const imaxdiv_t = extern struct {
    quot: c_long = @import("std").mem.zeroes(c_long),
    rem: c_long = @import("std").mem.zeroes(c_long),
};
pub extern fn imaxabs(__n: intmax_t) intmax_t;
pub extern fn imaxdiv(__numer: intmax_t, __denom: intmax_t) imaxdiv_t;
pub extern fn strtoimax(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) intmax_t;
pub extern fn strtoumax(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) uintmax_t;
pub extern fn wcstoimax(noalias __nptr: [*c]const __gwchar_t, noalias __endptr: [*c][*c]__gwchar_t, __base: c_int) intmax_t;
pub extern fn wcstoumax(noalias __nptr: [*c]const __gwchar_t, noalias __endptr: [*c][*c]__gwchar_t, __base: c_int) uintmax_t;
pub extern fn lzma_version_number() u32;
pub extern fn lzma_version_string() [*c]const u8;
pub const lzma_bool = u8;
pub const LZMA_RESERVED_ENUM: c_int = 0;
pub const lzma_reserved_enum = c_uint;
pub const LZMA_OK: c_int = 0;
pub const LZMA_STREAM_END: c_int = 1;
pub const LZMA_NO_CHECK: c_int = 2;
pub const LZMA_UNSUPPORTED_CHECK: c_int = 3;
pub const LZMA_GET_CHECK: c_int = 4;
pub const LZMA_MEM_ERROR: c_int = 5;
pub const LZMA_MEMLIMIT_ERROR: c_int = 6;
pub const LZMA_FORMAT_ERROR: c_int = 7;
pub const LZMA_OPTIONS_ERROR: c_int = 8;
pub const LZMA_DATA_ERROR: c_int = 9;
pub const LZMA_BUF_ERROR: c_int = 10;
pub const LZMA_PROG_ERROR: c_int = 11;
pub const LZMA_SEEK_NEEDED: c_int = 12;
pub const LZMA_RET_INTERNAL1: c_int = 101;
pub const LZMA_RET_INTERNAL2: c_int = 102;
pub const LZMA_RET_INTERNAL3: c_int = 103;
pub const LZMA_RET_INTERNAL4: c_int = 104;
pub const LZMA_RET_INTERNAL5: c_int = 105;
pub const LZMA_RET_INTERNAL6: c_int = 106;
pub const LZMA_RET_INTERNAL7: c_int = 107;
pub const LZMA_RET_INTERNAL8: c_int = 108;
pub const lzma_ret = c_uint;
pub const LZMA_RUN: c_int = 0;
pub const LZMA_SYNC_FLUSH: c_int = 1;
pub const LZMA_FULL_FLUSH: c_int = 2;
pub const LZMA_FULL_BARRIER: c_int = 4;
pub const LZMA_FINISH: c_int = 3;
pub const lzma_action = c_uint;
pub const lzma_allocator = extern struct {
    alloc: ?*const fn (?*anyopaque, usize, usize) callconv(.C) ?*anyopaque = @import("std").mem.zeroes(?*const fn (?*anyopaque, usize, usize) callconv(.C) ?*anyopaque),
    free: ?*const fn (?*anyopaque, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (?*anyopaque, ?*anyopaque) callconv(.C) void),
    @"opaque": ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const struct_lzma_internal_s = opaque {};
pub const lzma_internal = struct_lzma_internal_s;
pub const lzma_stream = extern struct {
    next_in: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    avail_in: usize = @import("std").mem.zeroes(usize),
    total_in: u64 = @import("std").mem.zeroes(u64),
    next_out: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    avail_out: usize = @import("std").mem.zeroes(usize),
    total_out: u64 = @import("std").mem.zeroes(u64),
    allocator: [*c]const lzma_allocator = @import("std").mem.zeroes([*c]const lzma_allocator),
    internal: ?*lzma_internal = @import("std").mem.zeroes(?*lzma_internal),
    reserved_ptr1: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    reserved_ptr2: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    reserved_ptr3: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    reserved_ptr4: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    seek_pos: u64 = @import("std").mem.zeroes(u64),
    reserved_int2: u64 = @import("std").mem.zeroes(u64),
    reserved_int3: usize = @import("std").mem.zeroes(usize),
    reserved_int4: usize = @import("std").mem.zeroes(usize),
    reserved_enum1: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
    reserved_enum2: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
};
pub extern fn lzma_code(strm: [*c]lzma_stream, action: lzma_action) lzma_ret;
pub extern fn lzma_end(strm: [*c]lzma_stream) void;
pub extern fn lzma_get_progress(strm: [*c]lzma_stream, progress_in: [*c]u64, progress_out: [*c]u64) void;
pub extern fn lzma_memusage(strm: [*c]const lzma_stream) u64;
pub extern fn lzma_memlimit_get(strm: [*c]const lzma_stream) u64;
pub extern fn lzma_memlimit_set(strm: [*c]lzma_stream, memlimit: u64) lzma_ret;
pub const lzma_vli = u64;
pub extern fn lzma_vli_encode(vli: lzma_vli, vli_pos: [*c]usize, out: [*c]u8, out_pos: [*c]usize, out_size: usize) lzma_ret;
pub extern fn lzma_vli_decode(vli: [*c]lzma_vli, vli_pos: [*c]usize, in: [*c]const u8, in_pos: [*c]usize, in_size: usize) lzma_ret;
pub extern fn lzma_vli_size(vli: lzma_vli) u32;
pub const LZMA_CHECK_NONE: c_int = 0;
pub const LZMA_CHECK_CRC32: c_int = 1;
pub const LZMA_CHECK_CRC64: c_int = 4;
pub const LZMA_CHECK_SHA256: c_int = 10;
pub const lzma_check = c_uint;
pub extern fn lzma_check_is_supported(check: lzma_check) lzma_bool;
pub extern fn lzma_check_size(check: lzma_check) u32;
pub extern fn lzma_crc32(buf: [*c]const u8, size: usize, crc: u32) u32;
pub extern fn lzma_crc64(buf: [*c]const u8, size: usize, crc: u64) u64;
pub extern fn lzma_get_check(strm: [*c]const lzma_stream) lzma_check;
pub const lzma_filter = extern struct {
    id: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    options: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub extern fn lzma_filter_encoder_is_supported(id: lzma_vli) lzma_bool;
pub extern fn lzma_filter_decoder_is_supported(id: lzma_vli) lzma_bool;
pub extern fn lzma_filters_copy(src: [*c]const lzma_filter, dest: [*c]lzma_filter, allocator: [*c]const lzma_allocator) lzma_ret;
pub extern fn lzma_filters_free(filters: [*c]lzma_filter, allocator: [*c]const lzma_allocator) void;
pub extern fn lzma_raw_encoder_memusage(filters: [*c]const lzma_filter) u64;
pub extern fn lzma_raw_decoder_memusage(filters: [*c]const lzma_filter) u64;
pub extern fn lzma_raw_encoder(strm: [*c]lzma_stream, filters: [*c]const lzma_filter) lzma_ret;
pub extern fn lzma_raw_decoder(strm: [*c]lzma_stream, filters: [*c]const lzma_filter) lzma_ret;
pub extern fn lzma_filters_update(strm: [*c]lzma_stream, filters: [*c]const lzma_filter) lzma_ret;
pub extern fn lzma_raw_buffer_encode(filters: [*c]const lzma_filter, allocator: [*c]const lzma_allocator, in: [*c]const u8, in_size: usize, out: [*c]u8, out_pos: [*c]usize, out_size: usize) lzma_ret;
pub extern fn lzma_raw_buffer_decode(filters: [*c]const lzma_filter, allocator: [*c]const lzma_allocator, in: [*c]const u8, in_pos: [*c]usize, in_size: usize, out: [*c]u8, out_pos: [*c]usize, out_size: usize) lzma_ret;
pub extern fn lzma_properties_size(size: [*c]u32, filter: [*c]const lzma_filter) lzma_ret;
pub extern fn lzma_properties_encode(filter: [*c]const lzma_filter, props: [*c]u8) lzma_ret;
pub extern fn lzma_properties_decode(filter: [*c]lzma_filter, allocator: [*c]const lzma_allocator, props: [*c]const u8, props_size: usize) lzma_ret;
pub extern fn lzma_filter_flags_size(size: [*c]u32, filter: [*c]const lzma_filter) lzma_ret;
pub extern fn lzma_filter_flags_encode(filter: [*c]const lzma_filter, out: [*c]u8, out_pos: [*c]usize, out_size: usize) lzma_ret;
pub extern fn lzma_filter_flags_decode(filter: [*c]lzma_filter, allocator: [*c]const lzma_allocator, in: [*c]const u8, in_pos: [*c]usize, in_size: usize) lzma_ret;
pub extern fn lzma_str_to_filters(str: [*c]const u8, error_pos: [*c]c_int, filters: [*c]lzma_filter, flags: u32, allocator: [*c]const lzma_allocator) [*c]const u8;
pub extern fn lzma_str_from_filters(str: [*c][*c]u8, filters: [*c]const lzma_filter, flags: u32, allocator: [*c]const lzma_allocator) lzma_ret;
pub extern fn lzma_str_list_filters(str: [*c][*c]u8, filter_id: lzma_vli, flags: u32, allocator: [*c]const lzma_allocator) lzma_ret;
pub const lzma_options_bcj = extern struct {
    start_offset: u32 = @import("std").mem.zeroes(u32),
};
pub const LZMA_DELTA_TYPE_BYTE: c_int = 0;
pub const lzma_delta_type = c_uint;
pub const lzma_options_delta = extern struct {
    type: lzma_delta_type = @import("std").mem.zeroes(lzma_delta_type),
    dist: u32 = @import("std").mem.zeroes(u32),
    reserved_int1: u32 = @import("std").mem.zeroes(u32),
    reserved_int2: u32 = @import("std").mem.zeroes(u32),
    reserved_int3: u32 = @import("std").mem.zeroes(u32),
    reserved_int4: u32 = @import("std").mem.zeroes(u32),
    reserved_ptr1: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    reserved_ptr2: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const LZMA_MF_HC3: c_int = 3;
pub const LZMA_MF_HC4: c_int = 4;
pub const LZMA_MF_BT2: c_int = 18;
pub const LZMA_MF_BT3: c_int = 19;
pub const LZMA_MF_BT4: c_int = 20;
pub const lzma_match_finder = c_uint;
pub extern fn lzma_mf_is_supported(match_finder: lzma_match_finder) lzma_bool;
pub const LZMA_MODE_FAST: c_int = 1;
pub const LZMA_MODE_NORMAL: c_int = 2;
pub const lzma_mode = c_uint;
pub extern fn lzma_mode_is_supported(mode: lzma_mode) lzma_bool;
pub const lzma_options_lzma = extern struct {
    dict_size: u32 = @import("std").mem.zeroes(u32),
    preset_dict: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    preset_dict_size: u32 = @import("std").mem.zeroes(u32),
    lc: u32 = @import("std").mem.zeroes(u32),
    lp: u32 = @import("std").mem.zeroes(u32),
    pb: u32 = @import("std").mem.zeroes(u32),
    mode: lzma_mode = @import("std").mem.zeroes(lzma_mode),
    nice_len: u32 = @import("std").mem.zeroes(u32),
    mf: lzma_match_finder = @import("std").mem.zeroes(lzma_match_finder),
    depth: u32 = @import("std").mem.zeroes(u32),
    ext_flags: u32 = @import("std").mem.zeroes(u32),
    ext_size_low: u32 = @import("std").mem.zeroes(u32),
    ext_size_high: u32 = @import("std").mem.zeroes(u32),
    reserved_int4: u32 = @import("std").mem.zeroes(u32),
    reserved_int5: u32 = @import("std").mem.zeroes(u32),
    reserved_int6: u32 = @import("std").mem.zeroes(u32),
    reserved_int7: u32 = @import("std").mem.zeroes(u32),
    reserved_int8: u32 = @import("std").mem.zeroes(u32),
    reserved_enum1: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
    reserved_enum2: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
    reserved_enum3: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
    reserved_enum4: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
    reserved_ptr1: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    reserved_ptr2: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub extern fn lzma_lzma_preset(options: [*c]lzma_options_lzma, preset: u32) lzma_bool;
pub const lzma_mt = extern struct {
    flags: u32 = @import("std").mem.zeroes(u32),
    threads: u32 = @import("std").mem.zeroes(u32),
    block_size: u64 = @import("std").mem.zeroes(u64),
    timeout: u32 = @import("std").mem.zeroes(u32),
    preset: u32 = @import("std").mem.zeroes(u32),
    filters: [*c]const lzma_filter = @import("std").mem.zeroes([*c]const lzma_filter),
    check: lzma_check = @import("std").mem.zeroes(lzma_check),
    reserved_enum1: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
    reserved_enum2: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
    reserved_enum3: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
    reserved_int1: u32 = @import("std").mem.zeroes(u32),
    reserved_int2: u32 = @import("std").mem.zeroes(u32),
    reserved_int3: u32 = @import("std").mem.zeroes(u32),
    reserved_int4: u32 = @import("std").mem.zeroes(u32),
    memlimit_threading: u64 = @import("std").mem.zeroes(u64),
    memlimit_stop: u64 = @import("std").mem.zeroes(u64),
    reserved_int7: u64 = @import("std").mem.zeroes(u64),
    reserved_int8: u64 = @import("std").mem.zeroes(u64),
    reserved_ptr1: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    reserved_ptr2: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    reserved_ptr3: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    reserved_ptr4: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub extern fn lzma_easy_encoder_memusage(preset: u32) u64;
pub extern fn lzma_easy_decoder_memusage(preset: u32) u64;
pub extern fn lzma_easy_encoder(strm: [*c]lzma_stream, preset: u32, check: lzma_check) lzma_ret;
pub extern fn lzma_easy_buffer_encode(preset: u32, check: lzma_check, allocator: [*c]const lzma_allocator, in: [*c]const u8, in_size: usize, out: [*c]u8, out_pos: [*c]usize, out_size: usize) lzma_ret;
pub extern fn lzma_stream_encoder(strm: [*c]lzma_stream, filters: [*c]const lzma_filter, check: lzma_check) lzma_ret;
pub extern fn lzma_stream_encoder_mt_memusage(options: [*c]const lzma_mt) u64;
pub extern fn lzma_stream_encoder_mt(strm: [*c]lzma_stream, options: [*c]const lzma_mt) lzma_ret;
pub extern fn lzma_mt_block_size(filters: [*c]const lzma_filter) u64;
pub extern fn lzma_alone_encoder(strm: [*c]lzma_stream, options: [*c]const lzma_options_lzma) lzma_ret;
pub extern fn lzma_stream_buffer_bound(uncompressed_size: usize) usize;
pub extern fn lzma_stream_buffer_encode(filters: [*c]lzma_filter, check: lzma_check, allocator: [*c]const lzma_allocator, in: [*c]const u8, in_size: usize, out: [*c]u8, out_pos: [*c]usize, out_size: usize) lzma_ret;
pub extern fn lzma_microlzma_encoder(strm: [*c]lzma_stream, options: [*c]const lzma_options_lzma) lzma_ret;
pub extern fn lzma_stream_decoder(strm: [*c]lzma_stream, memlimit: u64, flags: u32) lzma_ret;
pub extern fn lzma_stream_decoder_mt(strm: [*c]lzma_stream, options: [*c]const lzma_mt) lzma_ret;
pub extern fn lzma_auto_decoder(strm: [*c]lzma_stream, memlimit: u64, flags: u32) lzma_ret;
pub extern fn lzma_alone_decoder(strm: [*c]lzma_stream, memlimit: u64) lzma_ret;
pub extern fn lzma_lzip_decoder(strm: [*c]lzma_stream, memlimit: u64, flags: u32) lzma_ret;
pub extern fn lzma_stream_buffer_decode(memlimit: [*c]u64, flags: u32, allocator: [*c]const lzma_allocator, in: [*c]const u8, in_pos: [*c]usize, in_size: usize, out: [*c]u8, out_pos: [*c]usize, out_size: usize) lzma_ret;
pub extern fn lzma_microlzma_decoder(strm: [*c]lzma_stream, comp_size: u64, uncomp_size: u64, uncomp_size_is_exact: lzma_bool, dict_size: u32) lzma_ret;
pub const lzma_stream_flags = extern struct {
    version: u32 = @import("std").mem.zeroes(u32),
    backward_size: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    check: lzma_check = @import("std").mem.zeroes(lzma_check),
    reserved_enum1: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
    reserved_enum2: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
    reserved_enum3: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
    reserved_enum4: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
    reserved_bool1: lzma_bool = @import("std").mem.zeroes(lzma_bool),
    reserved_bool2: lzma_bool = @import("std").mem.zeroes(lzma_bool),
    reserved_bool3: lzma_bool = @import("std").mem.zeroes(lzma_bool),
    reserved_bool4: lzma_bool = @import("std").mem.zeroes(lzma_bool),
    reserved_bool5: lzma_bool = @import("std").mem.zeroes(lzma_bool),
    reserved_bool6: lzma_bool = @import("std").mem.zeroes(lzma_bool),
    reserved_bool7: lzma_bool = @import("std").mem.zeroes(lzma_bool),
    reserved_bool8: lzma_bool = @import("std").mem.zeroes(lzma_bool),
    reserved_int1: u32 = @import("std").mem.zeroes(u32),
    reserved_int2: u32 = @import("std").mem.zeroes(u32),
};
pub extern fn lzma_stream_header_encode(options: [*c]const lzma_stream_flags, out: [*c]u8) lzma_ret;
pub extern fn lzma_stream_footer_encode(options: [*c]const lzma_stream_flags, out: [*c]u8) lzma_ret;
pub extern fn lzma_stream_header_decode(options: [*c]lzma_stream_flags, in: [*c]const u8) lzma_ret;
pub extern fn lzma_stream_footer_decode(options: [*c]lzma_stream_flags, in: [*c]const u8) lzma_ret;
pub extern fn lzma_stream_flags_compare(a: [*c]const lzma_stream_flags, b: [*c]const lzma_stream_flags) lzma_ret;
pub const lzma_block = extern struct {
    version: u32 = @import("std").mem.zeroes(u32),
    header_size: u32 = @import("std").mem.zeroes(u32),
    check: lzma_check = @import("std").mem.zeroes(lzma_check),
    compressed_size: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    uncompressed_size: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    filters: [*c]lzma_filter = @import("std").mem.zeroes([*c]lzma_filter),
    raw_check: [64]u8 = @import("std").mem.zeroes([64]u8),
    reserved_ptr1: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    reserved_ptr2: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    reserved_ptr3: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    reserved_int1: u32 = @import("std").mem.zeroes(u32),
    reserved_int2: u32 = @import("std").mem.zeroes(u32),
    reserved_int3: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    reserved_int4: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    reserved_int5: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    reserved_int6: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    reserved_int7: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    reserved_int8: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    reserved_enum1: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
    reserved_enum2: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
    reserved_enum3: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
    reserved_enum4: lzma_reserved_enum = @import("std").mem.zeroes(lzma_reserved_enum),
    ignore_check: lzma_bool = @import("std").mem.zeroes(lzma_bool),
    reserved_bool2: lzma_bool = @import("std").mem.zeroes(lzma_bool),
    reserved_bool3: lzma_bool = @import("std").mem.zeroes(lzma_bool),
    reserved_bool4: lzma_bool = @import("std").mem.zeroes(lzma_bool),
    reserved_bool5: lzma_bool = @import("std").mem.zeroes(lzma_bool),
    reserved_bool6: lzma_bool = @import("std").mem.zeroes(lzma_bool),
    reserved_bool7: lzma_bool = @import("std").mem.zeroes(lzma_bool),
    reserved_bool8: lzma_bool = @import("std").mem.zeroes(lzma_bool),
};
pub extern fn lzma_block_header_size(block: [*c]lzma_block) lzma_ret;
pub extern fn lzma_block_header_encode(block: [*c]const lzma_block, out: [*c]u8) lzma_ret;
pub extern fn lzma_block_header_decode(block: [*c]lzma_block, allocator: [*c]const lzma_allocator, in: [*c]const u8) lzma_ret;
pub extern fn lzma_block_compressed_size(block: [*c]lzma_block, unpadded_size: lzma_vli) lzma_ret;
pub extern fn lzma_block_unpadded_size(block: [*c]const lzma_block) lzma_vli;
pub extern fn lzma_block_total_size(block: [*c]const lzma_block) lzma_vli;
pub extern fn lzma_block_encoder(strm: [*c]lzma_stream, block: [*c]lzma_block) lzma_ret;
pub extern fn lzma_block_decoder(strm: [*c]lzma_stream, block: [*c]lzma_block) lzma_ret;
pub extern fn lzma_block_buffer_bound(uncompressed_size: usize) usize;
pub extern fn lzma_block_buffer_encode(block: [*c]lzma_block, allocator: [*c]const lzma_allocator, in: [*c]const u8, in_size: usize, out: [*c]u8, out_pos: [*c]usize, out_size: usize) lzma_ret;
pub extern fn lzma_block_uncomp_encode(block: [*c]lzma_block, in: [*c]const u8, in_size: usize, out: [*c]u8, out_pos: [*c]usize, out_size: usize) lzma_ret;
pub extern fn lzma_block_buffer_decode(block: [*c]lzma_block, allocator: [*c]const lzma_allocator, in: [*c]const u8, in_pos: [*c]usize, in_size: usize, out: [*c]u8, out_pos: [*c]usize, out_size: usize) lzma_ret;
pub const struct_lzma_index_s = opaque {};
pub const lzma_index = struct_lzma_index_s;
const struct_unnamed_1 = extern struct {
    flags: [*c]const lzma_stream_flags = @import("std").mem.zeroes([*c]const lzma_stream_flags),
    reserved_ptr1: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    reserved_ptr2: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    reserved_ptr3: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    number: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    block_count: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    compressed_offset: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    uncompressed_offset: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    compressed_size: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    uncompressed_size: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    padding: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    reserved_vli1: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    reserved_vli2: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    reserved_vli3: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    reserved_vli4: lzma_vli = @import("std").mem.zeroes(lzma_vli),
};
const struct_unnamed_2 = extern struct {
    number_in_file: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    compressed_file_offset: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    uncompressed_file_offset: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    number_in_stream: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    compressed_stream_offset: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    uncompressed_stream_offset: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    uncompressed_size: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    unpadded_size: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    total_size: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    reserved_vli1: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    reserved_vli2: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    reserved_vli3: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    reserved_vli4: lzma_vli = @import("std").mem.zeroes(lzma_vli),
    reserved_ptr1: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    reserved_ptr2: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    reserved_ptr3: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    reserved_ptr4: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
const union_unnamed_3 = extern union {
    p: ?*const anyopaque,
    s: usize,
    v: lzma_vli,
};
pub const lzma_index_iter = extern struct {
    stream: struct_unnamed_1 = @import("std").mem.zeroes(struct_unnamed_1),
    block: struct_unnamed_2 = @import("std").mem.zeroes(struct_unnamed_2),
    internal: [6]union_unnamed_3 = @import("std").mem.zeroes([6]union_unnamed_3),
};
pub const LZMA_INDEX_ITER_ANY: c_int = 0;
pub const LZMA_INDEX_ITER_STREAM: c_int = 1;
pub const LZMA_INDEX_ITER_BLOCK: c_int = 2;
pub const LZMA_INDEX_ITER_NONEMPTY_BLOCK: c_int = 3;
pub const lzma_index_iter_mode = c_uint;
pub extern fn lzma_index_memusage(streams: lzma_vli, blocks: lzma_vli) u64;
pub extern fn lzma_index_memused(i: ?*const lzma_index) u64;
pub extern fn lzma_index_init(allocator: [*c]const lzma_allocator) ?*lzma_index;
pub extern fn lzma_index_end(i: ?*lzma_index, allocator: [*c]const lzma_allocator) void;
pub extern fn lzma_index_append(i: ?*lzma_index, allocator: [*c]const lzma_allocator, unpadded_size: lzma_vli, uncompressed_size: lzma_vli) lzma_ret;
pub extern fn lzma_index_stream_flags(i: ?*lzma_index, stream_flags: [*c]const lzma_stream_flags) lzma_ret;
pub extern fn lzma_index_checks(i: ?*const lzma_index) u32;
pub extern fn lzma_index_stream_padding(i: ?*lzma_index, stream_padding: lzma_vli) lzma_ret;
pub extern fn lzma_index_stream_count(i: ?*const lzma_index) lzma_vli;
pub extern fn lzma_index_block_count(i: ?*const lzma_index) lzma_vli;
pub extern fn lzma_index_size(i: ?*const lzma_index) lzma_vli;
pub extern fn lzma_index_stream_size(i: ?*const lzma_index) lzma_vli;
pub extern fn lzma_index_total_size(i: ?*const lzma_index) lzma_vli;
pub extern fn lzma_index_file_size(i: ?*const lzma_index) lzma_vli;
pub extern fn lzma_index_uncompressed_size(i: ?*const lzma_index) lzma_vli;
pub extern fn lzma_index_iter_init(iter: [*c]lzma_index_iter, i: ?*const lzma_index) void;
pub extern fn lzma_index_iter_rewind(iter: [*c]lzma_index_iter) void;
pub extern fn lzma_index_iter_next(iter: [*c]lzma_index_iter, mode: lzma_index_iter_mode) lzma_bool;
pub extern fn lzma_index_iter_locate(iter: [*c]lzma_index_iter, target: lzma_vli) lzma_bool;
pub extern fn lzma_index_cat(dest: ?*lzma_index, src: ?*lzma_index, allocator: [*c]const lzma_allocator) lzma_ret;
pub extern fn lzma_index_dup(i: ?*const lzma_index, allocator: [*c]const lzma_allocator) ?*lzma_index;
pub extern fn lzma_index_encoder(strm: [*c]lzma_stream, i: ?*const lzma_index) lzma_ret;
pub extern fn lzma_index_decoder(strm: [*c]lzma_stream, i: [*c]?*lzma_index, memlimit: u64) lzma_ret;
pub extern fn lzma_index_buffer_encode(i: ?*const lzma_index, out: [*c]u8, out_pos: [*c]usize, out_size: usize) lzma_ret;
pub extern fn lzma_index_buffer_decode(i: [*c]?*lzma_index, memlimit: [*c]u64, allocator: [*c]const lzma_allocator, in: [*c]const u8, in_pos: [*c]usize, in_size: usize) lzma_ret;
pub extern fn lzma_file_info_decoder(strm: [*c]lzma_stream, dest_index: [*c]?*lzma_index, memlimit: u64, file_size: u64) lzma_ret;
pub const struct_lzma_index_hash_s = opaque {};
pub const lzma_index_hash = struct_lzma_index_hash_s;
pub extern fn lzma_index_hash_init(index_hash: ?*lzma_index_hash, allocator: [*c]const lzma_allocator) ?*lzma_index_hash;
pub extern fn lzma_index_hash_end(index_hash: ?*lzma_index_hash, allocator: [*c]const lzma_allocator) void;
pub extern fn lzma_index_hash_append(index_hash: ?*lzma_index_hash, unpadded_size: lzma_vli, uncompressed_size: lzma_vli) lzma_ret;
pub extern fn lzma_index_hash_decode(index_hash: ?*lzma_index_hash, in: [*c]const u8, in_pos: [*c]usize, in_size: usize) lzma_ret;
pub extern fn lzma_index_hash_size(index_hash: ?*const lzma_index_hash) lzma_vli;
pub extern fn lzma_physmem() u64;
pub extern fn lzma_cputhreads() u32;
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 18);
pub const __clang_minor__ = @as(c_int, 1);
pub const __clang_patchlevel__ = @as(c_int, 8);
pub const __clang_version__ = "18.1.8 ";
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __GXX_ABI_VERSION = @as(c_int, 1002);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __MEMORY_SCOPE_SYSTEM = @as(c_int, 0);
pub const __MEMORY_SCOPE_DEVICE = @as(c_int, 1);
pub const __MEMORY_SCOPE_WRKGRP = @as(c_int, 2);
pub const __MEMORY_SCOPE_WVFRNT = @as(c_int, 3);
pub const __MEMORY_SCOPE_SINGLE = @as(c_int, 4);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
pub const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
pub const __FPCLASS_SNAN = @as(c_int, 0x0001);
pub const __FPCLASS_QNAN = @as(c_int, 0x0002);
pub const __FPCLASS_NEGINF = @as(c_int, 0x0004);
pub const __FPCLASS_NEGNORMAL = @as(c_int, 0x0008);
pub const __FPCLASS_NEGSUBNORMAL = @as(c_int, 0x0010);
pub const __FPCLASS_NEGZERO = @as(c_int, 0x0020);
pub const __FPCLASS_POSZERO = @as(c_int, 0x0040);
pub const __FPCLASS_POSSUBNORMAL = @as(c_int, 0x0080);
pub const __FPCLASS_POSNORMAL = @as(c_int, 0x0100);
pub const __FPCLASS_POSINF = @as(c_int, 0x0200);
pub const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
pub const __VERSION__ = "Clang 18.1.8";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __clang_literal_encoding__ = "UTF-8";
pub const __clang_wide_literal_encoding__ = "UTF-32";
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_WIDTH__ = @as(c_int, 64);
pub const __LLONG_WIDTH__ = @as(c_int, 64);
pub const __BITINT_MAXWIDTH__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 8388608, .decimal);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_FMTd__ = "ld";
pub const __INTMAX_FMTi__ = "li";
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`");
// (no file):95:9
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_FMTo__ = "lo";
pub const __UINTMAX_FMTu__ = "lu";
pub const __UINTMAX_FMTx__ = "lx";
pub const __UINTMAX_FMTX__ = "lX";
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`");
// (no file):101:9
pub const __PTRDIFF_TYPE__ = c_long;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __INTPTR_TYPE__ = c_long;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __SIZE_TYPE__ = c_ulong;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __WCHAR_TYPE__ = c_int;
pub const __WINT_TYPE__ = c_uint;
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
pub const __FLT16_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT16_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_HAS_DENORM__ = @as(c_int, 1);
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __POINTER_WIDTH__ = @as(c_int, 64);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub const __INT64_TYPE__ = c_long;
pub const __INT64_FMTd__ = "ld";
pub const __INT64_FMTi__ = "li";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`");
// (no file):198:9
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`");
// (no file):220:9
pub const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulong;
pub const __UINT64_FMTo__ = "lo";
pub const __UINT64_FMTu__ = "lu";
pub const __UINT64_FMTx__ = "lx";
pub const __UINT64_FMTX__ = "lX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`");
// (no file):228:9
pub const __UINT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __INT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_long;
pub const __INT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_LEAST64_FMTd__ = "ld";
pub const __INT_LEAST64_FMTi__ = "li";
pub const __UINT_LEAST64_TYPE__ = c_ulong;
pub const __UINT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_LEAST64_FMTo__ = "lo";
pub const __UINT_LEAST64_FMTu__ = "lu";
pub const __UINT_LEAST64_FMTx__ = "lx";
pub const __UINT_LEAST64_FMTX__ = "lX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_TYPE__ = c_long;
pub const __INT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_FAST64_FMTd__ = "ld";
pub const __INT_FAST64_FMTi__ = "li";
pub const __UINT_FAST64_TYPE__ = c_ulong;
pub const __UINT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_FAST64_FMTo__ = "lo";
pub const __UINT_FAST64_FMTu__ = "lu";
pub const __UINT_FAST64_FMTx__ = "lx";
pub const __UINT_FAST64_FMTX__ = "lX";
pub const __USER_LABEL_PREFIX__ = "";
pub const __FINITE_MATH_ONLY__ = @as(c_int, 0);
pub const __GNUC_STDC_INLINE__ = @as(c_int, 1);
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
pub const __GCC_DESTRUCTIVE_SIZE = @as(c_int, 64);
pub const __GCC_CONSTRUCTIVE_SIZE = @as(c_int, 64);
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __NO_INLINE__ = @as(c_int, 1);
pub const __PIC__ = @as(c_int, 2);
pub const __pic__ = @as(c_int, 2);
pub const __PIE__ = @as(c_int, 2);
pub const __pie__ = @as(c_int, 2);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __ELF__ = @as(c_int, 1);
pub const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __seg_gs = @compileError("unable to translate macro: undefined identifier `address_space`");
// (no file):363:9
pub const __seg_fs = @compileError("unable to translate macro: undefined identifier `address_space`");
// (no file):364:9
pub const __goldmont = @as(c_int, 1);
pub const __goldmont__ = @as(c_int, 1);
pub const __tune_goldmont__ = @as(c_int, 1);
pub const __REGISTER_PREFIX__ = "";
pub const __NO_MATH_INLINES = @as(c_int, 1);
pub const __AES__ = @as(c_int, 1);
pub const __PCLMUL__ = @as(c_int, 1);
pub const __LAHF_SAHF__ = @as(c_int, 1);
pub const __RDRND__ = @as(c_int, 1);
pub const __FSGSBASE__ = @as(c_int, 1);
pub const __POPCNT__ = @as(c_int, 1);
pub const __PRFCHW__ = @as(c_int, 1);
pub const __RDSEED__ = @as(c_int, 1);
pub const __MOVBE__ = @as(c_int, 1);
pub const __SHA__ = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __CLFLUSHOPT__ = @as(c_int, 1);
pub const __CRC32__ = @as(c_int, 1);
pub const __SSE4_2__ = @as(c_int, 1);
pub const __SSE4_1__ = @as(c_int, 1);
pub const __SSSE3__ = @as(c_int, 1);
pub const __SSE3__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE2_MATH__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
pub const __SIZEOF_FLOAT128__ = @as(c_int, 16);
pub const unix = @as(c_int, 1);
pub const __unix = @as(c_int, 1);
pub const __unix__ = @as(c_int, 1);
pub const linux = @as(c_int, 1);
pub const __linux = @as(c_int, 1);
pub const __linux__ = @as(c_int, 1);
pub const __gnu_linux__ = @as(c_int, 1);
pub const __FLOAT128__ = @as(c_int, 1);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const _DEBUG = @as(c_int, 1);
pub const __GCC_HAVE_DWARF2_CFI_ASM = @as(c_int, 1);
pub const LZMA_H = "";
pub const __STDDEF_H = "";
pub const __need_ptrdiff_t = "";
pub const __need_size_t = "";
pub const __need_wchar_t = "";
pub const __need_NULL = "";
pub const __need_max_align_t = "";
pub const __need_offsetof = "";
pub const _PTRDIFF_T = "";
pub const _SIZE_T = "";
pub const _WCHAR_T = "";
pub const NULL = @import("std").zig.c_translation.cast(?*anyopaque, @as(c_int, 0));
pub const __CLANG_MAX_ALIGN_T_DEFINED = "";
pub const offsetof = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// /usr/lib/zig/include/__stddef_offsetof.h:16:9
pub const _INTTYPES_H = @as(c_int, 1);
pub const _FEATURES_H = @as(c_int, 1);
pub const __KERNEL_STRICT_NAMES = "";
pub inline fn __GNUC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub inline fn __glibc_clang_prereq(maj: anytype, min: anytype) @TypeOf(((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min);
}
pub const __GLIBC_USE = @compileError("unable to translate macro: undefined identifier `__GLIBC_USE_`");
// /usr/include/features.h:189:9
pub const _DEFAULT_SOURCE = @as(c_int, 1);
pub const __GLIBC_USE_ISOC23 = @as(c_int, 0);
pub const __USE_ISOC11 = @as(c_int, 1);
pub const __USE_ISOC99 = @as(c_int, 1);
pub const __USE_ISOC95 = @as(c_int, 1);
pub const __USE_POSIX_IMPLICITLY = @as(c_int, 1);
pub const _POSIX_SOURCE = @as(c_int, 1);
pub const _POSIX_C_SOURCE = @as(c_long, 200809);
pub const __USE_POSIX = @as(c_int, 1);
pub const __USE_POSIX2 = @as(c_int, 1);
pub const __USE_POSIX199309 = @as(c_int, 1);
pub const __USE_POSIX199506 = @as(c_int, 1);
pub const __USE_XOPEN2K = @as(c_int, 1);
pub const __USE_XOPEN2K8 = @as(c_int, 1);
pub const _ATFILE_SOURCE = @as(c_int, 1);
pub const __WORDSIZE = @as(c_int, 64);
pub const __WORDSIZE_TIME64_COMPAT32 = @as(c_int, 1);
pub const __SYSCALL_WORDSIZE = @as(c_int, 64);
pub const __TIMESIZE = __WORDSIZE;
pub const __USE_TIME_BITS64 = @as(c_int, 1);
pub const __USE_MISC = @as(c_int, 1);
pub const __USE_ATFILE = @as(c_int, 1);
pub const __USE_FORTIFY_LEVEL = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_GETS = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_SCANF = @as(c_int, 0);
pub const __GLIBC_USE_C23_STRTOL = @as(c_int, 0);
pub const _STDC_PREDEF_H = @as(c_int, 1);
pub const __STDC_IEC_559__ = @as(c_int, 1);
pub const __STDC_IEC_60559_BFP__ = @as(c_long, 201404);
pub const __STDC_IEC_559_COMPLEX__ = @as(c_int, 1);
pub const __STDC_IEC_60559_COMPLEX__ = @as(c_long, 201404);
pub const __STDC_ISO_10646__ = @as(c_long, 201706);
pub const __GNU_LIBRARY__ = @as(c_int, 6);
pub const __GLIBC__ = @as(c_int, 2);
pub const __GLIBC_MINOR__ = @as(c_int, 40);
pub inline fn __GLIBC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub const _SYS_CDEFS_H = @as(c_int, 1);
pub const __glibc_has_attribute = @compileError("unable to translate macro: undefined identifier `__has_attribute`");
// /usr/include/sys/cdefs.h:45:10
pub inline fn __glibc_has_builtin(name: anytype) @TypeOf(__has_builtin(name)) {
    _ = &name;
    return __has_builtin(name);
}
pub const __glibc_has_extension = @compileError("unable to translate macro: undefined identifier `__has_extension`");
// /usr/include/sys/cdefs.h:55:10
pub const __LEAF = "";
pub const __LEAF_ATTR = "";
pub const __THROW = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/sys/cdefs.h:79:11
pub const __THROWNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/sys/cdefs.h:80:11
pub const __NTH = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/sys/cdefs.h:81:11
pub const __NTHNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/sys/cdefs.h:82:11
pub const __COLD = @compileError("unable to translate macro: undefined identifier `__cold__`");
// /usr/include/sys/cdefs.h:102:11
pub inline fn __P(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub inline fn __PMT(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token '##'");
// /usr/include/sys/cdefs.h:131:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token '#'");
// /usr/include/sys/cdefs.h:132:9
pub const __ptr_t = ?*anyopaque;
pub const __BEGIN_DECLS = "";
pub const __END_DECLS = "";
pub const __attribute_overloadable__ = @compileError("unable to translate macro: undefined identifier `__overloadable__`");
// /usr/include/sys/cdefs.h:151:10
pub inline fn __bos(ptr: anytype) @TypeOf(__builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1))) {
    _ = &ptr;
    return __builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1));
}
pub inline fn __bos0(ptr: anytype) @TypeOf(__builtin_object_size(ptr, @as(c_int, 0))) {
    _ = &ptr;
    return __builtin_object_size(ptr, @as(c_int, 0));
}
pub inline fn __glibc_objsize0(__o: anytype) @TypeOf(__bos0(__o)) {
    _ = &__o;
    return __bos0(__o);
}
pub inline fn __glibc_objsize(__o: anytype) @TypeOf(__bos(__o)) {
    _ = &__o;
    return __bos(__o);
}
pub const __warnattr = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:370:10
pub const __errordecl = @compileError("unable to translate C expr: unexpected token 'extern'");
// /usr/include/sys/cdefs.h:371:10
pub const __flexarr = @compileError("unable to translate C expr: unexpected token '['");
// /usr/include/sys/cdefs.h:379:10
pub const __glibc_c99_flexarr_available = @as(c_int, 1);
pub const __REDIRECT = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/sys/cdefs.h:410:10
pub const __REDIRECT_NTH = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/sys/cdefs.h:417:11
pub const __REDIRECT_NTHNL = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/sys/cdefs.h:419:11
pub const __ASMNAME = @compileError("unable to translate C expr: unexpected token ','");
// /usr/include/sys/cdefs.h:422:10
pub inline fn __ASMNAME2(prefix: anytype, cname: anytype) @TypeOf(__STRING(prefix) ++ cname) {
    _ = &prefix;
    _ = &cname;
    return __STRING(prefix) ++ cname;
}
pub const __REDIRECT_FORTIFY = __REDIRECT;
pub const __REDIRECT_FORTIFY_NTH = __REDIRECT_NTH;
pub const __attribute_malloc__ = @compileError("unable to translate macro: undefined identifier `__malloc__`");
// /usr/include/sys/cdefs.h:452:10
pub const __attribute_alloc_size__ = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:463:10
pub const __attribute_alloc_align__ = @compileError("unable to translate macro: undefined identifier `__alloc_align__`");
// /usr/include/sys/cdefs.h:469:10
pub const __attribute_pure__ = @compileError("unable to translate macro: undefined identifier `__pure__`");
// /usr/include/sys/cdefs.h:479:10
pub const __attribute_const__ = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// /usr/include/sys/cdefs.h:486:10
pub const __attribute_maybe_unused__ = @compileError("unable to translate macro: undefined identifier `__unused__`");
// /usr/include/sys/cdefs.h:492:10
pub const __attribute_used__ = @compileError("unable to translate macro: undefined identifier `__used__`");
// /usr/include/sys/cdefs.h:501:10
pub const __attribute_noinline__ = @compileError("unable to translate macro: undefined identifier `__noinline__`");
// /usr/include/sys/cdefs.h:502:10
pub const __attribute_deprecated__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /usr/include/sys/cdefs.h:510:10
pub const __attribute_deprecated_msg__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /usr/include/sys/cdefs.h:520:10
pub const __attribute_format_arg__ = @compileError("unable to translate macro: undefined identifier `__format_arg__`");
// /usr/include/sys/cdefs.h:533:10
pub const __attribute_format_strfmon__ = @compileError("unable to translate macro: undefined identifier `__format__`");
// /usr/include/sys/cdefs.h:543:10
pub const __attribute_nonnull__ = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /usr/include/sys/cdefs.h:555:11
pub inline fn __nonnull(params: anytype) @TypeOf(__attribute_nonnull__(params)) {
    _ = &params;
    return __attribute_nonnull__(params);
}
pub const __returns_nonnull = @compileError("unable to translate macro: undefined identifier `__returns_nonnull__`");
// /usr/include/sys/cdefs.h:568:10
pub const __attribute_warn_unused_result__ = @compileError("unable to translate macro: undefined identifier `__warn_unused_result__`");
// /usr/include/sys/cdefs.h:577:10
pub const __wur = "";
pub const __always_inline = @compileError("unable to translate macro: undefined identifier `__always_inline__`");
// /usr/include/sys/cdefs.h:595:10
pub const __attribute_artificial__ = @compileError("unable to translate macro: undefined identifier `__artificial__`");
// /usr/include/sys/cdefs.h:604:10
pub const __extern_inline = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`");
// /usr/include/sys/cdefs.h:622:11
pub const __extern_always_inline = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`");
// /usr/include/sys/cdefs.h:623:11
pub const __fortify_function = __extern_always_inline ++ __attribute_artificial__;
pub const __restrict_arr = @compileError("unable to translate C expr: unexpected token '__restrict'");
// /usr/include/sys/cdefs.h:666:10
pub inline fn __glibc_unlikely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 0))) {
    _ = &cond;
    return __builtin_expect(cond, @as(c_int, 0));
}
pub inline fn __glibc_likely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 1))) {
    _ = &cond;
    return __builtin_expect(cond, @as(c_int, 1));
}
pub const __attribute_nonstring__ = "";
pub const __attribute_copy__ = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:715:10
pub const __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = @as(c_int, 0);
pub inline fn __LDBL_REDIR1(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR(name: anytype, proto: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR1_NTH(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto ++ __THROW;
}
pub inline fn __LDBL_REDIR_NTH(name: anytype, proto: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    return name ++ proto ++ __THROW;
}
pub const __LDBL_REDIR2_DECL = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:792:10
pub const __LDBL_REDIR_DECL = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:793:10
pub inline fn __REDIRECT_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT(name, proto, alias);
}
pub inline fn __REDIRECT_NTH_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT_NTH(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT_NTH(name, proto, alias);
}
pub const __glibc_macro_warning1 = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /usr/include/sys/cdefs.h:807:10
pub const __glibc_macro_warning = @compileError("unable to translate macro: undefined identifier `GCC`");
// /usr/include/sys/cdefs.h:808:10
pub const __HAVE_GENERIC_SELECTION = @as(c_int, 1);
pub const __fortified_attr_access = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:853:11
pub const __attr_access = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:854:11
pub const __attr_access_none = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:855:11
pub const __attr_dealloc = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:865:10
pub const __attr_dealloc_free = "";
pub const __attribute_returns_twice__ = @compileError("unable to translate macro: undefined identifier `__returns_twice__`");
// /usr/include/sys/cdefs.h:872:10
pub const __attribute_struct_may_alias__ = @compileError("unable to translate macro: undefined identifier `__may_alias__`");
// /usr/include/sys/cdefs.h:881:10
pub const __stub___compat_bdflush = "";
pub const __stub_chflags = "";
pub const __stub_fchflags = "";
pub const __stub_gtty = "";
pub const __stub_revoke = "";
pub const __stub_setlogin = "";
pub const __stub_sigreturn = "";
pub const __stub_stty = "";
pub const _STDINT_H = @as(c_int, 1);
pub const __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION = "";
pub const __GLIBC_USE_LIB_EXT2 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT_C23 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT_C23 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_TYPES_EXT = @as(c_int, 0);
pub const _BITS_TYPES_H = @as(c_int, 1);
pub const __S16_TYPE = c_short;
pub const __U16_TYPE = c_ushort;
pub const __S32_TYPE = c_int;
pub const __U32_TYPE = c_uint;
pub const __SLONGWORD_TYPE = c_long;
pub const __ULONGWORD_TYPE = c_ulong;
pub const __SQUAD_TYPE = c_long;
pub const __UQUAD_TYPE = c_ulong;
pub const __SWORD_TYPE = c_long;
pub const __UWORD_TYPE = c_ulong;
pub const __SLONG32_TYPE = c_int;
pub const __ULONG32_TYPE = c_uint;
pub const __S64_TYPE = c_long;
pub const __U64_TYPE = c_ulong;
pub const __STD_TYPE = @compileError("unable to translate C expr: unexpected token 'typedef'");
// /usr/include/bits/types.h:137:10
pub const _BITS_TYPESIZES_H = @as(c_int, 1);
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __UID_T_TYPE = __U32_TYPE;
pub const __GID_T_TYPE = __U32_TYPE;
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const __PID_T_TYPE = __S32_TYPE;
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const __ID_T_TYPE = __U32_TYPE;
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __SUSECONDS64_T_TYPE = __SQUAD_TYPE;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __TIMER_T_TYPE = ?*anyopaque;
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __FSID_T_TYPE = @compileError("unable to translate macro: undefined identifier `__val`");
// /usr/include/bits/typesizes.h:73:9
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const __OFF_T_MATCHES_OFF64_T = @as(c_int, 1);
pub const __INO_T_MATCHES_INO64_T = @as(c_int, 1);
pub const __RLIM_T_MATCHES_RLIM64_T = @as(c_int, 1);
pub const __STATFS_MATCHES_STATFS64 = @as(c_int, 1);
pub const __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = @as(c_int, 1);
pub const __FD_SETSIZE = @as(c_int, 1024);
pub const _BITS_TIME64_H = @as(c_int, 1);
pub const __TIME64_T_TYPE = __TIME_T_TYPE;
pub const _BITS_WCHAR_H = @as(c_int, 1);
pub const __WCHAR_MAX = __WCHAR_MAX__;
pub const __WCHAR_MIN = -__WCHAR_MAX - @as(c_int, 1);
pub const _BITS_STDINT_INTN_H = @as(c_int, 1);
pub const _BITS_STDINT_UINTN_H = @as(c_int, 1);
pub const _BITS_STDINT_LEAST_H = @as(c_int, 1);
pub const __intptr_t_defined = "";
pub const __INT64_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const __UINT64_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INT8_MIN = -@as(c_int, 128);
pub const INT16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const INT32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT8_MAX = @as(c_int, 127);
pub const INT16_MAX = @as(c_int, 32767);
pub const INT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT8_MAX = @as(c_int, 255);
pub const UINT16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INT_LEAST8_MIN = -@as(c_int, 128);
pub const INT_LEAST16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const INT_LEAST32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT_LEAST64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT_LEAST8_MAX = @as(c_int, 127);
pub const INT_LEAST16_MAX = @as(c_int, 32767);
pub const INT_LEAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT_LEAST64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT_LEAST8_MAX = @as(c_int, 255);
pub const UINT_LEAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_LEAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_LEAST64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INT_FAST8_MIN = -@as(c_int, 128);
pub const INT_FAST16_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INT_FAST32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INT_FAST64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT_FAST8_MAX = @as(c_int, 127);
pub const INT_FAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INT_FAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INT_FAST64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT_FAST8_MAX = @as(c_int, 255);
pub const UINT_FAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INTPTR_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const UINTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const INTMAX_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INTMAX_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINTMAX_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const PTRDIFF_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const PTRDIFF_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const SIG_ATOMIC_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const SIG_ATOMIC_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const SIZE_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const WCHAR_MIN = __WCHAR_MIN;
pub const WCHAR_MAX = __WCHAR_MAX;
pub const WINT_MIN = @as(c_uint, 0);
pub const WINT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub inline fn INT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn INT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn INT32_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const INT64_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub inline fn UINT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn UINT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const UINT32_C = @import("std").zig.c_translation.Macros.U_SUFFIX;
pub const UINT64_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INTMAX_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const UINTMAX_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const ____gwchar_t_defined = @as(c_int, 1);
pub const __PRI64_PREFIX = "l";
pub const __PRIPTR_PREFIX = "l";
pub const PRId8 = "d";
pub const PRId16 = "d";
pub const PRId32 = "d";
pub const PRId64 = __PRI64_PREFIX ++ "d";
pub const PRIdLEAST8 = "d";
pub const PRIdLEAST16 = "d";
pub const PRIdLEAST32 = "d";
pub const PRIdLEAST64 = __PRI64_PREFIX ++ "d";
pub const PRIdFAST8 = "d";
pub const PRIdFAST16 = __PRIPTR_PREFIX ++ "d";
pub const PRIdFAST32 = __PRIPTR_PREFIX ++ "d";
pub const PRIdFAST64 = __PRI64_PREFIX ++ "d";
pub const PRIi8 = "i";
pub const PRIi16 = "i";
pub const PRIi32 = "i";
pub const PRIi64 = __PRI64_PREFIX ++ "i";
pub const PRIiLEAST8 = "i";
pub const PRIiLEAST16 = "i";
pub const PRIiLEAST32 = "i";
pub const PRIiLEAST64 = __PRI64_PREFIX ++ "i";
pub const PRIiFAST8 = "i";
pub const PRIiFAST16 = __PRIPTR_PREFIX ++ "i";
pub const PRIiFAST32 = __PRIPTR_PREFIX ++ "i";
pub const PRIiFAST64 = __PRI64_PREFIX ++ "i";
pub const PRIo8 = "o";
pub const PRIo16 = "o";
pub const PRIo32 = "o";
pub const PRIo64 = __PRI64_PREFIX ++ "o";
pub const PRIoLEAST8 = "o";
pub const PRIoLEAST16 = "o";
pub const PRIoLEAST32 = "o";
pub const PRIoLEAST64 = __PRI64_PREFIX ++ "o";
pub const PRIoFAST8 = "o";
pub const PRIoFAST16 = __PRIPTR_PREFIX ++ "o";
pub const PRIoFAST32 = __PRIPTR_PREFIX ++ "o";
pub const PRIoFAST64 = __PRI64_PREFIX ++ "o";
pub const PRIu8 = "u";
pub const PRIu16 = "u";
pub const PRIu32 = "u";
pub const PRIu64 = __PRI64_PREFIX ++ "u";
pub const PRIuLEAST8 = "u";
pub const PRIuLEAST16 = "u";
pub const PRIuLEAST32 = "u";
pub const PRIuLEAST64 = __PRI64_PREFIX ++ "u";
pub const PRIuFAST8 = "u";
pub const PRIuFAST16 = __PRIPTR_PREFIX ++ "u";
pub const PRIuFAST32 = __PRIPTR_PREFIX ++ "u";
pub const PRIuFAST64 = __PRI64_PREFIX ++ "u";
pub const PRIx8 = "x";
pub const PRIx16 = "x";
pub const PRIx32 = "x";
pub const PRIx64 = __PRI64_PREFIX ++ "x";
pub const PRIxLEAST8 = "x";
pub const PRIxLEAST16 = "x";
pub const PRIxLEAST32 = "x";
pub const PRIxLEAST64 = __PRI64_PREFIX ++ "x";
pub const PRIxFAST8 = "x";
pub const PRIxFAST16 = __PRIPTR_PREFIX ++ "x";
pub const PRIxFAST32 = __PRIPTR_PREFIX ++ "x";
pub const PRIxFAST64 = __PRI64_PREFIX ++ "x";
pub const PRIX8 = "X";
pub const PRIX16 = "X";
pub const PRIX32 = "X";
pub const PRIX64 = __PRI64_PREFIX ++ "X";
pub const PRIXLEAST8 = "X";
pub const PRIXLEAST16 = "X";
pub const PRIXLEAST32 = "X";
pub const PRIXLEAST64 = __PRI64_PREFIX ++ "X";
pub const PRIXFAST8 = "X";
pub const PRIXFAST16 = __PRIPTR_PREFIX ++ "X";
pub const PRIXFAST32 = __PRIPTR_PREFIX ++ "X";
pub const PRIXFAST64 = __PRI64_PREFIX ++ "X";
pub const PRIdMAX = __PRI64_PREFIX ++ "d";
pub const PRIiMAX = __PRI64_PREFIX ++ "i";
pub const PRIoMAX = __PRI64_PREFIX ++ "o";
pub const PRIuMAX = __PRI64_PREFIX ++ "u";
pub const PRIxMAX = __PRI64_PREFIX ++ "x";
pub const PRIXMAX = __PRI64_PREFIX ++ "X";
pub const PRIdPTR = __PRIPTR_PREFIX ++ "d";
pub const PRIiPTR = __PRIPTR_PREFIX ++ "i";
pub const PRIoPTR = __PRIPTR_PREFIX ++ "o";
pub const PRIuPTR = __PRIPTR_PREFIX ++ "u";
pub const PRIxPTR = __PRIPTR_PREFIX ++ "x";
pub const PRIXPTR = __PRIPTR_PREFIX ++ "X";
pub const SCNd8 = "hhd";
pub const SCNd16 = "hd";
pub const SCNd32 = "d";
pub const SCNd64 = __PRI64_PREFIX ++ "d";
pub const SCNdLEAST8 = "hhd";
pub const SCNdLEAST16 = "hd";
pub const SCNdLEAST32 = "d";
pub const SCNdLEAST64 = __PRI64_PREFIX ++ "d";
pub const SCNdFAST8 = "hhd";
pub const SCNdFAST16 = __PRIPTR_PREFIX ++ "d";
pub const SCNdFAST32 = __PRIPTR_PREFIX ++ "d";
pub const SCNdFAST64 = __PRI64_PREFIX ++ "d";
pub const SCNi8 = "hhi";
pub const SCNi16 = "hi";
pub const SCNi32 = "i";
pub const SCNi64 = __PRI64_PREFIX ++ "i";
pub const SCNiLEAST8 = "hhi";
pub const SCNiLEAST16 = "hi";
pub const SCNiLEAST32 = "i";
pub const SCNiLEAST64 = __PRI64_PREFIX ++ "i";
pub const SCNiFAST8 = "hhi";
pub const SCNiFAST16 = __PRIPTR_PREFIX ++ "i";
pub const SCNiFAST32 = __PRIPTR_PREFIX ++ "i";
pub const SCNiFAST64 = __PRI64_PREFIX ++ "i";
pub const SCNu8 = "hhu";
pub const SCNu16 = "hu";
pub const SCNu32 = "u";
pub const SCNu64 = __PRI64_PREFIX ++ "u";
pub const SCNuLEAST8 = "hhu";
pub const SCNuLEAST16 = "hu";
pub const SCNuLEAST32 = "u";
pub const SCNuLEAST64 = __PRI64_PREFIX ++ "u";
pub const SCNuFAST8 = "hhu";
pub const SCNuFAST16 = __PRIPTR_PREFIX ++ "u";
pub const SCNuFAST32 = __PRIPTR_PREFIX ++ "u";
pub const SCNuFAST64 = __PRI64_PREFIX ++ "u";
pub const SCNo8 = "hho";
pub const SCNo16 = "ho";
pub const SCNo32 = "o";
pub const SCNo64 = __PRI64_PREFIX ++ "o";
pub const SCNoLEAST8 = "hho";
pub const SCNoLEAST16 = "ho";
pub const SCNoLEAST32 = "o";
pub const SCNoLEAST64 = __PRI64_PREFIX ++ "o";
pub const SCNoFAST8 = "hho";
pub const SCNoFAST16 = __PRIPTR_PREFIX ++ "o";
pub const SCNoFAST32 = __PRIPTR_PREFIX ++ "o";
pub const SCNoFAST64 = __PRI64_PREFIX ++ "o";
pub const SCNx8 = "hhx";
pub const SCNx16 = "hx";
pub const SCNx32 = "x";
pub const SCNx64 = __PRI64_PREFIX ++ "x";
pub const SCNxLEAST8 = "hhx";
pub const SCNxLEAST16 = "hx";
pub const SCNxLEAST32 = "x";
pub const SCNxLEAST64 = __PRI64_PREFIX ++ "x";
pub const SCNxFAST8 = "hhx";
pub const SCNxFAST16 = __PRIPTR_PREFIX ++ "x";
pub const SCNxFAST32 = __PRIPTR_PREFIX ++ "x";
pub const SCNxFAST64 = __PRI64_PREFIX ++ "x";
pub const SCNdMAX = __PRI64_PREFIX ++ "d";
pub const SCNiMAX = __PRI64_PREFIX ++ "i";
pub const SCNoMAX = __PRI64_PREFIX ++ "o";
pub const SCNuMAX = __PRI64_PREFIX ++ "u";
pub const SCNxMAX = __PRI64_PREFIX ++ "x";
pub const SCNdPTR = __PRIPTR_PREFIX ++ "d";
pub const SCNiPTR = __PRIPTR_PREFIX ++ "i";
pub const SCNoPTR = __PRIPTR_PREFIX ++ "o";
pub const SCNuPTR = __PRIPTR_PREFIX ++ "u";
pub const SCNxPTR = __PRIPTR_PREFIX ++ "x";
pub const LZMA_API_IMPORT = "";
pub const LZMA_API_CALL = "";
pub inline fn LZMA_API(@"type": anytype) @TypeOf(@"type") {
    _ = &@"type";
    return @"type";
}
pub const lzma_nothrow = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/lzma.h:230:11
pub const lzma_attribute = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// /usr/include/lzma.h:248:11
pub const lzma_attr_pure = @compileError("unable to translate macro: undefined identifier `__pure__`");
// /usr/include/lzma.h:266:10
pub const lzma_attr_const = @compileError("unable to translate C expr: unexpected token '__const__'");
// /usr/include/lzma.h:270:10
pub const lzma_attr_warn_unused_result = @compileError("unable to translate macro: undefined identifier `__warn_unused_result__`");
// /usr/include/lzma.h:274:10
pub const LZMA_H_INTERNAL = @as(c_int, 1);
pub const LZMA_VERSION_MAJOR = @as(c_int, 5);
pub const LZMA_VERSION_MINOR = @as(c_int, 6);
pub const LZMA_VERSION_PATCH = @as(c_int, 3);
pub const LZMA_VERSION_STABILITY = LZMA_VERSION_STABILITY_STABLE;
pub const LZMA_VERSION_COMMIT = "";
pub const LZMA_VERSION_STABILITY_ALPHA = @as(c_int, 0);
pub const LZMA_VERSION_STABILITY_BETA = @as(c_int, 1);
pub const LZMA_VERSION_STABILITY_STABLE = @as(c_int, 2);
pub const LZMA_VERSION = (((LZMA_VERSION_MAJOR * UINT32_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 10000000, .decimal))) + (LZMA_VERSION_MINOR * UINT32_C(@as(c_int, 10000)))) + (LZMA_VERSION_PATCH * UINT32_C(@as(c_int, 10)))) + LZMA_VERSION_STABILITY;
pub const LZMA_VERSION_STABILITY_STRING = "";
pub const LZMA_VERSION_STRING_C_ = @compileError("unable to translate C expr: unexpected token '#'");
// /usr/include/lzma/version.h:86:9
pub inline fn LZMA_VERSION_STRING_C(major: anytype, minor: anytype, patch: anytype, stability: anytype, commit: anytype) @TypeOf(LZMA_VERSION_STRING_C_(major, minor, patch, stability, commit)) {
    _ = &major;
    _ = &minor;
    _ = &patch;
    _ = &stability;
    _ = &commit;
    return LZMA_VERSION_STRING_C_(major, minor, patch, stability, commit);
}
pub const LZMA_VERSION_STRING = LZMA_VERSION_STRING_C(LZMA_VERSION_MAJOR, LZMA_VERSION_MINOR, LZMA_VERSION_PATCH, LZMA_VERSION_STABILITY_STRING, LZMA_VERSION_COMMIT);
pub const LZMA_STREAM_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/lzma/base.h:608:9
pub const LZMA_VLI_MAX = @import("std").zig.c_translation.MacroArithmetic.div(UINT64_MAX, @as(c_int, 2));
pub const LZMA_VLI_UNKNOWN = UINT64_MAX;
pub const LZMA_VLI_BYTES_MAX = @as(c_int, 9);
pub inline fn LZMA_VLI_C(n: anytype) @TypeOf(UINT64_C(n)) {
    _ = &n;
    return UINT64_C(n);
}
pub inline fn lzma_vli_is_valid(vli: anytype) @TypeOf((vli <= LZMA_VLI_MAX) or (vli == LZMA_VLI_UNKNOWN)) {
    _ = &vli;
    return (vli <= LZMA_VLI_MAX) or (vli == LZMA_VLI_UNKNOWN);
}
pub const LZMA_CHECK_ID_MAX = @as(c_int, 15);
pub const LZMA_CHECK_SIZE_MAX = @as(c_int, 64);
pub const LZMA_FILTERS_MAX = @as(c_int, 4);
pub const LZMA_STR_ALL_FILTERS = UINT32_C(@as(c_int, 0x01));
pub const LZMA_STR_NO_VALIDATION = UINT32_C(@as(c_int, 0x02));
pub const LZMA_STR_ENCODER = UINT32_C(@as(c_int, 0x10));
pub const LZMA_STR_DECODER = UINT32_C(@as(c_int, 0x20));
pub const LZMA_STR_GETOPT_LONG = UINT32_C(@as(c_int, 0x40));
pub const LZMA_STR_NO_SPACES = UINT32_C(@as(c_int, 0x80));
pub const LZMA_FILTER_X86 = LZMA_VLI_C(@as(c_int, 0x04));
pub const LZMA_FILTER_POWERPC = LZMA_VLI_C(@as(c_int, 0x05));
pub const LZMA_FILTER_IA64 = LZMA_VLI_C(@as(c_int, 0x06));
pub const LZMA_FILTER_ARM = LZMA_VLI_C(@as(c_int, 0x07));
pub const LZMA_FILTER_ARMTHUMB = LZMA_VLI_C(@as(c_int, 0x08));
pub const LZMA_FILTER_SPARC = LZMA_VLI_C(@as(c_int, 0x09));
pub const LZMA_FILTER_ARM64 = LZMA_VLI_C(@as(c_int, 0x0A));
pub const LZMA_FILTER_RISCV = LZMA_VLI_C(@as(c_int, 0x0B));
pub const LZMA_FILTER_DELTA = LZMA_VLI_C(@as(c_int, 0x03));
pub const LZMA_DELTA_DIST_MIN = @as(c_int, 1);
pub const LZMA_DELTA_DIST_MAX = @as(c_int, 256);
pub const LZMA_FILTER_LZMA1 = LZMA_VLI_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x4000000000000001, .hex));
pub const LZMA_FILTER_LZMA1EXT = LZMA_VLI_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x4000000000000002, .hex));
pub const LZMA_FILTER_LZMA2 = LZMA_VLI_C(@as(c_int, 0x21));
pub const LZMA_DICT_SIZE_MIN = UINT32_C(@as(c_int, 4096));
pub const LZMA_DICT_SIZE_DEFAULT = UINT32_C(@as(c_int, 1)) << @as(c_int, 23);
pub const LZMA_LCLP_MIN = @as(c_int, 0);
pub const LZMA_LCLP_MAX = @as(c_int, 4);
pub const LZMA_LC_DEFAULT = @as(c_int, 3);
pub const LZMA_LP_DEFAULT = @as(c_int, 0);
pub const LZMA_PB_MIN = @as(c_int, 0);
pub const LZMA_PB_MAX = @as(c_int, 4);
pub const LZMA_PB_DEFAULT = @as(c_int, 2);
pub const LZMA_LZMA1EXT_ALLOW_EOPM = UINT32_C(@as(c_int, 0x01));
pub const lzma_set_ext_size = @compileError("unable to translate C expr: unexpected token 'do'");
// /usr/include/lzma/lzma12.h:534:9
pub const LZMA_PRESET_DEFAULT = UINT32_C(@as(c_int, 6));
pub const LZMA_PRESET_LEVEL_MASK = UINT32_C(@as(c_int, 0x1F));
pub const LZMA_PRESET_EXTREME = UINT32_C(@as(c_int, 1)) << @as(c_int, 31);
pub const LZMA_TELL_NO_CHECK = UINT32_C(@as(c_int, 0x01));
pub const LZMA_TELL_UNSUPPORTED_CHECK = UINT32_C(@as(c_int, 0x02));
pub const LZMA_TELL_ANY_CHECK = UINT32_C(@as(c_int, 0x04));
pub const LZMA_IGNORE_CHECK = UINT32_C(@as(c_int, 0x10));
pub const LZMA_CONCATENATED = UINT32_C(@as(c_int, 0x08));
pub const LZMA_FAIL_FAST = UINT32_C(@as(c_int, 0x20));
pub const LZMA_STREAM_HEADER_SIZE = @as(c_int, 12);
pub const LZMA_BACKWARD_SIZE_MIN = @as(c_int, 4);
pub const LZMA_BACKWARD_SIZE_MAX = LZMA_VLI_C(@as(c_int, 1)) << @as(c_int, 34);
pub const LZMA_BLOCK_HEADER_SIZE_MIN = @as(c_int, 8);
pub const LZMA_BLOCK_HEADER_SIZE_MAX = @as(c_int, 1024);
pub inline fn lzma_block_header_size_decode(b: anytype) @TypeOf((@import("std").zig.c_translation.cast(u32, b) + @as(c_int, 1)) * @as(c_int, 4)) {
    _ = &b;
    return (@import("std").zig.c_translation.cast(u32, b) + @as(c_int, 1)) * @as(c_int, 4);
}
pub const LZMA_INDEX_CHECK_MASK_NONE = UINT32_C(@as(c_int, 1)) << LZMA_CHECK_NONE;
pub const LZMA_INDEX_CHECK_MASK_CRC32 = UINT32_C(@as(c_int, 1)) << LZMA_CHECK_CRC32;
pub const LZMA_INDEX_CHECK_MASK_CRC64 = UINT32_C(@as(c_int, 1)) << LZMA_CHECK_CRC64;
pub const LZMA_INDEX_CHECK_MASK_SHA256 = UINT32_C(@as(c_int, 1)) << LZMA_CHECK_SHA256;
pub const lzma_internal_s = struct_lzma_internal_s;
pub const lzma_index_s = struct_lzma_index_s;
pub const lzma_index_hash_s = struct_lzma_index_hash_s;
