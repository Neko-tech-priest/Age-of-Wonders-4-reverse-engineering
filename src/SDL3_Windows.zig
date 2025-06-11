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
pub const __builtin_va_list = [*c]u8;
pub const __gnuc_va_list = __builtin_va_list;
pub const va_list = __builtin_va_list;
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:604:3: warning: TODO implement translation of stmt class GCCAsmStmtClass

// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:599:36: warning: unable to translate function, demoted to extern
pub extern fn __debugbreak() void;
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:626:3: warning: TODO implement translation of stmt class GCCAsmStmtClass

// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:620:60: warning: unable to translate function, demoted to extern
pub extern fn __fastfail(arg_code: c_uint) noreturn;
pub extern fn __mingw_get_crt_info() [*c]const u8;
pub const rsize_t = usize;
pub const ptrdiff_t = c_longlong;
pub const wchar_t = c_ushort;
pub const wint_t = c_ushort;
pub const wctype_t = c_ushort;
pub const errno_t = c_int;
pub const __time32_t = c_long;
pub const __time64_t = c_longlong;
pub const time_t = __time64_t;
pub const struct_threadlocaleinfostruct = extern struct {
    _locale_pctype: [*c]const c_ushort = @import("std").mem.zeroes([*c]const c_ushort),
    _locale_mb_cur_max: c_int = @import("std").mem.zeroes(c_int),
    _locale_lc_codepage: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const struct_threadmbcinfostruct = opaque {};
pub const pthreadlocinfo = [*c]struct_threadlocaleinfostruct;
pub const pthreadmbcinfo = ?*struct_threadmbcinfostruct;
pub const struct___lc_time_data = opaque {};
pub const struct_localeinfo_struct = extern struct {
    locinfo: pthreadlocinfo = @import("std").mem.zeroes(pthreadlocinfo),
    mbcinfo: pthreadmbcinfo = @import("std").mem.zeroes(pthreadmbcinfo),
};
pub const _locale_tstruct = struct_localeinfo_struct;
pub const _locale_t = [*c]struct_localeinfo_struct;
pub const struct_tagLC_ID = extern struct {
    wLanguage: c_ushort = @import("std").mem.zeroes(c_ushort),
    wCountry: c_ushort = @import("std").mem.zeroes(c_ushort),
    wCodePage: c_ushort = @import("std").mem.zeroes(c_ushort),
};
pub const LC_ID = struct_tagLC_ID;
pub const LPLC_ID = [*c]struct_tagLC_ID;
pub const threadlocinfo = struct_threadlocaleinfostruct;
pub const int_least8_t = i8;
pub const uint_least8_t = u8;
pub const int_least16_t = c_short;
pub const uint_least16_t = c_ushort;
pub const int_least32_t = c_int;
pub const uint_least32_t = c_uint;
pub const int_least64_t = c_longlong;
pub const uint_least64_t = c_ulonglong;
pub const int_fast8_t = i8;
pub const uint_fast8_t = u8;
pub const int_fast16_t = c_short;
pub const uint_fast16_t = c_ushort;
pub const int_fast32_t = c_int;
pub const uint_fast32_t = c_uint;
pub const int_fast64_t = c_longlong;
pub const uint_fast64_t = c_ulonglong;
pub const intmax_t = c_longlong;
pub const uintmax_t = c_ulonglong;
pub extern fn _memccpy(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Val: c_int, _MaxCount: usize) ?*anyopaque;
pub extern fn memchr(_Buf: ?*const anyopaque, _Val: c_int, _MaxCount: c_ulonglong) ?*anyopaque;
pub extern fn _memicmp(_Buf1: ?*const anyopaque, _Buf2: ?*const anyopaque, _Size: usize) c_int;
pub extern fn _memicmp_l(_Buf1: ?*const anyopaque, _Buf2: ?*const anyopaque, _Size: usize, _Locale: _locale_t) c_int;
pub extern fn memcmp(_Buf1: ?*const anyopaque, _Buf2: ?*const anyopaque, _Size: c_ulonglong) c_int;
pub extern fn memcpy(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Size: c_ulonglong) ?*anyopaque;
pub extern fn memcpy_s(_dest: ?*anyopaque, _numberOfElements: usize, _src: ?*const anyopaque, _count: usize) errno_t;
pub extern fn mempcpy(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Size: c_ulonglong) ?*anyopaque;
pub extern fn memset(_Dst: ?*anyopaque, _Val: c_int, _Size: c_ulonglong) ?*anyopaque;
pub extern fn memccpy(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Val: c_int, _Size: c_ulonglong) ?*anyopaque;
pub extern fn memicmp(_Buf1: ?*const anyopaque, _Buf2: ?*const anyopaque, _Size: usize) c_int;
pub extern fn _strset(_Str: [*c]u8, _Val: c_int) [*c]u8;
pub extern fn _strset_l(_Str: [*c]u8, _Val: c_int, _Locale: _locale_t) [*c]u8;
pub extern fn strcpy(_Dest: [*c]u8, _Source: [*c]const u8) [*c]u8;
pub extern fn strcat(_Dest: [*c]u8, _Source: [*c]const u8) [*c]u8;
pub extern fn strcmp(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn strlen(_Str: [*c]const u8) c_ulonglong;
pub extern fn strnlen(_Str: [*c]const u8, _MaxCount: usize) usize;
pub extern fn memmove(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Size: c_ulonglong) ?*anyopaque;
pub extern fn _strdup(_Src: [*c]const u8) [*c]u8;
pub extern fn strchr(_Str: [*c]const u8, _Val: c_int) [*c]u8;
pub extern fn _stricmp(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn _strcmpi(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn _stricmp_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _Locale: _locale_t) c_int;
pub extern fn strcoll(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn _strcoll_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _Locale: _locale_t) c_int;
pub extern fn _stricoll(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn _stricoll_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _Locale: _locale_t) c_int;
pub extern fn _strncoll(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _strncoll_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn _strnicoll(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _strnicoll_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn strcspn(_Str: [*c]const u8, _Control: [*c]const u8) c_ulonglong;
pub extern fn _strerror(_ErrMsg: [*c]const u8) [*c]u8;
pub extern fn strerror(c_int) [*c]u8;
pub extern fn _strlwr(_String: [*c]u8) [*c]u8;
pub extern fn strlwr_l(_String: [*c]u8, _Locale: _locale_t) [*c]u8;
pub extern fn strncat(_Dest: [*c]u8, _Source: [*c]const u8, _Count: c_ulonglong) [*c]u8;
pub extern fn strncmp(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: c_ulonglong) c_int;
pub extern fn _strnicmp(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _strnicmp_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn strncpy(_Dest: [*c]u8, _Source: [*c]const u8, _Count: c_ulonglong) [*c]u8;
pub extern fn _strnset(_Str: [*c]u8, _Val: c_int, _MaxCount: usize) [*c]u8;
pub extern fn _strnset_l(str: [*c]u8, c: c_int, count: usize, _Locale: _locale_t) [*c]u8;
pub extern fn strpbrk(_Str: [*c]const u8, _Control: [*c]const u8) [*c]u8;
pub extern fn strrchr(_Str: [*c]const u8, _Ch: c_int) [*c]u8;
pub extern fn _strrev(_Str: [*c]u8) [*c]u8;
pub extern fn strspn(_Str: [*c]const u8, _Control: [*c]const u8) c_ulonglong;
pub extern fn strstr(_Str: [*c]const u8, _SubStr: [*c]const u8) [*c]u8;
pub extern fn strtok(_Str: [*c]u8, _Delim: [*c]const u8) [*c]u8;
pub extern fn strtok_r(noalias _Str: [*c]u8, noalias _Delim: [*c]const u8, noalias __last: [*c][*c]u8) [*c]u8;
pub extern fn _strupr(_String: [*c]u8) [*c]u8;
pub extern fn _strupr_l(_String: [*c]u8, _Locale: _locale_t) [*c]u8;
pub extern fn strxfrm(_Dst: [*c]u8, _Src: [*c]const u8, _MaxCount: c_ulonglong) c_ulonglong;
pub extern fn _strxfrm_l(noalias _Dst: [*c]u8, noalias _Src: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn strdup(_Src: [*c]const u8) [*c]u8;
pub extern fn strcmpi(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn stricmp(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn strlwr(_Str: [*c]u8) [*c]u8;
pub extern fn strnicmp(_Str1: [*c]const u8, _Str: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn strncasecmp([*c]const u8, [*c]const u8, c_ulonglong) c_int;
pub extern fn strcasecmp([*c]const u8, [*c]const u8) c_int;
pub extern fn strnset(_Str: [*c]u8, _Val: c_int, _MaxCount: usize) [*c]u8;
pub extern fn strrev(_Str: [*c]u8) [*c]u8;
pub extern fn strset(_Str: [*c]u8, _Val: c_int) [*c]u8;
pub extern fn strupr(_Str: [*c]u8) [*c]u8;
pub extern fn _wcsdup(_Str: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcscat(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcschr(_Str: [*c]const c_ushort, _Ch: c_ushort) [*c]c_ushort;
pub extern fn wcscmp(_Str1: [*c]const c_ushort, _Str2: [*c]const c_ushort) c_int;
pub extern fn wcscpy(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcscspn(_Str: [*c]const wchar_t, _Control: [*c]const wchar_t) usize;
pub extern fn wcslen(_Str: [*c]const c_ushort) c_ulonglong;
pub extern fn wcsnlen(_Src: [*c]const wchar_t, _MaxCount: usize) usize;
pub extern fn wcsncat(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t, _Count: usize) [*c]wchar_t;
pub extern fn wcsncmp(_Str1: [*c]const c_ushort, _Str2: [*c]const c_ushort, _MaxCount: c_ulonglong) c_int;
pub extern fn wcsncpy(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t, _Count: usize) [*c]wchar_t;
pub extern fn _wcsncpy_l(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t, _Count: usize, _Locale: _locale_t) [*c]wchar_t;
pub extern fn wcspbrk(_Str: [*c]const wchar_t, _Control: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcsrchr(_Str: [*c]const wchar_t, _Ch: wchar_t) [*c]wchar_t;
pub extern fn wcsspn(_Str: [*c]const wchar_t, _Control: [*c]const wchar_t) usize;
pub extern fn wcsstr(_Str: [*c]const wchar_t, _SubStr: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcstok(noalias _Str: [*c]wchar_t, noalias _Delim: [*c]const wchar_t, noalias _Ptr: [*c][*c]wchar_t) [*c]wchar_t;
pub extern fn _wcstok(noalias _Str: [*c]wchar_t, noalias _Delim: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wcserror(_ErrNum: c_int) [*c]wchar_t;
pub extern fn __wcserror(_Str: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wcsicmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn _wcsicmp_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _Locale: _locale_t) c_int;
pub extern fn _wcsnicmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn _wcsnicmp_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn _wcsnset(_Str: [*c]wchar_t, _Val: wchar_t, _MaxCount: usize) [*c]wchar_t;
pub extern fn _wcsrev(_Str: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wcsset(_Str: [*c]wchar_t, _Val: wchar_t) [*c]wchar_t;
pub extern fn _wcslwr(_String: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wcslwr_l(_String: [*c]wchar_t, _Locale: _locale_t) [*c]wchar_t;
pub extern fn _wcsupr(_String: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wcsupr_l(_String: [*c]wchar_t, _Locale: _locale_t) [*c]wchar_t;
pub extern fn wcsxfrm(noalias _Dst: [*c]wchar_t, noalias _Src: [*c]const wchar_t, _MaxCount: usize) usize;
pub extern fn _wcsxfrm_l(noalias _Dst: [*c]wchar_t, noalias _Src: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn wcscoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn _wcscoll_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _Locale: _locale_t) c_int;
pub extern fn _wcsicoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn _wcsicoll_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _Locale: _locale_t) c_int;
pub extern fn _wcsncoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn _wcsncoll_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn _wcsnicoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn _wcsnicoll_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn wcsdup(_Str: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcsicmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn wcsnicmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn wcsnset(_Str: [*c]wchar_t, _Val: wchar_t, _MaxCount: usize) [*c]wchar_t;
pub extern fn wcsrev(_Str: [*c]wchar_t) [*c]wchar_t;
pub extern fn wcsset(_Str: [*c]wchar_t, _Val: wchar_t) [*c]wchar_t;
pub extern fn wcslwr(_Str: [*c]wchar_t) [*c]wchar_t;
pub extern fn wcsupr(_Str: [*c]wchar_t) [*c]wchar_t;
pub extern fn wcsicoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn _strset_s(_Dst: [*c]u8, _DstSize: usize, _Value: c_int) errno_t;
pub extern fn _strerror_s(_Buf: [*c]u8, _SizeInBytes: usize, _ErrMsg: [*c]const u8) errno_t;
pub extern fn strerror_s(_Buf: [*c]u8, _SizeInBytes: usize, _ErrNum: c_int) errno_t;
pub extern fn _strlwr_s(_Str: [*c]u8, _Size: usize) errno_t;
pub extern fn _strlwr_s_l(_Str: [*c]u8, _Size: usize, _Locale: _locale_t) errno_t;
pub extern fn _strnset_s(_Str: [*c]u8, _Size: usize, _Val: c_int, _MaxCount: usize) errno_t;
pub extern fn _strupr_s(_Str: [*c]u8, _Size: usize) errno_t;
pub extern fn _strupr_s_l(_Str: [*c]u8, _Size: usize, _Locale: _locale_t) errno_t;
pub extern fn strncat_s(_Dst: [*c]u8, _DstSizeInChars: usize, _Src: [*c]const u8, _MaxCount: usize) errno_t;
pub extern fn _strncat_s_l(_Dst: [*c]u8, _DstSizeInChars: usize, _Src: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn strcpy_s(_Dst: [*c]u8, _SizeInBytes: rsize_t, _Src: [*c]const u8) errno_t;
pub extern fn strncpy_s(_Dst: [*c]u8, _DstSizeInChars: usize, _Src: [*c]const u8, _MaxCount: usize) errno_t;
pub extern fn _strncpy_s_l(_Dst: [*c]u8, _DstSizeInChars: usize, _Src: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn strtok_s(_Str: [*c]u8, _Delim: [*c]const u8, _Context: [*c][*c]u8) [*c]u8;
pub extern fn _strtok_s_l(_Str: [*c]u8, _Delim: [*c]const u8, _Context: [*c][*c]u8, _Locale: _locale_t) [*c]u8;
pub extern fn strcat_s(_Dst: [*c]u8, _SizeInBytes: rsize_t, _Src: [*c]const u8) errno_t;
pub inline fn strnlen_s(arg__src: [*c]const u8, arg__count: usize) usize {
    var _src = arg__src;
    _ = &_src;
    var _count = arg__count;
    _ = &_count;
    return if (_src != null) strnlen(_src, _count) else @as(usize, @bitCast(@as(c_longlong, @as(c_int, 0))));
}
pub extern fn memmove_s(_dest: ?*anyopaque, _numberOfElements: usize, _src: ?*const anyopaque, _count: usize) errno_t;
pub extern fn wcstok_s(_Str: [*c]wchar_t, _Delim: [*c]const wchar_t, _Context: [*c][*c]wchar_t) [*c]wchar_t;
pub extern fn _wcserror_s(_Buf: [*c]wchar_t, _SizeInWords: usize, _ErrNum: c_int) errno_t;
pub extern fn __wcserror_s(_Buffer: [*c]wchar_t, _SizeInWords: usize, _ErrMsg: [*c]const wchar_t) errno_t;
pub extern fn _wcsnset_s(_Dst: [*c]wchar_t, _DstSizeInWords: usize, _Val: wchar_t, _MaxCount: usize) errno_t;
pub extern fn _wcsset_s(_Str: [*c]wchar_t, _SizeInWords: usize, _Val: wchar_t) errno_t;
pub extern fn _wcslwr_s(_Str: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _wcslwr_s_l(_Str: [*c]wchar_t, _SizeInWords: usize, _Locale: _locale_t) errno_t;
pub extern fn _wcsupr_s(_Str: [*c]wchar_t, _Size: usize) errno_t;
pub extern fn _wcsupr_s_l(_Str: [*c]wchar_t, _Size: usize, _Locale: _locale_t) errno_t;
pub extern fn wcscpy_s(_Dst: [*c]wchar_t, _SizeInWords: rsize_t, _Src: [*c]const wchar_t) errno_t;
pub extern fn wcscat_s(_Dst: [*c]wchar_t, _SizeInWords: rsize_t, _Src: [*c]const wchar_t) errno_t;
pub extern fn wcsncat_s(_Dst: [*c]wchar_t, _DstSizeInChars: usize, _Src: [*c]const wchar_t, _MaxCount: usize) errno_t;
pub extern fn _wcsncat_s_l(_Dst: [*c]wchar_t, _DstSizeInChars: usize, _Src: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn wcsncpy_s(_Dst: [*c]wchar_t, _DstSizeInChars: usize, _Src: [*c]const wchar_t, _MaxCount: usize) errno_t;
pub extern fn _wcsncpy_s_l(_Dst: [*c]wchar_t, _DstSizeInChars: usize, _Src: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn _wcstok_s_l(_Str: [*c]wchar_t, _Delim: [*c]const wchar_t, _Context: [*c][*c]wchar_t, _Locale: _locale_t) [*c]wchar_t;
pub extern fn _wcsset_s_l(_Str: [*c]wchar_t, _SizeInChars: usize, _Val: wchar_t, _Locale: _locale_t) errno_t;
pub extern fn _wcsnset_s_l(_Str: [*c]wchar_t, _SizeInChars: usize, _Val: wchar_t, _Count: usize, _Locale: _locale_t) errno_t;
pub inline fn wcsnlen_s(arg__src: [*c]const wchar_t, arg__count: usize) usize {
    var _src = arg__src;
    _ = &_src;
    var _count = arg__count;
    _ = &_count;
    return if (_src != null) wcsnlen(_src, _count) else @as(usize, @bitCast(@as(c_longlong, @as(c_int, 0))));
}
pub extern fn _wdupenv_s(_Buffer: [*c][*c]wchar_t, _BufferSizeInWords: [*c]usize, _VarName: [*c]const wchar_t) errno_t;
pub extern fn _itow_s(_Val: c_int, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _ltow_s(_Val: c_long, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _ultow_s(_Val: c_ulong, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _wgetenv_s(_ReturnSize: [*c]usize, _DstBuf: [*c]wchar_t, _DstSizeInWords: usize, _VarName: [*c]const wchar_t) errno_t;
pub extern fn _i64tow_s(_Val: c_longlong, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _ui64tow_s(_Val: c_ulonglong, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _wmakepath_s(_PathResult: [*c]wchar_t, _SizeInWords: usize, _Drive: [*c]const wchar_t, _Dir: [*c]const wchar_t, _Filename: [*c]const wchar_t, _Ext: [*c]const wchar_t) errno_t;
pub extern fn _wputenv_s(_Name: [*c]const wchar_t, _Value: [*c]const wchar_t) errno_t;
pub extern fn _wsearchenv_s(_Filename: [*c]const wchar_t, _EnvVar: [*c]const wchar_t, _ResultPath: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _wsplitpath_s(_FullPath: [*c]const wchar_t, _Drive: [*c]wchar_t, _DriveSizeInWords: usize, _Dir: [*c]wchar_t, _DirSizeInWords: usize, _Filename: [*c]wchar_t, _FilenameSizeInWords: usize, _Ext: [*c]wchar_t, _ExtSizeInWords: usize) errno_t;
pub const struct__iobuf = extern struct {
    _ptr: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _cnt: c_int = @import("std").mem.zeroes(c_int),
    _base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _flag: c_int = @import("std").mem.zeroes(c_int),
    _file: c_int = @import("std").mem.zeroes(c_int),
    _charbuf: c_int = @import("std").mem.zeroes(c_int),
    _bufsiz: c_int = @import("std").mem.zeroes(c_int),
    _tmpfname: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub const FILE = struct__iobuf;
pub extern fn __acrt_iob_func(index: c_uint) [*c]FILE;
pub extern fn __iob_func() [*c]FILE;
pub const _fsize_t = c_ulong;
pub const struct__wfinddata32_t = extern struct {
    attrib: c_uint = @import("std").mem.zeroes(c_uint),
    time_create: __time32_t = @import("std").mem.zeroes(__time32_t),
    time_access: __time32_t = @import("std").mem.zeroes(__time32_t),
    time_write: __time32_t = @import("std").mem.zeroes(__time32_t),
    size: _fsize_t = @import("std").mem.zeroes(_fsize_t),
    name: [260]wchar_t = @import("std").mem.zeroes([260]wchar_t),
};
pub const struct__wfinddata32i64_t = extern struct {
    attrib: c_uint = @import("std").mem.zeroes(c_uint),
    time_create: __time32_t = @import("std").mem.zeroes(__time32_t),
    time_access: __time32_t = @import("std").mem.zeroes(__time32_t),
    time_write: __time32_t = @import("std").mem.zeroes(__time32_t),
    size: c_longlong = @import("std").mem.zeroes(c_longlong),
    name: [260]wchar_t = @import("std").mem.zeroes([260]wchar_t),
};
pub const struct__wfinddata64i32_t = extern struct {
    attrib: c_uint = @import("std").mem.zeroes(c_uint),
    time_create: __time64_t = @import("std").mem.zeroes(__time64_t),
    time_access: __time64_t = @import("std").mem.zeroes(__time64_t),
    time_write: __time64_t = @import("std").mem.zeroes(__time64_t),
    size: _fsize_t = @import("std").mem.zeroes(_fsize_t),
    name: [260]wchar_t = @import("std").mem.zeroes([260]wchar_t),
};
pub const struct__wfinddata64_t = extern struct {
    attrib: c_uint = @import("std").mem.zeroes(c_uint),
    time_create: __time64_t = @import("std").mem.zeroes(__time64_t),
    time_access: __time64_t = @import("std").mem.zeroes(__time64_t),
    time_write: __time64_t = @import("std").mem.zeroes(__time64_t),
    size: c_longlong = @import("std").mem.zeroes(c_longlong),
    name: [260]wchar_t = @import("std").mem.zeroes([260]wchar_t),
};
pub extern fn __pctype_func() [*c]const c_ushort;
pub extern var __imp__wctype: [*c][*c]const c_ushort;
pub extern fn __pwctype_func() [*c]const wctype_t;
pub extern fn iswalpha(_C: wint_t) c_int;
pub extern fn iswupper(_C: wint_t) c_int;
pub extern fn iswlower(_C: wint_t) c_int;
pub extern fn iswdigit(_C: wint_t) c_int;
pub extern fn iswxdigit(_C: wint_t) c_int;
pub extern fn iswspace(_C: wint_t) c_int;
pub extern fn iswpunct(_C: wint_t) c_int;
pub extern fn iswalnum(_C: wint_t) c_int;
pub extern fn iswprint(_C: wint_t) c_int;
pub extern fn iswgraph(_C: wint_t) c_int;
pub extern fn iswcntrl(_C: wint_t) c_int;
pub extern fn iswascii(_C: wint_t) c_int;
pub extern fn isleadbyte(_C: c_int) c_int;
pub extern fn towupper(_C: wint_t) wint_t;
pub extern fn towlower(_C: wint_t) wint_t;
pub extern fn iswctype(_C: wint_t, _Type: wctype_t) c_int;
pub extern fn _iswalpha_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswupper_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswlower_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswdigit_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswxdigit_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswspace_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswpunct_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswalnum_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswprint_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswgraph_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswcntrl_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _isleadbyte_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _towupper_l(_C: wint_t, _Locale: _locale_t) wint_t;
pub extern fn _towlower_l(_C: wint_t, _Locale: _locale_t) wint_t;
pub extern fn _iswctype_l(_C: wint_t, _Type: wctype_t, _Locale: _locale_t) c_int;
pub extern fn __iswcsymf(_C: wint_t) c_int;
pub extern fn __iswcsym(_C: wint_t) c_int;
pub extern fn _iswcsymf_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswcsym_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn is_wctype(_C: wint_t, _Type: wctype_t) c_int;
pub extern fn iswblank(_C: wint_t) c_int;
pub extern fn _wgetcwd(_DstBuf: [*c]wchar_t, _SizeInWords: c_int) [*c]wchar_t;
pub extern fn _wgetdcwd(_Drive: c_int, _DstBuf: [*c]wchar_t, _SizeInWords: c_int) [*c]wchar_t;
pub extern fn _wgetdcwd_nolock(_Drive: c_int, _DstBuf: [*c]wchar_t, _SizeInWords: c_int) [*c]wchar_t;
pub extern fn _wchdir(_Path: [*c]const wchar_t) c_int;
pub extern fn _wmkdir(_Path: [*c]const wchar_t) c_int;
pub extern fn _wrmdir(_Path: [*c]const wchar_t) c_int;
pub extern fn _waccess(_Filename: [*c]const wchar_t, _AccessMode: c_int) c_int;
pub extern fn _wchmod(_Filename: [*c]const wchar_t, _Mode: c_int) c_int;
pub extern fn _wcreat(_Filename: [*c]const wchar_t, _PermissionMode: c_int) c_int;
pub extern fn _wfindfirst32(_Filename: [*c]const wchar_t, _FindData: [*c]struct__wfinddata32_t) isize;
pub extern fn _wfindnext32(_FindHandle: isize, _FindData: [*c]struct__wfinddata32_t) c_int;
pub extern fn _wunlink(_Filename: [*c]const wchar_t) c_int;
pub extern fn _wrename(_OldFilename: [*c]const wchar_t, _NewFilename: [*c]const wchar_t) c_int;
pub extern fn _wmktemp(_TemplateName: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wfindfirst32i64(_Filename: [*c]const wchar_t, _FindData: [*c]struct__wfinddata32i64_t) isize;
pub extern fn _wfindfirst64i32(_Filename: [*c]const wchar_t, _FindData: [*c]struct__wfinddata64i32_t) isize;
pub extern fn _wfindfirst64(_Filename: [*c]const wchar_t, _FindData: [*c]struct__wfinddata64_t) isize;
pub extern fn _wfindnext32i64(_FindHandle: isize, _FindData: [*c]struct__wfinddata32i64_t) c_int;
pub extern fn _wfindnext64i32(_FindHandle: isize, _FindData: [*c]struct__wfinddata64i32_t) c_int;
pub extern fn _wfindnext64(_FindHandle: isize, _FindData: [*c]struct__wfinddata64_t) c_int;
pub extern fn _wsopen_s(_FileHandle: [*c]c_int, _Filename: [*c]const wchar_t, _OpenFlag: c_int, _ShareFlag: c_int, _PermissionFlag: c_int) errno_t;
pub extern fn _wopen(_Filename: [*c]const wchar_t, _OpenFlag: c_int, ...) c_int;
pub extern fn _wsopen(_Filename: [*c]const wchar_t, _OpenFlag: c_int, _ShareFlag: c_int, ...) c_int;
pub extern fn _wsetlocale(_Category: c_int, _Locale: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wexecl(_Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wexecle(_Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wexeclp(_Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wexeclpe(_Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wexecv(_Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t) isize;
pub extern fn _wexecve(_Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t, _Env: [*c]const [*c]const wchar_t) isize;
pub extern fn _wexecvp(_Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t) isize;
pub extern fn _wexecvpe(_Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t, _Env: [*c]const [*c]const wchar_t) isize;
pub extern fn _wspawnl(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wspawnle(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wspawnlp(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wspawnlpe(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wspawnv(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t) isize;
pub extern fn _wspawnve(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t, _Env: [*c]const [*c]const wchar_t) isize;
pub extern fn _wspawnvp(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t) isize;
pub extern fn _wspawnvpe(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t, _Env: [*c]const [*c]const wchar_t) isize;
pub extern fn _wsystem(_Command: [*c]const wchar_t) c_int;
pub const _ino_t = c_ushort;
pub const ino_t = c_ushort;
pub const _dev_t = c_uint;
pub const dev_t = c_uint;
pub const _off_t = c_long;
pub const off32_t = c_long;
pub const _off64_t = c_longlong;
pub const off64_t = c_longlong;
pub const off_t = off32_t;
pub const struct__stat32 = extern struct {
    st_dev: _dev_t = @import("std").mem.zeroes(_dev_t),
    st_ino: _ino_t = @import("std").mem.zeroes(_ino_t),
    st_mode: c_ushort = @import("std").mem.zeroes(c_ushort),
    st_nlink: c_short = @import("std").mem.zeroes(c_short),
    st_uid: c_short = @import("std").mem.zeroes(c_short),
    st_gid: c_short = @import("std").mem.zeroes(c_short),
    st_rdev: _dev_t = @import("std").mem.zeroes(_dev_t),
    st_size: _off_t = @import("std").mem.zeroes(_off_t),
    st_atime: __time32_t = @import("std").mem.zeroes(__time32_t),
    st_mtime: __time32_t = @import("std").mem.zeroes(__time32_t),
    st_ctime: __time32_t = @import("std").mem.zeroes(__time32_t),
};
pub const struct_stat = extern struct {
    st_dev: _dev_t = @import("std").mem.zeroes(_dev_t),
    st_ino: _ino_t = @import("std").mem.zeroes(_ino_t),
    st_mode: c_ushort = @import("std").mem.zeroes(c_ushort),
    st_nlink: c_short = @import("std").mem.zeroes(c_short),
    st_uid: c_short = @import("std").mem.zeroes(c_short),
    st_gid: c_short = @import("std").mem.zeroes(c_short),
    st_rdev: _dev_t = @import("std").mem.zeroes(_dev_t),
    st_size: _off_t = @import("std").mem.zeroes(_off_t),
    st_atime: time_t = @import("std").mem.zeroes(time_t),
    st_mtime: time_t = @import("std").mem.zeroes(time_t),
    st_ctime: time_t = @import("std").mem.zeroes(time_t),
};
pub const struct__stat32i64 = extern struct {
    st_dev: _dev_t = @import("std").mem.zeroes(_dev_t),
    st_ino: _ino_t = @import("std").mem.zeroes(_ino_t),
    st_mode: c_ushort = @import("std").mem.zeroes(c_ushort),
    st_nlink: c_short = @import("std").mem.zeroes(c_short),
    st_uid: c_short = @import("std").mem.zeroes(c_short),
    st_gid: c_short = @import("std").mem.zeroes(c_short),
    st_rdev: _dev_t = @import("std").mem.zeroes(_dev_t),
    st_size: c_longlong = @import("std").mem.zeroes(c_longlong),
    st_atime: __time32_t = @import("std").mem.zeroes(__time32_t),
    st_mtime: __time32_t = @import("std").mem.zeroes(__time32_t),
    st_ctime: __time32_t = @import("std").mem.zeroes(__time32_t),
};
pub const struct__stat64i32 = extern struct {
    st_dev: _dev_t = @import("std").mem.zeroes(_dev_t),
    st_ino: _ino_t = @import("std").mem.zeroes(_ino_t),
    st_mode: c_ushort = @import("std").mem.zeroes(c_ushort),
    st_nlink: c_short = @import("std").mem.zeroes(c_short),
    st_uid: c_short = @import("std").mem.zeroes(c_short),
    st_gid: c_short = @import("std").mem.zeroes(c_short),
    st_rdev: _dev_t = @import("std").mem.zeroes(_dev_t),
    st_size: _off_t = @import("std").mem.zeroes(_off_t),
    st_atime: __time64_t = @import("std").mem.zeroes(__time64_t),
    st_mtime: __time64_t = @import("std").mem.zeroes(__time64_t),
    st_ctime: __time64_t = @import("std").mem.zeroes(__time64_t),
};
pub const struct__stat64 = extern struct {
    st_dev: _dev_t = @import("std").mem.zeroes(_dev_t),
    st_ino: _ino_t = @import("std").mem.zeroes(_ino_t),
    st_mode: c_ushort = @import("std").mem.zeroes(c_ushort),
    st_nlink: c_short = @import("std").mem.zeroes(c_short),
    st_uid: c_short = @import("std").mem.zeroes(c_short),
    st_gid: c_short = @import("std").mem.zeroes(c_short),
    st_rdev: _dev_t = @import("std").mem.zeroes(_dev_t),
    st_size: c_longlong = @import("std").mem.zeroes(c_longlong),
    st_atime: __time64_t = @import("std").mem.zeroes(__time64_t),
    st_mtime: __time64_t = @import("std").mem.zeroes(__time64_t),
    st_ctime: __time64_t = @import("std").mem.zeroes(__time64_t),
};
pub extern fn _wstat32(_Name: [*c]const wchar_t, _Stat: [*c]struct__stat32) c_int;
pub extern fn _wstat32i64(_Name: [*c]const wchar_t, _Stat: [*c]struct__stat32i64) c_int;
pub extern fn _wstat64i32(_Name: [*c]const wchar_t, _Stat: [*c]struct__stat64i32) c_int;
pub extern fn _wstat64(_Name: [*c]const wchar_t, _Stat: [*c]struct__stat64) c_int;
pub extern fn _cgetws(_Buffer: [*c]wchar_t) [*c]wchar_t;
pub extern fn _getwch() wint_t;
pub extern fn _getwche() wint_t;
pub extern fn _putwch(_WCh: wchar_t) wint_t;
pub extern fn _ungetwch(_WCh: wint_t) wint_t;
pub extern fn _cputws(_String: [*c]const wchar_t) c_int;
pub extern fn _cwprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _cwscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _cwscanf_l(noalias _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub extern fn _vcwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn _cwprintf_p(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _vcwprintf_p(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn _cwprintf_l(noalias _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub extern fn _vcwprintf_l(noalias _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn _cwprintf_p_l(noalias _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub extern fn _vcwprintf_p_l(noalias _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn _putwch_nolock(_WCh: wchar_t) wint_t;
pub extern fn _getwch_nolock() wint_t;
pub extern fn _getwche_nolock() wint_t;
pub extern fn _ungetwch_nolock(_WCh: wint_t) wint_t;
pub extern fn __stdio_common_vswprintf_p(_Options: c_ulonglong, _Str: [*c]wchar_t, _Len: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vfwprintf_p(_Options: c_ulonglong, _File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __mingw_swscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vswscanf(noalias _Str: [*c]const wchar_t, noalias Format: [*c]const wchar_t, argp: va_list) c_int;
pub extern fn __mingw_wscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vwscanf(noalias Format: [*c]const wchar_t, argp: va_list) c_int;
pub extern fn __mingw_fwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vfwscanf(noalias fp: [*c]FILE, noalias Format: [*c]const wchar_t, argp: va_list) c_int;
pub extern fn __mingw_fwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_wprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vfwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn __mingw_vwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn __mingw_snwprintf(noalias s: [*c]wchar_t, n: usize, noalias format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vsnwprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
pub extern fn __mingw_swprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vswprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
pub extern fn __ms_swscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_wscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_fwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_fwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_wprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vfwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn __ms_vwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn __ms_swprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vswprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
pub extern fn __stdio_common_vswprintf(options: c_ulonglong, str: [*c]wchar_t, len: usize, format: [*c]const wchar_t, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vfwprintf(options: c_ulonglong, file: [*c]FILE, format: [*c]const wchar_t, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vswscanf(options: c_ulonglong, input: [*c]const wchar_t, length: usize, format: [*c]const wchar_t, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vfwscanf(options: c_ulonglong, file: [*c]FILE, format: [*c]const wchar_t, locale: _locale_t, valist: va_list) c_int;
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:574:15: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn fwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:584:15: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn swscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:594:15: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn wscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub fn vfwscanf(arg___stream: [*c]FILE, arg___format: [*c]const wchar_t, arg___local_argv: va_list) callconv(.c) c_int {
    var __stream = arg___stream;
    _ = &__stream;
    var __format = arg___format;
    _ = &__format;
    var __local_argv = arg___local_argv;
    _ = &__local_argv;
    return __stdio_common_vfwscanf(@as(c_ulonglong, 2), __stream, __format, null, __local_argv);
}
pub fn vswscanf(noalias arg___source: [*c]const wchar_t, noalias arg___format: [*c]const wchar_t, arg___local_argv: va_list) callconv(.c) c_int {
    var __source = arg___source;
    _ = &__source;
    var __format = arg___format;
    _ = &__format;
    var __local_argv = arg___local_argv;
    _ = &__local_argv;
    return __stdio_common_vswscanf(@as(c_ulonglong, 2), __source, @as(usize, @bitCast(@as(c_longlong, -@as(c_int, 1)))), __format, null, __local_argv);
}
pub fn vwscanf(arg___format: [*c]const wchar_t, arg___local_argv: va_list) callconv(.c) c_int {
    var __format = arg___format;
    _ = &__format;
    var __local_argv = arg___local_argv;
    _ = &__local_argv;
    return __stdio_common_vfwscanf(@as(c_ulonglong, 2), __acrt_iob_func(@as(c_uint, @bitCast(@as(c_int, 0)))), __format, null, __local_argv);
}
pub extern fn fwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:625:15: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn wprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub fn vfwprintf(noalias arg__File: [*c]FILE, noalias arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfwprintf(@as(c_ulonglong, 4) | @as(c_ulonglong, 32), _File, _Format, null, _ArgList);
}
pub fn vwprintf(noalias arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfwprintf(@as(c_ulonglong, 4) | @as(c_ulonglong, 32), __acrt_iob_func(@as(c_uint, @bitCast(@as(c_int, 1)))), _Format, null, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:646:15: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn swprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, ...) c_int;
pub fn vswprintf(noalias arg__Dest: [*c]wchar_t, arg__Count: usize, noalias arg__Format: [*c]const wchar_t, arg__Args: va_list) callconv(.c) c_int {
    var _Dest = arg__Dest;
    _ = &_Dest;
    var _Count = arg__Count;
    _ = &_Count;
    var _Format = arg__Format;
    _ = &_Format;
    var _Args = arg__Args;
    _ = &_Args;
    var __ret: c_int = undefined;
    _ = &__ret;
    if ((_Dest == @as([*c]wchar_t, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) and (_Count == @as(usize, @bitCast(@as(c_longlong, @as(c_int, 0)))))) return -@as(c_int, 1);
    __ret = __stdio_common_vswprintf(@as(c_ulonglong, 4) | @as(c_ulonglong, 32), _Dest, _Count, _Format, null, _Args);
    return if (__ret < @as(c_int, 0)) -@as(c_int, 1) else __ret;
}
pub extern fn _wfsopen(_Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t, _ShFlag: c_int) [*c]FILE;
pub extern fn fgetwc(_File: [*c]FILE) wint_t;
pub extern fn _fgetwchar() wint_t;
pub extern fn fputwc(_Ch: wchar_t, _File: [*c]FILE) wint_t;
pub extern fn _fputwchar(_Ch: wchar_t) wint_t;
pub extern fn getwc(_File: [*c]FILE) wint_t;
pub extern fn getwchar() wint_t;
pub extern fn putwc(_Ch: wchar_t, _File: [*c]FILE) wint_t;
pub extern fn putwchar(_Ch: wchar_t) wint_t;
pub extern fn ungetwc(_Ch: wint_t, _File: [*c]FILE) wint_t;
pub extern fn fgetws(noalias _Dst: [*c]wchar_t, _SizeInWords: c_int, noalias _File: [*c]FILE) [*c]wchar_t;
pub extern fn fputws(noalias _Str: [*c]const wchar_t, noalias _File: [*c]FILE) c_int;
pub extern fn _getws(_String: [*c]wchar_t) [*c]wchar_t;
pub extern fn _putws(_Str: [*c]const wchar_t) c_int;
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:751:15: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scwprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _snwprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, ...) c_int;
pub fn _vsnwprintf(noalias arg__Dest: [*c]wchar_t, arg__Count: usize, noalias arg__Format: [*c]const wchar_t, arg__Args: va_list) callconv(.c) c_int {
    var _Dest = arg__Dest;
    _ = &_Dest;
    var _Count = arg__Count;
    _ = &_Count;
    var _Format = arg__Format;
    _ = &_Format;
    var _Args = arg__Args;
    _ = &_Args;
    return __stdio_common_vswprintf((@as(c_ulonglong, 4) | @as(c_ulonglong, 32)) | @as(c_ulonglong, 1), _Dest, _Count, _Format, null, _Args);
}
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:769:7: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn snwprintf(noalias s: [*c]wchar_t, n: usize, noalias format: [*c]const wchar_t, ...) c_int;
pub fn vsnwprintf(noalias arg_s: [*c]wchar_t, arg_n: usize, noalias arg_format: [*c]const wchar_t, arg_arg: va_list) callconv(.c) c_int {
    var s = arg_s;
    _ = &s;
    var n = arg_n;
    _ = &n;
    var format = arg_format;
    _ = &format;
    var arg = arg_arg;
    _ = &arg;
    var __ret: c_int = __stdio_common_vswprintf((@as(c_ulonglong, 4) | @as(c_ulonglong, 32)) | @as(c_ulonglong, 2), s, n, format, null, arg);
    _ = &__ret;
    return if (__ret < @as(c_int, 0)) -@as(c_int, 1) else __ret;
}
pub fn _vfwscanf_l(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfwscanf(@as(c_ulonglong, 2), _File, _Format, _Locale, _ArgList);
}
pub fn _vwscanf_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwscanf_l(__acrt_iob_func(@as(c_uint, @bitCast(@as(c_int, 0)))), _Format, _Locale, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:825:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fwscanf_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:834:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _wscanf_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub fn _vsnwscanf_l(arg__Src: [*c]const wchar_t, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswscanf(@as(c_ulonglong, 2), _Src, _MaxCount, _Format, _Locale, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:848:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwscanf_l(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:857:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwscanf(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
pub fn _vswscanf_l(arg__Src: [*c]const wchar_t, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswscanf(@as(c_ulonglong, 2), _Src, @as(usize, @bitCast(@as(c_longlong, -@as(c_int, 1)))), _Format, _Locale, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:871:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swscanf_l(_Src: [*c]const wchar_t, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub fn _vfwprintf_p_l(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfwprintf_p(@as(c_ulonglong, 4) | @as(c_ulonglong, 32), _File, _Format, _Locale, _ArgList);
}
pub fn _vwprintf_p_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_p_l(__acrt_iob_func(@as(c_uint, @bitCast(@as(c_int, 1)))), _Format, _Locale, _ArgList);
}
pub fn _vfwprintf_p(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_p_l(_File, _Format, null, _ArgList);
}
pub fn _vwprintf_p(arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_p_l(__acrt_iob_func(@as(c_uint, @bitCast(@as(c_int, 1)))), _Format, null, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:897:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fwprintf_p_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:906:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _wprintf_p_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:915:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fwprintf_p(_File: [*c]FILE, _Format: [*c]const wchar_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:924:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _wprintf_p(_Format: [*c]const wchar_t, ...) c_int;
pub fn _vfwprintf_l(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfwprintf(@as(c_ulonglong, 4) | @as(c_ulonglong, 32), _File, _Format, _Locale, _ArgList);
}
pub fn _vwprintf_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_l(__acrt_iob_func(@as(c_uint, @bitCast(@as(c_int, 1)))), _Format, _Locale, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:942:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fwprintf_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:951:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _wprintf_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub fn _vswprintf_p_l(arg__DstBuf: [*c]wchar_t, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswprintf_p(@as(c_ulonglong, 4) | @as(c_ulonglong, 32), _DstBuf, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn _vswprintf_p(arg__DstBuf: [*c]wchar_t, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vswprintf_p_l(_DstBuf, _MaxCount, _Format, null, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:969:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swprintf_p_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:978:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swprintf_p(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
pub fn _vsnwprintf_l(arg__DstBuf: [*c]wchar_t, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswprintf((@as(c_ulonglong, 4) | @as(c_ulonglong, 32)) | @as(c_ulonglong, 1), _DstBuf, _MaxCount, _Format, _Locale, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:992:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwprintf_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub fn _vscwprintf_p_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswprintf_p((@as(c_ulonglong, 4) | @as(c_ulonglong, 32)) | @as(c_ulonglong, 2), null, @as(usize, @bitCast(@as(c_longlong, @as(c_int, 0)))), _Format, _Locale, _ArgList);
}
pub fn _vscwprintf_p(arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vscwprintf_p_l(_Format, null, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:1010:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scwprintf_p_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:1019:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scwprintf_p(_Format: [*c]const wchar_t, ...) c_int;
pub fn _vscwprintf_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswprintf((@as(c_ulonglong, 4) | @as(c_ulonglong, 32)) | @as(c_ulonglong, 2), null, @as(usize, @bitCast(@as(c_longlong, @as(c_int, 0)))), _Format, _Locale, _ArgList);
}
pub fn _vscwprintf(arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vscwprintf_l(_Format, null, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:1037:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scwprintf_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub fn _vswprintf_c_l(arg__DstBuf: [*c]wchar_t, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswprintf(@as(c_ulonglong, 4) | @as(c_ulonglong, 32), _DstBuf, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn __vswprintf_l(arg__DstBuf: [*c]wchar_t, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vswprintf_c_l(_DstBuf, @as(usize, @bitCast(@as(c_longlong, -@as(c_int, 1)))), _Format, _Locale, _ArgList);
}
pub fn _vswprintf_l(arg__DstBuf: [*c]wchar_t, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vswprintf_c_l(_DstBuf, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn _vswprintf(arg__DstBuf: [*c]wchar_t, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vswprintf_c_l(_DstBuf, @as(usize, @bitCast(@as(c_longlong, -@as(c_int, 1)))), _Format, null, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:1063:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swprintf_c_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:1072:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn __swprintf_l(_DstBuf: [*c]wchar_t, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/wchar.h:1081:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swprintf(_DstBuf: [*c]wchar_t, _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _wtempnam(_Directory: [*c]const wchar_t, _FilePrefix: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wfdopen(_FileHandle: c_int, _Mode: [*c]const wchar_t) [*c]FILE;
pub extern fn _wfopen(noalias _Filename: [*c]const wchar_t, noalias _Mode: [*c]const wchar_t) [*c]FILE;
pub extern fn _wfreopen(noalias _Filename: [*c]const wchar_t, noalias _Mode: [*c]const wchar_t, noalias _OldFile: [*c]FILE) [*c]FILE;
pub extern fn _wperror(_ErrMsg: [*c]const wchar_t) void;
pub extern fn _wpopen(_Command: [*c]const wchar_t, _Mode: [*c]const wchar_t) [*c]FILE;
pub extern fn _wremove(_Filename: [*c]const wchar_t) c_int;
pub extern fn _wtmpnam(_Buffer: [*c]wchar_t) [*c]wchar_t;
pub extern fn _fgetwc_nolock(_File: [*c]FILE) wint_t;
pub extern fn _fputwc_nolock(_Ch: wchar_t, _File: [*c]FILE) wint_t;
pub extern fn _ungetwc_nolock(_Ch: wint_t, _File: [*c]FILE) wint_t;
pub extern fn _itow(_Value: c_int, _Dest: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _ltow(_Value: c_long, _Dest: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _ultow(_Value: c_ulong, _Dest: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _wcstod_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Locale: _locale_t) f64;
pub extern fn __mingw_wcstod(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t) f64;
pub extern fn __mingw_wcstof(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t) f32;
pub extern fn __mingw_wcstold(noalias [*c]const wchar_t, noalias [*c][*c]wchar_t) c_longdouble;
pub extern fn wcstod(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t) f64;
pub extern fn wcstof(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t) f32;
pub extern fn wcstold(noalias [*c]const wchar_t, noalias [*c][*c]wchar_t) c_longdouble;
pub extern fn wcstol(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_long;
pub extern fn _wcstol_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_long;
pub extern fn wcstoul(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_ulong;
pub extern fn _wcstoul_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_ulong;
pub extern fn _wgetenv(_VarName: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wtof(_Str: [*c]const wchar_t) f64;
pub extern fn _wtof_l(_Str: [*c]const wchar_t, _Locale: _locale_t) f64;
pub extern fn _wtoi(_Str: [*c]const wchar_t) c_int;
pub extern fn _wtoi_l(_Str: [*c]const wchar_t, _Locale: _locale_t) c_int;
pub extern fn _wtol(_Str: [*c]const wchar_t) c_long;
pub extern fn _wtol_l(_Str: [*c]const wchar_t, _Locale: _locale_t) c_long;
pub extern fn _i64tow(_Val: c_longlong, _DstBuf: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _ui64tow(_Val: c_ulonglong, _DstBuf: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _wtoi64(_Str: [*c]const wchar_t) c_longlong;
pub extern fn _wtoi64_l(_Str: [*c]const wchar_t, _Locale: _locale_t) c_longlong;
pub extern fn _wcstoi64(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_longlong;
pub extern fn _wcstoi64_l(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_longlong;
pub extern fn _wcstoui64(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_ulonglong;
pub extern fn _wcstoui64_l(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_ulonglong;
pub extern fn _wfullpath(_FullPath: [*c]wchar_t, _Path: [*c]const wchar_t, _SizeInWords: usize) [*c]wchar_t;
pub extern fn _wmakepath(_ResultPath: [*c]wchar_t, _Drive: [*c]const wchar_t, _Dir: [*c]const wchar_t, _Filename: [*c]const wchar_t, _Ext: [*c]const wchar_t) void;
pub extern fn _wputenv(_EnvString: [*c]const wchar_t) c_int;
pub extern fn _wsearchenv(_Filename: [*c]const wchar_t, _EnvVar: [*c]const wchar_t, _ResultPath: [*c]wchar_t) void;
pub extern fn _wsplitpath(_FullPath: [*c]const wchar_t, _Drive: [*c]wchar_t, _Dir: [*c]wchar_t, _Filename: [*c]wchar_t, _Ext: [*c]wchar_t) void;
pub const struct_tm = extern struct {
    tm_sec: c_int = @import("std").mem.zeroes(c_int),
    tm_min: c_int = @import("std").mem.zeroes(c_int),
    tm_hour: c_int = @import("std").mem.zeroes(c_int),
    tm_mday: c_int = @import("std").mem.zeroes(c_int),
    tm_mon: c_int = @import("std").mem.zeroes(c_int),
    tm_year: c_int = @import("std").mem.zeroes(c_int),
    tm_wday: c_int = @import("std").mem.zeroes(c_int),
    tm_yday: c_int = @import("std").mem.zeroes(c_int),
    tm_isdst: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn _wasctime(_Tm: [*c]const struct_tm) [*c]wchar_t;
pub extern fn _wasctime_s(_Buf: [*c]wchar_t, _SizeInWords: usize, _Tm: [*c]const struct_tm) errno_t;
pub extern fn _wctime32(_Time: [*c]const __time32_t) [*c]wchar_t;
pub extern fn _wctime32_s(_Buf: [*c]wchar_t, _SizeInWords: usize, _Time: [*c]const __time32_t) errno_t;
pub extern fn wcsftime(noalias _Buf: [*c]wchar_t, _SizeInWords: usize, noalias _Format: [*c]const wchar_t, noalias _Tm: [*c]const struct_tm) usize;
pub extern fn _wcsftime_l(noalias _Buf: [*c]wchar_t, _SizeInWords: usize, noalias _Format: [*c]const wchar_t, noalias _Tm: [*c]const struct_tm, _Locale: _locale_t) usize;
pub extern fn _wstrdate(_Buffer: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wstrdate_s(_Buf: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _wstrtime(_Buffer: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wstrtime_s(_Buf: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _wctime64(_Time: [*c]const __time64_t) [*c]wchar_t;
pub extern fn _wctime64_s(_Buf: [*c]wchar_t, _SizeInWords: usize, _Time: [*c]const __time64_t) errno_t;
pub extern fn _wctime(_Time: [*c]const time_t) [*c]wchar_t;
pub extern fn _wctime_s([*c]wchar_t, usize, [*c]const time_t) errno_t;
pub const struct__Mbstatet = extern struct {
    _Wchar: c_ulong = @import("std").mem.zeroes(c_ulong),
    _Byte: c_ushort = @import("std").mem.zeroes(c_ushort),
    _State: c_ushort = @import("std").mem.zeroes(c_ushort),
};
pub const _Mbstatet = struct__Mbstatet;
pub const mbstate_t = _Mbstatet;
pub const _Wint_t = wchar_t;
pub extern fn btowc(c_int) wint_t;
pub extern fn mbrlen(noalias _Ch: [*c]const u8, _SizeInBytes: usize, noalias _State: [*c]mbstate_t) usize;
pub extern fn mbrtowc(noalias _DstCh: [*c]wchar_t, noalias _SrcCh: [*c]const u8, _SizeInBytes: usize, noalias _State: [*c]mbstate_t) usize;
pub extern fn mbsrtowcs(noalias _Dest: [*c]wchar_t, noalias _PSrc: [*c][*c]const u8, _Count: usize, noalias _State: [*c]mbstate_t) usize;
pub extern fn wcrtomb(noalias _Dest: [*c]u8, _Source: wchar_t, noalias _State: [*c]mbstate_t) usize;
pub extern fn wcsrtombs(noalias _Dest: [*c]u8, noalias _PSource: [*c][*c]const wchar_t, _Count: usize, noalias _State: [*c]mbstate_t) usize;
pub extern fn wctob(_WCh: wint_t) c_int;
pub extern fn wmemset(s: [*c]wchar_t, c: wchar_t, n: usize) [*c]wchar_t;
pub extern fn wmemchr(s: [*c]const c_ushort, c: c_ushort, n: c_ulonglong) [*c]c_ushort;
pub extern fn wmemcmp(s1: [*c]const c_ushort, s2: [*c]const c_ushort, n: c_ulonglong) c_int;
pub extern fn wmemcpy(s1: [*c]c_ushort, s2: [*c]const c_ushort, n: c_ulonglong) [*c]c_ushort;
pub extern fn wmempcpy(_Dst: [*c]wchar_t, _Src: [*c]const wchar_t, _Size: usize) [*c]wchar_t;
pub extern fn wmemmove(s1: [*c]c_ushort, s2: [*c]const c_ushort, n: c_ulonglong) [*c]c_ushort;
pub extern fn fwide(stream: [*c]FILE, mode: c_int) c_int;
pub fn mbsinit(arg__P: [*c]const mbstate_t) callconv(.c) c_int {
    var _P = arg__P;
    _ = &_P;
    return @intFromBool(!(_P != null) or (_P.*._Wchar == @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 0))))));
}
pub extern fn wcstoll(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t, base: c_int) c_longlong;
pub extern fn wcstoull(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t, base: c_int) c_ulonglong;
pub extern fn __mingw_str_wide_utf8(wptr: [*c]const wchar_t, mbptr: [*c][*c]u8, buflen: [*c]usize) c_int;
pub extern fn __mingw_str_utf8_wide(mbptr: [*c]const u8, wptr: [*c][*c]wchar_t, buflen: [*c]usize) c_int;
pub extern fn __mingw_str_free(ptr: ?*anyopaque) void;
pub extern fn _waccess_s(_Filename: [*c]const wchar_t, _AccessMode: c_int) errno_t;
pub extern fn _wmktemp_s(_TemplateName: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _cgetws_s(_Buffer: [*c]wchar_t, _SizeInWords: usize, _SizeRead: [*c]usize) errno_t;
pub extern fn _cwprintf_s(_Format: [*c]const wchar_t, ...) c_int;
pub extern fn _cwscanf_s(_Format: [*c]const wchar_t, ...) c_int;
pub extern fn _cwscanf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub extern fn _vcwprintf_s(_Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn _cwprintf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub extern fn _vcwprintf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn _getws_s(_Str: [*c]wchar_t, _SizeInWords: usize) [*c]wchar_t;
pub extern fn __stdio_common_vswprintf_s(_Options: c_ulonglong, _Str: [*c]wchar_t, _Len: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vsnwprintf_s(_Options: c_ulonglong, _Str: [*c]wchar_t, _Len: usize, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vfwprintf_s(_Options: c_ulonglong, _File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub fn _vfwscanf_s_l(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfwscanf(@as(c_ulonglong, 2) | @as(c_ulonglong, 1), _File, _Format, _Locale, _ArgList);
}
pub fn vfwscanf_s(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwscanf_s_l(_File, _Format, null, _ArgList);
}
pub fn _vwscanf_s_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwscanf_s_l(__acrt_iob_func(@as(c_uint, @bitCast(@as(c_int, 0)))), _Format, _Locale, _ArgList);
}
pub fn vwscanf_s(arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwscanf_s_l(__acrt_iob_func(@as(c_uint, @bitCast(@as(c_int, 0)))), _Format, null, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/sec_api/wchar_s.h:71:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fwscanf_s_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/sec_api/wchar_s.h:81:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn fwscanf_s(_File: [*c]FILE, _Format: [*c]const wchar_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/sec_api/wchar_s.h:91:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _wscanf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/sec_api/wchar_s.h:101:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn wscanf_s(_Format: [*c]const wchar_t, ...) c_int;
pub fn _vswscanf_s_l(arg__Src: [*c]const wchar_t, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswscanf(@as(c_ulonglong, 2) | @as(c_ulonglong, 1), _Src, @as(usize, @bitCast(@as(c_longlong, -@as(c_int, 1)))), _Format, _Locale, _ArgList);
}
pub fn vswscanf_s(arg__Src: [*c]const wchar_t, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vswscanf_s_l(_Src, _Format, null, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/sec_api/wchar_s.h:121:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swscanf_s_l(_Src: [*c]const wchar_t, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/sec_api/wchar_s.h:130:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn swscanf_s(_Src: [*c]const wchar_t, _Format: [*c]const wchar_t, ...) c_int;
pub fn _vsnwscanf_s_l(arg__Src: [*c]const wchar_t, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswscanf(@as(c_ulonglong, 2) | @as(c_ulonglong, 1), _Src, _MaxCount, _Format, _Locale, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/sec_api/wchar_s.h:144:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwscanf_s_l(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/sec_api/wchar_s.h:153:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwscanf_s(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
pub fn _vfwprintf_s_l(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfwprintf_s(@as(c_ulonglong, 4) | @as(c_ulonglong, 32), _File, _Format, _Locale, _ArgList);
}
pub fn _vwprintf_s_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_s_l(__acrt_iob_func(@as(c_uint, @bitCast(@as(c_int, 1)))), _Format, _Locale, _ArgList);
}
pub fn vfwprintf_s(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_s_l(_File, _Format, null, _ArgList);
}
pub fn vwprintf_s(arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_s_l(__acrt_iob_func(@as(c_uint, @bitCast(@as(c_int, 1)))), _Format, null, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/sec_api/wchar_s.h:179:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fwprintf_s_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/sec_api/wchar_s.h:188:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _wprintf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/sec_api/wchar_s.h:197:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn fwprintf_s(_File: [*c]FILE, _Format: [*c]const wchar_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/sec_api/wchar_s.h:206:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn wprintf_s(_Format: [*c]const wchar_t, ...) c_int;
pub fn _vswprintf_s_l(arg__DstBuf: [*c]wchar_t, arg__DstSize: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswprintf_s(@as(c_ulonglong, 4) | @as(c_ulonglong, 32), _DstBuf, _DstSize, _Format, _Locale, _ArgList);
}
pub fn vswprintf_s(arg__DstBuf: [*c]wchar_t, arg__DstSize: usize, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vswprintf_s_l(_DstBuf, _DstSize, _Format, null, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/sec_api/wchar_s.h:224:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swprintf_s_l(_DstBuf: [*c]wchar_t, _DstSize: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/sec_api/wchar_s.h:233:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn swprintf_s(_DstBuf: [*c]wchar_t, _DstSize: usize, _Format: [*c]const wchar_t, ...) c_int;
pub fn _vsnwprintf_s_l(arg__DstBuf: [*c]wchar_t, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsnwprintf_s(@as(c_ulonglong, 4) | @as(c_ulonglong, 32), _DstBuf, _DstSize, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn _vsnwprintf_s(arg__DstBuf: [*c]wchar_t, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsnwprintf_s_l(_DstBuf, _DstSize, _MaxCount, _Format, null, _ArgList);
}
// /usr/lib/zig/libc/include/any-windows-any/sec_api/wchar_s.h:251:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwprintf_s_l(_DstBuf: [*c]wchar_t, _DstSize: usize, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
// /usr/lib/zig/libc/include/any-windows-any/sec_api/wchar_s.h:260:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwprintf_s(_DstBuf: [*c]wchar_t, _DstSize: usize, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _wfopen_s(_File: [*c][*c]FILE, _Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t) errno_t;
pub extern fn _wfreopen_s(_File: [*c][*c]FILE, _Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t, _OldFile: [*c]FILE) errno_t;
pub extern fn _wtmpnam_s(_DstBuf: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn mbsrtowcs_s(_Retval: [*c]usize, _Dst: [*c]wchar_t, _SizeInWords: usize, _PSrc: [*c][*c]const u8, _N: usize, _State: [*c]mbstate_t) errno_t;
pub extern fn wcrtomb_s(_Retval: [*c]usize, _Dst: [*c]u8, _SizeInBytes: usize, _Ch: wchar_t, _State: [*c]mbstate_t) errno_t;
pub extern fn wcsrtombs_s(_Retval: [*c]usize, _Dst: [*c]u8, _SizeInBytes: usize, _Src: [*c][*c]const wchar_t, _Size: usize, _State: [*c]mbstate_t) errno_t;
pub extern fn wmemcpy_s(_dest: [*c]wchar_t, _numberOfElements: usize, _src: [*c]const wchar_t, _count: usize) errno_t;
pub extern fn wmemmove_s(_dest: [*c]wchar_t, _numberOfElements: usize, _src: [*c]const wchar_t, _count: usize) errno_t;
pub const imaxdiv_t = extern struct {
    quot: intmax_t = @import("std").mem.zeroes(intmax_t),
    rem: intmax_t = @import("std").mem.zeroes(intmax_t),
};
pub extern fn imaxabs(j: intmax_t) intmax_t;
pub extern fn imaxdiv(numer: intmax_t, denom: intmax_t) imaxdiv_t;
pub extern fn strtoimax(noalias nptr: [*c]const u8, noalias endptr: [*c][*c]u8, base: c_int) intmax_t;
pub extern fn strtoumax(noalias nptr: [*c]const u8, noalias endptr: [*c][*c]u8, base: c_int) uintmax_t;
pub extern fn wcstoimax(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t, base: c_int) intmax_t;
pub extern fn wcstoumax(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t, base: c_int) uintmax_t;
pub const Sint8 = i8;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub const SDL_Time = Sint64;
// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration

// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration

// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration

// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration

// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration

// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration

// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration

// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration

// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration

// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration

// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration

// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration
pub const struct_SDL_alignment_test = extern struct {
    a: Uint8 = @import("std").mem.zeroes(Uint8),
    b: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const SDL_alignment_test = struct_SDL_alignment_test;
// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration

// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration
pub const DUMMY_ENUM_VALUE: c_int = 0;
pub const enum_SDL_DUMMY_ENUM = c_uint;
pub const SDL_DUMMY_ENUM = enum_SDL_DUMMY_ENUM;
// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration
pub extern fn SDL_malloc(size: usize) ?*anyopaque;
pub extern fn SDL_calloc(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free(mem: ?*anyopaque) void;
pub const SDL_malloc_func = ?*const fn (usize) callconv(.c) ?*anyopaque;
pub const SDL_calloc_func = ?*const fn (usize, usize) callconv(.c) ?*anyopaque;
pub const SDL_realloc_func = ?*const fn (?*anyopaque, usize) callconv(.c) ?*anyopaque;
pub const SDL_free_func = ?*const fn (?*anyopaque) callconv(.c) void;
pub extern fn SDL_GetOriginalMemoryFunctions(malloc_func: [*c]SDL_malloc_func, calloc_func: [*c]SDL_calloc_func, realloc_func: [*c]SDL_realloc_func, free_func: [*c]SDL_free_func) void;
pub extern fn SDL_GetMemoryFunctions(malloc_func: [*c]SDL_malloc_func, calloc_func: [*c]SDL_calloc_func, realloc_func: [*c]SDL_realloc_func, free_func: [*c]SDL_free_func) void;
pub extern fn SDL_SetMemoryFunctions(malloc_func: SDL_malloc_func, calloc_func: SDL_calloc_func, realloc_func: SDL_realloc_func, free_func: SDL_free_func) bool;
pub extern fn SDL_aligned_alloc(alignment: usize, size: usize) ?*anyopaque;
pub extern fn SDL_aligned_free(mem: ?*anyopaque) void;
pub extern fn SDL_GetNumAllocations() c_int;
pub const struct_SDL_Environment = opaque {};
pub const SDL_Environment = struct_SDL_Environment;
pub extern fn SDL_GetEnvironment() ?*SDL_Environment;
pub extern fn SDL_CreateEnvironment(populated: bool) ?*SDL_Environment;
pub extern fn SDL_GetEnvironmentVariable(env: ?*SDL_Environment, name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetEnvironmentVariables(env: ?*SDL_Environment) [*c][*c]u8;
pub extern fn SDL_SetEnvironmentVariable(env: ?*SDL_Environment, name: [*c]const u8, value: [*c]const u8, overwrite: bool) bool;
pub extern fn SDL_UnsetEnvironmentVariable(env: ?*SDL_Environment, name: [*c]const u8) bool;
pub extern fn SDL_DestroyEnvironment(env: ?*SDL_Environment) void;
pub extern fn SDL_getenv(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_getenv_unsafe(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_setenv_unsafe(name: [*c]const u8, value: [*c]const u8, overwrite: c_int) c_int;
pub extern fn SDL_unsetenv_unsafe(name: [*c]const u8) c_int;
pub const SDL_CompareCallback = ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int;
pub extern fn SDL_qsort(base: ?*anyopaque, nmemb: usize, size: usize, compare: SDL_CompareCallback) void;
pub extern fn SDL_bsearch(key: ?*const anyopaque, base: ?*const anyopaque, nmemb: usize, size: usize, compare: SDL_CompareCallback) ?*anyopaque;
pub const SDL_CompareCallback_r = ?*const fn (?*anyopaque, ?*const anyopaque, ?*const anyopaque) callconv(.c) c_int;
pub extern fn SDL_qsort_r(base: ?*anyopaque, nmemb: usize, size: usize, compare: SDL_CompareCallback_r, userdata: ?*anyopaque) void;
pub extern fn SDL_bsearch_r(key: ?*const anyopaque, base: ?*const anyopaque, nmemb: usize, size: usize, compare: SDL_CompareCallback_r, userdata: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_abs(x: c_int) c_int;
pub extern fn SDL_isalpha(x: c_int) c_int;
pub extern fn SDL_isalnum(x: c_int) c_int;
pub extern fn SDL_isblank(x: c_int) c_int;
pub extern fn SDL_iscntrl(x: c_int) c_int;
pub extern fn SDL_isdigit(x: c_int) c_int;
pub extern fn SDL_isxdigit(x: c_int) c_int;
pub extern fn SDL_ispunct(x: c_int) c_int;
pub extern fn SDL_isspace(x: c_int) c_int;
pub extern fn SDL_isupper(x: c_int) c_int;
pub extern fn SDL_islower(x: c_int) c_int;
pub extern fn SDL_isprint(x: c_int) c_int;
pub extern fn SDL_isgraph(x: c_int) c_int;
pub extern fn SDL_toupper(x: c_int) c_int;
pub extern fn SDL_tolower(x: c_int) c_int;
pub extern fn SDL_crc16(crc: Uint16, data: ?*const anyopaque, len: usize) Uint16;
pub extern fn SDL_crc32(crc: Uint32, data: ?*const anyopaque, len: usize) Uint32;
pub extern fn SDL_murmur3_32(data: ?*const anyopaque, len: usize, seed: Uint32) Uint32;
pub extern fn SDL_memcpy(dst: ?*anyopaque, src: ?*const anyopaque, len: usize) ?*anyopaque;
pub extern fn SDL_memmove(dst: ?*anyopaque, src: ?*const anyopaque, len: usize) ?*anyopaque;
pub extern fn SDL_memset(dst: ?*anyopaque, c: c_int, len: usize) ?*anyopaque;
pub extern fn SDL_memset4(dst: ?*anyopaque, val: Uint32, dwords: usize) ?*anyopaque;
pub extern fn SDL_memcmp(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_wcslen(wstr: [*c]const wchar_t) usize;
pub extern fn SDL_wcsnlen(wstr: [*c]const wchar_t, maxlen: usize) usize;
pub extern fn SDL_wcslcpy(dst: [*c]wchar_t, src: [*c]const wchar_t, maxlen: usize) usize;
pub extern fn SDL_wcslcat(dst: [*c]wchar_t, src: [*c]const wchar_t, maxlen: usize) usize;
pub extern fn SDL_wcsdup(wstr: [*c]const wchar_t) [*c]wchar_t;
pub extern fn SDL_wcsstr(haystack: [*c]const wchar_t, needle: [*c]const wchar_t) [*c]wchar_t;
pub extern fn SDL_wcsnstr(haystack: [*c]const wchar_t, needle: [*c]const wchar_t, maxlen: usize) [*c]wchar_t;
pub extern fn SDL_wcscmp(str1: [*c]const wchar_t, str2: [*c]const wchar_t) c_int;
pub extern fn SDL_wcsncmp(str1: [*c]const wchar_t, str2: [*c]const wchar_t, maxlen: usize) c_int;
pub extern fn SDL_wcscasecmp(str1: [*c]const wchar_t, str2: [*c]const wchar_t) c_int;
pub extern fn SDL_wcsncasecmp(str1: [*c]const wchar_t, str2: [*c]const wchar_t, maxlen: usize) c_int;
pub extern fn SDL_wcstol(str: [*c]const wchar_t, endp: [*c][*c]wchar_t, base: c_int) c_long;
pub extern fn SDL_strlen(str: [*c]const u8) usize;
pub extern fn SDL_strnlen(str: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strlcpy(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_utf8strlcpy(dst: [*c]u8, src: [*c]const u8, dst_bytes: usize) usize;
pub extern fn SDL_strlcat(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strndup(str: [*c]const u8, maxlen: usize) [*c]u8;
pub extern fn SDL_strrev(str: [*c]u8) [*c]u8;
pub extern fn SDL_strupr(str: [*c]u8) [*c]u8;
pub extern fn SDL_strlwr(str: [*c]u8) [*c]u8;
pub extern fn SDL_strchr(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strrchr(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strstr(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_strnstr(haystack: [*c]const u8, needle: [*c]const u8, maxlen: usize) [*c]u8;
pub extern fn SDL_strcasestr(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_strtok_r(str: [*c]u8, delim: [*c]const u8, saveptr: [*c][*c]u8) [*c]u8;
pub extern fn SDL_utf8strlen(str: [*c]const u8) usize;
pub extern fn SDL_utf8strnlen(str: [*c]const u8, bytes: usize) usize;
pub extern fn SDL_itoa(value: c_int, str: [*c]u8, radix: c_int) [*c]u8;
pub extern fn SDL_uitoa(value: c_uint, str: [*c]u8, radix: c_int) [*c]u8;
pub extern fn SDL_ltoa(value: c_long, str: [*c]u8, radix: c_int) [*c]u8;
pub extern fn SDL_ultoa(value: c_ulong, str: [*c]u8, radix: c_int) [*c]u8;
pub extern fn SDL_lltoa(value: c_longlong, str: [*c]u8, radix: c_int) [*c]u8;
pub extern fn SDL_ulltoa(value: c_ulonglong, str: [*c]u8, radix: c_int) [*c]u8;
pub extern fn SDL_atoi(str: [*c]const u8) c_int;
pub extern fn SDL_atof(str: [*c]const u8) f64;
pub extern fn SDL_strtol(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_long;
pub extern fn SDL_strtoul(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_ulong;
pub extern fn SDL_strtoll(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_longlong;
pub extern fn SDL_strtoull(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_ulonglong;
pub extern fn SDL_strtod(str: [*c]const u8, endp: [*c][*c]u8) f64;
pub extern fn SDL_strcmp(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncmp(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_strcasecmp(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncasecmp(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_strpbrk(str: [*c]const u8, breakset: [*c]const u8) [*c]u8;
pub extern fn SDL_StepUTF8(pstr: [*c][*c]const u8, pslen: [*c]usize) Uint32;
pub extern fn SDL_StepBackUTF8(start: [*c]const u8, pstr: [*c][*c]const u8) Uint32;
pub extern fn SDL_UCS4ToUTF8(codepoint: Uint32, dst: [*c]u8) [*c]u8;
pub extern fn SDL_sscanf(text: [*c]const u8, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_vsscanf(text: [*c]const u8, fmt: [*c]const u8, ap: va_list) c_int;
pub extern fn SDL_snprintf(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_swprintf(text: [*c]wchar_t, maxlen: usize, fmt: [*c]const wchar_t, ...) c_int;
pub extern fn SDL_vsnprintf(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ap: va_list) c_int;
pub extern fn SDL_vswprintf(text: [*c]wchar_t, maxlen: usize, fmt: [*c]const wchar_t, ap: va_list) c_int;
pub extern fn SDL_asprintf(strp: [*c][*c]u8, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_vasprintf(strp: [*c][*c]u8, fmt: [*c]const u8, ap: va_list) c_int;
pub extern fn SDL_srand(seed: Uint64) void;
pub extern fn SDL_rand(n: Sint32) Sint32;
pub extern fn SDL_randf() f32;
pub extern fn SDL_rand_bits() Uint32;
pub extern fn SDL_rand_r(state: [*c]Uint64, n: Sint32) Sint32;
pub extern fn SDL_randf_r(state: [*c]Uint64) f32;
pub extern fn SDL_rand_bits_r(state: [*c]Uint64) Uint32;
pub extern fn SDL_acos(x: f64) f64;
pub extern fn SDL_acosf(x: f32) f32;
pub extern fn SDL_asin(x: f64) f64;
pub extern fn SDL_asinf(x: f32) f32;
pub extern fn SDL_atan(x: f64) f64;
pub extern fn SDL_atanf(x: f32) f32;
pub extern fn SDL_atan2(y: f64, x: f64) f64;
pub extern fn SDL_atan2f(y: f32, x: f32) f32;
pub extern fn SDL_ceil(x: f64) f64;
pub extern fn SDL_ceilf(x: f32) f32;
pub extern fn SDL_copysign(x: f64, y: f64) f64;
pub extern fn SDL_copysignf(x: f32, y: f32) f32;
pub extern fn SDL_cos(x: f64) f64;
pub extern fn SDL_cosf(x: f32) f32;
pub extern fn SDL_exp(x: f64) f64;
pub extern fn SDL_expf(x: f32) f32;
pub extern fn SDL_fabs(x: f64) f64;
pub extern fn SDL_fabsf(x: f32) f32;
pub extern fn SDL_floor(x: f64) f64;
pub extern fn SDL_floorf(x: f32) f32;
pub extern fn SDL_trunc(x: f64) f64;
pub extern fn SDL_truncf(x: f32) f32;
pub extern fn SDL_fmod(x: f64, y: f64) f64;
pub extern fn SDL_fmodf(x: f32, y: f32) f32;
pub extern fn SDL_isinf(x: f64) c_int;
pub extern fn SDL_isinff(x: f32) c_int;
pub extern fn SDL_isnan(x: f64) c_int;
pub extern fn SDL_isnanf(x: f32) c_int;
pub extern fn SDL_log(x: f64) f64;
pub extern fn SDL_logf(x: f32) f32;
pub extern fn SDL_log10(x: f64) f64;
pub extern fn SDL_log10f(x: f32) f32;
pub extern fn SDL_modf(x: f64, y: [*c]f64) f64;
pub extern fn SDL_modff(x: f32, y: [*c]f32) f32;
pub extern fn SDL_pow(x: f64, y: f64) f64;
pub extern fn SDL_powf(x: f32, y: f32) f32;
pub extern fn SDL_round(x: f64) f64;
pub extern fn SDL_roundf(x: f32) f32;
pub extern fn SDL_lround(x: f64) c_long;
pub extern fn SDL_lroundf(x: f32) c_long;
pub extern fn SDL_scalbn(x: f64, n: c_int) f64;
pub extern fn SDL_scalbnf(x: f32, n: c_int) f32;
pub extern fn SDL_sin(x: f64) f64;
pub extern fn SDL_sinf(x: f32) f32;
pub extern fn SDL_sqrt(x: f64) f64;
pub extern fn SDL_sqrtf(x: f32) f32;
pub extern fn SDL_tan(x: f64) f64;
pub extern fn SDL_tanf(x: f32) f32;
pub const struct_SDL_iconv_data_t = opaque {};
pub const SDL_iconv_t = ?*struct_SDL_iconv_data_t;
pub extern fn SDL_iconv_open(tocode: [*c]const u8, fromcode: [*c]const u8) SDL_iconv_t;
pub extern fn SDL_iconv_close(cd: SDL_iconv_t) c_int;
pub extern fn SDL_iconv(cd: SDL_iconv_t, inbuf: [*c][*c]const u8, inbytesleft: [*c]usize, outbuf: [*c][*c]u8, outbytesleft: [*c]usize) usize;
pub extern fn SDL_iconv_string(tocode: [*c]const u8, fromcode: [*c]const u8, inbuf: [*c]const u8, inbytesleft: usize) [*c]u8;
pub inline fn SDL_size_mul_check_overflow(arg_a: usize, arg_b: usize, arg_ret: [*c]usize) bool {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    var ret = arg_ret;
    _ = &ret;
    if ((a != @as(usize, @bitCast(@as(c_longlong, @as(c_int, 0))))) and (b > (@as(c_ulonglong, 18446744073709551615) / a))) {
        return @as(c_int, 0) != 0;
    }
    ret.* = a *% b;
    return @as(c_int, 1) != 0;
}
pub inline fn SDL_size_mul_check_overflow_builtin(arg_a: usize, arg_b: usize, arg_ret: [*c]usize) bool {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    var ret = arg_ret;
    _ = &ret;
    return @as(c_int, @intFromBool(__builtin_mul_overflow(a, b, ret))) == @as(c_int, 0);
}
pub inline fn SDL_size_add_check_overflow(arg_a: usize, arg_b: usize, arg_ret: [*c]usize) bool {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    var ret = arg_ret;
    _ = &ret;
    if (b > (@as(c_ulonglong, 18446744073709551615) -% a)) {
        return @as(c_int, 0) != 0;
    }
    ret.* = a +% b;
    return @as(c_int, 1) != 0;
}
// include/SDL3/SDL_stdinc.h:6100:13: warning: TODO implement function '__builtin_add_overflow' in std.zig.c_builtins

// include/SDL3/SDL_stdinc.h:6098:23: warning: unable to translate function, demoted to extern
pub extern fn SDL_size_add_check_overflow_builtin(arg_a: usize, arg_b: usize, arg_ret: [*c]usize) bool;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub const SDL_ASSERTION_RETRY: c_int = 0;
pub const SDL_ASSERTION_BREAK: c_int = 1;
pub const SDL_ASSERTION_ABORT: c_int = 2;
pub const SDL_ASSERTION_IGNORE: c_int = 3;
pub const SDL_ASSERTION_ALWAYS_IGNORE: c_int = 4;
pub const enum_SDL_AssertState = c_uint;
pub const SDL_AssertState = enum_SDL_AssertState;
pub const struct_SDL_AssertData = extern struct {
    always_ignore: bool = @import("std").mem.zeroes(bool),
    trigger_count: c_uint = @import("std").mem.zeroes(c_uint),
    condition: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    filename: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    linenum: c_int = @import("std").mem.zeroes(c_int),
    function: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    next: [*c]const struct_SDL_AssertData = @import("std").mem.zeroes([*c]const struct_SDL_AssertData),
};
pub const SDL_AssertData = struct_SDL_AssertData;
pub extern fn SDL_ReportAssertion(data: [*c]SDL_AssertData, func: [*c]const u8, file: [*c]const u8, line: c_int) SDL_AssertState;
pub const SDL_AssertionHandler = ?*const fn ([*c]const SDL_AssertData, ?*anyopaque) callconv(.c) SDL_AssertState;
pub extern fn SDL_SetAssertionHandler(handler: SDL_AssertionHandler, userdata: ?*anyopaque) void;
pub extern fn SDL_GetDefaultAssertionHandler() SDL_AssertionHandler;
pub extern fn SDL_GetAssertionHandler(puserdata: [*c]?*anyopaque) SDL_AssertionHandler;
pub extern fn SDL_GetAssertionReport() [*c]const SDL_AssertData;
pub extern fn SDL_ResetAssertionReport() void;
pub const struct_SDL_AsyncIO = opaque {};
pub const SDL_AsyncIO = struct_SDL_AsyncIO;
pub const SDL_ASYNCIO_TASK_READ: c_int = 0;
pub const SDL_ASYNCIO_TASK_WRITE: c_int = 1;
pub const SDL_ASYNCIO_TASK_CLOSE: c_int = 2;
pub const enum_SDL_AsyncIOTaskType = c_uint;
pub const SDL_AsyncIOTaskType = enum_SDL_AsyncIOTaskType;
pub const SDL_ASYNCIO_COMPLETE: c_int = 0;
pub const SDL_ASYNCIO_FAILURE: c_int = 1;
pub const SDL_ASYNCIO_CANCELED: c_int = 2;
pub const enum_SDL_AsyncIOResult = c_uint;
pub const SDL_AsyncIOResult = enum_SDL_AsyncIOResult;
pub const struct_SDL_AsyncIOOutcome = extern struct {
    asyncio: ?*SDL_AsyncIO = @import("std").mem.zeroes(?*SDL_AsyncIO),
    type: SDL_AsyncIOTaskType = @import("std").mem.zeroes(SDL_AsyncIOTaskType),
    result: SDL_AsyncIOResult = @import("std").mem.zeroes(SDL_AsyncIOResult),
    buffer: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    offset: Uint64 = @import("std").mem.zeroes(Uint64),
    bytes_requested: Uint64 = @import("std").mem.zeroes(Uint64),
    bytes_transferred: Uint64 = @import("std").mem.zeroes(Uint64),
    userdata: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const SDL_AsyncIOOutcome = struct_SDL_AsyncIOOutcome;
pub const struct_SDL_AsyncIOQueue = opaque {};
pub const SDL_AsyncIOQueue = struct_SDL_AsyncIOQueue;
pub extern fn SDL_AsyncIOFromFile(file: [*c]const u8, mode: [*c]const u8) ?*SDL_AsyncIO;
pub extern fn SDL_GetAsyncIOSize(asyncio: ?*SDL_AsyncIO) Sint64;
pub extern fn SDL_ReadAsyncIO(asyncio: ?*SDL_AsyncIO, ptr: ?*anyopaque, offset: Uint64, size: Uint64, queue: ?*SDL_AsyncIOQueue, userdata: ?*anyopaque) bool;
pub extern fn SDL_WriteAsyncIO(asyncio: ?*SDL_AsyncIO, ptr: ?*anyopaque, offset: Uint64, size: Uint64, queue: ?*SDL_AsyncIOQueue, userdata: ?*anyopaque) bool;
pub extern fn SDL_CloseAsyncIO(asyncio: ?*SDL_AsyncIO, flush: bool, queue: ?*SDL_AsyncIOQueue, userdata: ?*anyopaque) bool;
pub extern fn SDL_CreateAsyncIOQueue() ?*SDL_AsyncIOQueue;
pub extern fn SDL_DestroyAsyncIOQueue(queue: ?*SDL_AsyncIOQueue) void;
pub extern fn SDL_GetAsyncIOResult(queue: ?*SDL_AsyncIOQueue, outcome: [*c]SDL_AsyncIOOutcome) bool;
pub extern fn SDL_WaitAsyncIOResult(queue: ?*SDL_AsyncIOQueue, outcome: [*c]SDL_AsyncIOOutcome, timeoutMS: Sint32) bool;
pub extern fn SDL_SignalAsyncIOQueue(queue: ?*SDL_AsyncIOQueue) void;
pub extern fn SDL_LoadFileAsync(file: [*c]const u8, queue: ?*SDL_AsyncIOQueue, userdata: ?*anyopaque) bool;
pub const SDL_SpinLock = c_int;
pub extern fn SDL_TryLockSpinlock(lock: [*c]SDL_SpinLock) bool;
pub extern fn SDL_LockSpinlock(lock: [*c]SDL_SpinLock) void;
pub extern fn SDL_UnlockSpinlock(lock: [*c]SDL_SpinLock) void;
pub extern fn SDL_MemoryBarrierReleaseFunction() void;
pub extern fn SDL_MemoryBarrierAcquireFunction() void;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = @import("std").mem.zeroes(c_int),
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_CompareAndSwapAtomicInt(a: [*c]SDL_AtomicInt, oldval: c_int, newval: c_int) bool;
pub extern fn SDL_SetAtomicInt(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_GetAtomicInt(a: [*c]SDL_AtomicInt) c_int;
pub extern fn SDL_AddAtomicInt(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub const struct_SDL_AtomicU32 = extern struct {
    value: Uint32 = @import("std").mem.zeroes(Uint32),
};
pub const SDL_AtomicU32 = struct_SDL_AtomicU32;
pub extern fn SDL_CompareAndSwapAtomicU32(a: [*c]SDL_AtomicU32, oldval: Uint32, newval: Uint32) bool;
pub extern fn SDL_SetAtomicU32(a: [*c]SDL_AtomicU32, v: Uint32) Uint32;
pub extern fn SDL_GetAtomicU32(a: [*c]SDL_AtomicU32) Uint32;
pub extern fn SDL_CompareAndSwapAtomicPointer(a: [*c]?*anyopaque, oldval: ?*anyopaque, newval: ?*anyopaque) bool;
pub extern fn SDL_SetAtomicPointer(a: [*c]?*anyopaque, v: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetAtomicPointer(a: [*c]?*anyopaque) ?*anyopaque;
pub inline fn SDL_SwapFloat(arg_x: f32) f32 {
    var x = arg_x;
    _ = &x;
    const union_unnamed_1 = extern union {
        f: f32,
        ui32: Uint32,
    };
    _ = &union_unnamed_1;
    var swapper: union_unnamed_1 = undefined;
    _ = &swapper;
    swapper.f = x;
    swapper.ui32 = __builtin_bswap32(swapper.ui32);
    return swapper.f;
}
pub extern fn SDL_SetError(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_SetErrorV(fmt: [*c]const u8, ap: va_list) bool;
pub extern fn SDL_OutOfMemory() bool;
pub extern fn SDL_GetError() [*c]const u8;
pub extern fn SDL_ClearError() bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_PROPERTY_TYPE_INVALID: c_int = 0;
pub const SDL_PROPERTY_TYPE_POINTER: c_int = 1;
pub const SDL_PROPERTY_TYPE_STRING: c_int = 2;
pub const SDL_PROPERTY_TYPE_NUMBER: c_int = 3;
pub const SDL_PROPERTY_TYPE_FLOAT: c_int = 4;
pub const SDL_PROPERTY_TYPE_BOOLEAN: c_int = 5;
pub const enum_SDL_PropertyType = c_uint;
pub const SDL_PropertyType = enum_SDL_PropertyType;
pub extern fn SDL_GetGlobalProperties() SDL_PropertiesID;
pub extern fn SDL_CreateProperties() SDL_PropertiesID;
pub extern fn SDL_CopyProperties(src: SDL_PropertiesID, dst: SDL_PropertiesID) bool;
pub extern fn SDL_LockProperties(props: SDL_PropertiesID) bool;
pub extern fn SDL_UnlockProperties(props: SDL_PropertiesID) void;
pub const SDL_CleanupPropertyCallback = ?*const fn (?*anyopaque, ?*anyopaque) callconv(.c) void;
pub extern fn SDL_SetPointerPropertyWithCleanup(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque, cleanup: SDL_CleanupPropertyCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_SetPointerProperty(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetStringProperty(props: SDL_PropertiesID, name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_SetNumberProperty(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
pub extern fn SDL_SetFloatProperty(props: SDL_PropertiesID, name: [*c]const u8, value: f32) bool;
pub extern fn SDL_SetBooleanProperty(props: SDL_PropertiesID, name: [*c]const u8, value: bool) bool;
pub extern fn SDL_HasProperty(props: SDL_PropertiesID, name: [*c]const u8) bool;
pub extern fn SDL_GetPropertyType(props: SDL_PropertiesID, name: [*c]const u8) SDL_PropertyType;
pub extern fn SDL_GetPointerProperty(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetStringProperty(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetNumberProperty(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub extern fn SDL_GetFloatProperty(props: SDL_PropertiesID, name: [*c]const u8, default_value: f32) f32;
pub extern fn SDL_GetBooleanProperty(props: SDL_PropertiesID, name: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_ClearProperty(props: SDL_PropertiesID, name: [*c]const u8) bool;
pub const SDL_EnumeratePropertiesCallback = ?*const fn (?*anyopaque, SDL_PropertiesID, [*c]const u8) callconv(.c) void;
pub extern fn SDL_EnumerateProperties(props: SDL_PropertiesID, callback: SDL_EnumeratePropertiesCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_DestroyProperties(props: SDL_PropertiesID) void;
pub const _crt_unknown_app: c_int = 0;
pub const _crt_console_app: c_int = 1;
pub const _crt_gui_app: c_int = 2;
pub const enum__crt_app_type = c_uint;
pub const _crt_app_type = enum__crt_app_type;
pub extern fn _query_app_type() _crt_app_type;
pub extern fn _set_app_type(_Type: _crt_app_type) void;
pub const _crt_argv_no_arguments: c_int = 0;
pub const _crt_argv_unexpanded_arguments: c_int = 1;
pub const _crt_argv_expanded_arguments: c_int = 2;
pub const enum__crt_argv_mode = c_uint;
pub const _crt_argv_mode = enum__crt_argv_mode;
pub extern fn _configure_narrow_argv(mode: _crt_argv_mode) errno_t;
pub extern fn _configure_wide_argv(mode: _crt_argv_mode) errno_t;
pub extern fn _initialize_narrow_environment() c_int;
pub extern fn _initialize_wide_environment() c_int;
pub extern fn _get_initial_narrow_environment() [*c][*c]u8;
pub extern fn _get_initial_wide_environment() [*c][*c]wchar_t;
pub extern fn _get_narrow_winmain_command_line() [*c]u8;
pub extern fn _get_wide_winmain_command_line() [*c]wchar_t;
pub extern fn __p__acmdln() [*c][*c]u8;
pub extern fn __p__wcmdln() [*c][*c]wchar_t;
pub const _PVFV = ?*const fn () callconv(.c) void;
pub const _PIFV = ?*const fn () callconv(.c) c_int;
pub const _PVFI = ?*const fn (c_int) callconv(.c) void;
pub extern fn _initterm(_First: [*c]_PVFV, _Last: [*c]_PVFV) void;
pub extern fn _initterm_e(_First: [*c]_PIFV, _Last: [*c]_PIFV) c_int;
pub const struct__onexit_table_t = extern struct {
    _first: [*c]_PVFV = @import("std").mem.zeroes([*c]_PVFV),
    _last: [*c]_PVFV = @import("std").mem.zeroes([*c]_PVFV),
    _end: [*c]_PVFV = @import("std").mem.zeroes([*c]_PVFV),
};
pub const _onexit_table_t = struct__onexit_table_t;
pub const _onexit_t = ?*const fn () callconv(.c) c_int;
pub extern fn _initialize_onexit_table([*c]_onexit_table_t) c_int;
pub extern fn _register_onexit_function([*c]_onexit_table_t, _onexit_t) c_int;
pub extern fn _execute_onexit_table([*c]_onexit_table_t) c_int;
pub extern fn _crt_atexit(func: _PVFV) c_int;
pub extern fn _crt_at_quick_exit(func: _PVFV) c_int;
pub const _pid_t = c_longlong;
pub const pid_t = _pid_t;
pub const _mode_t = c_ushort;
pub const mode_t = _mode_t;
pub const useconds_t = c_uint;
pub const struct_timespec = extern struct {
    tv_sec: time_t = @import("std").mem.zeroes(time_t),
    tv_nsec: c_long = @import("std").mem.zeroes(c_long),
};
pub const struct_itimerspec = extern struct {
    it_interval: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    it_value: struct_timespec = @import("std").mem.zeroes(struct_timespec),
};
pub const _sigset_t = c_ulonglong;
pub const _beginthread_proc_type = ?*const fn (?*anyopaque) callconv(.c) void;
pub const _beginthreadex_proc_type = ?*const fn (?*anyopaque) callconv(.c) c_uint;
pub extern fn _beginthread(_StartAddress: _beginthread_proc_type, _StackSize: c_uint, _ArgList: ?*anyopaque) usize;
pub extern fn _endthread() noreturn;
pub extern fn _beginthreadex(_Security: ?*anyopaque, _StackSize: c_uint, _StartAddress: _beginthreadex_proc_type, _ArgList: ?*anyopaque, _InitFlag: c_uint, _ThrdAddr: [*c]c_uint) usize;
pub extern fn _endthreadex(_Retval: c_uint) noreturn;
pub extern fn exit(_Code: c_int) noreturn;
pub extern fn _exit(_Code: c_int) noreturn;
pub extern fn quick_exit(_Code: c_int) noreturn;
pub extern fn _Exit(c_int) noreturn;
pub extern fn abort() noreturn;
pub const _tls_callback_type = ?*const fn (?*anyopaque, c_ulong, ?*anyopaque) callconv(.c) void;
pub extern fn _register_thread_local_exe_atexit_callback(callback: _tls_callback_type) void;
pub extern fn _cexit() void;
pub extern fn _c_exit() void;
pub extern fn _getpid() c_int;
pub extern fn _cwait(_TermStat: [*c]c_int, _ProcHandle: isize, _Action: c_int) isize;
pub extern fn _execl(_Filename: [*c]const u8, _ArgList: [*c]const u8, ...) isize;
pub extern fn _execle(_Filename: [*c]const u8, _ArgList: [*c]const u8, ...) isize;
pub extern fn _execlp(_Filename: [*c]const u8, _ArgList: [*c]const u8, ...) isize;
pub extern fn _execlpe(_Filename: [*c]const u8, _ArgList: [*c]const u8, ...) isize;
pub extern fn _execv(_Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8) isize;
pub extern fn _execve(_Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8, _Env: [*c]const [*c]const u8) isize;
pub extern fn _execvp(_Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8) isize;
pub extern fn _execvpe(_Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8, _Env: [*c]const [*c]const u8) isize;
pub extern fn _spawnl(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const u8, ...) isize;
pub extern fn _spawnle(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const u8, ...) isize;
pub extern fn _spawnlp(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const u8, ...) isize;
pub extern fn _spawnlpe(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const u8, ...) isize;
pub extern fn _spawnv(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8) isize;
pub extern fn _spawnve(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8, _Env: [*c]const [*c]const u8) isize;
pub extern fn _spawnvp(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8) isize;
pub extern fn _spawnvpe(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8, _Env: [*c]const [*c]const u8) isize;
pub extern fn system(_Command: [*c]const u8) c_int;
pub extern fn _loaddll(_Filename: [*c]u8) isize;
pub extern fn _unloaddll(_Handle: isize) c_int;
pub extern fn _getdllprocaddr(_Handle: isize, _ProcedureName: [*c]u8, _Ordinal: isize) ?*const fn () callconv(.c) c_int;
pub extern fn getpid() c_int;
pub extern fn cwait(_TermStat: [*c]c_int, _ProcHandle: isize, _Action: c_int) isize;
pub extern fn execl(_Filename: [*c]const u8, _ArgList: [*c]const u8, ...) c_int;
pub extern fn execle(_Filename: [*c]const u8, _ArgList: [*c]const u8, ...) c_int;
pub extern fn execlp(_Filename: [*c]const u8, _ArgList: [*c]const u8, ...) c_int;
pub extern fn execlpe(_Filename: [*c]const u8, _ArgList: [*c]const u8, ...) c_int;
pub extern fn spawnl(c_int, _Filename: [*c]const u8, _ArgList: [*c]const u8, ...) isize;
pub extern fn spawnle(c_int, _Filename: [*c]const u8, _ArgList: [*c]const u8, ...) isize;
pub extern fn spawnlp(c_int, _Filename: [*c]const u8, _ArgList: [*c]const u8, ...) isize;
pub extern fn spawnlpe(c_int, _Filename: [*c]const u8, _ArgList: [*c]const u8, ...) isize;
pub extern fn execv(_Filename: [*c]const u8, _ArgList: [*c]const [*c]u8) c_int;
pub extern fn execve(_Filename: [*c]const u8, _ArgList: [*c]const [*c]u8, _Env: [*c]const [*c]u8) c_int;
pub extern fn execvp(_Filename: [*c]const u8, _ArgList: [*c]const [*c]u8) c_int;
pub extern fn execvpe(_Filename: [*c]const u8, _ArgList: [*c]const [*c]u8, _Env: [*c]const [*c]u8) c_int;
pub extern fn spawnv(c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]u8) isize;
pub extern fn spawnve(c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]u8, _Env: [*c]const [*c]u8) isize;
pub extern fn spawnvp(c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]u8) isize;
pub extern fn spawnvpe(c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]u8, _Env: [*c]const [*c]u8) isize;
pub const struct_SDL_Thread = opaque {};
pub const SDL_Thread = struct_SDL_Thread;
pub const SDL_ThreadID = Uint64;
pub const SDL_TLSID = SDL_AtomicInt;
pub const SDL_THREAD_PRIORITY_LOW: c_int = 0;
pub const SDL_THREAD_PRIORITY_NORMAL: c_int = 1;
pub const SDL_THREAD_PRIORITY_HIGH: c_int = 2;
pub const SDL_THREAD_PRIORITY_TIME_CRITICAL: c_int = 3;
pub const enum_SDL_ThreadPriority = c_uint;
pub const SDL_ThreadPriority = enum_SDL_ThreadPriority;
pub const SDL_THREAD_UNKNOWN: c_int = 0;
pub const SDL_THREAD_ALIVE: c_int = 1;
pub const SDL_THREAD_DETACHED: c_int = 2;
pub const SDL_THREAD_COMPLETE: c_int = 3;
pub const enum_SDL_ThreadState = c_uint;
pub const SDL_ThreadState = enum_SDL_ThreadState;
pub const SDL_ThreadFunction = ?*const fn (?*anyopaque) callconv(.c) c_int;
pub extern fn SDL_CreateThreadRuntime(@"fn": SDL_ThreadFunction, name: [*c]const u8, data: ?*anyopaque, pfnBeginThread: SDL_FunctionPointer, pfnEndThread: SDL_FunctionPointer) ?*SDL_Thread;
pub extern fn SDL_CreateThreadWithPropertiesRuntime(props: SDL_PropertiesID, pfnBeginThread: SDL_FunctionPointer, pfnEndThread: SDL_FunctionPointer) ?*SDL_Thread;
pub extern fn SDL_GetThreadName(thread: ?*SDL_Thread) [*c]const u8;
pub extern fn SDL_GetCurrentThreadID() SDL_ThreadID;
pub extern fn SDL_GetThreadID(thread: ?*SDL_Thread) SDL_ThreadID;
pub extern fn SDL_SetCurrentThreadPriority(priority: SDL_ThreadPriority) bool;
pub extern fn SDL_WaitThread(thread: ?*SDL_Thread, status: [*c]c_int) void;
pub extern fn SDL_GetThreadState(thread: ?*SDL_Thread) SDL_ThreadState;
pub extern fn SDL_DetachThread(thread: ?*SDL_Thread) void;
pub extern fn SDL_GetTLS(id: [*c]SDL_TLSID) ?*anyopaque;
pub const SDL_TLSDestructorCallback = ?*const fn (?*anyopaque) callconv(.c) void;
pub extern fn SDL_SetTLS(id: [*c]SDL_TLSID, value: ?*const anyopaque, destructor: SDL_TLSDestructorCallback) bool;
pub extern fn SDL_CleanupTLS() void;
pub const struct_SDL_Mutex = opaque {};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_CreateMutex() ?*SDL_Mutex;
pub extern fn SDL_LockMutex(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_TryLockMutex(mutex: ?*SDL_Mutex) bool;
pub extern fn SDL_UnlockMutex(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex(mutex: ?*SDL_Mutex) void;
pub const struct_SDL_RWLock = opaque {};
pub const SDL_RWLock = struct_SDL_RWLock;
pub extern fn SDL_CreateRWLock() ?*SDL_RWLock;
pub extern fn SDL_LockRWLockForReading(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_LockRWLockForWriting(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_TryLockRWLockForReading(rwlock: ?*SDL_RWLock) bool;
pub extern fn SDL_TryLockRWLockForWriting(rwlock: ?*SDL_RWLock) bool;
pub extern fn SDL_UnlockRWLock(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_DestroyRWLock(rwlock: ?*SDL_RWLock) void;
pub const struct_SDL_Semaphore = opaque {};
pub const SDL_Semaphore = struct_SDL_Semaphore;
pub extern fn SDL_CreateSemaphore(initial_value: Uint32) ?*SDL_Semaphore;
pub extern fn SDL_DestroySemaphore(sem: ?*SDL_Semaphore) void;
pub extern fn SDL_WaitSemaphore(sem: ?*SDL_Semaphore) void;
pub extern fn SDL_TryWaitSemaphore(sem: ?*SDL_Semaphore) bool;
pub extern fn SDL_WaitSemaphoreTimeout(sem: ?*SDL_Semaphore, timeoutMS: Sint32) bool;
pub extern fn SDL_SignalSemaphore(sem: ?*SDL_Semaphore) void;
pub extern fn SDL_GetSemaphoreValue(sem: ?*SDL_Semaphore) Uint32;
pub const struct_SDL_Condition = opaque {};
pub const SDL_Condition = struct_SDL_Condition;
pub extern fn SDL_CreateCondition() ?*SDL_Condition;
pub extern fn SDL_DestroyCondition(cond: ?*SDL_Condition) void;
pub extern fn SDL_SignalCondition(cond: ?*SDL_Condition) void;
pub extern fn SDL_BroadcastCondition(cond: ?*SDL_Condition) void;
pub extern fn SDL_WaitCondition(cond: ?*SDL_Condition, mutex: ?*SDL_Mutex) void;
pub extern fn SDL_WaitConditionTimeout(cond: ?*SDL_Condition, mutex: ?*SDL_Mutex, timeoutMS: Sint32) bool;
pub const SDL_INIT_STATUS_UNINITIALIZED: c_int = 0;
pub const SDL_INIT_STATUS_INITIALIZING: c_int = 1;
pub const SDL_INIT_STATUS_INITIALIZED: c_int = 2;
pub const SDL_INIT_STATUS_UNINITIALIZING: c_int = 3;
pub const enum_SDL_InitStatus = c_uint;
pub const SDL_InitStatus = enum_SDL_InitStatus;
pub const struct_SDL_InitState = extern struct {
    status: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    thread: SDL_ThreadID = @import("std").mem.zeroes(SDL_ThreadID),
    reserved: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const SDL_InitState = struct_SDL_InitState;
pub extern fn SDL_ShouldInit(state: [*c]SDL_InitState) bool;
pub extern fn SDL_ShouldQuit(state: [*c]SDL_InitState) bool;
pub extern fn SDL_SetInitialized(state: [*c]SDL_InitState, initialized: bool) void;
pub const SDL_IO_STATUS_READY: c_int = 0;
pub const SDL_IO_STATUS_ERROR: c_int = 1;
pub const SDL_IO_STATUS_EOF: c_int = 2;
pub const SDL_IO_STATUS_NOT_READY: c_int = 3;
pub const SDL_IO_STATUS_READONLY: c_int = 4;
pub const SDL_IO_STATUS_WRITEONLY: c_int = 5;
pub const enum_SDL_IOStatus = c_uint;
pub const SDL_IOStatus = enum_SDL_IOStatus;
pub const SDL_IO_SEEK_SET: c_int = 0;
pub const SDL_IO_SEEK_CUR: c_int = 1;
pub const SDL_IO_SEEK_END: c_int = 2;
pub const enum_SDL_IOWhence = c_uint;
pub const SDL_IOWhence = enum_SDL_IOWhence;
pub const struct_SDL_IOStreamInterface = extern struct {
    version: Uint32 = @import("std").mem.zeroes(Uint32),
    size: ?*const fn (?*anyopaque) callconv(.c) Sint64 = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.c) Sint64),
    seek: ?*const fn (?*anyopaque, Sint64, SDL_IOWhence) callconv(.c) Sint64 = @import("std").mem.zeroes(?*const fn (?*anyopaque, Sint64, SDL_IOWhence) callconv(.c) Sint64),
    read: ?*const fn (?*anyopaque, ?*anyopaque, usize, [*c]SDL_IOStatus) callconv(.c) usize = @import("std").mem.zeroes(?*const fn (?*anyopaque, ?*anyopaque, usize, [*c]SDL_IOStatus) callconv(.c) usize),
    write: ?*const fn (?*anyopaque, ?*const anyopaque, usize, [*c]SDL_IOStatus) callconv(.c) usize = @import("std").mem.zeroes(?*const fn (?*anyopaque, ?*const anyopaque, usize, [*c]SDL_IOStatus) callconv(.c) usize),
    flush: ?*const fn (?*anyopaque, [*c]SDL_IOStatus) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque, [*c]SDL_IOStatus) callconv(.c) bool),
    close: ?*const fn (?*anyopaque) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.c) bool),
};
pub const SDL_IOStreamInterface = struct_SDL_IOStreamInterface;
// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration
pub const struct_SDL_IOStream = opaque {};
pub const SDL_IOStream = struct_SDL_IOStream;
pub extern fn SDL_IOFromFile(file: [*c]const u8, mode: [*c]const u8) ?*SDL_IOStream;
pub extern fn SDL_IOFromMem(mem: ?*anyopaque, size: usize) ?*SDL_IOStream;
pub extern fn SDL_IOFromConstMem(mem: ?*const anyopaque, size: usize) ?*SDL_IOStream;
pub extern fn SDL_IOFromDynamicMem() ?*SDL_IOStream;
pub extern fn SDL_OpenIO(iface: [*c]const SDL_IOStreamInterface, userdata: ?*anyopaque) ?*SDL_IOStream;
pub extern fn SDL_CloseIO(context: ?*SDL_IOStream) bool;
pub extern fn SDL_GetIOProperties(context: ?*SDL_IOStream) SDL_PropertiesID;
pub extern fn SDL_GetIOStatus(context: ?*SDL_IOStream) SDL_IOStatus;
pub extern fn SDL_GetIOSize(context: ?*SDL_IOStream) Sint64;
pub extern fn SDL_SeekIO(context: ?*SDL_IOStream, offset: Sint64, whence: SDL_IOWhence) Sint64;
pub extern fn SDL_TellIO(context: ?*SDL_IOStream) Sint64;
pub extern fn SDL_ReadIO(context: ?*SDL_IOStream, ptr: ?*anyopaque, size: usize) usize;
pub extern fn SDL_WriteIO(context: ?*SDL_IOStream, ptr: ?*const anyopaque, size: usize) usize;
pub extern fn SDL_IOprintf(context: ?*SDL_IOStream, fmt: [*c]const u8, ...) usize;
pub extern fn SDL_IOvprintf(context: ?*SDL_IOStream, fmt: [*c]const u8, ap: va_list) usize;
pub extern fn SDL_FlushIO(context: ?*SDL_IOStream) bool;
pub extern fn SDL_LoadFile_IO(src: ?*SDL_IOStream, datasize: [*c]usize, closeio: bool) ?*anyopaque;
pub extern fn SDL_LoadFile(file: [*c]const u8, datasize: [*c]usize) ?*anyopaque;
pub extern fn SDL_SaveFile_IO(src: ?*SDL_IOStream, data: ?*const anyopaque, datasize: usize, closeio: bool) bool;
pub extern fn SDL_SaveFile(file: [*c]const u8, data: ?*const anyopaque, datasize: usize) bool;
pub extern fn SDL_ReadU8(src: ?*SDL_IOStream, value: [*c]Uint8) bool;
pub extern fn SDL_ReadS8(src: ?*SDL_IOStream, value: [*c]Sint8) bool;
pub extern fn SDL_ReadU16LE(src: ?*SDL_IOStream, value: [*c]Uint16) bool;
pub extern fn SDL_ReadS16LE(src: ?*SDL_IOStream, value: [*c]Sint16) bool;
pub extern fn SDL_ReadU16BE(src: ?*SDL_IOStream, value: [*c]Uint16) bool;
pub extern fn SDL_ReadS16BE(src: ?*SDL_IOStream, value: [*c]Sint16) bool;
pub extern fn SDL_ReadU32LE(src: ?*SDL_IOStream, value: [*c]Uint32) bool;
pub extern fn SDL_ReadS32LE(src: ?*SDL_IOStream, value: [*c]Sint32) bool;
pub extern fn SDL_ReadU32BE(src: ?*SDL_IOStream, value: [*c]Uint32) bool;
pub extern fn SDL_ReadS32BE(src: ?*SDL_IOStream, value: [*c]Sint32) bool;
pub extern fn SDL_ReadU64LE(src: ?*SDL_IOStream, value: [*c]Uint64) bool;
pub extern fn SDL_ReadS64LE(src: ?*SDL_IOStream, value: [*c]Sint64) bool;
pub extern fn SDL_ReadU64BE(src: ?*SDL_IOStream, value: [*c]Uint64) bool;
pub extern fn SDL_ReadS64BE(src: ?*SDL_IOStream, value: [*c]Sint64) bool;
pub extern fn SDL_WriteU8(dst: ?*SDL_IOStream, value: Uint8) bool;
pub extern fn SDL_WriteS8(dst: ?*SDL_IOStream, value: Sint8) bool;
pub extern fn SDL_WriteU16LE(dst: ?*SDL_IOStream, value: Uint16) bool;
pub extern fn SDL_WriteS16LE(dst: ?*SDL_IOStream, value: Sint16) bool;
pub extern fn SDL_WriteU16BE(dst: ?*SDL_IOStream, value: Uint16) bool;
pub extern fn SDL_WriteS16BE(dst: ?*SDL_IOStream, value: Sint16) bool;
pub extern fn SDL_WriteU32LE(dst: ?*SDL_IOStream, value: Uint32) bool;
pub extern fn SDL_WriteS32LE(dst: ?*SDL_IOStream, value: Sint32) bool;
pub extern fn SDL_WriteU32BE(dst: ?*SDL_IOStream, value: Uint32) bool;
pub extern fn SDL_WriteS32BE(dst: ?*SDL_IOStream, value: Sint32) bool;
pub extern fn SDL_WriteU64LE(dst: ?*SDL_IOStream, value: Uint64) bool;
pub extern fn SDL_WriteS64LE(dst: ?*SDL_IOStream, value: Sint64) bool;
pub extern fn SDL_WriteU64BE(dst: ?*SDL_IOStream, value: Uint64) bool;
pub extern fn SDL_WriteS64BE(dst: ?*SDL_IOStream, value: Sint64) bool;
pub const SDL_AUDIO_UNKNOWN: c_int = 0;
pub const SDL_AUDIO_U8: c_int = 8;
pub const SDL_AUDIO_S8: c_int = 32776;
pub const SDL_AUDIO_S16LE: c_int = 32784;
pub const SDL_AUDIO_S16BE: c_int = 36880;
pub const SDL_AUDIO_S32LE: c_int = 32800;
pub const SDL_AUDIO_S32BE: c_int = 36896;
pub const SDL_AUDIO_F32LE: c_int = 33056;
pub const SDL_AUDIO_F32BE: c_int = 37152;
pub const SDL_AUDIO_S16: c_int = 32784;
pub const SDL_AUDIO_S32: c_int = 32800;
pub const SDL_AUDIO_F32: c_int = 33056;
pub const enum_SDL_AudioFormat = c_uint;
pub const SDL_AudioFormat = enum_SDL_AudioFormat;
pub const SDL_AudioDeviceID = Uint32;
pub const struct_SDL_AudioSpec = extern struct {
    format: SDL_AudioFormat = @import("std").mem.zeroes(SDL_AudioFormat),
    channels: c_int = @import("std").mem.zeroes(c_int),
    freq: c_int = @import("std").mem.zeroes(c_int),
};
pub const SDL_AudioSpec = struct_SDL_AudioSpec;
pub const struct_SDL_AudioStream = opaque {};
pub const SDL_AudioStream = struct_SDL_AudioStream;
pub extern fn SDL_GetNumAudioDrivers() c_int;
pub extern fn SDL_GetAudioDriver(index: c_int) [*c]const u8;
pub extern fn SDL_GetCurrentAudioDriver() [*c]const u8;
pub extern fn SDL_GetAudioPlaybackDevices(count: [*c]c_int) [*c]SDL_AudioDeviceID;
pub extern fn SDL_GetAudioRecordingDevices(count: [*c]c_int) [*c]SDL_AudioDeviceID;
pub extern fn SDL_GetAudioDeviceName(devid: SDL_AudioDeviceID) [*c]const u8;
pub extern fn SDL_GetAudioDeviceFormat(devid: SDL_AudioDeviceID, spec: [*c]SDL_AudioSpec, sample_frames: [*c]c_int) bool;
pub extern fn SDL_GetAudioDeviceChannelMap(devid: SDL_AudioDeviceID, count: [*c]c_int) [*c]c_int;
pub extern fn SDL_OpenAudioDevice(devid: SDL_AudioDeviceID, spec: [*c]const SDL_AudioSpec) SDL_AudioDeviceID;
pub extern fn SDL_IsAudioDevicePhysical(devid: SDL_AudioDeviceID) bool;
pub extern fn SDL_IsAudioDevicePlayback(devid: SDL_AudioDeviceID) bool;
pub extern fn SDL_PauseAudioDevice(devid: SDL_AudioDeviceID) bool;
pub extern fn SDL_ResumeAudioDevice(devid: SDL_AudioDeviceID) bool;
pub extern fn SDL_AudioDevicePaused(devid: SDL_AudioDeviceID) bool;
pub extern fn SDL_GetAudioDeviceGain(devid: SDL_AudioDeviceID) f32;
pub extern fn SDL_SetAudioDeviceGain(devid: SDL_AudioDeviceID, gain: f32) bool;
pub extern fn SDL_CloseAudioDevice(devid: SDL_AudioDeviceID) void;
pub extern fn SDL_BindAudioStreams(devid: SDL_AudioDeviceID, streams: [*c]const ?*SDL_AudioStream, num_streams: c_int) bool;
pub extern fn SDL_BindAudioStream(devid: SDL_AudioDeviceID, stream: ?*SDL_AudioStream) bool;
pub extern fn SDL_UnbindAudioStreams(streams: [*c]const ?*SDL_AudioStream, num_streams: c_int) void;
pub extern fn SDL_UnbindAudioStream(stream: ?*SDL_AudioStream) void;
pub extern fn SDL_GetAudioStreamDevice(stream: ?*SDL_AudioStream) SDL_AudioDeviceID;
pub extern fn SDL_CreateAudioStream(src_spec: [*c]const SDL_AudioSpec, dst_spec: [*c]const SDL_AudioSpec) ?*SDL_AudioStream;
pub extern fn SDL_GetAudioStreamProperties(stream: ?*SDL_AudioStream) SDL_PropertiesID;
pub extern fn SDL_GetAudioStreamFormat(stream: ?*SDL_AudioStream, src_spec: [*c]SDL_AudioSpec, dst_spec: [*c]SDL_AudioSpec) bool;
pub extern fn SDL_SetAudioStreamFormat(stream: ?*SDL_AudioStream, src_spec: [*c]const SDL_AudioSpec, dst_spec: [*c]const SDL_AudioSpec) bool;
pub extern fn SDL_GetAudioStreamFrequencyRatio(stream: ?*SDL_AudioStream) f32;
pub extern fn SDL_SetAudioStreamFrequencyRatio(stream: ?*SDL_AudioStream, ratio: f32) bool;
pub extern fn SDL_GetAudioStreamGain(stream: ?*SDL_AudioStream) f32;
pub extern fn SDL_SetAudioStreamGain(stream: ?*SDL_AudioStream, gain: f32) bool;
pub extern fn SDL_GetAudioStreamInputChannelMap(stream: ?*SDL_AudioStream, count: [*c]c_int) [*c]c_int;
pub extern fn SDL_GetAudioStreamOutputChannelMap(stream: ?*SDL_AudioStream, count: [*c]c_int) [*c]c_int;
pub extern fn SDL_SetAudioStreamInputChannelMap(stream: ?*SDL_AudioStream, chmap: [*c]const c_int, count: c_int) bool;
pub extern fn SDL_SetAudioStreamOutputChannelMap(stream: ?*SDL_AudioStream, chmap: [*c]const c_int, count: c_int) bool;
pub extern fn SDL_PutAudioStreamData(stream: ?*SDL_AudioStream, buf: ?*const anyopaque, len: c_int) bool;
pub extern fn SDL_GetAudioStreamData(stream: ?*SDL_AudioStream, buf: ?*anyopaque, len: c_int) c_int;
pub extern fn SDL_GetAudioStreamAvailable(stream: ?*SDL_AudioStream) c_int;
pub extern fn SDL_GetAudioStreamQueued(stream: ?*SDL_AudioStream) c_int;
pub extern fn SDL_FlushAudioStream(stream: ?*SDL_AudioStream) bool;
pub extern fn SDL_ClearAudioStream(stream: ?*SDL_AudioStream) bool;
pub extern fn SDL_PauseAudioStreamDevice(stream: ?*SDL_AudioStream) bool;
pub extern fn SDL_ResumeAudioStreamDevice(stream: ?*SDL_AudioStream) bool;
pub extern fn SDL_AudioStreamDevicePaused(stream: ?*SDL_AudioStream) bool;
pub extern fn SDL_LockAudioStream(stream: ?*SDL_AudioStream) bool;
pub extern fn SDL_UnlockAudioStream(stream: ?*SDL_AudioStream) bool;
pub const SDL_AudioStreamCallback = ?*const fn (?*anyopaque, ?*SDL_AudioStream, c_int, c_int) callconv(.c) void;
pub extern fn SDL_SetAudioStreamGetCallback(stream: ?*SDL_AudioStream, callback: SDL_AudioStreamCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_SetAudioStreamPutCallback(stream: ?*SDL_AudioStream, callback: SDL_AudioStreamCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_DestroyAudioStream(stream: ?*SDL_AudioStream) void;
pub extern fn SDL_OpenAudioDeviceStream(devid: SDL_AudioDeviceID, spec: [*c]const SDL_AudioSpec, callback: SDL_AudioStreamCallback, userdata: ?*anyopaque) ?*SDL_AudioStream;
pub const SDL_AudioPostmixCallback = ?*const fn (?*anyopaque, [*c]const SDL_AudioSpec, [*c]f32, c_int) callconv(.c) void;
pub extern fn SDL_SetAudioPostmixCallback(devid: SDL_AudioDeviceID, callback: SDL_AudioPostmixCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_LoadWAV_IO(src: ?*SDL_IOStream, closeio: bool, spec: [*c]SDL_AudioSpec, audio_buf: [*c][*c]Uint8, audio_len: [*c]Uint32) bool;
pub extern fn SDL_LoadWAV(path: [*c]const u8, spec: [*c]SDL_AudioSpec, audio_buf: [*c][*c]Uint8, audio_len: [*c]Uint32) bool;
pub extern fn SDL_MixAudio(dst: [*c]Uint8, src: [*c]const Uint8, format: SDL_AudioFormat, len: Uint32, volume: f32) bool;
pub extern fn SDL_ConvertAudioSamples(src_spec: [*c]const SDL_AudioSpec, src_data: [*c]const Uint8, src_len: c_int, dst_spec: [*c]const SDL_AudioSpec, dst_data: [*c][*c]Uint8, dst_len: [*c]c_int) bool;
pub extern fn SDL_GetAudioFormatName(format: SDL_AudioFormat) [*c]const u8;
pub extern fn SDL_GetSilenceValueForFormat(format: SDL_AudioFormat) c_int;
pub inline fn SDL_MostSignificantBitIndex32(arg_x: Uint32) c_int {
    var x = arg_x;
    _ = &x;
    if (x == @as(Uint32, @bitCast(@as(c_int, 0)))) {
        return -@as(c_int, 1);
    }
    return @as(c_int, 31) - __builtin_clz(x);
}
pub inline fn SDL_HasExactlyOneBitSet32(arg_x: Uint32) bool {
    var x = arg_x;
    _ = &x;
    if ((x != 0) and !((x & (x -% @as(Uint32, @bitCast(@as(c_int, 1))))) != 0)) {
        return @as(c_int, 1) != 0;
    }
    return @as(c_int, 0) != 0;
}
pub const SDL_BlendMode = Uint32;
pub const SDL_BLENDOPERATION_ADD: c_int = 1;
pub const SDL_BLENDOPERATION_SUBTRACT: c_int = 2;
pub const SDL_BLENDOPERATION_REV_SUBTRACT: c_int = 3;
pub const SDL_BLENDOPERATION_MINIMUM: c_int = 4;
pub const SDL_BLENDOPERATION_MAXIMUM: c_int = 5;
pub const enum_SDL_BlendOperation = c_uint;
pub const SDL_BlendOperation = enum_SDL_BlendOperation;
pub const SDL_BLENDFACTOR_ZERO: c_int = 1;
pub const SDL_BLENDFACTOR_ONE: c_int = 2;
pub const SDL_BLENDFACTOR_SRC_COLOR: c_int = 3;
pub const SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR: c_int = 4;
pub const SDL_BLENDFACTOR_SRC_ALPHA: c_int = 5;
pub const SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA: c_int = 6;
pub const SDL_BLENDFACTOR_DST_COLOR: c_int = 7;
pub const SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR: c_int = 8;
pub const SDL_BLENDFACTOR_DST_ALPHA: c_int = 9;
pub const SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA: c_int = 10;
pub const enum_SDL_BlendFactor = c_uint;
pub const SDL_BlendFactor = enum_SDL_BlendFactor;
pub extern fn SDL_ComposeCustomBlendMode(srcColorFactor: SDL_BlendFactor, dstColorFactor: SDL_BlendFactor, colorOperation: SDL_BlendOperation, srcAlphaFactor: SDL_BlendFactor, dstAlphaFactor: SDL_BlendFactor, alphaOperation: SDL_BlendOperation) SDL_BlendMode;
pub const SDL_PIXELTYPE_UNKNOWN: c_int = 0;
pub const SDL_PIXELTYPE_INDEX1: c_int = 1;
pub const SDL_PIXELTYPE_INDEX4: c_int = 2;
pub const SDL_PIXELTYPE_INDEX8: c_int = 3;
pub const SDL_PIXELTYPE_PACKED8: c_int = 4;
pub const SDL_PIXELTYPE_PACKED16: c_int = 5;
pub const SDL_PIXELTYPE_PACKED32: c_int = 6;
pub const SDL_PIXELTYPE_ARRAYU8: c_int = 7;
pub const SDL_PIXELTYPE_ARRAYU16: c_int = 8;
pub const SDL_PIXELTYPE_ARRAYU32: c_int = 9;
pub const SDL_PIXELTYPE_ARRAYF16: c_int = 10;
pub const SDL_PIXELTYPE_ARRAYF32: c_int = 11;
pub const SDL_PIXELTYPE_INDEX2: c_int = 12;
pub const enum_SDL_PixelType = c_uint;
pub const SDL_PixelType = enum_SDL_PixelType;
pub const SDL_BITMAPORDER_NONE: c_int = 0;
pub const SDL_BITMAPORDER_4321: c_int = 1;
pub const SDL_BITMAPORDER_1234: c_int = 2;
pub const enum_SDL_BitmapOrder = c_uint;
pub const SDL_BitmapOrder = enum_SDL_BitmapOrder;
pub const SDL_PACKEDORDER_NONE: c_int = 0;
pub const SDL_PACKEDORDER_XRGB: c_int = 1;
pub const SDL_PACKEDORDER_RGBX: c_int = 2;
pub const SDL_PACKEDORDER_ARGB: c_int = 3;
pub const SDL_PACKEDORDER_RGBA: c_int = 4;
pub const SDL_PACKEDORDER_XBGR: c_int = 5;
pub const SDL_PACKEDORDER_BGRX: c_int = 6;
pub const SDL_PACKEDORDER_ABGR: c_int = 7;
pub const SDL_PACKEDORDER_BGRA: c_int = 8;
pub const enum_SDL_PackedOrder = c_uint;
pub const SDL_PackedOrder = enum_SDL_PackedOrder;
pub const SDL_ARRAYORDER_NONE: c_int = 0;
pub const SDL_ARRAYORDER_RGB: c_int = 1;
pub const SDL_ARRAYORDER_RGBA: c_int = 2;
pub const SDL_ARRAYORDER_ARGB: c_int = 3;
pub const SDL_ARRAYORDER_BGR: c_int = 4;
pub const SDL_ARRAYORDER_BGRA: c_int = 5;
pub const SDL_ARRAYORDER_ABGR: c_int = 6;
pub const enum_SDL_ArrayOrder = c_uint;
pub const SDL_ArrayOrder = enum_SDL_ArrayOrder;
pub const SDL_PACKEDLAYOUT_NONE: c_int = 0;
pub const SDL_PACKEDLAYOUT_332: c_int = 1;
pub const SDL_PACKEDLAYOUT_4444: c_int = 2;
pub const SDL_PACKEDLAYOUT_1555: c_int = 3;
pub const SDL_PACKEDLAYOUT_5551: c_int = 4;
pub const SDL_PACKEDLAYOUT_565: c_int = 5;
pub const SDL_PACKEDLAYOUT_8888: c_int = 6;
pub const SDL_PACKEDLAYOUT_2101010: c_int = 7;
pub const SDL_PACKEDLAYOUT_1010102: c_int = 8;
pub const enum_SDL_PackedLayout = c_uint;
pub const SDL_PackedLayout = enum_SDL_PackedLayout;
pub const SDL_PIXELFORMAT_UNKNOWN: c_int = 0;
pub const SDL_PIXELFORMAT_INDEX1LSB: c_int = 286261504;
pub const SDL_PIXELFORMAT_INDEX1MSB: c_int = 287310080;
pub const SDL_PIXELFORMAT_INDEX2LSB: c_int = 470811136;
pub const SDL_PIXELFORMAT_INDEX2MSB: c_int = 471859712;
pub const SDL_PIXELFORMAT_INDEX4LSB: c_int = 303039488;
pub const SDL_PIXELFORMAT_INDEX4MSB: c_int = 304088064;
pub const SDL_PIXELFORMAT_INDEX8: c_int = 318769153;
pub const SDL_PIXELFORMAT_RGB332: c_int = 336660481;
pub const SDL_PIXELFORMAT_XRGB4444: c_int = 353504258;
pub const SDL_PIXELFORMAT_XBGR4444: c_int = 357698562;
pub const SDL_PIXELFORMAT_XRGB1555: c_int = 353570562;
pub const SDL_PIXELFORMAT_XBGR1555: c_int = 357764866;
pub const SDL_PIXELFORMAT_ARGB4444: c_int = 355602434;
pub const SDL_PIXELFORMAT_RGBA4444: c_int = 356651010;
pub const SDL_PIXELFORMAT_ABGR4444: c_int = 359796738;
pub const SDL_PIXELFORMAT_BGRA4444: c_int = 360845314;
pub const SDL_PIXELFORMAT_ARGB1555: c_int = 355667970;
pub const SDL_PIXELFORMAT_RGBA5551: c_int = 356782082;
pub const SDL_PIXELFORMAT_ABGR1555: c_int = 359862274;
pub const SDL_PIXELFORMAT_BGRA5551: c_int = 360976386;
pub const SDL_PIXELFORMAT_RGB565: c_int = 353701890;
pub const SDL_PIXELFORMAT_BGR565: c_int = 357896194;
pub const SDL_PIXELFORMAT_RGB24: c_int = 386930691;
pub const SDL_PIXELFORMAT_BGR24: c_int = 390076419;
pub const SDL_PIXELFORMAT_XRGB8888: c_int = 370546692;
pub const SDL_PIXELFORMAT_RGBX8888: c_int = 371595268;
pub const SDL_PIXELFORMAT_XBGR8888: c_int = 374740996;
pub const SDL_PIXELFORMAT_BGRX8888: c_int = 375789572;
pub const SDL_PIXELFORMAT_ARGB8888: c_int = 372645892;
pub const SDL_PIXELFORMAT_RGBA8888: c_int = 373694468;
pub const SDL_PIXELFORMAT_ABGR8888: c_int = 376840196;
pub const SDL_PIXELFORMAT_BGRA8888: c_int = 377888772;
pub const SDL_PIXELFORMAT_XRGB2101010: c_int = 370614276;
pub const SDL_PIXELFORMAT_XBGR2101010: c_int = 374808580;
pub const SDL_PIXELFORMAT_ARGB2101010: c_int = 372711428;
pub const SDL_PIXELFORMAT_ABGR2101010: c_int = 376905732;
pub const SDL_PIXELFORMAT_RGB48: c_int = 403714054;
pub const SDL_PIXELFORMAT_BGR48: c_int = 406859782;
pub const SDL_PIXELFORMAT_RGBA64: c_int = 404766728;
pub const SDL_PIXELFORMAT_ARGB64: c_int = 405815304;
pub const SDL_PIXELFORMAT_BGRA64: c_int = 407912456;
pub const SDL_PIXELFORMAT_ABGR64: c_int = 408961032;
pub const SDL_PIXELFORMAT_RGB48_FLOAT: c_int = 437268486;
pub const SDL_PIXELFORMAT_BGR48_FLOAT: c_int = 440414214;
pub const SDL_PIXELFORMAT_RGBA64_FLOAT: c_int = 438321160;
pub const SDL_PIXELFORMAT_ARGB64_FLOAT: c_int = 439369736;
pub const SDL_PIXELFORMAT_BGRA64_FLOAT: c_int = 441466888;
pub const SDL_PIXELFORMAT_ABGR64_FLOAT: c_int = 442515464;
pub const SDL_PIXELFORMAT_RGB96_FLOAT: c_int = 454057996;
pub const SDL_PIXELFORMAT_BGR96_FLOAT: c_int = 457203724;
pub const SDL_PIXELFORMAT_RGBA128_FLOAT: c_int = 455114768;
pub const SDL_PIXELFORMAT_ARGB128_FLOAT: c_int = 456163344;
pub const SDL_PIXELFORMAT_BGRA128_FLOAT: c_int = 458260496;
pub const SDL_PIXELFORMAT_ABGR128_FLOAT: c_int = 459309072;
pub const SDL_PIXELFORMAT_YV12: c_int = 842094169;
pub const SDL_PIXELFORMAT_IYUV: c_int = 1448433993;
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_UYVY: c_int = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: c_int = 1431918169;
pub const SDL_PIXELFORMAT_NV12: c_int = 842094158;
pub const SDL_PIXELFORMAT_NV21: c_int = 825382478;
pub const SDL_PIXELFORMAT_P010: c_int = 808530000;
pub const SDL_PIXELFORMAT_EXTERNAL_OES: c_int = 542328143;
pub const SDL_PIXELFORMAT_MJPG: c_int = 1196444237;
pub const SDL_PIXELFORMAT_RGBA32: c_int = 376840196;
pub const SDL_PIXELFORMAT_ARGB32: c_int = 377888772;
pub const SDL_PIXELFORMAT_BGRA32: c_int = 372645892;
pub const SDL_PIXELFORMAT_ABGR32: c_int = 373694468;
pub const SDL_PIXELFORMAT_RGBX32: c_int = 374740996;
pub const SDL_PIXELFORMAT_XRGB32: c_int = 375789572;
pub const SDL_PIXELFORMAT_BGRX32: c_int = 370546692;
pub const SDL_PIXELFORMAT_XBGR32: c_int = 371595268;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
pub const SDL_COLOR_TYPE_UNKNOWN: c_int = 0;
pub const SDL_COLOR_TYPE_RGB: c_int = 1;
pub const SDL_COLOR_TYPE_YCBCR: c_int = 2;
pub const enum_SDL_ColorType = c_uint;
pub const SDL_ColorType = enum_SDL_ColorType;
pub const SDL_COLOR_RANGE_UNKNOWN: c_int = 0;
pub const SDL_COLOR_RANGE_LIMITED: c_int = 1;
pub const SDL_COLOR_RANGE_FULL: c_int = 2;
pub const enum_SDL_ColorRange = c_uint;
pub const SDL_ColorRange = enum_SDL_ColorRange;
pub const SDL_COLOR_PRIMARIES_UNKNOWN: c_int = 0;
pub const SDL_COLOR_PRIMARIES_BT709: c_int = 1;
pub const SDL_COLOR_PRIMARIES_UNSPECIFIED: c_int = 2;
pub const SDL_COLOR_PRIMARIES_BT470M: c_int = 4;
pub const SDL_COLOR_PRIMARIES_BT470BG: c_int = 5;
pub const SDL_COLOR_PRIMARIES_BT601: c_int = 6;
pub const SDL_COLOR_PRIMARIES_SMPTE240: c_int = 7;
pub const SDL_COLOR_PRIMARIES_GENERIC_FILM: c_int = 8;
pub const SDL_COLOR_PRIMARIES_BT2020: c_int = 9;
pub const SDL_COLOR_PRIMARIES_XYZ: c_int = 10;
pub const SDL_COLOR_PRIMARIES_SMPTE431: c_int = 11;
pub const SDL_COLOR_PRIMARIES_SMPTE432: c_int = 12;
pub const SDL_COLOR_PRIMARIES_EBU3213: c_int = 22;
pub const SDL_COLOR_PRIMARIES_CUSTOM: c_int = 31;
pub const enum_SDL_ColorPrimaries = c_uint;
pub const SDL_ColorPrimaries = enum_SDL_ColorPrimaries;
pub const SDL_TRANSFER_CHARACTERISTICS_UNKNOWN: c_int = 0;
pub const SDL_TRANSFER_CHARACTERISTICS_BT709: c_int = 1;
pub const SDL_TRANSFER_CHARACTERISTICS_UNSPECIFIED: c_int = 2;
pub const SDL_TRANSFER_CHARACTERISTICS_GAMMA22: c_int = 4;
pub const SDL_TRANSFER_CHARACTERISTICS_GAMMA28: c_int = 5;
pub const SDL_TRANSFER_CHARACTERISTICS_BT601: c_int = 6;
pub const SDL_TRANSFER_CHARACTERISTICS_SMPTE240: c_int = 7;
pub const SDL_TRANSFER_CHARACTERISTICS_LINEAR: c_int = 8;
pub const SDL_TRANSFER_CHARACTERISTICS_LOG100: c_int = 9;
pub const SDL_TRANSFER_CHARACTERISTICS_LOG100_SQRT10: c_int = 10;
pub const SDL_TRANSFER_CHARACTERISTICS_IEC61966: c_int = 11;
pub const SDL_TRANSFER_CHARACTERISTICS_BT1361: c_int = 12;
pub const SDL_TRANSFER_CHARACTERISTICS_SRGB: c_int = 13;
pub const SDL_TRANSFER_CHARACTERISTICS_BT2020_10BIT: c_int = 14;
pub const SDL_TRANSFER_CHARACTERISTICS_BT2020_12BIT: c_int = 15;
pub const SDL_TRANSFER_CHARACTERISTICS_PQ: c_int = 16;
pub const SDL_TRANSFER_CHARACTERISTICS_SMPTE428: c_int = 17;
pub const SDL_TRANSFER_CHARACTERISTICS_HLG: c_int = 18;
pub const SDL_TRANSFER_CHARACTERISTICS_CUSTOM: c_int = 31;
pub const enum_SDL_TransferCharacteristics = c_uint;
pub const SDL_TransferCharacteristics = enum_SDL_TransferCharacteristics;
pub const SDL_MATRIX_COEFFICIENTS_IDENTITY: c_int = 0;
pub const SDL_MATRIX_COEFFICIENTS_BT709: c_int = 1;
pub const SDL_MATRIX_COEFFICIENTS_UNSPECIFIED: c_int = 2;
pub const SDL_MATRIX_COEFFICIENTS_FCC: c_int = 4;
pub const SDL_MATRIX_COEFFICIENTS_BT470BG: c_int = 5;
pub const SDL_MATRIX_COEFFICIENTS_BT601: c_int = 6;
pub const SDL_MATRIX_COEFFICIENTS_SMPTE240: c_int = 7;
pub const SDL_MATRIX_COEFFICIENTS_YCGCO: c_int = 8;
pub const SDL_MATRIX_COEFFICIENTS_BT2020_NCL: c_int = 9;
pub const SDL_MATRIX_COEFFICIENTS_BT2020_CL: c_int = 10;
pub const SDL_MATRIX_COEFFICIENTS_SMPTE2085: c_int = 11;
pub const SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL: c_int = 12;
pub const SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL: c_int = 13;
pub const SDL_MATRIX_COEFFICIENTS_ICTCP: c_int = 14;
pub const SDL_MATRIX_COEFFICIENTS_CUSTOM: c_int = 31;
pub const enum_SDL_MatrixCoefficients = c_uint;
pub const SDL_MatrixCoefficients = enum_SDL_MatrixCoefficients;
pub const SDL_CHROMA_LOCATION_NONE: c_int = 0;
pub const SDL_CHROMA_LOCATION_LEFT: c_int = 1;
pub const SDL_CHROMA_LOCATION_CENTER: c_int = 2;
pub const SDL_CHROMA_LOCATION_TOPLEFT: c_int = 3;
pub const enum_SDL_ChromaLocation = c_uint;
pub const SDL_ChromaLocation = enum_SDL_ChromaLocation;
pub const SDL_COLORSPACE_UNKNOWN: c_int = 0;
pub const SDL_COLORSPACE_SRGB: c_int = 301991328;
pub const SDL_COLORSPACE_SRGB_LINEAR: c_int = 301991168;
pub const SDL_COLORSPACE_HDR10: c_int = 301999616;
pub const SDL_COLORSPACE_JPEG: c_int = 570426566;
pub const SDL_COLORSPACE_BT601_LIMITED: c_int = 554703046;
pub const SDL_COLORSPACE_BT601_FULL: c_int = 571480262;
pub const SDL_COLORSPACE_BT709_LIMITED: c_int = 554697761;
pub const SDL_COLORSPACE_BT709_FULL: c_int = 571474977;
pub const SDL_COLORSPACE_BT2020_LIMITED: c_int = 554706441;
pub const SDL_COLORSPACE_BT2020_FULL: c_int = 571483657;
pub const SDL_COLORSPACE_RGB_DEFAULT: c_int = 301991328;
pub const SDL_COLORSPACE_YUV_DEFAULT: c_int = 570426566;
pub const enum_SDL_Colorspace = c_uint;
pub const SDL_Colorspace = enum_SDL_Colorspace;
pub const struct_SDL_Color = extern struct {
    r: Uint8 = @import("std").mem.zeroes(Uint8),
    g: Uint8 = @import("std").mem.zeroes(Uint8),
    b: Uint8 = @import("std").mem.zeroes(Uint8),
    a: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_Color = struct_SDL_Color;
pub const struct_SDL_FColor = extern struct {
    r: f32 = @import("std").mem.zeroes(f32),
    g: f32 = @import("std").mem.zeroes(f32),
    b: f32 = @import("std").mem.zeroes(f32),
    a: f32 = @import("std").mem.zeroes(f32),
};
pub const SDL_FColor = struct_SDL_FColor;
pub const struct_SDL_Palette = extern struct {
    ncolors: c_int = @import("std").mem.zeroes(c_int),
    colors: [*c]SDL_Color = @import("std").mem.zeroes([*c]SDL_Color),
    version: Uint32 = @import("std").mem.zeroes(Uint32),
    refcount: c_int = @import("std").mem.zeroes(c_int),
};
pub const SDL_Palette = struct_SDL_Palette;
pub const struct_SDL_PixelFormatDetails = extern struct {
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    bits_per_pixel: Uint8 = @import("std").mem.zeroes(Uint8),
    bytes_per_pixel: Uint8 = @import("std").mem.zeroes(Uint8),
    padding: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    Rmask: Uint32 = @import("std").mem.zeroes(Uint32),
    Gmask: Uint32 = @import("std").mem.zeroes(Uint32),
    Bmask: Uint32 = @import("std").mem.zeroes(Uint32),
    Amask: Uint32 = @import("std").mem.zeroes(Uint32),
    Rbits: Uint8 = @import("std").mem.zeroes(Uint8),
    Gbits: Uint8 = @import("std").mem.zeroes(Uint8),
    Bbits: Uint8 = @import("std").mem.zeroes(Uint8),
    Abits: Uint8 = @import("std").mem.zeroes(Uint8),
    Rshift: Uint8 = @import("std").mem.zeroes(Uint8),
    Gshift: Uint8 = @import("std").mem.zeroes(Uint8),
    Bshift: Uint8 = @import("std").mem.zeroes(Uint8),
    Ashift: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_PixelFormatDetails = struct_SDL_PixelFormatDetails;
pub extern fn SDL_GetPixelFormatName(format: SDL_PixelFormat) [*c]const u8;
pub extern fn SDL_GetMasksForPixelFormat(format: SDL_PixelFormat, bpp: [*c]c_int, Rmask: [*c]Uint32, Gmask: [*c]Uint32, Bmask: [*c]Uint32, Amask: [*c]Uint32) bool;
pub extern fn SDL_GetPixelFormatForMasks(bpp: c_int, Rmask: Uint32, Gmask: Uint32, Bmask: Uint32, Amask: Uint32) SDL_PixelFormat;
pub extern fn SDL_GetPixelFormatDetails(format: SDL_PixelFormat) [*c]const SDL_PixelFormatDetails;
pub extern fn SDL_CreatePalette(ncolors: c_int) [*c]SDL_Palette;
pub extern fn SDL_SetPaletteColors(palette: [*c]SDL_Palette, colors: [*c]const SDL_Color, firstcolor: c_int, ncolors: c_int) bool;
pub extern fn SDL_DestroyPalette(palette: [*c]SDL_Palette) void;
pub extern fn SDL_MapRGB(format: [*c]const SDL_PixelFormatDetails, palette: [*c]const SDL_Palette, r: Uint8, g: Uint8, b: Uint8) Uint32;
pub extern fn SDL_MapRGBA(format: [*c]const SDL_PixelFormatDetails, palette: [*c]const SDL_Palette, r: Uint8, g: Uint8, b: Uint8, a: Uint8) Uint32;
pub extern fn SDL_GetRGB(pixel: Uint32, format: [*c]const SDL_PixelFormatDetails, palette: [*c]const SDL_Palette, r: [*c]Uint8, g: [*c]Uint8, b: [*c]Uint8) void;
pub extern fn SDL_GetRGBA(pixel: Uint32, format: [*c]const SDL_PixelFormatDetails, palette: [*c]const SDL_Palette, r: [*c]Uint8, g: [*c]Uint8, b: [*c]Uint8, a: [*c]Uint8) void;
pub const struct_SDL_Point = extern struct {
    x: c_int = @import("std").mem.zeroes(c_int),
    y: c_int = @import("std").mem.zeroes(c_int),
};
pub const SDL_Point = struct_SDL_Point;
pub const struct_SDL_FPoint = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
};
pub const SDL_FPoint = struct_SDL_FPoint;
pub const struct_SDL_Rect = extern struct {
    x: c_int = @import("std").mem.zeroes(c_int),
    y: c_int = @import("std").mem.zeroes(c_int),
    w: c_int = @import("std").mem.zeroes(c_int),
    h: c_int = @import("std").mem.zeroes(c_int),
};
pub const SDL_Rect = struct_SDL_Rect;
pub const struct_SDL_FRect = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    w: f32 = @import("std").mem.zeroes(f32),
    h: f32 = @import("std").mem.zeroes(f32),
};
pub const SDL_FRect = struct_SDL_FRect;
pub inline fn SDL_RectToFRect(arg_rect: [*c]const SDL_Rect, arg_frect: [*c]SDL_FRect) void {
    var rect = arg_rect;
    _ = &rect;
    var frect = arg_frect;
    _ = &frect;
    frect.*.x = @as(f32, @floatFromInt(rect.*.x));
    frect.*.y = @as(f32, @floatFromInt(rect.*.y));
    frect.*.w = @as(f32, @floatFromInt(rect.*.w));
    frect.*.h = @as(f32, @floatFromInt(rect.*.h));
}
pub inline fn SDL_PointInRect(arg_p: [*c]const SDL_Point, arg_r: [*c]const SDL_Rect) bool {
    var p = arg_p;
    _ = &p;
    var r = arg_r;
    _ = &r;
    return (if ((((((p != null) and (r != null)) and (p.*.x >= r.*.x)) and (p.*.x < (r.*.x + r.*.w))) and (p.*.y >= r.*.y)) and (p.*.y < (r.*.y + r.*.h))) @as(c_int, 1) else @as(c_int, 0)) != 0;
}
pub inline fn SDL_RectEmpty(arg_r: [*c]const SDL_Rect) bool {
    var r = arg_r;
    _ = &r;
    return (if ((!(r != null) or (r.*.w <= @as(c_int, 0))) or (r.*.h <= @as(c_int, 0))) @as(c_int, 1) else @as(c_int, 0)) != 0;
}
pub inline fn SDL_RectsEqual(arg_a: [*c]const SDL_Rect, arg_b: [*c]const SDL_Rect) bool {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    return (if ((((((a != null) and (b != null)) and (a.*.x == b.*.x)) and (a.*.y == b.*.y)) and (a.*.w == b.*.w)) and (a.*.h == b.*.h)) @as(c_int, 1) else @as(c_int, 0)) != 0;
}
pub extern fn SDL_HasRectIntersection(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect) bool;
pub extern fn SDL_GetRectIntersection(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect, result: [*c]SDL_Rect) bool;
pub extern fn SDL_GetRectUnion(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect, result: [*c]SDL_Rect) bool;
pub extern fn SDL_GetRectEnclosingPoints(points: [*c]const SDL_Point, count: c_int, clip: [*c]const SDL_Rect, result: [*c]SDL_Rect) bool;
pub extern fn SDL_GetRectAndLineIntersection(rect: [*c]const SDL_Rect, X1: [*c]c_int, Y1: [*c]c_int, X2: [*c]c_int, Y2: [*c]c_int) bool;
pub inline fn SDL_PointInRectFloat(arg_p: [*c]const SDL_FPoint, arg_r: [*c]const SDL_FRect) bool {
    var p = arg_p;
    _ = &p;
    var r = arg_r;
    _ = &r;
    return (if ((((((p != null) and (r != null)) and (p.*.x >= r.*.x)) and (p.*.x <= (r.*.x + r.*.w))) and (p.*.y >= r.*.y)) and (p.*.y <= (r.*.y + r.*.h))) @as(c_int, 1) else @as(c_int, 0)) != 0;
}
pub inline fn SDL_RectEmptyFloat(arg_r: [*c]const SDL_FRect) bool {
    var r = arg_r;
    _ = &r;
    return (if ((!(r != null) or (r.*.w < 0.0)) or (r.*.h < 0.0)) @as(c_int, 1) else @as(c_int, 0)) != 0;
}
pub inline fn SDL_RectsEqualEpsilon(arg_a: [*c]const SDL_FRect, arg_b: [*c]const SDL_FRect, arg_epsilon: f32) bool {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    var epsilon = arg_epsilon;
    _ = &epsilon;
    return (if (((a != null) and (b != null)) and ((a == b) or ((((SDL_fabsf(a.*.x - b.*.x) <= epsilon) and (SDL_fabsf(a.*.y - b.*.y) <= epsilon)) and (SDL_fabsf(a.*.w - b.*.w) <= epsilon)) and (SDL_fabsf(a.*.h - b.*.h) <= epsilon)))) @as(c_int, 1) else @as(c_int, 0)) != 0;
}
pub inline fn SDL_RectsEqualFloat(arg_a: [*c]const SDL_FRect, arg_b: [*c]const SDL_FRect) bool {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    return SDL_RectsEqualEpsilon(a, b, 0.00000011920928955078125);
}
pub extern fn SDL_HasRectIntersectionFloat(A: [*c]const SDL_FRect, B: [*c]const SDL_FRect) bool;
pub extern fn SDL_GetRectIntersectionFloat(A: [*c]const SDL_FRect, B: [*c]const SDL_FRect, result: [*c]SDL_FRect) bool;
pub extern fn SDL_GetRectUnionFloat(A: [*c]const SDL_FRect, B: [*c]const SDL_FRect, result: [*c]SDL_FRect) bool;
pub extern fn SDL_GetRectEnclosingPointsFloat(points: [*c]const SDL_FPoint, count: c_int, clip: [*c]const SDL_FRect, result: [*c]SDL_FRect) bool;
pub extern fn SDL_GetRectAndLineIntersectionFloat(rect: [*c]const SDL_FRect, X1: [*c]f32, Y1: [*c]f32, X2: [*c]f32, Y2: [*c]f32) bool;
pub const SDL_SurfaceFlags = Uint32;
pub const SDL_SCALEMODE_INVALID: c_int = -1;
pub const SDL_SCALEMODE_NEAREST: c_int = 0;
pub const SDL_SCALEMODE_LINEAR: c_int = 1;
pub const enum_SDL_ScaleMode = c_int;
pub const SDL_ScaleMode = enum_SDL_ScaleMode;
pub const SDL_FLIP_NONE: c_int = 0;
pub const SDL_FLIP_HORIZONTAL: c_int = 1;
pub const SDL_FLIP_VERTICAL: c_int = 2;
pub const enum_SDL_FlipMode = c_uint;
pub const SDL_FlipMode = enum_SDL_FlipMode;
pub const struct_SDL_Surface = extern struct {
    flags: SDL_SurfaceFlags = @import("std").mem.zeroes(SDL_SurfaceFlags),
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = @import("std").mem.zeroes(c_int),
    h: c_int = @import("std").mem.zeroes(c_int),
    pitch: c_int = @import("std").mem.zeroes(c_int),
    pixels: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    refcount: c_int = @import("std").mem.zeroes(c_int),
    reserved: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const SDL_Surface = struct_SDL_Surface;
pub extern fn SDL_CreateSurface(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface;
pub extern fn SDL_CreateSurfaceFrom(width: c_int, height: c_int, format: SDL_PixelFormat, pixels: ?*anyopaque, pitch: c_int) [*c]SDL_Surface;
pub extern fn SDL_DestroySurface(surface: [*c]SDL_Surface) void;
pub extern fn SDL_GetSurfaceProperties(surface: [*c]SDL_Surface) SDL_PropertiesID;
pub extern fn SDL_SetSurfaceColorspace(surface: [*c]SDL_Surface, colorspace: SDL_Colorspace) bool;
pub extern fn SDL_GetSurfaceColorspace(surface: [*c]SDL_Surface) SDL_Colorspace;
pub extern fn SDL_CreateSurfacePalette(surface: [*c]SDL_Surface) [*c]SDL_Palette;
pub extern fn SDL_SetSurfacePalette(surface: [*c]SDL_Surface, palette: [*c]SDL_Palette) bool;
pub extern fn SDL_GetSurfacePalette(surface: [*c]SDL_Surface) [*c]SDL_Palette;
pub extern fn SDL_AddSurfaceAlternateImage(surface: [*c]SDL_Surface, image: [*c]SDL_Surface) bool;
pub extern fn SDL_SurfaceHasAlternateImages(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_GetSurfaceImages(surface: [*c]SDL_Surface, count: [*c]c_int) [*c][*c]SDL_Surface;
pub extern fn SDL_RemoveSurfaceAlternateImages(surface: [*c]SDL_Surface) void;
pub extern fn SDL_LockSurface(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_UnlockSurface(surface: [*c]SDL_Surface) void;
pub extern fn SDL_LoadBMP_IO(src: ?*SDL_IOStream, closeio: bool) [*c]SDL_Surface;
pub extern fn SDL_LoadBMP(file: [*c]const u8) [*c]SDL_Surface;
pub extern fn SDL_SaveBMP_IO(surface: [*c]SDL_Surface, dst: ?*SDL_IOStream, closeio: bool) bool;
pub extern fn SDL_SaveBMP(surface: [*c]SDL_Surface, file: [*c]const u8) bool;
pub extern fn SDL_SetSurfaceRLE(surface: [*c]SDL_Surface, enabled: bool) bool;
pub extern fn SDL_SurfaceHasRLE(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_SetSurfaceColorKey(surface: [*c]SDL_Surface, enabled: bool, key: Uint32) bool;
pub extern fn SDL_SurfaceHasColorKey(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_GetSurfaceColorKey(surface: [*c]SDL_Surface, key: [*c]Uint32) bool;
pub extern fn SDL_SetSurfaceColorMod(surface: [*c]SDL_Surface, r: Uint8, g: Uint8, b: Uint8) bool;
pub extern fn SDL_GetSurfaceColorMod(surface: [*c]SDL_Surface, r: [*c]Uint8, g: [*c]Uint8, b: [*c]Uint8) bool;
pub extern fn SDL_SetSurfaceAlphaMod(surface: [*c]SDL_Surface, alpha: Uint8) bool;
pub extern fn SDL_GetSurfaceAlphaMod(surface: [*c]SDL_Surface, alpha: [*c]Uint8) bool;
pub extern fn SDL_SetSurfaceBlendMode(surface: [*c]SDL_Surface, blendMode: SDL_BlendMode) bool;
pub extern fn SDL_GetSurfaceBlendMode(surface: [*c]SDL_Surface, blendMode: [*c]SDL_BlendMode) bool;
pub extern fn SDL_SetSurfaceClipRect(surface: [*c]SDL_Surface, rect: [*c]const SDL_Rect) bool;
pub extern fn SDL_GetSurfaceClipRect(surface: [*c]SDL_Surface, rect: [*c]SDL_Rect) bool;
pub extern fn SDL_FlipSurface(surface: [*c]SDL_Surface, flip: SDL_FlipMode) bool;
pub extern fn SDL_DuplicateSurface(surface: [*c]SDL_Surface) [*c]SDL_Surface;
pub extern fn SDL_ScaleSurface(surface: [*c]SDL_Surface, width: c_int, height: c_int, scaleMode: SDL_ScaleMode) [*c]SDL_Surface;
pub extern fn SDL_ConvertSurface(surface: [*c]SDL_Surface, format: SDL_PixelFormat) [*c]SDL_Surface;
pub extern fn SDL_ConvertSurfaceAndColorspace(surface: [*c]SDL_Surface, format: SDL_PixelFormat, palette: [*c]SDL_Palette, colorspace: SDL_Colorspace, props: SDL_PropertiesID) [*c]SDL_Surface;
pub extern fn SDL_ConvertPixels(width: c_int, height: c_int, src_format: SDL_PixelFormat, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int) bool;
pub extern fn SDL_ConvertPixelsAndColorspace(width: c_int, height: c_int, src_format: SDL_PixelFormat, src_colorspace: SDL_Colorspace, src_properties: SDL_PropertiesID, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst_colorspace: SDL_Colorspace, dst_properties: SDL_PropertiesID, dst: ?*anyopaque, dst_pitch: c_int) bool;
pub extern fn SDL_PremultiplyAlpha(width: c_int, height: c_int, src_format: SDL_PixelFormat, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int, linear: bool) bool;
pub extern fn SDL_PremultiplySurfaceAlpha(surface: [*c]SDL_Surface, linear: bool) bool;
pub extern fn SDL_ClearSurface(surface: [*c]SDL_Surface, r: f32, g: f32, b: f32, a: f32) bool;
pub extern fn SDL_FillSurfaceRect(dst: [*c]SDL_Surface, rect: [*c]const SDL_Rect, color: Uint32) bool;
pub extern fn SDL_FillSurfaceRects(dst: [*c]SDL_Surface, rects: [*c]const SDL_Rect, count: c_int, color: Uint32) bool;
pub extern fn SDL_BlitSurface(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) bool;
pub extern fn SDL_BlitSurfaceUnchecked(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) bool;
pub extern fn SDL_BlitSurfaceScaled(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect, scaleMode: SDL_ScaleMode) bool;
pub extern fn SDL_BlitSurfaceUncheckedScaled(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect, scaleMode: SDL_ScaleMode) bool;
pub extern fn SDL_StretchSurface(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect, scaleMode: SDL_ScaleMode) bool;
pub extern fn SDL_BlitSurfaceTiled(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) bool;
pub extern fn SDL_BlitSurfaceTiledWithScale(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, scale: f32, scaleMode: SDL_ScaleMode, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) bool;
pub extern fn SDL_BlitSurface9Grid(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, left_width: c_int, right_width: c_int, top_height: c_int, bottom_height: c_int, scale: f32, scaleMode: SDL_ScaleMode, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) bool;
pub extern fn SDL_MapSurfaceRGB(surface: [*c]SDL_Surface, r: Uint8, g: Uint8, b: Uint8) Uint32;
pub extern fn SDL_MapSurfaceRGBA(surface: [*c]SDL_Surface, r: Uint8, g: Uint8, b: Uint8, a: Uint8) Uint32;
pub extern fn SDL_ReadSurfacePixel(surface: [*c]SDL_Surface, x: c_int, y: c_int, r: [*c]Uint8, g: [*c]Uint8, b: [*c]Uint8, a: [*c]Uint8) bool;
pub extern fn SDL_ReadSurfacePixelFloat(surface: [*c]SDL_Surface, x: c_int, y: c_int, r: [*c]f32, g: [*c]f32, b: [*c]f32, a: [*c]f32) bool;
pub extern fn SDL_WriteSurfacePixel(surface: [*c]SDL_Surface, x: c_int, y: c_int, r: Uint8, g: Uint8, b: Uint8, a: Uint8) bool;
pub extern fn SDL_WriteSurfacePixelFloat(surface: [*c]SDL_Surface, x: c_int, y: c_int, r: f32, g: f32, b: f32, a: f32) bool;
pub const SDL_CameraID = Uint32;
pub const struct_SDL_Camera = opaque {};
pub const SDL_Camera = struct_SDL_Camera;
pub const struct_SDL_CameraSpec = extern struct {
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    width: c_int = @import("std").mem.zeroes(c_int),
    height: c_int = @import("std").mem.zeroes(c_int),
    framerate_numerator: c_int = @import("std").mem.zeroes(c_int),
    framerate_denominator: c_int = @import("std").mem.zeroes(c_int),
};
pub const SDL_CameraSpec = struct_SDL_CameraSpec;
pub const SDL_CAMERA_POSITION_UNKNOWN: c_int = 0;
pub const SDL_CAMERA_POSITION_FRONT_FACING: c_int = 1;
pub const SDL_CAMERA_POSITION_BACK_FACING: c_int = 2;
pub const enum_SDL_CameraPosition = c_uint;
pub const SDL_CameraPosition = enum_SDL_CameraPosition;
pub extern fn SDL_GetNumCameraDrivers() c_int;
pub extern fn SDL_GetCameraDriver(index: c_int) [*c]const u8;
pub extern fn SDL_GetCurrentCameraDriver() [*c]const u8;
pub extern fn SDL_GetCameras(count: [*c]c_int) [*c]SDL_CameraID;
pub extern fn SDL_GetCameraSupportedFormats(instance_id: SDL_CameraID, count: [*c]c_int) [*c][*c]SDL_CameraSpec;
pub extern fn SDL_GetCameraName(instance_id: SDL_CameraID) [*c]const u8;
pub extern fn SDL_GetCameraPosition(instance_id: SDL_CameraID) SDL_CameraPosition;
pub extern fn SDL_OpenCamera(instance_id: SDL_CameraID, spec: [*c]const SDL_CameraSpec) ?*SDL_Camera;
pub extern fn SDL_GetCameraPermissionState(camera: ?*SDL_Camera) c_int;
pub extern fn SDL_GetCameraID(camera: ?*SDL_Camera) SDL_CameraID;
pub extern fn SDL_GetCameraProperties(camera: ?*SDL_Camera) SDL_PropertiesID;
pub extern fn SDL_GetCameraFormat(camera: ?*SDL_Camera, spec: [*c]SDL_CameraSpec) bool;
pub extern fn SDL_AcquireCameraFrame(camera: ?*SDL_Camera, timestampNS: [*c]Uint64) [*c]SDL_Surface;
pub extern fn SDL_ReleaseCameraFrame(camera: ?*SDL_Camera, frame: [*c]SDL_Surface) void;
pub extern fn SDL_CloseCamera(camera: ?*SDL_Camera) void;
pub extern fn SDL_SetClipboardText(text: [*c]const u8) bool;
pub extern fn SDL_GetClipboardText() [*c]u8;
pub extern fn SDL_HasClipboardText() bool;
pub extern fn SDL_SetPrimarySelectionText(text: [*c]const u8) bool;
pub extern fn SDL_GetPrimarySelectionText() [*c]u8;
pub extern fn SDL_HasPrimarySelectionText() bool;
pub const SDL_ClipboardDataCallback = ?*const fn (?*anyopaque, [*c]const u8, [*c]usize) callconv(.c) ?*const anyopaque;
pub const SDL_ClipboardCleanupCallback = ?*const fn (?*anyopaque) callconv(.c) void;
pub extern fn SDL_SetClipboardData(callback: SDL_ClipboardDataCallback, cleanup: SDL_ClipboardCleanupCallback, userdata: ?*anyopaque, mime_types: [*c][*c]const u8, num_mime_types: usize) bool;
pub extern fn SDL_ClearClipboardData() bool;
pub extern fn SDL_GetClipboardData(mime_type: [*c]const u8, size: [*c]usize) ?*anyopaque;
pub extern fn SDL_HasClipboardData(mime_type: [*c]const u8) bool;
pub extern fn SDL_GetClipboardMimeTypes(num_mime_types: [*c]usize) [*c][*c]u8;
pub extern fn SDL_GetNumLogicalCPUCores() c_int;
pub extern fn SDL_GetCPUCacheLineSize() c_int;
pub extern fn SDL_HasAltiVec() bool;
pub extern fn SDL_HasMMX() bool;
pub extern fn SDL_HasSSE() bool;
pub extern fn SDL_HasSSE2() bool;
pub extern fn SDL_HasSSE3() bool;
pub extern fn SDL_HasSSE41() bool;
pub extern fn SDL_HasSSE42() bool;
pub extern fn SDL_HasAVX() bool;
pub extern fn SDL_HasAVX2() bool;
pub extern fn SDL_HasAVX512F() bool;
pub extern fn SDL_HasARMSIMD() bool;
pub extern fn SDL_HasNEON() bool;
pub extern fn SDL_HasLSX() bool;
pub extern fn SDL_HasLASX() bool;
pub extern fn SDL_GetSystemRAM() c_int;
pub extern fn SDL_GetSIMDAlignment() usize;
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
pub const SDL_SYSTEM_THEME_UNKNOWN: c_int = 0;
pub const SDL_SYSTEM_THEME_LIGHT: c_int = 1;
pub const SDL_SYSTEM_THEME_DARK: c_int = 2;
pub const enum_SDL_SystemTheme = c_uint;
pub const SDL_SystemTheme = enum_SDL_SystemTheme;
pub const struct_SDL_DisplayModeData = opaque {};
pub const SDL_DisplayModeData = struct_SDL_DisplayModeData;
pub const struct_SDL_DisplayMode = extern struct {
    displayID: SDL_DisplayID = @import("std").mem.zeroes(SDL_DisplayID),
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = @import("std").mem.zeroes(c_int),
    h: c_int = @import("std").mem.zeroes(c_int),
    pixel_density: f32 = @import("std").mem.zeroes(f32),
    refresh_rate: f32 = @import("std").mem.zeroes(f32),
    refresh_rate_numerator: c_int = @import("std").mem.zeroes(c_int),
    refresh_rate_denominator: c_int = @import("std").mem.zeroes(c_int),
    internal: ?*SDL_DisplayModeData = @import("std").mem.zeroes(?*SDL_DisplayModeData),
};
pub const SDL_DisplayMode = struct_SDL_DisplayMode;
pub const SDL_ORIENTATION_UNKNOWN: c_int = 0;
pub const SDL_ORIENTATION_LANDSCAPE: c_int = 1;
pub const SDL_ORIENTATION_LANDSCAPE_FLIPPED: c_int = 2;
pub const SDL_ORIENTATION_PORTRAIT: c_int = 3;
pub const SDL_ORIENTATION_PORTRAIT_FLIPPED: c_int = 4;
pub const enum_SDL_DisplayOrientation = c_uint;
pub const SDL_DisplayOrientation = enum_SDL_DisplayOrientation;
pub const struct_SDL_Window = opaque {};
pub const SDL_Window = struct_SDL_Window;
pub const SDL_WindowFlags = Uint64;
pub const SDL_FLASH_CANCEL: c_int = 0;
pub const SDL_FLASH_BRIEFLY: c_int = 1;
pub const SDL_FLASH_UNTIL_FOCUSED: c_int = 2;
pub const enum_SDL_FlashOperation = c_uint;
pub const SDL_FlashOperation = enum_SDL_FlashOperation;
pub const struct_SDL_GLContextState = opaque {};
pub const SDL_GLContext = ?*struct_SDL_GLContextState;
pub const SDL_EGLDisplay = ?*anyopaque;
pub const SDL_EGLConfig = ?*anyopaque;
pub const SDL_EGLSurface = ?*anyopaque;
pub const SDL_EGLAttrib = isize;
pub const SDL_EGLint = c_int;
pub const SDL_EGLAttribArrayCallback = ?*const fn (?*anyopaque) callconv(.c) [*c]SDL_EGLAttrib;
pub const SDL_EGLIntArrayCallback = ?*const fn (?*anyopaque, SDL_EGLDisplay, SDL_EGLConfig) callconv(.c) [*c]SDL_EGLint;
pub const SDL_GL_RED_SIZE: c_int = 0;
pub const SDL_GL_GREEN_SIZE: c_int = 1;
pub const SDL_GL_BLUE_SIZE: c_int = 2;
pub const SDL_GL_ALPHA_SIZE: c_int = 3;
pub const SDL_GL_BUFFER_SIZE: c_int = 4;
pub const SDL_GL_DOUBLEBUFFER: c_int = 5;
pub const SDL_GL_DEPTH_SIZE: c_int = 6;
pub const SDL_GL_STENCIL_SIZE: c_int = 7;
pub const SDL_GL_ACCUM_RED_SIZE: c_int = 8;
pub const SDL_GL_ACCUM_GREEN_SIZE: c_int = 9;
pub const SDL_GL_ACCUM_BLUE_SIZE: c_int = 10;
pub const SDL_GL_ACCUM_ALPHA_SIZE: c_int = 11;
pub const SDL_GL_STEREO: c_int = 12;
pub const SDL_GL_MULTISAMPLEBUFFERS: c_int = 13;
pub const SDL_GL_MULTISAMPLESAMPLES: c_int = 14;
pub const SDL_GL_ACCELERATED_VISUAL: c_int = 15;
pub const SDL_GL_RETAINED_BACKING: c_int = 16;
pub const SDL_GL_CONTEXT_MAJOR_VERSION: c_int = 17;
pub const SDL_GL_CONTEXT_MINOR_VERSION: c_int = 18;
pub const SDL_GL_CONTEXT_FLAGS: c_int = 19;
pub const SDL_GL_CONTEXT_PROFILE_MASK: c_int = 20;
pub const SDL_GL_SHARE_WITH_CURRENT_CONTEXT: c_int = 21;
pub const SDL_GL_FRAMEBUFFER_SRGB_CAPABLE: c_int = 22;
pub const SDL_GL_CONTEXT_RELEASE_BEHAVIOR: c_int = 23;
pub const SDL_GL_CONTEXT_RESET_NOTIFICATION: c_int = 24;
pub const SDL_GL_CONTEXT_NO_ERROR: c_int = 25;
pub const SDL_GL_FLOATBUFFERS: c_int = 26;
pub const SDL_GL_EGL_PLATFORM: c_int = 27;
pub const enum_SDL_GLAttr = c_uint;
pub const SDL_GLAttr = enum_SDL_GLAttr;
pub const SDL_GLProfile = Uint32;
pub const SDL_GLContextFlag = Uint32;
pub const SDL_GLContextReleaseFlag = Uint32;
pub const SDL_GLContextResetNotification = Uint32;
pub extern fn SDL_GetNumVideoDrivers() c_int;
pub extern fn SDL_GetVideoDriver(index: c_int) [*c]const u8;
pub extern fn SDL_GetCurrentVideoDriver() [*c]const u8;
pub extern fn SDL_GetSystemTheme() SDL_SystemTheme;
pub extern fn SDL_GetDisplays(count: [*c]c_int) [*c]SDL_DisplayID;
pub extern fn SDL_GetPrimaryDisplay() SDL_DisplayID;
pub extern fn SDL_GetDisplayProperties(displayID: SDL_DisplayID) SDL_PropertiesID;
pub extern fn SDL_GetDisplayName(displayID: SDL_DisplayID) [*c]const u8;
pub extern fn SDL_GetDisplayBounds(displayID: SDL_DisplayID, rect: [*c]SDL_Rect) bool;
pub extern fn SDL_GetDisplayUsableBounds(displayID: SDL_DisplayID, rect: [*c]SDL_Rect) bool;
pub extern fn SDL_GetNaturalDisplayOrientation(displayID: SDL_DisplayID) SDL_DisplayOrientation;
pub extern fn SDL_GetCurrentDisplayOrientation(displayID: SDL_DisplayID) SDL_DisplayOrientation;
pub extern fn SDL_GetDisplayContentScale(displayID: SDL_DisplayID) f32;
pub extern fn SDL_GetFullscreenDisplayModes(displayID: SDL_DisplayID, count: [*c]c_int) [*c][*c]SDL_DisplayMode;
pub extern fn SDL_GetClosestFullscreenDisplayMode(displayID: SDL_DisplayID, w: c_int, h: c_int, refresh_rate: f32, include_high_density_modes: bool, closest: [*c]SDL_DisplayMode) bool;
pub extern fn SDL_GetDesktopDisplayMode(displayID: SDL_DisplayID) [*c]const SDL_DisplayMode;
pub extern fn SDL_GetCurrentDisplayMode(displayID: SDL_DisplayID) [*c]const SDL_DisplayMode;
pub extern fn SDL_GetDisplayForPoint(point: [*c]const SDL_Point) SDL_DisplayID;
pub extern fn SDL_GetDisplayForRect(rect: [*c]const SDL_Rect) SDL_DisplayID;
pub extern fn SDL_GetDisplayForWindow(window: ?*SDL_Window) SDL_DisplayID;
pub extern fn SDL_GetWindowPixelDensity(window: ?*SDL_Window) f32;
pub extern fn SDL_GetWindowDisplayScale(window: ?*SDL_Window) f32;
pub extern fn SDL_SetWindowFullscreenMode(window: ?*SDL_Window, mode: [*c]const SDL_DisplayMode) bool;
pub extern fn SDL_GetWindowFullscreenMode(window: ?*SDL_Window) [*c]const SDL_DisplayMode;
pub extern fn SDL_GetWindowICCProfile(window: ?*SDL_Window, size: [*c]usize) ?*anyopaque;
pub extern fn SDL_GetWindowPixelFormat(window: ?*SDL_Window) SDL_PixelFormat;
pub extern fn SDL_GetWindows(count: [*c]c_int) [*c]?*SDL_Window;
pub extern fn SDL_CreateWindow(title: [*c]const u8, w: c_int, h: c_int, flags: SDL_WindowFlags) ?*SDL_Window;
pub extern fn SDL_CreatePopupWindow(parent: ?*SDL_Window, offset_x: c_int, offset_y: c_int, w: c_int, h: c_int, flags: SDL_WindowFlags) ?*SDL_Window;
pub extern fn SDL_CreateWindowWithProperties(props: SDL_PropertiesID) ?*SDL_Window;
pub extern fn SDL_GetWindowID(window: ?*SDL_Window) SDL_WindowID;
pub extern fn SDL_GetWindowFromID(id: SDL_WindowID) ?*SDL_Window;
pub extern fn SDL_GetWindowParent(window: ?*SDL_Window) ?*SDL_Window;
pub extern fn SDL_GetWindowProperties(window: ?*SDL_Window) SDL_PropertiesID;
pub extern fn SDL_GetWindowFlags(window: ?*SDL_Window) SDL_WindowFlags;
pub extern fn SDL_SetWindowTitle(window: ?*SDL_Window, title: [*c]const u8) bool;
pub extern fn SDL_GetWindowTitle(window: ?*SDL_Window) [*c]const u8;
pub extern fn SDL_SetWindowIcon(window: ?*SDL_Window, icon: [*c]SDL_Surface) bool;
pub extern fn SDL_SetWindowPosition(window: ?*SDL_Window, x: c_int, y: c_int) bool;
pub extern fn SDL_GetWindowPosition(window: ?*SDL_Window, x: [*c]c_int, y: [*c]c_int) bool;
pub extern fn SDL_SetWindowSize(window: ?*SDL_Window, w: c_int, h: c_int) bool;
pub extern fn SDL_GetWindowSize(window: ?*SDL_Window, w: [*c]c_int, h: [*c]c_int) bool;
pub extern fn SDL_GetWindowSafeArea(window: ?*SDL_Window, rect: [*c]SDL_Rect) bool;
pub extern fn SDL_SetWindowAspectRatio(window: ?*SDL_Window, min_aspect: f32, max_aspect: f32) bool;
pub extern fn SDL_GetWindowAspectRatio(window: ?*SDL_Window, min_aspect: [*c]f32, max_aspect: [*c]f32) bool;
pub extern fn SDL_GetWindowBordersSize(window: ?*SDL_Window, top: [*c]c_int, left: [*c]c_int, bottom: [*c]c_int, right: [*c]c_int) bool;
pub extern fn SDL_GetWindowSizeInPixels(window: ?*SDL_Window, w: [*c]c_int, h: [*c]c_int) bool;
pub extern fn SDL_SetWindowMinimumSize(window: ?*SDL_Window, min_w: c_int, min_h: c_int) bool;
pub extern fn SDL_GetWindowMinimumSize(window: ?*SDL_Window, w: [*c]c_int, h: [*c]c_int) bool;
pub extern fn SDL_SetWindowMaximumSize(window: ?*SDL_Window, max_w: c_int, max_h: c_int) bool;
pub extern fn SDL_GetWindowMaximumSize(window: ?*SDL_Window, w: [*c]c_int, h: [*c]c_int) bool;
pub extern fn SDL_SetWindowBordered(window: ?*SDL_Window, bordered: bool) bool;
pub extern fn SDL_SetWindowResizable(window: ?*SDL_Window, resizable: bool) bool;
pub extern fn SDL_SetWindowAlwaysOnTop(window: ?*SDL_Window, on_top: bool) bool;
pub extern fn SDL_ShowWindow(window: ?*SDL_Window) bool;
pub extern fn SDL_HideWindow(window: ?*SDL_Window) bool;
pub extern fn SDL_RaiseWindow(window: ?*SDL_Window) bool;
pub extern fn SDL_MaximizeWindow(window: ?*SDL_Window) bool;
pub extern fn SDL_MinimizeWindow(window: ?*SDL_Window) bool;
pub extern fn SDL_RestoreWindow(window: ?*SDL_Window) bool;
pub extern fn SDL_SetWindowFullscreen(window: ?*SDL_Window, fullscreen: bool) bool;
pub extern fn SDL_SyncWindow(window: ?*SDL_Window) bool;
pub extern fn SDL_WindowHasSurface(window: ?*SDL_Window) bool;
pub extern fn SDL_GetWindowSurface(window: ?*SDL_Window) [*c]SDL_Surface;
pub extern fn SDL_SetWindowSurfaceVSync(window: ?*SDL_Window, vsync: c_int) bool;
pub extern fn SDL_GetWindowSurfaceVSync(window: ?*SDL_Window, vsync: [*c]c_int) bool;
pub extern fn SDL_UpdateWindowSurface(window: ?*SDL_Window) bool;
pub extern fn SDL_UpdateWindowSurfaceRects(window: ?*SDL_Window, rects: [*c]const SDL_Rect, numrects: c_int) bool;
pub extern fn SDL_DestroyWindowSurface(window: ?*SDL_Window) bool;
pub extern fn SDL_SetWindowKeyboardGrab(window: ?*SDL_Window, grabbed: bool) bool;
pub extern fn SDL_SetWindowMouseGrab(window: ?*SDL_Window, grabbed: bool) bool;
pub extern fn SDL_GetWindowKeyboardGrab(window: ?*SDL_Window) bool;
pub extern fn SDL_GetWindowMouseGrab(window: ?*SDL_Window) bool;
pub extern fn SDL_GetGrabbedWindow() ?*SDL_Window;
pub extern fn SDL_SetWindowMouseRect(window: ?*SDL_Window, rect: [*c]const SDL_Rect) bool;
pub extern fn SDL_GetWindowMouseRect(window: ?*SDL_Window) [*c]const SDL_Rect;
pub extern fn SDL_SetWindowOpacity(window: ?*SDL_Window, opacity: f32) bool;
pub extern fn SDL_GetWindowOpacity(window: ?*SDL_Window) f32;
pub extern fn SDL_SetWindowParent(window: ?*SDL_Window, parent: ?*SDL_Window) bool;
pub extern fn SDL_SetWindowModal(window: ?*SDL_Window, modal: bool) bool;
pub extern fn SDL_SetWindowFocusable(window: ?*SDL_Window, focusable: bool) bool;
pub extern fn SDL_ShowWindowSystemMenu(window: ?*SDL_Window, x: c_int, y: c_int) bool;
pub const SDL_HITTEST_NORMAL: c_int = 0;
pub const SDL_HITTEST_DRAGGABLE: c_int = 1;
pub const SDL_HITTEST_RESIZE_TOPLEFT: c_int = 2;
pub const SDL_HITTEST_RESIZE_TOP: c_int = 3;
pub const SDL_HITTEST_RESIZE_TOPRIGHT: c_int = 4;
pub const SDL_HITTEST_RESIZE_RIGHT: c_int = 5;
pub const SDL_HITTEST_RESIZE_BOTTOMRIGHT: c_int = 6;
pub const SDL_HITTEST_RESIZE_BOTTOM: c_int = 7;
pub const SDL_HITTEST_RESIZE_BOTTOMLEFT: c_int = 8;
pub const SDL_HITTEST_RESIZE_LEFT: c_int = 9;
pub const enum_SDL_HitTestResult = c_uint;
pub const SDL_HitTestResult = enum_SDL_HitTestResult;
pub const SDL_HitTest = ?*const fn (?*SDL_Window, [*c]const SDL_Point, ?*anyopaque) callconv(.c) SDL_HitTestResult;
pub extern fn SDL_SetWindowHitTest(window: ?*SDL_Window, callback: SDL_HitTest, callback_data: ?*anyopaque) bool;
pub extern fn SDL_SetWindowShape(window: ?*SDL_Window, shape: [*c]SDL_Surface) bool;
pub extern fn SDL_FlashWindow(window: ?*SDL_Window, operation: SDL_FlashOperation) bool;
pub extern fn SDL_DestroyWindow(window: ?*SDL_Window) void;
pub extern fn SDL_ScreenSaverEnabled() bool;
pub extern fn SDL_EnableScreenSaver() bool;
pub extern fn SDL_DisableScreenSaver() bool;
pub extern fn SDL_GL_LoadLibrary(path: [*c]const u8) bool;
pub extern fn SDL_GL_GetProcAddress(proc: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_EGL_GetProcAddress(proc: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_GL_UnloadLibrary() void;
pub extern fn SDL_GL_ExtensionSupported(extension: [*c]const u8) bool;
pub extern fn SDL_GL_ResetAttributes() void;
pub extern fn SDL_GL_SetAttribute(attr: SDL_GLAttr, value: c_int) bool;
pub extern fn SDL_GL_GetAttribute(attr: SDL_GLAttr, value: [*c]c_int) bool;
pub extern fn SDL_GL_CreateContext(window: ?*SDL_Window) SDL_GLContext;
pub extern fn SDL_GL_MakeCurrent(window: ?*SDL_Window, context: SDL_GLContext) bool;
pub extern fn SDL_GL_GetCurrentWindow() ?*SDL_Window;
pub extern fn SDL_GL_GetCurrentContext() SDL_GLContext;
pub extern fn SDL_EGL_GetCurrentDisplay() SDL_EGLDisplay;
pub extern fn SDL_EGL_GetCurrentConfig() SDL_EGLConfig;
pub extern fn SDL_EGL_GetWindowSurface(window: ?*SDL_Window) SDL_EGLSurface;
pub extern fn SDL_EGL_SetAttributeCallbacks(platformAttribCallback: SDL_EGLAttribArrayCallback, surfaceAttribCallback: SDL_EGLIntArrayCallback, contextAttribCallback: SDL_EGLIntArrayCallback, userdata: ?*anyopaque) void;
pub extern fn SDL_GL_SetSwapInterval(interval: c_int) bool;
pub extern fn SDL_GL_GetSwapInterval(interval: [*c]c_int) bool;
pub extern fn SDL_GL_SwapWindow(window: ?*SDL_Window) bool;
pub extern fn SDL_GL_DestroyContext(context: SDL_GLContext) bool;
pub const struct_SDL_DialogFileFilter = extern struct {
    name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    pattern: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const SDL_DialogFileFilter = struct_SDL_DialogFileFilter;
pub const SDL_DialogFileCallback = ?*const fn (?*anyopaque, [*c]const [*c]const u8, c_int) callconv(.c) void;
pub extern fn SDL_ShowOpenFileDialog(callback: SDL_DialogFileCallback, userdata: ?*anyopaque, window: ?*SDL_Window, filters: [*c]const SDL_DialogFileFilter, nfilters: c_int, default_location: [*c]const u8, allow_many: bool) void;
pub extern fn SDL_ShowSaveFileDialog(callback: SDL_DialogFileCallback, userdata: ?*anyopaque, window: ?*SDL_Window, filters: [*c]const SDL_DialogFileFilter, nfilters: c_int, default_location: [*c]const u8) void;
pub extern fn SDL_ShowOpenFolderDialog(callback: SDL_DialogFileCallback, userdata: ?*anyopaque, window: ?*SDL_Window, default_location: [*c]const u8, allow_many: bool) void;
pub const SDL_FILEDIALOG_OPENFILE: c_int = 0;
pub const SDL_FILEDIALOG_SAVEFILE: c_int = 1;
pub const SDL_FILEDIALOG_OPENFOLDER: c_int = 2;
pub const enum_SDL_FileDialogType = c_uint;
pub const SDL_FileDialogType = enum_SDL_FileDialogType;
pub extern fn SDL_ShowFileDialogWithProperties(@"type": SDL_FileDialogType, callback: SDL_DialogFileCallback, userdata: ?*anyopaque, props: SDL_PropertiesID) void;
pub const struct_SDL_GUID = extern struct {
    data: [16]Uint8 = @import("std").mem.zeroes([16]Uint8),
};
pub const SDL_GUID = struct_SDL_GUID;
pub extern fn SDL_GUIDToString(guid: SDL_GUID, pszGUID: [*c]u8, cbGUID: c_int) void;
pub extern fn SDL_StringToGUID(pchGUID: [*c]const u8) SDL_GUID;
pub const SDL_POWERSTATE_ERROR: c_int = -1;
pub const SDL_POWERSTATE_UNKNOWN: c_int = 0;
pub const SDL_POWERSTATE_ON_BATTERY: c_int = 1;
pub const SDL_POWERSTATE_NO_BATTERY: c_int = 2;
pub const SDL_POWERSTATE_CHARGING: c_int = 3;
pub const SDL_POWERSTATE_CHARGED: c_int = 4;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub extern fn SDL_GetPowerInfo(seconds: [*c]c_int, percent: [*c]c_int) SDL_PowerState;
pub const struct_SDL_Sensor = opaque {};
pub const SDL_Sensor = struct_SDL_Sensor;
pub const SDL_SensorID = Uint32;
pub const SDL_SENSOR_INVALID: c_int = -1;
pub const SDL_SENSOR_UNKNOWN: c_int = 0;
pub const SDL_SENSOR_ACCEL: c_int = 1;
pub const SDL_SENSOR_GYRO: c_int = 2;
pub const SDL_SENSOR_ACCEL_L: c_int = 3;
pub const SDL_SENSOR_GYRO_L: c_int = 4;
pub const SDL_SENSOR_ACCEL_R: c_int = 5;
pub const SDL_SENSOR_GYRO_R: c_int = 6;
pub const enum_SDL_SensorType = c_int;
pub const SDL_SensorType = enum_SDL_SensorType;
pub extern fn SDL_GetSensors(count: [*c]c_int) [*c]SDL_SensorID;
pub extern fn SDL_GetSensorNameForID(instance_id: SDL_SensorID) [*c]const u8;
pub extern fn SDL_GetSensorTypeForID(instance_id: SDL_SensorID) SDL_SensorType;
pub extern fn SDL_GetSensorNonPortableTypeForID(instance_id: SDL_SensorID) c_int;
pub extern fn SDL_OpenSensor(instance_id: SDL_SensorID) ?*SDL_Sensor;
pub extern fn SDL_GetSensorFromID(instance_id: SDL_SensorID) ?*SDL_Sensor;
pub extern fn SDL_GetSensorProperties(sensor: ?*SDL_Sensor) SDL_PropertiesID;
pub extern fn SDL_GetSensorName(sensor: ?*SDL_Sensor) [*c]const u8;
pub extern fn SDL_GetSensorType(sensor: ?*SDL_Sensor) SDL_SensorType;
pub extern fn SDL_GetSensorNonPortableType(sensor: ?*SDL_Sensor) c_int;
pub extern fn SDL_GetSensorID(sensor: ?*SDL_Sensor) SDL_SensorID;
pub extern fn SDL_GetSensorData(sensor: ?*SDL_Sensor, data: [*c]f32, num_values: c_int) bool;
pub extern fn SDL_CloseSensor(sensor: ?*SDL_Sensor) void;
pub extern fn SDL_UpdateSensors() void;
pub const struct_SDL_Joystick = opaque {};
pub const SDL_Joystick = struct_SDL_Joystick;
pub const SDL_JoystickID = Uint32;
pub const SDL_JOYSTICK_TYPE_UNKNOWN: c_int = 0;
pub const SDL_JOYSTICK_TYPE_GAMEPAD: c_int = 1;
pub const SDL_JOYSTICK_TYPE_WHEEL: c_int = 2;
pub const SDL_JOYSTICK_TYPE_ARCADE_STICK: c_int = 3;
pub const SDL_JOYSTICK_TYPE_FLIGHT_STICK: c_int = 4;
pub const SDL_JOYSTICK_TYPE_DANCE_PAD: c_int = 5;
pub const SDL_JOYSTICK_TYPE_GUITAR: c_int = 6;
pub const SDL_JOYSTICK_TYPE_DRUM_KIT: c_int = 7;
pub const SDL_JOYSTICK_TYPE_ARCADE_PAD: c_int = 8;
pub const SDL_JOYSTICK_TYPE_THROTTLE: c_int = 9;
pub const SDL_JOYSTICK_TYPE_COUNT: c_int = 10;
pub const enum_SDL_JoystickType = c_uint;
pub const SDL_JoystickType = enum_SDL_JoystickType;
pub const SDL_JOYSTICK_CONNECTION_INVALID: c_int = -1;
pub const SDL_JOYSTICK_CONNECTION_UNKNOWN: c_int = 0;
pub const SDL_JOYSTICK_CONNECTION_WIRED: c_int = 1;
pub const SDL_JOYSTICK_CONNECTION_WIRELESS: c_int = 2;
pub const enum_SDL_JoystickConnectionState = c_int;
pub const SDL_JoystickConnectionState = enum_SDL_JoystickConnectionState;
pub extern fn SDL_LockJoysticks() void;
pub extern fn SDL_UnlockJoysticks() void;
pub extern fn SDL_HasJoystick() bool;
pub extern fn SDL_GetJoysticks(count: [*c]c_int) [*c]SDL_JoystickID;
pub extern fn SDL_GetJoystickNameForID(instance_id: SDL_JoystickID) [*c]const u8;
pub extern fn SDL_GetJoystickPathForID(instance_id: SDL_JoystickID) [*c]const u8;
pub extern fn SDL_GetJoystickPlayerIndexForID(instance_id: SDL_JoystickID) c_int;
pub extern fn SDL_GetJoystickGUIDForID(instance_id: SDL_JoystickID) SDL_GUID;
pub extern fn SDL_GetJoystickVendorForID(instance_id: SDL_JoystickID) Uint16;
pub extern fn SDL_GetJoystickProductForID(instance_id: SDL_JoystickID) Uint16;
pub extern fn SDL_GetJoystickProductVersionForID(instance_id: SDL_JoystickID) Uint16;
pub extern fn SDL_GetJoystickTypeForID(instance_id: SDL_JoystickID) SDL_JoystickType;
pub extern fn SDL_OpenJoystick(instance_id: SDL_JoystickID) ?*SDL_Joystick;
pub extern fn SDL_GetJoystickFromID(instance_id: SDL_JoystickID) ?*SDL_Joystick;
pub extern fn SDL_GetJoystickFromPlayerIndex(player_index: c_int) ?*SDL_Joystick;
pub const struct_SDL_VirtualJoystickTouchpadDesc = extern struct {
    nfingers: Uint16 = @import("std").mem.zeroes(Uint16),
    padding: [3]Uint16 = @import("std").mem.zeroes([3]Uint16),
};
pub const SDL_VirtualJoystickTouchpadDesc = struct_SDL_VirtualJoystickTouchpadDesc;
pub const struct_SDL_VirtualJoystickSensorDesc = extern struct {
    type: SDL_SensorType = @import("std").mem.zeroes(SDL_SensorType),
    rate: f32 = @import("std").mem.zeroes(f32),
};
pub const SDL_VirtualJoystickSensorDesc = struct_SDL_VirtualJoystickSensorDesc;
pub const struct_SDL_VirtualJoystickDesc = extern struct {
    version: Uint32 = @import("std").mem.zeroes(Uint32),
    type: Uint16 = @import("std").mem.zeroes(Uint16),
    padding: Uint16 = @import("std").mem.zeroes(Uint16),
    vendor_id: Uint16 = @import("std").mem.zeroes(Uint16),
    product_id: Uint16 = @import("std").mem.zeroes(Uint16),
    naxes: Uint16 = @import("std").mem.zeroes(Uint16),
    nbuttons: Uint16 = @import("std").mem.zeroes(Uint16),
    nballs: Uint16 = @import("std").mem.zeroes(Uint16),
    nhats: Uint16 = @import("std").mem.zeroes(Uint16),
    ntouchpads: Uint16 = @import("std").mem.zeroes(Uint16),
    nsensors: Uint16 = @import("std").mem.zeroes(Uint16),
    padding2: [2]Uint16 = @import("std").mem.zeroes([2]Uint16),
    button_mask: Uint32 = @import("std").mem.zeroes(Uint32),
    axis_mask: Uint32 = @import("std").mem.zeroes(Uint32),
    name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    touchpads: [*c]const SDL_VirtualJoystickTouchpadDesc = @import("std").mem.zeroes([*c]const SDL_VirtualJoystickTouchpadDesc),
    sensors: [*c]const SDL_VirtualJoystickSensorDesc = @import("std").mem.zeroes([*c]const SDL_VirtualJoystickSensorDesc),
    userdata: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    Update: ?*const fn (?*anyopaque) callconv(.c) void = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.c) void),
    SetPlayerIndex: ?*const fn (?*anyopaque, c_int) callconv(.c) void = @import("std").mem.zeroes(?*const fn (?*anyopaque, c_int) callconv(.c) void),
    Rumble: ?*const fn (?*anyopaque, Uint16, Uint16) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque, Uint16, Uint16) callconv(.c) bool),
    RumbleTriggers: ?*const fn (?*anyopaque, Uint16, Uint16) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque, Uint16, Uint16) callconv(.c) bool),
    SetLED: ?*const fn (?*anyopaque, Uint8, Uint8, Uint8) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque, Uint8, Uint8, Uint8) callconv(.c) bool),
    SendEffect: ?*const fn (?*anyopaque, ?*const anyopaque, c_int) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque, ?*const anyopaque, c_int) callconv(.c) bool),
    SetSensorsEnabled: ?*const fn (?*anyopaque, bool) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque, bool) callconv(.c) bool),
    Cleanup: ?*const fn (?*anyopaque) callconv(.c) void = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.c) void),
};
pub const SDL_VirtualJoystickDesc = struct_SDL_VirtualJoystickDesc;
// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration
pub extern fn SDL_AttachVirtualJoystick(desc: [*c]const SDL_VirtualJoystickDesc) SDL_JoystickID;
pub extern fn SDL_DetachVirtualJoystick(instance_id: SDL_JoystickID) bool;
pub extern fn SDL_IsJoystickVirtual(instance_id: SDL_JoystickID) bool;
pub extern fn SDL_SetJoystickVirtualAxis(joystick: ?*SDL_Joystick, axis: c_int, value: Sint16) bool;
pub extern fn SDL_SetJoystickVirtualBall(joystick: ?*SDL_Joystick, ball: c_int, xrel: Sint16, yrel: Sint16) bool;
pub extern fn SDL_SetJoystickVirtualButton(joystick: ?*SDL_Joystick, button: c_int, down: bool) bool;
pub extern fn SDL_SetJoystickVirtualHat(joystick: ?*SDL_Joystick, hat: c_int, value: Uint8) bool;
pub extern fn SDL_SetJoystickVirtualTouchpad(joystick: ?*SDL_Joystick, touchpad: c_int, finger: c_int, down: bool, x: f32, y: f32, pressure: f32) bool;
pub extern fn SDL_SendJoystickVirtualSensorData(joystick: ?*SDL_Joystick, @"type": SDL_SensorType, sensor_timestamp: Uint64, data: [*c]const f32, num_values: c_int) bool;
pub extern fn SDL_GetJoystickProperties(joystick: ?*SDL_Joystick) SDL_PropertiesID;
pub extern fn SDL_GetJoystickName(joystick: ?*SDL_Joystick) [*c]const u8;
pub extern fn SDL_GetJoystickPath(joystick: ?*SDL_Joystick) [*c]const u8;
pub extern fn SDL_GetJoystickPlayerIndex(joystick: ?*SDL_Joystick) c_int;
pub extern fn SDL_SetJoystickPlayerIndex(joystick: ?*SDL_Joystick, player_index: c_int) bool;
pub extern fn SDL_GetJoystickGUID(joystick: ?*SDL_Joystick) SDL_GUID;
pub extern fn SDL_GetJoystickVendor(joystick: ?*SDL_Joystick) Uint16;
pub extern fn SDL_GetJoystickProduct(joystick: ?*SDL_Joystick) Uint16;
pub extern fn SDL_GetJoystickProductVersion(joystick: ?*SDL_Joystick) Uint16;
pub extern fn SDL_GetJoystickFirmwareVersion(joystick: ?*SDL_Joystick) Uint16;
pub extern fn SDL_GetJoystickSerial(joystick: ?*SDL_Joystick) [*c]const u8;
pub extern fn SDL_GetJoystickType(joystick: ?*SDL_Joystick) SDL_JoystickType;
pub extern fn SDL_GetJoystickGUIDInfo(guid: SDL_GUID, vendor: [*c]Uint16, product: [*c]Uint16, version: [*c]Uint16, crc16: [*c]Uint16) void;
pub extern fn SDL_JoystickConnected(joystick: ?*SDL_Joystick) bool;
pub extern fn SDL_GetJoystickID(joystick: ?*SDL_Joystick) SDL_JoystickID;
pub extern fn SDL_GetNumJoystickAxes(joystick: ?*SDL_Joystick) c_int;
pub extern fn SDL_GetNumJoystickBalls(joystick: ?*SDL_Joystick) c_int;
pub extern fn SDL_GetNumJoystickHats(joystick: ?*SDL_Joystick) c_int;
pub extern fn SDL_GetNumJoystickButtons(joystick: ?*SDL_Joystick) c_int;
pub extern fn SDL_SetJoystickEventsEnabled(enabled: bool) void;
pub extern fn SDL_JoystickEventsEnabled() bool;
pub extern fn SDL_UpdateJoysticks() void;
pub extern fn SDL_GetJoystickAxis(joystick: ?*SDL_Joystick, axis: c_int) Sint16;
pub extern fn SDL_GetJoystickAxisInitialState(joystick: ?*SDL_Joystick, axis: c_int, state: [*c]Sint16) bool;
pub extern fn SDL_GetJoystickBall(joystick: ?*SDL_Joystick, ball: c_int, dx: [*c]c_int, dy: [*c]c_int) bool;
pub extern fn SDL_GetJoystickHat(joystick: ?*SDL_Joystick, hat: c_int) Uint8;
pub extern fn SDL_GetJoystickButton(joystick: ?*SDL_Joystick, button: c_int) bool;
pub extern fn SDL_RumbleJoystick(joystick: ?*SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16, duration_ms: Uint32) bool;
pub extern fn SDL_RumbleJoystickTriggers(joystick: ?*SDL_Joystick, left_rumble: Uint16, right_rumble: Uint16, duration_ms: Uint32) bool;
pub extern fn SDL_SetJoystickLED(joystick: ?*SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) bool;
pub extern fn SDL_SendJoystickEffect(joystick: ?*SDL_Joystick, data: ?*const anyopaque, size: c_int) bool;
pub extern fn SDL_CloseJoystick(joystick: ?*SDL_Joystick) void;
pub extern fn SDL_GetJoystickConnectionState(joystick: ?*SDL_Joystick) SDL_JoystickConnectionState;
pub extern fn SDL_GetJoystickPowerInfo(joystick: ?*SDL_Joystick, percent: [*c]c_int) SDL_PowerState;
pub const struct_SDL_Gamepad = opaque {};
pub const SDL_Gamepad = struct_SDL_Gamepad;
pub const SDL_GAMEPAD_TYPE_UNKNOWN: c_int = 0;
pub const SDL_GAMEPAD_TYPE_STANDARD: c_int = 1;
pub const SDL_GAMEPAD_TYPE_XBOX360: c_int = 2;
pub const SDL_GAMEPAD_TYPE_XBOXONE: c_int = 3;
pub const SDL_GAMEPAD_TYPE_PS3: c_int = 4;
pub const SDL_GAMEPAD_TYPE_PS4: c_int = 5;
pub const SDL_GAMEPAD_TYPE_PS5: c_int = 6;
pub const SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO: c_int = 7;
pub const SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT: c_int = 8;
pub const SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT: c_int = 9;
pub const SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR: c_int = 10;
pub const SDL_GAMEPAD_TYPE_COUNT: c_int = 11;
pub const enum_SDL_GamepadType = c_uint;
pub const SDL_GamepadType = enum_SDL_GamepadType;
pub const SDL_GAMEPAD_BUTTON_INVALID: c_int = -1;
pub const SDL_GAMEPAD_BUTTON_SOUTH: c_int = 0;
pub const SDL_GAMEPAD_BUTTON_EAST: c_int = 1;
pub const SDL_GAMEPAD_BUTTON_WEST: c_int = 2;
pub const SDL_GAMEPAD_BUTTON_NORTH: c_int = 3;
pub const SDL_GAMEPAD_BUTTON_BACK: c_int = 4;
pub const SDL_GAMEPAD_BUTTON_GUIDE: c_int = 5;
pub const SDL_GAMEPAD_BUTTON_START: c_int = 6;
pub const SDL_GAMEPAD_BUTTON_LEFT_STICK: c_int = 7;
pub const SDL_GAMEPAD_BUTTON_RIGHT_STICK: c_int = 8;
pub const SDL_GAMEPAD_BUTTON_LEFT_SHOULDER: c_int = 9;
pub const SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER: c_int = 10;
pub const SDL_GAMEPAD_BUTTON_DPAD_UP: c_int = 11;
pub const SDL_GAMEPAD_BUTTON_DPAD_DOWN: c_int = 12;
pub const SDL_GAMEPAD_BUTTON_DPAD_LEFT: c_int = 13;
pub const SDL_GAMEPAD_BUTTON_DPAD_RIGHT: c_int = 14;
pub const SDL_GAMEPAD_BUTTON_MISC1: c_int = 15;
pub const SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1: c_int = 16;
pub const SDL_GAMEPAD_BUTTON_LEFT_PADDLE1: c_int = 17;
pub const SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2: c_int = 18;
pub const SDL_GAMEPAD_BUTTON_LEFT_PADDLE2: c_int = 19;
pub const SDL_GAMEPAD_BUTTON_TOUCHPAD: c_int = 20;
pub const SDL_GAMEPAD_BUTTON_MISC2: c_int = 21;
pub const SDL_GAMEPAD_BUTTON_MISC3: c_int = 22;
pub const SDL_GAMEPAD_BUTTON_MISC4: c_int = 23;
pub const SDL_GAMEPAD_BUTTON_MISC5: c_int = 24;
pub const SDL_GAMEPAD_BUTTON_MISC6: c_int = 25;
pub const SDL_GAMEPAD_BUTTON_COUNT: c_int = 26;
pub const enum_SDL_GamepadButton = c_int;
pub const SDL_GamepadButton = enum_SDL_GamepadButton;
pub const SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN: c_int = 0;
pub const SDL_GAMEPAD_BUTTON_LABEL_A: c_int = 1;
pub const SDL_GAMEPAD_BUTTON_LABEL_B: c_int = 2;
pub const SDL_GAMEPAD_BUTTON_LABEL_X: c_int = 3;
pub const SDL_GAMEPAD_BUTTON_LABEL_Y: c_int = 4;
pub const SDL_GAMEPAD_BUTTON_LABEL_CROSS: c_int = 5;
pub const SDL_GAMEPAD_BUTTON_LABEL_CIRCLE: c_int = 6;
pub const SDL_GAMEPAD_BUTTON_LABEL_SQUARE: c_int = 7;
pub const SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE: c_int = 8;
pub const enum_SDL_GamepadButtonLabel = c_uint;
pub const SDL_GamepadButtonLabel = enum_SDL_GamepadButtonLabel;
pub const SDL_GAMEPAD_AXIS_INVALID: c_int = -1;
pub const SDL_GAMEPAD_AXIS_LEFTX: c_int = 0;
pub const SDL_GAMEPAD_AXIS_LEFTY: c_int = 1;
pub const SDL_GAMEPAD_AXIS_RIGHTX: c_int = 2;
pub const SDL_GAMEPAD_AXIS_RIGHTY: c_int = 3;
pub const SDL_GAMEPAD_AXIS_LEFT_TRIGGER: c_int = 4;
pub const SDL_GAMEPAD_AXIS_RIGHT_TRIGGER: c_int = 5;
pub const SDL_GAMEPAD_AXIS_COUNT: c_int = 6;
pub const enum_SDL_GamepadAxis = c_int;
pub const SDL_GamepadAxis = enum_SDL_GamepadAxis;
pub const SDL_GAMEPAD_BINDTYPE_NONE: c_int = 0;
pub const SDL_GAMEPAD_BINDTYPE_BUTTON: c_int = 1;
pub const SDL_GAMEPAD_BINDTYPE_AXIS: c_int = 2;
pub const SDL_GAMEPAD_BINDTYPE_HAT: c_int = 3;
pub const enum_SDL_GamepadBindingType = c_uint;
pub const SDL_GamepadBindingType = enum_SDL_GamepadBindingType;
const struct_unnamed_3 = extern struct {
    axis: c_int = @import("std").mem.zeroes(c_int),
    axis_min: c_int = @import("std").mem.zeroes(c_int),
    axis_max: c_int = @import("std").mem.zeroes(c_int),
};
const struct_unnamed_4 = extern struct {
    hat: c_int = @import("std").mem.zeroes(c_int),
    hat_mask: c_int = @import("std").mem.zeroes(c_int),
};
const union_unnamed_2 = extern union {
    button: c_int,
    axis: struct_unnamed_3,
    hat: struct_unnamed_4,
};
const struct_unnamed_6 = extern struct {
    axis: SDL_GamepadAxis = @import("std").mem.zeroes(SDL_GamepadAxis),
    axis_min: c_int = @import("std").mem.zeroes(c_int),
    axis_max: c_int = @import("std").mem.zeroes(c_int),
};
const union_unnamed_5 = extern union {
    button: SDL_GamepadButton,
    axis: struct_unnamed_6,
};
pub const struct_SDL_GamepadBinding = extern struct {
    input_type: SDL_GamepadBindingType = @import("std").mem.zeroes(SDL_GamepadBindingType),
    input: union_unnamed_2 = @import("std").mem.zeroes(union_unnamed_2),
    output_type: SDL_GamepadBindingType = @import("std").mem.zeroes(SDL_GamepadBindingType),
    output: union_unnamed_5 = @import("std").mem.zeroes(union_unnamed_5),
};
pub const SDL_GamepadBinding = struct_SDL_GamepadBinding;
pub extern fn SDL_AddGamepadMapping(mapping: [*c]const u8) c_int;
pub extern fn SDL_AddGamepadMappingsFromIO(src: ?*SDL_IOStream, closeio: bool) c_int;
pub extern fn SDL_AddGamepadMappingsFromFile(file: [*c]const u8) c_int;
pub extern fn SDL_ReloadGamepadMappings() bool;
pub extern fn SDL_GetGamepadMappings(count: [*c]c_int) [*c][*c]u8;
pub extern fn SDL_GetGamepadMappingForGUID(guid: SDL_GUID) [*c]u8;
pub extern fn SDL_GetGamepadMapping(gamepad: ?*SDL_Gamepad) [*c]u8;
pub extern fn SDL_SetGamepadMapping(instance_id: SDL_JoystickID, mapping: [*c]const u8) bool;
pub extern fn SDL_HasGamepad() bool;
pub extern fn SDL_GetGamepads(count: [*c]c_int) [*c]SDL_JoystickID;
pub extern fn SDL_IsGamepad(instance_id: SDL_JoystickID) bool;
pub extern fn SDL_GetGamepadNameForID(instance_id: SDL_JoystickID) [*c]const u8;
pub extern fn SDL_GetGamepadPathForID(instance_id: SDL_JoystickID) [*c]const u8;
pub extern fn SDL_GetGamepadPlayerIndexForID(instance_id: SDL_JoystickID) c_int;
pub extern fn SDL_GetGamepadGUIDForID(instance_id: SDL_JoystickID) SDL_GUID;
pub extern fn SDL_GetGamepadVendorForID(instance_id: SDL_JoystickID) Uint16;
pub extern fn SDL_GetGamepadProductForID(instance_id: SDL_JoystickID) Uint16;
pub extern fn SDL_GetGamepadProductVersionForID(instance_id: SDL_JoystickID) Uint16;
pub extern fn SDL_GetGamepadTypeForID(instance_id: SDL_JoystickID) SDL_GamepadType;
pub extern fn SDL_GetRealGamepadTypeForID(instance_id: SDL_JoystickID) SDL_GamepadType;
pub extern fn SDL_GetGamepadMappingForID(instance_id: SDL_JoystickID) [*c]u8;
pub extern fn SDL_OpenGamepad(instance_id: SDL_JoystickID) ?*SDL_Gamepad;
pub extern fn SDL_GetGamepadFromID(instance_id: SDL_JoystickID) ?*SDL_Gamepad;
pub extern fn SDL_GetGamepadFromPlayerIndex(player_index: c_int) ?*SDL_Gamepad;
pub extern fn SDL_GetGamepadProperties(gamepad: ?*SDL_Gamepad) SDL_PropertiesID;
pub extern fn SDL_GetGamepadID(gamepad: ?*SDL_Gamepad) SDL_JoystickID;
pub extern fn SDL_GetGamepadName(gamepad: ?*SDL_Gamepad) [*c]const u8;
pub extern fn SDL_GetGamepadPath(gamepad: ?*SDL_Gamepad) [*c]const u8;
pub extern fn SDL_GetGamepadType(gamepad: ?*SDL_Gamepad) SDL_GamepadType;
pub extern fn SDL_GetRealGamepadType(gamepad: ?*SDL_Gamepad) SDL_GamepadType;
pub extern fn SDL_GetGamepadPlayerIndex(gamepad: ?*SDL_Gamepad) c_int;
pub extern fn SDL_SetGamepadPlayerIndex(gamepad: ?*SDL_Gamepad, player_index: c_int) bool;
pub extern fn SDL_GetGamepadVendor(gamepad: ?*SDL_Gamepad) Uint16;
pub extern fn SDL_GetGamepadProduct(gamepad: ?*SDL_Gamepad) Uint16;
pub extern fn SDL_GetGamepadProductVersion(gamepad: ?*SDL_Gamepad) Uint16;
pub extern fn SDL_GetGamepadFirmwareVersion(gamepad: ?*SDL_Gamepad) Uint16;
pub extern fn SDL_GetGamepadSerial(gamepad: ?*SDL_Gamepad) [*c]const u8;
pub extern fn SDL_GetGamepadSteamHandle(gamepad: ?*SDL_Gamepad) Uint64;
pub extern fn SDL_GetGamepadConnectionState(gamepad: ?*SDL_Gamepad) SDL_JoystickConnectionState;
pub extern fn SDL_GetGamepadPowerInfo(gamepad: ?*SDL_Gamepad, percent: [*c]c_int) SDL_PowerState;
pub extern fn SDL_GamepadConnected(gamepad: ?*SDL_Gamepad) bool;
pub extern fn SDL_GetGamepadJoystick(gamepad: ?*SDL_Gamepad) ?*SDL_Joystick;
pub extern fn SDL_SetGamepadEventsEnabled(enabled: bool) void;
pub extern fn SDL_GamepadEventsEnabled() bool;
pub extern fn SDL_GetGamepadBindings(gamepad: ?*SDL_Gamepad, count: [*c]c_int) [*c][*c]SDL_GamepadBinding;
pub extern fn SDL_UpdateGamepads() void;
pub extern fn SDL_GetGamepadTypeFromString(str: [*c]const u8) SDL_GamepadType;
pub extern fn SDL_GetGamepadStringForType(@"type": SDL_GamepadType) [*c]const u8;
pub extern fn SDL_GetGamepadAxisFromString(str: [*c]const u8) SDL_GamepadAxis;
pub extern fn SDL_GetGamepadStringForAxis(axis: SDL_GamepadAxis) [*c]const u8;
pub extern fn SDL_GamepadHasAxis(gamepad: ?*SDL_Gamepad, axis: SDL_GamepadAxis) bool;
pub extern fn SDL_GetGamepadAxis(gamepad: ?*SDL_Gamepad, axis: SDL_GamepadAxis) Sint16;
pub extern fn SDL_GetGamepadButtonFromString(str: [*c]const u8) SDL_GamepadButton;
pub extern fn SDL_GetGamepadStringForButton(button: SDL_GamepadButton) [*c]const u8;
pub extern fn SDL_GamepadHasButton(gamepad: ?*SDL_Gamepad, button: SDL_GamepadButton) bool;
pub extern fn SDL_GetGamepadButton(gamepad: ?*SDL_Gamepad, button: SDL_GamepadButton) bool;
pub extern fn SDL_GetGamepadButtonLabelForType(@"type": SDL_GamepadType, button: SDL_GamepadButton) SDL_GamepadButtonLabel;
pub extern fn SDL_GetGamepadButtonLabel(gamepad: ?*SDL_Gamepad, button: SDL_GamepadButton) SDL_GamepadButtonLabel;
pub extern fn SDL_GetNumGamepadTouchpads(gamepad: ?*SDL_Gamepad) c_int;
pub extern fn SDL_GetNumGamepadTouchpadFingers(gamepad: ?*SDL_Gamepad, touchpad: c_int) c_int;
pub extern fn SDL_GetGamepadTouchpadFinger(gamepad: ?*SDL_Gamepad, touchpad: c_int, finger: c_int, down: [*c]bool, x: [*c]f32, y: [*c]f32, pressure: [*c]f32) bool;
pub extern fn SDL_GamepadHasSensor(gamepad: ?*SDL_Gamepad, @"type": SDL_SensorType) bool;
pub extern fn SDL_SetGamepadSensorEnabled(gamepad: ?*SDL_Gamepad, @"type": SDL_SensorType, enabled: bool) bool;
pub extern fn SDL_GamepadSensorEnabled(gamepad: ?*SDL_Gamepad, @"type": SDL_SensorType) bool;
pub extern fn SDL_GetGamepadSensorDataRate(gamepad: ?*SDL_Gamepad, @"type": SDL_SensorType) f32;
pub extern fn SDL_GetGamepadSensorData(gamepad: ?*SDL_Gamepad, @"type": SDL_SensorType, data: [*c]f32, num_values: c_int) bool;
pub extern fn SDL_RumbleGamepad(gamepad: ?*SDL_Gamepad, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16, duration_ms: Uint32) bool;
pub extern fn SDL_RumbleGamepadTriggers(gamepad: ?*SDL_Gamepad, left_rumble: Uint16, right_rumble: Uint16, duration_ms: Uint32) bool;
pub extern fn SDL_SetGamepadLED(gamepad: ?*SDL_Gamepad, red: Uint8, green: Uint8, blue: Uint8) bool;
pub extern fn SDL_SendGamepadEffect(gamepad: ?*SDL_Gamepad, data: ?*const anyopaque, size: c_int) bool;
pub extern fn SDL_CloseGamepad(gamepad: ?*SDL_Gamepad) void;
pub extern fn SDL_GetGamepadAppleSFSymbolsNameForButton(gamepad: ?*SDL_Gamepad, button: SDL_GamepadButton) [*c]const u8;
pub extern fn SDL_GetGamepadAppleSFSymbolsNameForAxis(gamepad: ?*SDL_Gamepad, axis: SDL_GamepadAxis) [*c]const u8;
pub const SDL_SCANCODE_UNKNOWN: c_int = 0;
pub const SDL_SCANCODE_A: c_int = 4;
pub const SDL_SCANCODE_B: c_int = 5;
pub const SDL_SCANCODE_C: c_int = 6;
pub const SDL_SCANCODE_D: c_int = 7;
pub const SDL_SCANCODE_E: c_int = 8;
pub const SDL_SCANCODE_F: c_int = 9;
pub const SDL_SCANCODE_G: c_int = 10;
pub const SDL_SCANCODE_H: c_int = 11;
pub const SDL_SCANCODE_I: c_int = 12;
pub const SDL_SCANCODE_J: c_int = 13;
pub const SDL_SCANCODE_K: c_int = 14;
pub const SDL_SCANCODE_L: c_int = 15;
pub const SDL_SCANCODE_M: c_int = 16;
pub const SDL_SCANCODE_N: c_int = 17;
pub const SDL_SCANCODE_O: c_int = 18;
pub const SDL_SCANCODE_P: c_int = 19;
pub const SDL_SCANCODE_Q: c_int = 20;
pub const SDL_SCANCODE_R: c_int = 21;
pub const SDL_SCANCODE_S: c_int = 22;
pub const SDL_SCANCODE_T: c_int = 23;
pub const SDL_SCANCODE_U: c_int = 24;
pub const SDL_SCANCODE_V: c_int = 25;
pub const SDL_SCANCODE_W: c_int = 26;
pub const SDL_SCANCODE_X: c_int = 27;
pub const SDL_SCANCODE_Y: c_int = 28;
pub const SDL_SCANCODE_Z: c_int = 29;
pub const SDL_SCANCODE_1: c_int = 30;
pub const SDL_SCANCODE_2: c_int = 31;
pub const SDL_SCANCODE_3: c_int = 32;
pub const SDL_SCANCODE_4: c_int = 33;
pub const SDL_SCANCODE_5: c_int = 34;
pub const SDL_SCANCODE_6: c_int = 35;
pub const SDL_SCANCODE_7: c_int = 36;
pub const SDL_SCANCODE_8: c_int = 37;
pub const SDL_SCANCODE_9: c_int = 38;
pub const SDL_SCANCODE_0: c_int = 39;
pub const SDL_SCANCODE_RETURN: c_int = 40;
pub const SDL_SCANCODE_ESCAPE: c_int = 41;
pub const SDL_SCANCODE_BACKSPACE: c_int = 42;
pub const SDL_SCANCODE_TAB: c_int = 43;
pub const SDL_SCANCODE_SPACE: c_int = 44;
pub const SDL_SCANCODE_MINUS: c_int = 45;
pub const SDL_SCANCODE_EQUALS: c_int = 46;
pub const SDL_SCANCODE_LEFTBRACKET: c_int = 47;
pub const SDL_SCANCODE_RIGHTBRACKET: c_int = 48;
pub const SDL_SCANCODE_BACKSLASH: c_int = 49;
pub const SDL_SCANCODE_NONUSHASH: c_int = 50;
pub const SDL_SCANCODE_SEMICOLON: c_int = 51;
pub const SDL_SCANCODE_APOSTROPHE: c_int = 52;
pub const SDL_SCANCODE_GRAVE: c_int = 53;
pub const SDL_SCANCODE_COMMA: c_int = 54;
pub const SDL_SCANCODE_PERIOD: c_int = 55;
pub const SDL_SCANCODE_SLASH: c_int = 56;
pub const SDL_SCANCODE_CAPSLOCK: c_int = 57;
pub const SDL_SCANCODE_F1: c_int = 58;
pub const SDL_SCANCODE_F2: c_int = 59;
pub const SDL_SCANCODE_F3: c_int = 60;
pub const SDL_SCANCODE_F4: c_int = 61;
pub const SDL_SCANCODE_F5: c_int = 62;
pub const SDL_SCANCODE_F6: c_int = 63;
pub const SDL_SCANCODE_F7: c_int = 64;
pub const SDL_SCANCODE_F8: c_int = 65;
pub const SDL_SCANCODE_F9: c_int = 66;
pub const SDL_SCANCODE_F10: c_int = 67;
pub const SDL_SCANCODE_F11: c_int = 68;
pub const SDL_SCANCODE_F12: c_int = 69;
pub const SDL_SCANCODE_PRINTSCREEN: c_int = 70;
pub const SDL_SCANCODE_SCROLLLOCK: c_int = 71;
pub const SDL_SCANCODE_PAUSE: c_int = 72;
pub const SDL_SCANCODE_INSERT: c_int = 73;
pub const SDL_SCANCODE_HOME: c_int = 74;
pub const SDL_SCANCODE_PAGEUP: c_int = 75;
pub const SDL_SCANCODE_DELETE: c_int = 76;
pub const SDL_SCANCODE_END: c_int = 77;
pub const SDL_SCANCODE_PAGEDOWN: c_int = 78;
pub const SDL_SCANCODE_RIGHT: c_int = 79;
pub const SDL_SCANCODE_LEFT: c_int = 80;
pub const SDL_SCANCODE_DOWN: c_int = 81;
pub const SDL_SCANCODE_UP: c_int = 82;
pub const SDL_SCANCODE_NUMLOCKCLEAR: c_int = 83;
pub const SDL_SCANCODE_KP_DIVIDE: c_int = 84;
pub const SDL_SCANCODE_KP_MULTIPLY: c_int = 85;
pub const SDL_SCANCODE_KP_MINUS: c_int = 86;
pub const SDL_SCANCODE_KP_PLUS: c_int = 87;
pub const SDL_SCANCODE_KP_ENTER: c_int = 88;
pub const SDL_SCANCODE_KP_1: c_int = 89;
pub const SDL_SCANCODE_KP_2: c_int = 90;
pub const SDL_SCANCODE_KP_3: c_int = 91;
pub const SDL_SCANCODE_KP_4: c_int = 92;
pub const SDL_SCANCODE_KP_5: c_int = 93;
pub const SDL_SCANCODE_KP_6: c_int = 94;
pub const SDL_SCANCODE_KP_7: c_int = 95;
pub const SDL_SCANCODE_KP_8: c_int = 96;
pub const SDL_SCANCODE_KP_9: c_int = 97;
pub const SDL_SCANCODE_KP_0: c_int = 98;
pub const SDL_SCANCODE_KP_PERIOD: c_int = 99;
pub const SDL_SCANCODE_NONUSBACKSLASH: c_int = 100;
pub const SDL_SCANCODE_APPLICATION: c_int = 101;
pub const SDL_SCANCODE_POWER: c_int = 102;
pub const SDL_SCANCODE_KP_EQUALS: c_int = 103;
pub const SDL_SCANCODE_F13: c_int = 104;
pub const SDL_SCANCODE_F14: c_int = 105;
pub const SDL_SCANCODE_F15: c_int = 106;
pub const SDL_SCANCODE_F16: c_int = 107;
pub const SDL_SCANCODE_F17: c_int = 108;
pub const SDL_SCANCODE_F18: c_int = 109;
pub const SDL_SCANCODE_F19: c_int = 110;
pub const SDL_SCANCODE_F20: c_int = 111;
pub const SDL_SCANCODE_F21: c_int = 112;
pub const SDL_SCANCODE_F22: c_int = 113;
pub const SDL_SCANCODE_F23: c_int = 114;
pub const SDL_SCANCODE_F24: c_int = 115;
pub const SDL_SCANCODE_EXECUTE: c_int = 116;
pub const SDL_SCANCODE_HELP: c_int = 117;
pub const SDL_SCANCODE_MENU: c_int = 118;
pub const SDL_SCANCODE_SELECT: c_int = 119;
pub const SDL_SCANCODE_STOP: c_int = 120;
pub const SDL_SCANCODE_AGAIN: c_int = 121;
pub const SDL_SCANCODE_UNDO: c_int = 122;
pub const SDL_SCANCODE_CUT: c_int = 123;
pub const SDL_SCANCODE_COPY: c_int = 124;
pub const SDL_SCANCODE_PASTE: c_int = 125;
pub const SDL_SCANCODE_FIND: c_int = 126;
pub const SDL_SCANCODE_MUTE: c_int = 127;
pub const SDL_SCANCODE_VOLUMEUP: c_int = 128;
pub const SDL_SCANCODE_VOLUMEDOWN: c_int = 129;
pub const SDL_SCANCODE_KP_COMMA: c_int = 133;
pub const SDL_SCANCODE_KP_EQUALSAS400: c_int = 134;
pub const SDL_SCANCODE_INTERNATIONAL1: c_int = 135;
pub const SDL_SCANCODE_INTERNATIONAL2: c_int = 136;
pub const SDL_SCANCODE_INTERNATIONAL3: c_int = 137;
pub const SDL_SCANCODE_INTERNATIONAL4: c_int = 138;
pub const SDL_SCANCODE_INTERNATIONAL5: c_int = 139;
pub const SDL_SCANCODE_INTERNATIONAL6: c_int = 140;
pub const SDL_SCANCODE_INTERNATIONAL7: c_int = 141;
pub const SDL_SCANCODE_INTERNATIONAL8: c_int = 142;
pub const SDL_SCANCODE_INTERNATIONAL9: c_int = 143;
pub const SDL_SCANCODE_LANG1: c_int = 144;
pub const SDL_SCANCODE_LANG2: c_int = 145;
pub const SDL_SCANCODE_LANG3: c_int = 146;
pub const SDL_SCANCODE_LANG4: c_int = 147;
pub const SDL_SCANCODE_LANG5: c_int = 148;
pub const SDL_SCANCODE_LANG6: c_int = 149;
pub const SDL_SCANCODE_LANG7: c_int = 150;
pub const SDL_SCANCODE_LANG8: c_int = 151;
pub const SDL_SCANCODE_LANG9: c_int = 152;
pub const SDL_SCANCODE_ALTERASE: c_int = 153;
pub const SDL_SCANCODE_SYSREQ: c_int = 154;
pub const SDL_SCANCODE_CANCEL: c_int = 155;
pub const SDL_SCANCODE_CLEAR: c_int = 156;
pub const SDL_SCANCODE_PRIOR: c_int = 157;
pub const SDL_SCANCODE_RETURN2: c_int = 158;
pub const SDL_SCANCODE_SEPARATOR: c_int = 159;
pub const SDL_SCANCODE_OUT: c_int = 160;
pub const SDL_SCANCODE_OPER: c_int = 161;
pub const SDL_SCANCODE_CLEARAGAIN: c_int = 162;
pub const SDL_SCANCODE_CRSEL: c_int = 163;
pub const SDL_SCANCODE_EXSEL: c_int = 164;
pub const SDL_SCANCODE_KP_00: c_int = 176;
pub const SDL_SCANCODE_KP_000: c_int = 177;
pub const SDL_SCANCODE_THOUSANDSSEPARATOR: c_int = 178;
pub const SDL_SCANCODE_DECIMALSEPARATOR: c_int = 179;
pub const SDL_SCANCODE_CURRENCYUNIT: c_int = 180;
pub const SDL_SCANCODE_CURRENCYSUBUNIT: c_int = 181;
pub const SDL_SCANCODE_KP_LEFTPAREN: c_int = 182;
pub const SDL_SCANCODE_KP_RIGHTPAREN: c_int = 183;
pub const SDL_SCANCODE_KP_LEFTBRACE: c_int = 184;
pub const SDL_SCANCODE_KP_RIGHTBRACE: c_int = 185;
pub const SDL_SCANCODE_KP_TAB: c_int = 186;
pub const SDL_SCANCODE_KP_BACKSPACE: c_int = 187;
pub const SDL_SCANCODE_KP_A: c_int = 188;
pub const SDL_SCANCODE_KP_B: c_int = 189;
pub const SDL_SCANCODE_KP_C: c_int = 190;
pub const SDL_SCANCODE_KP_D: c_int = 191;
pub const SDL_SCANCODE_KP_E: c_int = 192;
pub const SDL_SCANCODE_KP_F: c_int = 193;
pub const SDL_SCANCODE_KP_XOR: c_int = 194;
pub const SDL_SCANCODE_KP_POWER: c_int = 195;
pub const SDL_SCANCODE_KP_PERCENT: c_int = 196;
pub const SDL_SCANCODE_KP_LESS: c_int = 197;
pub const SDL_SCANCODE_KP_GREATER: c_int = 198;
pub const SDL_SCANCODE_KP_AMPERSAND: c_int = 199;
pub const SDL_SCANCODE_KP_DBLAMPERSAND: c_int = 200;
pub const SDL_SCANCODE_KP_VERTICALBAR: c_int = 201;
pub const SDL_SCANCODE_KP_DBLVERTICALBAR: c_int = 202;
pub const SDL_SCANCODE_KP_COLON: c_int = 203;
pub const SDL_SCANCODE_KP_HASH: c_int = 204;
pub const SDL_SCANCODE_KP_SPACE: c_int = 205;
pub const SDL_SCANCODE_KP_AT: c_int = 206;
pub const SDL_SCANCODE_KP_EXCLAM: c_int = 207;
pub const SDL_SCANCODE_KP_MEMSTORE: c_int = 208;
pub const SDL_SCANCODE_KP_MEMRECALL: c_int = 209;
pub const SDL_SCANCODE_KP_MEMCLEAR: c_int = 210;
pub const SDL_SCANCODE_KP_MEMADD: c_int = 211;
pub const SDL_SCANCODE_KP_MEMSUBTRACT: c_int = 212;
pub const SDL_SCANCODE_KP_MEMMULTIPLY: c_int = 213;
pub const SDL_SCANCODE_KP_MEMDIVIDE: c_int = 214;
pub const SDL_SCANCODE_KP_PLUSMINUS: c_int = 215;
pub const SDL_SCANCODE_KP_CLEAR: c_int = 216;
pub const SDL_SCANCODE_KP_CLEARENTRY: c_int = 217;
pub const SDL_SCANCODE_KP_BINARY: c_int = 218;
pub const SDL_SCANCODE_KP_OCTAL: c_int = 219;
pub const SDL_SCANCODE_KP_DECIMAL: c_int = 220;
pub const SDL_SCANCODE_KP_HEXADECIMAL: c_int = 221;
pub const SDL_SCANCODE_LCTRL: c_int = 224;
pub const SDL_SCANCODE_LSHIFT: c_int = 225;
pub const SDL_SCANCODE_LALT: c_int = 226;
pub const SDL_SCANCODE_LGUI: c_int = 227;
pub const SDL_SCANCODE_RCTRL: c_int = 228;
pub const SDL_SCANCODE_RSHIFT: c_int = 229;
pub const SDL_SCANCODE_RALT: c_int = 230;
pub const SDL_SCANCODE_RGUI: c_int = 231;
pub const SDL_SCANCODE_MODE: c_int = 257;
pub const SDL_SCANCODE_SLEEP: c_int = 258;
pub const SDL_SCANCODE_WAKE: c_int = 259;
pub const SDL_SCANCODE_CHANNEL_INCREMENT: c_int = 260;
pub const SDL_SCANCODE_CHANNEL_DECREMENT: c_int = 261;
pub const SDL_SCANCODE_MEDIA_PLAY: c_int = 262;
pub const SDL_SCANCODE_MEDIA_PAUSE: c_int = 263;
pub const SDL_SCANCODE_MEDIA_RECORD: c_int = 264;
pub const SDL_SCANCODE_MEDIA_FAST_FORWARD: c_int = 265;
pub const SDL_SCANCODE_MEDIA_REWIND: c_int = 266;
pub const SDL_SCANCODE_MEDIA_NEXT_TRACK: c_int = 267;
pub const SDL_SCANCODE_MEDIA_PREVIOUS_TRACK: c_int = 268;
pub const SDL_SCANCODE_MEDIA_STOP: c_int = 269;
pub const SDL_SCANCODE_MEDIA_EJECT: c_int = 270;
pub const SDL_SCANCODE_MEDIA_PLAY_PAUSE: c_int = 271;
pub const SDL_SCANCODE_MEDIA_SELECT: c_int = 272;
pub const SDL_SCANCODE_AC_NEW: c_int = 273;
pub const SDL_SCANCODE_AC_OPEN: c_int = 274;
pub const SDL_SCANCODE_AC_CLOSE: c_int = 275;
pub const SDL_SCANCODE_AC_EXIT: c_int = 276;
pub const SDL_SCANCODE_AC_SAVE: c_int = 277;
pub const SDL_SCANCODE_AC_PRINT: c_int = 278;
pub const SDL_SCANCODE_AC_PROPERTIES: c_int = 279;
pub const SDL_SCANCODE_AC_SEARCH: c_int = 280;
pub const SDL_SCANCODE_AC_HOME: c_int = 281;
pub const SDL_SCANCODE_AC_BACK: c_int = 282;
pub const SDL_SCANCODE_AC_FORWARD: c_int = 283;
pub const SDL_SCANCODE_AC_STOP: c_int = 284;
pub const SDL_SCANCODE_AC_REFRESH: c_int = 285;
pub const SDL_SCANCODE_AC_BOOKMARKS: c_int = 286;
pub const SDL_SCANCODE_SOFTLEFT: c_int = 287;
pub const SDL_SCANCODE_SOFTRIGHT: c_int = 288;
pub const SDL_SCANCODE_CALL: c_int = 289;
pub const SDL_SCANCODE_ENDCALL: c_int = 290;
pub const SDL_SCANCODE_RESERVED: c_int = 400;
pub const SDL_SCANCODE_COUNT: c_int = 512;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keycode = Uint32;
pub const SDL_Keymod = Uint16;
pub const SDL_KeyboardID = Uint32;
pub extern fn SDL_HasKeyboard() bool;
pub extern fn SDL_GetKeyboards(count: [*c]c_int) [*c]SDL_KeyboardID;
pub extern fn SDL_GetKeyboardNameForID(instance_id: SDL_KeyboardID) [*c]const u8;
pub extern fn SDL_GetKeyboardFocus() ?*SDL_Window;
pub extern fn SDL_GetKeyboardState(numkeys: [*c]c_int) [*c]const bool;
pub extern fn SDL_ResetKeyboard() void;
pub extern fn SDL_GetModState() SDL_Keymod;
pub extern fn SDL_SetModState(modstate: SDL_Keymod) void;
pub extern fn SDL_GetKeyFromScancode(scancode: SDL_Scancode, modstate: SDL_Keymod, key_event: bool) SDL_Keycode;
pub extern fn SDL_GetScancodeFromKey(key: SDL_Keycode, modstate: [*c]SDL_Keymod) SDL_Scancode;
pub extern fn SDL_SetScancodeName(scancode: SDL_Scancode, name: [*c]const u8) bool;
pub extern fn SDL_GetScancodeName(scancode: SDL_Scancode) [*c]const u8;
pub extern fn SDL_GetScancodeFromName(name: [*c]const u8) SDL_Scancode;
pub extern fn SDL_GetKeyName(key: SDL_Keycode) [*c]const u8;
pub extern fn SDL_GetKeyFromName(name: [*c]const u8) SDL_Keycode;
pub extern fn SDL_StartTextInput(window: ?*SDL_Window) bool;
pub const SDL_TEXTINPUT_TYPE_TEXT: c_int = 0;
pub const SDL_TEXTINPUT_TYPE_TEXT_NAME: c_int = 1;
pub const SDL_TEXTINPUT_TYPE_TEXT_EMAIL: c_int = 2;
pub const SDL_TEXTINPUT_TYPE_TEXT_USERNAME: c_int = 3;
pub const SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN: c_int = 4;
pub const SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE: c_int = 5;
pub const SDL_TEXTINPUT_TYPE_NUMBER: c_int = 6;
pub const SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN: c_int = 7;
pub const SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE: c_int = 8;
pub const enum_SDL_TextInputType = c_uint;
pub const SDL_TextInputType = enum_SDL_TextInputType;
pub const SDL_CAPITALIZE_NONE: c_int = 0;
pub const SDL_CAPITALIZE_SENTENCES: c_int = 1;
pub const SDL_CAPITALIZE_WORDS: c_int = 2;
pub const SDL_CAPITALIZE_LETTERS: c_int = 3;
pub const enum_SDL_Capitalization = c_uint;
pub const SDL_Capitalization = enum_SDL_Capitalization;
pub extern fn SDL_StartTextInputWithProperties(window: ?*SDL_Window, props: SDL_PropertiesID) bool;
pub extern fn SDL_TextInputActive(window: ?*SDL_Window) bool;
pub extern fn SDL_StopTextInput(window: ?*SDL_Window) bool;
pub extern fn SDL_ClearComposition(window: ?*SDL_Window) bool;
pub extern fn SDL_SetTextInputArea(window: ?*SDL_Window, rect: [*c]const SDL_Rect, cursor: c_int) bool;
pub extern fn SDL_GetTextInputArea(window: ?*SDL_Window, rect: [*c]SDL_Rect, cursor: [*c]c_int) bool;
pub extern fn SDL_HasScreenKeyboardSupport() bool;
pub extern fn SDL_ScreenKeyboardShown(window: ?*SDL_Window) bool;
pub const SDL_MouseID = Uint32;
pub const struct_SDL_Cursor = opaque {};
pub const SDL_Cursor = struct_SDL_Cursor;
pub const SDL_SYSTEM_CURSOR_DEFAULT: c_int = 0;
pub const SDL_SYSTEM_CURSOR_TEXT: c_int = 1;
pub const SDL_SYSTEM_CURSOR_WAIT: c_int = 2;
pub const SDL_SYSTEM_CURSOR_CROSSHAIR: c_int = 3;
pub const SDL_SYSTEM_CURSOR_PROGRESS: c_int = 4;
pub const SDL_SYSTEM_CURSOR_NWSE_RESIZE: c_int = 5;
pub const SDL_SYSTEM_CURSOR_NESW_RESIZE: c_int = 6;
pub const SDL_SYSTEM_CURSOR_EW_RESIZE: c_int = 7;
pub const SDL_SYSTEM_CURSOR_NS_RESIZE: c_int = 8;
pub const SDL_SYSTEM_CURSOR_MOVE: c_int = 9;
pub const SDL_SYSTEM_CURSOR_NOT_ALLOWED: c_int = 10;
pub const SDL_SYSTEM_CURSOR_POINTER: c_int = 11;
pub const SDL_SYSTEM_CURSOR_NW_RESIZE: c_int = 12;
pub const SDL_SYSTEM_CURSOR_N_RESIZE: c_int = 13;
pub const SDL_SYSTEM_CURSOR_NE_RESIZE: c_int = 14;
pub const SDL_SYSTEM_CURSOR_E_RESIZE: c_int = 15;
pub const SDL_SYSTEM_CURSOR_SE_RESIZE: c_int = 16;
pub const SDL_SYSTEM_CURSOR_S_RESIZE: c_int = 17;
pub const SDL_SYSTEM_CURSOR_SW_RESIZE: c_int = 18;
pub const SDL_SYSTEM_CURSOR_W_RESIZE: c_int = 19;
pub const SDL_SYSTEM_CURSOR_COUNT: c_int = 20;
pub const enum_SDL_SystemCursor = c_uint;
pub const SDL_SystemCursor = enum_SDL_SystemCursor;
pub const SDL_MOUSEWHEEL_NORMAL: c_int = 0;
pub const SDL_MOUSEWHEEL_FLIPPED: c_int = 1;
pub const enum_SDL_MouseWheelDirection = c_uint;
pub const SDL_MouseWheelDirection = enum_SDL_MouseWheelDirection;
pub const SDL_MouseButtonFlags = Uint32;
pub extern fn SDL_HasMouse() bool;
pub extern fn SDL_GetMice(count: [*c]c_int) [*c]SDL_MouseID;
pub extern fn SDL_GetMouseNameForID(instance_id: SDL_MouseID) [*c]const u8;
pub extern fn SDL_GetMouseFocus() ?*SDL_Window;
pub extern fn SDL_GetMouseState(x: [*c]f32, y: [*c]f32) SDL_MouseButtonFlags;
pub extern fn SDL_GetGlobalMouseState(x: [*c]f32, y: [*c]f32) SDL_MouseButtonFlags;
pub extern fn SDL_GetRelativeMouseState(x: [*c]f32, y: [*c]f32) SDL_MouseButtonFlags;
pub extern fn SDL_WarpMouseInWindow(window: ?*SDL_Window, x: f32, y: f32) void;
pub extern fn SDL_WarpMouseGlobal(x: f32, y: f32) bool;
pub extern fn SDL_SetWindowRelativeMouseMode(window: ?*SDL_Window, enabled: bool) bool;
pub extern fn SDL_GetWindowRelativeMouseMode(window: ?*SDL_Window) bool;
pub extern fn SDL_CaptureMouse(enabled: bool) bool;
pub extern fn SDL_CreateCursor(data: [*c]const Uint8, mask: [*c]const Uint8, w: c_int, h: c_int, hot_x: c_int, hot_y: c_int) ?*SDL_Cursor;
pub extern fn SDL_CreateColorCursor(surface: [*c]SDL_Surface, hot_x: c_int, hot_y: c_int) ?*SDL_Cursor;
pub extern fn SDL_CreateSystemCursor(id: SDL_SystemCursor) ?*SDL_Cursor;
pub extern fn SDL_SetCursor(cursor: ?*SDL_Cursor) bool;
pub extern fn SDL_GetCursor() ?*SDL_Cursor;
pub extern fn SDL_GetDefaultCursor() ?*SDL_Cursor;
pub extern fn SDL_DestroyCursor(cursor: ?*SDL_Cursor) void;
pub extern fn SDL_ShowCursor() bool;
pub extern fn SDL_HideCursor() bool;
pub extern fn SDL_CursorVisible() bool;
pub const SDL_TouchID = Uint64;
pub const SDL_FingerID = Uint64;
pub const SDL_TOUCH_DEVICE_INVALID: c_int = -1;
pub const SDL_TOUCH_DEVICE_DIRECT: c_int = 0;
pub const SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE: c_int = 1;
pub const SDL_TOUCH_DEVICE_INDIRECT_RELATIVE: c_int = 2;
pub const enum_SDL_TouchDeviceType = c_int;
pub const SDL_TouchDeviceType = enum_SDL_TouchDeviceType;
pub const struct_SDL_Finger = extern struct {
    id: SDL_FingerID = @import("std").mem.zeroes(SDL_FingerID),
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    pressure: f32 = @import("std").mem.zeroes(f32),
};
pub const SDL_Finger = struct_SDL_Finger;
pub extern fn SDL_GetTouchDevices(count: [*c]c_int) [*c]SDL_TouchID;
pub extern fn SDL_GetTouchDeviceName(touchID: SDL_TouchID) [*c]const u8;
pub extern fn SDL_GetTouchDeviceType(touchID: SDL_TouchID) SDL_TouchDeviceType;
pub extern fn SDL_GetTouchFingers(touchID: SDL_TouchID, count: [*c]c_int) [*c][*c]SDL_Finger;
pub const SDL_PenID = Uint32;
pub const SDL_PenInputFlags = Uint32;
pub const SDL_PEN_AXIS_PRESSURE: c_int = 0;
pub const SDL_PEN_AXIS_XTILT: c_int = 1;
pub const SDL_PEN_AXIS_YTILT: c_int = 2;
pub const SDL_PEN_AXIS_DISTANCE: c_int = 3;
pub const SDL_PEN_AXIS_ROTATION: c_int = 4;
pub const SDL_PEN_AXIS_SLIDER: c_int = 5;
pub const SDL_PEN_AXIS_TANGENTIAL_PRESSURE: c_int = 6;
pub const SDL_PEN_AXIS_COUNT: c_int = 7;
pub const enum_SDL_PenAxis = c_uint;
pub const SDL_PenAxis = enum_SDL_PenAxis;
pub const SDL_EVENT_FIRST: c_int = 0;
pub const SDL_EVENT_QUIT: c_int = 256;
pub const SDL_EVENT_TERMINATING: c_int = 257;
pub const SDL_EVENT_LOW_MEMORY: c_int = 258;
pub const SDL_EVENT_WILL_ENTER_BACKGROUND: c_int = 259;
pub const SDL_EVENT_DID_ENTER_BACKGROUND: c_int = 260;
pub const SDL_EVENT_WILL_ENTER_FOREGROUND: c_int = 261;
pub const SDL_EVENT_DID_ENTER_FOREGROUND: c_int = 262;
pub const SDL_EVENT_LOCALE_CHANGED: c_int = 263;
pub const SDL_EVENT_SYSTEM_THEME_CHANGED: c_int = 264;
pub const SDL_EVENT_DISPLAY_ORIENTATION: c_int = 337;
pub const SDL_EVENT_DISPLAY_ADDED: c_int = 338;
pub const SDL_EVENT_DISPLAY_REMOVED: c_int = 339;
pub const SDL_EVENT_DISPLAY_MOVED: c_int = 340;
pub const SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED: c_int = 341;
pub const SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED: c_int = 342;
pub const SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED: c_int = 343;
pub const SDL_EVENT_DISPLAY_FIRST: c_int = 337;
pub const SDL_EVENT_DISPLAY_LAST: c_int = 343;
pub const SDL_EVENT_WINDOW_SHOWN: c_int = 514;
pub const SDL_EVENT_WINDOW_HIDDEN: c_int = 515;
pub const SDL_EVENT_WINDOW_EXPOSED: c_int = 516;
pub const SDL_EVENT_WINDOW_MOVED: c_int = 517;
pub const SDL_EVENT_WINDOW_RESIZED: c_int = 518;
pub const SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED: c_int = 519;
pub const SDL_EVENT_WINDOW_METAL_VIEW_RESIZED: c_int = 520;
pub const SDL_EVENT_WINDOW_MINIMIZED: c_int = 521;
pub const SDL_EVENT_WINDOW_MAXIMIZED: c_int = 522;
pub const SDL_EVENT_WINDOW_RESTORED: c_int = 523;
pub const SDL_EVENT_WINDOW_MOUSE_ENTER: c_int = 524;
pub const SDL_EVENT_WINDOW_MOUSE_LEAVE: c_int = 525;
pub const SDL_EVENT_WINDOW_FOCUS_GAINED: c_int = 526;
pub const SDL_EVENT_WINDOW_FOCUS_LOST: c_int = 527;
pub const SDL_EVENT_WINDOW_CLOSE_REQUESTED: c_int = 528;
pub const SDL_EVENT_WINDOW_HIT_TEST: c_int = 529;
pub const SDL_EVENT_WINDOW_ICCPROF_CHANGED: c_int = 530;
pub const SDL_EVENT_WINDOW_DISPLAY_CHANGED: c_int = 531;
pub const SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED: c_int = 532;
pub const SDL_EVENT_WINDOW_SAFE_AREA_CHANGED: c_int = 533;
pub const SDL_EVENT_WINDOW_OCCLUDED: c_int = 534;
pub const SDL_EVENT_WINDOW_ENTER_FULLSCREEN: c_int = 535;
pub const SDL_EVENT_WINDOW_LEAVE_FULLSCREEN: c_int = 536;
pub const SDL_EVENT_WINDOW_DESTROYED: c_int = 537;
pub const SDL_EVENT_WINDOW_HDR_STATE_CHANGED: c_int = 538;
pub const SDL_EVENT_WINDOW_FIRST: c_int = 514;
pub const SDL_EVENT_WINDOW_LAST: c_int = 538;
pub const SDL_EVENT_KEY_DOWN: c_int = 768;
pub const SDL_EVENT_KEY_UP: c_int = 769;
pub const SDL_EVENT_TEXT_EDITING: c_int = 770;
pub const SDL_EVENT_TEXT_INPUT: c_int = 771;
pub const SDL_EVENT_KEYMAP_CHANGED: c_int = 772;
pub const SDL_EVENT_KEYBOARD_ADDED: c_int = 773;
pub const SDL_EVENT_KEYBOARD_REMOVED: c_int = 774;
pub const SDL_EVENT_TEXT_EDITING_CANDIDATES: c_int = 775;
pub const SDL_EVENT_MOUSE_MOTION: c_int = 1024;
pub const SDL_EVENT_MOUSE_BUTTON_DOWN: c_int = 1025;
pub const SDL_EVENT_MOUSE_BUTTON_UP: c_int = 1026;
pub const SDL_EVENT_MOUSE_WHEEL: c_int = 1027;
pub const SDL_EVENT_MOUSE_ADDED: c_int = 1028;
pub const SDL_EVENT_MOUSE_REMOVED: c_int = 1029;
pub const SDL_EVENT_JOYSTICK_AXIS_MOTION: c_int = 1536;
pub const SDL_EVENT_JOYSTICK_BALL_MOTION: c_int = 1537;
pub const SDL_EVENT_JOYSTICK_HAT_MOTION: c_int = 1538;
pub const SDL_EVENT_JOYSTICK_BUTTON_DOWN: c_int = 1539;
pub const SDL_EVENT_JOYSTICK_BUTTON_UP: c_int = 1540;
pub const SDL_EVENT_JOYSTICK_ADDED: c_int = 1541;
pub const SDL_EVENT_JOYSTICK_REMOVED: c_int = 1542;
pub const SDL_EVENT_JOYSTICK_BATTERY_UPDATED: c_int = 1543;
pub const SDL_EVENT_JOYSTICK_UPDATE_COMPLETE: c_int = 1544;
pub const SDL_EVENT_GAMEPAD_AXIS_MOTION: c_int = 1616;
pub const SDL_EVENT_GAMEPAD_BUTTON_DOWN: c_int = 1617;
pub const SDL_EVENT_GAMEPAD_BUTTON_UP: c_int = 1618;
pub const SDL_EVENT_GAMEPAD_ADDED: c_int = 1619;
pub const SDL_EVENT_GAMEPAD_REMOVED: c_int = 1620;
pub const SDL_EVENT_GAMEPAD_REMAPPED: c_int = 1621;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN: c_int = 1622;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION: c_int = 1623;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_UP: c_int = 1624;
pub const SDL_EVENT_GAMEPAD_SENSOR_UPDATE: c_int = 1625;
pub const SDL_EVENT_GAMEPAD_UPDATE_COMPLETE: c_int = 1626;
pub const SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED: c_int = 1627;
pub const SDL_EVENT_FINGER_DOWN: c_int = 1792;
pub const SDL_EVENT_FINGER_UP: c_int = 1793;
pub const SDL_EVENT_FINGER_MOTION: c_int = 1794;
pub const SDL_EVENT_FINGER_CANCELED: c_int = 1795;
pub const SDL_EVENT_CLIPBOARD_UPDATE: c_int = 2304;
pub const SDL_EVENT_DROP_FILE: c_int = 4096;
pub const SDL_EVENT_DROP_TEXT: c_int = 4097;
pub const SDL_EVENT_DROP_BEGIN: c_int = 4098;
pub const SDL_EVENT_DROP_COMPLETE: c_int = 4099;
pub const SDL_EVENT_DROP_POSITION: c_int = 4100;
pub const SDL_EVENT_AUDIO_DEVICE_ADDED: c_int = 4352;
pub const SDL_EVENT_AUDIO_DEVICE_REMOVED: c_int = 4353;
pub const SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED: c_int = 4354;
pub const SDL_EVENT_SENSOR_UPDATE: c_int = 4608;
pub const SDL_EVENT_PEN_PROXIMITY_IN: c_int = 4864;
pub const SDL_EVENT_PEN_PROXIMITY_OUT: c_int = 4865;
pub const SDL_EVENT_PEN_DOWN: c_int = 4866;
pub const SDL_EVENT_PEN_UP: c_int = 4867;
pub const SDL_EVENT_PEN_BUTTON_DOWN: c_int = 4868;
pub const SDL_EVENT_PEN_BUTTON_UP: c_int = 4869;
pub const SDL_EVENT_PEN_MOTION: c_int = 4870;
pub const SDL_EVENT_PEN_AXIS: c_int = 4871;
pub const SDL_EVENT_CAMERA_DEVICE_ADDED: c_int = 5120;
pub const SDL_EVENT_CAMERA_DEVICE_REMOVED: c_int = 5121;
pub const SDL_EVENT_CAMERA_DEVICE_APPROVED: c_int = 5122;
pub const SDL_EVENT_CAMERA_DEVICE_DENIED: c_int = 5123;
pub const SDL_EVENT_RENDER_TARGETS_RESET: c_int = 8192;
pub const SDL_EVENT_RENDER_DEVICE_RESET: c_int = 8193;
pub const SDL_EVENT_RENDER_DEVICE_LOST: c_int = 8194;
pub const SDL_EVENT_PRIVATE0: c_int = 16384;
pub const SDL_EVENT_PRIVATE1: c_int = 16385;
pub const SDL_EVENT_PRIVATE2: c_int = 16386;
pub const SDL_EVENT_PRIVATE3: c_int = 16387;
pub const SDL_EVENT_POLL_SENTINEL: c_int = 32512;
pub const SDL_EVENT_USER: c_int = 32768;
pub const SDL_EVENT_LAST: c_int = 65535;
pub const SDL_EVENT_ENUM_PADDING: c_int = 2147483647;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub const struct_SDL_CommonEvent = extern struct {
    type: Uint32 = @import("std").mem.zeroes(Uint32),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
};
pub const SDL_CommonEvent = struct_SDL_CommonEvent;
pub const struct_SDL_DisplayEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    displayID: SDL_DisplayID = @import("std").mem.zeroes(SDL_DisplayID),
    data1: Sint32 = @import("std").mem.zeroes(Sint32),
    data2: Sint32 = @import("std").mem.zeroes(Sint32),
};
pub const SDL_DisplayEvent = struct_SDL_DisplayEvent;
pub const struct_SDL_WindowEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
    data1: Sint32 = @import("std").mem.zeroes(Sint32),
    data2: Sint32 = @import("std").mem.zeroes(Sint32),
};
pub const SDL_WindowEvent = struct_SDL_WindowEvent;
pub const struct_SDL_KeyboardDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    which: SDL_KeyboardID = @import("std").mem.zeroes(SDL_KeyboardID),
};
pub const SDL_KeyboardDeviceEvent = struct_SDL_KeyboardDeviceEvent;
pub const struct_SDL_KeyboardEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
    which: SDL_KeyboardID = @import("std").mem.zeroes(SDL_KeyboardID),
    scancode: SDL_Scancode = @import("std").mem.zeroes(SDL_Scancode),
    key: SDL_Keycode = @import("std").mem.zeroes(SDL_Keycode),
    mod: SDL_Keymod = @import("std").mem.zeroes(SDL_Keymod),
    raw: Uint16 = @import("std").mem.zeroes(Uint16),
    down: bool = @import("std").mem.zeroes(bool),
    repeat: bool = @import("std").mem.zeroes(bool),
};
pub const SDL_KeyboardEvent = struct_SDL_KeyboardEvent;
pub const struct_SDL_TextEditingEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
    text: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    start: Sint32 = @import("std").mem.zeroes(Sint32),
    length: Sint32 = @import("std").mem.zeroes(Sint32),
};
pub const SDL_TextEditingEvent = struct_SDL_TextEditingEvent;
pub const struct_SDL_TextEditingCandidatesEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
    candidates: [*c]const [*c]const u8 = @import("std").mem.zeroes([*c]const [*c]const u8),
    num_candidates: Sint32 = @import("std").mem.zeroes(Sint32),
    selected_candidate: Sint32 = @import("std").mem.zeroes(Sint32),
    horizontal: bool = @import("std").mem.zeroes(bool),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
    padding3: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_TextEditingCandidatesEvent = struct_SDL_TextEditingCandidatesEvent;
pub const struct_SDL_TextInputEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
    text: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const SDL_TextInputEvent = struct_SDL_TextInputEvent;
pub const struct_SDL_MouseDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    which: SDL_MouseID = @import("std").mem.zeroes(SDL_MouseID),
};
pub const SDL_MouseDeviceEvent = struct_SDL_MouseDeviceEvent;
pub const struct_SDL_MouseMotionEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
    which: SDL_MouseID = @import("std").mem.zeroes(SDL_MouseID),
    state: SDL_MouseButtonFlags = @import("std").mem.zeroes(SDL_MouseButtonFlags),
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    xrel: f32 = @import("std").mem.zeroes(f32),
    yrel: f32 = @import("std").mem.zeroes(f32),
};
pub const SDL_MouseMotionEvent = struct_SDL_MouseMotionEvent;
pub const struct_SDL_MouseButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
    which: SDL_MouseID = @import("std").mem.zeroes(SDL_MouseID),
    button: Uint8 = @import("std").mem.zeroes(Uint8),
    down: bool = @import("std").mem.zeroes(bool),
    clicks: Uint8 = @import("std").mem.zeroes(Uint8),
    padding: Uint8 = @import("std").mem.zeroes(Uint8),
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
};
pub const SDL_MouseButtonEvent = struct_SDL_MouseButtonEvent;
pub const struct_SDL_MouseWheelEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
    which: SDL_MouseID = @import("std").mem.zeroes(SDL_MouseID),
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    direction: SDL_MouseWheelDirection = @import("std").mem.zeroes(SDL_MouseWheelDirection),
    mouse_x: f32 = @import("std").mem.zeroes(f32),
    mouse_y: f32 = @import("std").mem.zeroes(f32),
    integer_x: Sint32 = @import("std").mem.zeroes(Sint32),
    integer_y: Sint32 = @import("std").mem.zeroes(Sint32),
};
pub const SDL_MouseWheelEvent = struct_SDL_MouseWheelEvent;
pub const struct_SDL_JoyAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    which: SDL_JoystickID = @import("std").mem.zeroes(SDL_JoystickID),
    axis: Uint8 = @import("std").mem.zeroes(Uint8),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
    padding3: Uint8 = @import("std").mem.zeroes(Uint8),
    value: Sint16 = @import("std").mem.zeroes(Sint16),
    padding4: Uint16 = @import("std").mem.zeroes(Uint16),
};
pub const SDL_JoyAxisEvent = struct_SDL_JoyAxisEvent;
pub const struct_SDL_JoyBallEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    which: SDL_JoystickID = @import("std").mem.zeroes(SDL_JoystickID),
    ball: Uint8 = @import("std").mem.zeroes(Uint8),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
    padding3: Uint8 = @import("std").mem.zeroes(Uint8),
    xrel: Sint16 = @import("std").mem.zeroes(Sint16),
    yrel: Sint16 = @import("std").mem.zeroes(Sint16),
};
pub const SDL_JoyBallEvent = struct_SDL_JoyBallEvent;
pub const struct_SDL_JoyHatEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    which: SDL_JoystickID = @import("std").mem.zeroes(SDL_JoystickID),
    hat: Uint8 = @import("std").mem.zeroes(Uint8),
    value: Uint8 = @import("std").mem.zeroes(Uint8),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_JoyHatEvent = struct_SDL_JoyHatEvent;
pub const struct_SDL_JoyButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    which: SDL_JoystickID = @import("std").mem.zeroes(SDL_JoystickID),
    button: Uint8 = @import("std").mem.zeroes(Uint8),
    down: bool = @import("std").mem.zeroes(bool),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_JoyButtonEvent = struct_SDL_JoyButtonEvent;
pub const struct_SDL_JoyDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    which: SDL_JoystickID = @import("std").mem.zeroes(SDL_JoystickID),
};
pub const SDL_JoyDeviceEvent = struct_SDL_JoyDeviceEvent;
pub const struct_SDL_JoyBatteryEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    which: SDL_JoystickID = @import("std").mem.zeroes(SDL_JoystickID),
    state: SDL_PowerState = @import("std").mem.zeroes(SDL_PowerState),
    percent: c_int = @import("std").mem.zeroes(c_int),
};
pub const SDL_JoyBatteryEvent = struct_SDL_JoyBatteryEvent;
pub const struct_SDL_GamepadAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    which: SDL_JoystickID = @import("std").mem.zeroes(SDL_JoystickID),
    axis: Uint8 = @import("std").mem.zeroes(Uint8),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
    padding3: Uint8 = @import("std").mem.zeroes(Uint8),
    value: Sint16 = @import("std").mem.zeroes(Sint16),
    padding4: Uint16 = @import("std").mem.zeroes(Uint16),
};
pub const SDL_GamepadAxisEvent = struct_SDL_GamepadAxisEvent;
pub const struct_SDL_GamepadButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    which: SDL_JoystickID = @import("std").mem.zeroes(SDL_JoystickID),
    button: Uint8 = @import("std").mem.zeroes(Uint8),
    down: bool = @import("std").mem.zeroes(bool),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_GamepadButtonEvent = struct_SDL_GamepadButtonEvent;
pub const struct_SDL_GamepadDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    which: SDL_JoystickID = @import("std").mem.zeroes(SDL_JoystickID),
};
pub const SDL_GamepadDeviceEvent = struct_SDL_GamepadDeviceEvent;
pub const struct_SDL_GamepadTouchpadEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    which: SDL_JoystickID = @import("std").mem.zeroes(SDL_JoystickID),
    touchpad: Sint32 = @import("std").mem.zeroes(Sint32),
    finger: Sint32 = @import("std").mem.zeroes(Sint32),
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    pressure: f32 = @import("std").mem.zeroes(f32),
};
pub const SDL_GamepadTouchpadEvent = struct_SDL_GamepadTouchpadEvent;
pub const struct_SDL_GamepadSensorEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    which: SDL_JoystickID = @import("std").mem.zeroes(SDL_JoystickID),
    sensor: Sint32 = @import("std").mem.zeroes(Sint32),
    data: [3]f32 = @import("std").mem.zeroes([3]f32),
    sensor_timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
};
pub const SDL_GamepadSensorEvent = struct_SDL_GamepadSensorEvent;
pub const struct_SDL_AudioDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    which: SDL_AudioDeviceID = @import("std").mem.zeroes(SDL_AudioDeviceID),
    recording: bool = @import("std").mem.zeroes(bool),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
    padding3: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_AudioDeviceEvent = struct_SDL_AudioDeviceEvent;
pub const struct_SDL_CameraDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    which: SDL_CameraID = @import("std").mem.zeroes(SDL_CameraID),
};
pub const SDL_CameraDeviceEvent = struct_SDL_CameraDeviceEvent;
pub const struct_SDL_RenderEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
};
pub const SDL_RenderEvent = struct_SDL_RenderEvent;
pub const struct_SDL_TouchFingerEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    touchID: SDL_TouchID = @import("std").mem.zeroes(SDL_TouchID),
    fingerID: SDL_FingerID = @import("std").mem.zeroes(SDL_FingerID),
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    dx: f32 = @import("std").mem.zeroes(f32),
    dy: f32 = @import("std").mem.zeroes(f32),
    pressure: f32 = @import("std").mem.zeroes(f32),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
};
pub const SDL_TouchFingerEvent = struct_SDL_TouchFingerEvent;
pub const struct_SDL_PenProximityEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
    which: SDL_PenID = @import("std").mem.zeroes(SDL_PenID),
};
pub const SDL_PenProximityEvent = struct_SDL_PenProximityEvent;
pub const struct_SDL_PenMotionEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
    which: SDL_PenID = @import("std").mem.zeroes(SDL_PenID),
    pen_state: SDL_PenInputFlags = @import("std").mem.zeroes(SDL_PenInputFlags),
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
};
pub const SDL_PenMotionEvent = struct_SDL_PenMotionEvent;
pub const struct_SDL_PenTouchEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
    which: SDL_PenID = @import("std").mem.zeroes(SDL_PenID),
    pen_state: SDL_PenInputFlags = @import("std").mem.zeroes(SDL_PenInputFlags),
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    eraser: bool = @import("std").mem.zeroes(bool),
    down: bool = @import("std").mem.zeroes(bool),
};
pub const SDL_PenTouchEvent = struct_SDL_PenTouchEvent;
pub const struct_SDL_PenButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
    which: SDL_PenID = @import("std").mem.zeroes(SDL_PenID),
    pen_state: SDL_PenInputFlags = @import("std").mem.zeroes(SDL_PenInputFlags),
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    button: Uint8 = @import("std").mem.zeroes(Uint8),
    down: bool = @import("std").mem.zeroes(bool),
};
pub const SDL_PenButtonEvent = struct_SDL_PenButtonEvent;
pub const struct_SDL_PenAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
    which: SDL_PenID = @import("std").mem.zeroes(SDL_PenID),
    pen_state: SDL_PenInputFlags = @import("std").mem.zeroes(SDL_PenInputFlags),
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    axis: SDL_PenAxis = @import("std").mem.zeroes(SDL_PenAxis),
    value: f32 = @import("std").mem.zeroes(f32),
};
pub const SDL_PenAxisEvent = struct_SDL_PenAxisEvent;
pub const struct_SDL_DropEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    source: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    data: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const SDL_DropEvent = struct_SDL_DropEvent;
pub const struct_SDL_ClipboardEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    owner: bool = @import("std").mem.zeroes(bool),
    num_mime_types: Sint32 = @import("std").mem.zeroes(Sint32),
    mime_types: [*c][*c]const u8 = @import("std").mem.zeroes([*c][*c]const u8),
};
pub const SDL_ClipboardEvent = struct_SDL_ClipboardEvent;
pub const struct_SDL_SensorEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    which: SDL_SensorID = @import("std").mem.zeroes(SDL_SensorID),
    data: [6]f32 = @import("std").mem.zeroes([6]f32),
    sensor_timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
};
pub const SDL_SensorEvent = struct_SDL_SensorEvent;
pub const struct_SDL_QuitEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
};
pub const SDL_QuitEvent = struct_SDL_QuitEvent;
pub const struct_SDL_UserEvent = extern struct {
    type: Uint32 = @import("std").mem.zeroes(Uint32),
    reserved: Uint32 = @import("std").mem.zeroes(Uint32),
    timestamp: Uint64 = @import("std").mem.zeroes(Uint64),
    windowID: SDL_WindowID = @import("std").mem.zeroes(SDL_WindowID),
    code: Sint32 = @import("std").mem.zeroes(Sint32),
    data1: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    data2: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const SDL_UserEvent = struct_SDL_UserEvent;
pub const union_SDL_Event = extern union {
    type: Uint32,
    common: SDL_CommonEvent,
    display: SDL_DisplayEvent,
    window: SDL_WindowEvent,
    kdevice: SDL_KeyboardDeviceEvent,
    key: SDL_KeyboardEvent,
    edit: SDL_TextEditingEvent,
    edit_candidates: SDL_TextEditingCandidatesEvent,
    text: SDL_TextInputEvent,
    mdevice: SDL_MouseDeviceEvent,
    motion: SDL_MouseMotionEvent,
    button: SDL_MouseButtonEvent,
    wheel: SDL_MouseWheelEvent,
    jdevice: SDL_JoyDeviceEvent,
    jaxis: SDL_JoyAxisEvent,
    jball: SDL_JoyBallEvent,
    jhat: SDL_JoyHatEvent,
    jbutton: SDL_JoyButtonEvent,
    jbattery: SDL_JoyBatteryEvent,
    gdevice: SDL_GamepadDeviceEvent,
    gaxis: SDL_GamepadAxisEvent,
    gbutton: SDL_GamepadButtonEvent,
    gtouchpad: SDL_GamepadTouchpadEvent,
    gsensor: SDL_GamepadSensorEvent,
    adevice: SDL_AudioDeviceEvent,
    cdevice: SDL_CameraDeviceEvent,
    sensor: SDL_SensorEvent,
    quit: SDL_QuitEvent,
    user: SDL_UserEvent,
    tfinger: SDL_TouchFingerEvent,
    pproximity: SDL_PenProximityEvent,
    ptouch: SDL_PenTouchEvent,
    pmotion: SDL_PenMotionEvent,
    pbutton: SDL_PenButtonEvent,
    paxis: SDL_PenAxisEvent,
    render: SDL_RenderEvent,
    drop: SDL_DropEvent,
    clipboard: SDL_ClipboardEvent,
    padding: [128]Uint8,
};
pub const SDL_Event = union_SDL_Event;
// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration
pub extern fn SDL_PumpEvents() void;
pub const SDL_ADDEVENT: c_int = 0;
pub const SDL_PEEKEVENT: c_int = 1;
pub const SDL_GETEVENT: c_int = 2;
pub const enum_SDL_EventAction = c_uint;
pub const SDL_EventAction = enum_SDL_EventAction;
pub extern fn SDL_PeepEvents(events: [*c]SDL_Event, numevents: c_int, action: SDL_EventAction, minType: Uint32, maxType: Uint32) c_int;
pub extern fn SDL_HasEvent(@"type": Uint32) bool;
pub extern fn SDL_HasEvents(minType: Uint32, maxType: Uint32) bool;
pub extern fn SDL_FlushEvent(@"type": Uint32) void;
pub extern fn SDL_FlushEvents(minType: Uint32, maxType: Uint32) void;
pub extern fn SDL_PollEvent(event: [*c]SDL_Event) bool;
pub extern fn SDL_WaitEvent(event: [*c]SDL_Event) bool;
pub extern fn SDL_WaitEventTimeout(event: [*c]SDL_Event, timeoutMS: Sint32) bool;
pub extern fn SDL_PushEvent(event: [*c]SDL_Event) bool;
pub const SDL_EventFilter = ?*const fn (?*anyopaque, [*c]SDL_Event) callconv(.c) bool;
pub extern fn SDL_SetEventFilter(filter: SDL_EventFilter, userdata: ?*anyopaque) void;
pub extern fn SDL_GetEventFilter(filter: [*c]SDL_EventFilter, userdata: [*c]?*anyopaque) bool;
pub extern fn SDL_AddEventWatch(filter: SDL_EventFilter, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveEventWatch(filter: SDL_EventFilter, userdata: ?*anyopaque) void;
pub extern fn SDL_FilterEvents(filter: SDL_EventFilter, userdata: ?*anyopaque) void;
pub extern fn SDL_SetEventEnabled(@"type": Uint32, enabled: bool) void;
pub extern fn SDL_EventEnabled(@"type": Uint32) bool;
pub extern fn SDL_RegisterEvents(numevents: c_int) Uint32;
pub extern fn SDL_GetWindowFromEvent(event: [*c]const SDL_Event) ?*SDL_Window;
pub extern fn SDL_GetBasePath() [*c]const u8;
pub extern fn SDL_GetPrefPath(org: [*c]const u8, app: [*c]const u8) [*c]u8;
pub const SDL_FOLDER_HOME: c_int = 0;
pub const SDL_FOLDER_DESKTOP: c_int = 1;
pub const SDL_FOLDER_DOCUMENTS: c_int = 2;
pub const SDL_FOLDER_DOWNLOADS: c_int = 3;
pub const SDL_FOLDER_MUSIC: c_int = 4;
pub const SDL_FOLDER_PICTURES: c_int = 5;
pub const SDL_FOLDER_PUBLICSHARE: c_int = 6;
pub const SDL_FOLDER_SAVEDGAMES: c_int = 7;
pub const SDL_FOLDER_SCREENSHOTS: c_int = 8;
pub const SDL_FOLDER_TEMPLATES: c_int = 9;
pub const SDL_FOLDER_VIDEOS: c_int = 10;
pub const SDL_FOLDER_COUNT: c_int = 11;
pub const enum_SDL_Folder = c_uint;
pub const SDL_Folder = enum_SDL_Folder;
pub extern fn SDL_GetUserFolder(folder: SDL_Folder) [*c]const u8;
pub const SDL_PATHTYPE_NONE: c_int = 0;
pub const SDL_PATHTYPE_FILE: c_int = 1;
pub const SDL_PATHTYPE_DIRECTORY: c_int = 2;
pub const SDL_PATHTYPE_OTHER: c_int = 3;
pub const enum_SDL_PathType = c_uint;
pub const SDL_PathType = enum_SDL_PathType;
pub const struct_SDL_PathInfo = extern struct {
    type: SDL_PathType = @import("std").mem.zeroes(SDL_PathType),
    size: Uint64 = @import("std").mem.zeroes(Uint64),
    create_time: SDL_Time = @import("std").mem.zeroes(SDL_Time),
    modify_time: SDL_Time = @import("std").mem.zeroes(SDL_Time),
    access_time: SDL_Time = @import("std").mem.zeroes(SDL_Time),
};
pub const SDL_PathInfo = struct_SDL_PathInfo;
pub const SDL_GlobFlags = Uint32;
pub extern fn SDL_CreateDirectory(path: [*c]const u8) bool;
pub const SDL_ENUM_CONTINUE: c_int = 0;
pub const SDL_ENUM_SUCCESS: c_int = 1;
pub const SDL_ENUM_FAILURE: c_int = 2;
pub const enum_SDL_EnumerationResult = c_uint;
pub const SDL_EnumerationResult = enum_SDL_EnumerationResult;
pub const SDL_EnumerateDirectoryCallback = ?*const fn (?*anyopaque, [*c]const u8, [*c]const u8) callconv(.c) SDL_EnumerationResult;
pub extern fn SDL_EnumerateDirectory(path: [*c]const u8, callback: SDL_EnumerateDirectoryCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemovePath(path: [*c]const u8) bool;
pub extern fn SDL_RenamePath(oldpath: [*c]const u8, newpath: [*c]const u8) bool;
pub extern fn SDL_CopyFile(oldpath: [*c]const u8, newpath: [*c]const u8) bool;
pub extern fn SDL_GetPathInfo(path: [*c]const u8, info: [*c]SDL_PathInfo) bool;
pub extern fn SDL_GlobDirectory(path: [*c]const u8, pattern: [*c]const u8, flags: SDL_GlobFlags, count: [*c]c_int) [*c][*c]u8;
pub extern fn SDL_GetCurrentDirectory() [*c]u8;
pub const struct_SDL_GPUDevice = opaque {};
pub const SDL_GPUDevice = struct_SDL_GPUDevice;
pub const struct_SDL_GPUBuffer = opaque {};
pub const SDL_GPUBuffer = struct_SDL_GPUBuffer;
pub const struct_SDL_GPUTransferBuffer = opaque {};
pub const SDL_GPUTransferBuffer = struct_SDL_GPUTransferBuffer;
pub const struct_SDL_GPUTexture = opaque {};
pub const SDL_GPUTexture = struct_SDL_GPUTexture;
pub const struct_SDL_GPUSampler = opaque {};
pub const SDL_GPUSampler = struct_SDL_GPUSampler;
pub const struct_SDL_GPUShader = opaque {};
pub const SDL_GPUShader = struct_SDL_GPUShader;
pub const struct_SDL_GPUComputePipeline = opaque {};
pub const SDL_GPUComputePipeline = struct_SDL_GPUComputePipeline;
pub const struct_SDL_GPUGraphicsPipeline = opaque {};
pub const SDL_GPUGraphicsPipeline = struct_SDL_GPUGraphicsPipeline;
pub const struct_SDL_GPUCommandBuffer = opaque {};
pub const SDL_GPUCommandBuffer = struct_SDL_GPUCommandBuffer;
pub const struct_SDL_GPURenderPass = opaque {};
pub const SDL_GPURenderPass = struct_SDL_GPURenderPass;
pub const struct_SDL_GPUComputePass = opaque {};
pub const SDL_GPUComputePass = struct_SDL_GPUComputePass;
pub const struct_SDL_GPUCopyPass = opaque {};
pub const SDL_GPUCopyPass = struct_SDL_GPUCopyPass;
pub const struct_SDL_GPUFence = opaque {};
pub const SDL_GPUFence = struct_SDL_GPUFence;
pub const SDL_GPU_PRIMITIVETYPE_TRIANGLELIST: c_int = 0;
pub const SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP: c_int = 1;
pub const SDL_GPU_PRIMITIVETYPE_LINELIST: c_int = 2;
pub const SDL_GPU_PRIMITIVETYPE_LINESTRIP: c_int = 3;
pub const SDL_GPU_PRIMITIVETYPE_POINTLIST: c_int = 4;
pub const enum_SDL_GPUPrimitiveType = c_uint;
pub const SDL_GPUPrimitiveType = enum_SDL_GPUPrimitiveType;
pub const SDL_GPU_LOADOP_LOAD: c_int = 0;
pub const SDL_GPU_LOADOP_CLEAR: c_int = 1;
pub const SDL_GPU_LOADOP_DONT_CARE: c_int = 2;
pub const enum_SDL_GPULoadOp = c_uint;
pub const SDL_GPULoadOp = enum_SDL_GPULoadOp;
pub const SDL_GPU_STOREOP_STORE: c_int = 0;
pub const SDL_GPU_STOREOP_DONT_CARE: c_int = 1;
pub const SDL_GPU_STOREOP_RESOLVE: c_int = 2;
pub const SDL_GPU_STOREOP_RESOLVE_AND_STORE: c_int = 3;
pub const enum_SDL_GPUStoreOp = c_uint;
pub const SDL_GPUStoreOp = enum_SDL_GPUStoreOp;
pub const SDL_GPU_INDEXELEMENTSIZE_16BIT: c_int = 0;
pub const SDL_GPU_INDEXELEMENTSIZE_32BIT: c_int = 1;
pub const enum_SDL_GPUIndexElementSize = c_uint;
pub const SDL_GPUIndexElementSize = enum_SDL_GPUIndexElementSize;
pub const SDL_GPU_TEXTUREFORMAT_INVALID: c_int = 0;
pub const SDL_GPU_TEXTUREFORMAT_A8_UNORM: c_int = 1;
pub const SDL_GPU_TEXTUREFORMAT_R8_UNORM: c_int = 2;
pub const SDL_GPU_TEXTUREFORMAT_R8G8_UNORM: c_int = 3;
pub const SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM: c_int = 4;
pub const SDL_GPU_TEXTUREFORMAT_R16_UNORM: c_int = 5;
pub const SDL_GPU_TEXTUREFORMAT_R16G16_UNORM: c_int = 6;
pub const SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM: c_int = 7;
pub const SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM: c_int = 8;
pub const SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM: c_int = 9;
pub const SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM: c_int = 10;
pub const SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM: c_int = 11;
pub const SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM: c_int = 12;
pub const SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM: c_int = 13;
pub const SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM: c_int = 14;
pub const SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM: c_int = 15;
pub const SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM: c_int = 16;
pub const SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM: c_int = 17;
pub const SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM: c_int = 18;
pub const SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT: c_int = 19;
pub const SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT: c_int = 20;
pub const SDL_GPU_TEXTUREFORMAT_R8_SNORM: c_int = 21;
pub const SDL_GPU_TEXTUREFORMAT_R8G8_SNORM: c_int = 22;
pub const SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM: c_int = 23;
pub const SDL_GPU_TEXTUREFORMAT_R16_SNORM: c_int = 24;
pub const SDL_GPU_TEXTUREFORMAT_R16G16_SNORM: c_int = 25;
pub const SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM: c_int = 26;
pub const SDL_GPU_TEXTUREFORMAT_R16_FLOAT: c_int = 27;
pub const SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT: c_int = 28;
pub const SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT: c_int = 29;
pub const SDL_GPU_TEXTUREFORMAT_R32_FLOAT: c_int = 30;
pub const SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT: c_int = 31;
pub const SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT: c_int = 32;
pub const SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT: c_int = 33;
pub const SDL_GPU_TEXTUREFORMAT_R8_UINT: c_int = 34;
pub const SDL_GPU_TEXTUREFORMAT_R8G8_UINT: c_int = 35;
pub const SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT: c_int = 36;
pub const SDL_GPU_TEXTUREFORMAT_R16_UINT: c_int = 37;
pub const SDL_GPU_TEXTUREFORMAT_R16G16_UINT: c_int = 38;
pub const SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT: c_int = 39;
pub const SDL_GPU_TEXTUREFORMAT_R32_UINT: c_int = 40;
pub const SDL_GPU_TEXTUREFORMAT_R32G32_UINT: c_int = 41;
pub const SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT: c_int = 42;
pub const SDL_GPU_TEXTUREFORMAT_R8_INT: c_int = 43;
pub const SDL_GPU_TEXTUREFORMAT_R8G8_INT: c_int = 44;
pub const SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT: c_int = 45;
pub const SDL_GPU_TEXTUREFORMAT_R16_INT: c_int = 46;
pub const SDL_GPU_TEXTUREFORMAT_R16G16_INT: c_int = 47;
pub const SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT: c_int = 48;
pub const SDL_GPU_TEXTUREFORMAT_R32_INT: c_int = 49;
pub const SDL_GPU_TEXTUREFORMAT_R32G32_INT: c_int = 50;
pub const SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT: c_int = 51;
pub const SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB: c_int = 52;
pub const SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB: c_int = 53;
pub const SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB: c_int = 54;
pub const SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB: c_int = 55;
pub const SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB: c_int = 56;
pub const SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB: c_int = 57;
pub const SDL_GPU_TEXTUREFORMAT_D16_UNORM: c_int = 58;
pub const SDL_GPU_TEXTUREFORMAT_D24_UNORM: c_int = 59;
pub const SDL_GPU_TEXTUREFORMAT_D32_FLOAT: c_int = 60;
pub const SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT: c_int = 61;
pub const SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT: c_int = 62;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM: c_int = 63;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM: c_int = 64;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM: c_int = 65;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM: c_int = 66;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM: c_int = 67;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM: c_int = 68;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM: c_int = 69;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM: c_int = 70;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM: c_int = 71;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM: c_int = 72;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM: c_int = 73;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM: c_int = 74;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM: c_int = 75;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM: c_int = 76;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB: c_int = 77;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB: c_int = 78;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB: c_int = 79;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB: c_int = 80;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB: c_int = 81;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB: c_int = 82;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB: c_int = 83;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB: c_int = 84;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB: c_int = 85;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB: c_int = 86;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB: c_int = 87;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB: c_int = 88;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB: c_int = 89;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB: c_int = 90;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT: c_int = 91;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT: c_int = 92;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT: c_int = 93;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT: c_int = 94;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT: c_int = 95;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT: c_int = 96;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT: c_int = 97;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT: c_int = 98;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT: c_int = 99;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT: c_int = 100;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT: c_int = 101;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT: c_int = 102;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT: c_int = 103;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT: c_int = 104;
pub const enum_SDL_GPUTextureFormat = c_uint;
pub const SDL_GPUTextureFormat = enum_SDL_GPUTextureFormat;
pub const SDL_GPUTextureUsageFlags = Uint32;
pub const SDL_GPU_TEXTURETYPE_2D: c_int = 0;
pub const SDL_GPU_TEXTURETYPE_2D_ARRAY: c_int = 1;
pub const SDL_GPU_TEXTURETYPE_3D: c_int = 2;
pub const SDL_GPU_TEXTURETYPE_CUBE: c_int = 3;
pub const SDL_GPU_TEXTURETYPE_CUBE_ARRAY: c_int = 4;
pub const enum_SDL_GPUTextureType = c_uint;
pub const SDL_GPUTextureType = enum_SDL_GPUTextureType;
pub const SDL_GPU_SAMPLECOUNT_1: c_int = 0;
pub const SDL_GPU_SAMPLECOUNT_2: c_int = 1;
pub const SDL_GPU_SAMPLECOUNT_4: c_int = 2;
pub const SDL_GPU_SAMPLECOUNT_8: c_int = 3;
pub const enum_SDL_GPUSampleCount = c_uint;
pub const SDL_GPUSampleCount = enum_SDL_GPUSampleCount;
pub const SDL_GPU_CUBEMAPFACE_POSITIVEX: c_int = 0;
pub const SDL_GPU_CUBEMAPFACE_NEGATIVEX: c_int = 1;
pub const SDL_GPU_CUBEMAPFACE_POSITIVEY: c_int = 2;
pub const SDL_GPU_CUBEMAPFACE_NEGATIVEY: c_int = 3;
pub const SDL_GPU_CUBEMAPFACE_POSITIVEZ: c_int = 4;
pub const SDL_GPU_CUBEMAPFACE_NEGATIVEZ: c_int = 5;
pub const enum_SDL_GPUCubeMapFace = c_uint;
pub const SDL_GPUCubeMapFace = enum_SDL_GPUCubeMapFace;
pub const SDL_GPUBufferUsageFlags = Uint32;
pub const SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD: c_int = 0;
pub const SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD: c_int = 1;
pub const enum_SDL_GPUTransferBufferUsage = c_uint;
pub const SDL_GPUTransferBufferUsage = enum_SDL_GPUTransferBufferUsage;
pub const SDL_GPU_SHADERSTAGE_VERTEX: c_int = 0;
pub const SDL_GPU_SHADERSTAGE_FRAGMENT: c_int = 1;
pub const enum_SDL_GPUShaderStage = c_uint;
pub const SDL_GPUShaderStage = enum_SDL_GPUShaderStage;
pub const SDL_GPUShaderFormat = Uint32;
pub const SDL_GPU_VERTEXELEMENTFORMAT_INVALID: c_int = 0;
pub const SDL_GPU_VERTEXELEMENTFORMAT_INT: c_int = 1;
pub const SDL_GPU_VERTEXELEMENTFORMAT_INT2: c_int = 2;
pub const SDL_GPU_VERTEXELEMENTFORMAT_INT3: c_int = 3;
pub const SDL_GPU_VERTEXELEMENTFORMAT_INT4: c_int = 4;
pub const SDL_GPU_VERTEXELEMENTFORMAT_UINT: c_int = 5;
pub const SDL_GPU_VERTEXELEMENTFORMAT_UINT2: c_int = 6;
pub const SDL_GPU_VERTEXELEMENTFORMAT_UINT3: c_int = 7;
pub const SDL_GPU_VERTEXELEMENTFORMAT_UINT4: c_int = 8;
pub const SDL_GPU_VERTEXELEMENTFORMAT_FLOAT: c_int = 9;
pub const SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2: c_int = 10;
pub const SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3: c_int = 11;
pub const SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4: c_int = 12;
pub const SDL_GPU_VERTEXELEMENTFORMAT_BYTE2: c_int = 13;
pub const SDL_GPU_VERTEXELEMENTFORMAT_BYTE4: c_int = 14;
pub const SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2: c_int = 15;
pub const SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4: c_int = 16;
pub const SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM: c_int = 17;
pub const SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM: c_int = 18;
pub const SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM: c_int = 19;
pub const SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM: c_int = 20;
pub const SDL_GPU_VERTEXELEMENTFORMAT_SHORT2: c_int = 21;
pub const SDL_GPU_VERTEXELEMENTFORMAT_SHORT4: c_int = 22;
pub const SDL_GPU_VERTEXELEMENTFORMAT_USHORT2: c_int = 23;
pub const SDL_GPU_VERTEXELEMENTFORMAT_USHORT4: c_int = 24;
pub const SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM: c_int = 25;
pub const SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM: c_int = 26;
pub const SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM: c_int = 27;
pub const SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM: c_int = 28;
pub const SDL_GPU_VERTEXELEMENTFORMAT_HALF2: c_int = 29;
pub const SDL_GPU_VERTEXELEMENTFORMAT_HALF4: c_int = 30;
pub const enum_SDL_GPUVertexElementFormat = c_uint;
pub const SDL_GPUVertexElementFormat = enum_SDL_GPUVertexElementFormat;
pub const SDL_GPU_VERTEXINPUTRATE_VERTEX: c_int = 0;
pub const SDL_GPU_VERTEXINPUTRATE_INSTANCE: c_int = 1;
pub const enum_SDL_GPUVertexInputRate = c_uint;
pub const SDL_GPUVertexInputRate = enum_SDL_GPUVertexInputRate;
pub const SDL_GPU_FILLMODE_FILL: c_int = 0;
pub const SDL_GPU_FILLMODE_LINE: c_int = 1;
pub const enum_SDL_GPUFillMode = c_uint;
pub const SDL_GPUFillMode = enum_SDL_GPUFillMode;
pub const SDL_GPU_CULLMODE_NONE: c_int = 0;
pub const SDL_GPU_CULLMODE_FRONT: c_int = 1;
pub const SDL_GPU_CULLMODE_BACK: c_int = 2;
pub const enum_SDL_GPUCullMode = c_uint;
pub const SDL_GPUCullMode = enum_SDL_GPUCullMode;
pub const SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE: c_int = 0;
pub const SDL_GPU_FRONTFACE_CLOCKWISE: c_int = 1;
pub const enum_SDL_GPUFrontFace = c_uint;
pub const SDL_GPUFrontFace = enum_SDL_GPUFrontFace;
pub const SDL_GPU_COMPAREOP_INVALID: c_int = 0;
pub const SDL_GPU_COMPAREOP_NEVER: c_int = 1;
pub const SDL_GPU_COMPAREOP_LESS: c_int = 2;
pub const SDL_GPU_COMPAREOP_EQUAL: c_int = 3;
pub const SDL_GPU_COMPAREOP_LESS_OR_EQUAL: c_int = 4;
pub const SDL_GPU_COMPAREOP_GREATER: c_int = 5;
pub const SDL_GPU_COMPAREOP_NOT_EQUAL: c_int = 6;
pub const SDL_GPU_COMPAREOP_GREATER_OR_EQUAL: c_int = 7;
pub const SDL_GPU_COMPAREOP_ALWAYS: c_int = 8;
pub const enum_SDL_GPUCompareOp = c_uint;
pub const SDL_GPUCompareOp = enum_SDL_GPUCompareOp;
pub const SDL_GPU_STENCILOP_INVALID: c_int = 0;
pub const SDL_GPU_STENCILOP_KEEP: c_int = 1;
pub const SDL_GPU_STENCILOP_ZERO: c_int = 2;
pub const SDL_GPU_STENCILOP_REPLACE: c_int = 3;
pub const SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP: c_int = 4;
pub const SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP: c_int = 5;
pub const SDL_GPU_STENCILOP_INVERT: c_int = 6;
pub const SDL_GPU_STENCILOP_INCREMENT_AND_WRAP: c_int = 7;
pub const SDL_GPU_STENCILOP_DECREMENT_AND_WRAP: c_int = 8;
pub const enum_SDL_GPUStencilOp = c_uint;
pub const SDL_GPUStencilOp = enum_SDL_GPUStencilOp;
pub const SDL_GPU_BLENDOP_INVALID: c_int = 0;
pub const SDL_GPU_BLENDOP_ADD: c_int = 1;
pub const SDL_GPU_BLENDOP_SUBTRACT: c_int = 2;
pub const SDL_GPU_BLENDOP_REVERSE_SUBTRACT: c_int = 3;
pub const SDL_GPU_BLENDOP_MIN: c_int = 4;
pub const SDL_GPU_BLENDOP_MAX: c_int = 5;
pub const enum_SDL_GPUBlendOp = c_uint;
pub const SDL_GPUBlendOp = enum_SDL_GPUBlendOp;
pub const SDL_GPU_BLENDFACTOR_INVALID: c_int = 0;
pub const SDL_GPU_BLENDFACTOR_ZERO: c_int = 1;
pub const SDL_GPU_BLENDFACTOR_ONE: c_int = 2;
pub const SDL_GPU_BLENDFACTOR_SRC_COLOR: c_int = 3;
pub const SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR: c_int = 4;
pub const SDL_GPU_BLENDFACTOR_DST_COLOR: c_int = 5;
pub const SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR: c_int = 6;
pub const SDL_GPU_BLENDFACTOR_SRC_ALPHA: c_int = 7;
pub const SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA: c_int = 8;
pub const SDL_GPU_BLENDFACTOR_DST_ALPHA: c_int = 9;
pub const SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA: c_int = 10;
pub const SDL_GPU_BLENDFACTOR_CONSTANT_COLOR: c_int = 11;
pub const SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR: c_int = 12;
pub const SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE: c_int = 13;
pub const enum_SDL_GPUBlendFactor = c_uint;
pub const SDL_GPUBlendFactor = enum_SDL_GPUBlendFactor;
pub const SDL_GPUColorComponentFlags = Uint8;
pub const SDL_GPU_FILTER_NEAREST: c_int = 0;
pub const SDL_GPU_FILTER_LINEAR: c_int = 1;
pub const enum_SDL_GPUFilter = c_uint;
pub const SDL_GPUFilter = enum_SDL_GPUFilter;
pub const SDL_GPU_SAMPLERMIPMAPMODE_NEAREST: c_int = 0;
pub const SDL_GPU_SAMPLERMIPMAPMODE_LINEAR: c_int = 1;
pub const enum_SDL_GPUSamplerMipmapMode = c_uint;
pub const SDL_GPUSamplerMipmapMode = enum_SDL_GPUSamplerMipmapMode;
pub const SDL_GPU_SAMPLERADDRESSMODE_REPEAT: c_int = 0;
pub const SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT: c_int = 1;
pub const SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE: c_int = 2;
pub const enum_SDL_GPUSamplerAddressMode = c_uint;
pub const SDL_GPUSamplerAddressMode = enum_SDL_GPUSamplerAddressMode;
pub const SDL_GPU_PRESENTMODE_VSYNC: c_int = 0;
pub const SDL_GPU_PRESENTMODE_IMMEDIATE: c_int = 1;
pub const SDL_GPU_PRESENTMODE_MAILBOX: c_int = 2;
pub const enum_SDL_GPUPresentMode = c_uint;
pub const SDL_GPUPresentMode = enum_SDL_GPUPresentMode;
pub const SDL_GPU_SWAPCHAINCOMPOSITION_SDR: c_int = 0;
pub const SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR: c_int = 1;
pub const SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR: c_int = 2;
pub const SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084: c_int = 3;
pub const enum_SDL_GPUSwapchainComposition = c_uint;
pub const SDL_GPUSwapchainComposition = enum_SDL_GPUSwapchainComposition;
pub const struct_SDL_GPUViewport = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    w: f32 = @import("std").mem.zeroes(f32),
    h: f32 = @import("std").mem.zeroes(f32),
    min_depth: f32 = @import("std").mem.zeroes(f32),
    max_depth: f32 = @import("std").mem.zeroes(f32),
};
pub const SDL_GPUViewport = struct_SDL_GPUViewport;
pub const struct_SDL_GPUTextureTransferInfo = extern struct {
    transfer_buffer: ?*SDL_GPUTransferBuffer = @import("std").mem.zeroes(?*SDL_GPUTransferBuffer),
    offset: Uint32 = @import("std").mem.zeroes(Uint32),
    pixels_per_row: Uint32 = @import("std").mem.zeroes(Uint32),
    rows_per_layer: Uint32 = @import("std").mem.zeroes(Uint32),
};
pub const SDL_GPUTextureTransferInfo = struct_SDL_GPUTextureTransferInfo;
pub const struct_SDL_GPUTransferBufferLocation = extern struct {
    transfer_buffer: ?*SDL_GPUTransferBuffer = @import("std").mem.zeroes(?*SDL_GPUTransferBuffer),
    offset: Uint32 = @import("std").mem.zeroes(Uint32),
};
pub const SDL_GPUTransferBufferLocation = struct_SDL_GPUTransferBufferLocation;
pub const struct_SDL_GPUTextureLocation = extern struct {
    texture: ?*SDL_GPUTexture = @import("std").mem.zeroes(?*SDL_GPUTexture),
    mip_level: Uint32 = @import("std").mem.zeroes(Uint32),
    layer: Uint32 = @import("std").mem.zeroes(Uint32),
    x: Uint32 = @import("std").mem.zeroes(Uint32),
    y: Uint32 = @import("std").mem.zeroes(Uint32),
    z: Uint32 = @import("std").mem.zeroes(Uint32),
};
pub const SDL_GPUTextureLocation = struct_SDL_GPUTextureLocation;
pub const struct_SDL_GPUTextureRegion = extern struct {
    texture: ?*SDL_GPUTexture = @import("std").mem.zeroes(?*SDL_GPUTexture),
    mip_level: Uint32 = @import("std").mem.zeroes(Uint32),
    layer: Uint32 = @import("std").mem.zeroes(Uint32),
    x: Uint32 = @import("std").mem.zeroes(Uint32),
    y: Uint32 = @import("std").mem.zeroes(Uint32),
    z: Uint32 = @import("std").mem.zeroes(Uint32),
    w: Uint32 = @import("std").mem.zeroes(Uint32),
    h: Uint32 = @import("std").mem.zeroes(Uint32),
    d: Uint32 = @import("std").mem.zeroes(Uint32),
};
pub const SDL_GPUTextureRegion = struct_SDL_GPUTextureRegion;
pub const struct_SDL_GPUBlitRegion = extern struct {
    texture: ?*SDL_GPUTexture = @import("std").mem.zeroes(?*SDL_GPUTexture),
    mip_level: Uint32 = @import("std").mem.zeroes(Uint32),
    layer_or_depth_plane: Uint32 = @import("std").mem.zeroes(Uint32),
    x: Uint32 = @import("std").mem.zeroes(Uint32),
    y: Uint32 = @import("std").mem.zeroes(Uint32),
    w: Uint32 = @import("std").mem.zeroes(Uint32),
    h: Uint32 = @import("std").mem.zeroes(Uint32),
};
pub const SDL_GPUBlitRegion = struct_SDL_GPUBlitRegion;
pub const struct_SDL_GPUBufferLocation = extern struct {
    buffer: ?*SDL_GPUBuffer = @import("std").mem.zeroes(?*SDL_GPUBuffer),
    offset: Uint32 = @import("std").mem.zeroes(Uint32),
};
pub const SDL_GPUBufferLocation = struct_SDL_GPUBufferLocation;
pub const struct_SDL_GPUBufferRegion = extern struct {
    buffer: ?*SDL_GPUBuffer = @import("std").mem.zeroes(?*SDL_GPUBuffer),
    offset: Uint32 = @import("std").mem.zeroes(Uint32),
    size: Uint32 = @import("std").mem.zeroes(Uint32),
};
pub const SDL_GPUBufferRegion = struct_SDL_GPUBufferRegion;
pub const struct_SDL_GPUIndirectDrawCommand = extern struct {
    num_vertices: Uint32 = @import("std").mem.zeroes(Uint32),
    num_instances: Uint32 = @import("std").mem.zeroes(Uint32),
    first_vertex: Uint32 = @import("std").mem.zeroes(Uint32),
    first_instance: Uint32 = @import("std").mem.zeroes(Uint32),
};
pub const SDL_GPUIndirectDrawCommand = struct_SDL_GPUIndirectDrawCommand;
pub const struct_SDL_GPUIndexedIndirectDrawCommand = extern struct {
    num_indices: Uint32 = @import("std").mem.zeroes(Uint32),
    num_instances: Uint32 = @import("std").mem.zeroes(Uint32),
    first_index: Uint32 = @import("std").mem.zeroes(Uint32),
    vertex_offset: Sint32 = @import("std").mem.zeroes(Sint32),
    first_instance: Uint32 = @import("std").mem.zeroes(Uint32),
};
pub const SDL_GPUIndexedIndirectDrawCommand = struct_SDL_GPUIndexedIndirectDrawCommand;
pub const struct_SDL_GPUIndirectDispatchCommand = extern struct {
    groupcount_x: Uint32 = @import("std").mem.zeroes(Uint32),
    groupcount_y: Uint32 = @import("std").mem.zeroes(Uint32),
    groupcount_z: Uint32 = @import("std").mem.zeroes(Uint32),
};
pub const SDL_GPUIndirectDispatchCommand = struct_SDL_GPUIndirectDispatchCommand;
pub const struct_SDL_GPUSamplerCreateInfo = extern struct {
    min_filter: SDL_GPUFilter = @import("std").mem.zeroes(SDL_GPUFilter),
    mag_filter: SDL_GPUFilter = @import("std").mem.zeroes(SDL_GPUFilter),
    mipmap_mode: SDL_GPUSamplerMipmapMode = @import("std").mem.zeroes(SDL_GPUSamplerMipmapMode),
    address_mode_u: SDL_GPUSamplerAddressMode = @import("std").mem.zeroes(SDL_GPUSamplerAddressMode),
    address_mode_v: SDL_GPUSamplerAddressMode = @import("std").mem.zeroes(SDL_GPUSamplerAddressMode),
    address_mode_w: SDL_GPUSamplerAddressMode = @import("std").mem.zeroes(SDL_GPUSamplerAddressMode),
    mip_lod_bias: f32 = @import("std").mem.zeroes(f32),
    max_anisotropy: f32 = @import("std").mem.zeroes(f32),
    compare_op: SDL_GPUCompareOp = @import("std").mem.zeroes(SDL_GPUCompareOp),
    min_lod: f32 = @import("std").mem.zeroes(f32),
    max_lod: f32 = @import("std").mem.zeroes(f32),
    enable_anisotropy: bool = @import("std").mem.zeroes(bool),
    enable_compare: bool = @import("std").mem.zeroes(bool),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
    props: SDL_PropertiesID = @import("std").mem.zeroes(SDL_PropertiesID),
};
pub const SDL_GPUSamplerCreateInfo = struct_SDL_GPUSamplerCreateInfo;
pub const struct_SDL_GPUVertexBufferDescription = extern struct {
    slot: Uint32 = @import("std").mem.zeroes(Uint32),
    pitch: Uint32 = @import("std").mem.zeroes(Uint32),
    input_rate: SDL_GPUVertexInputRate = @import("std").mem.zeroes(SDL_GPUVertexInputRate),
    instance_step_rate: Uint32 = @import("std").mem.zeroes(Uint32),
};
pub const SDL_GPUVertexBufferDescription = struct_SDL_GPUVertexBufferDescription;
pub const struct_SDL_GPUVertexAttribute = extern struct {
    location: Uint32 = @import("std").mem.zeroes(Uint32),
    buffer_slot: Uint32 = @import("std").mem.zeroes(Uint32),
    format: SDL_GPUVertexElementFormat = @import("std").mem.zeroes(SDL_GPUVertexElementFormat),
    offset: Uint32 = @import("std").mem.zeroes(Uint32),
};
pub const SDL_GPUVertexAttribute = struct_SDL_GPUVertexAttribute;
pub const struct_SDL_GPUVertexInputState = extern struct {
    vertex_buffer_descriptions: [*c]const SDL_GPUVertexBufferDescription = @import("std").mem.zeroes([*c]const SDL_GPUVertexBufferDescription),
    num_vertex_buffers: Uint32 = @import("std").mem.zeroes(Uint32),
    vertex_attributes: [*c]const SDL_GPUVertexAttribute = @import("std").mem.zeroes([*c]const SDL_GPUVertexAttribute),
    num_vertex_attributes: Uint32 = @import("std").mem.zeroes(Uint32),
};
pub const SDL_GPUVertexInputState = struct_SDL_GPUVertexInputState;
pub const struct_SDL_GPUStencilOpState = extern struct {
    fail_op: SDL_GPUStencilOp = @import("std").mem.zeroes(SDL_GPUStencilOp),
    pass_op: SDL_GPUStencilOp = @import("std").mem.zeroes(SDL_GPUStencilOp),
    depth_fail_op: SDL_GPUStencilOp = @import("std").mem.zeroes(SDL_GPUStencilOp),
    compare_op: SDL_GPUCompareOp = @import("std").mem.zeroes(SDL_GPUCompareOp),
};
pub const SDL_GPUStencilOpState = struct_SDL_GPUStencilOpState;
pub const struct_SDL_GPUColorTargetBlendState = extern struct {
    src_color_blendfactor: SDL_GPUBlendFactor = @import("std").mem.zeroes(SDL_GPUBlendFactor),
    dst_color_blendfactor: SDL_GPUBlendFactor = @import("std").mem.zeroes(SDL_GPUBlendFactor),
    color_blend_op: SDL_GPUBlendOp = @import("std").mem.zeroes(SDL_GPUBlendOp),
    src_alpha_blendfactor: SDL_GPUBlendFactor = @import("std").mem.zeroes(SDL_GPUBlendFactor),
    dst_alpha_blendfactor: SDL_GPUBlendFactor = @import("std").mem.zeroes(SDL_GPUBlendFactor),
    alpha_blend_op: SDL_GPUBlendOp = @import("std").mem.zeroes(SDL_GPUBlendOp),
    color_write_mask: SDL_GPUColorComponentFlags = @import("std").mem.zeroes(SDL_GPUColorComponentFlags),
    enable_blend: bool = @import("std").mem.zeroes(bool),
    enable_color_write_mask: bool = @import("std").mem.zeroes(bool),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_GPUColorTargetBlendState = struct_SDL_GPUColorTargetBlendState;
pub const struct_SDL_GPUShaderCreateInfo = extern struct {
    code_size: usize = @import("std").mem.zeroes(usize),
    code: [*c]const Uint8 = @import("std").mem.zeroes([*c]const Uint8),
    entrypoint: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    format: SDL_GPUShaderFormat = @import("std").mem.zeroes(SDL_GPUShaderFormat),
    stage: SDL_GPUShaderStage = @import("std").mem.zeroes(SDL_GPUShaderStage),
    num_samplers: Uint32 = @import("std").mem.zeroes(Uint32),
    num_storage_textures: Uint32 = @import("std").mem.zeroes(Uint32),
    num_storage_buffers: Uint32 = @import("std").mem.zeroes(Uint32),
    num_uniform_buffers: Uint32 = @import("std").mem.zeroes(Uint32),
    props: SDL_PropertiesID = @import("std").mem.zeroes(SDL_PropertiesID),
};
pub const SDL_GPUShaderCreateInfo = struct_SDL_GPUShaderCreateInfo;
pub const struct_SDL_GPUTextureCreateInfo = extern struct {
    type: SDL_GPUTextureType = @import("std").mem.zeroes(SDL_GPUTextureType),
    format: SDL_GPUTextureFormat = @import("std").mem.zeroes(SDL_GPUTextureFormat),
    usage: SDL_GPUTextureUsageFlags = @import("std").mem.zeroes(SDL_GPUTextureUsageFlags),
    width: Uint32 = @import("std").mem.zeroes(Uint32),
    height: Uint32 = @import("std").mem.zeroes(Uint32),
    layer_count_or_depth: Uint32 = @import("std").mem.zeroes(Uint32),
    num_levels: Uint32 = @import("std").mem.zeroes(Uint32),
    sample_count: SDL_GPUSampleCount = @import("std").mem.zeroes(SDL_GPUSampleCount),
    props: SDL_PropertiesID = @import("std").mem.zeroes(SDL_PropertiesID),
};
pub const SDL_GPUTextureCreateInfo = struct_SDL_GPUTextureCreateInfo;
pub const struct_SDL_GPUBufferCreateInfo = extern struct {
    usage: SDL_GPUBufferUsageFlags = @import("std").mem.zeroes(SDL_GPUBufferUsageFlags),
    size: Uint32 = @import("std").mem.zeroes(Uint32),
    props: SDL_PropertiesID = @import("std").mem.zeroes(SDL_PropertiesID),
};
pub const SDL_GPUBufferCreateInfo = struct_SDL_GPUBufferCreateInfo;
pub const struct_SDL_GPUTransferBufferCreateInfo = extern struct {
    usage: SDL_GPUTransferBufferUsage = @import("std").mem.zeroes(SDL_GPUTransferBufferUsage),
    size: Uint32 = @import("std").mem.zeroes(Uint32),
    props: SDL_PropertiesID = @import("std").mem.zeroes(SDL_PropertiesID),
};
pub const SDL_GPUTransferBufferCreateInfo = struct_SDL_GPUTransferBufferCreateInfo;
pub const struct_SDL_GPURasterizerState = extern struct {
    fill_mode: SDL_GPUFillMode = @import("std").mem.zeroes(SDL_GPUFillMode),
    cull_mode: SDL_GPUCullMode = @import("std").mem.zeroes(SDL_GPUCullMode),
    front_face: SDL_GPUFrontFace = @import("std").mem.zeroes(SDL_GPUFrontFace),
    depth_bias_constant_factor: f32 = @import("std").mem.zeroes(f32),
    depth_bias_clamp: f32 = @import("std").mem.zeroes(f32),
    depth_bias_slope_factor: f32 = @import("std").mem.zeroes(f32),
    enable_depth_bias: bool = @import("std").mem.zeroes(bool),
    enable_depth_clip: bool = @import("std").mem.zeroes(bool),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_GPURasterizerState = struct_SDL_GPURasterizerState;
pub const struct_SDL_GPUMultisampleState = extern struct {
    sample_count: SDL_GPUSampleCount = @import("std").mem.zeroes(SDL_GPUSampleCount),
    sample_mask: Uint32 = @import("std").mem.zeroes(Uint32),
    enable_mask: bool = @import("std").mem.zeroes(bool),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
    padding3: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_GPUMultisampleState = struct_SDL_GPUMultisampleState;
pub const struct_SDL_GPUDepthStencilState = extern struct {
    compare_op: SDL_GPUCompareOp = @import("std").mem.zeroes(SDL_GPUCompareOp),
    back_stencil_state: SDL_GPUStencilOpState = @import("std").mem.zeroes(SDL_GPUStencilOpState),
    front_stencil_state: SDL_GPUStencilOpState = @import("std").mem.zeroes(SDL_GPUStencilOpState),
    compare_mask: Uint8 = @import("std").mem.zeroes(Uint8),
    write_mask: Uint8 = @import("std").mem.zeroes(Uint8),
    enable_depth_test: bool = @import("std").mem.zeroes(bool),
    enable_depth_write: bool = @import("std").mem.zeroes(bool),
    enable_stencil_test: bool = @import("std").mem.zeroes(bool),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
    padding3: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_GPUDepthStencilState = struct_SDL_GPUDepthStencilState;
pub const struct_SDL_GPUColorTargetDescription = extern struct {
    format: SDL_GPUTextureFormat = @import("std").mem.zeroes(SDL_GPUTextureFormat),
    blend_state: SDL_GPUColorTargetBlendState = @import("std").mem.zeroes(SDL_GPUColorTargetBlendState),
};
pub const SDL_GPUColorTargetDescription = struct_SDL_GPUColorTargetDescription;
pub const struct_SDL_GPUGraphicsPipelineTargetInfo = extern struct {
    color_target_descriptions: [*c]const SDL_GPUColorTargetDescription = @import("std").mem.zeroes([*c]const SDL_GPUColorTargetDescription),
    num_color_targets: Uint32 = @import("std").mem.zeroes(Uint32),
    depth_stencil_format: SDL_GPUTextureFormat = @import("std").mem.zeroes(SDL_GPUTextureFormat),
    has_depth_stencil_target: bool = @import("std").mem.zeroes(bool),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
    padding3: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_GPUGraphicsPipelineTargetInfo = struct_SDL_GPUGraphicsPipelineTargetInfo;
pub const struct_SDL_GPUGraphicsPipelineCreateInfo = extern struct {
    vertex_shader: ?*SDL_GPUShader = @import("std").mem.zeroes(?*SDL_GPUShader),
    fragment_shader: ?*SDL_GPUShader = @import("std").mem.zeroes(?*SDL_GPUShader),
    vertex_input_state: SDL_GPUVertexInputState = @import("std").mem.zeroes(SDL_GPUVertexInputState),
    primitive_type: SDL_GPUPrimitiveType = @import("std").mem.zeroes(SDL_GPUPrimitiveType),
    rasterizer_state: SDL_GPURasterizerState = @import("std").mem.zeroes(SDL_GPURasterizerState),
    multisample_state: SDL_GPUMultisampleState = @import("std").mem.zeroes(SDL_GPUMultisampleState),
    depth_stencil_state: SDL_GPUDepthStencilState = @import("std").mem.zeroes(SDL_GPUDepthStencilState),
    target_info: SDL_GPUGraphicsPipelineTargetInfo = @import("std").mem.zeroes(SDL_GPUGraphicsPipelineTargetInfo),
    props: SDL_PropertiesID = @import("std").mem.zeroes(SDL_PropertiesID),
};
pub const SDL_GPUGraphicsPipelineCreateInfo = struct_SDL_GPUGraphicsPipelineCreateInfo;
pub const struct_SDL_GPUComputePipelineCreateInfo = extern struct {
    code_size: usize = @import("std").mem.zeroes(usize),
    code: [*c]const Uint8 = @import("std").mem.zeroes([*c]const Uint8),
    entrypoint: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    format: SDL_GPUShaderFormat = @import("std").mem.zeroes(SDL_GPUShaderFormat),
    num_samplers: Uint32 = @import("std").mem.zeroes(Uint32),
    num_readonly_storage_textures: Uint32 = @import("std").mem.zeroes(Uint32),
    num_readonly_storage_buffers: Uint32 = @import("std").mem.zeroes(Uint32),
    num_readwrite_storage_textures: Uint32 = @import("std").mem.zeroes(Uint32),
    num_readwrite_storage_buffers: Uint32 = @import("std").mem.zeroes(Uint32),
    num_uniform_buffers: Uint32 = @import("std").mem.zeroes(Uint32),
    threadcount_x: Uint32 = @import("std").mem.zeroes(Uint32),
    threadcount_y: Uint32 = @import("std").mem.zeroes(Uint32),
    threadcount_z: Uint32 = @import("std").mem.zeroes(Uint32),
    props: SDL_PropertiesID = @import("std").mem.zeroes(SDL_PropertiesID),
};
pub const SDL_GPUComputePipelineCreateInfo = struct_SDL_GPUComputePipelineCreateInfo;
pub const struct_SDL_GPUColorTargetInfo = extern struct {
    texture: ?*SDL_GPUTexture = @import("std").mem.zeroes(?*SDL_GPUTexture),
    mip_level: Uint32 = @import("std").mem.zeroes(Uint32),
    layer_or_depth_plane: Uint32 = @import("std").mem.zeroes(Uint32),
    clear_color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    load_op: SDL_GPULoadOp = @import("std").mem.zeroes(SDL_GPULoadOp),
    store_op: SDL_GPUStoreOp = @import("std").mem.zeroes(SDL_GPUStoreOp),
    resolve_texture: ?*SDL_GPUTexture = @import("std").mem.zeroes(?*SDL_GPUTexture),
    resolve_mip_level: Uint32 = @import("std").mem.zeroes(Uint32),
    resolve_layer: Uint32 = @import("std").mem.zeroes(Uint32),
    cycle: bool = @import("std").mem.zeroes(bool),
    cycle_resolve_texture: bool = @import("std").mem.zeroes(bool),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_GPUColorTargetInfo = struct_SDL_GPUColorTargetInfo;
pub const struct_SDL_GPUDepthStencilTargetInfo = extern struct {
    texture: ?*SDL_GPUTexture = @import("std").mem.zeroes(?*SDL_GPUTexture),
    clear_depth: f32 = @import("std").mem.zeroes(f32),
    load_op: SDL_GPULoadOp = @import("std").mem.zeroes(SDL_GPULoadOp),
    store_op: SDL_GPUStoreOp = @import("std").mem.zeroes(SDL_GPUStoreOp),
    stencil_load_op: SDL_GPULoadOp = @import("std").mem.zeroes(SDL_GPULoadOp),
    stencil_store_op: SDL_GPUStoreOp = @import("std").mem.zeroes(SDL_GPUStoreOp),
    cycle: bool = @import("std").mem.zeroes(bool),
    clear_stencil: Uint8 = @import("std").mem.zeroes(Uint8),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_GPUDepthStencilTargetInfo = struct_SDL_GPUDepthStencilTargetInfo;
pub const struct_SDL_GPUBlitInfo = extern struct {
    source: SDL_GPUBlitRegion = @import("std").mem.zeroes(SDL_GPUBlitRegion),
    destination: SDL_GPUBlitRegion = @import("std").mem.zeroes(SDL_GPUBlitRegion),
    load_op: SDL_GPULoadOp = @import("std").mem.zeroes(SDL_GPULoadOp),
    clear_color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    flip_mode: SDL_FlipMode = @import("std").mem.zeroes(SDL_FlipMode),
    filter: SDL_GPUFilter = @import("std").mem.zeroes(SDL_GPUFilter),
    cycle: bool = @import("std").mem.zeroes(bool),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
    padding3: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_GPUBlitInfo = struct_SDL_GPUBlitInfo;
pub const struct_SDL_GPUBufferBinding = extern struct {
    buffer: ?*SDL_GPUBuffer = @import("std").mem.zeroes(?*SDL_GPUBuffer),
    offset: Uint32 = @import("std").mem.zeroes(Uint32),
};
pub const SDL_GPUBufferBinding = struct_SDL_GPUBufferBinding;
pub const struct_SDL_GPUTextureSamplerBinding = extern struct {
    texture: ?*SDL_GPUTexture = @import("std").mem.zeroes(?*SDL_GPUTexture),
    sampler: ?*SDL_GPUSampler = @import("std").mem.zeroes(?*SDL_GPUSampler),
};
pub const SDL_GPUTextureSamplerBinding = struct_SDL_GPUTextureSamplerBinding;
pub const struct_SDL_GPUStorageBufferReadWriteBinding = extern struct {
    buffer: ?*SDL_GPUBuffer = @import("std").mem.zeroes(?*SDL_GPUBuffer),
    cycle: bool = @import("std").mem.zeroes(bool),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
    padding3: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_GPUStorageBufferReadWriteBinding = struct_SDL_GPUStorageBufferReadWriteBinding;
pub const struct_SDL_GPUStorageTextureReadWriteBinding = extern struct {
    texture: ?*SDL_GPUTexture = @import("std").mem.zeroes(?*SDL_GPUTexture),
    mip_level: Uint32 = @import("std").mem.zeroes(Uint32),
    layer: Uint32 = @import("std").mem.zeroes(Uint32),
    cycle: bool = @import("std").mem.zeroes(bool),
    padding1: Uint8 = @import("std").mem.zeroes(Uint8),
    padding2: Uint8 = @import("std").mem.zeroes(Uint8),
    padding3: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_GPUStorageTextureReadWriteBinding = struct_SDL_GPUStorageTextureReadWriteBinding;
pub extern fn SDL_GPUSupportsShaderFormats(format_flags: SDL_GPUShaderFormat, name: [*c]const u8) bool;
pub extern fn SDL_GPUSupportsProperties(props: SDL_PropertiesID) bool;
pub extern fn SDL_CreateGPUDevice(format_flags: SDL_GPUShaderFormat, debug_mode: bool, name: [*c]const u8) ?*SDL_GPUDevice;
pub extern fn SDL_CreateGPUDeviceWithProperties(props: SDL_PropertiesID) ?*SDL_GPUDevice;
pub extern fn SDL_DestroyGPUDevice(device: ?*SDL_GPUDevice) void;
pub extern fn SDL_GetNumGPUDrivers() c_int;
pub extern fn SDL_GetGPUDriver(index: c_int) [*c]const u8;
pub extern fn SDL_GetGPUDeviceDriver(device: ?*SDL_GPUDevice) [*c]const u8;
pub extern fn SDL_GetGPUShaderFormats(device: ?*SDL_GPUDevice) SDL_GPUShaderFormat;
pub extern fn SDL_CreateGPUComputePipeline(device: ?*SDL_GPUDevice, createinfo: [*c]const SDL_GPUComputePipelineCreateInfo) ?*SDL_GPUComputePipeline;
pub extern fn SDL_CreateGPUGraphicsPipeline(device: ?*SDL_GPUDevice, createinfo: [*c]const SDL_GPUGraphicsPipelineCreateInfo) ?*SDL_GPUGraphicsPipeline;
pub extern fn SDL_CreateGPUSampler(device: ?*SDL_GPUDevice, createinfo: [*c]const SDL_GPUSamplerCreateInfo) ?*SDL_GPUSampler;
pub extern fn SDL_CreateGPUShader(device: ?*SDL_GPUDevice, createinfo: [*c]const SDL_GPUShaderCreateInfo) ?*SDL_GPUShader;
pub extern fn SDL_CreateGPUTexture(device: ?*SDL_GPUDevice, createinfo: [*c]const SDL_GPUTextureCreateInfo) ?*SDL_GPUTexture;
pub extern fn SDL_CreateGPUBuffer(device: ?*SDL_GPUDevice, createinfo: [*c]const SDL_GPUBufferCreateInfo) ?*SDL_GPUBuffer;
pub extern fn SDL_CreateGPUTransferBuffer(device: ?*SDL_GPUDevice, createinfo: [*c]const SDL_GPUTransferBufferCreateInfo) ?*SDL_GPUTransferBuffer;
pub extern fn SDL_SetGPUBufferName(device: ?*SDL_GPUDevice, buffer: ?*SDL_GPUBuffer, text: [*c]const u8) void;
pub extern fn SDL_SetGPUTextureName(device: ?*SDL_GPUDevice, texture: ?*SDL_GPUTexture, text: [*c]const u8) void;
pub extern fn SDL_InsertGPUDebugLabel(command_buffer: ?*SDL_GPUCommandBuffer, text: [*c]const u8) void;
pub extern fn SDL_PushGPUDebugGroup(command_buffer: ?*SDL_GPUCommandBuffer, name: [*c]const u8) void;
pub extern fn SDL_PopGPUDebugGroup(command_buffer: ?*SDL_GPUCommandBuffer) void;
pub extern fn SDL_ReleaseGPUTexture(device: ?*SDL_GPUDevice, texture: ?*SDL_GPUTexture) void;
pub extern fn SDL_ReleaseGPUSampler(device: ?*SDL_GPUDevice, sampler: ?*SDL_GPUSampler) void;
pub extern fn SDL_ReleaseGPUBuffer(device: ?*SDL_GPUDevice, buffer: ?*SDL_GPUBuffer) void;
pub extern fn SDL_ReleaseGPUTransferBuffer(device: ?*SDL_GPUDevice, transfer_buffer: ?*SDL_GPUTransferBuffer) void;
pub extern fn SDL_ReleaseGPUComputePipeline(device: ?*SDL_GPUDevice, compute_pipeline: ?*SDL_GPUComputePipeline) void;
pub extern fn SDL_ReleaseGPUShader(device: ?*SDL_GPUDevice, shader: ?*SDL_GPUShader) void;
pub extern fn SDL_ReleaseGPUGraphicsPipeline(device: ?*SDL_GPUDevice, graphics_pipeline: ?*SDL_GPUGraphicsPipeline) void;
pub extern fn SDL_AcquireGPUCommandBuffer(device: ?*SDL_GPUDevice) ?*SDL_GPUCommandBuffer;
pub extern fn SDL_PushGPUVertexUniformData(command_buffer: ?*SDL_GPUCommandBuffer, slot_index: Uint32, data: ?*const anyopaque, length: Uint32) void;
pub extern fn SDL_PushGPUFragmentUniformData(command_buffer: ?*SDL_GPUCommandBuffer, slot_index: Uint32, data: ?*const anyopaque, length: Uint32) void;
pub extern fn SDL_PushGPUComputeUniformData(command_buffer: ?*SDL_GPUCommandBuffer, slot_index: Uint32, data: ?*const anyopaque, length: Uint32) void;
pub extern fn SDL_BeginGPURenderPass(command_buffer: ?*SDL_GPUCommandBuffer, color_target_infos: [*c]const SDL_GPUColorTargetInfo, num_color_targets: Uint32, depth_stencil_target_info: [*c]const SDL_GPUDepthStencilTargetInfo) ?*SDL_GPURenderPass;
pub extern fn SDL_BindGPUGraphicsPipeline(render_pass: ?*SDL_GPURenderPass, graphics_pipeline: ?*SDL_GPUGraphicsPipeline) void;
pub extern fn SDL_SetGPUViewport(render_pass: ?*SDL_GPURenderPass, viewport: [*c]const SDL_GPUViewport) void;
pub extern fn SDL_SetGPUScissor(render_pass: ?*SDL_GPURenderPass, scissor: [*c]const SDL_Rect) void;
pub extern fn SDL_SetGPUBlendConstants(render_pass: ?*SDL_GPURenderPass, blend_constants: SDL_FColor) void;
pub extern fn SDL_SetGPUStencilReference(render_pass: ?*SDL_GPURenderPass, reference: Uint8) void;
pub extern fn SDL_BindGPUVertexBuffers(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, bindings: [*c]const SDL_GPUBufferBinding, num_bindings: Uint32) void;
pub extern fn SDL_BindGPUIndexBuffer(render_pass: ?*SDL_GPURenderPass, binding: [*c]const SDL_GPUBufferBinding, index_element_size: SDL_GPUIndexElementSize) void;
pub extern fn SDL_BindGPUVertexSamplers(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, texture_sampler_bindings: [*c]const SDL_GPUTextureSamplerBinding, num_bindings: Uint32) void;
pub extern fn SDL_BindGPUVertexStorageTextures(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, storage_textures: [*c]const ?*SDL_GPUTexture, num_bindings: Uint32) void;
pub extern fn SDL_BindGPUVertexStorageBuffers(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, storage_buffers: [*c]const ?*SDL_GPUBuffer, num_bindings: Uint32) void;
pub extern fn SDL_BindGPUFragmentSamplers(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, texture_sampler_bindings: [*c]const SDL_GPUTextureSamplerBinding, num_bindings: Uint32) void;
pub extern fn SDL_BindGPUFragmentStorageTextures(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, storage_textures: [*c]const ?*SDL_GPUTexture, num_bindings: Uint32) void;
pub extern fn SDL_BindGPUFragmentStorageBuffers(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, storage_buffers: [*c]const ?*SDL_GPUBuffer, num_bindings: Uint32) void;
pub extern fn SDL_DrawGPUIndexedPrimitives(render_pass: ?*SDL_GPURenderPass, num_indices: Uint32, num_instances: Uint32, first_index: Uint32, vertex_offset: Sint32, first_instance: Uint32) void;
pub extern fn SDL_DrawGPUPrimitives(render_pass: ?*SDL_GPURenderPass, num_vertices: Uint32, num_instances: Uint32, first_vertex: Uint32, first_instance: Uint32) void;
pub extern fn SDL_DrawGPUPrimitivesIndirect(render_pass: ?*SDL_GPURenderPass, buffer: ?*SDL_GPUBuffer, offset: Uint32, draw_count: Uint32) void;
pub extern fn SDL_DrawGPUIndexedPrimitivesIndirect(render_pass: ?*SDL_GPURenderPass, buffer: ?*SDL_GPUBuffer, offset: Uint32, draw_count: Uint32) void;
pub extern fn SDL_EndGPURenderPass(render_pass: ?*SDL_GPURenderPass) void;
pub extern fn SDL_BeginGPUComputePass(command_buffer: ?*SDL_GPUCommandBuffer, storage_texture_bindings: [*c]const SDL_GPUStorageTextureReadWriteBinding, num_storage_texture_bindings: Uint32, storage_buffer_bindings: [*c]const SDL_GPUStorageBufferReadWriteBinding, num_storage_buffer_bindings: Uint32) ?*SDL_GPUComputePass;
pub extern fn SDL_BindGPUComputePipeline(compute_pass: ?*SDL_GPUComputePass, compute_pipeline: ?*SDL_GPUComputePipeline) void;
pub extern fn SDL_BindGPUComputeSamplers(compute_pass: ?*SDL_GPUComputePass, first_slot: Uint32, texture_sampler_bindings: [*c]const SDL_GPUTextureSamplerBinding, num_bindings: Uint32) void;
pub extern fn SDL_BindGPUComputeStorageTextures(compute_pass: ?*SDL_GPUComputePass, first_slot: Uint32, storage_textures: [*c]const ?*SDL_GPUTexture, num_bindings: Uint32) void;
pub extern fn SDL_BindGPUComputeStorageBuffers(compute_pass: ?*SDL_GPUComputePass, first_slot: Uint32, storage_buffers: [*c]const ?*SDL_GPUBuffer, num_bindings: Uint32) void;
pub extern fn SDL_DispatchGPUCompute(compute_pass: ?*SDL_GPUComputePass, groupcount_x: Uint32, groupcount_y: Uint32, groupcount_z: Uint32) void;
pub extern fn SDL_DispatchGPUComputeIndirect(compute_pass: ?*SDL_GPUComputePass, buffer: ?*SDL_GPUBuffer, offset: Uint32) void;
pub extern fn SDL_EndGPUComputePass(compute_pass: ?*SDL_GPUComputePass) void;
pub extern fn SDL_MapGPUTransferBuffer(device: ?*SDL_GPUDevice, transfer_buffer: ?*SDL_GPUTransferBuffer, cycle: bool) ?*anyopaque;
pub extern fn SDL_UnmapGPUTransferBuffer(device: ?*SDL_GPUDevice, transfer_buffer: ?*SDL_GPUTransferBuffer) void;
pub extern fn SDL_BeginGPUCopyPass(command_buffer: ?*SDL_GPUCommandBuffer) ?*SDL_GPUCopyPass;
pub extern fn SDL_UploadToGPUTexture(copy_pass: ?*SDL_GPUCopyPass, source: [*c]const SDL_GPUTextureTransferInfo, destination: [*c]const SDL_GPUTextureRegion, cycle: bool) void;
pub extern fn SDL_UploadToGPUBuffer(copy_pass: ?*SDL_GPUCopyPass, source: [*c]const SDL_GPUTransferBufferLocation, destination: [*c]const SDL_GPUBufferRegion, cycle: bool) void;
pub extern fn SDL_CopyGPUTextureToTexture(copy_pass: ?*SDL_GPUCopyPass, source: [*c]const SDL_GPUTextureLocation, destination: [*c]const SDL_GPUTextureLocation, w: Uint32, h: Uint32, d: Uint32, cycle: bool) void;
pub extern fn SDL_CopyGPUBufferToBuffer(copy_pass: ?*SDL_GPUCopyPass, source: [*c]const SDL_GPUBufferLocation, destination: [*c]const SDL_GPUBufferLocation, size: Uint32, cycle: bool) void;
pub extern fn SDL_DownloadFromGPUTexture(copy_pass: ?*SDL_GPUCopyPass, source: [*c]const SDL_GPUTextureRegion, destination: [*c]const SDL_GPUTextureTransferInfo) void;
pub extern fn SDL_DownloadFromGPUBuffer(copy_pass: ?*SDL_GPUCopyPass, source: [*c]const SDL_GPUBufferRegion, destination: [*c]const SDL_GPUTransferBufferLocation) void;
pub extern fn SDL_EndGPUCopyPass(copy_pass: ?*SDL_GPUCopyPass) void;
pub extern fn SDL_GenerateMipmapsForGPUTexture(command_buffer: ?*SDL_GPUCommandBuffer, texture: ?*SDL_GPUTexture) void;
pub extern fn SDL_BlitGPUTexture(command_buffer: ?*SDL_GPUCommandBuffer, info: [*c]const SDL_GPUBlitInfo) void;
pub extern fn SDL_WindowSupportsGPUSwapchainComposition(device: ?*SDL_GPUDevice, window: ?*SDL_Window, swapchain_composition: SDL_GPUSwapchainComposition) bool;
pub extern fn SDL_WindowSupportsGPUPresentMode(device: ?*SDL_GPUDevice, window: ?*SDL_Window, present_mode: SDL_GPUPresentMode) bool;
pub extern fn SDL_ClaimWindowForGPUDevice(device: ?*SDL_GPUDevice, window: ?*SDL_Window) bool;
pub extern fn SDL_ReleaseWindowFromGPUDevice(device: ?*SDL_GPUDevice, window: ?*SDL_Window) void;
pub extern fn SDL_SetGPUSwapchainParameters(device: ?*SDL_GPUDevice, window: ?*SDL_Window, swapchain_composition: SDL_GPUSwapchainComposition, present_mode: SDL_GPUPresentMode) bool;
pub extern fn SDL_SetGPUAllowedFramesInFlight(device: ?*SDL_GPUDevice, allowed_frames_in_flight: Uint32) bool;
pub extern fn SDL_GetGPUSwapchainTextureFormat(device: ?*SDL_GPUDevice, window: ?*SDL_Window) SDL_GPUTextureFormat;
pub extern fn SDL_AcquireGPUSwapchainTexture(command_buffer: ?*SDL_GPUCommandBuffer, window: ?*SDL_Window, swapchain_texture: [*c]?*SDL_GPUTexture, swapchain_texture_width: [*c]Uint32, swapchain_texture_height: [*c]Uint32) bool;
pub extern fn SDL_WaitForGPUSwapchain(device: ?*SDL_GPUDevice, window: ?*SDL_Window) bool;
pub extern fn SDL_WaitAndAcquireGPUSwapchainTexture(command_buffer: ?*SDL_GPUCommandBuffer, window: ?*SDL_Window, swapchain_texture: [*c]?*SDL_GPUTexture, swapchain_texture_width: [*c]Uint32, swapchain_texture_height: [*c]Uint32) bool;
pub extern fn SDL_SubmitGPUCommandBuffer(command_buffer: ?*SDL_GPUCommandBuffer) bool;
pub extern fn SDL_SubmitGPUCommandBufferAndAcquireFence(command_buffer: ?*SDL_GPUCommandBuffer) ?*SDL_GPUFence;
pub extern fn SDL_CancelGPUCommandBuffer(command_buffer: ?*SDL_GPUCommandBuffer) bool;
pub extern fn SDL_WaitForGPUIdle(device: ?*SDL_GPUDevice) bool;
pub extern fn SDL_WaitForGPUFences(device: ?*SDL_GPUDevice, wait_all: bool, fences: [*c]const ?*SDL_GPUFence, num_fences: Uint32) bool;
pub extern fn SDL_QueryGPUFence(device: ?*SDL_GPUDevice, fence: ?*SDL_GPUFence) bool;
pub extern fn SDL_ReleaseGPUFence(device: ?*SDL_GPUDevice, fence: ?*SDL_GPUFence) void;
pub extern fn SDL_GPUTextureFormatTexelBlockSize(format: SDL_GPUTextureFormat) Uint32;
pub extern fn SDL_GPUTextureSupportsFormat(device: ?*SDL_GPUDevice, format: SDL_GPUTextureFormat, @"type": SDL_GPUTextureType, usage: SDL_GPUTextureUsageFlags) bool;
pub extern fn SDL_GPUTextureSupportsSampleCount(device: ?*SDL_GPUDevice, format: SDL_GPUTextureFormat, sample_count: SDL_GPUSampleCount) bool;
pub extern fn SDL_CalculateGPUTextureFormatSize(format: SDL_GPUTextureFormat, width: Uint32, height: Uint32, depth_or_layer_count: Uint32) Uint32;
pub const struct_SDL_Haptic = opaque {};
pub const SDL_Haptic = struct_SDL_Haptic;
pub const struct_SDL_HapticDirection = extern struct {
    type: Uint8 = @import("std").mem.zeroes(Uint8),
    dir: [3]Sint32 = @import("std").mem.zeroes([3]Sint32),
};
pub const SDL_HapticDirection = struct_SDL_HapticDirection;
pub const struct_SDL_HapticConstant = extern struct {
    type: Uint16 = @import("std").mem.zeroes(Uint16),
    direction: SDL_HapticDirection = @import("std").mem.zeroes(SDL_HapticDirection),
    length: Uint32 = @import("std").mem.zeroes(Uint32),
    delay: Uint16 = @import("std").mem.zeroes(Uint16),
    button: Uint16 = @import("std").mem.zeroes(Uint16),
    interval: Uint16 = @import("std").mem.zeroes(Uint16),
    level: Sint16 = @import("std").mem.zeroes(Sint16),
    attack_length: Uint16 = @import("std").mem.zeroes(Uint16),
    attack_level: Uint16 = @import("std").mem.zeroes(Uint16),
    fade_length: Uint16 = @import("std").mem.zeroes(Uint16),
    fade_level: Uint16 = @import("std").mem.zeroes(Uint16),
};
pub const SDL_HapticConstant = struct_SDL_HapticConstant;
pub const struct_SDL_HapticPeriodic = extern struct {
    type: Uint16 = @import("std").mem.zeroes(Uint16),
    direction: SDL_HapticDirection = @import("std").mem.zeroes(SDL_HapticDirection),
    length: Uint32 = @import("std").mem.zeroes(Uint32),
    delay: Uint16 = @import("std").mem.zeroes(Uint16),
    button: Uint16 = @import("std").mem.zeroes(Uint16),
    interval: Uint16 = @import("std").mem.zeroes(Uint16),
    period: Uint16 = @import("std").mem.zeroes(Uint16),
    magnitude: Sint16 = @import("std").mem.zeroes(Sint16),
    offset: Sint16 = @import("std").mem.zeroes(Sint16),
    phase: Uint16 = @import("std").mem.zeroes(Uint16),
    attack_length: Uint16 = @import("std").mem.zeroes(Uint16),
    attack_level: Uint16 = @import("std").mem.zeroes(Uint16),
    fade_length: Uint16 = @import("std").mem.zeroes(Uint16),
    fade_level: Uint16 = @import("std").mem.zeroes(Uint16),
};
pub const SDL_HapticPeriodic = struct_SDL_HapticPeriodic;
pub const struct_SDL_HapticCondition = extern struct {
    type: Uint16 = @import("std").mem.zeroes(Uint16),
    direction: SDL_HapticDirection = @import("std").mem.zeroes(SDL_HapticDirection),
    length: Uint32 = @import("std").mem.zeroes(Uint32),
    delay: Uint16 = @import("std").mem.zeroes(Uint16),
    button: Uint16 = @import("std").mem.zeroes(Uint16),
    interval: Uint16 = @import("std").mem.zeroes(Uint16),
    right_sat: [3]Uint16 = @import("std").mem.zeroes([3]Uint16),
    left_sat: [3]Uint16 = @import("std").mem.zeroes([3]Uint16),
    right_coeff: [3]Sint16 = @import("std").mem.zeroes([3]Sint16),
    left_coeff: [3]Sint16 = @import("std").mem.zeroes([3]Sint16),
    deadband: [3]Uint16 = @import("std").mem.zeroes([3]Uint16),
    center: [3]Sint16 = @import("std").mem.zeroes([3]Sint16),
};
pub const SDL_HapticCondition = struct_SDL_HapticCondition;
pub const struct_SDL_HapticRamp = extern struct {
    type: Uint16 = @import("std").mem.zeroes(Uint16),
    direction: SDL_HapticDirection = @import("std").mem.zeroes(SDL_HapticDirection),
    length: Uint32 = @import("std").mem.zeroes(Uint32),
    delay: Uint16 = @import("std").mem.zeroes(Uint16),
    button: Uint16 = @import("std").mem.zeroes(Uint16),
    interval: Uint16 = @import("std").mem.zeroes(Uint16),
    start: Sint16 = @import("std").mem.zeroes(Sint16),
    end: Sint16 = @import("std").mem.zeroes(Sint16),
    attack_length: Uint16 = @import("std").mem.zeroes(Uint16),
    attack_level: Uint16 = @import("std").mem.zeroes(Uint16),
    fade_length: Uint16 = @import("std").mem.zeroes(Uint16),
    fade_level: Uint16 = @import("std").mem.zeroes(Uint16),
};
pub const SDL_HapticRamp = struct_SDL_HapticRamp;
pub const struct_SDL_HapticLeftRight = extern struct {
    type: Uint16 = @import("std").mem.zeroes(Uint16),
    length: Uint32 = @import("std").mem.zeroes(Uint32),
    large_magnitude: Uint16 = @import("std").mem.zeroes(Uint16),
    small_magnitude: Uint16 = @import("std").mem.zeroes(Uint16),
};
pub const SDL_HapticLeftRight = struct_SDL_HapticLeftRight;
pub const struct_SDL_HapticCustom = extern struct {
    type: Uint16 = @import("std").mem.zeroes(Uint16),
    direction: SDL_HapticDirection = @import("std").mem.zeroes(SDL_HapticDirection),
    length: Uint32 = @import("std").mem.zeroes(Uint32),
    delay: Uint16 = @import("std").mem.zeroes(Uint16),
    button: Uint16 = @import("std").mem.zeroes(Uint16),
    interval: Uint16 = @import("std").mem.zeroes(Uint16),
    channels: Uint8 = @import("std").mem.zeroes(Uint8),
    period: Uint16 = @import("std").mem.zeroes(Uint16),
    samples: Uint16 = @import("std").mem.zeroes(Uint16),
    data: [*c]Uint16 = @import("std").mem.zeroes([*c]Uint16),
    attack_length: Uint16 = @import("std").mem.zeroes(Uint16),
    attack_level: Uint16 = @import("std").mem.zeroes(Uint16),
    fade_length: Uint16 = @import("std").mem.zeroes(Uint16),
    fade_level: Uint16 = @import("std").mem.zeroes(Uint16),
};
pub const SDL_HapticCustom = struct_SDL_HapticCustom;
pub const union_SDL_HapticEffect = extern union {
    type: Uint16,
    constant: SDL_HapticConstant,
    periodic: SDL_HapticPeriodic,
    condition: SDL_HapticCondition,
    ramp: SDL_HapticRamp,
    leftright: SDL_HapticLeftRight,
    custom: SDL_HapticCustom,
};
pub const SDL_HapticEffect = union_SDL_HapticEffect;
pub const SDL_HapticID = Uint32;
pub extern fn SDL_GetHaptics(count: [*c]c_int) [*c]SDL_HapticID;
pub extern fn SDL_GetHapticNameForID(instance_id: SDL_HapticID) [*c]const u8;
pub extern fn SDL_OpenHaptic(instance_id: SDL_HapticID) ?*SDL_Haptic;
pub extern fn SDL_GetHapticFromID(instance_id: SDL_HapticID) ?*SDL_Haptic;
pub extern fn SDL_GetHapticID(haptic: ?*SDL_Haptic) SDL_HapticID;
pub extern fn SDL_GetHapticName(haptic: ?*SDL_Haptic) [*c]const u8;
pub extern fn SDL_IsMouseHaptic() bool;
pub extern fn SDL_OpenHapticFromMouse() ?*SDL_Haptic;
pub extern fn SDL_IsJoystickHaptic(joystick: ?*SDL_Joystick) bool;
pub extern fn SDL_OpenHapticFromJoystick(joystick: ?*SDL_Joystick) ?*SDL_Haptic;
pub extern fn SDL_CloseHaptic(haptic: ?*SDL_Haptic) void;
pub extern fn SDL_GetMaxHapticEffects(haptic: ?*SDL_Haptic) c_int;
pub extern fn SDL_GetMaxHapticEffectsPlaying(haptic: ?*SDL_Haptic) c_int;
pub extern fn SDL_GetHapticFeatures(haptic: ?*SDL_Haptic) Uint32;
pub extern fn SDL_GetNumHapticAxes(haptic: ?*SDL_Haptic) c_int;
pub extern fn SDL_HapticEffectSupported(haptic: ?*SDL_Haptic, effect: [*c]const SDL_HapticEffect) bool;
pub extern fn SDL_CreateHapticEffect(haptic: ?*SDL_Haptic, effect: [*c]const SDL_HapticEffect) c_int;
pub extern fn SDL_UpdateHapticEffect(haptic: ?*SDL_Haptic, effect: c_int, data: [*c]const SDL_HapticEffect) bool;
pub extern fn SDL_RunHapticEffect(haptic: ?*SDL_Haptic, effect: c_int, iterations: Uint32) bool;
pub extern fn SDL_StopHapticEffect(haptic: ?*SDL_Haptic, effect: c_int) bool;
pub extern fn SDL_DestroyHapticEffect(haptic: ?*SDL_Haptic, effect: c_int) void;
pub extern fn SDL_GetHapticEffectStatus(haptic: ?*SDL_Haptic, effect: c_int) bool;
pub extern fn SDL_SetHapticGain(haptic: ?*SDL_Haptic, gain: c_int) bool;
pub extern fn SDL_SetHapticAutocenter(haptic: ?*SDL_Haptic, autocenter: c_int) bool;
pub extern fn SDL_PauseHaptic(haptic: ?*SDL_Haptic) bool;
pub extern fn SDL_ResumeHaptic(haptic: ?*SDL_Haptic) bool;
pub extern fn SDL_StopHapticEffects(haptic: ?*SDL_Haptic) bool;
pub extern fn SDL_HapticRumbleSupported(haptic: ?*SDL_Haptic) bool;
pub extern fn SDL_InitHapticRumble(haptic: ?*SDL_Haptic) bool;
pub extern fn SDL_PlayHapticRumble(haptic: ?*SDL_Haptic, strength: f32, length: Uint32) bool;
pub extern fn SDL_StopHapticRumble(haptic: ?*SDL_Haptic) bool;
pub const struct_SDL_hid_device = opaque {};
pub const SDL_hid_device = struct_SDL_hid_device;
pub const SDL_HID_API_BUS_UNKNOWN: c_int = 0;
pub const SDL_HID_API_BUS_USB: c_int = 1;
pub const SDL_HID_API_BUS_BLUETOOTH: c_int = 2;
pub const SDL_HID_API_BUS_I2C: c_int = 3;
pub const SDL_HID_API_BUS_SPI: c_int = 4;
pub const enum_SDL_hid_bus_type = c_uint;
pub const SDL_hid_bus_type = enum_SDL_hid_bus_type;
pub const struct_SDL_hid_device_info = extern struct {
    path: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    vendor_id: c_ushort = @import("std").mem.zeroes(c_ushort),
    product_id: c_ushort = @import("std").mem.zeroes(c_ushort),
    serial_number: [*c]wchar_t = @import("std").mem.zeroes([*c]wchar_t),
    release_number: c_ushort = @import("std").mem.zeroes(c_ushort),
    manufacturer_string: [*c]wchar_t = @import("std").mem.zeroes([*c]wchar_t),
    product_string: [*c]wchar_t = @import("std").mem.zeroes([*c]wchar_t),
    usage_page: c_ushort = @import("std").mem.zeroes(c_ushort),
    usage: c_ushort = @import("std").mem.zeroes(c_ushort),
    interface_number: c_int = @import("std").mem.zeroes(c_int),
    interface_class: c_int = @import("std").mem.zeroes(c_int),
    interface_subclass: c_int = @import("std").mem.zeroes(c_int),
    interface_protocol: c_int = @import("std").mem.zeroes(c_int),
    bus_type: SDL_hid_bus_type = @import("std").mem.zeroes(SDL_hid_bus_type),
    next: [*c]struct_SDL_hid_device_info = @import("std").mem.zeroes([*c]struct_SDL_hid_device_info),
};
pub const SDL_hid_device_info = struct_SDL_hid_device_info;
pub extern fn SDL_hid_init() c_int;
pub extern fn SDL_hid_exit() c_int;
pub extern fn SDL_hid_device_change_count() Uint32;
pub extern fn SDL_hid_enumerate(vendor_id: c_ushort, product_id: c_ushort) [*c]SDL_hid_device_info;
pub extern fn SDL_hid_free_enumeration(devs: [*c]SDL_hid_device_info) void;
pub extern fn SDL_hid_open(vendor_id: c_ushort, product_id: c_ushort, serial_number: [*c]const wchar_t) ?*SDL_hid_device;
pub extern fn SDL_hid_open_path(path: [*c]const u8) ?*SDL_hid_device;
pub extern fn SDL_hid_write(dev: ?*SDL_hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn SDL_hid_read_timeout(dev: ?*SDL_hid_device, data: [*c]u8, length: usize, milliseconds: c_int) c_int;
pub extern fn SDL_hid_read(dev: ?*SDL_hid_device, data: [*c]u8, length: usize) c_int;
pub extern fn SDL_hid_set_nonblocking(dev: ?*SDL_hid_device, nonblock: c_int) c_int;
pub extern fn SDL_hid_send_feature_report(dev: ?*SDL_hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn SDL_hid_get_feature_report(dev: ?*SDL_hid_device, data: [*c]u8, length: usize) c_int;
pub extern fn SDL_hid_get_input_report(dev: ?*SDL_hid_device, data: [*c]u8, length: usize) c_int;
pub extern fn SDL_hid_close(dev: ?*SDL_hid_device) c_int;
pub extern fn SDL_hid_get_manufacturer_string(dev: ?*SDL_hid_device, string: [*c]wchar_t, maxlen: usize) c_int;
pub extern fn SDL_hid_get_product_string(dev: ?*SDL_hid_device, string: [*c]wchar_t, maxlen: usize) c_int;
pub extern fn SDL_hid_get_serial_number_string(dev: ?*SDL_hid_device, string: [*c]wchar_t, maxlen: usize) c_int;
pub extern fn SDL_hid_get_indexed_string(dev: ?*SDL_hid_device, string_index: c_int, string: [*c]wchar_t, maxlen: usize) c_int;
pub extern fn SDL_hid_get_device_info(dev: ?*SDL_hid_device) [*c]SDL_hid_device_info;
pub extern fn SDL_hid_get_report_descriptor(dev: ?*SDL_hid_device, buf: [*c]u8, buf_size: usize) c_int;
pub extern fn SDL_hid_ble_scan(active: bool) void;
pub const SDL_HINT_DEFAULT: c_int = 0;
pub const SDL_HINT_NORMAL: c_int = 1;
pub const SDL_HINT_OVERRIDE: c_int = 2;
pub const enum_SDL_HintPriority = c_uint;
pub const SDL_HintPriority = enum_SDL_HintPriority;
pub extern fn SDL_SetHintWithPriority(name: [*c]const u8, value: [*c]const u8, priority: SDL_HintPriority) bool;
pub extern fn SDL_SetHint(name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_ResetHint(name: [*c]const u8) bool;
pub extern fn SDL_ResetHints() void;
pub extern fn SDL_GetHint(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (?*anyopaque, [*c]const u8, [*c]const u8, [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub const SDL_InitFlags = Uint32;
pub const SDL_APP_CONTINUE: c_int = 0;
pub const SDL_APP_SUCCESS: c_int = 1;
pub const SDL_APP_FAILURE: c_int = 2;
pub const enum_SDL_AppResult = c_uint;
pub const SDL_AppResult = enum_SDL_AppResult;
pub const SDL_AppInit_func = ?*const fn ([*c]?*anyopaque, c_int, [*c][*c]u8) callconv(.c) SDL_AppResult;
pub const SDL_AppIterate_func = ?*const fn (?*anyopaque) callconv(.c) SDL_AppResult;
pub const SDL_AppEvent_func = ?*const fn (?*anyopaque, [*c]SDL_Event) callconv(.c) SDL_AppResult;
pub const SDL_AppQuit_func = ?*const fn (?*anyopaque, SDL_AppResult) callconv(.c) void;
pub extern fn SDL_Init(flags: SDL_InitFlags) bool;
pub extern fn SDL_InitSubSystem(flags: SDL_InitFlags) bool;
pub extern fn SDL_QuitSubSystem(flags: SDL_InitFlags) void;
pub extern fn SDL_WasInit(flags: SDL_InitFlags) SDL_InitFlags;
pub extern fn SDL_Quit() void;
pub extern fn SDL_IsMainThread() bool;
pub const SDL_MainThreadCallback = ?*const fn (?*anyopaque) callconv(.c) void;
pub extern fn SDL_RunOnMainThread(callback: SDL_MainThreadCallback, userdata: ?*anyopaque, wait_complete: bool) bool;
pub extern fn SDL_SetAppMetadata(appname: [*c]const u8, appversion: [*c]const u8, appidentifier: [*c]const u8) bool;
pub extern fn SDL_SetAppMetadataProperty(name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_GetAppMetadataProperty(name: [*c]const u8) [*c]const u8;
pub const struct_SDL_SharedObject = opaque {};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject(handle: ?*SDL_SharedObject) void;
pub const struct_SDL_Locale = extern struct {
    language: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    country: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const SDL_Locale = struct_SDL_Locale;
pub extern fn SDL_GetPreferredLocales(count: [*c]c_int) [*c][*c]SDL_Locale;
pub const SDL_LOG_CATEGORY_APPLICATION: c_int = 0;
pub const SDL_LOG_CATEGORY_ERROR: c_int = 1;
pub const SDL_LOG_CATEGORY_ASSERT: c_int = 2;
pub const SDL_LOG_CATEGORY_SYSTEM: c_int = 3;
pub const SDL_LOG_CATEGORY_AUDIO: c_int = 4;
pub const SDL_LOG_CATEGORY_VIDEO: c_int = 5;
pub const SDL_LOG_CATEGORY_RENDER: c_int = 6;
pub const SDL_LOG_CATEGORY_INPUT: c_int = 7;
pub const SDL_LOG_CATEGORY_TEST: c_int = 8;
pub const SDL_LOG_CATEGORY_GPU: c_int = 9;
pub const SDL_LOG_CATEGORY_RESERVED2: c_int = 10;
pub const SDL_LOG_CATEGORY_RESERVED3: c_int = 11;
pub const SDL_LOG_CATEGORY_RESERVED4: c_int = 12;
pub const SDL_LOG_CATEGORY_RESERVED5: c_int = 13;
pub const SDL_LOG_CATEGORY_RESERVED6: c_int = 14;
pub const SDL_LOG_CATEGORY_RESERVED7: c_int = 15;
pub const SDL_LOG_CATEGORY_RESERVED8: c_int = 16;
pub const SDL_LOG_CATEGORY_RESERVED9: c_int = 17;
pub const SDL_LOG_CATEGORY_RESERVED10: c_int = 18;
pub const SDL_LOG_CATEGORY_CUSTOM: c_int = 19;
pub const enum_SDL_LogCategory = c_uint;
pub const SDL_LogCategory = enum_SDL_LogCategory;
pub const SDL_LOG_PRIORITY_INVALID: c_int = 0;
pub const SDL_LOG_PRIORITY_TRACE: c_int = 1;
pub const SDL_LOG_PRIORITY_VERBOSE: c_int = 2;
pub const SDL_LOG_PRIORITY_DEBUG: c_int = 3;
pub const SDL_LOG_PRIORITY_INFO: c_int = 4;
pub const SDL_LOG_PRIORITY_WARN: c_int = 5;
pub const SDL_LOG_PRIORITY_ERROR: c_int = 6;
pub const SDL_LOG_PRIORITY_CRITICAL: c_int = 7;
pub const SDL_LOG_PRIORITY_COUNT: c_int = 8;
pub const enum_SDL_LogPriority = c_uint;
pub const SDL_LogPriority = enum_SDL_LogPriority;
pub extern fn SDL_SetLogPriorities(priority: SDL_LogPriority) void;
pub extern fn SDL_SetLogPriority(category: c_int, priority: SDL_LogPriority) void;
pub extern fn SDL_GetLogPriority(category: c_int) SDL_LogPriority;
pub extern fn SDL_ResetLogPriorities() void;
pub extern fn SDL_SetLogPriorityPrefix(priority: SDL_LogPriority, prefix: [*c]const u8) bool;
pub extern fn SDL_Log(fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogTrace(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogVerbose(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogDebug(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogInfo(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogWarn(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogError(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogCritical(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogMessage(category: c_int, priority: SDL_LogPriority, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogMessageV(category: c_int, priority: SDL_LogPriority, fmt: [*c]const u8, ap: va_list) void;
pub const SDL_LogOutputFunction = ?*const fn (?*anyopaque, c_int, SDL_LogPriority, [*c]const u8) callconv(.c) void;
pub extern fn SDL_GetDefaultLogOutputFunction() SDL_LogOutputFunction;
pub extern fn SDL_GetLogOutputFunction(callback: [*c]SDL_LogOutputFunction, userdata: [*c]?*anyopaque) void;
pub extern fn SDL_SetLogOutputFunction(callback: SDL_LogOutputFunction, userdata: ?*anyopaque) void;
pub const SDL_MessageBoxFlags = Uint32;
pub const SDL_MessageBoxButtonFlags = Uint32;
pub const struct_SDL_MessageBoxButtonData = extern struct {
    flags: SDL_MessageBoxButtonFlags = @import("std").mem.zeroes(SDL_MessageBoxButtonFlags),
    buttonID: c_int = @import("std").mem.zeroes(c_int),
    text: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const SDL_MessageBoxButtonData = struct_SDL_MessageBoxButtonData;
pub const struct_SDL_MessageBoxColor = extern struct {
    r: Uint8 = @import("std").mem.zeroes(Uint8),
    g: Uint8 = @import("std").mem.zeroes(Uint8),
    b: Uint8 = @import("std").mem.zeroes(Uint8),
};
pub const SDL_MessageBoxColor = struct_SDL_MessageBoxColor;
pub const SDL_MESSAGEBOX_COLOR_BACKGROUND: c_int = 0;
pub const SDL_MESSAGEBOX_COLOR_TEXT: c_int = 1;
pub const SDL_MESSAGEBOX_COLOR_BUTTON_BORDER: c_int = 2;
pub const SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND: c_int = 3;
pub const SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED: c_int = 4;
pub const SDL_MESSAGEBOX_COLOR_COUNT: c_int = 5;
pub const enum_SDL_MessageBoxColorType = c_uint;
pub const SDL_MessageBoxColorType = enum_SDL_MessageBoxColorType;
pub const struct_SDL_MessageBoxColorScheme = extern struct {
    colors: [5]SDL_MessageBoxColor = @import("std").mem.zeroes([5]SDL_MessageBoxColor),
};
pub const SDL_MessageBoxColorScheme = struct_SDL_MessageBoxColorScheme;
pub const struct_SDL_MessageBoxData = extern struct {
    flags: SDL_MessageBoxFlags = @import("std").mem.zeroes(SDL_MessageBoxFlags),
    window: ?*SDL_Window = @import("std").mem.zeroes(?*SDL_Window),
    title: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    message: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    numbuttons: c_int = @import("std").mem.zeroes(c_int),
    buttons: [*c]const SDL_MessageBoxButtonData = @import("std").mem.zeroes([*c]const SDL_MessageBoxButtonData),
    colorScheme: [*c]const SDL_MessageBoxColorScheme = @import("std").mem.zeroes([*c]const SDL_MessageBoxColorScheme),
};
pub const SDL_MessageBoxData = struct_SDL_MessageBoxData;
pub extern fn SDL_ShowMessageBox(messageboxdata: [*c]const SDL_MessageBoxData, buttonid: [*c]c_int) bool;
pub extern fn SDL_ShowSimpleMessageBox(flags: SDL_MessageBoxFlags, title: [*c]const u8, message: [*c]const u8, window: ?*SDL_Window) bool;
pub const SDL_MetalView = ?*anyopaque;
pub extern fn SDL_Metal_CreateView(window: ?*SDL_Window) SDL_MetalView;
pub extern fn SDL_Metal_DestroyView(view: SDL_MetalView) void;
pub extern fn SDL_Metal_GetLayer(view: SDL_MetalView) ?*anyopaque;
pub extern fn SDL_OpenURL(url: [*c]const u8) bool;
pub extern fn SDL_GetPlatform() [*c]const u8;
pub const struct_SDL_Process = opaque {};
pub const SDL_Process = struct_SDL_Process;
pub extern fn SDL_CreateProcess(args: [*c]const [*c]const u8, pipe_stdio: bool) ?*SDL_Process;
pub const SDL_PROCESS_STDIO_INHERITED: c_int = 0;
pub const SDL_PROCESS_STDIO_NULL: c_int = 1;
pub const SDL_PROCESS_STDIO_APP: c_int = 2;
pub const SDL_PROCESS_STDIO_REDIRECT: c_int = 3;
pub const enum_SDL_ProcessIO = c_uint;
pub const SDL_ProcessIO = enum_SDL_ProcessIO;
pub extern fn SDL_CreateProcessWithProperties(props: SDL_PropertiesID) ?*SDL_Process;
pub extern fn SDL_GetProcessProperties(process: ?*SDL_Process) SDL_PropertiesID;
pub extern fn SDL_ReadProcess(process: ?*SDL_Process, datasize: [*c]usize, exitcode: [*c]c_int) ?*anyopaque;
pub extern fn SDL_GetProcessInput(process: ?*SDL_Process) ?*SDL_IOStream;
pub extern fn SDL_GetProcessOutput(process: ?*SDL_Process) ?*SDL_IOStream;
pub extern fn SDL_KillProcess(process: ?*SDL_Process, force: bool) bool;
pub extern fn SDL_WaitProcess(process: ?*SDL_Process, block: bool, exitcode: [*c]c_int) bool;
pub extern fn SDL_DestroyProcess(process: ?*SDL_Process) void;
pub const struct_SDL_Vertex = extern struct {
    position: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
    color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    tex_coord: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
};
pub const SDL_Vertex = struct_SDL_Vertex;
pub const SDL_TEXTUREACCESS_STATIC: c_int = 0;
pub const SDL_TEXTUREACCESS_STREAMING: c_int = 1;
pub const SDL_TEXTUREACCESS_TARGET: c_int = 2;
pub const enum_SDL_TextureAccess = c_uint;
pub const SDL_TextureAccess = enum_SDL_TextureAccess;
pub const SDL_LOGICAL_PRESENTATION_DISABLED: c_int = 0;
pub const SDL_LOGICAL_PRESENTATION_STRETCH: c_int = 1;
pub const SDL_LOGICAL_PRESENTATION_LETTERBOX: c_int = 2;
pub const SDL_LOGICAL_PRESENTATION_OVERSCAN: c_int = 3;
pub const SDL_LOGICAL_PRESENTATION_INTEGER_SCALE: c_int = 4;
pub const enum_SDL_RendererLogicalPresentation = c_uint;
pub const SDL_RendererLogicalPresentation = enum_SDL_RendererLogicalPresentation;
pub const struct_SDL_Renderer = opaque {};
pub const SDL_Renderer = struct_SDL_Renderer;
pub const struct_SDL_Texture = extern struct {
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = @import("std").mem.zeroes(c_int),
    h: c_int = @import("std").mem.zeroes(c_int),
    refcount: c_int = @import("std").mem.zeroes(c_int),
};
pub const SDL_Texture = struct_SDL_Texture;
pub extern fn SDL_GetNumRenderDrivers() c_int;
pub extern fn SDL_GetRenderDriver(index: c_int) [*c]const u8;
pub extern fn SDL_CreateWindowAndRenderer(title: [*c]const u8, width: c_int, height: c_int, window_flags: SDL_WindowFlags, window: [*c]?*SDL_Window, renderer: [*c]?*SDL_Renderer) bool;
pub extern fn SDL_CreateRenderer(window: ?*SDL_Window, name: [*c]const u8) ?*SDL_Renderer;
pub extern fn SDL_CreateRendererWithProperties(props: SDL_PropertiesID) ?*SDL_Renderer;
pub extern fn SDL_CreateSoftwareRenderer(surface: [*c]SDL_Surface) ?*SDL_Renderer;
pub extern fn SDL_GetRenderer(window: ?*SDL_Window) ?*SDL_Renderer;
pub extern fn SDL_GetRenderWindow(renderer: ?*SDL_Renderer) ?*SDL_Window;
pub extern fn SDL_GetRendererName(renderer: ?*SDL_Renderer) [*c]const u8;
pub extern fn SDL_GetRendererProperties(renderer: ?*SDL_Renderer) SDL_PropertiesID;
pub extern fn SDL_GetRenderOutputSize(renderer: ?*SDL_Renderer, w: [*c]c_int, h: [*c]c_int) bool;
pub extern fn SDL_GetCurrentRenderOutputSize(renderer: ?*SDL_Renderer, w: [*c]c_int, h: [*c]c_int) bool;
pub extern fn SDL_CreateTexture(renderer: ?*SDL_Renderer, format: SDL_PixelFormat, access: SDL_TextureAccess, w: c_int, h: c_int) [*c]SDL_Texture;
pub extern fn SDL_CreateTextureFromSurface(renderer: ?*SDL_Renderer, surface: [*c]SDL_Surface) [*c]SDL_Texture;
pub extern fn SDL_CreateTextureWithProperties(renderer: ?*SDL_Renderer, props: SDL_PropertiesID) [*c]SDL_Texture;
pub extern fn SDL_GetTextureProperties(texture: [*c]SDL_Texture) SDL_PropertiesID;
pub extern fn SDL_GetRendererFromTexture(texture: [*c]SDL_Texture) ?*SDL_Renderer;
pub extern fn SDL_GetTextureSize(texture: [*c]SDL_Texture, w: [*c]f32, h: [*c]f32) bool;
pub extern fn SDL_SetTextureColorMod(texture: [*c]SDL_Texture, r: Uint8, g: Uint8, b: Uint8) bool;
pub extern fn SDL_SetTextureColorModFloat(texture: [*c]SDL_Texture, r: f32, g: f32, b: f32) bool;
pub extern fn SDL_GetTextureColorMod(texture: [*c]SDL_Texture, r: [*c]Uint8, g: [*c]Uint8, b: [*c]Uint8) bool;
pub extern fn SDL_GetTextureColorModFloat(texture: [*c]SDL_Texture, r: [*c]f32, g: [*c]f32, b: [*c]f32) bool;
pub extern fn SDL_SetTextureAlphaMod(texture: [*c]SDL_Texture, alpha: Uint8) bool;
pub extern fn SDL_SetTextureAlphaModFloat(texture: [*c]SDL_Texture, alpha: f32) bool;
pub extern fn SDL_GetTextureAlphaMod(texture: [*c]SDL_Texture, alpha: [*c]Uint8) bool;
pub extern fn SDL_GetTextureAlphaModFloat(texture: [*c]SDL_Texture, alpha: [*c]f32) bool;
pub extern fn SDL_SetTextureBlendMode(texture: [*c]SDL_Texture, blendMode: SDL_BlendMode) bool;
pub extern fn SDL_GetTextureBlendMode(texture: [*c]SDL_Texture, blendMode: [*c]SDL_BlendMode) bool;
pub extern fn SDL_SetTextureScaleMode(texture: [*c]SDL_Texture, scaleMode: SDL_ScaleMode) bool;
pub extern fn SDL_GetTextureScaleMode(texture: [*c]SDL_Texture, scaleMode: [*c]SDL_ScaleMode) bool;
pub extern fn SDL_UpdateTexture(texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: ?*const anyopaque, pitch: c_int) bool;
pub extern fn SDL_UpdateYUVTexture(texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, Uplane: [*c]const Uint8, Upitch: c_int, Vplane: [*c]const Uint8, Vpitch: c_int) bool;
pub extern fn SDL_UpdateNVTexture(texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, UVplane: [*c]const Uint8, UVpitch: c_int) bool;
pub extern fn SDL_LockTexture(texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: [*c]?*anyopaque, pitch: [*c]c_int) bool;
pub extern fn SDL_LockTextureToSurface(texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, surface: [*c][*c]SDL_Surface) bool;
pub extern fn SDL_UnlockTexture(texture: [*c]SDL_Texture) void;
pub extern fn SDL_SetRenderTarget(renderer: ?*SDL_Renderer, texture: [*c]SDL_Texture) bool;
pub extern fn SDL_GetRenderTarget(renderer: ?*SDL_Renderer) [*c]SDL_Texture;
pub extern fn SDL_SetRenderLogicalPresentation(renderer: ?*SDL_Renderer, w: c_int, h: c_int, mode: SDL_RendererLogicalPresentation) bool;
pub extern fn SDL_GetRenderLogicalPresentation(renderer: ?*SDL_Renderer, w: [*c]c_int, h: [*c]c_int, mode: [*c]SDL_RendererLogicalPresentation) bool;
pub extern fn SDL_GetRenderLogicalPresentationRect(renderer: ?*SDL_Renderer, rect: [*c]SDL_FRect) bool;
pub extern fn SDL_RenderCoordinatesFromWindow(renderer: ?*SDL_Renderer, window_x: f32, window_y: f32, x: [*c]f32, y: [*c]f32) bool;
pub extern fn SDL_RenderCoordinatesToWindow(renderer: ?*SDL_Renderer, x: f32, y: f32, window_x: [*c]f32, window_y: [*c]f32) bool;
pub extern fn SDL_ConvertEventToRenderCoordinates(renderer: ?*SDL_Renderer, event: [*c]SDL_Event) bool;
pub extern fn SDL_SetRenderViewport(renderer: ?*SDL_Renderer, rect: [*c]const SDL_Rect) bool;
pub extern fn SDL_GetRenderViewport(renderer: ?*SDL_Renderer, rect: [*c]SDL_Rect) bool;
pub extern fn SDL_RenderViewportSet(renderer: ?*SDL_Renderer) bool;
pub extern fn SDL_GetRenderSafeArea(renderer: ?*SDL_Renderer, rect: [*c]SDL_Rect) bool;
pub extern fn SDL_SetRenderClipRect(renderer: ?*SDL_Renderer, rect: [*c]const SDL_Rect) bool;
pub extern fn SDL_GetRenderClipRect(renderer: ?*SDL_Renderer, rect: [*c]SDL_Rect) bool;
pub extern fn SDL_RenderClipEnabled(renderer: ?*SDL_Renderer) bool;
pub extern fn SDL_SetRenderScale(renderer: ?*SDL_Renderer, scaleX: f32, scaleY: f32) bool;
pub extern fn SDL_GetRenderScale(renderer: ?*SDL_Renderer, scaleX: [*c]f32, scaleY: [*c]f32) bool;
pub extern fn SDL_SetRenderDrawColor(renderer: ?*SDL_Renderer, r: Uint8, g: Uint8, b: Uint8, a: Uint8) bool;
pub extern fn SDL_SetRenderDrawColorFloat(renderer: ?*SDL_Renderer, r: f32, g: f32, b: f32, a: f32) bool;
pub extern fn SDL_GetRenderDrawColor(renderer: ?*SDL_Renderer, r: [*c]Uint8, g: [*c]Uint8, b: [*c]Uint8, a: [*c]Uint8) bool;
pub extern fn SDL_GetRenderDrawColorFloat(renderer: ?*SDL_Renderer, r: [*c]f32, g: [*c]f32, b: [*c]f32, a: [*c]f32) bool;
pub extern fn SDL_SetRenderColorScale(renderer: ?*SDL_Renderer, scale: f32) bool;
pub extern fn SDL_GetRenderColorScale(renderer: ?*SDL_Renderer, scale: [*c]f32) bool;
pub extern fn SDL_SetRenderDrawBlendMode(renderer: ?*SDL_Renderer, blendMode: SDL_BlendMode) bool;
pub extern fn SDL_GetRenderDrawBlendMode(renderer: ?*SDL_Renderer, blendMode: [*c]SDL_BlendMode) bool;
pub extern fn SDL_RenderClear(renderer: ?*SDL_Renderer) bool;
pub extern fn SDL_RenderPoint(renderer: ?*SDL_Renderer, x: f32, y: f32) bool;
pub extern fn SDL_RenderPoints(renderer: ?*SDL_Renderer, points: [*c]const SDL_FPoint, count: c_int) bool;
pub extern fn SDL_RenderLine(renderer: ?*SDL_Renderer, x1: f32, y1: f32, x2: f32, y2: f32) bool;
pub extern fn SDL_RenderLines(renderer: ?*SDL_Renderer, points: [*c]const SDL_FPoint, count: c_int) bool;
pub extern fn SDL_RenderRect(renderer: ?*SDL_Renderer, rect: [*c]const SDL_FRect) bool;
pub extern fn SDL_RenderRects(renderer: ?*SDL_Renderer, rects: [*c]const SDL_FRect, count: c_int) bool;
pub extern fn SDL_RenderFillRect(renderer: ?*SDL_Renderer, rect: [*c]const SDL_FRect) bool;
pub extern fn SDL_RenderFillRects(renderer: ?*SDL_Renderer, rects: [*c]const SDL_FRect, count: c_int) bool;
pub extern fn SDL_RenderTexture(renderer: ?*SDL_Renderer, texture: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, dstrect: [*c]const SDL_FRect) bool;
pub extern fn SDL_RenderTextureRotated(renderer: ?*SDL_Renderer, texture: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, dstrect: [*c]const SDL_FRect, angle: f64, center: [*c]const SDL_FPoint, flip: SDL_FlipMode) bool;
pub extern fn SDL_RenderTextureAffine(renderer: ?*SDL_Renderer, texture: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, origin: [*c]const SDL_FPoint, right: [*c]const SDL_FPoint, down: [*c]const SDL_FPoint) bool;
pub extern fn SDL_RenderTextureTiled(renderer: ?*SDL_Renderer, texture: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, scale: f32, dstrect: [*c]const SDL_FRect) bool;
pub extern fn SDL_RenderTexture9Grid(renderer: ?*SDL_Renderer, texture: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, left_width: f32, right_width: f32, top_height: f32, bottom_height: f32, scale: f32, dstrect: [*c]const SDL_FRect) bool;
pub extern fn SDL_RenderGeometry(renderer: ?*SDL_Renderer, texture: [*c]SDL_Texture, vertices: [*c]const SDL_Vertex, num_vertices: c_int, indices: [*c]const c_int, num_indices: c_int) bool;
pub extern fn SDL_RenderGeometryRaw(renderer: ?*SDL_Renderer, texture: [*c]SDL_Texture, xy: [*c]const f32, xy_stride: c_int, color: [*c]const SDL_FColor, color_stride: c_int, uv: [*c]const f32, uv_stride: c_int, num_vertices: c_int, indices: ?*const anyopaque, num_indices: c_int, size_indices: c_int) bool;
pub extern fn SDL_RenderReadPixels(renderer: ?*SDL_Renderer, rect: [*c]const SDL_Rect) [*c]SDL_Surface;
pub extern fn SDL_RenderPresent(renderer: ?*SDL_Renderer) bool;
pub extern fn SDL_DestroyTexture(texture: [*c]SDL_Texture) void;
pub extern fn SDL_DestroyRenderer(renderer: ?*SDL_Renderer) void;
pub extern fn SDL_FlushRenderer(renderer: ?*SDL_Renderer) bool;
pub extern fn SDL_GetRenderMetalLayer(renderer: ?*SDL_Renderer) ?*anyopaque;
pub extern fn SDL_GetRenderMetalCommandEncoder(renderer: ?*SDL_Renderer) ?*anyopaque;
pub extern fn SDL_AddVulkanRenderSemaphores(renderer: ?*SDL_Renderer, wait_stage_mask: Uint32, wait_semaphore: Sint64, signal_semaphore: Sint64) bool;
pub extern fn SDL_SetRenderVSync(renderer: ?*SDL_Renderer, vsync: c_int) bool;
pub extern fn SDL_GetRenderVSync(renderer: ?*SDL_Renderer, vsync: [*c]c_int) bool;
pub extern fn SDL_RenderDebugText(renderer: ?*SDL_Renderer, x: f32, y: f32, str: [*c]const u8) bool;
pub extern fn SDL_RenderDebugTextFormat(renderer: ?*SDL_Renderer, x: f32, y: f32, fmt: [*c]const u8, ...) bool;
pub const struct_SDL_StorageInterface = extern struct {
    version: Uint32 = @import("std").mem.zeroes(Uint32),
    close: ?*const fn (?*anyopaque) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.c) bool),
    ready: ?*const fn (?*anyopaque) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.c) bool),
    enumerate: ?*const fn (?*anyopaque, [*c]const u8, SDL_EnumerateDirectoryCallback, ?*anyopaque) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque, [*c]const u8, SDL_EnumerateDirectoryCallback, ?*anyopaque) callconv(.c) bool),
    info: ?*const fn (?*anyopaque, [*c]const u8, [*c]SDL_PathInfo) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque, [*c]const u8, [*c]SDL_PathInfo) callconv(.c) bool),
    read_file: ?*const fn (?*anyopaque, [*c]const u8, ?*anyopaque, Uint64) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque, [*c]const u8, ?*anyopaque, Uint64) callconv(.c) bool),
    write_file: ?*const fn (?*anyopaque, [*c]const u8, ?*const anyopaque, Uint64) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque, [*c]const u8, ?*const anyopaque, Uint64) callconv(.c) bool),
    mkdir: ?*const fn (?*anyopaque, [*c]const u8) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque, [*c]const u8) callconv(.c) bool),
    remove: ?*const fn (?*anyopaque, [*c]const u8) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque, [*c]const u8) callconv(.c) bool),
    rename: ?*const fn (?*anyopaque, [*c]const u8, [*c]const u8) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque, [*c]const u8, [*c]const u8) callconv(.c) bool),
    copy: ?*const fn (?*anyopaque, [*c]const u8, [*c]const u8) callconv(.c) bool = @import("std").mem.zeroes(?*const fn (?*anyopaque, [*c]const u8, [*c]const u8) callconv(.c) bool),
    space_remaining: ?*const fn (?*anyopaque) callconv(.c) Uint64 = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.c) Uint64),
};
pub const SDL_StorageInterface = struct_SDL_StorageInterface;
// include/SDL3/SDL_stdinc.h:203:42: warning: ignoring StaticAssert declaration
pub const struct_SDL_Storage = opaque {};
pub const SDL_Storage = struct_SDL_Storage;
pub extern fn SDL_OpenTitleStorage(override: [*c]const u8, props: SDL_PropertiesID) ?*SDL_Storage;
pub extern fn SDL_OpenUserStorage(org: [*c]const u8, app: [*c]const u8, props: SDL_PropertiesID) ?*SDL_Storage;
pub extern fn SDL_OpenFileStorage(path: [*c]const u8) ?*SDL_Storage;
pub extern fn SDL_OpenStorage(iface: [*c]const SDL_StorageInterface, userdata: ?*anyopaque) ?*SDL_Storage;
pub extern fn SDL_CloseStorage(storage: ?*SDL_Storage) bool;
pub extern fn SDL_StorageReady(storage: ?*SDL_Storage) bool;
pub extern fn SDL_GetStorageFileSize(storage: ?*SDL_Storage, path: [*c]const u8, length: [*c]Uint64) bool;
pub extern fn SDL_ReadStorageFile(storage: ?*SDL_Storage, path: [*c]const u8, destination: ?*anyopaque, length: Uint64) bool;
pub extern fn SDL_WriteStorageFile(storage: ?*SDL_Storage, path: [*c]const u8, source: ?*const anyopaque, length: Uint64) bool;
pub extern fn SDL_CreateStorageDirectory(storage: ?*SDL_Storage, path: [*c]const u8) bool;
pub extern fn SDL_EnumerateStorageDirectory(storage: ?*SDL_Storage, path: [*c]const u8, callback: SDL_EnumerateDirectoryCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveStoragePath(storage: ?*SDL_Storage, path: [*c]const u8) bool;
pub extern fn SDL_RenameStoragePath(storage: ?*SDL_Storage, oldpath: [*c]const u8, newpath: [*c]const u8) bool;
pub extern fn SDL_CopyStorageFile(storage: ?*SDL_Storage, oldpath: [*c]const u8, newpath: [*c]const u8) bool;
pub extern fn SDL_GetStoragePathInfo(storage: ?*SDL_Storage, path: [*c]const u8, info: [*c]SDL_PathInfo) bool;
pub extern fn SDL_GetStorageSpaceRemaining(storage: ?*SDL_Storage) Uint64;
pub extern fn SDL_GlobStorageDirectory(storage: ?*SDL_Storage, path: [*c]const u8, pattern: [*c]const u8, flags: SDL_GlobFlags, count: [*c]c_int) [*c][*c]u8;
pub const struct_tagMSG = opaque {};
pub const MSG = struct_tagMSG;
pub const SDL_WindowsMessageHook = ?*const fn (?*anyopaque, ?*MSG) callconv(.c) bool;
pub extern fn SDL_SetWindowsMessageHook(callback: SDL_WindowsMessageHook, userdata: ?*anyopaque) void;
pub extern fn SDL_GetDirect3D9AdapterIndex(displayID: SDL_DisplayID) c_int;
pub extern fn SDL_GetDXGIOutputInfo(displayID: SDL_DisplayID, adapterIndex: [*c]c_int, outputIndex: [*c]c_int) bool;
pub const union__XEvent = opaque {};
pub const XEvent = union__XEvent;
pub const SDL_X11EventHook = ?*const fn (?*anyopaque, ?*XEvent) callconv(.c) bool;
pub extern fn SDL_SetX11EventHook(callback: SDL_X11EventHook, userdata: ?*anyopaque) void;
pub extern fn SDL_IsTablet() bool;
pub extern fn SDL_IsTV() bool;
pub const SDL_SANDBOX_NONE: c_int = 0;
pub const SDL_SANDBOX_UNKNOWN_CONTAINER: c_int = 1;
pub const SDL_SANDBOX_FLATPAK: c_int = 2;
pub const SDL_SANDBOX_SNAP: c_int = 3;
pub const SDL_SANDBOX_MACOS: c_int = 4;
pub const enum_SDL_Sandbox = c_uint;
pub const SDL_Sandbox = enum_SDL_Sandbox;
pub extern fn SDL_GetSandbox() SDL_Sandbox;
pub extern fn SDL_OnApplicationWillTerminate() void;
pub extern fn SDL_OnApplicationDidReceiveMemoryWarning() void;
pub extern fn SDL_OnApplicationWillEnterBackground() void;
pub extern fn SDL_OnApplicationDidEnterBackground() void;
pub extern fn SDL_OnApplicationWillEnterForeground() void;
pub extern fn SDL_OnApplicationDidEnterForeground() void;
pub const struct_SDL_DateTime = extern struct {
    year: c_int = @import("std").mem.zeroes(c_int),
    month: c_int = @import("std").mem.zeroes(c_int),
    day: c_int = @import("std").mem.zeroes(c_int),
    hour: c_int = @import("std").mem.zeroes(c_int),
    minute: c_int = @import("std").mem.zeroes(c_int),
    second: c_int = @import("std").mem.zeroes(c_int),
    nanosecond: c_int = @import("std").mem.zeroes(c_int),
    day_of_week: c_int = @import("std").mem.zeroes(c_int),
    utc_offset: c_int = @import("std").mem.zeroes(c_int),
};
pub const SDL_DateTime = struct_SDL_DateTime;
pub const SDL_DATE_FORMAT_YYYYMMDD: c_int = 0;
pub const SDL_DATE_FORMAT_DDMMYYYY: c_int = 1;
pub const SDL_DATE_FORMAT_MMDDYYYY: c_int = 2;
pub const enum_SDL_DateFormat = c_uint;
pub const SDL_DateFormat = enum_SDL_DateFormat;
pub const SDL_TIME_FORMAT_24HR: c_int = 0;
pub const SDL_TIME_FORMAT_12HR: c_int = 1;
pub const enum_SDL_TimeFormat = c_uint;
pub const SDL_TimeFormat = enum_SDL_TimeFormat;
pub extern fn SDL_GetDateTimeLocalePreferences(dateFormat: [*c]SDL_DateFormat, timeFormat: [*c]SDL_TimeFormat) bool;
pub extern fn SDL_GetCurrentTime(ticks: [*c]SDL_Time) bool;
pub extern fn SDL_TimeToDateTime(ticks: SDL_Time, dt: [*c]SDL_DateTime, localTime: bool) bool;
pub extern fn SDL_DateTimeToTime(dt: [*c]const SDL_DateTime, ticks: [*c]SDL_Time) bool;
pub extern fn SDL_TimeToWindows(ticks: SDL_Time, dwLowDateTime: [*c]Uint32, dwHighDateTime: [*c]Uint32) void;
pub extern fn SDL_TimeFromWindows(dwLowDateTime: Uint32, dwHighDateTime: Uint32) SDL_Time;
pub extern fn SDL_GetDaysInMonth(year: c_int, month: c_int) c_int;
pub extern fn SDL_GetDayOfYear(year: c_int, month: c_int, day: c_int) c_int;
pub extern fn SDL_GetDayOfWeek(year: c_int, month: c_int, day: c_int) c_int;
pub extern fn SDL_GetTicks() Uint64;
pub extern fn SDL_GetTicksNS() Uint64;
pub extern fn SDL_GetPerformanceCounter() Uint64;
pub extern fn SDL_GetPerformanceFrequency() Uint64;
pub extern fn SDL_Delay(ms: Uint32) void;
pub extern fn SDL_DelayNS(ns: Uint64) void;
pub extern fn SDL_DelayPrecise(ns: Uint64) void;
pub const SDL_TimerID = Uint32;
pub const SDL_TimerCallback = ?*const fn (?*anyopaque, SDL_TimerID, Uint32) callconv(.c) Uint32;
pub extern fn SDL_AddTimer(interval: Uint32, callback: SDL_TimerCallback, userdata: ?*anyopaque) SDL_TimerID;
pub const SDL_NSTimerCallback = ?*const fn (?*anyopaque, SDL_TimerID, Uint64) callconv(.c) Uint64;
pub extern fn SDL_AddTimerNS(interval: Uint64, callback: SDL_NSTimerCallback, userdata: ?*anyopaque) SDL_TimerID;
pub extern fn SDL_RemoveTimer(id: SDL_TimerID) bool;
pub const struct_SDL_Tray = opaque {};
pub const SDL_Tray = struct_SDL_Tray;
pub const struct_SDL_TrayMenu = opaque {};
pub const SDL_TrayMenu = struct_SDL_TrayMenu;
pub const struct_SDL_TrayEntry = opaque {};
pub const SDL_TrayEntry = struct_SDL_TrayEntry;
pub const SDL_TrayEntryFlags = Uint32;
pub const SDL_TrayCallback = ?*const fn (?*anyopaque, ?*SDL_TrayEntry) callconv(.c) void;
pub extern fn SDL_CreateTray(icon: [*c]SDL_Surface, tooltip: [*c]const u8) ?*SDL_Tray;
pub extern fn SDL_SetTrayIcon(tray: ?*SDL_Tray, icon: [*c]SDL_Surface) void;
pub extern fn SDL_SetTrayTooltip(tray: ?*SDL_Tray, tooltip: [*c]const u8) void;
pub extern fn SDL_CreateTrayMenu(tray: ?*SDL_Tray) ?*SDL_TrayMenu;
pub extern fn SDL_CreateTraySubmenu(entry: ?*SDL_TrayEntry) ?*SDL_TrayMenu;
pub extern fn SDL_GetTrayMenu(tray: ?*SDL_Tray) ?*SDL_TrayMenu;
pub extern fn SDL_GetTraySubmenu(entry: ?*SDL_TrayEntry) ?*SDL_TrayMenu;
pub extern fn SDL_GetTrayEntries(menu: ?*SDL_TrayMenu, count: [*c]c_int) [*c]?*const SDL_TrayEntry;
pub extern fn SDL_RemoveTrayEntry(entry: ?*SDL_TrayEntry) void;
pub extern fn SDL_InsertTrayEntryAt(menu: ?*SDL_TrayMenu, pos: c_int, label: [*c]const u8, flags: SDL_TrayEntryFlags) ?*SDL_TrayEntry;
pub extern fn SDL_SetTrayEntryLabel(entry: ?*SDL_TrayEntry, label: [*c]const u8) void;
pub extern fn SDL_GetTrayEntryLabel(entry: ?*SDL_TrayEntry) [*c]const u8;
pub extern fn SDL_SetTrayEntryChecked(entry: ?*SDL_TrayEntry, checked: bool) void;
pub extern fn SDL_GetTrayEntryChecked(entry: ?*SDL_TrayEntry) bool;
pub extern fn SDL_SetTrayEntryEnabled(entry: ?*SDL_TrayEntry, enabled: bool) void;
pub extern fn SDL_GetTrayEntryEnabled(entry: ?*SDL_TrayEntry) bool;
pub extern fn SDL_SetTrayEntryCallback(entry: ?*SDL_TrayEntry, callback: SDL_TrayCallback, userdata: ?*anyopaque) void;
pub extern fn SDL_ClickTrayEntry(entry: ?*SDL_TrayEntry) void;
pub extern fn SDL_DestroyTray(tray: ?*SDL_Tray) void;
pub extern fn SDL_GetTrayEntryParent(entry: ?*SDL_TrayEntry) ?*SDL_TrayMenu;
pub extern fn SDL_GetTrayMenuParentEntry(menu: ?*SDL_TrayMenu) ?*SDL_TrayEntry;
pub extern fn SDL_GetTrayMenuParentTray(menu: ?*SDL_TrayMenu) ?*SDL_Tray;
pub extern fn SDL_UpdateTrays() void;
pub extern fn SDL_GetVersion() c_int;
pub extern fn SDL_GetRevision() [*c]const u8;
pub const struct_VkInstance_T = opaque {};
pub const VkInstance = ?*struct_VkInstance_T;
pub const struct_VkPhysicalDevice_T = opaque {};
pub const VkPhysicalDevice = ?*struct_VkPhysicalDevice_T;
pub const struct_VkSurfaceKHR_T = opaque {};
pub const VkSurfaceKHR = ?*struct_VkSurfaceKHR_T;
pub const struct_VkAllocationCallbacks = opaque {};
pub extern fn SDL_Vulkan_LoadLibrary(path: [*c]const u8) bool;
pub extern fn SDL_Vulkan_GetVkGetInstanceProcAddr() SDL_FunctionPointer;
pub extern fn SDL_Vulkan_UnloadLibrary() void;
pub extern fn SDL_Vulkan_GetInstanceExtensions(count: [*c]Uint32) [*c]const [*c]const u8;
pub extern fn SDL_Vulkan_CreateSurface(window: ?*SDL_Window, instance: VkInstance, allocator: ?*const struct_VkAllocationCallbacks, surface: [*c]VkSurfaceKHR) bool;
pub extern fn SDL_Vulkan_DestroySurface(instance: VkInstance, surface: VkSurfaceKHR, allocator: ?*const struct_VkAllocationCallbacks) void;
pub extern fn SDL_Vulkan_GetPresentationSupport(instance: VkInstance, physicalDevice: VkPhysicalDevice, queueFamilyIndex: Uint32) bool;
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 19);
pub const __clang_minor__ = @as(c_int, 1);
pub const __clang_patchlevel__ = @as(c_int, 7);
pub const __clang_version__ = "19.1.7 (https://gitlab.archlinux.org/archlinux/packaging/packages/clang.git b536128bd29a83a26c0aafda19942995b30fc5fd)";
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
pub const __VERSION__ = "Clang 19.1.7 (https://gitlab.archlinux.org/archlinux/packaging/packages/clang.git b536128bd29a83a26c0aafda19942995b30fc5fd)";
pub const __GXX_TYPEINFO_EQUALITY_INLINE = @as(c_int, 0);
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __SEH__ = @as(c_int, 1);
pub const __clang_literal_encoding__ = "UTF-8";
pub const __clang_wide_literal_encoding__ = "UTF-16";
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_WIDTH__ = @as(c_int, 32);
pub const __LLONG_WIDTH__ = @as(c_int, 64);
pub const __BITINT_MAXWIDTH__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 8388608, .decimal);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @as(c_long, 2147483647);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 16);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 16);
pub const __INTMAX_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 4);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 2);
pub const __SIZEOF_WINT_T__ = @as(c_int, 2);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_TYPE__ = c_longlong;
pub const __INTMAX_FMTd__ = "lld";
pub const __INTMAX_FMTi__ = "lli";
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`");
// (no file):95:9
pub const __UINTMAX_TYPE__ = c_ulonglong;
pub const __UINTMAX_FMTo__ = "llo";
pub const __UINTMAX_FMTu__ = "llu";
pub const __UINTMAX_FMTx__ = "llx";
pub const __UINTMAX_FMTX__ = "llX";
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`");
// (no file):101:9
pub const __PTRDIFF_TYPE__ = c_longlong;
pub const __PTRDIFF_FMTd__ = "lld";
pub const __PTRDIFF_FMTi__ = "lli";
pub const __INTPTR_TYPE__ = c_longlong;
pub const __INTPTR_FMTd__ = "lld";
pub const __INTPTR_FMTi__ = "lli";
pub const __SIZE_TYPE__ = c_ulonglong;
pub const __SIZE_FMTo__ = "llo";
pub const __SIZE_FMTu__ = "llu";
pub const __SIZE_FMTx__ = "llx";
pub const __SIZE_FMTX__ = "llX";
pub const __WCHAR_TYPE__ = c_ushort;
pub const __WINT_TYPE__ = c_ushort;
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTPTR_TYPE__ = c_ulonglong;
pub const __UINTPTR_FMTo__ = "llo";
pub const __UINTPTR_FMTu__ = "llu";
pub const __UINTPTR_FMTx__ = "llx";
pub const __UINTPTR_FMTX__ = "llX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_NORM_MAX__ = @as(f16, 6.5504e+4);
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
pub const __FLT_NORM_MAX__ = @as(f32, 3.40282347e+38);
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
pub const __DBL_NORM_MAX__ = @as(f64, 1.7976931348623157e+308);
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
pub const __LDBL_NORM_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
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
pub const __WCHAR_UNSIGNED__ = @as(c_int, 1);
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
pub const __INT64_TYPE__ = c_longlong;
pub const __INT64_FMTd__ = "lld";
pub const __INT64_FMTi__ = "lli";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`");
// (no file):203:9
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
// (no file):225:9
pub const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulonglong;
pub const __UINT64_FMTo__ = "llo";
pub const __UINT64_FMTu__ = "llu";
pub const __UINT64_FMTx__ = "llx";
pub const __UINT64_FMTX__ = "llX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`");
// (no file):233:9
pub const __UINT64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __INT64_MAX__ = @as(c_longlong, 9223372036854775807);
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
pub const __INT_LEAST64_TYPE__ = c_longlong;
pub const __INT_LEAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_LEAST64_FMTd__ = "lld";
pub const __INT_LEAST64_FMTi__ = "lli";
pub const __UINT_LEAST64_TYPE__ = c_ulonglong;
pub const __UINT_LEAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_LEAST64_FMTo__ = "llo";
pub const __UINT_LEAST64_FMTu__ = "llu";
pub const __UINT_LEAST64_FMTx__ = "llx";
pub const __UINT_LEAST64_FMTX__ = "llX";
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
pub const __INT_FAST64_TYPE__ = c_longlong;
pub const __INT_FAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_FAST64_FMTd__ = "lld";
pub const __INT_FAST64_FMTi__ = "lli";
pub const __UINT_FAST64_TYPE__ = c_ulonglong;
pub const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_FAST64_FMTo__ = "llo";
pub const __UINT_FAST64_FMTu__ = "llu";
pub const __UINT_FAST64_FMTx__ = "llx";
pub const __UINT_FAST64_FMTX__ = "llX";
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
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SSP_STRONG__ = @as(c_int, 2);
pub const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __seg_gs = @compileError("unable to translate macro: undefined identifier `address_space`");
// (no file):366:9
pub const __seg_fs = @compileError("unable to translate macro: undefined identifier `address_space`");
// (no file):367:9
pub const __k8 = @as(c_int, 1);
pub const __k8__ = @as(c_int, 1);
pub const __tune_k8__ = @as(c_int, 1);
pub const __REGISTER_PREFIX__ = "";
pub const __NO_MATH_INLINES = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE2_MATH__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __SIZEOF_FLOAT128__ = @as(c_int, 16);
pub const _WIN32 = @as(c_int, 1);
pub const _WIN64 = @as(c_int, 1);
pub const WIN32 = @as(c_int, 1);
pub const __WIN32 = @as(c_int, 1);
pub const __WIN32__ = @as(c_int, 1);
pub const WINNT = @as(c_int, 1);
pub const __WINNT = @as(c_int, 1);
pub const __WINNT__ = @as(c_int, 1);
pub const WIN64 = @as(c_int, 1);
pub const __WIN64 = @as(c_int, 1);
pub const __WIN64__ = @as(c_int, 1);
pub const __MINGW64__ = @as(c_int, 1);
pub const __MSVCRT__ = @as(c_int, 1);
pub const __MINGW32__ = @as(c_int, 1);
pub const __declspec = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// (no file):398:9
pub const _cdecl = @compileError("unable to translate macro: undefined identifier `__cdecl__`");
// (no file):399:9
pub const __cdecl = @compileError("unable to translate macro: undefined identifier `__cdecl__`");
// (no file):400:9
pub const _stdcall = @compileError("unable to translate macro: undefined identifier `__stdcall__`");
// (no file):401:9
pub const __stdcall = @compileError("unable to translate macro: undefined identifier `__stdcall__`");
// (no file):402:9
pub const _fastcall = @compileError("unable to translate macro: undefined identifier `__fastcall__`");
// (no file):403:9
pub const __fastcall = @compileError("unable to translate macro: undefined identifier `__fastcall__`");
// (no file):404:9
pub const _thiscall = @compileError("unable to translate macro: undefined identifier `__thiscall__`");
// (no file):405:9
pub const __thiscall = @compileError("unable to translate macro: undefined identifier `__thiscall__`");
// (no file):406:9
pub const _pascal = @compileError("unable to translate macro: undefined identifier `__pascal__`");
// (no file):407:9
pub const __pascal = @compileError("unable to translate macro: undefined identifier `__pascal__`");
// (no file):408:9
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __STDC_EMBED_NOT_FOUND__ = @as(c_int, 0);
pub const __STDC_EMBED_FOUND__ = @as(c_int, 1);
pub const __STDC_EMBED_EMPTY__ = @as(c_int, 2);
pub const __MSVCRT_VERSION__ = @as(c_int, 0xE00);
pub const _WIN32_WINNT = @as(c_int, 0x0a00);
pub const _DEBUG = @as(c_int, 1);
pub const SDL_h_ = "";
pub const SDL_stdinc_h_ = "";
pub const SDL_platform_defines_h_ = "";
pub const SDL_PLATFORM_WINDOWS = @as(c_int, 1);
pub const HAVE_WINAPIFAMILY_H = @as(c_int, 0);
pub const WINAPI_FAMILY_WINRT = @as(c_int, 0);
pub const SDL_WINAPI_FAMILY_PHONE = @as(c_int, 0);
pub const SDL_PLATFORM_WIN32 = @as(c_int, 1);
pub const __need___va_list = "";
pub const __need_va_list = "";
pub const __need_va_arg = "";
pub const __need___va_copy = "";
pub const __need_va_copy = "";
pub const __STDARG_H = "";
pub const __GNUC_VA_LIST = "";
pub const _VA_LIST = "";
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /usr/lib/zig/include/__stdarg_va_arg.h:17:9
pub const va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`");
// /usr/lib/zig/include/__stdarg_va_arg.h:19:9
pub const va_arg = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// /usr/lib/zig/include/__stdarg_va_arg.h:20:9
pub const __va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// /usr/lib/zig/include/__stdarg___va_copy.h:11:9
pub const va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// /usr/lib/zig/include/__stdarg_va_copy.h:11:9
pub const __CLANG_STDINT_H = "";
pub const _STDINT_H = "";
pub const _INC_CRTDEFS = "";
pub const _INC_CORECRT = "";
pub const _INC__MINGW_H = "";
pub const _INC_CRTDEFS_MACRO = "";
pub const __MINGW64_PASTE2 = @compileError("unable to translate C expr: unexpected token '##'");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_mac.h:10:9
pub inline fn __MINGW64_PASTE(x: anytype, y: anytype) @TypeOf(__MINGW64_PASTE2(x, y)) {
    _ = &x;
    _ = &y;
    return __MINGW64_PASTE2(x, y);
}
pub const __STRINGIFY = @compileError("unable to translate C expr: unexpected token '#'");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_mac.h:13:9
pub inline fn __MINGW64_STRINGIFY(x: anytype) @TypeOf(__STRINGIFY(x)) {
    _ = &x;
    return __STRINGIFY(x);
}
pub const __MINGW64_VERSION_MAJOR = @as(c_int, 13);
pub const __MINGW64_VERSION_MINOR = @as(c_int, 0);
pub const __MINGW64_VERSION_BUGFIX = @as(c_int, 0);
pub const __MINGW64_VERSION_RC = @as(c_int, 0);
pub const __MINGW64_VERSION_STR = __MINGW64_STRINGIFY(__MINGW64_VERSION_MAJOR) ++ "." ++ __MINGW64_STRINGIFY(__MINGW64_VERSION_MINOR) ++ "." ++ __MINGW64_STRINGIFY(__MINGW64_VERSION_BUGFIX);
pub const __MINGW64_VERSION_STATE = "alpha";
pub const __MINGW32_MAJOR_VERSION = @as(c_int, 3);
pub const __MINGW32_MINOR_VERSION = @as(c_int, 11);
pub const _M_AMD64 = @as(c_int, 100);
pub const _M_X64 = @as(c_int, 100);
pub const @"_" = @as(c_int, 1);
pub const __MINGW_USE_UNDERSCORE_PREFIX = @as(c_int, 0);
pub const __MINGW_IMP_SYMBOL = @compileError("unable to translate macro: undefined identifier `__imp_`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_mac.h:129:11
pub const __MINGW_IMP_LSYMBOL = @compileError("unable to translate macro: undefined identifier `__imp_`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_mac.h:130:11
pub inline fn __MINGW_USYMBOL(sym: anytype) @TypeOf(sym) {
    _ = &sym;
    return sym;
}
pub inline fn __MINGW_LSYMBOL(sym: anytype) @TypeOf(__MINGW64_PASTE(@"_", sym)) {
    _ = &sym;
    return __MINGW64_PASTE(@"_", sym);
}
pub const __MINGW_ASM_CALL = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_mac.h:140:9
pub const __MINGW_ASM_CRT_CALL = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_mac.h:141:9
pub const __MINGW_EXTENSION = @compileError("unable to translate C expr: unexpected token '__extension__'");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_mac.h:173:13
pub const __C89_NAMELESS = __MINGW_EXTENSION;
pub const __C89_NAMELESSSTRUCTNAME = "";
pub const __C89_NAMELESSSTRUCTNAME1 = "";
pub const __C89_NAMELESSSTRUCTNAME2 = "";
pub const __C89_NAMELESSSTRUCTNAME3 = "";
pub const __C89_NAMELESSSTRUCTNAME4 = "";
pub const __C89_NAMELESSSTRUCTNAME5 = "";
pub const __C89_NAMELESSUNIONNAME = "";
pub const __C89_NAMELESSUNIONNAME1 = "";
pub const __C89_NAMELESSUNIONNAME2 = "";
pub const __C89_NAMELESSUNIONNAME3 = "";
pub const __C89_NAMELESSUNIONNAME4 = "";
pub const __C89_NAMELESSUNIONNAME5 = "";
pub const __C89_NAMELESSUNIONNAME6 = "";
pub const __C89_NAMELESSUNIONNAME7 = "";
pub const __C89_NAMELESSUNIONNAME8 = "";
pub const __GNU_EXTENSION = __MINGW_EXTENSION;
pub const __MINGW_HAVE_ANSI_C99_PRINTF = @as(c_int, 1);
pub const __MINGW_HAVE_WIDE_C99_PRINTF = @as(c_int, 1);
pub const __MINGW_HAVE_ANSI_C99_SCANF = @as(c_int, 1);
pub const __MINGW_HAVE_WIDE_C99_SCANF = @as(c_int, 1);
pub const __MINGW_POISON_NAME = @compileError("unable to translate macro: undefined identifier `_layout_has_not_been_verified_and_its_declaration_is_most_likely_incorrect`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_mac.h:213:11
pub const __MSABI_LONG = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const __MINGW_GCC_VERSION = ((__GNUC__ * @as(c_int, 10000)) + (__GNUC_MINOR__ * @as(c_int, 100))) + __GNUC_PATCHLEVEL__;
pub inline fn __MINGW_GNUC_PREREQ(major: anytype, minor: anytype) @TypeOf((__GNUC__ > major) or ((__GNUC__ == major) and (__GNUC_MINOR__ >= minor))) {
    _ = &major;
    _ = &minor;
    return (__GNUC__ > major) or ((__GNUC__ == major) and (__GNUC_MINOR__ >= minor));
}
pub inline fn __MINGW_MSC_PREREQ(major: anytype, minor: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &major;
    _ = &minor;
    return @as(c_int, 0);
}
pub const __MINGW_ATTRIB_DEPRECATED_STR = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_mac.h:257:11
pub const __MINGW_SEC_WARN_STR = "This function or variable may be unsafe, use _CRT_SECURE_NO_WARNINGS to disable deprecation";
pub const __MINGW_MSVC2005_DEPREC_STR = "This POSIX function is deprecated beginning in Visual C++ 2005, use _CRT_NONSTDC_NO_DEPRECATE to disable deprecation";
pub const __MINGW_ATTRIB_DEPRECATED_MSVC2005 = __MINGW_ATTRIB_DEPRECATED_STR(__MINGW_MSVC2005_DEPREC_STR);
pub const __MINGW_ATTRIB_DEPRECATED_SEC_WARN = __MINGW_ATTRIB_DEPRECATED_STR(__MINGW_SEC_WARN_STR);
pub const __MINGW_MS_PRINTF = @compileError("unable to translate macro: undefined identifier `__format__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_mac.h:281:9
pub const __MINGW_MS_SCANF = @compileError("unable to translate macro: undefined identifier `__format__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_mac.h:284:9
pub const __MINGW_GNU_PRINTF = @compileError("unable to translate macro: undefined identifier `__format__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_mac.h:287:9
pub const __MINGW_GNU_SCANF = @compileError("unable to translate macro: undefined identifier `__format__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_mac.h:290:9
pub const __mingw_ovr = @compileError("unable to translate macro: undefined identifier `__unused__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_mac.h:311:11
pub const __mingw_attribute_artificial = @compileError("unable to translate macro: undefined identifier `__artificial__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_mac.h:318:11
pub const __MINGW_SELECTANY = @compileError("unable to translate macro: undefined identifier `__selectany__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_mac.h:324:9
pub const __MINGW_FORTIFY_LEVEL = @as(c_int, 0);
pub const __mingw_bos_ovr = __mingw_ovr;
pub const __MINGW_FORTIFY_VA_ARG = @as(c_int, 0);
pub const _INC_MINGW_SECAPI = "";
pub const _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES_MEMORY = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY = @as(c_int, 0);
pub const __MINGW_CRT_NAME_CONCAT2 = @compileError("unable to translate macro: undefined identifier `_s`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_secapi.h:41:9
pub const __CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY_0_3_ = @compileError("unable to translate C expr: unexpected token ';'");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_secapi.h:69:9
pub const __LONG32 = c_long;
pub const __MINGW_IMPORT = @compileError("unable to translate macro: undefined identifier `__dllimport__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:44:12
pub const __USE_CRTIMP = @as(c_int, 1);
pub const _CRTIMP = @compileError("unable to translate macro: undefined identifier `__dllimport__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:52:15
pub const __DECLSPEC_SUPPORTED = "";
pub const USE___UUIDOF = @as(c_int, 0);
pub const _inline = @compileError("unable to translate C expr: unexpected token '__inline'");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:74:9
pub const __CRT_INLINE = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:83:11
pub const __MINGW_INTRIN_INLINE = @compileError("unable to translate macro: undefined identifier `__always_inline__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:90:9
pub const __CRT__NO_INLINE = @as(c_int, 1);
pub const __MINGW_CXX11_CONSTEXPR = "";
pub const __MINGW_CXX14_CONSTEXPR = "";
pub const __UNUSED_PARAM = @compileError("unable to translate macro: undefined identifier `__unused__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:118:11
pub const __restrict_arr = @compileError("unable to translate C expr: unexpected token '__restrict'");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:133:10
pub const __MINGW_ATTRIB_NORETURN = @compileError("unable to translate macro: undefined identifier `__noreturn__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:149:9
pub const __MINGW_ATTRIB_CONST = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:150:9
pub const __MINGW_ATTRIB_MALLOC = @compileError("unable to translate macro: undefined identifier `__malloc__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:160:9
pub const __MINGW_ATTRIB_PURE = @compileError("unable to translate macro: undefined identifier `__pure__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:161:9
pub const __MINGW_ATTRIB_NONNULL = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:174:9
pub const __MINGW_ATTRIB_UNUSED = @compileError("unable to translate macro: undefined identifier `__unused__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:180:9
pub const __MINGW_ATTRIB_USED = @compileError("unable to translate macro: undefined identifier `__used__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:186:9
pub const __MINGW_ATTRIB_DEPRECATED = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:187:9
pub const __MINGW_ATTRIB_DEPRECATED_MSG = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:189:9
pub const __MINGW_NOTHROW = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:204:9
pub const __MINGW_ATTRIB_NO_OPTIMIZE = "";
pub const __MINGW_PRAGMA_PARAM = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:222:9
pub const __MINGW_BROKEN_INTERFACE = @compileError("unable to translate macro: undefined identifier `message`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:225:9
pub const _UCRT = "";
pub const _INT128_DEFINED = "";
pub const __int8 = u8;
pub const __int16 = c_short;
pub const __int32 = c_int;
pub const __int64 = c_longlong;
pub const __ptr32 = "";
pub const __ptr64 = "";
pub const __unaligned = "";
pub const __w64 = "";
pub const __forceinline = @compileError("unable to translate macro: undefined identifier `__always_inline__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:284:9
pub const __nothrow = "";
pub const _INC_VADEFS = "";
pub const MINGW_SDK_INIT = "";
pub const MINGW_HAS_SECURE_API = @as(c_int, 1);
pub const __STDC_SECURE_LIB__ = @as(c_long, 200411);
pub const __GOT_SECURE_LIB__ = __STDC_SECURE_LIB__;
pub const MINGW_DDK_H = "";
pub const MINGW_HAS_DDK_H = @as(c_int, 1);
pub const _CRT_PACKING = @as(c_int, 8);
pub const _VA_LIST_DEFINED = "";
pub inline fn _ADDRESSOF(v: anytype) @TypeOf(&v) {
    _ = &v;
    return &v;
}
pub const _crt_va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /usr/lib/zig/libc/include/any-windows-any/vadefs.h:48:9
pub const _crt_va_arg = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// /usr/lib/zig/libc/include/any-windows-any/vadefs.h:49:9
pub const _crt_va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`");
// /usr/lib/zig/libc/include/any-windows-any/vadefs.h:50:9
pub const _crt_va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// /usr/lib/zig/libc/include/any-windows-any/vadefs.h:51:9
pub const __CRT_STRINGIZE = @compileError("unable to translate C expr: unexpected token '#'");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:303:9
pub inline fn _CRT_STRINGIZE(_Value: anytype) @TypeOf(__CRT_STRINGIZE(_Value)) {
    _ = &_Value;
    return __CRT_STRINGIZE(_Value);
}
pub const __CRT_WIDE = @compileError("unable to translate macro: undefined identifier `L`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:308:9
pub inline fn _CRT_WIDE(_String: anytype) @TypeOf(__CRT_WIDE(_String)) {
    _ = &_String;
    return __CRT_WIDE(_String);
}
pub const _W64 = "";
pub const _CRTIMP_NOIA64 = _CRTIMP;
pub const _CRTIMP2 = _CRTIMP;
pub const _CRTIMP_ALTERNATIVE = _CRTIMP;
pub const _CRT_ALTERNATIVE_IMPORTED = "";
pub const _MRTIMP2 = _CRTIMP;
pub const _DLL = "";
pub const _MT = "";
pub const _MCRTIMP = _CRTIMP;
pub const _CRTIMP_PURE = _CRTIMP;
pub const _PGLOBAL = "";
pub const _AGLOBAL = "";
pub const _SECURECRT_FILL_BUFFER_PATTERN = @as(c_int, 0xFD);
pub const _CRT_DEPRECATE_TEXT = @compileError("unable to translate macro: undefined identifier `deprecated`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:367:9
pub const _CRT_INSECURE_DEPRECATE_MEMORY = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:370:9
pub const _CRT_INSECURE_DEPRECATE_GLOBALS = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:374:9
pub const _CRT_MANAGED_HEAP_DEPRECATE = "";
pub const _CRT_OBSOLETE = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:382:9
pub const _CONST_RETURN = "";
pub const UNALIGNED = "";
pub const _CRT_ALIGN = @compileError("unable to translate macro: undefined identifier `__aligned__`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:409:9
pub const __CRTDECL = __cdecl;
pub const _ARGMAX = @as(c_int, 100);
pub const _TRUNCATE = @import("std").zig.c_translation.cast(usize, -@as(c_int, 1));
pub inline fn _CRT_UNUSED(x: anytype) anyopaque {
    _ = &x;
    return @import("std").zig.c_translation.cast(anyopaque, x);
}
pub const __USE_MINGW_ANSI_STDIO = @as(c_int, 0);
pub const _CRT_glob = @compileError("unable to translate macro: undefined identifier `_dowildcard`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:473:9
pub const __ANONYMOUS_DEFINED = "";
pub const _ANONYMOUS_UNION = __MINGW_EXTENSION;
pub const _ANONYMOUS_STRUCT = __MINGW_EXTENSION;
pub const _UNION_NAME = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:493:9
pub const _STRUCT_NAME = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:494:9
pub const DUMMYUNIONNAME = "";
pub const DUMMYUNIONNAME1 = "";
pub const DUMMYUNIONNAME2 = "";
pub const DUMMYUNIONNAME3 = "";
pub const DUMMYUNIONNAME4 = "";
pub const DUMMYUNIONNAME5 = "";
pub const DUMMYUNIONNAME6 = "";
pub const DUMMYUNIONNAME7 = "";
pub const DUMMYUNIONNAME8 = "";
pub const DUMMYUNIONNAME9 = "";
pub const DUMMYSTRUCTNAME = "";
pub const DUMMYSTRUCTNAME1 = "";
pub const DUMMYSTRUCTNAME2 = "";
pub const DUMMYSTRUCTNAME3 = "";
pub const DUMMYSTRUCTNAME4 = "";
pub const DUMMYSTRUCTNAME5 = "";
pub const __CRT_UUID_DECL = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:581:9
pub const __MINGW_DEBUGBREAK_IMPL = !(__has_builtin(__debugbreak) != 0);
pub const __MINGW_FASTFAIL_IMPL = !(__has_builtin(__fastfail) != 0);
pub const __MINGW_PREFETCH_IMPL = @compileError("unable to translate macro: undefined identifier `__prefetch`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw.h:638:9
pub const _CRTNOALIAS = "";
pub const _CRTRESTRICT = "";
pub const _SIZE_T_DEFINED = "";
pub const _SSIZE_T_DEFINED = "";
pub const _RSIZE_T_DEFINED = "";
pub const _INTPTR_T_DEFINED = "";
pub const __intptr_t_defined = "";
pub const _UINTPTR_T_DEFINED = "";
pub const __uintptr_t_defined = "";
pub const _PTRDIFF_T_DEFINED = "";
pub const _PTRDIFF_T_ = "";
pub const _WCHAR_T_DEFINED = "";
pub const _WCTYPE_T_DEFINED = "";
pub const _WINT_T = "";
pub const _ERRCODE_DEFINED = "";
pub const _TIME32_T_DEFINED = "";
pub const _TIME64_T_DEFINED = "";
pub const _TIME_T_DEFINED = "";
pub const _CRT_SECURE_CPP_NOTHROW = @compileError("unable to translate macro: undefined identifier `throw`");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:143:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_0 = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:262:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_1 = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:263:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_2 = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:264:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_3 = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:265:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_4 = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:266:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_1 = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:267:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_2 = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:268:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_3 = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:269:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_2_0 = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:270:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_1_ARGLIST = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:271:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_2_ARGLIST = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:272:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_SPLITPATH = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:273:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0 = @compileError("unable to translate macro: undefined identifier `__func_name`");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:277:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_1 = @compileError("unable to translate macro: undefined identifier `__func_name`");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:279:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2 = @compileError("unable to translate macro: undefined identifier `__func_name`");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:281:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3 = @compileError("unable to translate macro: undefined identifier `__func_name`");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:283:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4 = @compileError("unable to translate macro: undefined identifier `__func_name`");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:285:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0_EX = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:422:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_1_EX = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:423:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2_EX = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:424:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3_EX = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:425:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4_EX = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:426:9
pub const _TAGLC_ID_DEFINED = "";
pub const _THREADLOCALEINFO = "";
pub const __crt_typefix = @compileError("unable to translate C expr: unexpected token ''");
// /usr/lib/zig/libc/include/any-windows-any/corecrt.h:486:9
pub const _CRT_USE_WINAPI_FAMILY_DESKTOP_APP = "";
pub const __need_wint_t = "";
pub const __need_wchar_t = "";
pub const _WCHAR_T = "";
pub const INT8_MIN = -@as(c_int, 128);
pub const INT16_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 32768, .decimal);
pub const INT32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT64_MIN = -@as(c_longlong, 9223372036854775807) - @as(c_int, 1);
pub const INT8_MAX = @as(c_int, 127);
pub const INT16_MAX = @as(c_int, 32767);
pub const INT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT64_MAX = @as(c_longlong, 9223372036854775807);
pub const UINT8_MAX = @as(c_int, 255);
pub const UINT16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xffffffff, .hex);
pub const UINT64_MAX = @as(c_ulonglong, 0xffffffffffffffff);
pub const INT_LEAST8_MIN = INT8_MIN;
pub const INT_LEAST16_MIN = INT16_MIN;
pub const INT_LEAST32_MIN = INT32_MIN;
pub const INT_LEAST64_MIN = INT64_MIN;
pub const INT_LEAST8_MAX = INT8_MAX;
pub const INT_LEAST16_MAX = INT16_MAX;
pub const INT_LEAST32_MAX = INT32_MAX;
pub const INT_LEAST64_MAX = INT64_MAX;
pub const UINT_LEAST8_MAX = UINT8_MAX;
pub const UINT_LEAST16_MAX = UINT16_MAX;
pub const UINT_LEAST32_MAX = UINT32_MAX;
pub const UINT_LEAST64_MAX = UINT64_MAX;
pub const INT_FAST8_MIN = INT8_MIN;
pub const INT_FAST16_MIN = INT16_MIN;
pub const INT_FAST32_MIN = INT32_MIN;
pub const INT_FAST64_MIN = INT64_MIN;
pub const INT_FAST8_MAX = INT8_MAX;
pub const INT_FAST16_MAX = INT16_MAX;
pub const INT_FAST32_MAX = INT32_MAX;
pub const INT_FAST64_MAX = INT64_MAX;
pub const UINT_FAST8_MAX = UINT8_MAX;
pub const UINT_FAST16_MAX = UINT16_MAX;
pub const UINT_FAST32_MAX = UINT32_MAX;
pub const UINT_FAST64_MAX = UINT64_MAX;
pub const INTPTR_MIN = INT64_MIN;
pub const INTPTR_MAX = INT64_MAX;
pub const UINTPTR_MAX = UINT64_MAX;
pub const INTMAX_MIN = INT64_MIN;
pub const INTMAX_MAX = INT64_MAX;
pub const UINTMAX_MAX = UINT64_MAX;
pub const PTRDIFF_MIN = INT64_MIN;
pub const PTRDIFF_MAX = INT64_MAX;
pub const SIG_ATOMIC_MIN = INT32_MIN;
pub const SIG_ATOMIC_MAX = INT32_MAX;
pub const SIZE_MAX = UINT64_MAX;
pub const WCHAR_MIN = @as(c_uint, 0);
pub const WCHAR_MAX = @as(c_uint, 0xffff);
pub const WINT_MIN = @as(c_uint, 0);
pub const WINT_MAX = @as(c_uint, 0xffff);
pub inline fn INT8_C(val: anytype) @TypeOf((INT_LEAST8_MAX - INT_LEAST8_MAX) + val) {
    _ = &val;
    return (INT_LEAST8_MAX - INT_LEAST8_MAX) + val;
}
pub inline fn INT16_C(val: anytype) @TypeOf((INT_LEAST16_MAX - INT_LEAST16_MAX) + val) {
    _ = &val;
    return (INT_LEAST16_MAX - INT_LEAST16_MAX) + val;
}
pub inline fn INT32_C(val: anytype) @TypeOf((INT_LEAST32_MAX - INT_LEAST32_MAX) + val) {
    _ = &val;
    return (INT_LEAST32_MAX - INT_LEAST32_MAX) + val;
}
pub const INT64_C = @import("std").zig.c_translation.Macros.LL_SUFFIX;
pub inline fn UINT8_C(val: anytype) @TypeOf(val) {
    _ = &val;
    return val;
}
pub inline fn UINT16_C(val: anytype) @TypeOf(val) {
    _ = &val;
    return val;
}
pub const UINT32_C = @import("std").zig.c_translation.Macros.U_SUFFIX;
pub const UINT64_C = @import("std").zig.c_translation.Macros.ULL_SUFFIX;
pub const INTMAX_C = @import("std").zig.c_translation.Macros.LL_SUFFIX;
pub const UINTMAX_C = @import("std").zig.c_translation.Macros.ULL_SUFFIX;
pub const _INC_STRING = "";
pub const _SECIMP = @compileError("unable to translate macro: undefined identifier `dllimport`");
// /usr/lib/zig/libc/include/any-windows-any/string.h:16:9
pub const _NLSCMP_DEFINED = "";
pub const _NLSCMPERROR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const NULL = @import("std").zig.c_translation.cast(?*anyopaque, @as(c_int, 0));
pub const _WConst_return = "";
pub const _CRT_MEMORY_DEFINED = "";
pub const _WSTRING_DEFINED = "";
pub const wcswcs = wcsstr;
pub const _INC_STRING_S = "";
pub const _WSTRING_S_DEFINED = "";
pub const _INC_WCHAR = "";
pub const _STDIO_CONFIG_DEFINED = "";
pub const _CRT_INTERNAL_PRINTF_LEGACY_VSPRINTF_NULL_TERMINATION = @as(c_ulonglong, 0x0001);
pub const _CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR = @as(c_ulonglong, 0x0002);
pub const _CRT_INTERNAL_PRINTF_LEGACY_WIDE_SPECIFIERS = @as(c_ulonglong, 0x0004);
pub const _CRT_INTERNAL_PRINTF_LEGACY_MSVCRT_COMPATIBILITY = @as(c_ulonglong, 0x0008);
pub const _CRT_INTERNAL_PRINTF_LEGACY_THREE_DIGIT_EXPONENTS = @as(c_ulonglong, 0x0010);
pub const _CRT_INTERNAL_PRINTF_STANDARD_ROUNDING = @as(c_ulonglong, 0x0020);
pub const _CRT_INTERNAL_SCANF_SECURECRT = @as(c_ulonglong, 0x0001);
pub const _CRT_INTERNAL_SCANF_LEGACY_WIDE_SPECIFIERS = @as(c_ulonglong, 0x0002);
pub const _CRT_INTERNAL_SCANF_LEGACY_MSVCRT_COMPATIBILITY = @as(c_ulonglong, 0x0004);
pub const _CRT_INTERNAL_LOCAL_PRINTF_OPTIONS = _CRT_INTERNAL_PRINTF_LEGACY_WIDE_SPECIFIERS | _CRT_INTERNAL_PRINTF_STANDARD_ROUNDING;
pub const _CRT_INTERNAL_LOCAL_SCANF_OPTIONS = _CRT_INTERNAL_SCANF_LEGACY_WIDE_SPECIFIERS;
pub const _INC_CORECRT_WSTDLIB = "";
pub const WEOF = @import("std").zig.c_translation.cast(wint_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFF, .hex));
pub const _FILE_DEFINED = "";
pub const _iob = __iob_func();
pub const stdin = __acrt_iob_func(@as(c_int, 0));
pub const stdout = __acrt_iob_func(@as(c_int, 1));
pub const stderr = __acrt_iob_func(@as(c_int, 2));
pub const _STDSTREAM_DEFINED = "";
pub const _FSIZE_T_DEFINED = "";
pub const _wfinddata_t = _wfinddata64i32_t;
pub const _wfinddatai64_t = _wfinddata64_t;
pub const _wfindfirst = _wfindfirst64i32;
pub const _wfindnext = _wfindnext64i32;
pub const _wfindfirsti64 = _wfindfirst64;
pub const _wfindnexti64 = _wfindnext64;
pub const _WFINDDATA_T_DEFINED = "";
pub const _CRT_CTYPEDATA_DEFINED = "";
pub const __PCTYPE_FUNC = __pctype_func();
pub const _pctype = __pctype_func();
pub const _CRT_WCTYPEDATA_DEFINED = "";
pub const _wctype = __MINGW_IMP_SYMBOL(_wctype).*;
pub const _pwctype = __pwctype_func();
pub const _UPPER = @as(c_int, 0x1);
pub const _LOWER = @as(c_int, 0x2);
pub const _DIGIT = @as(c_int, 0x4);
pub const _SPACE = @as(c_int, 0x8);
pub const _PUNCT = @as(c_int, 0x10);
pub const _CONTROL = @as(c_int, 0x20);
pub const _BLANK = @as(c_int, 0x40);
pub const _HEX = @as(c_int, 0x80);
pub const _LEADBYTE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const _ALPHA = (@as(c_int, 0x0100) | _UPPER) | _LOWER;
pub const _WCTYPE_DEFINED = "";
pub const _WDIRECT_DEFINED = "";
pub const _WIO_DEFINED = "";
pub const _WLOCALE_DEFINED = "";
pub const _WEXEC_DEFINED = "";
pub const _WSPAWN_DEFINED = "";
pub const _CRT_WSYSTEM_DEFINED = "";
pub const _WCTYPE_INLINE_DEFINED = "";
pub const _INO_T_DEFINED = "";
pub const _DEV_T_DEFINED = "";
pub const _OFF_T_DEFINED = "";
pub const _OFF_T_ = "";
pub const _OFF64_T_DEFINED = "";
pub const _FILE_OFFSET_BITS_SET_OFFT = "";
pub const _fstat = @compileError("unable to translate macro: undefined identifier `_fstat64i32`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_stat64.h:11:9
pub const _fstati64 = @compileError("unable to translate macro: undefined identifier `_fstat64`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_stat64.h:12:9
pub const _stat = _stat64i32;
pub const _stati64 = _stat64;
pub const _wstat = _wstat64i32;
pub const _wstati64 = _wstat64;
pub const __stat64 = _stat64;
pub const stat64 = _stat64;
pub const fstat64 = @compileError("unable to translate macro: undefined identifier `_fstat64`");
// /usr/lib/zig/libc/include/any-windows-any/_mingw_stat64.h:93:9
pub const _STAT_DEFINED = "";
pub const _WSTAT_DEFINED = "";
pub const _WCONIO_DEFINED = "";
pub const _WSTDIO_DEFINED = "";
pub const _INC_SWPRINTF_INL = "";
pub const _CRT_WPERROR_DEFINED = "";
pub const wpopen = _wpopen;
pub inline fn _putwc_nolock(_c: anytype, _stm: anytype) @TypeOf(_fputwc_nolock(_c, _stm)) {
    _ = &_c;
    _ = &_stm;
    return _fputwc_nolock(_c, _stm);
}
pub inline fn _getwc_nolock(_c: anytype) @TypeOf(_fgetwc_nolock(_c)) {
    _ = &_c;
    return _fgetwc_nolock(_c);
}
pub const _WSTDLIB_DEFINED = "";
pub const _WSTDLIBP_DEFINED = "";
pub const _TM_DEFINED = "";
pub const _WTIME_DEFINED = "";
pub const _INC_WTIME_INL = "";
pub const _INC_WTIME_S_INL = "";
pub const __MINGW_MBWC_CONVERT_DEFINED = "";
pub const _INC_WCHAR_S = "";
pub const _WIO_S_DEFINED = "";
pub const _WCONIO_S_DEFINED = "";
pub const _WSTDIO_S_DEFINED = "";
pub const _WTIME_S_DEFINED = "";
pub const __CLANG_INTTYPES_H = "";
pub const _INTTYPES_H_ = "";
pub const PRId64 = "lld";
pub const PRIi64 = "lli";
pub const PRIo64 = "llo";
pub const PRIu64 = "llu";
pub const PRIx64 = "llx";
pub const PRIX64 = "llX";
pub const PRId8 = "d";
pub const PRId16 = "d";
pub const PRId32 = "d";
pub const PRIdLEAST8 = "d";
pub const PRIdLEAST16 = "d";
pub const PRIdLEAST32 = "d";
pub const PRIdLEAST64 = PRId64;
pub const PRIdFAST8 = "d";
pub const PRIdFAST16 = "d";
pub const PRIdFAST32 = "d";
pub const PRIdFAST64 = PRId64;
pub const PRIdMAX = PRId64;
pub const PRIi8 = "i";
pub const PRIi16 = "i";
pub const PRIi32 = "i";
pub const PRIiLEAST8 = "i";
pub const PRIiLEAST16 = "i";
pub const PRIiLEAST32 = "i";
pub const PRIiLEAST64 = PRIi64;
pub const PRIiFAST8 = "i";
pub const PRIiFAST16 = "i";
pub const PRIiFAST32 = "i";
pub const PRIiFAST64 = PRIi64;
pub const PRIiMAX = PRIi64;
pub const PRIo8 = "o";
pub const PRIo16 = "o";
pub const PRIo32 = "o";
pub const PRIoLEAST8 = "o";
pub const PRIoLEAST16 = "o";
pub const PRIoLEAST32 = "o";
pub const PRIoLEAST64 = PRIo64;
pub const PRIoFAST8 = "o";
pub const PRIoFAST16 = "o";
pub const PRIoFAST32 = "o";
pub const PRIoFAST64 = PRIo64;
pub const PRIoMAX = PRIo64;
pub const PRIu8 = "u";
pub const PRIu16 = "u";
pub const PRIu32 = "u";
pub const PRIuLEAST8 = "u";
pub const PRIuLEAST16 = "u";
pub const PRIuLEAST32 = "u";
pub const PRIuLEAST64 = PRIu64;
pub const PRIuFAST8 = "u";
pub const PRIuFAST16 = "u";
pub const PRIuFAST32 = "u";
pub const PRIuFAST64 = PRIu64;
pub const PRIuMAX = PRIu64;
pub const PRIx8 = "x";
pub const PRIx16 = "x";
pub const PRIx32 = "x";
pub const PRIxLEAST8 = "x";
pub const PRIxLEAST16 = "x";
pub const PRIxLEAST32 = "x";
pub const PRIxLEAST64 = PRIx64;
pub const PRIxFAST8 = "x";
pub const PRIxFAST16 = "x";
pub const PRIxFAST32 = "x";
pub const PRIxFAST64 = PRIx64;
pub const PRIxMAX = PRIx64;
pub const PRIX8 = "X";
pub const PRIX16 = "X";
pub const PRIX32 = "X";
pub const PRIXLEAST8 = "X";
pub const PRIXLEAST16 = "X";
pub const PRIXLEAST32 = "X";
pub const PRIXLEAST64 = PRIX64;
pub const PRIXFAST8 = "X";
pub const PRIXFAST16 = "X";
pub const PRIXFAST32 = "X";
pub const PRIXFAST64 = PRIX64;
pub const PRIXMAX = PRIX64;
pub const SCNd16 = "hd";
pub const SCNd32 = "d";
pub const SCNd64 = PRId64;
pub const SCNdLEAST16 = "hd";
pub const SCNdLEAST32 = "d";
pub const SCNdLEAST64 = PRId64;
pub const SCNdFAST16 = "hd";
pub const SCNdFAST32 = "d";
pub const SCNdFAST64 = PRId64;
pub const SCNdMAX = PRId64;
pub const SCNi16 = "hi";
pub const SCNi32 = "i";
pub const SCNi64 = PRIi64;
pub const SCNiLEAST16 = "hi";
pub const SCNiLEAST32 = "i";
pub const SCNiLEAST64 = PRIi64;
pub const SCNiFAST16 = "hi";
pub const SCNiFAST32 = "i";
pub const SCNiFAST64 = PRIi64;
pub const SCNiMAX = PRIi64;
pub const SCNo16 = "ho";
pub const SCNo32 = "o";
pub const SCNo64 = PRIo64;
pub const SCNoLEAST16 = "ho";
pub const SCNoLEAST32 = "o";
pub const SCNoLEAST64 = PRIo64;
pub const SCNoFAST16 = "ho";
pub const SCNoFAST32 = "o";
pub const SCNoFAST64 = PRIo64;
pub const SCNoMAX = PRIo64;
pub const SCNx16 = "hx";
pub const SCNx32 = "x";
pub const SCNx64 = PRIx64;
pub const SCNxLEAST16 = "hx";
pub const SCNxLEAST32 = "x";
pub const SCNxLEAST64 = PRIx64;
pub const SCNxFAST16 = "hx";
pub const SCNxFAST32 = "x";
pub const SCNxFAST64 = PRIx64;
pub const SCNxMAX = PRIx64;
pub const SCNu16 = "hu";
pub const SCNu32 = "u";
pub const SCNu64 = PRIu64;
pub const SCNuLEAST16 = "hu";
pub const SCNuLEAST32 = "u";
pub const SCNuLEAST64 = PRIu64;
pub const SCNuFAST16 = "hu";
pub const SCNuFAST32 = "u";
pub const SCNuFAST64 = PRIu64;
pub const SCNuMAX = PRIu64;
pub const PRIdPTR = PRId64;
pub const PRIiPTR = PRIi64;
pub const PRIoPTR = PRIo64;
pub const PRIuPTR = PRIu64;
pub const PRIxPTR = PRIx64;
pub const PRIXPTR = PRIX64;
pub const SCNdPTR = PRId64;
pub const SCNiPTR = PRIi64;
pub const SCNoPTR = PRIo64;
pub const SCNxPTR = PRIx64;
pub const SCNuPTR = PRIu64;
pub const SCNd8 = "hhd";
pub const SCNdLEAST8 = "hhd";
pub const SCNdFAST8 = "hhd";
pub const SCNi8 = "hhi";
pub const SCNiLEAST8 = "hhi";
pub const SCNiFAST8 = "hhi";
pub const SCNo8 = "hho";
pub const SCNoLEAST8 = "hho";
pub const SCNoFAST8 = "hho";
pub const SCNx8 = "hhx";
pub const SCNxLEAST8 = "hhx";
pub const SCNxFAST8 = "hhx";
pub const SCNu8 = "hhu";
pub const SCNuLEAST8 = "hhu";
pub const SCNuFAST8 = "hhu";
pub const SDL_INCLUDE_STDBOOL_H = "";
pub const __STDBOOL_H = "";
pub const __bool_true_false_are_defined = @as(c_int, 1);
pub const @"bool" = bool;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const alloca = @compileError("unable to translate macro: undefined identifier `__builtin_alloca`");
// include/SDL3/SDL_stdinc.h:90:12
pub const SDL_SIZE_MAX = SIZE_MAX;
pub const SDL_COMPILE_TIME_ASSERT = @compileError("unable to translate C expr: unexpected token '_Static_assert'");
// include/SDL3/SDL_stdinc.h:203:9
pub const SDL_arraysize = @compileError("unable to translate C expr: expected ')' instead got '['");
// include/SDL3/SDL_stdinc.h:225:9
pub const SDL_STRINGIFY_ARG = @compileError("unable to translate C expr: unexpected token '#'");
// include/SDL3/SDL_stdinc.h:240:9
pub const SDL_reinterpret_cast = @import("std").zig.c_translation.Macros.CAST_OR_CALL;
pub const SDL_static_cast = @import("std").zig.c_translation.Macros.CAST_OR_CALL;
pub const SDL_const_cast = @import("std").zig.c_translation.Macros.CAST_OR_CALL;
pub inline fn SDL_FOURCC(A: anytype, B: anytype, C: anytype, D: anytype) @TypeOf((((SDL_static_cast(Uint32, SDL_static_cast(Uint8, A)) << @as(c_int, 0)) | (SDL_static_cast(Uint32, SDL_static_cast(Uint8, B)) << @as(c_int, 8))) | (SDL_static_cast(Uint32, SDL_static_cast(Uint8, C)) << @as(c_int, 16))) | (SDL_static_cast(Uint32, SDL_static_cast(Uint8, D)) << @as(c_int, 24))) {
    _ = &A;
    _ = &B;
    _ = &C;
    _ = &D;
    return (((SDL_static_cast(Uint32, SDL_static_cast(Uint8, A)) << @as(c_int, 0)) | (SDL_static_cast(Uint32, SDL_static_cast(Uint8, B)) << @as(c_int, 8))) | (SDL_static_cast(Uint32, SDL_static_cast(Uint8, C)) << @as(c_int, 16))) | (SDL_static_cast(Uint32, SDL_static_cast(Uint8, D)) << @as(c_int, 24));
}
pub inline fn SDL_SINT64_C(c: anytype) @TypeOf(INT64_C(c)) {
    _ = &c;
    return INT64_C(c);
}
pub inline fn SDL_UINT64_C(c: anytype) @TypeOf(UINT64_C(c)) {
    _ = &c;
    return UINT64_C(c);
}
pub const SDL_MAX_SINT8 = @import("std").zig.c_translation.cast(Sint8, @as(c_int, 0x7F));
pub const SDL_MIN_SINT8 = @import("std").zig.c_translation.cast(Sint8, ~@as(c_int, 0x7F));
pub const SDL_MAX_UINT8 = @import("std").zig.c_translation.cast(Uint8, @as(c_int, 0xFF));
pub const SDL_MIN_UINT8 = @import("std").zig.c_translation.cast(Uint8, @as(c_int, 0x00));
pub const SDL_MAX_SINT16 = @import("std").zig.c_translation.cast(Sint16, @as(c_int, 0x7FFF));
pub const SDL_MIN_SINT16 = @import("std").zig.c_translation.cast(Sint16, ~@as(c_int, 0x7FFF));
pub const SDL_MAX_UINT16 = @import("std").zig.c_translation.cast(Uint16, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFF, .hex));
pub const SDL_MIN_UINT16 = @import("std").zig.c_translation.cast(Uint16, @as(c_int, 0x0000));
pub const SDL_MAX_SINT32 = @import("std").zig.c_translation.cast(Sint32, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7FFFFFFF, .hex));
pub const SDL_MIN_SINT32 = @import("std").zig.c_translation.cast(Sint32, ~@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7FFFFFFF, .hex));
pub const SDL_MAX_UINT32 = @import("std").zig.c_translation.cast(Uint32, @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xFFFFFFFF, .hex));
pub const SDL_MIN_UINT32 = @import("std").zig.c_translation.cast(Uint32, @as(c_int, 0x00000000));
pub const SDL_MAX_SINT64 = SDL_SINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7FFFFFFFFFFFFFFF, .hex));
pub const SDL_MIN_SINT64 = ~SDL_SINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7FFFFFFFFFFFFFFF, .hex));
pub const SDL_MAX_UINT64 = SDL_UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFFFFFFFFFFFFFF, .hex));
pub const SDL_MIN_UINT64 = SDL_UINT64_C(@as(c_int, 0x0000000000000000));
pub const SDL_MAX_TIME = SDL_MAX_SINT64;
pub const SDL_MIN_TIME = SDL_MIN_SINT64;
pub const SDL_FLT_EPSILON = @as(f32, 1.1920928955078125e-07);
pub const SDL_PRIs64 = "I64d";
pub const SDL_PRIu64 = "I64u";
pub const SDL_PRIx64 = "I64x";
pub const SDL_PRIX64 = "I64X";
pub const SDL_PRIs32 = PRId32;
pub const SDL_PRIu32 = PRIu32;
pub const SDL_PRIx32 = PRIx32;
pub const SDL_PRIX32 = PRIX32;
pub const SDL_PRILL_PREFIX = "I64";
pub const SDL_PRILLd = SDL_PRILL_PREFIX ++ "d";
pub const SDL_PRILLu = SDL_PRILL_PREFIX ++ "u";
pub const SDL_PRILLx = SDL_PRILL_PREFIX ++ "x";
pub const SDL_PRILLX = SDL_PRILL_PREFIX ++ "X";
pub const SDL_IN_BYTECAP = @compileError("unable to translate C expr: unexpected token ''");
// include/SDL3/SDL_stdinc.h:1120:9
pub const SDL_INOUT_Z_CAP = @compileError("unable to translate C expr: unexpected token ''");
// include/SDL3/SDL_stdinc.h:1121:9
pub const SDL_OUT_Z_CAP = @compileError("unable to translate C expr: unexpected token ''");
// include/SDL3/SDL_stdinc.h:1122:9
pub const SDL_OUT_CAP = @compileError("unable to translate C expr: unexpected token ''");
// include/SDL3/SDL_stdinc.h:1123:9
pub const SDL_OUT_BYTECAP = @compileError("unable to translate C expr: unexpected token ''");
// include/SDL3/SDL_stdinc.h:1124:9
pub const SDL_OUT_Z_BYTECAP = @compileError("unable to translate C expr: unexpected token ''");
// include/SDL3/SDL_stdinc.h:1125:9
pub const SDL_PRINTF_FORMAT_STRING = "";
pub const SDL_SCANF_FORMAT_STRING = "";
pub const SDL_PRINTF_VARARG_FUNC = @compileError("unable to translate macro: undefined identifier `format`");
// include/SDL3/SDL_stdinc.h:1130:9
pub const SDL_PRINTF_VARARG_FUNCV = @compileError("unable to translate macro: undefined identifier `format`");
// include/SDL3/SDL_stdinc.h:1131:9
pub const SDL_SCANF_VARARG_FUNC = @compileError("unable to translate macro: undefined identifier `format`");
// include/SDL3/SDL_stdinc.h:1132:9
pub const SDL_SCANF_VARARG_FUNCV = @compileError("unable to translate macro: undefined identifier `format`");
// include/SDL3/SDL_stdinc.h:1133:9
pub const SDL_WPRINTF_VARARG_FUNC = @compileError("unable to translate C expr: unexpected token ''");
// include/SDL3/SDL_stdinc.h:1134:9
pub const SDL_WPRINTF_VARARG_FUNCV = @compileError("unable to translate C expr: unexpected token ''");
// include/SDL3/SDL_stdinc.h:1135:9
pub const SDL_begin_code_h = "";
pub inline fn SDL_HAS_BUILTIN(x: anytype) @TypeOf(__has_builtin(x)) {
    _ = &x;
    return __has_builtin(x);
}
pub const SDL_DEPRECATED = @compileError("unable to translate macro: undefined identifier `deprecated`");
// include/SDL3/SDL_begin_code.h:297:13
pub const SDL_UNUSED = @compileError("unable to translate macro: undefined identifier `unused`");
// include/SDL3/SDL_begin_code.h:307:13
pub const SDL_DECLSPEC = "";
pub const SDLCALL = "";
pub const SDL_INLINE = @compileError("unable to translate C expr: unexpected token '__inline__'");
// include/SDL3/SDL_begin_code.h:364:9
pub const SDL_FORCE_INLINE = @compileError("unable to translate macro: undefined identifier `always_inline`");
// include/SDL3/SDL_begin_code.h:385:9
pub const SDL_NORETURN = @compileError("unable to translate macro: undefined identifier `noreturn`");
// include/SDL3/SDL_begin_code.h:393:9
pub const SDL_ANALYZER_NORETURN = @compileError("unable to translate macro: undefined identifier `analyzer_noreturn`");
// include/SDL3/SDL_begin_code.h:403:9
pub const SDL_HAS_FALLTHROUGH = @compileError("unable to translate macro: undefined identifier `__has_attribute`");
// include/SDL3/SDL_begin_code.h:428:9
pub const SDL_FALLTHROUGH = @compileError("unable to translate macro: undefined identifier `__fallthrough__`");
// include/SDL3/SDL_begin_code.h:435:9
pub const SDL_NODISCARD = @compileError("unable to translate macro: undefined identifier `warn_unused_result`");
// include/SDL3/SDL_begin_code.h:448:9
pub const SDL_MALLOC = @compileError("unable to translate macro: undefined identifier `malloc`");
// include/SDL3/SDL_begin_code.h:458:9
pub const SDL_ALLOC_SIZE = @compileError("unable to translate macro: undefined identifier `alloc_size`");
// include/SDL3/SDL_begin_code.h:470:9
pub const SDL_ALLOC_SIZE2 = @compileError("unable to translate macro: undefined identifier `alloc_size`");
// include/SDL3/SDL_begin_code.h:480:9
pub const SDL_INIT_INTERFACE = @compileError("unable to translate C expr: unexpected token 'do'");
// include/SDL3/SDL_stdinc.h:1235:9
pub const SDL_stack_alloc = @compileError("unable to translate C expr: unexpected token ')'");
// include/SDL3/SDL_stdinc.h:1287:9
pub const SDL_stack_free = @compileError("unable to translate C expr: unexpected token ''");
// include/SDL3/SDL_stdinc.h:1288:9
pub inline fn SDL_min(x: anytype, y: anytype) @TypeOf(if (x < y) x else y) {
    _ = &x;
    _ = &y;
    return if (x < y) x else y;
}
pub inline fn SDL_max(x: anytype, y: anytype) @TypeOf(if (x > y) x else y) {
    _ = &x;
    _ = &y;
    return if (x > y) x else y;
}
pub inline fn SDL_clamp(x: anytype, a: anytype, b: anytype) @TypeOf(if (x < a) a else if (x > b) b else x) {
    _ = &x;
    _ = &a;
    _ = &b;
    return if (x < a) a else if (x > b) b else x;
}
pub const SDL_copyp = @compileError("unable to translate C expr: unexpected token '{'");
// include/SDL3/SDL_stdinc.h:2511:9
pub const SDL_zero = @compileError("unable to translate C expr: unexpected token '('");
// include/SDL3/SDL_stdinc.h:2607:9
pub const SDL_zerop = @compileError("unable to translate C expr: unexpected token '*'");
// include/SDL3/SDL_stdinc.h:2626:9
pub const SDL_zeroa = @compileError("unable to translate C expr: unexpected token '('");
// include/SDL3/SDL_stdinc.h:2645:9
pub const SDL_INVALID_UNICODE_CODEPOINT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFD, .hex);
pub const SDL_PI_D = @as(f64, 3.141592653589793238462643383279502884);
pub const SDL_PI_F = @as(f32, 3.141592653589793238462643383279502884);
pub const SDL_ICONV_ERROR = @import("std").zig.c_translation.cast(usize, -@as(c_int, 1));
pub const SDL_ICONV_E2BIG = @import("std").zig.c_translation.cast(usize, -@as(c_int, 2));
pub const SDL_ICONV_EILSEQ = @import("std").zig.c_translation.cast(usize, -@as(c_int, 3));
pub const SDL_ICONV_EINVAL = @import("std").zig.c_translation.cast(usize, -@as(c_int, 4));
pub inline fn SDL_iconv_utf8_locale(S: anytype) @TypeOf(SDL_iconv_string("", "UTF-8", S, SDL_strlen(S) + @as(c_int, 1))) {
    _ = &S;
    return SDL_iconv_string("", "UTF-8", S, SDL_strlen(S) + @as(c_int, 1));
}
pub inline fn SDL_iconv_utf8_ucs2(S: anytype) [*c]Uint16 {
    _ = &S;
    return @import("std").zig.c_translation.cast([*c]Uint16, SDL_iconv_string("UCS-2", "UTF-8", S, SDL_strlen(S) + @as(c_int, 1)));
}
pub inline fn SDL_iconv_utf8_ucs4(S: anytype) [*c]Uint32 {
    _ = &S;
    return @import("std").zig.c_translation.cast([*c]Uint32, SDL_iconv_string("UCS-4", "UTF-8", S, SDL_strlen(S) + @as(c_int, 1)));
}
pub inline fn SDL_iconv_wchar_utf8(S: anytype) @TypeOf(SDL_iconv_string("UTF-8", "WCHAR_T", @import("std").zig.c_translation.cast([*c]u8, S), (SDL_wcslen(S) + @as(c_int, 1)) * @import("std").zig.c_translation.sizeof(wchar_t))) {
    _ = &S;
    return SDL_iconv_string("UTF-8", "WCHAR_T", @import("std").zig.c_translation.cast([*c]u8, S), (SDL_wcslen(S) + @as(c_int, 1)) * @import("std").zig.c_translation.sizeof(wchar_t));
}
pub const SDL_assert_h_ = "";
pub const SDL_ASSERT_LEVEL = @as(c_int, 2);
pub const SDL_TriggerBreakpoint = @compileError("unable to translate macro: undefined identifier `__builtin_debugtrap`");
// include/SDL3/SDL_assert.h:139:13
pub const SDL_FUNCTION = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// include/SDL3/SDL_assert.h:175:12
pub const SDL_FILE = @compileError("unable to translate macro: undefined identifier `__FILE__`");
// include/SDL3/SDL_assert.h:187:9
pub const SDL_LINE = @compileError("unable to translate macro: undefined identifier `__LINE__`");
// include/SDL3/SDL_assert.h:194:9
pub const SDL_NULL_WHILE_LOOP_CONDITION = @as(c_int, 0);
pub const SDL_disabled_assert = @compileError("unable to translate C expr: unexpected token 'do'");
// include/SDL3/SDL_assert.h:255:9
pub inline fn SDL_AssertBreakpoint() @TypeOf(SDL_TriggerBreakpoint()) {
    return SDL_TriggerBreakpoint();
}
pub const SDL_enabled_assert = @compileError("unable to translate macro: undefined identifier `sdl_assert_data`");
// include/SDL3/SDL_assert.h:362:9
pub inline fn SDL_assert(condition: anytype) @TypeOf(SDL_enabled_assert(condition)) {
    _ = &condition;
    return SDL_enabled_assert(condition);
}
pub inline fn SDL_assert_release(condition: anytype) @TypeOf(SDL_enabled_assert(condition)) {
    _ = &condition;
    return SDL_enabled_assert(condition);
}
pub inline fn SDL_assert_paranoid(condition: anytype) @TypeOf(SDL_disabled_assert(condition)) {
    _ = &condition;
    return SDL_disabled_assert(condition);
}
pub inline fn SDL_assert_always(condition: anytype) @TypeOf(SDL_enabled_assert(condition)) {
    _ = &condition;
    return SDL_enabled_assert(condition);
}
pub const SDL_asyncio_h_ = "";
pub const SDL_atomic_h_ = "";
pub const SDL_CompilerBarrier = @compileError("unable to translate C expr: unexpected token '__asm__'");
// include/SDL3/SDL_atomic.h:165:9
pub inline fn SDL_MemoryBarrierRelease() @TypeOf(SDL_CompilerBarrier()) {
    return SDL_CompilerBarrier();
}
pub inline fn SDL_MemoryBarrierAcquire() @TypeOf(SDL_CompilerBarrier()) {
    return SDL_CompilerBarrier();
}
pub const SDL_CPUPauseInstruction = @compileError("unable to translate C expr: unexpected token '__asm__'");
// include/SDL3/SDL_atomic.h:349:13
pub inline fn SDL_AtomicIncRef(a: anytype) @TypeOf(SDL_AddAtomicInt(a, @as(c_int, 1))) {
    _ = &a;
    return SDL_AddAtomicInt(a, @as(c_int, 1));
}
pub inline fn SDL_AtomicDecRef(a: anytype) @TypeOf(SDL_AddAtomicInt(a, -@as(c_int, 1)) == @as(c_int, 1)) {
    _ = &a;
    return SDL_AddAtomicInt(a, -@as(c_int, 1)) == @as(c_int, 1);
}
pub const SDL_audio_h_ = "";
pub const SDL_endian_h_ = "";
pub const SDL_LIL_ENDIAN = @as(c_int, 1234);
pub const SDL_BIG_ENDIAN = @as(c_int, 4321);
pub const SDL_BYTEORDER = SDL_LIL_ENDIAN;
pub const SDL_FLOATWORDORDER = SDL_BYTEORDER;
pub const HAS_BUILTIN_BSWAP16 = (SDL_HAS_BUILTIN(__builtin_bswap16) != 0) or ((__GNUC__ > @as(c_int, 4)) or ((__GNUC__ == @as(c_int, 4)) and (__GNUC_MINOR__ >= @as(c_int, 8))));
pub const HAS_BUILTIN_BSWAP32 = (SDL_HAS_BUILTIN(__builtin_bswap32) != 0) or ((__GNUC__ > @as(c_int, 4)) or ((__GNUC__ == @as(c_int, 4)) and (__GNUC_MINOR__ >= @as(c_int, 3))));
pub const HAS_BUILTIN_BSWAP64 = (SDL_HAS_BUILTIN(__builtin_bswap64) != 0) or ((__GNUC__ > @as(c_int, 4)) or ((__GNUC__ == @as(c_int, 4)) and (__GNUC_MINOR__ >= @as(c_int, 3))));
pub const HAS_BROKEN_BSWAP = (__GNUC__ == @as(c_int, 2)) and (__GNUC_MINOR__ <= @as(c_int, 95));
pub inline fn SDL_Swap16(x: anytype) @TypeOf(__builtin_bswap16(x)) {
    _ = &x;
    return __builtin_bswap16(x);
}
pub inline fn SDL_Swap32(x: anytype) @TypeOf(__builtin_bswap32(x)) {
    _ = &x;
    return __builtin_bswap32(x);
}
pub inline fn SDL_Swap64(x: anytype) @TypeOf(__builtin_bswap64(x)) {
    _ = &x;
    return __builtin_bswap64(x);
}
pub inline fn SDL_Swap16LE(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn SDL_Swap32LE(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn SDL_Swap64LE(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn SDL_SwapFloatLE(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn SDL_Swap16BE(x: anytype) @TypeOf(SDL_Swap16(x)) {
    _ = &x;
    return SDL_Swap16(x);
}
pub inline fn SDL_Swap32BE(x: anytype) @TypeOf(SDL_Swap32(x)) {
    _ = &x;
    return SDL_Swap32(x);
}
pub inline fn SDL_Swap64BE(x: anytype) @TypeOf(SDL_Swap64(x)) {
    _ = &x;
    return SDL_Swap64(x);
}
pub inline fn SDL_SwapFloatBE(x: anytype) @TypeOf(SDL_SwapFloat(x)) {
    _ = &x;
    return SDL_SwapFloat(x);
}
pub const SDL_error_h_ = "";
pub inline fn SDL_Unsupported() @TypeOf(SDL_SetError("That operation is not supported")) {
    return SDL_SetError("That operation is not supported");
}
pub inline fn SDL_InvalidParamError(param: anytype) @TypeOf(SDL_SetError("Parameter '%s' is invalid", param)) {
    _ = &param;
    return SDL_SetError("Parameter '%s' is invalid", param);
}
pub const SDL_mutex_h_ = "";
pub const SDL_thread_h_ = "";
pub const SDL_properties_h_ = "";
pub const _INC_PROCESS = "";
pub const _INC_CORECRT_STARTUP = "";
pub const _acmdln = __p__acmdln().*;
pub const _wcmdln = __p__wcmdln().*;
pub const _INC_TYPES = "";
pub const _PID_T_ = "";
pub const _MODE_T_ = "";
pub const _TIMESPEC_DEFINED = "";
pub const _SIGSET_T_ = "";
pub const _P_WAIT = @as(c_int, 0);
pub const _P_NOWAIT = @as(c_int, 1);
pub const _OLD_P_OVERLAY = @as(c_int, 2);
pub const _P_NOWAITO = @as(c_int, 3);
pub const _P_DETACH = @as(c_int, 4);
pub const _P_OVERLAY = @as(c_int, 2);
pub const _WAIT_CHILD = @as(c_int, 0);
pub const _WAIT_GRANDCHILD = @as(c_int, 1);
pub const _CRT_TERMINATE_DEFINED = "";
pub const _SPAWNV_DEFINED = "";
pub const _CRT_SYSTEM_DEFINED = "";
pub const P_WAIT = _P_WAIT;
pub const P_NOWAIT = _P_NOWAIT;
pub const P_OVERLAY = _P_OVERLAY;
pub const OLD_P_OVERLAY = _OLD_P_OVERLAY;
pub const P_NOWAITO = _P_NOWAITO;
pub const P_DETACH = _P_DETACH;
pub const WAIT_CHILD = _WAIT_CHILD;
pub const WAIT_GRANDCHILD = _WAIT_GRANDCHILD;
pub const _CRT_GETPID_DEFINED = "";
pub const SDL_BeginThreadFunction = _beginthreadex;
pub const SDL_EndThreadFunction = _endthreadex;
pub inline fn SDL_CreateThread(@"fn": anytype, name: anytype, data: anytype) @TypeOf(SDL_CreateThreadRuntime(@"fn", name, data, @import("std").zig.c_translation.cast(SDL_FunctionPointer, SDL_BeginThreadFunction), @import("std").zig.c_translation.cast(SDL_FunctionPointer, SDL_EndThreadFunction))) {
    _ = &@"fn";
    _ = &name;
    _ = &data;
    return SDL_CreateThreadRuntime(@"fn", name, data, @import("std").zig.c_translation.cast(SDL_FunctionPointer, SDL_BeginThreadFunction), @import("std").zig.c_translation.cast(SDL_FunctionPointer, SDL_EndThreadFunction));
}
pub inline fn SDL_CreateThreadWithProperties(props: anytype) @TypeOf(SDL_CreateThreadWithPropertiesRuntime(props, @import("std").zig.c_translation.cast(SDL_FunctionPointer, SDL_BeginThreadFunction), @import("std").zig.c_translation.cast(SDL_FunctionPointer, SDL_EndThreadFunction))) {
    _ = &props;
    return SDL_CreateThreadWithPropertiesRuntime(props, @import("std").zig.c_translation.cast(SDL_FunctionPointer, SDL_BeginThreadFunction), @import("std").zig.c_translation.cast(SDL_FunctionPointer, SDL_EndThreadFunction));
}
pub const SDL_PROP_THREAD_CREATE_ENTRY_FUNCTION_POINTER = "SDL.thread.create.entry_function";
pub const SDL_PROP_THREAD_CREATE_NAME_STRING = "SDL.thread.create.name";
pub const SDL_PROP_THREAD_CREATE_USERDATA_POINTER = "SDL.thread.create.userdata";
pub const SDL_PROP_THREAD_CREATE_STACKSIZE_NUMBER = "SDL.thread.create.stacksize";
pub const SDL_THREAD_ANNOTATION_ATTRIBUTE__ = @compileError("unable to translate C expr: unexpected token ''");
// include/SDL3/SDL_mutex.h:67:9
pub const SDL_CAPABILITY = @compileError("unable to translate macro: undefined identifier `capability`");
// include/SDL3/SDL_mutex.h:77:9
pub const SDL_SCOPED_CAPABILITY = @compileError("unable to translate macro: undefined identifier `scoped_lockable`");
// include/SDL3/SDL_mutex.h:87:9
pub const SDL_GUARDED_BY = @compileError("unable to translate macro: undefined identifier `guarded_by`");
// include/SDL3/SDL_mutex.h:97:9
pub const SDL_PT_GUARDED_BY = @compileError("unable to translate macro: undefined identifier `pt_guarded_by`");
// include/SDL3/SDL_mutex.h:107:9
pub const SDL_ACQUIRED_BEFORE = @compileError("unable to translate macro: undefined identifier `acquired_before`");
// include/SDL3/SDL_mutex.h:117:9
pub const SDL_ACQUIRED_AFTER = @compileError("unable to translate macro: undefined identifier `acquired_after`");
// include/SDL3/SDL_mutex.h:127:9
pub const SDL_REQUIRES = @compileError("unable to translate macro: undefined identifier `requires_capability`");
// include/SDL3/SDL_mutex.h:137:9
pub const SDL_REQUIRES_SHARED = @compileError("unable to translate macro: undefined identifier `requires_shared_capability`");
// include/SDL3/SDL_mutex.h:147:9
pub const SDL_ACQUIRE = @compileError("unable to translate macro: undefined identifier `acquire_capability`");
// include/SDL3/SDL_mutex.h:157:9
pub const SDL_ACQUIRE_SHARED = @compileError("unable to translate macro: undefined identifier `acquire_shared_capability`");
// include/SDL3/SDL_mutex.h:167:9
pub const SDL_RELEASE = @compileError("unable to translate macro: undefined identifier `release_capability`");
// include/SDL3/SDL_mutex.h:177:9
pub const SDL_RELEASE_SHARED = @compileError("unable to translate macro: undefined identifier `release_shared_capability`");
// include/SDL3/SDL_mutex.h:187:9
pub const SDL_RELEASE_GENERIC = @compileError("unable to translate macro: undefined identifier `release_generic_capability`");
// include/SDL3/SDL_mutex.h:197:9
pub const SDL_TRY_ACQUIRE = @compileError("unable to translate macro: undefined identifier `try_acquire_capability`");
// include/SDL3/SDL_mutex.h:207:9
pub const SDL_TRY_ACQUIRE_SHARED = @compileError("unable to translate macro: undefined identifier `try_acquire_shared_capability`");
// include/SDL3/SDL_mutex.h:217:9
pub const SDL_EXCLUDES = @compileError("unable to translate macro: undefined identifier `locks_excluded`");
// include/SDL3/SDL_mutex.h:227:9
pub const SDL_ASSERT_CAPABILITY = @compileError("unable to translate macro: undefined identifier `assert_capability`");
// include/SDL3/SDL_mutex.h:237:9
pub const SDL_ASSERT_SHARED_CAPABILITY = @compileError("unable to translate macro: undefined identifier `assert_shared_capability`");
// include/SDL3/SDL_mutex.h:247:9
pub const SDL_RETURN_CAPABILITY = @compileError("unable to translate macro: undefined identifier `lock_returned`");
// include/SDL3/SDL_mutex.h:257:9
pub const SDL_NO_THREAD_SAFETY_ANALYSIS = @compileError("unable to translate macro: undefined identifier `no_thread_safety_analysis`");
// include/SDL3/SDL_mutex.h:267:9
pub const SDL_iostream_h_ = "";
pub const SDL_PROP_IOSTREAM_WINDOWS_HANDLE_POINTER = "SDL.iostream.windows.handle";
pub const SDL_PROP_IOSTREAM_STDIO_FILE_POINTER = "SDL.iostream.stdio.file";
pub const SDL_PROP_IOSTREAM_FILE_DESCRIPTOR_NUMBER = "SDL.iostream.file_descriptor";
pub const SDL_PROP_IOSTREAM_ANDROID_AASSET_POINTER = "SDL.iostream.android.aasset";
pub const SDL_PROP_IOSTREAM_MEMORY_POINTER = "SDL.iostream.memory.base";
pub const SDL_PROP_IOSTREAM_MEMORY_SIZE_NUMBER = "SDL.iostream.memory.size";
pub const SDL_PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER = "SDL.iostream.dynamic.memory";
pub const SDL_PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER = "SDL.iostream.dynamic.chunksize";
pub const SDL_AUDIO_MASK_BITSIZE = @as(c_uint, 0xFF);
pub const SDL_AUDIO_MASK_FLOAT = @as(c_uint, 1) << @as(c_int, 8);
pub const SDL_AUDIO_MASK_BIG_ENDIAN = @as(c_uint, 1) << @as(c_int, 12);
pub const SDL_AUDIO_MASK_SIGNED = @as(c_uint, 1) << @as(c_int, 15);
pub const SDL_DEFINE_AUDIO_FORMAT = @compileError("unable to translate C expr: expected ')' instead got 'signed'");
// include/SDL3/SDL_audio.h:204:9
pub inline fn SDL_AUDIO_BITSIZE(x: anytype) @TypeOf(x & SDL_AUDIO_MASK_BITSIZE) {
    _ = &x;
    return x & SDL_AUDIO_MASK_BITSIZE;
}
pub inline fn SDL_AUDIO_BYTESIZE(x: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(SDL_AUDIO_BITSIZE(x), @as(c_int, 8))) {
    _ = &x;
    return @import("std").zig.c_translation.MacroArithmetic.div(SDL_AUDIO_BITSIZE(x), @as(c_int, 8));
}
pub inline fn SDL_AUDIO_ISFLOAT(x: anytype) @TypeOf(x & SDL_AUDIO_MASK_FLOAT) {
    _ = &x;
    return x & SDL_AUDIO_MASK_FLOAT;
}
pub inline fn SDL_AUDIO_ISBIGENDIAN(x: anytype) @TypeOf(x & SDL_AUDIO_MASK_BIG_ENDIAN) {
    _ = &x;
    return x & SDL_AUDIO_MASK_BIG_ENDIAN;
}
pub inline fn SDL_AUDIO_ISLITTLEENDIAN(x: anytype) @TypeOf(!(SDL_AUDIO_ISBIGENDIAN(x) != 0)) {
    _ = &x;
    return !(SDL_AUDIO_ISBIGENDIAN(x) != 0);
}
pub inline fn SDL_AUDIO_ISSIGNED(x: anytype) @TypeOf(x & SDL_AUDIO_MASK_SIGNED) {
    _ = &x;
    return x & SDL_AUDIO_MASK_SIGNED;
}
pub inline fn SDL_AUDIO_ISINT(x: anytype) @TypeOf(!(SDL_AUDIO_ISFLOAT(x) != 0)) {
    _ = &x;
    return !(SDL_AUDIO_ISFLOAT(x) != 0);
}
pub inline fn SDL_AUDIO_ISUNSIGNED(x: anytype) @TypeOf(!(SDL_AUDIO_ISSIGNED(x) != 0)) {
    _ = &x;
    return !(SDL_AUDIO_ISSIGNED(x) != 0);
}
pub const SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK = @import("std").zig.c_translation.cast(SDL_AudioDeviceID, @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xFFFFFFFF, .hex));
pub const SDL_AUDIO_DEVICE_DEFAULT_RECORDING = @import("std").zig.c_translation.cast(SDL_AudioDeviceID, @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xFFFFFFFE, .hex));
pub inline fn SDL_AUDIO_FRAMESIZE(x: anytype) @TypeOf(SDL_AUDIO_BYTESIZE(x.format) * x.channels) {
    _ = &x;
    return SDL_AUDIO_BYTESIZE(x.format) * x.channels;
}
pub const SDL_bits_h_ = "";
pub const SDL_blendmode_h_ = "";
pub const SDL_BLENDMODE_NONE = @as(c_uint, 0x00000000);
pub const SDL_BLENDMODE_BLEND = @as(c_uint, 0x00000001);
pub const SDL_BLENDMODE_BLEND_PREMULTIPLIED = @as(c_uint, 0x00000010);
pub const SDL_BLENDMODE_ADD = @as(c_uint, 0x00000002);
pub const SDL_BLENDMODE_ADD_PREMULTIPLIED = @as(c_uint, 0x00000020);
pub const SDL_BLENDMODE_MOD = @as(c_uint, 0x00000004);
pub const SDL_BLENDMODE_MUL = @as(c_uint, 0x00000008);
pub const SDL_BLENDMODE_INVALID = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x7FFFFFFF, .hex);
pub const SDL_camera_h_ = "";
pub const SDL_pixels_h_ = "";
pub const SDL_ALPHA_OPAQUE = @as(c_int, 255);
pub const SDL_ALPHA_OPAQUE_FLOAT = @as(f32, 1.0);
pub const SDL_ALPHA_TRANSPARENT = @as(c_int, 0);
pub const SDL_ALPHA_TRANSPARENT_FLOAT = @as(f32, 0.0);
pub inline fn SDL_DEFINE_PIXELFOURCC(A: anytype, B: anytype, C: anytype, D: anytype) @TypeOf(SDL_FOURCC(A, B, C, D)) {
    _ = &A;
    _ = &B;
    _ = &C;
    _ = &D;
    return SDL_FOURCC(A, B, C, D);
}
pub inline fn SDL_DEFINE_PIXELFORMAT(@"type": anytype, order: anytype, layout: anytype, bits: anytype, bytes: anytype) @TypeOf((((((@as(c_int, 1) << @as(c_int, 28)) | (@"type" << @as(c_int, 24))) | (order << @as(c_int, 20))) | (layout << @as(c_int, 16))) | (bits << @as(c_int, 8))) | (bytes << @as(c_int, 0))) {
    _ = &@"type";
    _ = &order;
    _ = &layout;
    _ = &bits;
    _ = &bytes;
    return (((((@as(c_int, 1) << @as(c_int, 28)) | (@"type" << @as(c_int, 24))) | (order << @as(c_int, 20))) | (layout << @as(c_int, 16))) | (bits << @as(c_int, 8))) | (bytes << @as(c_int, 0));
}
pub inline fn SDL_PIXELFLAG(format: anytype) @TypeOf((format >> @as(c_int, 28)) & @as(c_int, 0x0F)) {
    _ = &format;
    return (format >> @as(c_int, 28)) & @as(c_int, 0x0F);
}
pub inline fn SDL_PIXELTYPE(format: anytype) @TypeOf((format >> @as(c_int, 24)) & @as(c_int, 0x0F)) {
    _ = &format;
    return (format >> @as(c_int, 24)) & @as(c_int, 0x0F);
}
pub inline fn SDL_PIXELORDER(format: anytype) @TypeOf((format >> @as(c_int, 20)) & @as(c_int, 0x0F)) {
    _ = &format;
    return (format >> @as(c_int, 20)) & @as(c_int, 0x0F);
}
pub inline fn SDL_PIXELLAYOUT(format: anytype) @TypeOf((format >> @as(c_int, 16)) & @as(c_int, 0x0F)) {
    _ = &format;
    return (format >> @as(c_int, 16)) & @as(c_int, 0x0F);
}
pub inline fn SDL_BITSPERPIXEL(format: anytype) @TypeOf(if (SDL_ISPIXELFORMAT_FOURCC(format)) @as(c_int, 0) else (format >> @as(c_int, 8)) & @as(c_int, 0xFF)) {
    _ = &format;
    return if (SDL_ISPIXELFORMAT_FOURCC(format)) @as(c_int, 0) else (format >> @as(c_int, 8)) & @as(c_int, 0xFF);
}
pub inline fn SDL_BYTESPERPIXEL(format: anytype) @TypeOf(if (SDL_ISPIXELFORMAT_FOURCC(format)) if ((((format == SDL_PIXELFORMAT_YUY2) or (format == SDL_PIXELFORMAT_UYVY)) or (format == SDL_PIXELFORMAT_YVYU)) or (format == SDL_PIXELFORMAT_P010)) @as(c_int, 2) else @as(c_int, 1) else (format >> @as(c_int, 0)) & @as(c_int, 0xFF)) {
    _ = &format;
    return if (SDL_ISPIXELFORMAT_FOURCC(format)) if ((((format == SDL_PIXELFORMAT_YUY2) or (format == SDL_PIXELFORMAT_UYVY)) or (format == SDL_PIXELFORMAT_YVYU)) or (format == SDL_PIXELFORMAT_P010)) @as(c_int, 2) else @as(c_int, 1) else (format >> @as(c_int, 0)) & @as(c_int, 0xFF);
}
pub inline fn SDL_ISPIXELFORMAT_INDEXED(format: anytype) @TypeOf(!(SDL_ISPIXELFORMAT_FOURCC(format) != 0) and ((((SDL_PIXELTYPE(format) == SDL_PIXELTYPE_INDEX1) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_INDEX2)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_INDEX4)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_INDEX8))) {
    _ = &format;
    return !(SDL_ISPIXELFORMAT_FOURCC(format) != 0) and ((((SDL_PIXELTYPE(format) == SDL_PIXELTYPE_INDEX1) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_INDEX2)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_INDEX4)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_INDEX8));
}
pub inline fn SDL_ISPIXELFORMAT_PACKED(format: anytype) @TypeOf(!(SDL_ISPIXELFORMAT_FOURCC(format) != 0) and (((SDL_PIXELTYPE(format) == SDL_PIXELTYPE_PACKED8) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_PACKED16)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_PACKED32))) {
    _ = &format;
    return !(SDL_ISPIXELFORMAT_FOURCC(format) != 0) and (((SDL_PIXELTYPE(format) == SDL_PIXELTYPE_PACKED8) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_PACKED16)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_PACKED32));
}
pub inline fn SDL_ISPIXELFORMAT_ARRAY(format: anytype) @TypeOf(!(SDL_ISPIXELFORMAT_FOURCC(format) != 0) and (((((SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYU8) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYU16)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYU32)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYF16)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYF32))) {
    _ = &format;
    return !(SDL_ISPIXELFORMAT_FOURCC(format) != 0) and (((((SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYU8) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYU16)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYU32)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYF16)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYF32));
}
pub inline fn SDL_ISPIXELFORMAT_10BIT(format: anytype) @TypeOf(!(SDL_ISPIXELFORMAT_FOURCC(format) != 0) and ((SDL_PIXELTYPE(format) == SDL_PIXELTYPE_PACKED32) and (SDL_PIXELLAYOUT(format) == SDL_PACKEDLAYOUT_2101010))) {
    _ = &format;
    return !(SDL_ISPIXELFORMAT_FOURCC(format) != 0) and ((SDL_PIXELTYPE(format) == SDL_PIXELTYPE_PACKED32) and (SDL_PIXELLAYOUT(format) == SDL_PACKEDLAYOUT_2101010));
}
pub inline fn SDL_ISPIXELFORMAT_FLOAT(format: anytype) @TypeOf(!(SDL_ISPIXELFORMAT_FOURCC(format) != 0) and ((SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYF16) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYF32))) {
    _ = &format;
    return !(SDL_ISPIXELFORMAT_FOURCC(format) != 0) and ((SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYF16) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYF32));
}
pub inline fn SDL_ISPIXELFORMAT_ALPHA(format: anytype) @TypeOf(((SDL_ISPIXELFORMAT_PACKED(format) != 0) and ((((SDL_PIXELORDER(format) == SDL_PACKEDORDER_ARGB) or (SDL_PIXELORDER(format) == SDL_PACKEDORDER_RGBA)) or (SDL_PIXELORDER(format) == SDL_PACKEDORDER_ABGR)) or (SDL_PIXELORDER(format) == SDL_PACKEDORDER_BGRA))) or ((SDL_ISPIXELFORMAT_ARRAY(format) != 0) and ((((SDL_PIXELORDER(format) == SDL_ARRAYORDER_ARGB) or (SDL_PIXELORDER(format) == SDL_ARRAYORDER_RGBA)) or (SDL_PIXELORDER(format) == SDL_ARRAYORDER_ABGR)) or (SDL_PIXELORDER(format) == SDL_ARRAYORDER_BGRA)))) {
    _ = &format;
    return ((SDL_ISPIXELFORMAT_PACKED(format) != 0) and ((((SDL_PIXELORDER(format) == SDL_PACKEDORDER_ARGB) or (SDL_PIXELORDER(format) == SDL_PACKEDORDER_RGBA)) or (SDL_PIXELORDER(format) == SDL_PACKEDORDER_ABGR)) or (SDL_PIXELORDER(format) == SDL_PACKEDORDER_BGRA))) or ((SDL_ISPIXELFORMAT_ARRAY(format) != 0) and ((((SDL_PIXELORDER(format) == SDL_ARRAYORDER_ARGB) or (SDL_PIXELORDER(format) == SDL_ARRAYORDER_RGBA)) or (SDL_PIXELORDER(format) == SDL_ARRAYORDER_ABGR)) or (SDL_PIXELORDER(format) == SDL_ARRAYORDER_BGRA)));
}
pub inline fn SDL_ISPIXELFORMAT_FOURCC(format: anytype) @TypeOf((format != 0) and (SDL_PIXELFLAG(format) != @as(c_int, 1))) {
    _ = &format;
    return (format != 0) and (SDL_PIXELFLAG(format) != @as(c_int, 1));
}
pub inline fn SDL_DEFINE_COLORSPACE(@"type": anytype, range: anytype, primaries: anytype, transfer: anytype, matrix: anytype, chroma: anytype) @TypeOf((((((@import("std").zig.c_translation.cast(Uint32, @"type") << @as(c_int, 28)) | (@import("std").zig.c_translation.cast(Uint32, range) << @as(c_int, 24))) | (@import("std").zig.c_translation.cast(Uint32, chroma) << @as(c_int, 20))) | (@import("std").zig.c_translation.cast(Uint32, primaries) << @as(c_int, 10))) | (@import("std").zig.c_translation.cast(Uint32, transfer) << @as(c_int, 5))) | (@import("std").zig.c_translation.cast(Uint32, matrix) << @as(c_int, 0))) {
    _ = &@"type";
    _ = &range;
    _ = &primaries;
    _ = &transfer;
    _ = &matrix;
    _ = &chroma;
    return (((((@import("std").zig.c_translation.cast(Uint32, @"type") << @as(c_int, 28)) | (@import("std").zig.c_translation.cast(Uint32, range) << @as(c_int, 24))) | (@import("std").zig.c_translation.cast(Uint32, chroma) << @as(c_int, 20))) | (@import("std").zig.c_translation.cast(Uint32, primaries) << @as(c_int, 10))) | (@import("std").zig.c_translation.cast(Uint32, transfer) << @as(c_int, 5))) | (@import("std").zig.c_translation.cast(Uint32, matrix) << @as(c_int, 0));
}
pub inline fn SDL_COLORSPACETYPE(cspace: anytype) SDL_ColorType {
    _ = &cspace;
    return @import("std").zig.c_translation.cast(SDL_ColorType, (cspace >> @as(c_int, 28)) & @as(c_int, 0x0F));
}
pub inline fn SDL_COLORSPACERANGE(cspace: anytype) SDL_ColorRange {
    _ = &cspace;
    return @import("std").zig.c_translation.cast(SDL_ColorRange, (cspace >> @as(c_int, 24)) & @as(c_int, 0x0F));
}
pub inline fn SDL_COLORSPACECHROMA(cspace: anytype) SDL_ChromaLocation {
    _ = &cspace;
    return @import("std").zig.c_translation.cast(SDL_ChromaLocation, (cspace >> @as(c_int, 20)) & @as(c_int, 0x0F));
}
pub inline fn SDL_COLORSPACEPRIMARIES(cspace: anytype) SDL_ColorPrimaries {
    _ = &cspace;
    return @import("std").zig.c_translation.cast(SDL_ColorPrimaries, (cspace >> @as(c_int, 10)) & @as(c_int, 0x1F));
}
pub inline fn SDL_COLORSPACETRANSFER(cspace: anytype) SDL_TransferCharacteristics {
    _ = &cspace;
    return @import("std").zig.c_translation.cast(SDL_TransferCharacteristics, (cspace >> @as(c_int, 5)) & @as(c_int, 0x1F));
}
pub inline fn SDL_COLORSPACEMATRIX(cspace: anytype) SDL_MatrixCoefficients {
    _ = &cspace;
    return @import("std").zig.c_translation.cast(SDL_MatrixCoefficients, cspace & @as(c_int, 0x1F));
}
pub inline fn SDL_ISCOLORSPACE_MATRIX_BT601(cspace: anytype) @TypeOf((SDL_COLORSPACEMATRIX(cspace) == SDL_MATRIX_COEFFICIENTS_BT601) or (SDL_COLORSPACEMATRIX(cspace) == SDL_MATRIX_COEFFICIENTS_BT470BG)) {
    _ = &cspace;
    return (SDL_COLORSPACEMATRIX(cspace) == SDL_MATRIX_COEFFICIENTS_BT601) or (SDL_COLORSPACEMATRIX(cspace) == SDL_MATRIX_COEFFICIENTS_BT470BG);
}
pub inline fn SDL_ISCOLORSPACE_MATRIX_BT709(cspace: anytype) @TypeOf(SDL_COLORSPACEMATRIX(cspace) == SDL_MATRIX_COEFFICIENTS_BT709) {
    _ = &cspace;
    return SDL_COLORSPACEMATRIX(cspace) == SDL_MATRIX_COEFFICIENTS_BT709;
}
pub inline fn SDL_ISCOLORSPACE_MATRIX_BT2020_NCL(cspace: anytype) @TypeOf(SDL_COLORSPACEMATRIX(cspace) == SDL_MATRIX_COEFFICIENTS_BT2020_NCL) {
    _ = &cspace;
    return SDL_COLORSPACEMATRIX(cspace) == SDL_MATRIX_COEFFICIENTS_BT2020_NCL;
}
pub inline fn SDL_ISCOLORSPACE_LIMITED_RANGE(cspace: anytype) @TypeOf(SDL_COLORSPACERANGE(cspace) != SDL_COLOR_RANGE_FULL) {
    _ = &cspace;
    return SDL_COLORSPACERANGE(cspace) != SDL_COLOR_RANGE_FULL;
}
pub inline fn SDL_ISCOLORSPACE_FULL_RANGE(cspace: anytype) @TypeOf(SDL_COLORSPACERANGE(cspace) == SDL_COLOR_RANGE_FULL) {
    _ = &cspace;
    return SDL_COLORSPACERANGE(cspace) == SDL_COLOR_RANGE_FULL;
}
pub const SDL_surface_h_ = "";
pub const SDL_rect_h_ = "";
pub const SDL_SURFACE_PREALLOCATED = @as(c_uint, 0x00000001);
pub const SDL_SURFACE_LOCK_NEEDED = @as(c_uint, 0x00000002);
pub const SDL_SURFACE_LOCKED = @as(c_uint, 0x00000004);
pub const SDL_SURFACE_SIMD_ALIGNED = @as(c_uint, 0x00000008);
pub inline fn SDL_MUSTLOCK(S: anytype) @TypeOf((S.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
    _ = &S;
    return (S.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED;
}
pub const SDL_PROP_SURFACE_SDR_WHITE_POINT_FLOAT = "SDL.surface.SDR_white_point";
pub const SDL_PROP_SURFACE_HDR_HEADROOM_FLOAT = "SDL.surface.HDR_headroom";
pub const SDL_PROP_SURFACE_TONEMAP_OPERATOR_STRING = "SDL.surface.tonemap";
pub const SDL_PROP_SURFACE_HOTSPOT_X_NUMBER = "SDL.surface.hotspot.x";
pub const SDL_PROP_SURFACE_HOTSPOT_Y_NUMBER = "SDL.surface.hotspot.y";
pub const SDL_clipboard_h_ = "";
pub const SDL_cpuinfo_h_ = "";
pub const SDL_CACHELINE_SIZE = @as(c_int, 128);
pub const SDL_dialog_h_ = "";
pub const SDL_video_h_ = "";
pub const SDL_PROP_GLOBAL_VIDEO_WAYLAND_WL_DISPLAY_POINTER = "SDL.video.wayland.wl_display";
pub const SDL_WINDOW_FULLSCREEN = SDL_UINT64_C(@as(c_int, 0x0000000000000001));
pub const SDL_WINDOW_OPENGL = SDL_UINT64_C(@as(c_int, 0x0000000000000002));
pub const SDL_WINDOW_OCCLUDED = SDL_UINT64_C(@as(c_int, 0x0000000000000004));
pub const SDL_WINDOW_HIDDEN = SDL_UINT64_C(@as(c_int, 0x0000000000000008));
pub const SDL_WINDOW_BORDERLESS = SDL_UINT64_C(@as(c_int, 0x0000000000000010));
pub const SDL_WINDOW_RESIZABLE = SDL_UINT64_C(@as(c_int, 0x0000000000000020));
pub const SDL_WINDOW_MINIMIZED = SDL_UINT64_C(@as(c_int, 0x0000000000000040));
pub const SDL_WINDOW_MAXIMIZED = SDL_UINT64_C(@as(c_int, 0x0000000000000080));
pub const SDL_WINDOW_MOUSE_GRABBED = SDL_UINT64_C(@as(c_int, 0x0000000000000100));
pub const SDL_WINDOW_INPUT_FOCUS = SDL_UINT64_C(@as(c_int, 0x0000000000000200));
pub const SDL_WINDOW_MOUSE_FOCUS = SDL_UINT64_C(@as(c_int, 0x0000000000000400));
pub const SDL_WINDOW_EXTERNAL = SDL_UINT64_C(@as(c_int, 0x0000000000000800));
pub const SDL_WINDOW_MODAL = SDL_UINT64_C(@as(c_int, 0x0000000000001000));
pub const SDL_WINDOW_HIGH_PIXEL_DENSITY = SDL_UINT64_C(@as(c_int, 0x0000000000002000));
pub const SDL_WINDOW_MOUSE_CAPTURE = SDL_UINT64_C(@as(c_int, 0x0000000000004000));
pub const SDL_WINDOW_MOUSE_RELATIVE_MODE = SDL_UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0000000000008000, .hex));
pub const SDL_WINDOW_ALWAYS_ON_TOP = SDL_UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0000000000010000, .hex));
pub const SDL_WINDOW_UTILITY = SDL_UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0000000000020000, .hex));
pub const SDL_WINDOW_TOOLTIP = SDL_UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0000000000040000, .hex));
pub const SDL_WINDOW_POPUP_MENU = SDL_UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0000000000080000, .hex));
pub const SDL_WINDOW_KEYBOARD_GRABBED = SDL_UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0000000000100000, .hex));
pub const SDL_WINDOW_VULKAN = SDL_UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0000000010000000, .hex));
pub const SDL_WINDOW_METAL = SDL_UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0000000020000000, .hex));
pub const SDL_WINDOW_TRANSPARENT = SDL_UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0000000040000000, .hex));
pub const SDL_WINDOW_NOT_FOCUSABLE = SDL_UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0000000080000000, .hex));
pub const SDL_WINDOWPOS_UNDEFINED_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x1FFF0000, .hex);
pub inline fn SDL_WINDOWPOS_UNDEFINED_DISPLAY(X: anytype) @TypeOf(SDL_WINDOWPOS_UNDEFINED_MASK | X) {
    _ = &X;
    return SDL_WINDOWPOS_UNDEFINED_MASK | X;
}
pub const SDL_WINDOWPOS_UNDEFINED = SDL_WINDOWPOS_UNDEFINED_DISPLAY(@as(c_int, 0));
pub inline fn SDL_WINDOWPOS_ISUNDEFINED(X: anytype) @TypeOf((X & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFF0000, .hex)) == SDL_WINDOWPOS_UNDEFINED_MASK) {
    _ = &X;
    return (X & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFF0000, .hex)) == SDL_WINDOWPOS_UNDEFINED_MASK;
}
pub const SDL_WINDOWPOS_CENTERED_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x2FFF0000, .hex);
pub inline fn SDL_WINDOWPOS_CENTERED_DISPLAY(X: anytype) @TypeOf(SDL_WINDOWPOS_CENTERED_MASK | X) {
    _ = &X;
    return SDL_WINDOWPOS_CENTERED_MASK | X;
}
pub const SDL_WINDOWPOS_CENTERED = SDL_WINDOWPOS_CENTERED_DISPLAY(@as(c_int, 0));
pub inline fn SDL_WINDOWPOS_ISCENTERED(X: anytype) @TypeOf((X & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFF0000, .hex)) == SDL_WINDOWPOS_CENTERED_MASK) {
    _ = &X;
    return (X & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFF0000, .hex)) == SDL_WINDOWPOS_CENTERED_MASK;
}
pub const SDL_GL_CONTEXT_PROFILE_CORE = @as(c_int, 0x0001);
pub const SDL_GL_CONTEXT_PROFILE_COMPATIBILITY = @as(c_int, 0x0002);
pub const SDL_GL_CONTEXT_PROFILE_ES = @as(c_int, 0x0004);
pub const SDL_GL_CONTEXT_DEBUG_FLAG = @as(c_int, 0x0001);
pub const SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = @as(c_int, 0x0002);
pub const SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG = @as(c_int, 0x0004);
pub const SDL_GL_CONTEXT_RESET_ISOLATION_FLAG = @as(c_int, 0x0008);
pub const SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE = @as(c_int, 0x0000);
pub const SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = @as(c_int, 0x0001);
pub const SDL_GL_CONTEXT_RESET_NO_NOTIFICATION = @as(c_int, 0x0000);
pub const SDL_GL_CONTEXT_RESET_LOSE_CONTEXT = @as(c_int, 0x0001);
pub const SDL_PROP_DISPLAY_HDR_ENABLED_BOOLEAN = "SDL.display.HDR_enabled";
pub const SDL_PROP_DISPLAY_KMSDRM_PANEL_ORIENTATION_NUMBER = "SDL.display.KMSDRM.panel_orientation";
pub const SDL_PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN = "SDL.window.create.always_on_top";
pub const SDL_PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN = "SDL.window.create.borderless";
pub const SDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN = "SDL.window.create.focusable";
pub const SDL_PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN = "SDL.window.create.external_graphics_context";
pub const SDL_PROP_WINDOW_CREATE_FLAGS_NUMBER = "SDL.window.create.flags";
pub const SDL_PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN = "SDL.window.create.fullscreen";
pub const SDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER = "SDL.window.create.height";
pub const SDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN = "SDL.window.create.hidden";
pub const SDL_PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN = "SDL.window.create.high_pixel_density";
pub const SDL_PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN = "SDL.window.create.maximized";
pub const SDL_PROP_WINDOW_CREATE_MENU_BOOLEAN = "SDL.window.create.menu";
pub const SDL_PROP_WINDOW_CREATE_METAL_BOOLEAN = "SDL.window.create.metal";
pub const SDL_PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN = "SDL.window.create.minimized";
pub const SDL_PROP_WINDOW_CREATE_MODAL_BOOLEAN = "SDL.window.create.modal";
pub const SDL_PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN = "SDL.window.create.mouse_grabbed";
pub const SDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN = "SDL.window.create.opengl";
pub const SDL_PROP_WINDOW_CREATE_PARENT_POINTER = "SDL.window.create.parent";
pub const SDL_PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN = "SDL.window.create.resizable";
pub const SDL_PROP_WINDOW_CREATE_TITLE_STRING = "SDL.window.create.title";
pub const SDL_PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN = "SDL.window.create.transparent";
pub const SDL_PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN = "SDL.window.create.tooltip";
pub const SDL_PROP_WINDOW_CREATE_UTILITY_BOOLEAN = "SDL.window.create.utility";
pub const SDL_PROP_WINDOW_CREATE_VULKAN_BOOLEAN = "SDL.window.create.vulkan";
pub const SDL_PROP_WINDOW_CREATE_WIDTH_NUMBER = "SDL.window.create.width";
pub const SDL_PROP_WINDOW_CREATE_X_NUMBER = "SDL.window.create.x";
pub const SDL_PROP_WINDOW_CREATE_Y_NUMBER = "SDL.window.create.y";
pub const SDL_PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER = "SDL.window.create.cocoa.window";
pub const SDL_PROP_WINDOW_CREATE_COCOA_VIEW_POINTER = "SDL.window.create.cocoa.view";
pub const SDL_PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN = "SDL.window.create.wayland.surface_role_custom";
pub const SDL_PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN = "SDL.window.create.wayland.create_egl_window";
pub const SDL_PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER = "SDL.window.create.wayland.wl_surface";
pub const SDL_PROP_WINDOW_CREATE_WIN32_HWND_POINTER = "SDL.window.create.win32.hwnd";
pub const SDL_PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER = "SDL.window.create.win32.pixel_format_hwnd";
pub const SDL_PROP_WINDOW_CREATE_X11_WINDOW_NUMBER = "SDL.window.create.x11.window";
pub const SDL_PROP_WINDOW_SHAPE_POINTER = "SDL.window.shape";
pub const SDL_PROP_WINDOW_HDR_ENABLED_BOOLEAN = "SDL.window.HDR_enabled";
pub const SDL_PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT = "SDL.window.SDR_white_level";
pub const SDL_PROP_WINDOW_HDR_HEADROOM_FLOAT = "SDL.window.HDR_headroom";
pub const SDL_PROP_WINDOW_ANDROID_WINDOW_POINTER = "SDL.window.android.window";
pub const SDL_PROP_WINDOW_ANDROID_SURFACE_POINTER = "SDL.window.android.surface";
pub const SDL_PROP_WINDOW_UIKIT_WINDOW_POINTER = "SDL.window.uikit.window";
pub const SDL_PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER = "SDL.window.uikit.metal_view_tag";
pub const SDL_PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER = "SDL.window.uikit.opengl.framebuffer";
pub const SDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER = "SDL.window.uikit.opengl.renderbuffer";
pub const SDL_PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER = "SDL.window.uikit.opengl.resolve_framebuffer";
pub const SDL_PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER = "SDL.window.kmsdrm.dev_index";
pub const SDL_PROP_WINDOW_KMSDRM_DRM_FD_NUMBER = "SDL.window.kmsdrm.drm_fd";
pub const SDL_PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER = "SDL.window.kmsdrm.gbm_dev";
pub const SDL_PROP_WINDOW_COCOA_WINDOW_POINTER = "SDL.window.cocoa.window";
pub const SDL_PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER = "SDL.window.cocoa.metal_view_tag";
pub const SDL_PROP_WINDOW_OPENVR_OVERLAY_ID = "SDL.window.openvr.overlay_id";
pub const SDL_PROP_WINDOW_VIVANTE_DISPLAY_POINTER = "SDL.window.vivante.display";
pub const SDL_PROP_WINDOW_VIVANTE_WINDOW_POINTER = "SDL.window.vivante.window";
pub const SDL_PROP_WINDOW_VIVANTE_SURFACE_POINTER = "SDL.window.vivante.surface";
pub const SDL_PROP_WINDOW_WIN32_HWND_POINTER = "SDL.window.win32.hwnd";
pub const SDL_PROP_WINDOW_WIN32_HDC_POINTER = "SDL.window.win32.hdc";
pub const SDL_PROP_WINDOW_WIN32_INSTANCE_POINTER = "SDL.window.win32.instance";
pub const SDL_PROP_WINDOW_WAYLAND_DISPLAY_POINTER = "SDL.window.wayland.display";
pub const SDL_PROP_WINDOW_WAYLAND_SURFACE_POINTER = "SDL.window.wayland.surface";
pub const SDL_PROP_WINDOW_WAYLAND_VIEWPORT_POINTER = "SDL.window.wayland.viewport";
pub const SDL_PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER = "SDL.window.wayland.egl_window";
pub const SDL_PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER = "SDL.window.wayland.xdg_surface";
pub const SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER = "SDL.window.wayland.xdg_toplevel";
pub const SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING = "SDL.window.wayland.xdg_toplevel_export_handle";
pub const SDL_PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER = "SDL.window.wayland.xdg_popup";
pub const SDL_PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER = "SDL.window.wayland.xdg_positioner";
pub const SDL_PROP_WINDOW_X11_DISPLAY_POINTER = "SDL.window.x11.display";
pub const SDL_PROP_WINDOW_X11_SCREEN_NUMBER = "SDL.window.x11.screen";
pub const SDL_PROP_WINDOW_X11_WINDOW_NUMBER = "SDL.window.x11.window";
pub const SDL_WINDOW_SURFACE_VSYNC_DISABLED = @as(c_int, 0);
pub const SDL_WINDOW_SURFACE_VSYNC_ADAPTIVE = -@as(c_int, 1);
pub const SDL_PROP_FILE_DIALOG_FILTERS_POINTER = "SDL.filedialog.filters";
pub const SDL_PROP_FILE_DIALOG_NFILTERS_NUMBER = "SDL.filedialog.nfilters";
pub const SDL_PROP_FILE_DIALOG_WINDOW_POINTER = "SDL.filedialog.window";
pub const SDL_PROP_FILE_DIALOG_LOCATION_STRING = "SDL.filedialog.location";
pub const SDL_PROP_FILE_DIALOG_MANY_BOOLEAN = "SDL.filedialog.many";
pub const SDL_PROP_FILE_DIALOG_TITLE_STRING = "SDL.filedialog.title";
pub const SDL_PROP_FILE_DIALOG_ACCEPT_STRING = "SDL.filedialog.accept";
pub const SDL_PROP_FILE_DIALOG_CANCEL_STRING = "SDL.filedialog.cancel";
pub const SDL_events_h_ = "";
pub const SDL_gamepad_h_ = "";
pub const SDL_guid_h_ = "";
pub const SDL_joystick_h_ = "";
pub const SDL_power_h_ = "";
pub const SDL_sensor_h_ = "";
pub const SDL_STANDARD_GRAVITY = @as(f32, 9.80665);
pub const SDL_JOYSTICK_AXIS_MAX = @as(c_int, 32767);
pub const SDL_JOYSTICK_AXIS_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 32768, .decimal);
pub const SDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN = "SDL.joystick.cap.mono_led";
pub const SDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN = "SDL.joystick.cap.rgb_led";
pub const SDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN = "SDL.joystick.cap.player_led";
pub const SDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN = "SDL.joystick.cap.rumble";
pub const SDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN = "SDL.joystick.cap.trigger_rumble";
pub const SDL_HAT_CENTERED = @as(c_uint, 0x00);
pub const SDL_HAT_UP = @as(c_uint, 0x01);
pub const SDL_HAT_RIGHT = @as(c_uint, 0x02);
pub const SDL_HAT_DOWN = @as(c_uint, 0x04);
pub const SDL_HAT_LEFT = @as(c_uint, 0x08);
pub const SDL_HAT_RIGHTUP = SDL_HAT_RIGHT | SDL_HAT_UP;
pub const SDL_HAT_RIGHTDOWN = SDL_HAT_RIGHT | SDL_HAT_DOWN;
pub const SDL_HAT_LEFTUP = SDL_HAT_LEFT | SDL_HAT_UP;
pub const SDL_HAT_LEFTDOWN = SDL_HAT_LEFT | SDL_HAT_DOWN;
pub const SDL_PROP_GAMEPAD_CAP_MONO_LED_BOOLEAN = SDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN;
pub const SDL_PROP_GAMEPAD_CAP_RGB_LED_BOOLEAN = SDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN;
pub const SDL_PROP_GAMEPAD_CAP_PLAYER_LED_BOOLEAN = SDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN;
pub const SDL_PROP_GAMEPAD_CAP_RUMBLE_BOOLEAN = SDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN;
pub const SDL_PROP_GAMEPAD_CAP_TRIGGER_RUMBLE_BOOLEAN = SDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN;
pub const SDL_keyboard_h_ = "";
pub const SDL_keycode_h_ = "";
pub const SDL_scancode_h_ = "";
pub const SDLK_EXTENDED_MASK = @as(c_uint, 1) << @as(c_int, 29);
pub const SDLK_SCANCODE_MASK = @as(c_uint, 1) << @as(c_int, 30);
pub inline fn SDL_SCANCODE_TO_KEYCODE(X: anytype) @TypeOf(X | SDLK_SCANCODE_MASK) {
    _ = &X;
    return X | SDLK_SCANCODE_MASK;
}
pub const SDLK_UNKNOWN = @as(c_uint, 0x00000000);
pub const SDLK_RETURN = @as(c_uint, 0x0000000d);
pub const SDLK_ESCAPE = @as(c_uint, 0x0000001b);
pub const SDLK_BACKSPACE = @as(c_uint, 0x00000008);
pub const SDLK_TAB = @as(c_uint, 0x00000009);
pub const SDLK_SPACE = @as(c_uint, 0x00000020);
pub const SDLK_EXCLAIM = @as(c_uint, 0x00000021);
pub const SDLK_DBLAPOSTROPHE = @as(c_uint, 0x00000022);
pub const SDLK_HASH = @as(c_uint, 0x00000023);
pub const SDLK_DOLLAR = @as(c_uint, 0x00000024);
pub const SDLK_PERCENT = @as(c_uint, 0x00000025);
pub const SDLK_AMPERSAND = @as(c_uint, 0x00000026);
pub const SDLK_APOSTROPHE = @as(c_uint, 0x00000027);
pub const SDLK_LEFTPAREN = @as(c_uint, 0x00000028);
pub const SDLK_RIGHTPAREN = @as(c_uint, 0x00000029);
pub const SDLK_ASTERISK = @as(c_uint, 0x0000002a);
pub const SDLK_PLUS = @as(c_uint, 0x0000002b);
pub const SDLK_COMMA = @as(c_uint, 0x0000002c);
pub const SDLK_MINUS = @as(c_uint, 0x0000002d);
pub const SDLK_PERIOD = @as(c_uint, 0x0000002e);
pub const SDLK_SLASH = @as(c_uint, 0x0000002f);
pub const SDLK_0 = @as(c_uint, 0x00000030);
pub const SDLK_1 = @as(c_uint, 0x00000031);
pub const SDLK_2 = @as(c_uint, 0x00000032);
pub const SDLK_3 = @as(c_uint, 0x00000033);
pub const SDLK_4 = @as(c_uint, 0x00000034);
pub const SDLK_5 = @as(c_uint, 0x00000035);
pub const SDLK_6 = @as(c_uint, 0x00000036);
pub const SDLK_7 = @as(c_uint, 0x00000037);
pub const SDLK_8 = @as(c_uint, 0x00000038);
pub const SDLK_9 = @as(c_uint, 0x00000039);
pub const SDLK_COLON = @as(c_uint, 0x0000003a);
pub const SDLK_SEMICOLON = @as(c_uint, 0x0000003b);
pub const SDLK_LESS = @as(c_uint, 0x0000003c);
pub const SDLK_EQUALS = @as(c_uint, 0x0000003d);
pub const SDLK_GREATER = @as(c_uint, 0x0000003e);
pub const SDLK_QUESTION = @as(c_uint, 0x0000003f);
pub const SDLK_AT = @as(c_uint, 0x00000040);
pub const SDLK_LEFTBRACKET = @as(c_uint, 0x0000005b);
pub const SDLK_BACKSLASH = @as(c_uint, 0x0000005c);
pub const SDLK_RIGHTBRACKET = @as(c_uint, 0x0000005d);
pub const SDLK_CARET = @as(c_uint, 0x0000005e);
pub const SDLK_UNDERSCORE = @as(c_uint, 0x0000005f);
pub const SDLK_GRAVE = @as(c_uint, 0x00000060);
pub const SDLK_A = @as(c_uint, 0x00000061);
pub const SDLK_B = @as(c_uint, 0x00000062);
pub const SDLK_C = @as(c_uint, 0x00000063);
pub const SDLK_D = @as(c_uint, 0x00000064);
pub const SDLK_E = @as(c_uint, 0x00000065);
pub const SDLK_F = @as(c_uint, 0x00000066);
pub const SDLK_G = @as(c_uint, 0x00000067);
pub const SDLK_H = @as(c_uint, 0x00000068);
pub const SDLK_I = @as(c_uint, 0x00000069);
pub const SDLK_J = @as(c_uint, 0x0000006a);
pub const SDLK_K = @as(c_uint, 0x0000006b);
pub const SDLK_L = @as(c_uint, 0x0000006c);
pub const SDLK_M = @as(c_uint, 0x0000006d);
pub const SDLK_N = @as(c_uint, 0x0000006e);
pub const SDLK_O = @as(c_uint, 0x0000006f);
pub const SDLK_P = @as(c_uint, 0x00000070);
pub const SDLK_Q = @as(c_uint, 0x00000071);
pub const SDLK_R = @as(c_uint, 0x00000072);
pub const SDLK_S = @as(c_uint, 0x00000073);
pub const SDLK_T = @as(c_uint, 0x00000074);
pub const SDLK_U = @as(c_uint, 0x00000075);
pub const SDLK_V = @as(c_uint, 0x00000076);
pub const SDLK_W = @as(c_uint, 0x00000077);
pub const SDLK_X = @as(c_uint, 0x00000078);
pub const SDLK_Y = @as(c_uint, 0x00000079);
pub const SDLK_Z = @as(c_uint, 0x0000007a);
pub const SDLK_LEFTBRACE = @as(c_uint, 0x0000007b);
pub const SDLK_PIPE = @as(c_uint, 0x0000007c);
pub const SDLK_RIGHTBRACE = @as(c_uint, 0x0000007d);
pub const SDLK_TILDE = @as(c_uint, 0x0000007e);
pub const SDLK_DELETE = @as(c_uint, 0x0000007f);
pub const SDLK_PLUSMINUS = @as(c_uint, 0x000000b1);
pub const SDLK_CAPSLOCK = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000039, .hex);
pub const SDLK_F1 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000003a, .hex);
pub const SDLK_F2 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000003b, .hex);
pub const SDLK_F3 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000003c, .hex);
pub const SDLK_F4 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000003d, .hex);
pub const SDLK_F5 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000003e, .hex);
pub const SDLK_F6 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000003f, .hex);
pub const SDLK_F7 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000040, .hex);
pub const SDLK_F8 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000041, .hex);
pub const SDLK_F9 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000042, .hex);
pub const SDLK_F10 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000043, .hex);
pub const SDLK_F11 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000044, .hex);
pub const SDLK_F12 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000045, .hex);
pub const SDLK_PRINTSCREEN = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000046, .hex);
pub const SDLK_SCROLLLOCK = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000047, .hex);
pub const SDLK_PAUSE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000048, .hex);
pub const SDLK_INSERT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000049, .hex);
pub const SDLK_HOME = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000004a, .hex);
pub const SDLK_PAGEUP = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000004b, .hex);
pub const SDLK_END = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000004d, .hex);
pub const SDLK_PAGEDOWN = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000004e, .hex);
pub const SDLK_RIGHT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000004f, .hex);
pub const SDLK_LEFT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000050, .hex);
pub const SDLK_DOWN = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000051, .hex);
pub const SDLK_UP = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000052, .hex);
pub const SDLK_NUMLOCKCLEAR = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000053, .hex);
pub const SDLK_KP_DIVIDE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000054, .hex);
pub const SDLK_KP_MULTIPLY = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000055, .hex);
pub const SDLK_KP_MINUS = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000056, .hex);
pub const SDLK_KP_PLUS = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000057, .hex);
pub const SDLK_KP_ENTER = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000058, .hex);
pub const SDLK_KP_1 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000059, .hex);
pub const SDLK_KP_2 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000005a, .hex);
pub const SDLK_KP_3 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000005b, .hex);
pub const SDLK_KP_4 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000005c, .hex);
pub const SDLK_KP_5 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000005d, .hex);
pub const SDLK_KP_6 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000005e, .hex);
pub const SDLK_KP_7 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000005f, .hex);
pub const SDLK_KP_8 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000060, .hex);
pub const SDLK_KP_9 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000061, .hex);
pub const SDLK_KP_0 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000062, .hex);
pub const SDLK_KP_PERIOD = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000063, .hex);
pub const SDLK_APPLICATION = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000065, .hex);
pub const SDLK_POWER = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000066, .hex);
pub const SDLK_KP_EQUALS = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000067, .hex);
pub const SDLK_F13 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000068, .hex);
pub const SDLK_F14 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000069, .hex);
pub const SDLK_F15 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000006a, .hex);
pub const SDLK_F16 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000006b, .hex);
pub const SDLK_F17 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000006c, .hex);
pub const SDLK_F18 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000006d, .hex);
pub const SDLK_F19 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000006e, .hex);
pub const SDLK_F20 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000006f, .hex);
pub const SDLK_F21 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000070, .hex);
pub const SDLK_F22 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000071, .hex);
pub const SDLK_F23 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000072, .hex);
pub const SDLK_F24 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000073, .hex);
pub const SDLK_EXECUTE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000074, .hex);
pub const SDLK_HELP = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000075, .hex);
pub const SDLK_MENU = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000076, .hex);
pub const SDLK_SELECT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000077, .hex);
pub const SDLK_STOP = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000078, .hex);
pub const SDLK_AGAIN = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000079, .hex);
pub const SDLK_UNDO = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000007a, .hex);
pub const SDLK_CUT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000007b, .hex);
pub const SDLK_COPY = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000007c, .hex);
pub const SDLK_PASTE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000007d, .hex);
pub const SDLK_FIND = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000007e, .hex);
pub const SDLK_MUTE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000007f, .hex);
pub const SDLK_VOLUMEUP = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000080, .hex);
pub const SDLK_VOLUMEDOWN = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000081, .hex);
pub const SDLK_KP_COMMA = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000085, .hex);
pub const SDLK_KP_EQUALSAS400 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000086, .hex);
pub const SDLK_ALTERASE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000099, .hex);
pub const SDLK_SYSREQ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000009a, .hex);
pub const SDLK_CANCEL = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000009b, .hex);
pub const SDLK_CLEAR = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000009c, .hex);
pub const SDLK_PRIOR = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000009d, .hex);
pub const SDLK_RETURN2 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000009e, .hex);
pub const SDLK_SEPARATOR = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000009f, .hex);
pub const SDLK_OUT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000a0, .hex);
pub const SDLK_OPER = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000a1, .hex);
pub const SDLK_CLEARAGAIN = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000a2, .hex);
pub const SDLK_CRSEL = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000a3, .hex);
pub const SDLK_EXSEL = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000a4, .hex);
pub const SDLK_KP_00 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000b0, .hex);
pub const SDLK_KP_000 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000b1, .hex);
pub const SDLK_THOUSANDSSEPARATOR = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000b2, .hex);
pub const SDLK_DECIMALSEPARATOR = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000b3, .hex);
pub const SDLK_CURRENCYUNIT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000b4, .hex);
pub const SDLK_CURRENCYSUBUNIT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000b5, .hex);
pub const SDLK_KP_LEFTPAREN = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000b6, .hex);
pub const SDLK_KP_RIGHTPAREN = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000b7, .hex);
pub const SDLK_KP_LEFTBRACE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000b8, .hex);
pub const SDLK_KP_RIGHTBRACE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000b9, .hex);
pub const SDLK_KP_TAB = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000ba, .hex);
pub const SDLK_KP_BACKSPACE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000bb, .hex);
pub const SDLK_KP_A = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000bc, .hex);
pub const SDLK_KP_B = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000bd, .hex);
pub const SDLK_KP_C = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000be, .hex);
pub const SDLK_KP_D = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000bf, .hex);
pub const SDLK_KP_E = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000c0, .hex);
pub const SDLK_KP_F = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000c1, .hex);
pub const SDLK_KP_XOR = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000c2, .hex);
pub const SDLK_KP_POWER = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000c3, .hex);
pub const SDLK_KP_PERCENT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000c4, .hex);
pub const SDLK_KP_LESS = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000c5, .hex);
pub const SDLK_KP_GREATER = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000c6, .hex);
pub const SDLK_KP_AMPERSAND = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000c7, .hex);
pub const SDLK_KP_DBLAMPERSAND = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000c8, .hex);
pub const SDLK_KP_VERTICALBAR = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000c9, .hex);
pub const SDLK_KP_DBLVERTICALBAR = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000ca, .hex);
pub const SDLK_KP_COLON = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000cb, .hex);
pub const SDLK_KP_HASH = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000cc, .hex);
pub const SDLK_KP_SPACE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000cd, .hex);
pub const SDLK_KP_AT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000ce, .hex);
pub const SDLK_KP_EXCLAM = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000cf, .hex);
pub const SDLK_KP_MEMSTORE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000d0, .hex);
pub const SDLK_KP_MEMRECALL = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000d1, .hex);
pub const SDLK_KP_MEMCLEAR = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000d2, .hex);
pub const SDLK_KP_MEMADD = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000d3, .hex);
pub const SDLK_KP_MEMSUBTRACT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000d4, .hex);
pub const SDLK_KP_MEMMULTIPLY = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000d5, .hex);
pub const SDLK_KP_MEMDIVIDE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000d6, .hex);
pub const SDLK_KP_PLUSMINUS = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000d7, .hex);
pub const SDLK_KP_CLEAR = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000d8, .hex);
pub const SDLK_KP_CLEARENTRY = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000d9, .hex);
pub const SDLK_KP_BINARY = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000da, .hex);
pub const SDLK_KP_OCTAL = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000db, .hex);
pub const SDLK_KP_DECIMAL = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000dc, .hex);
pub const SDLK_KP_HEXADECIMAL = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000dd, .hex);
pub const SDLK_LCTRL = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000e0, .hex);
pub const SDLK_LSHIFT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000e1, .hex);
pub const SDLK_LALT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000e2, .hex);
pub const SDLK_LGUI = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000e3, .hex);
pub const SDLK_RCTRL = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000e4, .hex);
pub const SDLK_RSHIFT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000e5, .hex);
pub const SDLK_RALT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000e6, .hex);
pub const SDLK_RGUI = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x400000e7, .hex);
pub const SDLK_MODE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000101, .hex);
pub const SDLK_SLEEP = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000102, .hex);
pub const SDLK_WAKE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000103, .hex);
pub const SDLK_CHANNEL_INCREMENT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000104, .hex);
pub const SDLK_CHANNEL_DECREMENT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000105, .hex);
pub const SDLK_MEDIA_PLAY = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000106, .hex);
pub const SDLK_MEDIA_PAUSE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000107, .hex);
pub const SDLK_MEDIA_RECORD = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000108, .hex);
pub const SDLK_MEDIA_FAST_FORWARD = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000109, .hex);
pub const SDLK_MEDIA_REWIND = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000010a, .hex);
pub const SDLK_MEDIA_NEXT_TRACK = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000010b, .hex);
pub const SDLK_MEDIA_PREVIOUS_TRACK = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000010c, .hex);
pub const SDLK_MEDIA_STOP = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000010d, .hex);
pub const SDLK_MEDIA_EJECT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000010e, .hex);
pub const SDLK_MEDIA_PLAY_PAUSE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000010f, .hex);
pub const SDLK_MEDIA_SELECT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000110, .hex);
pub const SDLK_AC_NEW = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000111, .hex);
pub const SDLK_AC_OPEN = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000112, .hex);
pub const SDLK_AC_CLOSE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000113, .hex);
pub const SDLK_AC_EXIT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000114, .hex);
pub const SDLK_AC_SAVE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000115, .hex);
pub const SDLK_AC_PRINT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000116, .hex);
pub const SDLK_AC_PROPERTIES = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000117, .hex);
pub const SDLK_AC_SEARCH = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000118, .hex);
pub const SDLK_AC_HOME = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000119, .hex);
pub const SDLK_AC_BACK = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000011a, .hex);
pub const SDLK_AC_FORWARD = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000011b, .hex);
pub const SDLK_AC_STOP = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000011c, .hex);
pub const SDLK_AC_REFRESH = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000011d, .hex);
pub const SDLK_AC_BOOKMARKS = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000011e, .hex);
pub const SDLK_SOFTLEFT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x4000011f, .hex);
pub const SDLK_SOFTRIGHT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000120, .hex);
pub const SDLK_CALL = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000121, .hex);
pub const SDLK_ENDCALL = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000122, .hex);
pub const SDLK_LEFT_TAB = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x20000001, .hex);
pub const SDLK_LEVEL5_SHIFT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x20000002, .hex);
pub const SDLK_MULTI_KEY_COMPOSE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x20000003, .hex);
pub const SDLK_LMETA = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x20000004, .hex);
pub const SDLK_RMETA = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x20000005, .hex);
pub const SDLK_LHYPER = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x20000006, .hex);
pub const SDLK_RHYPER = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x20000007, .hex);
pub const SDL_KMOD_NONE = @as(c_uint, 0x0000);
pub const SDL_KMOD_LSHIFT = @as(c_uint, 0x0001);
pub const SDL_KMOD_RSHIFT = @as(c_uint, 0x0002);
pub const SDL_KMOD_LEVEL5 = @as(c_uint, 0x0004);
pub const SDL_KMOD_LCTRL = @as(c_uint, 0x0040);
pub const SDL_KMOD_RCTRL = @as(c_uint, 0x0080);
pub const SDL_KMOD_LALT = @as(c_uint, 0x0100);
pub const SDL_KMOD_RALT = @as(c_uint, 0x0200);
pub const SDL_KMOD_LGUI = @as(c_uint, 0x0400);
pub const SDL_KMOD_RGUI = @as(c_uint, 0x0800);
pub const SDL_KMOD_NUM = @as(c_uint, 0x1000);
pub const SDL_KMOD_CAPS = @as(c_uint, 0x2000);
pub const SDL_KMOD_MODE = @as(c_uint, 0x4000);
pub const SDL_KMOD_SCROLL = @as(c_uint, 0x8000);
pub const SDL_KMOD_CTRL = SDL_KMOD_LCTRL | SDL_KMOD_RCTRL;
pub const SDL_KMOD_SHIFT = SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT;
pub const SDL_KMOD_ALT = SDL_KMOD_LALT | SDL_KMOD_RALT;
pub const SDL_KMOD_GUI = SDL_KMOD_LGUI | SDL_KMOD_RGUI;
pub const SDL_PROP_TEXTINPUT_TYPE_NUMBER = "SDL.textinput.type";
pub const SDL_PROP_TEXTINPUT_CAPITALIZATION_NUMBER = "SDL.textinput.capitalization";
pub const SDL_PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN = "SDL.textinput.autocorrect";
pub const SDL_PROP_TEXTINPUT_MULTILINE_BOOLEAN = "SDL.textinput.multiline";
pub const SDL_PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER = "SDL.textinput.android.inputtype";
pub const SDL_mouse_h_ = "";
pub const SDL_BUTTON_LEFT = @as(c_int, 1);
pub const SDL_BUTTON_MIDDLE = @as(c_int, 2);
pub const SDL_BUTTON_RIGHT = @as(c_int, 3);
pub const SDL_BUTTON_X1 = @as(c_int, 4);
pub const SDL_BUTTON_X2 = @as(c_int, 5);
pub inline fn SDL_BUTTON_MASK(X: anytype) @TypeOf(@as(c_uint, 1) << (X - @as(c_int, 1))) {
    _ = &X;
    return @as(c_uint, 1) << (X - @as(c_int, 1));
}
pub const SDL_BUTTON_LMASK = SDL_BUTTON_MASK(SDL_BUTTON_LEFT);
pub const SDL_BUTTON_MMASK = SDL_BUTTON_MASK(SDL_BUTTON_MIDDLE);
pub const SDL_BUTTON_RMASK = SDL_BUTTON_MASK(SDL_BUTTON_RIGHT);
pub const SDL_BUTTON_X1MASK = SDL_BUTTON_MASK(SDL_BUTTON_X1);
pub const SDL_BUTTON_X2MASK = SDL_BUTTON_MASK(SDL_BUTTON_X2);
pub const SDL_pen_h_ = "";
pub const SDL_touch_h_ = "";
pub const SDL_TOUCH_MOUSEID = @import("std").zig.c_translation.cast(SDL_MouseID, -@as(c_int, 1));
pub const SDL_MOUSE_TOUCHID = @import("std").zig.c_translation.cast(SDL_TouchID, -@as(c_int, 1));
pub const SDL_PEN_MOUSEID = @import("std").zig.c_translation.cast(SDL_MouseID, -@as(c_int, 2));
pub const SDL_PEN_TOUCHID = @import("std").zig.c_translation.cast(SDL_TouchID, -@as(c_int, 2));
pub const SDL_PEN_INPUT_DOWN = @as(c_uint, 1) << @as(c_int, 0);
pub const SDL_PEN_INPUT_BUTTON_1 = @as(c_uint, 1) << @as(c_int, 1);
pub const SDL_PEN_INPUT_BUTTON_2 = @as(c_uint, 1) << @as(c_int, 2);
pub const SDL_PEN_INPUT_BUTTON_3 = @as(c_uint, 1) << @as(c_int, 3);
pub const SDL_PEN_INPUT_BUTTON_4 = @as(c_uint, 1) << @as(c_int, 4);
pub const SDL_PEN_INPUT_BUTTON_5 = @as(c_uint, 1) << @as(c_int, 5);
pub const SDL_PEN_INPUT_ERASER_TIP = @as(c_uint, 1) << @as(c_int, 30);
pub const SDL_filesystem_h_ = "";
pub const SDL_GLOB_CASEINSENSITIVE = @as(c_uint, 1) << @as(c_int, 0);
pub const SDL_gpu_h_ = "";
pub const SDL_GPU_TEXTUREUSAGE_SAMPLER = @as(c_uint, 1) << @as(c_int, 0);
pub const SDL_GPU_TEXTUREUSAGE_COLOR_TARGET = @as(c_uint, 1) << @as(c_int, 1);
pub const SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET = @as(c_uint, 1) << @as(c_int, 2);
pub const SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ = @as(c_uint, 1) << @as(c_int, 3);
pub const SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ = @as(c_uint, 1) << @as(c_int, 4);
pub const SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE = @as(c_uint, 1) << @as(c_int, 5);
pub const SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE = @as(c_uint, 1) << @as(c_int, 6);
pub const SDL_GPU_BUFFERUSAGE_VERTEX = @as(c_uint, 1) << @as(c_int, 0);
pub const SDL_GPU_BUFFERUSAGE_INDEX = @as(c_uint, 1) << @as(c_int, 1);
pub const SDL_GPU_BUFFERUSAGE_INDIRECT = @as(c_uint, 1) << @as(c_int, 2);
pub const SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ = @as(c_uint, 1) << @as(c_int, 3);
pub const SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ = @as(c_uint, 1) << @as(c_int, 4);
pub const SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE = @as(c_uint, 1) << @as(c_int, 5);
pub const SDL_GPU_SHADERFORMAT_INVALID = @as(c_int, 0);
pub const SDL_GPU_SHADERFORMAT_PRIVATE = @as(c_uint, 1) << @as(c_int, 0);
pub const SDL_GPU_SHADERFORMAT_SPIRV = @as(c_uint, 1) << @as(c_int, 1);
pub const SDL_GPU_SHADERFORMAT_DXBC = @as(c_uint, 1) << @as(c_int, 2);
pub const SDL_GPU_SHADERFORMAT_DXIL = @as(c_uint, 1) << @as(c_int, 3);
pub const SDL_GPU_SHADERFORMAT_MSL = @as(c_uint, 1) << @as(c_int, 4);
pub const SDL_GPU_SHADERFORMAT_METALLIB = @as(c_uint, 1) << @as(c_int, 5);
pub const SDL_GPU_COLORCOMPONENT_R = @as(c_uint, 1) << @as(c_int, 0);
pub const SDL_GPU_COLORCOMPONENT_G = @as(c_uint, 1) << @as(c_int, 1);
pub const SDL_GPU_COLORCOMPONENT_B = @as(c_uint, 1) << @as(c_int, 2);
pub const SDL_GPU_COLORCOMPONENT_A = @as(c_uint, 1) << @as(c_int, 3);
pub const SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN = "SDL.gpu.device.create.debugmode";
pub const SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN = "SDL.gpu.device.create.preferlowpower";
pub const SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING = "SDL.gpu.device.create.name";
pub const SDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN = "SDL.gpu.device.create.shaders.private";
pub const SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN = "SDL.gpu.device.create.shaders.spirv";
pub const SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN = "SDL.gpu.device.create.shaders.dxbc";
pub const SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN = "SDL.gpu.device.create.shaders.dxil";
pub const SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN = "SDL.gpu.device.create.shaders.msl";
pub const SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN = "SDL.gpu.device.create.shaders.metallib";
pub const SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING = "SDL.gpu.device.create.d3d12.semantic";
pub const SDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING = "SDL.gpu.computepipeline.create.name";
pub const SDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING = "SDL.gpu.graphicspipeline.create.name";
pub const SDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING = "SDL.gpu.sampler.create.name";
pub const SDL_PROP_GPU_SHADER_CREATE_NAME_STRING = "SDL.gpu.shader.create.name";
pub const SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT = "SDL.gpu.texture.create.d3d12.clear.r";
pub const SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT = "SDL.gpu.texture.create.d3d12.clear.g";
pub const SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT = "SDL.gpu.texture.create.d3d12.clear.b";
pub const SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT = "SDL.gpu.texture.create.d3d12.clear.a";
pub const SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT = "SDL.gpu.texture.create.d3d12.clear.depth";
pub const SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER = "SDL.gpu.texture.create.d3d12.clear.stencil";
pub const SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING = "SDL.gpu.texture.create.name";
pub const SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING = "SDL.gpu.buffer.create.name";
pub const SDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING = "SDL.gpu.transferbuffer.create.name";
pub const SDL_haptic_h_ = "";
pub const SDL_HAPTIC_CONSTANT = @as(c_uint, 1) << @as(c_int, 0);
pub const SDL_HAPTIC_SINE = @as(c_uint, 1) << @as(c_int, 1);
pub const SDL_HAPTIC_SQUARE = @as(c_uint, 1) << @as(c_int, 2);
pub const SDL_HAPTIC_TRIANGLE = @as(c_uint, 1) << @as(c_int, 3);
pub const SDL_HAPTIC_SAWTOOTHUP = @as(c_uint, 1) << @as(c_int, 4);
pub const SDL_HAPTIC_SAWTOOTHDOWN = @as(c_uint, 1) << @as(c_int, 5);
pub const SDL_HAPTIC_RAMP = @as(c_uint, 1) << @as(c_int, 6);
pub const SDL_HAPTIC_SPRING = @as(c_uint, 1) << @as(c_int, 7);
pub const SDL_HAPTIC_DAMPER = @as(c_uint, 1) << @as(c_int, 8);
pub const SDL_HAPTIC_INERTIA = @as(c_uint, 1) << @as(c_int, 9);
pub const SDL_HAPTIC_FRICTION = @as(c_uint, 1) << @as(c_int, 10);
pub const SDL_HAPTIC_LEFTRIGHT = @as(c_uint, 1) << @as(c_int, 11);
pub const SDL_HAPTIC_RESERVED1 = @as(c_uint, 1) << @as(c_int, 12);
pub const SDL_HAPTIC_RESERVED2 = @as(c_uint, 1) << @as(c_int, 13);
pub const SDL_HAPTIC_RESERVED3 = @as(c_uint, 1) << @as(c_int, 14);
pub const SDL_HAPTIC_CUSTOM = @as(c_uint, 1) << @as(c_int, 15);
pub const SDL_HAPTIC_GAIN = @as(c_uint, 1) << @as(c_int, 16);
pub const SDL_HAPTIC_AUTOCENTER = @as(c_uint, 1) << @as(c_int, 17);
pub const SDL_HAPTIC_STATUS = @as(c_uint, 1) << @as(c_int, 18);
pub const SDL_HAPTIC_PAUSE = @as(c_uint, 1) << @as(c_int, 19);
pub const SDL_HAPTIC_POLAR = @as(c_int, 0);
pub const SDL_HAPTIC_CARTESIAN = @as(c_int, 1);
pub const SDL_HAPTIC_SPHERICAL = @as(c_int, 2);
pub const SDL_HAPTIC_STEERING_AXIS = @as(c_int, 3);
pub const SDL_HAPTIC_INFINITY = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const SDL_hidapi_h_ = "";
pub const SDL_hints_h_ = "";
pub const SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED = "SDL_ALLOW_ALT_TAB_WHILE_GRABBED";
pub const SDL_HINT_ANDROID_ALLOW_RECREATE_ACTIVITY = "SDL_ANDROID_ALLOW_RECREATE_ACTIVITY";
pub const SDL_HINT_ANDROID_BLOCK_ON_PAUSE = "SDL_ANDROID_BLOCK_ON_PAUSE";
pub const SDL_HINT_ANDROID_LOW_LATENCY_AUDIO = "SDL_ANDROID_LOW_LATENCY_AUDIO";
pub const SDL_HINT_ANDROID_TRAP_BACK_BUTTON = "SDL_ANDROID_TRAP_BACK_BUTTON";
pub const SDL_HINT_APP_ID = "SDL_APP_ID";
pub const SDL_HINT_APP_NAME = "SDL_APP_NAME";
pub const SDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS = "SDL_APPLE_TV_CONTROLLER_UI_EVENTS";
pub const SDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION = "SDL_APPLE_TV_REMOTE_ALLOW_ROTATION";
pub const SDL_HINT_AUDIO_ALSA_DEFAULT_DEVICE = "SDL_AUDIO_ALSA_DEFAULT_DEVICE";
pub const SDL_HINT_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE = "SDL_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE";
pub const SDL_HINT_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE = "SDL_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE";
pub const SDL_HINT_AUDIO_CATEGORY = "SDL_AUDIO_CATEGORY";
pub const SDL_HINT_AUDIO_CHANNELS = "SDL_AUDIO_CHANNELS";
pub const SDL_HINT_AUDIO_DEVICE_APP_ICON_NAME = "SDL_AUDIO_DEVICE_APP_ICON_NAME";
pub const SDL_HINT_AUDIO_DEVICE_SAMPLE_FRAMES = "SDL_AUDIO_DEVICE_SAMPLE_FRAMES";
pub const SDL_HINT_AUDIO_DEVICE_STREAM_NAME = "SDL_AUDIO_DEVICE_STREAM_NAME";
pub const SDL_HINT_AUDIO_DEVICE_STREAM_ROLE = "SDL_AUDIO_DEVICE_STREAM_ROLE";
pub const SDL_HINT_AUDIO_DISK_INPUT_FILE = "SDL_AUDIO_DISK_INPUT_FILE";
pub const SDL_HINT_AUDIO_DISK_OUTPUT_FILE = "SDL_AUDIO_DISK_OUTPUT_FILE";
pub const SDL_HINT_AUDIO_DISK_TIMESCALE = "SDL_AUDIO_DISK_TIMESCALE";
pub const SDL_HINT_AUDIO_DRIVER = "SDL_AUDIO_DRIVER";
pub const SDL_HINT_AUDIO_DUMMY_TIMESCALE = "SDL_AUDIO_DUMMY_TIMESCALE";
pub const SDL_HINT_AUDIO_FORMAT = "SDL_AUDIO_FORMAT";
pub const SDL_HINT_AUDIO_FREQUENCY = "SDL_AUDIO_FREQUENCY";
pub const SDL_HINT_AUDIO_INCLUDE_MONITORS = "SDL_AUDIO_INCLUDE_MONITORS";
pub const SDL_HINT_AUTO_UPDATE_JOYSTICKS = "SDL_AUTO_UPDATE_JOYSTICKS";
pub const SDL_HINT_AUTO_UPDATE_SENSORS = "SDL_AUTO_UPDATE_SENSORS";
pub const SDL_HINT_BMP_SAVE_LEGACY_FORMAT = "SDL_BMP_SAVE_LEGACY_FORMAT";
pub const SDL_HINT_CAMERA_DRIVER = "SDL_CAMERA_DRIVER";
pub const SDL_HINT_CPU_FEATURE_MASK = "SDL_CPU_FEATURE_MASK";
pub const SDL_HINT_JOYSTICK_DIRECTINPUT = "SDL_JOYSTICK_DIRECTINPUT";
pub const SDL_HINT_FILE_DIALOG_DRIVER = "SDL_FILE_DIALOG_DRIVER";
pub const SDL_HINT_DISPLAY_USABLE_BOUNDS = "SDL_DISPLAY_USABLE_BOUNDS";
pub const SDL_HINT_EMSCRIPTEN_ASYNCIFY = "SDL_EMSCRIPTEN_ASYNCIFY";
pub const SDL_HINT_EMSCRIPTEN_CANVAS_SELECTOR = "SDL_EMSCRIPTEN_CANVAS_SELECTOR";
pub const SDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT = "SDL_EMSCRIPTEN_KEYBOARD_ELEMENT";
pub const SDL_HINT_ENABLE_SCREEN_KEYBOARD = "SDL_ENABLE_SCREEN_KEYBOARD";
pub const SDL_HINT_EVDEV_DEVICES = "SDL_EVDEV_DEVICES";
pub const SDL_HINT_EVENT_LOGGING = "SDL_EVENT_LOGGING";
pub const SDL_HINT_FORCE_RAISEWINDOW = "SDL_FORCE_RAISEWINDOW";
pub const SDL_HINT_FRAMEBUFFER_ACCELERATION = "SDL_FRAMEBUFFER_ACCELERATION";
pub const SDL_HINT_GAMECONTROLLERCONFIG = "SDL_GAMECONTROLLERCONFIG";
pub const SDL_HINT_GAMECONTROLLERCONFIG_FILE = "SDL_GAMECONTROLLERCONFIG_FILE";
pub const SDL_HINT_GAMECONTROLLERTYPE = "SDL_GAMECONTROLLERTYPE";
pub const SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES = "SDL_GAMECONTROLLER_IGNORE_DEVICES";
pub const SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT = "SDL_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT";
pub const SDL_HINT_GAMECONTROLLER_SENSOR_FUSION = "SDL_GAMECONTROLLER_SENSOR_FUSION";
pub const SDL_HINT_GDK_TEXTINPUT_DEFAULT_TEXT = "SDL_GDK_TEXTINPUT_DEFAULT_TEXT";
pub const SDL_HINT_GDK_TEXTINPUT_DESCRIPTION = "SDL_GDK_TEXTINPUT_DESCRIPTION";
pub const SDL_HINT_GDK_TEXTINPUT_MAX_LENGTH = "SDL_GDK_TEXTINPUT_MAX_LENGTH";
pub const SDL_HINT_GDK_TEXTINPUT_SCOPE = "SDL_GDK_TEXTINPUT_SCOPE";
pub const SDL_HINT_GDK_TEXTINPUT_TITLE = "SDL_GDK_TEXTINPUT_TITLE";
pub const SDL_HINT_HIDAPI_LIBUSB = "SDL_HIDAPI_LIBUSB";
pub const SDL_HINT_HIDAPI_LIBUSB_WHITELIST = "SDL_HIDAPI_LIBUSB_WHITELIST";
pub const SDL_HINT_HIDAPI_UDEV = "SDL_HIDAPI_UDEV";
pub const SDL_HINT_GPU_DRIVER = "SDL_GPU_DRIVER";
pub const SDL_HINT_HIDAPI_ENUMERATE_ONLY_CONTROLLERS = "SDL_HIDAPI_ENUMERATE_ONLY_CONTROLLERS";
pub const SDL_HINT_HIDAPI_IGNORE_DEVICES = "SDL_HIDAPI_IGNORE_DEVICES";
pub const SDL_HINT_IME_IMPLEMENTED_UI = "SDL_IME_IMPLEMENTED_UI";
pub const SDL_HINT_IOS_HIDE_HOME_INDICATOR = "SDL_IOS_HIDE_HOME_INDICATOR";
pub const SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS = "SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS";
pub const SDL_HINT_JOYSTICK_ARCADESTICK_DEVICES = "SDL_JOYSTICK_ARCADESTICK_DEVICES";
pub const SDL_HINT_JOYSTICK_ARCADESTICK_DEVICES_EXCLUDED = "SDL_JOYSTICK_ARCADESTICK_DEVICES_EXCLUDED";
pub const SDL_HINT_JOYSTICK_BLACKLIST_DEVICES = "SDL_JOYSTICK_BLACKLIST_DEVICES";
pub const SDL_HINT_JOYSTICK_BLACKLIST_DEVICES_EXCLUDED = "SDL_JOYSTICK_BLACKLIST_DEVICES_EXCLUDED";
pub const SDL_HINT_JOYSTICK_DEVICE = "SDL_JOYSTICK_DEVICE";
pub const SDL_HINT_JOYSTICK_ENHANCED_REPORTS = "SDL_JOYSTICK_ENHANCED_REPORTS";
pub const SDL_HINT_JOYSTICK_FLIGHTSTICK_DEVICES = "SDL_JOYSTICK_FLIGHTSTICK_DEVICES";
pub const SDL_HINT_JOYSTICK_FLIGHTSTICK_DEVICES_EXCLUDED = "SDL_JOYSTICK_FLIGHTSTICK_DEVICES_EXCLUDED";
pub const SDL_HINT_JOYSTICK_GAMEINPUT = "SDL_JOYSTICK_GAMEINPUT";
pub const SDL_HINT_JOYSTICK_GAMECUBE_DEVICES = "SDL_JOYSTICK_GAMECUBE_DEVICES";
pub const SDL_HINT_JOYSTICK_GAMECUBE_DEVICES_EXCLUDED = "SDL_JOYSTICK_GAMECUBE_DEVICES_EXCLUDED";
pub const SDL_HINT_JOYSTICK_HIDAPI = "SDL_JOYSTICK_HIDAPI";
pub const SDL_HINT_JOYSTICK_HIDAPI_COMBINE_JOY_CONS = "SDL_JOYSTICK_HIDAPI_COMBINE_JOY_CONS";
pub const SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE = "SDL_JOYSTICK_HIDAPI_GAMECUBE";
pub const SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE = "SDL_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE";
pub const SDL_HINT_JOYSTICK_HIDAPI_JOY_CONS = "SDL_JOYSTICK_HIDAPI_JOY_CONS";
pub const SDL_HINT_JOYSTICK_HIDAPI_JOYCON_HOME_LED = "SDL_JOYSTICK_HIDAPI_JOYCON_HOME_LED";
pub const SDL_HINT_JOYSTICK_HIDAPI_LUNA = "SDL_JOYSTICK_HIDAPI_LUNA";
pub const SDL_HINT_JOYSTICK_HIDAPI_NINTENDO_CLASSIC = "SDL_JOYSTICK_HIDAPI_NINTENDO_CLASSIC";
pub const SDL_HINT_JOYSTICK_HIDAPI_PS3 = "SDL_JOYSTICK_HIDAPI_PS3";
pub const SDL_HINT_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER = "SDL_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER";
pub const SDL_HINT_JOYSTICK_HIDAPI_PS4 = "SDL_JOYSTICK_HIDAPI_PS4";
pub const SDL_HINT_JOYSTICK_HIDAPI_PS4_REPORT_INTERVAL = "SDL_JOYSTICK_HIDAPI_PS4_REPORT_INTERVAL";
pub const SDL_HINT_JOYSTICK_HIDAPI_PS5 = "SDL_JOYSTICK_HIDAPI_PS5";
pub const SDL_HINT_JOYSTICK_HIDAPI_PS5_PLAYER_LED = "SDL_JOYSTICK_HIDAPI_PS5_PLAYER_LED";
pub const SDL_HINT_JOYSTICK_HIDAPI_SHIELD = "SDL_JOYSTICK_HIDAPI_SHIELD";
pub const SDL_HINT_JOYSTICK_HIDAPI_STADIA = "SDL_JOYSTICK_HIDAPI_STADIA";
pub const SDL_HINT_JOYSTICK_HIDAPI_STEAM = "SDL_JOYSTICK_HIDAPI_STEAM";
pub const SDL_HINT_JOYSTICK_HIDAPI_STEAM_HOME_LED = "SDL_JOYSTICK_HIDAPI_STEAM_HOME_LED";
pub const SDL_HINT_JOYSTICK_HIDAPI_STEAMDECK = "SDL_JOYSTICK_HIDAPI_STEAMDECK";
pub const SDL_HINT_JOYSTICK_HIDAPI_STEAM_HORI = "SDL_JOYSTICK_HIDAPI_STEAM_HORI";
pub const SDL_HINT_JOYSTICK_HIDAPI_SWITCH = "SDL_JOYSTICK_HIDAPI_SWITCH";
pub const SDL_HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED = "SDL_JOYSTICK_HIDAPI_SWITCH_HOME_LED";
pub const SDL_HINT_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED = "SDL_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED";
pub const SDL_HINT_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS = "SDL_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS";
pub const SDL_HINT_JOYSTICK_HIDAPI_WII = "SDL_JOYSTICK_HIDAPI_WII";
pub const SDL_HINT_JOYSTICK_HIDAPI_WII_PLAYER_LED = "SDL_JOYSTICK_HIDAPI_WII_PLAYER_LED";
pub const SDL_HINT_JOYSTICK_HIDAPI_XBOX = "SDL_JOYSTICK_HIDAPI_XBOX";
pub const SDL_HINT_JOYSTICK_HIDAPI_XBOX_360 = "SDL_JOYSTICK_HIDAPI_XBOX_360";
pub const SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED = "SDL_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED";
pub const SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_WIRELESS = "SDL_JOYSTICK_HIDAPI_XBOX_360_WIRELESS";
pub const SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE = "SDL_JOYSTICK_HIDAPI_XBOX_ONE";
pub const SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED = "SDL_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED";
pub const SDL_HINT_JOYSTICK_IOKIT = "SDL_JOYSTICK_IOKIT";
pub const SDL_HINT_JOYSTICK_LINUX_CLASSIC = "SDL_JOYSTICK_LINUX_CLASSIC";
pub const SDL_HINT_JOYSTICK_LINUX_DEADZONES = "SDL_JOYSTICK_LINUX_DEADZONES";
pub const SDL_HINT_JOYSTICK_LINUX_DIGITAL_HATS = "SDL_JOYSTICK_LINUX_DIGITAL_HATS";
pub const SDL_HINT_JOYSTICK_LINUX_HAT_DEADZONES = "SDL_JOYSTICK_LINUX_HAT_DEADZONES";
pub const SDL_HINT_JOYSTICK_MFI = "SDL_JOYSTICK_MFI";
pub const SDL_HINT_JOYSTICK_RAWINPUT = "SDL_JOYSTICK_RAWINPUT";
pub const SDL_HINT_JOYSTICK_RAWINPUT_CORRELATE_XINPUT = "SDL_JOYSTICK_RAWINPUT_CORRELATE_XINPUT";
pub const SDL_HINT_JOYSTICK_ROG_CHAKRAM = "SDL_JOYSTICK_ROG_CHAKRAM";
pub const SDL_HINT_JOYSTICK_THREAD = "SDL_JOYSTICK_THREAD";
pub const SDL_HINT_JOYSTICK_THROTTLE_DEVICES = "SDL_JOYSTICK_THROTTLE_DEVICES";
pub const SDL_HINT_JOYSTICK_THROTTLE_DEVICES_EXCLUDED = "SDL_JOYSTICK_THROTTLE_DEVICES_EXCLUDED";
pub const SDL_HINT_JOYSTICK_WGI = "SDL_JOYSTICK_WGI";
pub const SDL_HINT_JOYSTICK_WHEEL_DEVICES = "SDL_JOYSTICK_WHEEL_DEVICES";
pub const SDL_HINT_JOYSTICK_WHEEL_DEVICES_EXCLUDED = "SDL_JOYSTICK_WHEEL_DEVICES_EXCLUDED";
pub const SDL_HINT_JOYSTICK_ZERO_CENTERED_DEVICES = "SDL_JOYSTICK_ZERO_CENTERED_DEVICES";
pub const SDL_HINT_JOYSTICK_HAPTIC_AXES = "SDL_JOYSTICK_HAPTIC_AXES";
pub const SDL_HINT_KEYCODE_OPTIONS = "SDL_KEYCODE_OPTIONS";
pub const SDL_HINT_KMSDRM_DEVICE_INDEX = "SDL_KMSDRM_DEVICE_INDEX";
pub const SDL_HINT_KMSDRM_REQUIRE_DRM_MASTER = "SDL_KMSDRM_REQUIRE_DRM_MASTER";
pub const SDL_HINT_LOGGING = "SDL_LOGGING";
pub const SDL_HINT_MAC_BACKGROUND_APP = "SDL_MAC_BACKGROUND_APP";
pub const SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK = "SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK";
pub const SDL_HINT_MAC_OPENGL_ASYNC_DISPATCH = "SDL_MAC_OPENGL_ASYNC_DISPATCH";
pub const SDL_HINT_MAC_OPTION_AS_ALT = "SDL_MAC_OPTION_AS_ALT";
pub const SDL_HINT_MAC_SCROLL_MOMENTUM = "SDL_MAC_SCROLL_MOMENTUM";
pub const SDL_HINT_MAIN_CALLBACK_RATE = "SDL_MAIN_CALLBACK_RATE";
pub const SDL_HINT_MOUSE_AUTO_CAPTURE = "SDL_MOUSE_AUTO_CAPTURE";
pub const SDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS = "SDL_MOUSE_DOUBLE_CLICK_RADIUS";
pub const SDL_HINT_MOUSE_DOUBLE_CLICK_TIME = "SDL_MOUSE_DOUBLE_CLICK_TIME";
pub const SDL_HINT_MOUSE_DEFAULT_SYSTEM_CURSOR = "SDL_MOUSE_DEFAULT_SYSTEM_CURSOR";
pub const SDL_HINT_MOUSE_EMULATE_WARP_WITH_RELATIVE = "SDL_MOUSE_EMULATE_WARP_WITH_RELATIVE";
pub const SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH = "SDL_MOUSE_FOCUS_CLICKTHROUGH";
pub const SDL_HINT_MOUSE_NORMAL_SPEED_SCALE = "SDL_MOUSE_NORMAL_SPEED_SCALE";
pub const SDL_HINT_MOUSE_RELATIVE_MODE_CENTER = "SDL_MOUSE_RELATIVE_MODE_CENTER";
pub const SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE = "SDL_MOUSE_RELATIVE_SPEED_SCALE";
pub const SDL_HINT_MOUSE_RELATIVE_SYSTEM_SCALE = "SDL_MOUSE_RELATIVE_SYSTEM_SCALE";
pub const SDL_HINT_MOUSE_RELATIVE_WARP_MOTION = "SDL_MOUSE_RELATIVE_WARP_MOTION";
pub const SDL_HINT_MOUSE_RELATIVE_CURSOR_VISIBLE = "SDL_MOUSE_RELATIVE_CURSOR_VISIBLE";
pub const SDL_HINT_MOUSE_TOUCH_EVENTS = "SDL_MOUSE_TOUCH_EVENTS";
pub const SDL_HINT_MUTE_CONSOLE_KEYBOARD = "SDL_MUTE_CONSOLE_KEYBOARD";
pub const SDL_HINT_NO_SIGNAL_HANDLERS = "SDL_NO_SIGNAL_HANDLERS";
pub const SDL_HINT_OPENGL_LIBRARY = "SDL_OPENGL_LIBRARY";
pub const SDL_HINT_EGL_LIBRARY = "SDL_EGL_LIBRARY";
pub const SDL_HINT_OPENGL_ES_DRIVER = "SDL_OPENGL_ES_DRIVER";
pub const SDL_HINT_OPENVR_LIBRARY = "SDL_OPENVR_LIBRARY";
pub const SDL_HINT_ORIENTATIONS = "SDL_ORIENTATIONS";
pub const SDL_HINT_POLL_SENTINEL = "SDL_POLL_SENTINEL";
pub const SDL_HINT_PREFERRED_LOCALES = "SDL_PREFERRED_LOCALES";
pub const SDL_HINT_QUIT_ON_LAST_WINDOW_CLOSE = "SDL_QUIT_ON_LAST_WINDOW_CLOSE";
pub const SDL_HINT_RENDER_DIRECT3D_THREADSAFE = "SDL_RENDER_DIRECT3D_THREADSAFE";
pub const SDL_HINT_RENDER_DIRECT3D11_DEBUG = "SDL_RENDER_DIRECT3D11_DEBUG";
pub const SDL_HINT_RENDER_VULKAN_DEBUG = "SDL_RENDER_VULKAN_DEBUG";
pub const SDL_HINT_RENDER_GPU_DEBUG = "SDL_RENDER_GPU_DEBUG";
pub const SDL_HINT_RENDER_GPU_LOW_POWER = "SDL_RENDER_GPU_LOW_POWER";
pub const SDL_HINT_RENDER_DRIVER = "SDL_RENDER_DRIVER";
pub const SDL_HINT_RENDER_LINE_METHOD = "SDL_RENDER_LINE_METHOD";
pub const SDL_HINT_RENDER_METAL_PREFER_LOW_POWER_DEVICE = "SDL_RENDER_METAL_PREFER_LOW_POWER_DEVICE";
pub const SDL_HINT_RENDER_VSYNC = "SDL_RENDER_VSYNC";
pub const SDL_HINT_RETURN_KEY_HIDES_IME = "SDL_RETURN_KEY_HIDES_IME";
pub const SDL_HINT_ROG_GAMEPAD_MICE = "SDL_ROG_GAMEPAD_MICE";
pub const SDL_HINT_ROG_GAMEPAD_MICE_EXCLUDED = "SDL_ROG_GAMEPAD_MICE_EXCLUDED";
pub const SDL_HINT_RPI_VIDEO_LAYER = "SDL_RPI_VIDEO_LAYER";
pub const SDL_HINT_SCREENSAVER_INHIBIT_ACTIVITY_NAME = "SDL_SCREENSAVER_INHIBIT_ACTIVITY_NAME";
pub const SDL_HINT_SHUTDOWN_DBUS_ON_QUIT = "SDL_SHUTDOWN_DBUS_ON_QUIT";
pub const SDL_HINT_STORAGE_TITLE_DRIVER = "SDL_STORAGE_TITLE_DRIVER";
pub const SDL_HINT_STORAGE_USER_DRIVER = "SDL_STORAGE_USER_DRIVER";
pub const SDL_HINT_THREAD_FORCE_REALTIME_TIME_CRITICAL = "SDL_THREAD_FORCE_REALTIME_TIME_CRITICAL";
pub const SDL_HINT_THREAD_PRIORITY_POLICY = "SDL_THREAD_PRIORITY_POLICY";
pub const SDL_HINT_TIMER_RESOLUTION = "SDL_TIMER_RESOLUTION";
pub const SDL_HINT_TOUCH_MOUSE_EVENTS = "SDL_TOUCH_MOUSE_EVENTS";
pub const SDL_HINT_TRACKPAD_IS_TOUCH_ONLY = "SDL_TRACKPAD_IS_TOUCH_ONLY";
pub const SDL_HINT_TV_REMOTE_AS_JOYSTICK = "SDL_TV_REMOTE_AS_JOYSTICK";
pub const SDL_HINT_VIDEO_ALLOW_SCREENSAVER = "SDL_VIDEO_ALLOW_SCREENSAVER";
pub const SDL_HINT_VIDEO_DISPLAY_PRIORITY = "SDL_VIDEO_DISPLAY_PRIORITY";
pub const SDL_HINT_VIDEO_DOUBLE_BUFFER = "SDL_VIDEO_DOUBLE_BUFFER";
pub const SDL_HINT_VIDEO_DRIVER = "SDL_VIDEO_DRIVER";
pub const SDL_HINT_VIDEO_DUMMY_SAVE_FRAMES = "SDL_VIDEO_DUMMY_SAVE_FRAMES";
pub const SDL_HINT_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK = "SDL_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK";
pub const SDL_HINT_VIDEO_FORCE_EGL = "SDL_VIDEO_FORCE_EGL";
pub const SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES = "SDL_VIDEO_MAC_FULLSCREEN_SPACES";
pub const SDL_HINT_VIDEO_MAC_FULLSCREEN_MENU_VISIBILITY = "SDL_VIDEO_MAC_FULLSCREEN_MENU_VISIBILITY";
pub const SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS = "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS";
pub const SDL_HINT_VIDEO_OFFSCREEN_SAVE_FRAMES = "SDL_VIDEO_OFFSCREEN_SAVE_FRAMES";
pub const SDL_HINT_VIDEO_SYNC_WINDOW_OPERATIONS = "SDL_VIDEO_SYNC_WINDOW_OPERATIONS";
pub const SDL_HINT_VIDEO_WAYLAND_ALLOW_LIBDECOR = "SDL_VIDEO_WAYLAND_ALLOW_LIBDECOR";
pub const SDL_HINT_VIDEO_WAYLAND_MODE_EMULATION = "SDL_VIDEO_WAYLAND_MODE_EMULATION";
pub const SDL_HINT_VIDEO_WAYLAND_MODE_SCALING = "SDL_VIDEO_WAYLAND_MODE_SCALING";
pub const SDL_HINT_VIDEO_WAYLAND_PREFER_LIBDECOR = "SDL_VIDEO_WAYLAND_PREFER_LIBDECOR";
pub const SDL_HINT_VIDEO_WAYLAND_SCALE_TO_DISPLAY = "SDL_VIDEO_WAYLAND_SCALE_TO_DISPLAY";
pub const SDL_HINT_VIDEO_WIN_D3DCOMPILER = "SDL_VIDEO_WIN_D3DCOMPILER";
pub const SDL_HINT_VIDEO_X11_EXTERNAL_WINDOW_INPUT = "SDL_VIDEO_X11_EXTERNAL_WINDOW_INPUT";
pub const SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR = "SDL_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR";
pub const SDL_HINT_VIDEO_X11_NET_WM_PING = "SDL_VIDEO_X11_NET_WM_PING";
pub const SDL_HINT_VIDEO_X11_NODIRECTCOLOR = "SDL_VIDEO_X11_NODIRECTCOLOR";
pub const SDL_HINT_VIDEO_X11_SCALING_FACTOR = "SDL_VIDEO_X11_SCALING_FACTOR";
pub const SDL_HINT_VIDEO_X11_VISUALID = "SDL_VIDEO_X11_VISUALID";
pub const SDL_HINT_VIDEO_X11_WINDOW_VISUALID = "SDL_VIDEO_X11_WINDOW_VISUALID";
pub const SDL_HINT_VIDEO_X11_XRANDR = "SDL_VIDEO_X11_XRANDR";
pub const SDL_HINT_VITA_ENABLE_BACK_TOUCH = "SDL_VITA_ENABLE_BACK_TOUCH";
pub const SDL_HINT_VITA_ENABLE_FRONT_TOUCH = "SDL_VITA_ENABLE_FRONT_TOUCH";
pub const SDL_HINT_VITA_MODULE_PATH = "SDL_VITA_MODULE_PATH";
pub const SDL_HINT_VITA_PVR_INIT = "SDL_VITA_PVR_INIT";
pub const SDL_HINT_VITA_RESOLUTION = "SDL_VITA_RESOLUTION";
pub const SDL_HINT_VITA_PVR_OPENGL = "SDL_VITA_PVR_OPENGL";
pub const SDL_HINT_VITA_TOUCH_MOUSE_DEVICE = "SDL_VITA_TOUCH_MOUSE_DEVICE";
pub const SDL_HINT_VULKAN_DISPLAY = "SDL_VULKAN_DISPLAY";
pub const SDL_HINT_VULKAN_LIBRARY = "SDL_VULKAN_LIBRARY";
pub const SDL_HINT_WAVE_FACT_CHUNK = "SDL_WAVE_FACT_CHUNK";
pub const SDL_HINT_WAVE_CHUNK_LIMIT = "SDL_WAVE_CHUNK_LIMIT";
pub const SDL_HINT_WAVE_RIFF_CHUNK_SIZE = "SDL_WAVE_RIFF_CHUNK_SIZE";
pub const SDL_HINT_WAVE_TRUNCATION = "SDL_WAVE_TRUNCATION";
pub const SDL_HINT_WINDOW_ACTIVATE_WHEN_RAISED = "SDL_WINDOW_ACTIVATE_WHEN_RAISED";
pub const SDL_HINT_WINDOW_ACTIVATE_WHEN_SHOWN = "SDL_WINDOW_ACTIVATE_WHEN_SHOWN";
pub const SDL_HINT_WINDOW_ALLOW_TOPMOST = "SDL_WINDOW_ALLOW_TOPMOST";
pub const SDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN = "SDL_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN";
pub const SDL_HINT_WINDOWS_CLOSE_ON_ALT_F4 = "SDL_WINDOWS_CLOSE_ON_ALT_F4";
pub const SDL_HINT_WINDOWS_ENABLE_MENU_MNEMONICS = "SDL_WINDOWS_ENABLE_MENU_MNEMONICS";
pub const SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP = "SDL_WINDOWS_ENABLE_MESSAGELOOP";
pub const SDL_HINT_WINDOWS_GAMEINPUT = "SDL_WINDOWS_GAMEINPUT";
pub const SDL_HINT_WINDOWS_RAW_KEYBOARD = "SDL_WINDOWS_RAW_KEYBOARD";
pub const SDL_HINT_WINDOWS_FORCE_SEMAPHORE_KERNEL = "SDL_WINDOWS_FORCE_SEMAPHORE_KERNEL";
pub const SDL_HINT_WINDOWS_INTRESOURCE_ICON = "SDL_WINDOWS_INTRESOURCE_ICON";
pub const SDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL = "SDL_WINDOWS_INTRESOURCE_ICON_SMALL";
pub const SDL_HINT_WINDOWS_USE_D3D9EX = "SDL_WINDOWS_USE_D3D9EX";
pub const SDL_HINT_WINDOWS_ERASE_BACKGROUND_MODE = "SDL_WINDOWS_ERASE_BACKGROUND_MODE";
pub const SDL_HINT_X11_FORCE_OVERRIDE_REDIRECT = "SDL_X11_FORCE_OVERRIDE_REDIRECT";
pub const SDL_HINT_X11_WINDOW_TYPE = "SDL_X11_WINDOW_TYPE";
pub const SDL_HINT_X11_XCB_LIBRARY = "SDL_X11_XCB_LIBRARY";
pub const SDL_HINT_XINPUT_ENABLED = "SDL_XINPUT_ENABLED";
pub const SDL_HINT_ASSERT = "SDL_ASSERT";
pub const SDL_HINT_PEN_MOUSE_EVENTS = "SDL_PEN_MOUSE_EVENTS";
pub const SDL_HINT_PEN_TOUCH_EVENTS = "SDL_PEN_TOUCH_EVENTS";
pub const SDL_init_h_ = "";
pub const SDL_INIT_AUDIO = @as(c_uint, 0x00000010);
pub const SDL_INIT_VIDEO = @as(c_uint, 0x00000020);
pub const SDL_INIT_JOYSTICK = @as(c_uint, 0x00000200);
pub const SDL_INIT_HAPTIC = @as(c_uint, 0x00001000);
pub const SDL_INIT_GAMEPAD = @as(c_uint, 0x00002000);
pub const SDL_INIT_EVENTS = @as(c_uint, 0x00004000);
pub const SDL_INIT_SENSOR = @as(c_uint, 0x00008000);
pub const SDL_INIT_CAMERA = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x00010000, .hex);
pub const SDL_PROP_APP_METADATA_NAME_STRING = "SDL.app.metadata.name";
pub const SDL_PROP_APP_METADATA_VERSION_STRING = "SDL.app.metadata.version";
pub const SDL_PROP_APP_METADATA_IDENTIFIER_STRING = "SDL.app.metadata.identifier";
pub const SDL_PROP_APP_METADATA_CREATOR_STRING = "SDL.app.metadata.creator";
pub const SDL_PROP_APP_METADATA_COPYRIGHT_STRING = "SDL.app.metadata.copyright";
pub const SDL_PROP_APP_METADATA_URL_STRING = "SDL.app.metadata.url";
pub const SDL_PROP_APP_METADATA_TYPE_STRING = "SDL.app.metadata.type";
pub const SDL_loadso_h_ = "";
pub const SDL_locale_h = "";
pub const SDL_log_h_ = "";
pub const SDL_messagebox_h_ = "";
pub const SDL_MESSAGEBOX_ERROR = @as(c_uint, 0x00000010);
pub const SDL_MESSAGEBOX_WARNING = @as(c_uint, 0x00000020);
pub const SDL_MESSAGEBOX_INFORMATION = @as(c_uint, 0x00000040);
pub const SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT = @as(c_uint, 0x00000080);
pub const SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT = @as(c_uint, 0x00000100);
pub const SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT = @as(c_uint, 0x00000001);
pub const SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = @as(c_uint, 0x00000002);
pub const SDL_metal_h_ = "";
pub const SDL_misc_h_ = "";
pub const SDL_platform_h_ = "";
pub const SDL_process_h_ = "";
pub const SDL_PROP_PROCESS_CREATE_ARGS_POINTER = "SDL.process.create.args";
pub const SDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER = "SDL.process.create.environment";
pub const SDL_PROP_PROCESS_CREATE_STDIN_NUMBER = "SDL.process.create.stdin_option";
pub const SDL_PROP_PROCESS_CREATE_STDIN_POINTER = "SDL.process.create.stdin_source";
pub const SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER = "SDL.process.create.stdout_option";
pub const SDL_PROP_PROCESS_CREATE_STDOUT_POINTER = "SDL.process.create.stdout_source";
pub const SDL_PROP_PROCESS_CREATE_STDERR_NUMBER = "SDL.process.create.stderr_option";
pub const SDL_PROP_PROCESS_CREATE_STDERR_POINTER = "SDL.process.create.stderr_source";
pub const SDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN = "SDL.process.create.stderr_to_stdout";
pub const SDL_PROP_PROCESS_CREATE_BACKGROUND_BOOLEAN = "SDL.process.create.background";
pub const SDL_PROP_PROCESS_PID_NUMBER = "SDL.process.pid";
pub const SDL_PROP_PROCESS_STDIN_POINTER = "SDL.process.stdin";
pub const SDL_PROP_PROCESS_STDOUT_POINTER = "SDL.process.stdout";
pub const SDL_PROP_PROCESS_STDERR_POINTER = "SDL.process.stderr";
pub const SDL_PROP_PROCESS_BACKGROUND_BOOLEAN = "SDL.process.background";
pub const SDL_render_h_ = "";
pub const SDL_SOFTWARE_RENDERER = "software";
pub const SDL_PROP_RENDERER_CREATE_NAME_STRING = "SDL.renderer.create.name";
pub const SDL_PROP_RENDERER_CREATE_WINDOW_POINTER = "SDL.renderer.create.window";
pub const SDL_PROP_RENDERER_CREATE_SURFACE_POINTER = "SDL.renderer.create.surface";
pub const SDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER = "SDL.renderer.create.output_colorspace";
pub const SDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER = "SDL.renderer.create.present_vsync";
pub const SDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER = "SDL.renderer.create.vulkan.instance";
pub const SDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER = "SDL.renderer.create.vulkan.surface";
pub const SDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER = "SDL.renderer.create.vulkan.physical_device";
pub const SDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER = "SDL.renderer.create.vulkan.device";
pub const SDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER = "SDL.renderer.create.vulkan.graphics_queue_family_index";
pub const SDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER = "SDL.renderer.create.vulkan.present_queue_family_index";
pub const SDL_PROP_RENDERER_NAME_STRING = "SDL.renderer.name";
pub const SDL_PROP_RENDERER_WINDOW_POINTER = "SDL.renderer.window";
pub const SDL_PROP_RENDERER_SURFACE_POINTER = "SDL.renderer.surface";
pub const SDL_PROP_RENDERER_VSYNC_NUMBER = "SDL.renderer.vsync";
pub const SDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER = "SDL.renderer.max_texture_size";
pub const SDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER = "SDL.renderer.texture_formats";
pub const SDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER = "SDL.renderer.output_colorspace";
pub const SDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN = "SDL.renderer.HDR_enabled";
pub const SDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT = "SDL.renderer.SDR_white_point";
pub const SDL_PROP_RENDERER_HDR_HEADROOM_FLOAT = "SDL.renderer.HDR_headroom";
pub const SDL_PROP_RENDERER_D3D9_DEVICE_POINTER = "SDL.renderer.d3d9.device";
pub const SDL_PROP_RENDERER_D3D11_DEVICE_POINTER = "SDL.renderer.d3d11.device";
pub const SDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER = "SDL.renderer.d3d11.swap_chain";
pub const SDL_PROP_RENDERER_D3D12_DEVICE_POINTER = "SDL.renderer.d3d12.device";
pub const SDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER = "SDL.renderer.d3d12.swap_chain";
pub const SDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER = "SDL.renderer.d3d12.command_queue";
pub const SDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER = "SDL.renderer.vulkan.instance";
pub const SDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER = "SDL.renderer.vulkan.surface";
pub const SDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER = "SDL.renderer.vulkan.physical_device";
pub const SDL_PROP_RENDERER_VULKAN_DEVICE_POINTER = "SDL.renderer.vulkan.device";
pub const SDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER = "SDL.renderer.vulkan.graphics_queue_family_index";
pub const SDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER = "SDL.renderer.vulkan.present_queue_family_index";
pub const SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER = "SDL.renderer.vulkan.swapchain_image_count";
pub const SDL_PROP_RENDERER_GPU_DEVICE_POINTER = "SDL.renderer.gpu.device";
pub const SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER = "SDL.texture.create.colorspace";
pub const SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER = "SDL.texture.create.format";
pub const SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER = "SDL.texture.create.access";
pub const SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER = "SDL.texture.create.width";
pub const SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER = "SDL.texture.create.height";
pub const SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT = "SDL.texture.create.SDR_white_point";
pub const SDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT = "SDL.texture.create.HDR_headroom";
pub const SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER = "SDL.texture.create.d3d11.texture";
pub const SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER = "SDL.texture.create.d3d11.texture_u";
pub const SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER = "SDL.texture.create.d3d11.texture_v";
pub const SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER = "SDL.texture.create.d3d12.texture";
pub const SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER = "SDL.texture.create.d3d12.texture_u";
pub const SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER = "SDL.texture.create.d3d12.texture_v";
pub const SDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER = "SDL.texture.create.metal.pixelbuffer";
pub const SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER = "SDL.texture.create.opengl.texture";
pub const SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER = "SDL.texture.create.opengl.texture_uv";
pub const SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER = "SDL.texture.create.opengl.texture_u";
pub const SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER = "SDL.texture.create.opengl.texture_v";
pub const SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER = "SDL.texture.create.opengles2.texture";
pub const SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER = "SDL.texture.create.opengles2.texture_uv";
pub const SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER = "SDL.texture.create.opengles2.texture_u";
pub const SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER = "SDL.texture.create.opengles2.texture_v";
pub const SDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER = "SDL.texture.create.vulkan.texture";
pub const SDL_PROP_TEXTURE_COLORSPACE_NUMBER = "SDL.texture.colorspace";
pub const SDL_PROP_TEXTURE_FORMAT_NUMBER = "SDL.texture.format";
pub const SDL_PROP_TEXTURE_ACCESS_NUMBER = "SDL.texture.access";
pub const SDL_PROP_TEXTURE_WIDTH_NUMBER = "SDL.texture.width";
pub const SDL_PROP_TEXTURE_HEIGHT_NUMBER = "SDL.texture.height";
pub const SDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT = "SDL.texture.SDR_white_point";
pub const SDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT = "SDL.texture.HDR_headroom";
pub const SDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER = "SDL.texture.d3d11.texture";
pub const SDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER = "SDL.texture.d3d11.texture_u";
pub const SDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER = "SDL.texture.d3d11.texture_v";
pub const SDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER = "SDL.texture.d3d12.texture";
pub const SDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER = "SDL.texture.d3d12.texture_u";
pub const SDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER = "SDL.texture.d3d12.texture_v";
pub const SDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER = "SDL.texture.opengl.texture";
pub const SDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER = "SDL.texture.opengl.texture_uv";
pub const SDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER = "SDL.texture.opengl.texture_u";
pub const SDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER = "SDL.texture.opengl.texture_v";
pub const SDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER = "SDL.texture.opengl.target";
pub const SDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT = "SDL.texture.opengl.tex_w";
pub const SDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT = "SDL.texture.opengl.tex_h";
pub const SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER = "SDL.texture.opengles2.texture";
pub const SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER = "SDL.texture.opengles2.texture_uv";
pub const SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER = "SDL.texture.opengles2.texture_u";
pub const SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER = "SDL.texture.opengles2.texture_v";
pub const SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER = "SDL.texture.opengles2.target";
pub const SDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER = "SDL.texture.vulkan.texture";
pub const SDL_RENDERER_VSYNC_DISABLED = @as(c_int, 0);
pub const SDL_RENDERER_VSYNC_ADAPTIVE = -@as(c_int, 1);
pub const SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE = @as(c_int, 8);
pub const SDL_storage_h_ = "";
pub const SDL_system_h_ = "";
pub const SDL_time_h_ = "";
pub const SDL_timer_h_ = "";
pub const SDL_MS_PER_SECOND = @as(c_int, 1000);
pub const SDL_US_PER_SECOND = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
pub const SDL_NS_PER_MS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal);
pub const SDL_NS_PER_US = @as(c_int, 1000);
pub inline fn SDL_SECONDS_TO_NS(S: anytype) @TypeOf(@import("std").zig.c_translation.cast(Uint64, S) * SDL_NS_PER_SECOND) {
    _ = &S;
    return @import("std").zig.c_translation.cast(Uint64, S) * SDL_NS_PER_SECOND;
}
pub inline fn SDL_NS_TO_SECONDS(NS: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(NS, SDL_NS_PER_SECOND)) {
    _ = &NS;
    return @import("std").zig.c_translation.MacroArithmetic.div(NS, SDL_NS_PER_SECOND);
}
pub inline fn SDL_MS_TO_NS(MS: anytype) @TypeOf(@import("std").zig.c_translation.cast(Uint64, MS) * SDL_NS_PER_MS) {
    _ = &MS;
    return @import("std").zig.c_translation.cast(Uint64, MS) * SDL_NS_PER_MS;
}
pub inline fn SDL_NS_TO_MS(NS: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(NS, SDL_NS_PER_MS)) {
    _ = &NS;
    return @import("std").zig.c_translation.MacroArithmetic.div(NS, SDL_NS_PER_MS);
}
pub inline fn SDL_US_TO_NS(US: anytype) @TypeOf(@import("std").zig.c_translation.cast(Uint64, US) * SDL_NS_PER_US) {
    _ = &US;
    return @import("std").zig.c_translation.cast(Uint64, US) * SDL_NS_PER_US;
}
pub inline fn SDL_NS_TO_US(NS: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(NS, SDL_NS_PER_US)) {
    _ = &NS;
    return @import("std").zig.c_translation.MacroArithmetic.div(NS, SDL_NS_PER_US);
}
pub const SDL_tray_h_ = "";
pub const SDL_TRAYENTRY_BUTTON = @as(c_uint, 0x00000001);
pub const SDL_TRAYENTRY_CHECKBOX = @as(c_uint, 0x00000002);
pub const SDL_TRAYENTRY_SUBMENU = @as(c_uint, 0x00000004);
pub const SDL_TRAYENTRY_DISABLED = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x80000000, .hex);
pub const SDL_TRAYENTRY_CHECKED = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x40000000, .hex);
pub const SDL_version_h_ = "";
pub const SDL_MAJOR_VERSION = @as(c_int, 3);
pub const SDL_MINOR_VERSION = @as(c_int, 2);
pub const SDL_MICRO_VERSION = @as(c_int, 16);
pub inline fn SDL_VERSIONNUM(major: anytype, minor: anytype, patch: anytype) @TypeOf(((major * @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal)) + (minor * @as(c_int, 1000))) + patch) {
    _ = &major;
    _ = &minor;
    _ = &patch;
    return ((major * @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal)) + (minor * @as(c_int, 1000))) + patch;
}
pub inline fn SDL_VERSIONNUM_MAJOR(version: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(version, @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal))) {
    _ = &version;
    return @import("std").zig.c_translation.MacroArithmetic.div(version, @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal));
}
pub inline fn SDL_VERSIONNUM_MINOR(version: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.rem(@import("std").zig.c_translation.MacroArithmetic.div(version, @as(c_int, 1000)), @as(c_int, 1000))) {
    _ = &version;
    return @import("std").zig.c_translation.MacroArithmetic.rem(@import("std").zig.c_translation.MacroArithmetic.div(version, @as(c_int, 1000)), @as(c_int, 1000));
}
pub inline fn SDL_VERSIONNUM_MICRO(version: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.rem(version, @as(c_int, 1000))) {
    _ = &version;
    return @import("std").zig.c_translation.MacroArithmetic.rem(version, @as(c_int, 1000));
}
pub const SDL_VERSION = SDL_VERSIONNUM(SDL_MAJOR_VERSION, SDL_MINOR_VERSION, SDL_MICRO_VERSION);
pub inline fn SDL_VERSION_ATLEAST(X: anytype, Y: anytype, Z: anytype) @TypeOf(SDL_VERSION >= SDL_VERSIONNUM(X, Y, Z)) {
    _ = &X;
    _ = &Y;
    _ = &Z;
    return SDL_VERSION >= SDL_VERSIONNUM(X, Y, Z);
}
pub const SDL_oldnames_h_ = "";
pub const SDL_AtomicAdd = @compileError("unable to translate macro: undefined identifier `SDL_AtomicAdd_renamed_SDL_AddAtomicInt`");
// include/SDL3/SDL_oldnames.h:684:9
pub const SDL_AtomicCAS = @compileError("unable to translate macro: undefined identifier `SDL_AtomicCAS_renamed_SDL_CompareAndSwapAtomicInt`");
// include/SDL3/SDL_oldnames.h:685:9
pub const SDL_AtomicCASPtr = @compileError("unable to translate macro: undefined identifier `SDL_AtomicCASPtr_renamed_SDL_CompareAndSwapAtomicPointer`");
// include/SDL3/SDL_oldnames.h:686:9
pub const SDL_AtomicGet = @compileError("unable to translate macro: undefined identifier `SDL_AtomicGet_renamed_SDL_GetAtomicInt`");
// include/SDL3/SDL_oldnames.h:687:9
pub const SDL_AtomicGetPtr = @compileError("unable to translate macro: undefined identifier `SDL_AtomicGetPtr_renamed_SDL_GetAtomicPointer`");
// include/SDL3/SDL_oldnames.h:688:9
pub const SDL_AtomicLock = @compileError("unable to translate macro: undefined identifier `SDL_AtomicLock_renamed_SDL_LockSpinlock`");
// include/SDL3/SDL_oldnames.h:689:9
pub const SDL_AtomicSet = @compileError("unable to translate macro: undefined identifier `SDL_AtomicSet_renamed_SDL_SetAtomicInt`");
// include/SDL3/SDL_oldnames.h:690:9
pub const SDL_AtomicSetPtr = @compileError("unable to translate macro: undefined identifier `SDL_AtomicSetPtr_renamed_SDL_SetAtomicPointer`");
// include/SDL3/SDL_oldnames.h:691:9
pub const SDL_AtomicTryLock = @compileError("unable to translate macro: undefined identifier `SDL_AtomicTryLock_renamed_SDL_TryLockSpinlock`");
// include/SDL3/SDL_oldnames.h:692:9
pub const SDL_AtomicUnlock = @compileError("unable to translate macro: undefined identifier `SDL_AtomicUnlock_renamed_SDL_UnlockSpinlock`");
// include/SDL3/SDL_oldnames.h:693:9
pub const SDL_atomic_t = @compileError("unable to translate macro: undefined identifier `SDL_atomic_t_renamed_SDL_AtomicInt`");
// include/SDL3/SDL_oldnames.h:694:9
pub const AUDIO_F32 = @compileError("unable to translate macro: undefined identifier `AUDIO_F32_renamed_SDL_AUDIO_F32LE`");
// include/SDL3/SDL_oldnames.h:697:9
pub const AUDIO_F32LSB = @compileError("unable to translate macro: undefined identifier `AUDIO_F32LSB_renamed_SDL_AUDIO_F32LE`");
// include/SDL3/SDL_oldnames.h:698:9
pub const AUDIO_F32MSB = @compileError("unable to translate macro: undefined identifier `AUDIO_F32MSB_renamed_SDL_AUDIO_F32BE`");
// include/SDL3/SDL_oldnames.h:699:9
pub const AUDIO_F32SYS = @compileError("unable to translate macro: undefined identifier `AUDIO_F32SYS_renamed_SDL_AUDIO_F32`");
// include/SDL3/SDL_oldnames.h:700:9
pub const AUDIO_S16 = @compileError("unable to translate macro: undefined identifier `AUDIO_S16_renamed_SDL_AUDIO_S16LE`");
// include/SDL3/SDL_oldnames.h:701:9
pub const AUDIO_S16LSB = @compileError("unable to translate macro: undefined identifier `AUDIO_S16LSB_renamed_SDL_AUDIO_S16LE`");
// include/SDL3/SDL_oldnames.h:702:9
pub const AUDIO_S16MSB = @compileError("unable to translate macro: undefined identifier `AUDIO_S16MSB_renamed_SDL_AUDIO_S16BE`");
// include/SDL3/SDL_oldnames.h:703:9
pub const AUDIO_S16SYS = @compileError("unable to translate macro: undefined identifier `AUDIO_S16SYS_renamed_SDL_AUDIO_S16`");
// include/SDL3/SDL_oldnames.h:704:9
pub const AUDIO_S32 = @compileError("unable to translate macro: undefined identifier `AUDIO_S32_renamed_SDL_AUDIO_S32LE`");
// include/SDL3/SDL_oldnames.h:705:9
pub const AUDIO_S32LSB = @compileError("unable to translate macro: undefined identifier `AUDIO_S32LSB_renamed_SDL_AUDIO_S32LE`");
// include/SDL3/SDL_oldnames.h:706:9
pub const AUDIO_S32MSB = @compileError("unable to translate macro: undefined identifier `AUDIO_S32MSB_renamed_SDL_AUDIO_S32BE`");
// include/SDL3/SDL_oldnames.h:707:9
pub const AUDIO_S32SYS = @compileError("unable to translate macro: undefined identifier `AUDIO_S32SYS_renamed_SDL_AUDIO_S32`");
// include/SDL3/SDL_oldnames.h:708:9
pub const AUDIO_S8 = @compileError("unable to translate macro: undefined identifier `AUDIO_S8_renamed_SDL_AUDIO_S8`");
// include/SDL3/SDL_oldnames.h:709:9
pub const AUDIO_U8 = @compileError("unable to translate macro: undefined identifier `AUDIO_U8_renamed_SDL_AUDIO_U8`");
// include/SDL3/SDL_oldnames.h:710:9
pub const SDL_AudioStreamAvailable = @compileError("unable to translate macro: undefined identifier `SDL_AudioStreamAvailable_renamed_SDL_GetAudioStreamAvailable`");
// include/SDL3/SDL_oldnames.h:711:9
pub const SDL_AudioStreamClear = @compileError("unable to translate macro: undefined identifier `SDL_AudioStreamClear_renamed_SDL_ClearAudioStream`");
// include/SDL3/SDL_oldnames.h:712:9
pub const SDL_AudioStreamFlush = @compileError("unable to translate macro: undefined identifier `SDL_AudioStreamFlush_renamed_SDL_FlushAudioStream`");
// include/SDL3/SDL_oldnames.h:713:9
pub const SDL_AudioStreamGet = @compileError("unable to translate macro: undefined identifier `SDL_AudioStreamGet_renamed_SDL_GetAudioStreamData`");
// include/SDL3/SDL_oldnames.h:714:9
pub const SDL_AudioStreamPut = @compileError("unable to translate macro: undefined identifier `SDL_AudioStreamPut_renamed_SDL_PutAudioStreamData`");
// include/SDL3/SDL_oldnames.h:715:9
pub const SDL_FreeAudioStream = @compileError("unable to translate macro: undefined identifier `SDL_FreeAudioStream_renamed_SDL_DestroyAudioStream`");
// include/SDL3/SDL_oldnames.h:716:9
pub const SDL_FreeWAV = @compileError("unable to translate macro: undefined identifier `SDL_FreeWAV_renamed_SDL_free`");
// include/SDL3/SDL_oldnames.h:717:9
pub const SDL_LoadWAV_RW = @compileError("unable to translate macro: undefined identifier `SDL_LoadWAV_RW_renamed_SDL_LoadWAV_IO`");
// include/SDL3/SDL_oldnames.h:718:9
pub const SDL_MixAudioFormat = @compileError("unable to translate macro: undefined identifier `SDL_MixAudioFormat_renamed_SDL_MixAudio`");
// include/SDL3/SDL_oldnames.h:719:9
pub const SDL_NewAudioStream = @compileError("unable to translate macro: undefined identifier `SDL_NewAudioStream_renamed_SDL_CreateAudioStream`");
// include/SDL3/SDL_oldnames.h:720:9
pub const SDL_GetCPUCount = @compileError("unable to translate macro: undefined identifier `SDL_GetCPUCount_renamed_SDL_GetNumLogicalCPUCores`");
// include/SDL3/SDL_oldnames.h:723:9
pub const SDL_SIMDGetAlignment = @compileError("unable to translate macro: undefined identifier `SDL_SIMDGetAlignment_renamed_SDL_GetSIMDAlignment`");
// include/SDL3/SDL_oldnames.h:724:9
pub const SDL_SwapBE16 = @compileError("unable to translate macro: undefined identifier `SDL_SwapBE16_renamed_SDL_Swap16BE`");
// include/SDL3/SDL_oldnames.h:727:9
pub const SDL_SwapBE32 = @compileError("unable to translate macro: undefined identifier `SDL_SwapBE32_renamed_SDL_Swap32BE`");
// include/SDL3/SDL_oldnames.h:728:9
pub const SDL_SwapBE64 = @compileError("unable to translate macro: undefined identifier `SDL_SwapBE64_renamed_SDL_Swap64BE`");
// include/SDL3/SDL_oldnames.h:729:9
pub const SDL_SwapLE16 = @compileError("unable to translate macro: undefined identifier `SDL_SwapLE16_renamed_SDL_Swap16LE`");
// include/SDL3/SDL_oldnames.h:730:9
pub const SDL_SwapLE32 = @compileError("unable to translate macro: undefined identifier `SDL_SwapLE32_renamed_SDL_Swap32LE`");
// include/SDL3/SDL_oldnames.h:731:9
pub const SDL_SwapLE64 = @compileError("unable to translate macro: undefined identifier `SDL_SwapLE64_renamed_SDL_Swap64LE`");
// include/SDL3/SDL_oldnames.h:732:9
pub const SDL_APP_DIDENTERBACKGROUND = @compileError("unable to translate macro: undefined identifier `SDL_APP_DIDENTERBACKGROUND_renamed_SDL_EVENT_DID_ENTER_BACKGROUND`");
// include/SDL3/SDL_oldnames.h:735:9
pub const SDL_APP_DIDENTERFOREGROUND = @compileError("unable to translate macro: undefined identifier `SDL_APP_DIDENTERFOREGROUND_renamed_SDL_EVENT_DID_ENTER_FOREGROUND`");
// include/SDL3/SDL_oldnames.h:736:9
pub const SDL_APP_LOWMEMORY = @compileError("unable to translate macro: undefined identifier `SDL_APP_LOWMEMORY_renamed_SDL_EVENT_LOW_MEMORY`");
// include/SDL3/SDL_oldnames.h:737:9
pub const SDL_APP_TERMINATING = @compileError("unable to translate macro: undefined identifier `SDL_APP_TERMINATING_renamed_SDL_EVENT_TERMINATING`");
// include/SDL3/SDL_oldnames.h:738:9
pub const SDL_APP_WILLENTERBACKGROUND = @compileError("unable to translate macro: undefined identifier `SDL_APP_WILLENTERBACKGROUND_renamed_SDL_EVENT_WILL_ENTER_BACKGROUND`");
// include/SDL3/SDL_oldnames.h:739:9
pub const SDL_APP_WILLENTERFOREGROUND = @compileError("unable to translate macro: undefined identifier `SDL_APP_WILLENTERFOREGROUND_renamed_SDL_EVENT_WILL_ENTER_FOREGROUND`");
// include/SDL3/SDL_oldnames.h:740:9
pub const SDL_AUDIODEVICEADDED = @compileError("unable to translate macro: undefined identifier `SDL_AUDIODEVICEADDED_renamed_SDL_EVENT_AUDIO_DEVICE_ADDED`");
// include/SDL3/SDL_oldnames.h:741:9
pub const SDL_AUDIODEVICEREMOVED = @compileError("unable to translate macro: undefined identifier `SDL_AUDIODEVICEREMOVED_renamed_SDL_EVENT_AUDIO_DEVICE_REMOVED`");
// include/SDL3/SDL_oldnames.h:742:9
pub const SDL_CLIPBOARDUPDATE = @compileError("unable to translate macro: undefined identifier `SDL_CLIPBOARDUPDATE_renamed_SDL_EVENT_CLIPBOARD_UPDATE`");
// include/SDL3/SDL_oldnames.h:743:9
pub const SDL_CONTROLLERAXISMOTION = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLERAXISMOTION_renamed_SDL_EVENT_GAMEPAD_AXIS_MOTION`");
// include/SDL3/SDL_oldnames.h:744:9
pub const SDL_CONTROLLERBUTTONDOWN = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLERBUTTONDOWN_renamed_SDL_EVENT_GAMEPAD_BUTTON_DOWN`");
// include/SDL3/SDL_oldnames.h:745:9
pub const SDL_CONTROLLERBUTTONUP = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLERBUTTONUP_renamed_SDL_EVENT_GAMEPAD_BUTTON_UP`");
// include/SDL3/SDL_oldnames.h:746:9
pub const SDL_CONTROLLERDEVICEADDED = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLERDEVICEADDED_renamed_SDL_EVENT_GAMEPAD_ADDED`");
// include/SDL3/SDL_oldnames.h:747:9
pub const SDL_CONTROLLERDEVICEREMAPPED = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLERDEVICEREMAPPED_renamed_SDL_EVENT_GAMEPAD_REMAPPED`");
// include/SDL3/SDL_oldnames.h:748:9
pub const SDL_CONTROLLERDEVICEREMOVED = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLERDEVICEREMOVED_renamed_SDL_EVENT_GAMEPAD_REMOVED`");
// include/SDL3/SDL_oldnames.h:749:9
pub const SDL_CONTROLLERSENSORUPDATE = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLERSENSORUPDATE_renamed_SDL_EVENT_GAMEPAD_SENSOR_UPDATE`");
// include/SDL3/SDL_oldnames.h:750:9
pub const SDL_CONTROLLERSTEAMHANDLEUPDATED = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLERSTEAMHANDLEUPDATED_renamed_SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED`");
// include/SDL3/SDL_oldnames.h:751:9
pub const SDL_CONTROLLERTOUCHPADDOWN = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLERTOUCHPADDOWN_renamed_SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN`");
// include/SDL3/SDL_oldnames.h:752:9
pub const SDL_CONTROLLERTOUCHPADMOTION = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLERTOUCHPADMOTION_renamed_SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION`");
// include/SDL3/SDL_oldnames.h:753:9
pub const SDL_CONTROLLERTOUCHPADUP = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLERTOUCHPADUP_renamed_SDL_EVENT_GAMEPAD_TOUCHPAD_UP`");
// include/SDL3/SDL_oldnames.h:754:9
pub const SDL_ControllerAxisEvent = @compileError("unable to translate macro: undefined identifier `SDL_ControllerAxisEvent_renamed_SDL_GamepadAxisEvent`");
// include/SDL3/SDL_oldnames.h:755:9
pub const SDL_ControllerButtonEvent = @compileError("unable to translate macro: undefined identifier `SDL_ControllerButtonEvent_renamed_SDL_GamepadButtonEvent`");
// include/SDL3/SDL_oldnames.h:756:9
pub const SDL_ControllerDeviceEvent = @compileError("unable to translate macro: undefined identifier `SDL_ControllerDeviceEvent_renamed_SDL_GamepadDeviceEvent`");
// include/SDL3/SDL_oldnames.h:757:9
pub const SDL_ControllerSensorEvent = @compileError("unable to translate macro: undefined identifier `SDL_ControllerSensorEvent_renamed_SDL_GamepadSensorEvent`");
// include/SDL3/SDL_oldnames.h:758:9
pub const SDL_ControllerTouchpadEvent = @compileError("unable to translate macro: undefined identifier `SDL_ControllerTouchpadEvent_renamed_SDL_GamepadTouchpadEvent`");
// include/SDL3/SDL_oldnames.h:759:9
pub const SDL_DISPLAYEVENT_CONNECTED = @compileError("unable to translate macro: undefined identifier `SDL_DISPLAYEVENT_CONNECTED_renamed_SDL_EVENT_DISPLAY_ADDED`");
// include/SDL3/SDL_oldnames.h:760:9
pub const SDL_DISPLAYEVENT_DISCONNECTED = @compileError("unable to translate macro: undefined identifier `SDL_DISPLAYEVENT_DISCONNECTED_renamed_SDL_EVENT_DISPLAY_REMOVED`");
// include/SDL3/SDL_oldnames.h:761:9
pub const SDL_DISPLAYEVENT_MOVED = @compileError("unable to translate macro: undefined identifier `SDL_DISPLAYEVENT_MOVED_renamed_SDL_EVENT_DISPLAY_MOVED`");
// include/SDL3/SDL_oldnames.h:762:9
pub const SDL_DISPLAYEVENT_ORIENTATION = @compileError("unable to translate macro: undefined identifier `SDL_DISPLAYEVENT_ORIENTATION_renamed_SDL_EVENT_DISPLAY_ORIENTATION`");
// include/SDL3/SDL_oldnames.h:763:9
pub const SDL_DROPBEGIN = @compileError("unable to translate macro: undefined identifier `SDL_DROPBEGIN_renamed_SDL_EVENT_DROP_BEGIN`");
// include/SDL3/SDL_oldnames.h:764:9
pub const SDL_DROPCOMPLETE = @compileError("unable to translate macro: undefined identifier `SDL_DROPCOMPLETE_renamed_SDL_EVENT_DROP_COMPLETE`");
// include/SDL3/SDL_oldnames.h:765:9
pub const SDL_DROPFILE = @compileError("unable to translate macro: undefined identifier `SDL_DROPFILE_renamed_SDL_EVENT_DROP_FILE`");
// include/SDL3/SDL_oldnames.h:766:9
pub const SDL_DROPTEXT = @compileError("unable to translate macro: undefined identifier `SDL_DROPTEXT_renamed_SDL_EVENT_DROP_TEXT`");
// include/SDL3/SDL_oldnames.h:767:9
pub const SDL_DelEventWatch = @compileError("unable to translate macro: undefined identifier `SDL_DelEventWatch_renamed_SDL_RemoveEventWatch`");
// include/SDL3/SDL_oldnames.h:768:9
pub const SDL_FINGERDOWN = @compileError("unable to translate macro: undefined identifier `SDL_FINGERDOWN_renamed_SDL_EVENT_FINGER_DOWN`");
// include/SDL3/SDL_oldnames.h:769:9
pub const SDL_FINGERMOTION = @compileError("unable to translate macro: undefined identifier `SDL_FINGERMOTION_renamed_SDL_EVENT_FINGER_MOTION`");
// include/SDL3/SDL_oldnames.h:770:9
pub const SDL_FINGERUP = @compileError("unable to translate macro: undefined identifier `SDL_FINGERUP_renamed_SDL_EVENT_FINGER_UP`");
// include/SDL3/SDL_oldnames.h:771:9
pub const SDL_FIRSTEVENT = @compileError("unable to translate macro: undefined identifier `SDL_FIRSTEVENT_renamed_SDL_EVENT_FIRST`");
// include/SDL3/SDL_oldnames.h:772:9
pub const SDL_JOYAXISMOTION = @compileError("unable to translate macro: undefined identifier `SDL_JOYAXISMOTION_renamed_SDL_EVENT_JOYSTICK_AXIS_MOTION`");
// include/SDL3/SDL_oldnames.h:773:9
pub const SDL_JOYBATTERYUPDATED = @compileError("unable to translate macro: undefined identifier `SDL_JOYBATTERYUPDATED_renamed_SDL_EVENT_JOYSTICK_BATTERY_UPDATED`");
// include/SDL3/SDL_oldnames.h:774:9
pub const SDL_JOYBUTTONDOWN = @compileError("unable to translate macro: undefined identifier `SDL_JOYBUTTONDOWN_renamed_SDL_EVENT_JOYSTICK_BUTTON_DOWN`");
// include/SDL3/SDL_oldnames.h:775:9
pub const SDL_JOYBUTTONUP = @compileError("unable to translate macro: undefined identifier `SDL_JOYBUTTONUP_renamed_SDL_EVENT_JOYSTICK_BUTTON_UP`");
// include/SDL3/SDL_oldnames.h:776:9
pub const SDL_JOYDEVICEADDED = @compileError("unable to translate macro: undefined identifier `SDL_JOYDEVICEADDED_renamed_SDL_EVENT_JOYSTICK_ADDED`");
// include/SDL3/SDL_oldnames.h:777:9
pub const SDL_JOYDEVICEREMOVED = @compileError("unable to translate macro: undefined identifier `SDL_JOYDEVICEREMOVED_renamed_SDL_EVENT_JOYSTICK_REMOVED`");
// include/SDL3/SDL_oldnames.h:778:9
pub const SDL_JOYBALLMOTION = @compileError("unable to translate macro: undefined identifier `SDL_JOYBALLMOTION_renamed_SDL_EVENT_JOYSTICK_BALL_MOTION`");
// include/SDL3/SDL_oldnames.h:779:9
pub const SDL_JOYHATMOTION = @compileError("unable to translate macro: undefined identifier `SDL_JOYHATMOTION_renamed_SDL_EVENT_JOYSTICK_HAT_MOTION`");
// include/SDL3/SDL_oldnames.h:780:9
pub const SDL_KEYDOWN = @compileError("unable to translate macro: undefined identifier `SDL_KEYDOWN_renamed_SDL_EVENT_KEY_DOWN`");
// include/SDL3/SDL_oldnames.h:781:9
pub const SDL_KEYMAPCHANGED = @compileError("unable to translate macro: undefined identifier `SDL_KEYMAPCHANGED_renamed_SDL_EVENT_KEYMAP_CHANGED`");
// include/SDL3/SDL_oldnames.h:782:9
pub const SDL_KEYUP = @compileError("unable to translate macro: undefined identifier `SDL_KEYUP_renamed_SDL_EVENT_KEY_UP`");
// include/SDL3/SDL_oldnames.h:783:9
pub const SDL_LASTEVENT = @compileError("unable to translate macro: undefined identifier `SDL_LASTEVENT_renamed_SDL_EVENT_LAST`");
// include/SDL3/SDL_oldnames.h:784:9
pub const SDL_LOCALECHANGED = @compileError("unable to translate macro: undefined identifier `SDL_LOCALECHANGED_renamed_SDL_EVENT_LOCALE_CHANGED`");
// include/SDL3/SDL_oldnames.h:785:9
pub const SDL_MOUSEBUTTONDOWN = @compileError("unable to translate macro: undefined identifier `SDL_MOUSEBUTTONDOWN_renamed_SDL_EVENT_MOUSE_BUTTON_DOWN`");
// include/SDL3/SDL_oldnames.h:786:9
pub const SDL_MOUSEBUTTONUP = @compileError("unable to translate macro: undefined identifier `SDL_MOUSEBUTTONUP_renamed_SDL_EVENT_MOUSE_BUTTON_UP`");
// include/SDL3/SDL_oldnames.h:787:9
pub const SDL_MOUSEMOTION = @compileError("unable to translate macro: undefined identifier `SDL_MOUSEMOTION_renamed_SDL_EVENT_MOUSE_MOTION`");
// include/SDL3/SDL_oldnames.h:788:9
pub const SDL_MOUSEWHEEL = @compileError("unable to translate macro: undefined identifier `SDL_MOUSEWHEEL_renamed_SDL_EVENT_MOUSE_WHEEL`");
// include/SDL3/SDL_oldnames.h:789:9
pub const SDL_POLLSENTINEL = @compileError("unable to translate macro: undefined identifier `SDL_POLLSENTINEL_renamed_SDL_EVENT_POLL_SENTINEL`");
// include/SDL3/SDL_oldnames.h:790:9
pub const SDL_QUIT = @compileError("unable to translate macro: undefined identifier `SDL_QUIT_renamed_SDL_EVENT_QUIT`");
// include/SDL3/SDL_oldnames.h:791:9
pub const SDL_RENDER_DEVICE_RESET = @compileError("unable to translate macro: undefined identifier `SDL_RENDER_DEVICE_RESET_renamed_SDL_EVENT_RENDER_DEVICE_RESET`");
// include/SDL3/SDL_oldnames.h:792:9
pub const SDL_RENDER_TARGETS_RESET = @compileError("unable to translate macro: undefined identifier `SDL_RENDER_TARGETS_RESET_renamed_SDL_EVENT_RENDER_TARGETS_RESET`");
// include/SDL3/SDL_oldnames.h:793:9
pub const SDL_SENSORUPDATE = @compileError("unable to translate macro: undefined identifier `SDL_SENSORUPDATE_renamed_SDL_EVENT_SENSOR_UPDATE`");
// include/SDL3/SDL_oldnames.h:794:9
pub const SDL_TEXTEDITING = @compileError("unable to translate macro: undefined identifier `SDL_TEXTEDITING_renamed_SDL_EVENT_TEXT_EDITING`");
// include/SDL3/SDL_oldnames.h:795:9
pub const SDL_TEXTEDITING_EXT = @compileError("unable to translate macro: undefined identifier `SDL_TEXTEDITING_EXT_renamed_SDL_EVENT_TEXT_EDITING_EXT`");
// include/SDL3/SDL_oldnames.h:796:9
pub const SDL_TEXTINPUT = @compileError("unable to translate macro: undefined identifier `SDL_TEXTINPUT_renamed_SDL_EVENT_TEXT_INPUT`");
// include/SDL3/SDL_oldnames.h:797:9
pub const SDL_USEREVENT = @compileError("unable to translate macro: undefined identifier `SDL_USEREVENT_renamed_SDL_EVENT_USER`");
// include/SDL3/SDL_oldnames.h:798:9
pub const SDL_WINDOWEVENT_CLOSE = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_CLOSE_renamed_SDL_EVENT_WINDOW_CLOSE_REQUESTED`");
// include/SDL3/SDL_oldnames.h:799:9
pub const SDL_WINDOWEVENT_DISPLAY_CHANGED = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_DISPLAY_CHANGED_renamed_SDL_EVENT_WINDOW_DISPLAY_CHANGED`");
// include/SDL3/SDL_oldnames.h:800:9
pub const SDL_WINDOWEVENT_ENTER = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_ENTER_renamed_SDL_EVENT_WINDOW_MOUSE_ENTER`");
// include/SDL3/SDL_oldnames.h:801:9
pub const SDL_WINDOWEVENT_EXPOSED = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_EXPOSED_renamed_SDL_EVENT_WINDOW_EXPOSED`");
// include/SDL3/SDL_oldnames.h:802:9
pub const SDL_WINDOWEVENT_FOCUS_GAINED = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_FOCUS_GAINED_renamed_SDL_EVENT_WINDOW_FOCUS_GAINED`");
// include/SDL3/SDL_oldnames.h:803:9
pub const SDL_WINDOWEVENT_FOCUS_LOST = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_FOCUS_LOST_renamed_SDL_EVENT_WINDOW_FOCUS_LOST`");
// include/SDL3/SDL_oldnames.h:804:9
pub const SDL_WINDOWEVENT_HIDDEN = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_HIDDEN_renamed_SDL_EVENT_WINDOW_HIDDEN`");
// include/SDL3/SDL_oldnames.h:805:9
pub const SDL_WINDOWEVENT_HIT_TEST = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_HIT_TEST_renamed_SDL_EVENT_WINDOW_HIT_TEST`");
// include/SDL3/SDL_oldnames.h:806:9
pub const SDL_WINDOWEVENT_ICCPROF_CHANGED = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_ICCPROF_CHANGED_renamed_SDL_EVENT_WINDOW_ICCPROF_CHANGED`");
// include/SDL3/SDL_oldnames.h:807:9
pub const SDL_WINDOWEVENT_LEAVE = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_LEAVE_renamed_SDL_EVENT_WINDOW_MOUSE_LEAVE`");
// include/SDL3/SDL_oldnames.h:808:9
pub const SDL_WINDOWEVENT_MAXIMIZED = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_MAXIMIZED_renamed_SDL_EVENT_WINDOW_MAXIMIZED`");
// include/SDL3/SDL_oldnames.h:809:9
pub const SDL_WINDOWEVENT_MINIMIZED = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_MINIMIZED_renamed_SDL_EVENT_WINDOW_MINIMIZED`");
// include/SDL3/SDL_oldnames.h:810:9
pub const SDL_WINDOWEVENT_MOVED = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_MOVED_renamed_SDL_EVENT_WINDOW_MOVED`");
// include/SDL3/SDL_oldnames.h:811:9
pub const SDL_WINDOWEVENT_RESIZED = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_RESIZED_renamed_SDL_EVENT_WINDOW_RESIZED`");
// include/SDL3/SDL_oldnames.h:812:9
pub const SDL_WINDOWEVENT_RESTORED = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_RESTORED_renamed_SDL_EVENT_WINDOW_RESTORED`");
// include/SDL3/SDL_oldnames.h:813:9
pub const SDL_WINDOWEVENT_SHOWN = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_SHOWN_renamed_SDL_EVENT_WINDOW_SHOWN`");
// include/SDL3/SDL_oldnames.h:814:9
pub const SDL_WINDOWEVENT_SIZE_CHANGED = @compileError("unable to translate macro: undefined identifier `SDL_WINDOWEVENT_SIZE_CHANGED_renamed_SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED`");
// include/SDL3/SDL_oldnames.h:815:9
pub const SDL_eventaction = @compileError("unable to translate macro: undefined identifier `SDL_eventaction_renamed_SDL_EventAction`");
// include/SDL3/SDL_oldnames.h:816:9
pub const SDL_CONTROLLER_AXIS_INVALID = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_AXIS_INVALID_renamed_SDL_GAMEPAD_AXIS_INVALID`");
// include/SDL3/SDL_oldnames.h:819:9
pub const SDL_CONTROLLER_AXIS_LEFTX = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_AXIS_LEFTX_renamed_SDL_GAMEPAD_AXIS_LEFTX`");
// include/SDL3/SDL_oldnames.h:820:9
pub const SDL_CONTROLLER_AXIS_LEFTY = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_AXIS_LEFTY_renamed_SDL_GAMEPAD_AXIS_LEFTY`");
// include/SDL3/SDL_oldnames.h:821:9
pub const SDL_CONTROLLER_AXIS_MAX = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_AXIS_MAX_renamed_SDL_GAMEPAD_AXIS_COUNT`");
// include/SDL3/SDL_oldnames.h:822:9
pub const SDL_CONTROLLER_AXIS_RIGHTX = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_AXIS_RIGHTX_renamed_SDL_GAMEPAD_AXIS_RIGHTX`");
// include/SDL3/SDL_oldnames.h:823:9
pub const SDL_CONTROLLER_AXIS_RIGHTY = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_AXIS_RIGHTY_renamed_SDL_GAMEPAD_AXIS_RIGHTY`");
// include/SDL3/SDL_oldnames.h:824:9
pub const SDL_CONTROLLER_AXIS_TRIGGERLEFT = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_AXIS_TRIGGERLEFT_renamed_SDL_GAMEPAD_AXIS_LEFT_TRIGGER`");
// include/SDL3/SDL_oldnames.h:825:9
pub const SDL_CONTROLLER_AXIS_TRIGGERRIGHT = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_AXIS_TRIGGERRIGHT_renamed_SDL_GAMEPAD_AXIS_RIGHT_TRIGGER`");
// include/SDL3/SDL_oldnames.h:826:9
pub const SDL_CONTROLLER_BINDTYPE_AXIS = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BINDTYPE_AXIS_renamed_SDL_GAMEPAD_BINDTYPE_AXIS`");
// include/SDL3/SDL_oldnames.h:827:9
pub const SDL_CONTROLLER_BINDTYPE_BUTTON = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BINDTYPE_BUTTON_renamed_SDL_GAMEPAD_BINDTYPE_BUTTON`");
// include/SDL3/SDL_oldnames.h:828:9
pub const SDL_CONTROLLER_BINDTYPE_HAT = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BINDTYPE_HAT_renamed_SDL_GAMEPAD_BINDTYPE_HAT`");
// include/SDL3/SDL_oldnames.h:829:9
pub const SDL_CONTROLLER_BINDTYPE_NONE = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BINDTYPE_NONE_renamed_SDL_GAMEPAD_BINDTYPE_NONE`");
// include/SDL3/SDL_oldnames.h:830:9
pub const SDL_CONTROLLER_BUTTON_A = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_A_renamed_SDL_GAMEPAD_BUTTON_SOUTH`");
// include/SDL3/SDL_oldnames.h:831:9
pub const SDL_CONTROLLER_BUTTON_B = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_B_renamed_SDL_GAMEPAD_BUTTON_EAST`");
// include/SDL3/SDL_oldnames.h:832:9
pub const SDL_CONTROLLER_BUTTON_BACK = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_BACK_renamed_SDL_GAMEPAD_BUTTON_BACK`");
// include/SDL3/SDL_oldnames.h:833:9
pub const SDL_CONTROLLER_BUTTON_DPAD_DOWN = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_DPAD_DOWN_renamed_SDL_GAMEPAD_BUTTON_DPAD_DOWN`");
// include/SDL3/SDL_oldnames.h:834:9
pub const SDL_CONTROLLER_BUTTON_DPAD_LEFT = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_DPAD_LEFT_renamed_SDL_GAMEPAD_BUTTON_DPAD_LEFT`");
// include/SDL3/SDL_oldnames.h:835:9
pub const SDL_CONTROLLER_BUTTON_DPAD_RIGHT = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_DPAD_RIGHT_renamed_SDL_GAMEPAD_BUTTON_DPAD_RIGHT`");
// include/SDL3/SDL_oldnames.h:836:9
pub const SDL_CONTROLLER_BUTTON_DPAD_UP = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_DPAD_UP_renamed_SDL_GAMEPAD_BUTTON_DPAD_UP`");
// include/SDL3/SDL_oldnames.h:837:9
pub const SDL_CONTROLLER_BUTTON_GUIDE = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_GUIDE_renamed_SDL_GAMEPAD_BUTTON_GUIDE`");
// include/SDL3/SDL_oldnames.h:838:9
pub const SDL_CONTROLLER_BUTTON_INVALID = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_INVALID_renamed_SDL_GAMEPAD_BUTTON_INVALID`");
// include/SDL3/SDL_oldnames.h:839:9
pub const SDL_CONTROLLER_BUTTON_LEFTSHOULDER = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_LEFTSHOULDER_renamed_SDL_GAMEPAD_BUTTON_LEFT_SHOULDER`");
// include/SDL3/SDL_oldnames.h:840:9
pub const SDL_CONTROLLER_BUTTON_LEFTSTICK = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_LEFTSTICK_renamed_SDL_GAMEPAD_BUTTON_LEFT_STICK`");
// include/SDL3/SDL_oldnames.h:841:9
pub const SDL_CONTROLLER_BUTTON_MAX = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_MAX_renamed_SDL_GAMEPAD_BUTTON_COUNT`");
// include/SDL3/SDL_oldnames.h:842:9
pub const SDL_CONTROLLER_BUTTON_MISC1 = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_MISC1_renamed_SDL_GAMEPAD_BUTTON_MISC1`");
// include/SDL3/SDL_oldnames.h:843:9
pub const SDL_CONTROLLER_BUTTON_PADDLE1 = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_PADDLE1_renamed_SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1`");
// include/SDL3/SDL_oldnames.h:844:9
pub const SDL_CONTROLLER_BUTTON_PADDLE2 = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_PADDLE2_renamed_SDL_GAMEPAD_BUTTON_LEFT_PADDLE1`");
// include/SDL3/SDL_oldnames.h:845:9
pub const SDL_CONTROLLER_BUTTON_PADDLE3 = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_PADDLE3_renamed_SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2`");
// include/SDL3/SDL_oldnames.h:846:9
pub const SDL_CONTROLLER_BUTTON_PADDLE4 = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_PADDLE4_renamed_SDL_GAMEPAD_BUTTON_LEFT_PADDLE2`");
// include/SDL3/SDL_oldnames.h:847:9
pub const SDL_CONTROLLER_BUTTON_RIGHTSHOULDER = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_RIGHTSHOULDER_renamed_SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER`");
// include/SDL3/SDL_oldnames.h:848:9
pub const SDL_CONTROLLER_BUTTON_RIGHTSTICK = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_RIGHTSTICK_renamed_SDL_GAMEPAD_BUTTON_RIGHT_STICK`");
// include/SDL3/SDL_oldnames.h:849:9
pub const SDL_CONTROLLER_BUTTON_START = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_START_renamed_SDL_GAMEPAD_BUTTON_START`");
// include/SDL3/SDL_oldnames.h:850:9
pub const SDL_CONTROLLER_BUTTON_TOUCHPAD = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_TOUCHPAD_renamed_SDL_GAMEPAD_BUTTON_TOUCHPAD`");
// include/SDL3/SDL_oldnames.h:851:9
pub const SDL_CONTROLLER_BUTTON_X = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_X_renamed_SDL_GAMEPAD_BUTTON_WEST`");
// include/SDL3/SDL_oldnames.h:852:9
pub const SDL_CONTROLLER_BUTTON_Y = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_BUTTON_Y_renamed_SDL_GAMEPAD_BUTTON_NORTH`");
// include/SDL3/SDL_oldnames.h:853:9
pub const SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_LEFT = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_LEFT_renamed_SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT`");
// include/SDL3/SDL_oldnames.h:854:9
pub const SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_PAIR = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_PAIR_renamed_SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR`");
// include/SDL3/SDL_oldnames.h:855:9
pub const SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT_renamed_SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT`");
// include/SDL3/SDL_oldnames.h:856:9
pub const SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_PRO = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_PRO_renamed_SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO`");
// include/SDL3/SDL_oldnames.h:857:9
pub const SDL_CONTROLLER_TYPE_PS3 = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_TYPE_PS3_renamed_SDL_GAMEPAD_TYPE_PS3`");
// include/SDL3/SDL_oldnames.h:858:9
pub const SDL_CONTROLLER_TYPE_PS4 = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_TYPE_PS4_renamed_SDL_GAMEPAD_TYPE_PS4`");
// include/SDL3/SDL_oldnames.h:859:9
pub const SDL_CONTROLLER_TYPE_PS5 = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_TYPE_PS5_renamed_SDL_GAMEPAD_TYPE_PS5`");
// include/SDL3/SDL_oldnames.h:860:9
pub const SDL_CONTROLLER_TYPE_UNKNOWN = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_TYPE_UNKNOWN_renamed_SDL_GAMEPAD_TYPE_STANDARD`");
// include/SDL3/SDL_oldnames.h:861:9
pub const SDL_CONTROLLER_TYPE_VIRTUAL = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_TYPE_VIRTUAL_renamed_SDL_GAMEPAD_TYPE_VIRTUAL`");
// include/SDL3/SDL_oldnames.h:862:9
pub const SDL_CONTROLLER_TYPE_XBOX360 = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_TYPE_XBOX360_renamed_SDL_GAMEPAD_TYPE_XBOX360`");
// include/SDL3/SDL_oldnames.h:863:9
pub const SDL_CONTROLLER_TYPE_XBOXONE = @compileError("unable to translate macro: undefined identifier `SDL_CONTROLLER_TYPE_XBOXONE_renamed_SDL_GAMEPAD_TYPE_XBOXONE`");
// include/SDL3/SDL_oldnames.h:864:9
pub const SDL_GameController = @compileError("unable to translate macro: undefined identifier `SDL_GameController_renamed_SDL_Gamepad`");
// include/SDL3/SDL_oldnames.h:865:9
pub const SDL_GameControllerAddMapping = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerAddMapping_renamed_SDL_AddGamepadMapping`");
// include/SDL3/SDL_oldnames.h:866:9
pub const SDL_GameControllerAddMappingsFromFile = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerAddMappingsFromFile_renamed_SDL_AddGamepadMappingsFromFile`");
// include/SDL3/SDL_oldnames.h:867:9
pub const SDL_GameControllerAddMappingsFromRW = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerAddMappingsFromRW_renamed_SDL_AddGamepadMappingsFromIO`");
// include/SDL3/SDL_oldnames.h:868:9
pub const SDL_GameControllerAxis = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerAxis_renamed_SDL_GamepadAxis`");
// include/SDL3/SDL_oldnames.h:869:9
pub const SDL_GameControllerBindType = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerBindType_renamed_SDL_GamepadBindingType`");
// include/SDL3/SDL_oldnames.h:870:9
pub const SDL_GameControllerButton = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerButton_renamed_SDL_GamepadButton`");
// include/SDL3/SDL_oldnames.h:871:9
pub const SDL_GameControllerClose = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerClose_renamed_SDL_CloseGamepad`");
// include/SDL3/SDL_oldnames.h:872:9
pub const SDL_GameControllerFromInstanceID = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerFromInstanceID_renamed_SDL_GetGamepadFromID`");
// include/SDL3/SDL_oldnames.h:873:9
pub const SDL_GameControllerFromPlayerIndex = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerFromPlayerIndex_renamed_SDL_GetGamepadFromPlayerIndex`");
// include/SDL3/SDL_oldnames.h:874:9
pub const SDL_GameControllerGetAppleSFSymbolsNameForAxis = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetAppleSFSymbolsNameForAxis_renamed_SDL_GetGamepadAppleSFSymbolsNameForAxis`");
// include/SDL3/SDL_oldnames.h:875:9
pub const SDL_GameControllerGetAppleSFSymbolsNameForButton = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetAppleSFSymbolsNameForButton_renamed_SDL_GetGamepadAppleSFSymbolsNameForButton`");
// include/SDL3/SDL_oldnames.h:876:9
pub const SDL_GameControllerGetAttached = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetAttached_renamed_SDL_GamepadConnected`");
// include/SDL3/SDL_oldnames.h:877:9
pub const SDL_GameControllerGetAxis = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetAxis_renamed_SDL_GetGamepadAxis`");
// include/SDL3/SDL_oldnames.h:878:9
pub const SDL_GameControllerGetAxisFromString = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetAxisFromString_renamed_SDL_GetGamepadAxisFromString`");
// include/SDL3/SDL_oldnames.h:879:9
pub const SDL_GameControllerGetButton = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetButton_renamed_SDL_GetGamepadButton`");
// include/SDL3/SDL_oldnames.h:880:9
pub const SDL_GameControllerGetButtonFromString = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetButtonFromString_renamed_SDL_GetGamepadButtonFromString`");
// include/SDL3/SDL_oldnames.h:881:9
pub const SDL_GameControllerGetFirmwareVersion = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetFirmwareVersion_renamed_SDL_GetGamepadFirmwareVersion`");
// include/SDL3/SDL_oldnames.h:882:9
pub const SDL_GameControllerGetJoystick = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetJoystick_renamed_SDL_GetGamepadJoystick`");
// include/SDL3/SDL_oldnames.h:883:9
pub const SDL_GameControllerGetNumTouchpadFingers = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetNumTouchpadFingers_renamed_SDL_GetNumGamepadTouchpadFingers`");
// include/SDL3/SDL_oldnames.h:884:9
pub const SDL_GameControllerGetNumTouchpads = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetNumTouchpads_renamed_SDL_GetNumGamepadTouchpads`");
// include/SDL3/SDL_oldnames.h:885:9
pub const SDL_GameControllerGetPlayerIndex = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetPlayerIndex_renamed_SDL_GetGamepadPlayerIndex`");
// include/SDL3/SDL_oldnames.h:886:9
pub const SDL_GameControllerGetProduct = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetProduct_renamed_SDL_GetGamepadProduct`");
// include/SDL3/SDL_oldnames.h:887:9
pub const SDL_GameControllerGetProductVersion = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetProductVersion_renamed_SDL_GetGamepadProductVersion`");
// include/SDL3/SDL_oldnames.h:888:9
pub const SDL_GameControllerGetSensorData = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetSensorData_renamed_SDL_GetGamepadSensorData`");
// include/SDL3/SDL_oldnames.h:889:9
pub const SDL_GameControllerGetSensorDataRate = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetSensorDataRate_renamed_SDL_GetGamepadSensorDataRate`");
// include/SDL3/SDL_oldnames.h:890:9
pub const SDL_GameControllerGetSerial = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetSerial_renamed_SDL_GetGamepadSerial`");
// include/SDL3/SDL_oldnames.h:891:9
pub const SDL_GameControllerGetSteamHandle = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetSteamHandle_renamed_SDL_GetGamepadSteamHandle`");
// include/SDL3/SDL_oldnames.h:892:9
pub const SDL_GameControllerGetStringForAxis = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetStringForAxis_renamed_SDL_GetGamepadStringForAxis`");
// include/SDL3/SDL_oldnames.h:893:9
pub const SDL_GameControllerGetStringForButton = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetStringForButton_renamed_SDL_GetGamepadStringForButton`");
// include/SDL3/SDL_oldnames.h:894:9
pub const SDL_GameControllerGetTouchpadFinger = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetTouchpadFinger_renamed_SDL_GetGamepadTouchpadFinger`");
// include/SDL3/SDL_oldnames.h:895:9
pub const SDL_GameControllerGetType = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetType_renamed_SDL_GetGamepadType`");
// include/SDL3/SDL_oldnames.h:896:9
pub const SDL_GameControllerGetVendor = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerGetVendor_renamed_SDL_GetGamepadVendor`");
// include/SDL3/SDL_oldnames.h:897:9
pub const SDL_GameControllerHasAxis = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerHasAxis_renamed_SDL_GamepadHasAxis`");
// include/SDL3/SDL_oldnames.h:898:9
pub const SDL_GameControllerHasButton = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerHasButton_renamed_SDL_GamepadHasButton`");
// include/SDL3/SDL_oldnames.h:899:9
pub const SDL_GameControllerHasSensor = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerHasSensor_renamed_SDL_GamepadHasSensor`");
// include/SDL3/SDL_oldnames.h:900:9
pub const SDL_GameControllerIsSensorEnabled = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerIsSensorEnabled_renamed_SDL_GamepadSensorEnabled`");
// include/SDL3/SDL_oldnames.h:901:9
pub const SDL_GameControllerMapping = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerMapping_renamed_SDL_GetGamepadMapping`");
// include/SDL3/SDL_oldnames.h:902:9
pub const SDL_GameControllerMappingForDeviceIndex = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerMappingForDeviceIndex_renamed_SDL_GetGamepadMappingForDeviceIndex`");
// include/SDL3/SDL_oldnames.h:903:9
pub const SDL_GameControllerMappingForGUID = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerMappingForGUID_renamed_SDL_GetGamepadMappingForGUID`");
// include/SDL3/SDL_oldnames.h:904:9
pub const SDL_GameControllerName = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerName_renamed_SDL_GetGamepadName`");
// include/SDL3/SDL_oldnames.h:905:9
pub const SDL_GameControllerOpen = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerOpen_renamed_SDL_OpenGamepad`");
// include/SDL3/SDL_oldnames.h:906:9
pub const SDL_GameControllerPath = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerPath_renamed_SDL_GetGamepadPath`");
// include/SDL3/SDL_oldnames.h:907:9
pub const SDL_GameControllerRumble = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerRumble_renamed_SDL_RumbleGamepad`");
// include/SDL3/SDL_oldnames.h:908:9
pub const SDL_GameControllerRumbleTriggers = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerRumbleTriggers_renamed_SDL_RumbleGamepadTriggers`");
// include/SDL3/SDL_oldnames.h:909:9
pub const SDL_GameControllerSendEffect = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerSendEffect_renamed_SDL_SendGamepadEffect`");
// include/SDL3/SDL_oldnames.h:910:9
pub const SDL_GameControllerSetLED = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerSetLED_renamed_SDL_SetGamepadLED`");
// include/SDL3/SDL_oldnames.h:911:9
pub const SDL_GameControllerSetPlayerIndex = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerSetPlayerIndex_renamed_SDL_SetGamepadPlayerIndex`");
// include/SDL3/SDL_oldnames.h:912:9
pub const SDL_GameControllerSetSensorEnabled = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerSetSensorEnabled_renamed_SDL_SetGamepadSensorEnabled`");
// include/SDL3/SDL_oldnames.h:913:9
pub const SDL_GameControllerType = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerType_renamed_SDL_GamepadType`");
// include/SDL3/SDL_oldnames.h:914:9
pub const SDL_GameControllerUpdate = @compileError("unable to translate macro: undefined identifier `SDL_GameControllerUpdate_renamed_SDL_UpdateGamepads`");
// include/SDL3/SDL_oldnames.h:915:9
pub const SDL_INIT_GAMECONTROLLER = @compileError("unable to translate macro: undefined identifier `SDL_INIT_GAMECONTROLLER_renamed_SDL_INIT_GAMEPAD`");
// include/SDL3/SDL_oldnames.h:916:9
pub const SDL_IsGameController = @compileError("unable to translate macro: undefined identifier `SDL_IsGameController_renamed_SDL_IsGamepad`");
// include/SDL3/SDL_oldnames.h:917:9
pub const SDL_GUIDFromString = @compileError("unable to translate macro: undefined identifier `SDL_GUIDFromString_renamed_SDL_StringToGUID`");
// include/SDL3/SDL_oldnames.h:920:9
pub const SDL_HapticClose = @compileError("unable to translate macro: undefined identifier `SDL_HapticClose_renamed_SDL_CloseHaptic`");
// include/SDL3/SDL_oldnames.h:923:9
pub const SDL_HapticDestroyEffect = @compileError("unable to translate macro: undefined identifier `SDL_HapticDestroyEffect_renamed_SDL_DestroyHapticEffect`");
// include/SDL3/SDL_oldnames.h:924:9
pub const SDL_HapticGetEffectStatus = @compileError("unable to translate macro: undefined identifier `SDL_HapticGetEffectStatus_renamed_SDL_GetHapticEffectStatus`");
// include/SDL3/SDL_oldnames.h:925:9
pub const SDL_HapticNewEffect = @compileError("unable to translate macro: undefined identifier `SDL_HapticNewEffect_renamed_SDL_CreateHapticEffect`");
// include/SDL3/SDL_oldnames.h:926:9
pub const SDL_HapticNumAxes = @compileError("unable to translate macro: undefined identifier `SDL_HapticNumAxes_renamed_SDL_GetNumHapticAxes`");
// include/SDL3/SDL_oldnames.h:927:9
pub const SDL_HapticNumEffects = @compileError("unable to translate macro: undefined identifier `SDL_HapticNumEffects_renamed_SDL_GetMaxHapticEffects`");
// include/SDL3/SDL_oldnames.h:928:9
pub const SDL_HapticNumEffectsPlaying = @compileError("unable to translate macro: undefined identifier `SDL_HapticNumEffectsPlaying_renamed_SDL_GetMaxHapticEffectsPlaying`");
// include/SDL3/SDL_oldnames.h:929:9
pub const SDL_HapticOpen = @compileError("unable to translate macro: undefined identifier `SDL_HapticOpen_renamed_SDL_OpenHaptic`");
// include/SDL3/SDL_oldnames.h:930:9
pub const SDL_HapticOpenFromJoystick = @compileError("unable to translate macro: undefined identifier `SDL_HapticOpenFromJoystick_renamed_SDL_OpenHapticFromJoystick`");
// include/SDL3/SDL_oldnames.h:931:9
pub const SDL_HapticOpenFromMouse = @compileError("unable to translate macro: undefined identifier `SDL_HapticOpenFromMouse_renamed_SDL_OpenHapticFromMouse`");
// include/SDL3/SDL_oldnames.h:932:9
pub const SDL_HapticPause = @compileError("unable to translate macro: undefined identifier `SDL_HapticPause_renamed_SDL_PauseHaptic`");
// include/SDL3/SDL_oldnames.h:933:9
pub const SDL_HapticQuery = @compileError("unable to translate macro: undefined identifier `SDL_HapticQuery_renamed_SDL_GetHapticFeatures`");
// include/SDL3/SDL_oldnames.h:934:9
pub const SDL_HapticRumbleInit = @compileError("unable to translate macro: undefined identifier `SDL_HapticRumbleInit_renamed_SDL_InitHapticRumble`");
// include/SDL3/SDL_oldnames.h:935:9
pub const SDL_HapticRumblePlay = @compileError("unable to translate macro: undefined identifier `SDL_HapticRumblePlay_renamed_SDL_PlayHapticRumble`");
// include/SDL3/SDL_oldnames.h:936:9
pub const SDL_HapticRumbleStop = @compileError("unable to translate macro: undefined identifier `SDL_HapticRumbleStop_renamed_SDL_StopHapticRumble`");
// include/SDL3/SDL_oldnames.h:937:9
pub const SDL_HapticRunEffect = @compileError("unable to translate macro: undefined identifier `SDL_HapticRunEffect_renamed_SDL_RunHapticEffect`");
// include/SDL3/SDL_oldnames.h:938:9
pub const SDL_HapticSetAutocenter = @compileError("unable to translate macro: undefined identifier `SDL_HapticSetAutocenter_renamed_SDL_SetHapticAutocenter`");
// include/SDL3/SDL_oldnames.h:939:9
pub const SDL_HapticSetGain = @compileError("unable to translate macro: undefined identifier `SDL_HapticSetGain_renamed_SDL_SetHapticGain`");
// include/SDL3/SDL_oldnames.h:940:9
pub const SDL_HapticStopAll = @compileError("unable to translate macro: undefined identifier `SDL_HapticStopAll_renamed_SDL_StopHapticEffects`");
// include/SDL3/SDL_oldnames.h:941:9
pub const SDL_HapticStopEffect = @compileError("unable to translate macro: undefined identifier `SDL_HapticStopEffect_renamed_SDL_StopHapticEffect`");
// include/SDL3/SDL_oldnames.h:942:9
pub const SDL_HapticUnpause = @compileError("unable to translate macro: undefined identifier `SDL_HapticUnpause_renamed_SDL_ResumeHaptic`");
// include/SDL3/SDL_oldnames.h:943:9
pub const SDL_HapticUpdateEffect = @compileError("unable to translate macro: undefined identifier `SDL_HapticUpdateEffect_renamed_SDL_UpdateHapticEffect`");
// include/SDL3/SDL_oldnames.h:944:9
pub const SDL_JoystickIsHaptic = @compileError("unable to translate macro: undefined identifier `SDL_JoystickIsHaptic_renamed_SDL_IsJoystickHaptic`");
// include/SDL3/SDL_oldnames.h:945:9
pub const SDL_MouseIsHaptic = @compileError("unable to translate macro: undefined identifier `SDL_MouseIsHaptic_renamed_SDL_IsMouseHaptic`");
// include/SDL3/SDL_oldnames.h:946:9
pub const SDL_DelHintCallback = @compileError("unable to translate macro: undefined identifier `SDL_DelHintCallback_renamed_SDL_RemoveHintCallback`");
// include/SDL3/SDL_oldnames.h:949:9
pub const SDL_HINT_ALLOW_TOPMOST = @compileError("unable to translate macro: undefined identifier `SDL_HINT_ALLOW_TOPMOST_renamed_SDL_HINT_WINDOW_ALLOW_TOPMOST`");
// include/SDL3/SDL_oldnames.h:950:9
pub const SDL_HINT_DIRECTINPUT_ENABLED = @compileError("unable to translate macro: undefined identifier `SDL_HINT_DIRECTINPUT_ENABLED_renamed_SDL_HINT_JOYSTICK_DIRECTINPUT`");
// include/SDL3/SDL_oldnames.h:951:9
pub const SDL_HINT_GDK_TEXTINPUT_DEFAULT = @compileError("unable to translate macro: undefined identifier `SDL_HINT_GDK_TEXTINPUT_DEFAULT_renamed_SDL_HINT_GDK_TEXTINPUT_DEFAULT_TEXT`");
// include/SDL3/SDL_oldnames.h:952:9
pub const SDL_HINT_JOYSTICK_GAMECUBE_RUMBLE_BRAKE = @compileError("unable to translate macro: undefined identifier `SDL_HINT_JOYSTICK_GAMECUBE_RUMBLE_BRAKE_renamed_SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE`");
// include/SDL3/SDL_oldnames.h:953:9
pub const SDL_HINT_JOYSTICK_HIDAPI_PS4_RUMBLE = @compileError("unable to translate macro: undefined identifier `SDL_HINT_JOYSTICK_HIDAPI_PS4_RUMBLE_renamed_SDL_HINT_JOYSTICK_ENHANCED_REPORTS`");
// include/SDL3/SDL_oldnames.h:954:9
pub const SDL_HINT_JOYSTICK_HIDAPI_PS5_RUMBLE = @compileError("unable to translate macro: undefined identifier `SDL_HINT_JOYSTICK_HIDAPI_PS5_RUMBLE_renamed_SDL_HINT_JOYSTICK_ENHANCED_REPORTS`");
// include/SDL3/SDL_oldnames.h:955:9
pub const SDL_HINT_LINUX_DIGITAL_HATS = @compileError("unable to translate macro: undefined identifier `SDL_HINT_LINUX_DIGITAL_HATS_renamed_SDL_HINT_JOYSTICK_LINUX_DIGITAL_HATS`");
// include/SDL3/SDL_oldnames.h:956:9
pub const SDL_HINT_LINUX_HAT_DEADZONES = @compileError("unable to translate macro: undefined identifier `SDL_HINT_LINUX_HAT_DEADZONES_renamed_SDL_HINT_JOYSTICK_LINUX_HAT_DEADZONES`");
// include/SDL3/SDL_oldnames.h:957:9
pub const SDL_HINT_LINUX_JOYSTICK_CLASSIC = @compileError("unable to translate macro: undefined identifier `SDL_HINT_LINUX_JOYSTICK_CLASSIC_renamed_SDL_HINT_JOYSTICK_LINUX_CLASSIC`");
// include/SDL3/SDL_oldnames.h:958:9
pub const SDL_HINT_LINUX_JOYSTICK_DEADZONES = @compileError("unable to translate macro: undefined identifier `SDL_HINT_LINUX_JOYSTICK_DEADZONES_renamed_SDL_HINT_JOYSTICK_LINUX_DEADZONES`");
// include/SDL3/SDL_oldnames.h:959:9
pub const SDL_JOYSTICK_TYPE_GAMECONTROLLER = @compileError("unable to translate macro: undefined identifier `SDL_JOYSTICK_TYPE_GAMECONTROLLER_renamed_SDL_JOYSTICK_TYPE_GAMEPAD`");
// include/SDL3/SDL_oldnames.h:962:9
pub const SDL_JoystickAttachVirtualEx = @compileError("unable to translate macro: undefined identifier `SDL_JoystickAttachVirtualEx_renamed_SDL_AttachVirtualJoystick`");
// include/SDL3/SDL_oldnames.h:963:9
pub const SDL_JoystickClose = @compileError("unable to translate macro: undefined identifier `SDL_JoystickClose_renamed_SDL_CloseJoystick`");
// include/SDL3/SDL_oldnames.h:964:9
pub const SDL_JoystickDetachVirtual = @compileError("unable to translate macro: undefined identifier `SDL_JoystickDetachVirtual_renamed_SDL_DetachVirtualJoystick`");
// include/SDL3/SDL_oldnames.h:965:9
pub const SDL_JoystickFromInstanceID = @compileError("unable to translate macro: undefined identifier `SDL_JoystickFromInstanceID_renamed_SDL_GetJoystickFromID`");
// include/SDL3/SDL_oldnames.h:966:9
pub const SDL_JoystickFromPlayerIndex = @compileError("unable to translate macro: undefined identifier `SDL_JoystickFromPlayerIndex_renamed_SDL_GetJoystickFromPlayerIndex`");
// include/SDL3/SDL_oldnames.h:967:9
pub const SDL_JoystickGUID = @compileError("unable to translate macro: undefined identifier `SDL_JoystickGUID_renamed_SDL_GUID`");
// include/SDL3/SDL_oldnames.h:968:9
pub const SDL_JoystickGetAttached = @compileError("unable to translate macro: undefined identifier `SDL_JoystickGetAttached_renamed_SDL_JoystickConnected`");
// include/SDL3/SDL_oldnames.h:969:9
pub const SDL_JoystickGetAxis = @compileError("unable to translate macro: undefined identifier `SDL_JoystickGetAxis_renamed_SDL_GetJoystickAxis`");
// include/SDL3/SDL_oldnames.h:970:9
pub const SDL_JoystickGetAxisInitialState = @compileError("unable to translate macro: undefined identifier `SDL_JoystickGetAxisInitialState_renamed_SDL_GetJoystickAxisInitialState`");
// include/SDL3/SDL_oldnames.h:971:9
pub const SDL_JoystickGetBall = @compileError("unable to translate macro: undefined identifier `SDL_JoystickGetBall_renamed_SDL_GetJoystickBall`");
// include/SDL3/SDL_oldnames.h:972:9
pub const SDL_JoystickGetButton = @compileError("unable to translate macro: undefined identifier `SDL_JoystickGetButton_renamed_SDL_GetJoystickButton`");
// include/SDL3/SDL_oldnames.h:973:9
pub const SDL_JoystickGetFirmwareVersion = @compileError("unable to translate macro: undefined identifier `SDL_JoystickGetFirmwareVersion_renamed_SDL_GetJoystickFirmwareVersion`");
// include/SDL3/SDL_oldnames.h:974:9
pub const SDL_JoystickGetGUID = @compileError("unable to translate macro: undefined identifier `SDL_JoystickGetGUID_renamed_SDL_GetJoystickGUID`");
// include/SDL3/SDL_oldnames.h:975:9
pub const SDL_JoystickGetGUIDFromString = @compileError("unable to translate macro: undefined identifier `SDL_JoystickGetGUIDFromString_renamed_SDL_GUIDFromString`");
// include/SDL3/SDL_oldnames.h:976:9
pub const SDL_JoystickGetHat = @compileError("unable to translate macro: undefined identifier `SDL_JoystickGetHat_renamed_SDL_GetJoystickHat`");
// include/SDL3/SDL_oldnames.h:977:9
pub const SDL_JoystickGetPlayerIndex = @compileError("unable to translate macro: undefined identifier `SDL_JoystickGetPlayerIndex_renamed_SDL_GetJoystickPlayerIndex`");
// include/SDL3/SDL_oldnames.h:978:9
pub const SDL_JoystickGetProduct = @compileError("unable to translate macro: undefined identifier `SDL_JoystickGetProduct_renamed_SDL_GetJoystickProduct`");
// include/SDL3/SDL_oldnames.h:979:9
pub const SDL_JoystickGetProductVersion = @compileError("unable to translate macro: undefined identifier `SDL_JoystickGetProductVersion_renamed_SDL_GetJoystickProductVersion`");
// include/SDL3/SDL_oldnames.h:980:9
pub const SDL_JoystickGetSerial = @compileError("unable to translate macro: undefined identifier `SDL_JoystickGetSerial_renamed_SDL_GetJoystickSerial`");
// include/SDL3/SDL_oldnames.h:981:9
pub const SDL_JoystickGetType = @compileError("unable to translate macro: undefined identifier `SDL_JoystickGetType_renamed_SDL_GetJoystickType`");
// include/SDL3/SDL_oldnames.h:982:9
pub const SDL_JoystickGetVendor = @compileError("unable to translate macro: undefined identifier `SDL_JoystickGetVendor_renamed_SDL_GetJoystickVendor`");
// include/SDL3/SDL_oldnames.h:983:9
pub const SDL_JoystickInstanceID = @compileError("unable to translate macro: undefined identifier `SDL_JoystickInstanceID_renamed_SDL_GetJoystickID`");
// include/SDL3/SDL_oldnames.h:984:9
pub const SDL_JoystickIsVirtual = @compileError("unable to translate macro: undefined identifier `SDL_JoystickIsVirtual_renamed_SDL_IsJoystickVirtual`");
// include/SDL3/SDL_oldnames.h:985:9
pub const SDL_JoystickName = @compileError("unable to translate macro: undefined identifier `SDL_JoystickName_renamed_SDL_GetJoystickName`");
// include/SDL3/SDL_oldnames.h:986:9
pub const SDL_JoystickNumAxes = @compileError("unable to translate macro: undefined identifier `SDL_JoystickNumAxes_renamed_SDL_GetNumJoystickAxes`");
// include/SDL3/SDL_oldnames.h:987:9
pub const SDL_JoystickNumBalls = @compileError("unable to translate macro: undefined identifier `SDL_JoystickNumBalls_renamed_SDL_GetNumJoystickBalls`");
// include/SDL3/SDL_oldnames.h:988:9
pub const SDL_JoystickNumButtons = @compileError("unable to translate macro: undefined identifier `SDL_JoystickNumButtons_renamed_SDL_GetNumJoystickButtons`");
// include/SDL3/SDL_oldnames.h:989:9
pub const SDL_JoystickNumHats = @compileError("unable to translate macro: undefined identifier `SDL_JoystickNumHats_renamed_SDL_GetNumJoystickHats`");
// include/SDL3/SDL_oldnames.h:990:9
pub const SDL_JoystickOpen = @compileError("unable to translate macro: undefined identifier `SDL_JoystickOpen_renamed_SDL_OpenJoystick`");
// include/SDL3/SDL_oldnames.h:991:9
pub const SDL_JoystickPath = @compileError("unable to translate macro: undefined identifier `SDL_JoystickPath_renamed_SDL_GetJoystickPath`");
// include/SDL3/SDL_oldnames.h:992:9
pub const SDL_JoystickRumble = @compileError("unable to translate macro: undefined identifier `SDL_JoystickRumble_renamed_SDL_RumbleJoystick`");
// include/SDL3/SDL_oldnames.h:993:9
pub const SDL_JoystickRumbleTriggers = @compileError("unable to translate macro: undefined identifier `SDL_JoystickRumbleTriggers_renamed_SDL_RumbleJoystickTriggers`");
// include/SDL3/SDL_oldnames.h:994:9
pub const SDL_JoystickSendEffect = @compileError("unable to translate macro: undefined identifier `SDL_JoystickSendEffect_renamed_SDL_SendJoystickEffect`");
// include/SDL3/SDL_oldnames.h:995:9
pub const SDL_JoystickSetLED = @compileError("unable to translate macro: undefined identifier `SDL_JoystickSetLED_renamed_SDL_SetJoystickLED`");
// include/SDL3/SDL_oldnames.h:996:9
pub const SDL_JoystickSetPlayerIndex = @compileError("unable to translate macro: undefined identifier `SDL_JoystickSetPlayerIndex_renamed_SDL_SetJoystickPlayerIndex`");
// include/SDL3/SDL_oldnames.h:997:9
pub const SDL_JoystickSetVirtualAxis = @compileError("unable to translate macro: undefined identifier `SDL_JoystickSetVirtualAxis_renamed_SDL_SetJoystickVirtualAxis`");
// include/SDL3/SDL_oldnames.h:998:9
pub const SDL_JoystickSetVirtualButton = @compileError("unable to translate macro: undefined identifier `SDL_JoystickSetVirtualButton_renamed_SDL_SetJoystickVirtualButton`");
// include/SDL3/SDL_oldnames.h:999:9
pub const SDL_JoystickSetVirtualHat = @compileError("unable to translate macro: undefined identifier `SDL_JoystickSetVirtualHat_renamed_SDL_SetJoystickVirtualHat`");
// include/SDL3/SDL_oldnames.h:1000:9
pub const SDL_JoystickUpdate = @compileError("unable to translate macro: undefined identifier `SDL_JoystickUpdate_renamed_SDL_UpdateJoysticks`");
// include/SDL3/SDL_oldnames.h:1001:9
pub const SDL_IsScreenKeyboardShown = @compileError("unable to translate macro: undefined identifier `SDL_IsScreenKeyboardShown_renamed_SDL_ScreenKeyboardShown`");
// include/SDL3/SDL_oldnames.h:1004:9
pub const SDL_IsTextInputActive = @compileError("unable to translate macro: undefined identifier `SDL_IsTextInputActive_renamed_SDL_TextInputActive`");
// include/SDL3/SDL_oldnames.h:1005:9
pub const KMOD_ALT = @compileError("unable to translate macro: undefined identifier `KMOD_ALT_renamed_SDL_KMOD_ALT`");
// include/SDL3/SDL_oldnames.h:1008:9
pub const KMOD_CAPS = @compileError("unable to translate macro: undefined identifier `KMOD_CAPS_renamed_SDL_KMOD_CAPS`");
// include/SDL3/SDL_oldnames.h:1009:9
pub const KMOD_CTRL = @compileError("unable to translate macro: undefined identifier `KMOD_CTRL_renamed_SDL_KMOD_CTRL`");
// include/SDL3/SDL_oldnames.h:1010:9
pub const KMOD_GUI = @compileError("unable to translate macro: undefined identifier `KMOD_GUI_renamed_SDL_KMOD_GUI`");
// include/SDL3/SDL_oldnames.h:1011:9
pub const KMOD_LALT = @compileError("unable to translate macro: undefined identifier `KMOD_LALT_renamed_SDL_KMOD_LALT`");
// include/SDL3/SDL_oldnames.h:1012:9
pub const KMOD_LCTRL = @compileError("unable to translate macro: undefined identifier `KMOD_LCTRL_renamed_SDL_KMOD_LCTRL`");
// include/SDL3/SDL_oldnames.h:1013:9
pub const KMOD_LGUI = @compileError("unable to translate macro: undefined identifier `KMOD_LGUI_renamed_SDL_KMOD_LGUI`");
// include/SDL3/SDL_oldnames.h:1014:9
pub const KMOD_LSHIFT = @compileError("unable to translate macro: undefined identifier `KMOD_LSHIFT_renamed_SDL_KMOD_LSHIFT`");
// include/SDL3/SDL_oldnames.h:1015:9
pub const KMOD_MODE = @compileError("unable to translate macro: undefined identifier `KMOD_MODE_renamed_SDL_KMOD_MODE`");
// include/SDL3/SDL_oldnames.h:1016:9
pub const KMOD_NONE = @compileError("unable to translate macro: undefined identifier `KMOD_NONE_renamed_SDL_KMOD_NONE`");
// include/SDL3/SDL_oldnames.h:1017:9
pub const KMOD_NUM = @compileError("unable to translate macro: undefined identifier `KMOD_NUM_renamed_SDL_KMOD_NUM`");
// include/SDL3/SDL_oldnames.h:1018:9
pub const KMOD_RALT = @compileError("unable to translate macro: undefined identifier `KMOD_RALT_renamed_SDL_KMOD_RALT`");
// include/SDL3/SDL_oldnames.h:1019:9
pub const KMOD_RCTRL = @compileError("unable to translate macro: undefined identifier `KMOD_RCTRL_renamed_SDL_KMOD_RCTRL`");
// include/SDL3/SDL_oldnames.h:1020:9
pub const KMOD_RGUI = @compileError("unable to translate macro: undefined identifier `KMOD_RGUI_renamed_SDL_KMOD_RGUI`");
// include/SDL3/SDL_oldnames.h:1021:9
pub const KMOD_RSHIFT = @compileError("unable to translate macro: undefined identifier `KMOD_RSHIFT_renamed_SDL_KMOD_RSHIFT`");
// include/SDL3/SDL_oldnames.h:1022:9
pub const KMOD_SCROLL = @compileError("unable to translate macro: undefined identifier `KMOD_SCROLL_renamed_SDL_KMOD_SCROLL`");
// include/SDL3/SDL_oldnames.h:1023:9
pub const KMOD_SHIFT = @compileError("unable to translate macro: undefined identifier `KMOD_SHIFT_renamed_SDL_KMOD_SHIFT`");
// include/SDL3/SDL_oldnames.h:1024:9
pub const SDLK_AUDIOFASTFORWARD = @compileError("unable to translate macro: undefined identifier `SDLK_AUDIOFASTFORWARD_renamed_SDLK_MEDIA_FAST_FORWARD`");
// include/SDL3/SDL_oldnames.h:1025:9
pub const SDLK_AUDIOMUTE = @compileError("unable to translate macro: undefined identifier `SDLK_AUDIOMUTE_renamed_SDLK_MUTE`");
// include/SDL3/SDL_oldnames.h:1026:9
pub const SDLK_AUDIONEXT = @compileError("unable to translate macro: undefined identifier `SDLK_AUDIONEXT_renamed_SDLK_MEDIA_NEXT_TRACK`");
// include/SDL3/SDL_oldnames.h:1027:9
pub const SDLK_AUDIOPLAY = @compileError("unable to translate macro: undefined identifier `SDLK_AUDIOPLAY_renamed_SDLK_MEDIA_PLAY`");
// include/SDL3/SDL_oldnames.h:1028:9
pub const SDLK_AUDIOPREV = @compileError("unable to translate macro: undefined identifier `SDLK_AUDIOPREV_renamed_SDLK_MEDIA_PREVIOUS_TRACK`");
// include/SDL3/SDL_oldnames.h:1029:9
pub const SDLK_AUDIOREWIND = @compileError("unable to translate macro: undefined identifier `SDLK_AUDIOREWIND_renamed_SDLK_MEDIA_REWIND`");
// include/SDL3/SDL_oldnames.h:1030:9
pub const SDLK_AUDIOSTOP = @compileError("unable to translate macro: undefined identifier `SDLK_AUDIOSTOP_renamed_SDLK_MEDIA_STOP`");
// include/SDL3/SDL_oldnames.h:1031:9
pub const SDLK_BACKQUOTE = @compileError("unable to translate macro: undefined identifier `SDLK_BACKQUOTE_renamed_SDLK_GRAVE`");
// include/SDL3/SDL_oldnames.h:1032:9
pub const SDLK_EJECT = @compileError("unable to translate macro: undefined identifier `SDLK_EJECT_renamed_SDLK_MEDIA_EJECT`");
// include/SDL3/SDL_oldnames.h:1033:9
pub const SDLK_MEDIASELECT = @compileError("unable to translate macro: undefined identifier `SDLK_MEDIASELECT_renamed_SDLK_MEDIA_SELECT`");
// include/SDL3/SDL_oldnames.h:1034:9
pub const SDLK_QUOTE = @compileError("unable to translate macro: undefined identifier `SDLK_QUOTE_renamed_SDLK_APOSTROPHE`");
// include/SDL3/SDL_oldnames.h:1035:9
pub const SDLK_QUOTEDBL = @compileError("unable to translate macro: undefined identifier `SDLK_QUOTEDBL_renamed_SDLK_DBLAPOSTROPHE`");
// include/SDL3/SDL_oldnames.h:1036:9
pub const SDLK_a = @compileError("unable to translate macro: undefined identifier `SDLK_a_renamed_SDLK_A`");
// include/SDL3/SDL_oldnames.h:1037:9
pub const SDLK_b = @compileError("unable to translate macro: undefined identifier `SDLK_b_renamed_SDLK_B`");
// include/SDL3/SDL_oldnames.h:1038:9
pub const SDLK_c = @compileError("unable to translate macro: undefined identifier `SDLK_c_renamed_SDLK_C`");
// include/SDL3/SDL_oldnames.h:1039:9
pub const SDLK_d = @compileError("unable to translate macro: undefined identifier `SDLK_d_renamed_SDLK_D`");
// include/SDL3/SDL_oldnames.h:1040:9
pub const SDLK_e = @compileError("unable to translate macro: undefined identifier `SDLK_e_renamed_SDLK_E`");
// include/SDL3/SDL_oldnames.h:1041:9
pub const SDLK_f = @compileError("unable to translate macro: undefined identifier `SDLK_f_renamed_SDLK_F`");
// include/SDL3/SDL_oldnames.h:1042:9
pub const SDLK_g = @compileError("unable to translate macro: undefined identifier `SDLK_g_renamed_SDLK_G`");
// include/SDL3/SDL_oldnames.h:1043:9
pub const SDLK_h = @compileError("unable to translate macro: undefined identifier `SDLK_h_renamed_SDLK_H`");
// include/SDL3/SDL_oldnames.h:1044:9
pub const SDLK_i = @compileError("unable to translate macro: undefined identifier `SDLK_i_renamed_SDLK_I`");
// include/SDL3/SDL_oldnames.h:1045:9
pub const SDLK_j = @compileError("unable to translate macro: undefined identifier `SDLK_j_renamed_SDLK_J`");
// include/SDL3/SDL_oldnames.h:1046:9
pub const SDLK_k = @compileError("unable to translate macro: undefined identifier `SDLK_k_renamed_SDLK_K`");
// include/SDL3/SDL_oldnames.h:1047:9
pub const SDLK_l = @compileError("unable to translate macro: undefined identifier `SDLK_l_renamed_SDLK_L`");
// include/SDL3/SDL_oldnames.h:1048:9
pub const SDLK_m = @compileError("unable to translate macro: undefined identifier `SDLK_m_renamed_SDLK_M`");
// include/SDL3/SDL_oldnames.h:1049:9
pub const SDLK_n = @compileError("unable to translate macro: undefined identifier `SDLK_n_renamed_SDLK_N`");
// include/SDL3/SDL_oldnames.h:1050:9
pub const SDLK_o = @compileError("unable to translate macro: undefined identifier `SDLK_o_renamed_SDLK_O`");
// include/SDL3/SDL_oldnames.h:1051:9
pub const SDLK_p = @compileError("unable to translate macro: undefined identifier `SDLK_p_renamed_SDLK_P`");
// include/SDL3/SDL_oldnames.h:1052:9
pub const SDLK_q = @compileError("unable to translate macro: undefined identifier `SDLK_q_renamed_SDLK_Q`");
// include/SDL3/SDL_oldnames.h:1053:9
pub const SDLK_r = @compileError("unable to translate macro: undefined identifier `SDLK_r_renamed_SDLK_R`");
// include/SDL3/SDL_oldnames.h:1054:9
pub const SDLK_s = @compileError("unable to translate macro: undefined identifier `SDLK_s_renamed_SDLK_S`");
// include/SDL3/SDL_oldnames.h:1055:9
pub const SDLK_t = @compileError("unable to translate macro: undefined identifier `SDLK_t_renamed_SDLK_T`");
// include/SDL3/SDL_oldnames.h:1056:9
pub const SDLK_u = @compileError("unable to translate macro: undefined identifier `SDLK_u_renamed_SDLK_U`");
// include/SDL3/SDL_oldnames.h:1057:9
pub const SDLK_v = @compileError("unable to translate macro: undefined identifier `SDLK_v_renamed_SDLK_V`");
// include/SDL3/SDL_oldnames.h:1058:9
pub const SDLK_w = @compileError("unable to translate macro: undefined identifier `SDLK_w_renamed_SDLK_W`");
// include/SDL3/SDL_oldnames.h:1059:9
pub const SDLK_x = @compileError("unable to translate macro: undefined identifier `SDLK_x_renamed_SDLK_X`");
// include/SDL3/SDL_oldnames.h:1060:9
pub const SDLK_y = @compileError("unable to translate macro: undefined identifier `SDLK_y_renamed_SDLK_Y`");
// include/SDL3/SDL_oldnames.h:1061:9
pub const SDLK_z = @compileError("unable to translate macro: undefined identifier `SDLK_z_renamed_SDLK_Z`");
// include/SDL3/SDL_oldnames.h:1062:9
pub const SDL_LogGetOutputFunction = @compileError("unable to translate macro: undefined identifier `SDL_LogGetOutputFunction_renamed_SDL_GetLogOutputFunction`");
// include/SDL3/SDL_oldnames.h:1065:9
pub const SDL_LogGetPriority = @compileError("unable to translate macro: undefined identifier `SDL_LogGetPriority_renamed_SDL_GetLogPriority`");
// include/SDL3/SDL_oldnames.h:1066:9
pub const SDL_LogResetPriorities = @compileError("unable to translate macro: undefined identifier `SDL_LogResetPriorities_renamed_SDL_ResetLogPriorities`");
// include/SDL3/SDL_oldnames.h:1067:9
pub const SDL_LogSetAllPriority = @compileError("unable to translate macro: undefined identifier `SDL_LogSetAllPriority_renamed_SDL_SetLogPriorities`");
// include/SDL3/SDL_oldnames.h:1068:9
pub const SDL_LogSetOutputFunction = @compileError("unable to translate macro: undefined identifier `SDL_LogSetOutputFunction_renamed_SDL_SetLogOutputFunction`");
// include/SDL3/SDL_oldnames.h:1069:9
pub const SDL_LogSetPriority = @compileError("unable to translate macro: undefined identifier `SDL_LogSetPriority_renamed_SDL_SetLogPriority`");
// include/SDL3/SDL_oldnames.h:1070:9
pub const SDL_NUM_LOG_PRIORITIES = @compileError("unable to translate macro: undefined identifier `SDL_NUM_LOG_PRIORITIES_renamed_SDL_LOG_PRIORITY_COUNT`");
// include/SDL3/SDL_oldnames.h:1071:9
pub const SDL_MESSAGEBOX_COLOR_MAX = @compileError("unable to translate macro: undefined identifier `SDL_MESSAGEBOX_COLOR_MAX_renamed_SDL_MESSAGEBOX_COLOR_COUNT`");
// include/SDL3/SDL_oldnames.h:1074:9
pub const SDL_BUTTON = @compileError("unable to translate macro: undefined identifier `SDL_BUTTON_renamed_SDL_BUTTON_MASK`");
// include/SDL3/SDL_oldnames.h:1077:9
pub const SDL_FreeCursor = @compileError("unable to translate macro: undefined identifier `SDL_FreeCursor_renamed_SDL_DestroyCursor`");
// include/SDL3/SDL_oldnames.h:1078:9
pub const SDL_NUM_SYSTEM_CURSORS = @compileError("unable to translate macro: undefined identifier `SDL_NUM_SYSTEM_CURSORS_renamed_SDL_SYSTEM_CURSOR_COUNT`");
// include/SDL3/SDL_oldnames.h:1079:9
pub const SDL_SYSTEM_CURSOR_ARROW = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_ARROW_renamed_SDL_SYSTEM_CURSOR_DEFAULT`");
// include/SDL3/SDL_oldnames.h:1080:9
pub const SDL_SYSTEM_CURSOR_HAND = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_HAND_renamed_SDL_SYSTEM_CURSOR_POINTER`");
// include/SDL3/SDL_oldnames.h:1081:9
pub const SDL_SYSTEM_CURSOR_IBEAM = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_IBEAM_renamed_SDL_SYSTEM_CURSOR_TEXT`");
// include/SDL3/SDL_oldnames.h:1082:9
pub const SDL_SYSTEM_CURSOR_NO = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_NO_renamed_SDL_SYSTEM_CURSOR_NOT_ALLOWED`");
// include/SDL3/SDL_oldnames.h:1083:9
pub const SDL_SYSTEM_CURSOR_SIZEALL = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_SIZEALL_renamed_SDL_SYSTEM_CURSOR_MOVE`");
// include/SDL3/SDL_oldnames.h:1084:9
pub const SDL_SYSTEM_CURSOR_SIZENESW = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_SIZENESW_renamed_SDL_SYSTEM_CURSOR_NESW_RESIZE`");
// include/SDL3/SDL_oldnames.h:1085:9
pub const SDL_SYSTEM_CURSOR_SIZENS = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_SIZENS_renamed_SDL_SYSTEM_CURSOR_NS_RESIZE`");
// include/SDL3/SDL_oldnames.h:1086:9
pub const SDL_SYSTEM_CURSOR_SIZENWSE = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_SIZENWSE_renamed_SDL_SYSTEM_CURSOR_NWSE_RESIZE`");
// include/SDL3/SDL_oldnames.h:1087:9
pub const SDL_SYSTEM_CURSOR_SIZEWE = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_SIZEWE_renamed_SDL_SYSTEM_CURSOR_EW_RESIZE`");
// include/SDL3/SDL_oldnames.h:1088:9
pub const SDL_SYSTEM_CURSOR_WAITARROW = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_WAITARROW_renamed_SDL_SYSTEM_CURSOR_PROGRESS`");
// include/SDL3/SDL_oldnames.h:1089:9
pub const SDL_SYSTEM_CURSOR_WINDOW_BOTTOM = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_WINDOW_BOTTOM_renamed_SDL_SYSTEM_CURSOR_S_RESIZE`");
// include/SDL3/SDL_oldnames.h:1090:9
pub const SDL_SYSTEM_CURSOR_WINDOW_BOTTOMLEFT = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_WINDOW_BOTTOMLEFT_renamed_SDL_SYSTEM_CURSOR_SW_RESIZE`");
// include/SDL3/SDL_oldnames.h:1091:9
pub const SDL_SYSTEM_CURSOR_WINDOW_BOTTOMRIGHT = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_WINDOW_BOTTOMRIGHT_renamed_SDL_SYSTEM_CURSOR_SE_RESIZE`");
// include/SDL3/SDL_oldnames.h:1092:9
pub const SDL_SYSTEM_CURSOR_WINDOW_LEFT = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_WINDOW_LEFT_renamed_SDL_SYSTEM_CURSOR_W_RESIZE`");
// include/SDL3/SDL_oldnames.h:1093:9
pub const SDL_SYSTEM_CURSOR_WINDOW_RIGHT = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_WINDOW_RIGHT_renamed_SDL_SYSTEM_CURSOR_E_RESIZE`");
// include/SDL3/SDL_oldnames.h:1094:9
pub const SDL_SYSTEM_CURSOR_WINDOW_TOP = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_WINDOW_TOP_renamed_SDL_SYSTEM_CURSOR_N_RESIZE`");
// include/SDL3/SDL_oldnames.h:1095:9
pub const SDL_SYSTEM_CURSOR_WINDOW_TOPLEFT = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_WINDOW_TOPLEFT_renamed_SDL_SYSTEM_CURSOR_NW_RESIZE`");
// include/SDL3/SDL_oldnames.h:1096:9
pub const SDL_SYSTEM_CURSOR_WINDOW_TOPRIGHT = @compileError("unable to translate macro: undefined identifier `SDL_SYSTEM_CURSOR_WINDOW_TOPRIGHT_renamed_SDL_SYSTEM_CURSOR_NE_RESIZE`");
// include/SDL3/SDL_oldnames.h:1097:9
pub const SDL_CondBroadcast = @compileError("unable to translate macro: undefined identifier `SDL_CondBroadcast_renamed_SDL_BroadcastCondition`");
// include/SDL3/SDL_oldnames.h:1100:9
pub const SDL_CondSignal = @compileError("unable to translate macro: undefined identifier `SDL_CondSignal_renamed_SDL_SignalCondition`");
// include/SDL3/SDL_oldnames.h:1101:9
pub const SDL_CondWait = @compileError("unable to translate macro: undefined identifier `SDL_CondWait_renamed_SDL_WaitCondition`");
// include/SDL3/SDL_oldnames.h:1102:9
pub const SDL_CondWaitTimeout = @compileError("unable to translate macro: undefined identifier `SDL_CondWaitTimeout_renamed_SDL_WaitConditionTimeout`");
// include/SDL3/SDL_oldnames.h:1103:9
pub const SDL_CreateCond = @compileError("unable to translate macro: undefined identifier `SDL_CreateCond_renamed_SDL_CreateCondition`");
// include/SDL3/SDL_oldnames.h:1104:9
pub const SDL_DestroyCond = @compileError("unable to translate macro: undefined identifier `SDL_DestroyCond_renamed_SDL_DestroyCondition`");
// include/SDL3/SDL_oldnames.h:1105:9
pub const SDL_SemPost = @compileError("unable to translate macro: undefined identifier `SDL_SemPost_renamed_SDL_SignalSemaphore`");
// include/SDL3/SDL_oldnames.h:1106:9
pub const SDL_SemTryWait = @compileError("unable to translate macro: undefined identifier `SDL_SemTryWait_renamed_SDL_TryWaitSemaphore`");
// include/SDL3/SDL_oldnames.h:1107:9
pub const SDL_SemValue = @compileError("unable to translate macro: undefined identifier `SDL_SemValue_renamed_SDL_GetSemaphoreValue`");
// include/SDL3/SDL_oldnames.h:1108:9
pub const SDL_SemWait = @compileError("unable to translate macro: undefined identifier `SDL_SemWait_renamed_SDL_WaitSemaphore`");
// include/SDL3/SDL_oldnames.h:1109:9
pub const SDL_SemWaitTimeout = @compileError("unable to translate macro: undefined identifier `SDL_SemWaitTimeout_renamed_SDL_WaitSemaphoreTimeout`");
// include/SDL3/SDL_oldnames.h:1110:9
pub const SDL_cond = @compileError("unable to translate macro: undefined identifier `SDL_cond_renamed_SDL_Condition`");
// include/SDL3/SDL_oldnames.h:1113:9
pub const SDL_mutex = @compileError("unable to translate macro: undefined identifier `SDL_mutex_renamed_SDL_Mutex`");
// include/SDL3/SDL_oldnames.h:1114:9
pub const SDL_sem = @compileError("unable to translate macro: undefined identifier `SDL_sem_renamed_SDL_Semaphore`");
// include/SDL3/SDL_oldnames.h:1115:9
pub const SDL_AllocFormat = @compileError("unable to translate macro: undefined identifier `SDL_AllocFormat_renamed_SDL_GetPixelFormatDetails`");
// include/SDL3/SDL_oldnames.h:1118:9
pub const SDL_AllocPalette = @compileError("unable to translate macro: undefined identifier `SDL_AllocPalette_renamed_SDL_CreatePalette`");
// include/SDL3/SDL_oldnames.h:1119:9
pub const SDL_Colour = @compileError("unable to translate macro: undefined identifier `SDL_Colour_renamed_SDL_Color`");
// include/SDL3/SDL_oldnames.h:1120:9
pub const SDL_FreePalette = @compileError("unable to translate macro: undefined identifier `SDL_FreePalette_renamed_SDL_DestroyPalette`");
// include/SDL3/SDL_oldnames.h:1121:9
pub const SDL_MasksToPixelFormatEnum = @compileError("unable to translate macro: undefined identifier `SDL_MasksToPixelFormatEnum_renamed_SDL_GetPixelFormatForMasks`");
// include/SDL3/SDL_oldnames.h:1122:9
pub const SDL_PIXELFORMAT_BGR444 = @compileError("unable to translate macro: undefined identifier `SDL_PIXELFORMAT_BGR444_renamed_SDL_PIXELFORMAT_XBGR4444`");
// include/SDL3/SDL_oldnames.h:1123:9
pub const SDL_PIXELFORMAT_BGR555 = @compileError("unable to translate macro: undefined identifier `SDL_PIXELFORMAT_BGR555_renamed_SDL_PIXELFORMAT_XBGR1555`");
// include/SDL3/SDL_oldnames.h:1124:9
pub const SDL_PIXELFORMAT_BGR888 = @compileError("unable to translate macro: undefined identifier `SDL_PIXELFORMAT_BGR888_renamed_SDL_PIXELFORMAT_XBGR8888`");
// include/SDL3/SDL_oldnames.h:1125:9
pub const SDL_PIXELFORMAT_RGB444 = @compileError("unable to translate macro: undefined identifier `SDL_PIXELFORMAT_RGB444_renamed_SDL_PIXELFORMAT_XRGB4444`");
// include/SDL3/SDL_oldnames.h:1126:9
pub const SDL_PIXELFORMAT_RGB555 = @compileError("unable to translate macro: undefined identifier `SDL_PIXELFORMAT_RGB555_renamed_SDL_PIXELFORMAT_XRGB1555`");
// include/SDL3/SDL_oldnames.h:1127:9
pub const SDL_PIXELFORMAT_RGB888 = @compileError("unable to translate macro: undefined identifier `SDL_PIXELFORMAT_RGB888_renamed_SDL_PIXELFORMAT_XRGB8888`");
// include/SDL3/SDL_oldnames.h:1128:9
pub const SDL_PixelFormatEnumToMasks = @compileError("unable to translate macro: undefined identifier `SDL_PixelFormatEnumToMasks_renamed_SDL_GetMasksForPixelFormat`");
// include/SDL3/SDL_oldnames.h:1129:9
pub const SDL_EncloseFPoints = @compileError("unable to translate macro: undefined identifier `SDL_EncloseFPoints_renamed_SDL_GetRectEnclosingPointsFloat`");
// include/SDL3/SDL_oldnames.h:1132:9
pub const SDL_EnclosePoints = @compileError("unable to translate macro: undefined identifier `SDL_EnclosePoints_renamed_SDL_GetRectEnclosingPoints`");
// include/SDL3/SDL_oldnames.h:1133:9
pub const SDL_FRectEmpty = @compileError("unable to translate macro: undefined identifier `SDL_FRectEmpty_renamed_SDL_RectEmptyFloat`");
// include/SDL3/SDL_oldnames.h:1134:9
pub const SDL_FRectEquals = @compileError("unable to translate macro: undefined identifier `SDL_FRectEquals_renamed_SDL_RectsEqualFloat`");
// include/SDL3/SDL_oldnames.h:1135:9
pub const SDL_FRectEqualsEpsilon = @compileError("unable to translate macro: undefined identifier `SDL_FRectEqualsEpsilon_renamed_SDL_RectsEqualEpsilon`");
// include/SDL3/SDL_oldnames.h:1136:9
pub const SDL_HasIntersection = @compileError("unable to translate macro: undefined identifier `SDL_HasIntersection_renamed_SDL_HasRectIntersection`");
// include/SDL3/SDL_oldnames.h:1137:9
pub const SDL_HasIntersectionF = @compileError("unable to translate macro: undefined identifier `SDL_HasIntersectionF_renamed_SDL_HasRectIntersectionFloat`");
// include/SDL3/SDL_oldnames.h:1138:9
pub const SDL_IntersectFRect = @compileError("unable to translate macro: undefined identifier `SDL_IntersectFRect_renamed_SDL_GetRectIntersectionFloat`");
// include/SDL3/SDL_oldnames.h:1139:9
pub const SDL_IntersectFRectAndLine = @compileError("unable to translate macro: undefined identifier `SDL_IntersectFRectAndLine_renamed_SDL_GetRectAndLineIntersectionFloat`");
// include/SDL3/SDL_oldnames.h:1140:9
pub const SDL_IntersectRect = @compileError("unable to translate macro: undefined identifier `SDL_IntersectRect_renamed_SDL_GetRectIntersection`");
// include/SDL3/SDL_oldnames.h:1141:9
pub const SDL_IntersectRectAndLine = @compileError("unable to translate macro: undefined identifier `SDL_IntersectRectAndLine_renamed_SDL_GetRectAndLineIntersection`");
// include/SDL3/SDL_oldnames.h:1142:9
pub const SDL_PointInFRect = @compileError("unable to translate macro: undefined identifier `SDL_PointInFRect_renamed_SDL_PointInRectFloat`");
// include/SDL3/SDL_oldnames.h:1143:9
pub const SDL_RectEquals = @compileError("unable to translate macro: undefined identifier `SDL_RectEquals_renamed_SDL_RectsEqual`");
// include/SDL3/SDL_oldnames.h:1144:9
pub const SDL_UnionFRect = @compileError("unable to translate macro: undefined identifier `SDL_UnionFRect_renamed_SDL_GetRectUnionFloat`");
// include/SDL3/SDL_oldnames.h:1145:9
pub const SDL_UnionRect = @compileError("unable to translate macro: undefined identifier `SDL_UnionRect_renamed_SDL_GetRectUnion`");
// include/SDL3/SDL_oldnames.h:1146:9
pub const SDL_GetRendererOutputSize = @compileError("unable to translate macro: undefined identifier `SDL_GetRendererOutputSize_renamed_SDL_GetCurrentRenderOutputSize`");
// include/SDL3/SDL_oldnames.h:1149:9
pub const SDL_RenderCopy = @compileError("unable to translate macro: undefined identifier `SDL_RenderCopy_renamed_SDL_RenderTexture`");
// include/SDL3/SDL_oldnames.h:1150:9
pub const SDL_RenderCopyEx = @compileError("unable to translate macro: undefined identifier `SDL_RenderCopyEx_renamed_SDL_RenderTextureRotated`");
// include/SDL3/SDL_oldnames.h:1151:9
pub const SDL_RenderCopyExF = @compileError("unable to translate macro: undefined identifier `SDL_RenderCopyExF_renamed_SDL_RenderTextureRotated`");
// include/SDL3/SDL_oldnames.h:1152:9
pub const SDL_RenderCopyF = @compileError("unable to translate macro: undefined identifier `SDL_RenderCopyF_renamed_SDL_RenderTexture`");
// include/SDL3/SDL_oldnames.h:1153:9
pub const SDL_RenderDrawLine = @compileError("unable to translate macro: undefined identifier `SDL_RenderDrawLine_renamed_SDL_RenderLine`");
// include/SDL3/SDL_oldnames.h:1154:9
pub const SDL_RenderDrawLineF = @compileError("unable to translate macro: undefined identifier `SDL_RenderDrawLineF_renamed_SDL_RenderLine`");
// include/SDL3/SDL_oldnames.h:1155:9
pub const SDL_RenderDrawLines = @compileError("unable to translate macro: undefined identifier `SDL_RenderDrawLines_renamed_SDL_RenderLines`");
// include/SDL3/SDL_oldnames.h:1156:9
pub const SDL_RenderDrawLinesF = @compileError("unable to translate macro: undefined identifier `SDL_RenderDrawLinesF_renamed_SDL_RenderLines`");
// include/SDL3/SDL_oldnames.h:1157:9
pub const SDL_RenderDrawPoint = @compileError("unable to translate macro: undefined identifier `SDL_RenderDrawPoint_renamed_SDL_RenderPoint`");
// include/SDL3/SDL_oldnames.h:1158:9
pub const SDL_RenderDrawPointF = @compileError("unable to translate macro: undefined identifier `SDL_RenderDrawPointF_renamed_SDL_RenderPoint`");
// include/SDL3/SDL_oldnames.h:1159:9
pub const SDL_RenderDrawPoints = @compileError("unable to translate macro: undefined identifier `SDL_RenderDrawPoints_renamed_SDL_RenderPoints`");
// include/SDL3/SDL_oldnames.h:1160:9
pub const SDL_RenderDrawPointsF = @compileError("unable to translate macro: undefined identifier `SDL_RenderDrawPointsF_renamed_SDL_RenderPoints`");
// include/SDL3/SDL_oldnames.h:1161:9
pub const SDL_RenderDrawRect = @compileError("unable to translate macro: undefined identifier `SDL_RenderDrawRect_renamed_SDL_RenderRect`");
// include/SDL3/SDL_oldnames.h:1162:9
pub const SDL_RenderDrawRectF = @compileError("unable to translate macro: undefined identifier `SDL_RenderDrawRectF_renamed_SDL_RenderRect`");
// include/SDL3/SDL_oldnames.h:1163:9
pub const SDL_RenderDrawRects = @compileError("unable to translate macro: undefined identifier `SDL_RenderDrawRects_renamed_SDL_RenderRects`");
// include/SDL3/SDL_oldnames.h:1164:9
pub const SDL_RenderDrawRectsF = @compileError("unable to translate macro: undefined identifier `SDL_RenderDrawRectsF_renamed_SDL_RenderRects`");
// include/SDL3/SDL_oldnames.h:1165:9
pub const SDL_RenderFillRectF = @compileError("unable to translate macro: undefined identifier `SDL_RenderFillRectF_renamed_SDL_RenderFillRect`");
// include/SDL3/SDL_oldnames.h:1166:9
pub const SDL_RenderFillRectsF = @compileError("unable to translate macro: undefined identifier `SDL_RenderFillRectsF_renamed_SDL_RenderFillRects`");
// include/SDL3/SDL_oldnames.h:1167:9
pub const SDL_RendererFlip = @compileError("unable to translate macro: undefined identifier `SDL_RendererFlip_renamed_SDL_FlipMode`");
// include/SDL3/SDL_oldnames.h:1168:9
pub const SDL_RenderFlush = @compileError("unable to translate macro: undefined identifier `SDL_RenderFlush_renamed_SDL_FlushRenderer`");
// include/SDL3/SDL_oldnames.h:1169:9
pub const SDL_RenderGetClipRect = @compileError("unable to translate macro: undefined identifier `SDL_RenderGetClipRect_renamed_SDL_GetRenderClipRect`");
// include/SDL3/SDL_oldnames.h:1170:9
pub const SDL_RenderGetLogicalSize = @compileError("unable to translate macro: undefined identifier `SDL_RenderGetLogicalSize_renamed_SDL_GetRenderLogicalPresentation`");
// include/SDL3/SDL_oldnames.h:1171:9
pub const SDL_RenderGetMetalCommandEncoder = @compileError("unable to translate macro: undefined identifier `SDL_RenderGetMetalCommandEncoder_renamed_SDL_GetRenderMetalCommandEncoder`");
// include/SDL3/SDL_oldnames.h:1172:9
pub const SDL_RenderGetMetalLayer = @compileError("unable to translate macro: undefined identifier `SDL_RenderGetMetalLayer_renamed_SDL_GetRenderMetalLayer`");
// include/SDL3/SDL_oldnames.h:1173:9
pub const SDL_RenderGetScale = @compileError("unable to translate macro: undefined identifier `SDL_RenderGetScale_renamed_SDL_GetRenderScale`");
// include/SDL3/SDL_oldnames.h:1174:9
pub const SDL_RenderGetViewport = @compileError("unable to translate macro: undefined identifier `SDL_RenderGetViewport_renamed_SDL_GetRenderViewport`");
// include/SDL3/SDL_oldnames.h:1175:9
pub const SDL_RenderGetWindow = @compileError("unable to translate macro: undefined identifier `SDL_RenderGetWindow_renamed_SDL_GetRenderWindow`");
// include/SDL3/SDL_oldnames.h:1176:9
pub const SDL_RenderIsClipEnabled = @compileError("unable to translate macro: undefined identifier `SDL_RenderIsClipEnabled_renamed_SDL_RenderClipEnabled`");
// include/SDL3/SDL_oldnames.h:1177:9
pub const SDL_RenderLogicalToWindow = @compileError("unable to translate macro: undefined identifier `SDL_RenderLogicalToWindow_renamed_SDL_RenderCoordinatesToWindow`");
// include/SDL3/SDL_oldnames.h:1178:9
pub const SDL_RenderSetClipRect = @compileError("unable to translate macro: undefined identifier `SDL_RenderSetClipRect_renamed_SDL_SetRenderClipRect`");
// include/SDL3/SDL_oldnames.h:1179:9
pub const SDL_RenderSetLogicalSize = @compileError("unable to translate macro: undefined identifier `SDL_RenderSetLogicalSize_renamed_SDL_SetRenderLogicalPresentation`");
// include/SDL3/SDL_oldnames.h:1180:9
pub const SDL_RenderSetScale = @compileError("unable to translate macro: undefined identifier `SDL_RenderSetScale_renamed_SDL_SetRenderScale`");
// include/SDL3/SDL_oldnames.h:1181:9
pub const SDL_RenderSetVSync = @compileError("unable to translate macro: undefined identifier `SDL_RenderSetVSync_renamed_SDL_SetRenderVSync`");
// include/SDL3/SDL_oldnames.h:1182:9
pub const SDL_RenderSetViewport = @compileError("unable to translate macro: undefined identifier `SDL_RenderSetViewport_renamed_SDL_SetRenderViewport`");
// include/SDL3/SDL_oldnames.h:1183:9
pub const SDL_RenderWindowToLogical = @compileError("unable to translate macro: undefined identifier `SDL_RenderWindowToLogical_renamed_SDL_RenderCoordinatesFromWindow`");
// include/SDL3/SDL_oldnames.h:1184:9
pub const SDL_ScaleModeLinear = @compileError("unable to translate macro: undefined identifier `SDL_ScaleModeLinear_renamed_SDL_SCALEMODE_LINEAR`");
// include/SDL3/SDL_oldnames.h:1185:9
pub const SDL_ScaleModeNearest = @compileError("unable to translate macro: undefined identifier `SDL_ScaleModeNearest_renamed_SDL_SCALEMODE_NEAREST`");
// include/SDL3/SDL_oldnames.h:1186:9
pub const RW_SEEK_CUR = @compileError("unable to translate macro: undefined identifier `RW_SEEK_CUR_renamed_SDL_IO_SEEK_CUR`");
// include/SDL3/SDL_oldnames.h:1189:9
pub const RW_SEEK_END = @compileError("unable to translate macro: undefined identifier `RW_SEEK_END_renamed_SDL_IO_SEEK_END`");
// include/SDL3/SDL_oldnames.h:1190:9
pub const RW_SEEK_SET = @compileError("unable to translate macro: undefined identifier `RW_SEEK_SET_renamed_SDL_IO_SEEK_SET`");
// include/SDL3/SDL_oldnames.h:1191:9
pub const SDL_RWFromConstMem = @compileError("unable to translate macro: undefined identifier `SDL_RWFromConstMem_renamed_SDL_IOFromConstMem`");
// include/SDL3/SDL_oldnames.h:1192:9
pub const SDL_RWFromFile = @compileError("unable to translate macro: undefined identifier `SDL_RWFromFile_renamed_SDL_IOFromFile`");
// include/SDL3/SDL_oldnames.h:1193:9
pub const SDL_RWFromMem = @compileError("unable to translate macro: undefined identifier `SDL_RWFromMem_renamed_SDL_IOFromMem`");
// include/SDL3/SDL_oldnames.h:1194:9
pub const SDL_RWclose = @compileError("unable to translate macro: undefined identifier `SDL_RWclose_renamed_SDL_CloseIO`");
// include/SDL3/SDL_oldnames.h:1195:9
pub const SDL_RWops = @compileError("unable to translate macro: undefined identifier `SDL_RWops_renamed_SDL_IOStream`");
// include/SDL3/SDL_oldnames.h:1196:9
pub const SDL_RWread = @compileError("unable to translate macro: undefined identifier `SDL_RWread_renamed_SDL_ReadIO`");
// include/SDL3/SDL_oldnames.h:1197:9
pub const SDL_RWseek = @compileError("unable to translate macro: undefined identifier `SDL_RWseek_renamed_SDL_SeekIO`");
// include/SDL3/SDL_oldnames.h:1198:9
pub const SDL_RWsize = @compileError("unable to translate macro: undefined identifier `SDL_RWsize_renamed_SDL_GetIOSize`");
// include/SDL3/SDL_oldnames.h:1199:9
pub const SDL_RWtell = @compileError("unable to translate macro: undefined identifier `SDL_RWtell_renamed_SDL_TellIO`");
// include/SDL3/SDL_oldnames.h:1200:9
pub const SDL_RWwrite = @compileError("unable to translate macro: undefined identifier `SDL_RWwrite_renamed_SDL_WriteIO`");
// include/SDL3/SDL_oldnames.h:1201:9
pub const SDL_ReadBE16 = @compileError("unable to translate macro: undefined identifier `SDL_ReadBE16_renamed_SDL_ReadU16BE`");
// include/SDL3/SDL_oldnames.h:1202:9
pub const SDL_ReadBE32 = @compileError("unable to translate macro: undefined identifier `SDL_ReadBE32_renamed_SDL_ReadU32BE`");
// include/SDL3/SDL_oldnames.h:1203:9
pub const SDL_ReadBE64 = @compileError("unable to translate macro: undefined identifier `SDL_ReadBE64_renamed_SDL_ReadU64BE`");
// include/SDL3/SDL_oldnames.h:1204:9
pub const SDL_ReadLE16 = @compileError("unable to translate macro: undefined identifier `SDL_ReadLE16_renamed_SDL_ReadU16LE`");
// include/SDL3/SDL_oldnames.h:1205:9
pub const SDL_ReadLE32 = @compileError("unable to translate macro: undefined identifier `SDL_ReadLE32_renamed_SDL_ReadU32LE`");
// include/SDL3/SDL_oldnames.h:1206:9
pub const SDL_ReadLE64 = @compileError("unable to translate macro: undefined identifier `SDL_ReadLE64_renamed_SDL_ReadU64LE`");
// include/SDL3/SDL_oldnames.h:1207:9
pub const SDL_WriteBE16 = @compileError("unable to translate macro: undefined identifier `SDL_WriteBE16_renamed_SDL_WriteU16BE`");
// include/SDL3/SDL_oldnames.h:1208:9
pub const SDL_WriteBE32 = @compileError("unable to translate macro: undefined identifier `SDL_WriteBE32_renamed_SDL_WriteU32BE`");
// include/SDL3/SDL_oldnames.h:1209:9
pub const SDL_WriteBE64 = @compileError("unable to translate macro: undefined identifier `SDL_WriteBE64_renamed_SDL_WriteU64BE`");
// include/SDL3/SDL_oldnames.h:1210:9
pub const SDL_WriteLE16 = @compileError("unable to translate macro: undefined identifier `SDL_WriteLE16_renamed_SDL_WriteU16LE`");
// include/SDL3/SDL_oldnames.h:1211:9
pub const SDL_WriteLE32 = @compileError("unable to translate macro: undefined identifier `SDL_WriteLE32_renamed_SDL_WriteU32LE`");
// include/SDL3/SDL_oldnames.h:1212:9
pub const SDL_WriteLE64 = @compileError("unable to translate macro: undefined identifier `SDL_WriteLE64_renamed_SDL_WriteU64LE`");
// include/SDL3/SDL_oldnames.h:1213:9
pub const SDL_NUM_SCANCODES = @compileError("unable to translate macro: undefined identifier `SDL_NUM_SCANCODES_renamed_SDL_SCANCODE_COUNT`");
// include/SDL3/SDL_oldnames.h:1216:9
pub const SDL_SCANCODE_AUDIOFASTFORWARD = @compileError("unable to translate macro: undefined identifier `SDL_SCANCODE_AUDIOFASTFORWARD_renamed_SDL_SCANCODE_MEDIA_FAST_FORWARD`");
// include/SDL3/SDL_oldnames.h:1217:9
pub const SDL_SCANCODE_AUDIOMUTE = @compileError("unable to translate macro: undefined identifier `SDL_SCANCODE_AUDIOMUTE_renamed_SDL_SCANCODE_MUTE`");
// include/SDL3/SDL_oldnames.h:1218:9
pub const SDL_SCANCODE_AUDIONEXT = @compileError("unable to translate macro: undefined identifier `SDL_SCANCODE_AUDIONEXT_renamed_SDL_SCANCODE_MEDIA_NEXT_TRACK`");
// include/SDL3/SDL_oldnames.h:1219:9
pub const SDL_SCANCODE_AUDIOPLAY = @compileError("unable to translate macro: undefined identifier `SDL_SCANCODE_AUDIOPLAY_renamed_SDL_SCANCODE_MEDIA_PLAY`");
// include/SDL3/SDL_oldnames.h:1220:9
pub const SDL_SCANCODE_AUDIOPREV = @compileError("unable to translate macro: undefined identifier `SDL_SCANCODE_AUDIOPREV_renamed_SDL_SCANCODE_MEDIA_PREVIOUS_TRACK`");
// include/SDL3/SDL_oldnames.h:1221:9
pub const SDL_SCANCODE_AUDIOREWIND = @compileError("unable to translate macro: undefined identifier `SDL_SCANCODE_AUDIOREWIND_renamed_SDL_SCANCODE_MEDIA_REWIND`");
// include/SDL3/SDL_oldnames.h:1222:9
pub const SDL_SCANCODE_AUDIOSTOP = @compileError("unable to translate macro: undefined identifier `SDL_SCANCODE_AUDIOSTOP_renamed_SDL_SCANCODE_MEDIA_STOP`");
// include/SDL3/SDL_oldnames.h:1223:9
pub const SDL_SCANCODE_EJECT = @compileError("unable to translate macro: undefined identifier `SDL_SCANCODE_EJECT_renamed_SDL_SCANCODE_MEDIA_EJECT`");
// include/SDL3/SDL_oldnames.h:1224:9
pub const SDL_SCANCODE_MEDIASELECT = @compileError("unable to translate macro: undefined identifier `SDL_SCANCODE_MEDIASELECT_renamed_SDL_SCANCODE_MEDIA_SELECT`");
// include/SDL3/SDL_oldnames.h:1225:9
pub const SDL_SensorClose = @compileError("unable to translate macro: undefined identifier `SDL_SensorClose_renamed_SDL_CloseSensor`");
// include/SDL3/SDL_oldnames.h:1228:9
pub const SDL_SensorFromInstanceID = @compileError("unable to translate macro: undefined identifier `SDL_SensorFromInstanceID_renamed_SDL_GetSensorFromID`");
// include/SDL3/SDL_oldnames.h:1229:9
pub const SDL_SensorGetData = @compileError("unable to translate macro: undefined identifier `SDL_SensorGetData_renamed_SDL_GetSensorData`");
// include/SDL3/SDL_oldnames.h:1230:9
pub const SDL_SensorGetInstanceID = @compileError("unable to translate macro: undefined identifier `SDL_SensorGetInstanceID_renamed_SDL_GetSensorID`");
// include/SDL3/SDL_oldnames.h:1231:9
pub const SDL_SensorGetName = @compileError("unable to translate macro: undefined identifier `SDL_SensorGetName_renamed_SDL_GetSensorName`");
// include/SDL3/SDL_oldnames.h:1232:9
pub const SDL_SensorGetNonPortableType = @compileError("unable to translate macro: undefined identifier `SDL_SensorGetNonPortableType_renamed_SDL_GetSensorNonPortableType`");
// include/SDL3/SDL_oldnames.h:1233:9
pub const SDL_SensorGetType = @compileError("unable to translate macro: undefined identifier `SDL_SensorGetType_renamed_SDL_GetSensorType`");
// include/SDL3/SDL_oldnames.h:1234:9
pub const SDL_SensorOpen = @compileError("unable to translate macro: undefined identifier `SDL_SensorOpen_renamed_SDL_OpenSensor`");
// include/SDL3/SDL_oldnames.h:1235:9
pub const SDL_SensorUpdate = @compileError("unable to translate macro: undefined identifier `SDL_SensorUpdate_renamed_SDL_UpdateSensors`");
// include/SDL3/SDL_oldnames.h:1236:9
pub const SDL_FALSE = @compileError("unable to translate macro: undefined identifier `SDL_FALSE_renamed_false`");
// include/SDL3/SDL_oldnames.h:1239:9
pub const SDL_TABLESIZE = @compileError("unable to translate macro: undefined identifier `SDL_TABLESIZE_renamed_SDL_arraysize`");
// include/SDL3/SDL_oldnames.h:1240:9
pub const SDL_TRUE = @compileError("unable to translate macro: undefined identifier `SDL_TRUE_renamed_true`");
// include/SDL3/SDL_oldnames.h:1241:9
pub const SDL_bool = @compileError("unable to translate macro: undefined identifier `SDL_bool_renamed_bool`");
// include/SDL3/SDL_oldnames.h:1242:9
pub const SDL_size_add_overflow = @compileError("unable to translate macro: undefined identifier `SDL_size_add_overflow_renamed_SDL_size_add_check_overflow`");
// include/SDL3/SDL_oldnames.h:1243:9
pub const SDL_size_mul_overflow = @compileError("unable to translate macro: undefined identifier `SDL_size_mul_overflow_renamed_SDL_size_mul_check_overflow`");
// include/SDL3/SDL_oldnames.h:1244:9
pub const SDL_strtokr = @compileError("unable to translate macro: undefined identifier `SDL_strtokr_renamed_SDL_strtok_r`");
// include/SDL3/SDL_oldnames.h:1245:9
pub const SDL_BlitScaled = @compileError("unable to translate macro: undefined identifier `SDL_BlitScaled_renamed_SDL_BlitSurfaceScaled`");
// include/SDL3/SDL_oldnames.h:1248:9
pub const SDL_ConvertSurfaceFormat = @compileError("unable to translate macro: undefined identifier `SDL_ConvertSurfaceFormat_renamed_SDL_ConvertSurface`");
// include/SDL3/SDL_oldnames.h:1249:9
pub const SDL_FillRect = @compileError("unable to translate macro: undefined identifier `SDL_FillRect_renamed_SDL_FillSurfaceRect`");
// include/SDL3/SDL_oldnames.h:1250:9
pub const SDL_FillRects = @compileError("unable to translate macro: undefined identifier `SDL_FillRects_renamed_SDL_FillSurfaceRects`");
// include/SDL3/SDL_oldnames.h:1251:9
pub const SDL_FreeSurface = @compileError("unable to translate macro: undefined identifier `SDL_FreeSurface_renamed_SDL_DestroySurface`");
// include/SDL3/SDL_oldnames.h:1252:9
pub const SDL_GetClipRect = @compileError("unable to translate macro: undefined identifier `SDL_GetClipRect_renamed_SDL_GetSurfaceClipRect`");
// include/SDL3/SDL_oldnames.h:1253:9
pub const SDL_GetColorKey = @compileError("unable to translate macro: undefined identifier `SDL_GetColorKey_renamed_SDL_GetSurfaceColorKey`");
// include/SDL3/SDL_oldnames.h:1254:9
pub const SDL_HasColorKey = @compileError("unable to translate macro: undefined identifier `SDL_HasColorKey_renamed_SDL_SurfaceHasColorKey`");
// include/SDL3/SDL_oldnames.h:1255:9
pub const SDL_HasSurfaceRLE = @compileError("unable to translate macro: undefined identifier `SDL_HasSurfaceRLE_renamed_SDL_SurfaceHasRLE`");
// include/SDL3/SDL_oldnames.h:1256:9
pub const SDL_LoadBMP_RW = @compileError("unable to translate macro: undefined identifier `SDL_LoadBMP_RW_renamed_SDL_LoadBMP_IO`");
// include/SDL3/SDL_oldnames.h:1257:9
pub const SDL_LowerBlit = @compileError("unable to translate macro: undefined identifier `SDL_LowerBlit_renamed_SDL_BlitSurfaceUnchecked`");
// include/SDL3/SDL_oldnames.h:1258:9
pub const SDL_LowerBlitScaled = @compileError("unable to translate macro: undefined identifier `SDL_LowerBlitScaled_renamed_SDL_BlitSurfaceUncheckedScaled`");
// include/SDL3/SDL_oldnames.h:1259:9
pub const SDL_PREALLOC = @compileError("unable to translate macro: undefined identifier `SDL_PREALLOC_renamed_SDL_SURFACE_PREALLOCATED`");
// include/SDL3/SDL_oldnames.h:1260:9
pub const SDL_SIMD_ALIGNED = @compileError("unable to translate macro: undefined identifier `SDL_SIMD_ALIGNED_renamed_SDL_SURFACE_SIMD_ALIGNED`");
// include/SDL3/SDL_oldnames.h:1261:9
pub const SDL_SaveBMP_RW = @compileError("unable to translate macro: undefined identifier `SDL_SaveBMP_RW_renamed_SDL_SaveBMP_IO`");
// include/SDL3/SDL_oldnames.h:1262:9
pub const SDL_SetClipRect = @compileError("unable to translate macro: undefined identifier `SDL_SetClipRect_renamed_SDL_SetSurfaceClipRect`");
// include/SDL3/SDL_oldnames.h:1263:9
pub const SDL_SetColorKey = @compileError("unable to translate macro: undefined identifier `SDL_SetColorKey_renamed_SDL_SetSurfaceColorKey`");
// include/SDL3/SDL_oldnames.h:1264:9
pub const SDL_UpperBlit = @compileError("unable to translate macro: undefined identifier `SDL_UpperBlit_renamed_SDL_BlitSurface`");
// include/SDL3/SDL_oldnames.h:1265:9
pub const SDL_UpperBlitScaled = @compileError("unable to translate macro: undefined identifier `SDL_UpperBlitScaled_renamed_SDL_BlitSurfaceScaled`");
// include/SDL3/SDL_oldnames.h:1266:9
pub const SDL_AndroidBackButton = @compileError("unable to translate macro: undefined identifier `SDL_AndroidBackButton_renamed_SDL_SendAndroidBackButton`");
// include/SDL3/SDL_oldnames.h:1269:9
pub const SDL_AndroidGetActivity = @compileError("unable to translate macro: undefined identifier `SDL_AndroidGetActivity_renamed_SDL_GetAndroidActivity`");
// include/SDL3/SDL_oldnames.h:1270:9
pub const SDL_AndroidGetExternalStoragePath = @compileError("unable to translate macro: undefined identifier `SDL_AndroidGetExternalStoragePath_renamed_SDL_GetAndroidExternalStoragePath`");
// include/SDL3/SDL_oldnames.h:1271:9
pub const SDL_AndroidGetExternalStorageState = @compileError("unable to translate macro: undefined identifier `SDL_AndroidGetExternalStorageState_renamed_SDL_GetAndroidExternalStorageState`");
// include/SDL3/SDL_oldnames.h:1272:9
pub const SDL_AndroidGetInternalStoragePath = @compileError("unable to translate macro: undefined identifier `SDL_AndroidGetInternalStoragePath_renamed_SDL_GetAndroidInternalStoragePath`");
// include/SDL3/SDL_oldnames.h:1273:9
pub const SDL_AndroidGetJNIEnv = @compileError("unable to translate macro: undefined identifier `SDL_AndroidGetJNIEnv_renamed_SDL_GetAndroidJNIEnv`");
// include/SDL3/SDL_oldnames.h:1274:9
pub const SDL_AndroidRequestPermission = @compileError("unable to translate macro: undefined identifier `SDL_AndroidRequestPermission_renamed_SDL_RequestAndroidPermission`");
// include/SDL3/SDL_oldnames.h:1275:9
pub const SDL_AndroidRequestPermissionCallback = @compileError("unable to translate macro: undefined identifier `SDL_AndroidRequestPermissionCallback_renamed_SDL_RequestAndroidPermissionCallback`");
// include/SDL3/SDL_oldnames.h:1276:9
pub const SDL_AndroidSendMessage = @compileError("unable to translate macro: undefined identifier `SDL_AndroidSendMessage_renamed_SDL_SendAndroidMessage`");
// include/SDL3/SDL_oldnames.h:1277:9
pub const SDL_AndroidShowToast = @compileError("unable to translate macro: undefined identifier `SDL_AndroidShowToast_renamed_SDL_ShowAndroidToast`");
// include/SDL3/SDL_oldnames.h:1278:9
pub const SDL_DXGIGetOutputInfo = @compileError("unable to translate macro: undefined identifier `SDL_DXGIGetOutputInfo_renamed_SDL_GetDXGIOutputInfo`");
// include/SDL3/SDL_oldnames.h:1279:9
pub const SDL_Direct3D9GetAdapterIndex = @compileError("unable to translate macro: undefined identifier `SDL_Direct3D9GetAdapterIndex_renamed_SDL_GetDirect3D9AdapterIndex`");
// include/SDL3/SDL_oldnames.h:1280:9
pub const SDL_GDKGetDefaultUser = @compileError("unable to translate macro: undefined identifier `SDL_GDKGetDefaultUser_renamed_SDL_GetGDKDefaultUser`");
// include/SDL3/SDL_oldnames.h:1281:9
pub const SDL_GDKGetTaskQueue = @compileError("unable to translate macro: undefined identifier `SDL_GDKGetTaskQueue_renamed_SDL_GetGDKTaskQueue`");
// include/SDL3/SDL_oldnames.h:1282:9
pub const SDL_LinuxSetThreadPriority = @compileError("unable to translate macro: undefined identifier `SDL_LinuxSetThreadPriority_renamed_SDL_SetLinuxThreadPriority`");
// include/SDL3/SDL_oldnames.h:1283:9
pub const SDL_LinuxSetThreadPriorityAndPolicy = @compileError("unable to translate macro: undefined identifier `SDL_LinuxSetThreadPriorityAndPolicy_renamed_SDL_SetLinuxThreadPriorityAndPolicy`");
// include/SDL3/SDL_oldnames.h:1284:9
pub const SDL_OnApplicationDidBecomeActive = @compileError("unable to translate macro: undefined identifier `SDL_OnApplicationDidBecomeActive_renamed_SDL_OnApplicationDidEnterForeground`");
// include/SDL3/SDL_oldnames.h:1285:9
pub const SDL_OnApplicationWillResignActive = @compileError("unable to translate macro: undefined identifier `SDL_OnApplicationWillResignActive_renamed_SDL_OnApplicationWillEnterBackground`");
// include/SDL3/SDL_oldnames.h:1286:9
pub const SDL_iOSSetAnimationCallback = @compileError("unable to translate macro: undefined identifier `SDL_iOSSetAnimationCallback_renamed_SDL_SetiOSAnimationCallback`");
// include/SDL3/SDL_oldnames.h:1287:9
pub const SDL_iOSSetEventPump = @compileError("unable to translate macro: undefined identifier `SDL_iOSSetEventPump_renamed_SDL_SetiOSEventPump`");
// include/SDL3/SDL_oldnames.h:1288:9
pub const SDL_iPhoneSetAnimationCallback = @compileError("unable to translate macro: undefined identifier `SDL_iPhoneSetAnimationCallback_renamed_SDL_iOSSetAnimationCallback`");
// include/SDL3/SDL_oldnames.h:1289:9
pub const SDL_iPhoneSetEventPump = @compileError("unable to translate macro: undefined identifier `SDL_iPhoneSetEventPump_renamed_SDL_iOSSetEventPump`");
// include/SDL3/SDL_oldnames.h:1290:9
pub const SDL_SetThreadPriority = @compileError("unable to translate macro: undefined identifier `SDL_SetThreadPriority_renamed_SDL_SetCurrentThreadPriority`");
// include/SDL3/SDL_oldnames.h:1293:9
pub const SDL_TLSCleanup = @compileError("unable to translate macro: undefined identifier `SDL_TLSCleanup_renamed_SDL_CleanupTLS`");
// include/SDL3/SDL_oldnames.h:1294:9
pub const SDL_TLSGet = @compileError("unable to translate macro: undefined identifier `SDL_TLSGet_renamed_SDL_GetTLS`");
// include/SDL3/SDL_oldnames.h:1295:9
pub const SDL_TLSSet = @compileError("unable to translate macro: undefined identifier `SDL_TLSSet_renamed_SDL_SetTLS`");
// include/SDL3/SDL_oldnames.h:1296:9
pub const SDL_threadID = @compileError("unable to translate macro: undefined identifier `SDL_threadID_renamed_SDL_ThreadID`");
// include/SDL3/SDL_oldnames.h:1297:9
pub const SDL_GetTicks64 = @compileError("unable to translate macro: undefined identifier `SDL_GetTicks64_renamed_SDL_GetTicks`");
// include/SDL3/SDL_oldnames.h:1300:9
pub const SDL_COMPILEDVERSION = @compileError("unable to translate macro: undefined identifier `SDL_COMPILEDVERSION_renamed_SDL_VERSION`");
// include/SDL3/SDL_oldnames.h:1303:9
pub const SDL_PATCHLEVEL = @compileError("unable to translate macro: undefined identifier `SDL_PATCHLEVEL_renamed_SDL_MICRO_VERSION`");
// include/SDL3/SDL_oldnames.h:1304:9
pub const SDL_GL_DeleteContext = @compileError("unable to translate macro: undefined identifier `SDL_GL_DeleteContext_renamed_SDL_GL_DestroyContext`");
// include/SDL3/SDL_oldnames.h:1307:9
pub const SDL_GLattr = @compileError("unable to translate macro: undefined identifier `SDL_GLattr_renamed_SDL_GLAttr`");
// include/SDL3/SDL_oldnames.h:1308:9
pub const SDL_GLcontextFlag = @compileError("unable to translate macro: undefined identifier `SDL_GLcontextFlag_renamed_SDL_GLContextFlag`");
// include/SDL3/SDL_oldnames.h:1309:9
pub const SDL_GLcontextReleaseFlag = @compileError("unable to translate macro: undefined identifier `SDL_GLcontextReleaseFlag_renamed_SDL_GLContextReleaseFlag`");
// include/SDL3/SDL_oldnames.h:1310:9
pub const SDL_GLprofile = @compileError("unable to translate macro: undefined identifier `SDL_GLprofile_renamed_SDL_GLProfile`");
// include/SDL3/SDL_oldnames.h:1311:9
pub const SDL_GetClosestDisplayMode = @compileError("unable to translate macro: undefined identifier `SDL_GetClosestDisplayMode_renamed_SDL_GetClosestFullscreenDisplayMode`");
// include/SDL3/SDL_oldnames.h:1312:9
pub const SDL_GetDisplayOrientation = @compileError("unable to translate macro: undefined identifier `SDL_GetDisplayOrientation_renamed_SDL_GetCurrentDisplayOrientation`");
// include/SDL3/SDL_oldnames.h:1313:9
pub const SDL_GetPointDisplayIndex = @compileError("unable to translate macro: undefined identifier `SDL_GetPointDisplayIndex_renamed_SDL_GetDisplayForPoint`");
// include/SDL3/SDL_oldnames.h:1314:9
pub const SDL_GetRectDisplayIndex = @compileError("unable to translate macro: undefined identifier `SDL_GetRectDisplayIndex_renamed_SDL_GetDisplayForRect`");
// include/SDL3/SDL_oldnames.h:1315:9
pub const SDL_GetWindowDisplayIndex = @compileError("unable to translate macro: undefined identifier `SDL_GetWindowDisplayIndex_renamed_SDL_GetDisplayForWindow`");
// include/SDL3/SDL_oldnames.h:1316:9
pub const SDL_GetWindowDisplayMode = @compileError("unable to translate macro: undefined identifier `SDL_GetWindowDisplayMode_renamed_SDL_GetWindowFullscreenMode`");
// include/SDL3/SDL_oldnames.h:1317:9
pub const SDL_HasWindowSurface = @compileError("unable to translate macro: undefined identifier `SDL_HasWindowSurface_renamed_SDL_WindowHasSurface`");
// include/SDL3/SDL_oldnames.h:1318:9
pub const SDL_IsScreenSaverEnabled = @compileError("unable to translate macro: undefined identifier `SDL_IsScreenSaverEnabled_renamed_SDL_ScreenSaverEnabled`");
// include/SDL3/SDL_oldnames.h:1319:9
pub const SDL_SetWindowDisplayMode = @compileError("unable to translate macro: undefined identifier `SDL_SetWindowDisplayMode_renamed_SDL_SetWindowFullscreenMode`");
// include/SDL3/SDL_oldnames.h:1320:9
pub const SDL_WINDOW_ALLOW_HIGHDPI = @compileError("unable to translate macro: undefined identifier `SDL_WINDOW_ALLOW_HIGHDPI_renamed_SDL_WINDOW_HIGH_PIXEL_DENSITY`");
// include/SDL3/SDL_oldnames.h:1321:9
pub const SDL_WINDOW_INPUT_GRABBED = @compileError("unable to translate macro: undefined identifier `SDL_WINDOW_INPUT_GRABBED_renamed_SDL_WINDOW_MOUSE_GRABBED`");
// include/SDL3/SDL_oldnames.h:1322:9
pub const SDL_WINDOW_SKIP_TASKBAR = @compileError("unable to translate macro: undefined identifier `SDL_WINDOW_SKIP_TASKBAR_renamed_SDL_WINDOW_UTILITY`");
// include/SDL3/SDL_oldnames.h:1323:9
pub const SDL_vulkan_h_ = "";
pub const VK_DEFINE_HANDLE = @compileError("unable to translate macro: untranslatable usage of arg `object`");
// include/SDL3/SDL_vulkan.h:59:9
pub const VK_DEFINE_NON_DISPATCHABLE_HANDLE = @compileError("unable to translate macro: untranslatable usage of arg `object`");
// include/SDL3/SDL_vulkan.h:62:9
pub const threadlocaleinfostruct = struct_threadlocaleinfostruct;
pub const threadmbcinfostruct = struct_threadmbcinfostruct;
pub const __lc_time_data = struct___lc_time_data;
pub const localeinfo_struct = struct_localeinfo_struct;
pub const tagLC_ID = struct_tagLC_ID;
pub const _iobuf = struct__iobuf;
pub const _wfinddata32_t = struct__wfinddata32_t;
pub const _wfinddata32i64_t = struct__wfinddata32i64_t;
pub const _wfinddata64i32_t = struct__wfinddata64i32_t;
pub const _wfinddata64_t = struct__wfinddata64_t;
pub const _stat32 = struct__stat32;
pub const stat = struct_stat;
pub const _stat32i64 = struct__stat32i64;
pub const _stat64i32 = struct__stat64i32;
pub const _stat64 = struct__stat64;
pub const tm = struct_tm;
pub const SDL_iconv_data_t = struct_SDL_iconv_data_t;
pub const timespec = struct_timespec;
pub const itimerspec = struct_itimerspec;
pub const SDL_GLContextState = struct_SDL_GLContextState;
pub const tagMSG = struct_tagMSG;
pub const _XEvent = union__XEvent;
pub const VkInstance_T = struct_VkInstance_T;
pub const VkPhysicalDevice_T = struct_VkPhysicalDevice_T;
pub const VkSurfaceKHR_T = struct_VkSurfaceKHR_T;
pub const VkAllocationCallbacks = struct_VkAllocationCallbacks;
