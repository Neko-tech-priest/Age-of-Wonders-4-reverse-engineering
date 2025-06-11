const std = @import("std");
const math = std.math;

const pi: f32 = std.math.pi;

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

pub noinline fn matTranslation(x: f32, y: f32, z: f32) Mat
{
	return
	.{
		.{1.0, 0.0, 0.0, 0.0},
		.{0.0, 1.0, 0.0, 0.0},
		.{0.0, 0.0, 1.0, 0.0},
		.{x, y, z, 1.0},
	};
}
pub noinline fn matScaling(x: f32, y: f32, z: f32) Mat
{
	return
	.{
		.{x, 0.0, 0.0, 0.0},
		.{0.0, y, 0.0, 0.0},
		.{0.0, 0.0, z, 0.0},
		.{0.0, 0.0, 0.0, 1.0},
	};
}
pub noinline fn matRotationX(angleGrad: f32) Mat
{
	const angle = angleGrad*pi/180.0;
	return
	.{
		.{1.0, 0.0, 0.0, 0.0},
		.{0.0, @cos(angle), @sin(angle), 0.0},
		.{0.0, -@sin(angle), @cos(angle), 0.0},
		.{0.0, 0.0, 0.0, 1.0},
	};
}
pub noinline fn matRotationY(angleGrad: f32) Mat
{
	const angle = angleGrad*pi/180.0;
	return
	.{
		.{@cos(angle), 0.0, -@sin(angle), 0.0},
		.{0.0, 1.0, 0.0, 0.0},
		.{@sin(angle), 0.0, @cos(angle), 0.0},
		.{0.0, 0.0, 0.0, 1.0},
	};
}
pub noinline fn matRotationZ(angleGrad: f32) Mat
{
	const angle = angleGrad*pi/180.0;
	return
	.{
		.{@cos(angle), @sin(angle), 0.0, 0.0},
		.{-@sin(angle), @cos(angle), 0.0, 0.0},
		.{0.0, 0.0, 1.0, 0.0},
		.{0.0, 0.0, 0.0, 1.0},
	};
}
pub noinline fn matPerspective(angleGrad: f32, aspect: f32, n: f32, f: f32) Mat
{
	const angle = angleGrad*pi/180.0;
	return
	.{
		.{1.0/(@tan(angle/2.0)*aspect), 0.0, 0.0, 0.0},
		.{0.0, 1.0/(@tan(angle/2.0)), 0.0, 0.0},
		.{0.0, 0.0, f/(f-n), 1.0},
		.{0.0, 0.0, -(f*n)/(f-n), 1.0},//0.0
	};
//     var i: usize = 0;
//     while(i < 16) : (i+=1)
//         self.*.data[i] = 0;
//     self.*.data[ 0] = 1.0/(@tan(angle/2.0)*aspect);//*aspect
//     self.*.data[ 5] = 1.0/(@tan(angle/2.0));
//     self.*.data[10] = f/(f-n);self.*.data[11] = 1;
//     self.*.data[14] = -(f*n)/(f-n);// f / (-f/n + 1)
}
pub noinline fn transpose(m: Mat) Mat
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
) F32x4 {
	return @shuffle(f32, v, undefined, [4]i32{ @intFromEnum(x), @intFromEnum(y), @intFromEnum(z), @intFromEnum(w) });
}

pub fn mulAdd(v0: anytype, v1: anytype, v2: anytype) @TypeOf(v0, v1, v2) {
	const T = @TypeOf(v0, v1, v2);
	return @mulAdd(T, v0, v1, v2);
//     return v0 * v1 + v2;
}
pub noinline fn mulMat(m0: Mat, m1: Mat) Mat {
	var result: Mat = undefined;
	comptime var row: u32 = 0;
	inline while (row < 4) : (row += 1) {
		const vx = swizzle(m0[row], .x, .x, .x, .x);
		const vy = swizzle(m0[row], .y, .y, .y, .y);
		const vz = swizzle(m0[row], .z, .z, .z, .z);
		const vw = swizzle(m0[row], .w, .w, .w, .w);
		result[row] = mulAdd(vx, m1[0], vz * m1[2]) + mulAdd(vy, m1[1], vw * m1[3]);
	}
	return result;
}
