#version 450
#extension GL_EXT_shader_explicit_arithmetic_types_int64 : require
#extension GL_EXT_buffer_reference : enable
#extension GL_EXT_scalar_block_layout : enable
// Hex
// struct Vertex
// {
//     vec3 position;
//     vec3 normal;
//     vec2 UV;
//     uint color;
//     vec4 tangent;
//     vec3 position1;
// };
layout(scalar, buffer_reference, buffer_reference_align = 4) readonly buffer Vec2Ptr{
    vec2 data[];
};
layout(scalar, buffer_reference, buffer_reference_align = 4) readonly buffer Vec3Ptr{
    vec3 data[];
};
struct HexData
{
    vec2 position;
};
layout(scalar, buffer_reference, buffer_reference_align = 4) readonly buffer HexDataBuffer{
    HexData data[];
};
layout(push_constant, scalar) uniform constants
{
    HexDataBuffer hexDataBuffer;
    uint64_t vertexBuffer;
    uint verticesCount;
}
pushConstants;
layout(set = 0, binding = 0) readonly uniform CameraBufferObject
{
    mat4 view;
    mat4 view_proj;
}
ubo;
layout(location = 0) out vec2 fragTexCoord;
void main()
{
    HexData data = pushConstants.hexDataBuffer.data[gl_InstanceIndex];
    vec3 position = Vec3Ptr(pushConstants.vertexBuffer).data[gl_VertexIndex];
    vec2 uv = Vec2Ptr(pushConstants.vertexBuffer+24*pushConstants.verticesCount).data[gl_VertexIndex];
    vec3 position1 = Vec3Ptr(pushConstants.vertexBuffer+52*pushConstants.verticesCount).data[gl_VertexIndex];
    mat4 rotatePos = ubo.view;
    rotatePos[0][3] = 0;
    rotatePos[1][3] = 0;
    rotatePos[2][3] = 0;
    gl_Position = (rotatePos*vec4(position, 0.0) + (vec4(position1, 1.0)) + vec4(data.position, 0, 0)) * ubo.view_proj;
//     gl_Position = (vec4(position, 0.0) + (vec4(position1, 1.0))) * ubo.view * ubo.proj;
    fragTexCoord = uv;
}

