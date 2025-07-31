const std = @import("std");
const math = std.math;

const pi = std.math.pi;

// Fundamental types
pub const F32x4 = @Vector(4, f32);
pub const F32x8 = @Vector(8, f32);
pub const F32x16 = @Vector(16, f32);
pub const Boolx4 = @Vector(4, bool);
pub const Boolx8 = @Vector(8, bool);
pub const Boolx16 = @Vector(16, bool);

// "Higher-level" aliases
pub const Vec = F32x4;
pub const Mat = [4]F32x4;
pub const Quat = F32x4;

// pub fn matTranslation(x: f32, y: f32, z: f32) Mat
// {
//     return
//     .{
//         .{1.0, 0.0, 0.0, 0.0},
//         .{0.0, 1.0, 0.0, 0.0},
//         .{0.0, 0.0, 1.0, 0.0},
//         .{x, y, z, 1.0},
//     };
// }
pub inline fn gradToRad(angle: f32) f32
{
    @setFloatMode(.optimized);
    return angle*pi/180.0;
}
pub fn matTranslation(x: f32, y: f32, z: f32) Mat
{
    return
    .{
        .{1.0, 0.0, 0.0, x},
        .{0.0, 1.0, 0.0, y},
        .{0.0, 0.0, 1.0, z},
        .{0.0, 0.0, 0.0, 1.0},
    };
}
pub fn matScaling(x: f32, y: f32, z: f32) Mat
{
	return
	.{
		.{x, 0.0, 0.0, 0.0},
		.{0.0, y, 0.0, 0.0},
		.{0.0, 0.0, z, 0.0},
		.{0.0, 0.0, 0.0, 1.0},
	};
}
pub fn matRotation(angleGrad: f32, comptime axis: u8) Mat
{
    @setFloatMode(.optimized);
    const angle = angleGrad*pi/180.0;
    switch(axis)
    {
        'x' =>
        return
        .{
            .{1.0, 0.0, 0.0, 0.0},
            .{0.0, @cos(angle), -@sin(angle), 0.0},
            .{0.0, @sin(angle), @cos(angle), 0.0},
            .{0.0, 0.0, 0.0, 1.0},
        },
        'y' =>
            return
            .{
                .{@cos(angle), 0.0, @sin(angle), 0.0},
                .{0.0, 1.0, 0.0, 0.0},
                .{-@sin(angle), 0.0, @cos(angle), 0.0},
                .{0.0, 0.0, 0.0, 1.0},
            },
        'z' =>
        return
        .{
            .{@cos(angle), -@sin(angle), 0.0, 0.0},
            .{@sin(angle), @cos(angle), 0.0, 0.0},
            .{0.0, 0.0, 1.0, 0.0},
            .{0.0, 0.0, 0.0, 1.0},
        },
        else => unreachable,
    }
}
pub fn matPerspective(comptime angleGrad: f32, aspect: f32, comptime n: f32, comptime f: f32) Mat
{
    const angle = gradToRad(angleGrad);
    const e = 1.0/(@tan(angle/2.0));
    return
    .{
        .{e/aspect, 0.0, 0.0, 0.0},
        .{0.0, e, 0.0, 0.0},
        .{0.0, 0.0, f/(f-n), (n*f)/(n-f)},
        .{0.0, 0.0, 1, 0.0},
    };
}
pub fn matPerspectiveInfinity(comptime angleGrad: f32, aspect: f32, comptime n: f32) Mat
{
//     _ = n;
    const angle = gradToRad(angleGrad);
    const e = 1.0/(@tan(angle/2.0));
    return
    .{
        .{e/aspect, 0.0, 0.0, 0.0},
        .{0.0, e, 0.0, 0.0},
        .{0.0, 0.0, 1, -n},
        .{0.0, 0.0, 1, 0.0},
    };
}
pub fn matPerspectiveReversed(comptime angleGrad: f32, aspect: f32, comptime n: f32, comptime f: f32) Mat
{
    const angle = gradToRad(angleGrad);
    const e = 1.0/(@tan(angle/2.0));
    return
    .{
        .{e/aspect, 0.0, 0.0, 0.0},
        .{0.0, e, 0.0, 0.0},
        .{0.0, 0.0, n/(f-n), (n*f)/(f-n)},
        .{0.0, 0.0, -1, 0.0},
    };
}
pub fn matPerspectiveReversedInfinity(comptime angleGrad: f32, aspect: f32, comptime n: f32) Mat
{
    const angle = gradToRad(angleGrad);
    const e = 1.0/(@tan(angle/2.0));
    return
    .{
        .{e/aspect, 0.0, 0.0, 0.0},
        .{0.0, e, 0.0, 0.0},
        .{0.0, 0.0, 0, n},
        .{0.0, 0.0, -1, 0.0},
    };
}
pub fn transpose(m: Mat) Mat
{
	const temp1 = @shuffle(f32, m[0], m[1], [4]i32{ 0, 1, ~@as(i32, 0), ~@as(i32, 1) });
	const temp3 = @shuffle(f32, m[0], m[1], [4]i32{ 2, 3, ~@as(i32, 2), ~@as(i32, 3) });
	const temp2 = @shuffle(f32, m[2], m[3], [4]i32{ 0, 1, ~@as(i32, 0), ~@as(i32, 1) });
	const temp4 = @shuffle(f32, m[2], m[3], [4]i32{ 2, 3, ~@as(i32, 2), ~@as(i32, 3) });
	return .{
		@shuffle(f32, temp1, temp2, [4]i32{ 0, 2, ~@as(i32, 0), ~@as(i32, 2) }),
		@shuffle(f32, temp1, temp2, [4]i32{ 1, 3, ~@as(i32, 1), ~@as(i32, 3) }),
		@shuffle(f32, temp3, temp4, [4]i32{ 0, 2, ~@as(i32, 0), ~@as(i32, 2) }),
		@shuffle(f32, temp3, temp4, [4]i32{ 1, 3, ~@as(i32, 1), ~@as(i32, 3) }),
	};
}
pub const F32x4Component = enum { x, y, z, w };

