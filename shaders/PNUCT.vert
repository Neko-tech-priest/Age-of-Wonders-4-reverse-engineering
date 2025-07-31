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
//     uint textureIndex;
};
layout(scalar, buffer_reference, buffer_reference_align = 4) readonly buffer HexDataBuffer{
    HexData data[];
};
layout(push_constant, scalar) uniform constants
{
    HexDataBuffer hexDataBuffer;
//     float xy[2];
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
//     float xy[2] = pushConstants.xy;
    vec3 position = Vec3Ptr(pushConstants.vertexBuffer).data[gl_VertexIndex];
    vec2 uv = Vec2Ptr(pushConstants.vertexBuffer+24*pushConstants.verticesCount).data[gl_VertexIndex];

//     gl_Position = vec4(position, 1.0) * ubo.view * ubo.proj;
    gl_Position = vec4(position+vec3(data.position, 0), 1.0) * ubo.view_proj;
//     gl_Position = vec4(position+vec3(xy[0], xy[1], 0), 1.0) * ubo.view_proj;
    fragTexCoord = uv;
}

