const std = @import("std");
const CustomMem = @import("CustomMem.zig");
const i32Tof32 = CustomMem.i32Tof32;

const perm = [512]u8{
    151,160,137,91,90,15,
    131,13,201,95,96,53,194,233,7,225,140,36,103,30,69,142,8,99,37,240,21,10,23,
    190, 6,148,247,120,234,75,0,26,197,62,94,252,219,203,117,35,11,32,57,177,33,
    88,237,149,56,87,174,20,125,136,171,168, 68,175,74,165,71,134,139,48,27,166,
    77,146,158,231,83,111,229,122,60,211,133,230,220,105,92,41,55,46,245,40,244,
    102,143,54, 65,25,63,161, 1,216,80,73,209,76,132,187,208, 89,18,169,200,196,
    135,130,116,188,159,86,164,100,109,198,173,186, 3,64,52,217,226,250,124,123,
    5,202,38,147,118,126,255,82,85,212,207,206,59,227,47,16,58,17,182,189,28,42,
    223,183,170,213,119,248,152, 2,44,154,163, 70,221,153,101,155,167, 43,172,9,
    129,22,39,253, 19,98,108,110,79,113,224,232,178,185, 112,104,218,246,97,228,
    251,34,242,193,238,210,144,12,191,179,162,241, 81,51,145,235,249,14,239,107,
    49,192,214, 31,181,199,106,157,184, 84,204,176,115,121,50,45,127, 4,150,254,
    138,236,205,93,222,114,67,29,24,72,243,141,128,195,78,66,215,61,156,180,
    151,160,137,91,90,15,
    131,13,201,95,96,53,194,233,7,225,140,36,103,30,69,142,8,99,37,240,21,10,23,
    190, 6,148,247,120,234,75,0,26,197,62,94,252,219,203,117,35,11,32,57,177,33,
    88,237,149,56,87,174,20,125,136,171,168, 68,175,74,165,71,134,139,48,27,166,
    77,146,158,231,83,111,229,122,60,211,133,230,220,105,92,41,55,46,245,40,244,
    102,143,54, 65,25,63,161, 1,216,80,73,209,76,132,187,208, 89,18,169,200,196,
    135,130,116,188,159,86,164,100,109,198,173,186, 3,64,52,217,226,250,124,123,
    5,202,38,147,118,126,255,82,85,212,207,206,59,227,47,16,58,17,182,189,28,42,
    223,183,170,213,119,248,152, 2,44,154,163, 70,221,153,101,155,167, 43,172,9,
    129,22,39,253, 19,98,108,110,79,113,224,232,178,185, 112,104,218,246,97,228,
    251,34,242,193,238,210,144,12,191,179,162,241, 81,51,145,235,249,14,239,107,
    49,192,214, 31,181,199,106,157,184, 84,204,176,115,121,50,45,127, 4,150,254,
    138,236,205,93,222,114,67,29,24,72,243,141,128,195,78,66,215,61,156,180
};

fn grad2(hash: i32, x: f32, y: f32)f32 {
    const h: i32 = hash & 7;      // Convert low 3 bits of hash code
    const u: f32 = if(h<4) x else y;
    const v: f32 = if(h<4) y else x;
//     const u: f32 = h<4 ? x : y;  // into 8 simple gradient directions,
//     const v: f32 = h<4 ? y : x;  // and compute the dot product with (x,y).
    return (if(h&1 != 0) -u else u) + (if(h&2 != 0) -2.0*v else 2.0*v);
}

// 2D simplex noise
pub fn snoise2(x: f32, y: f32) f32
{
    const F2 = 0.5*(@sqrt(3.0)-1.0);
    const G2 = (3.0-@sqrt(3.0))/6.0;
    //     #define F2 0.366025403 // F2 = 0.5*(sqrt(3.0)-1.0)
    //     #define G2 0.211324865 // G2 = (3.0-Math.sqrt(3.0))/6.0

    // Noise contributions from the three corners
    var n0: f32 = undefined;
    var n1: f32 = undefined;
    var n2: f32 = undefined;
    // Skew the input space to determine which simplex cell we're in
    const s: f32 = (x+y)*F2;// Hairy factor for 2D
    const xs: f32 = x + s;
    const ys: f32 = y + s;
    const i: i32 = @intFromFloat(xs);
    const j: i32 = @intFromFloat(ys);

    const t: f32 = @as(f32, @floatFromInt(i+j))*G2;
    const X0: f32 = @as(f32, @floatFromInt(i))-t; // Unskew the cell origin back to (x,y) space
    const Y0: f32 = @as(f32, @floatFromInt(j))-t;
    const x0: f32 = x-X0; // The x,y distances from the cell origin
    const y0: f32 = y-Y0;

    // For the 2D case, the simplex shape is an equilateral triangle.
    // Determine which simplex we are in.

    // Offsets for second (middle) corner of simplex in (i,j) coords
    var i_1: u32 = undefined;
    var j_1: u32 = undefined;
    if(x0>y0) {i_1=1; j_1=0;} // lower triangle, XY order: (0,0)->(1,0)->(1,1)
    else {i_1=0; j_1=1;}      // upper triangle, YX order: (0,0)->(0,1)->(1,1)

    // A step of (1,0) in (i,j) means a step of (1-c,-c) in (x,y), and
    // a step of (0,1) in (i,j) means a step of (-c,1-c) in (x,y), where
    // c = (3-sqrt(3))/6

    const x1 = x0 - @as(f32, @floatFromInt(i_1)) + G2; // Offsets for middle corner in (x,y) unskewed coords
    const y1 = y0 - @as(f32, @floatFromInt(j_1)) + G2;
    const x2 = x0 - 1.0 + 2.0 * G2; // Offsets for last corner in (x,y) unskewed coords
    const y2 = y0 - 1.0 + 2.0 * G2;

    // Wrap the integer indices at 256, to avoid indexing perm[] out of bounds
    const ii: u64 = @intCast(i & 0xff);
    const jj: u64 = @intCast(j & 0xff);

    // Calculate the contribution from the three corners
    var t0 = 0.5 - x0*x0-y0*y0;
    if(t0 < 0.0)
    {
        n0 = 0.0;
    }
    else {
        t0 *= t0;
        n0 = t0 * t0 * grad2(perm[ii+perm[jj]], x0, y0);
    }

    var t1 = 0.5 - x1*x1-y1*y1;
    if(t1 < 0.0)
    {
        n1 = 0.0;
    }
    else {
        t1 *= t1;
        n1 = t1 * t1 * grad2(perm[ii+i_1+perm[jj+j_1]], x1, y1);
    }

    var t2 = 0.5 - x2*x2-y2*y2;
    if(t2 < 0.0)
    {
        n2 = 0.0;
    }
    else {
        t2 *= t2;
        n2 = t2 * t2 * grad2(perm[ii+1+perm[jj+1]], x2, y2);
    }

    // Add contributions from each corner to get the final noise value.
    // The result is scaled to return values in the interval [-1,1].
    return (40.0 * (n0 + n1 + n2)) * 0.5 + 0.5; // TODO: The scale factor is preliminary!
}