pub inline fn swizzle(
	v: F32x4,
	comptime x: F32x4Component,
	comptime y: F32x4Component,
	comptime z: F32x4Component,
	comptime w: F32x4Component,
) F32x4
{
	return @shuffle(f32, v, undefined, [4]i32{ @intFromEnum(x), @intFromEnum(y), @intFromEnum(z), @intFromEnum(w) });
}

pub fn mulAdd(v0: anytype, v1: anytype, v2: anytype) @TypeOf(v0, v1, v2)
{
	const T = @TypeOf(v0, v1, v2);
	return @mulAdd(T, v0, v1, v2);
}
pub inline fn mulMat(m0: Mat, m1: Mat) Mat
{
	var result: Mat = undefined;
	comptime var row: u32 = 0;
	inline while (row < 4) : (row += 1)
    {
		const vx = swizzle(m1[row], .x, .x, .x, .x);
		const vy = swizzle(m1[row], .y, .y, .y, .y);
		const vz = swizzle(m1[row], .z, .z, .z, .z);
		const vw = swizzle(m1[row], .w, .w, .w, .w);
		result[row] = mulAdd(vx, m0[0], vz * m0[2]) + mulAdd(vy, m0[1], vw * m0[3]);
	}
	return result;
}
pub inline fn mulMatFast(m0: Mat, m1: Mat) Mat
{
    @setFloatMode(.optimized);
    var result: Mat = undefined;
    comptime var row: u32 = 0;
    inline while (row < 4) : (row += 1)
    {
        const vx = swizzle(m1[row], .x, .x, .x, .x);
        const vy = swizzle(m1[row], .y, .y, .y, .y);
        const vz = swizzle(m1[row], .z, .z, .z, .z);
        const vw = swizzle(m1[row], .w, .w, .w, .w);
        result[row] = mulAdd(vx, m0[0], vz * m0[2]) + mulAdd(vy, m0[1], vw * m0[3]);
    }
    return result;
}
// pub fn Q_rsqrt(number: f32) f32
// {
//     var i: i32 = undefined;
//     var x2: f32 = undefined;
//     var y: f32 = undefined;
//     x2 = number * 0.5;
//     y = number;
//     i =  @as(*i32, @ptrCast(&y)).*;
//     i  = 0x5f3759df - (i >> 1);
//     y = @as(*f32, @ptrCast(&i)).*;
//     y  = y * (1.5 - (x2 * y * y));
//     return y;
// }
// pub fn Q_rsqrt_2(num: f32) f32
// {
//     var i: i32 = @bitCast(num);
//     i = 0x5F1FFFF9 -% (i >> 1);
//     var y: f32 = @bitCast(i);
//     y *= 0.703952253 * (2.38924456 - num * y * y);
//     return y;
// }
pub fn invSqrt32(num: f32) f32
{
    return 1 / @sqrt(num);
}
pub fn invSqrt32Fast(num: f32) f32
{
    @setFloatMode(.optimized);
    return 1 / @sqrt(num);
}
// pub fn invSqrt64(num: f64) f64
// {
//     return 1 / @sqrt(num);
// }
// pub fn invSqrt64Fast(num: f64) f64
// {
//     @setFloatMode(.optimized);
//     return 1 / @sqrt(num);
// }
