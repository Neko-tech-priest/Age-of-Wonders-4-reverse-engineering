#version 450
// #extension GL_EXT_shader_explicit_arithmetic_types_int64 : require
#extension GL_EXT_buffer_reference : enable
#extension GL_EXT_scalar_block_layout : enable

layout(scalar, buffer_reference, buffer_reference_align = 4) readonly buffer VertexBuffer{
    vec3 vertices[];
};
layout(scalar, buffer_reference, buffer_reference_align = 4) readonly buffer Vec3Ptr{
    vec3 data[];
};
layout(push_constant, scalar) uniform constants
{
    VertexBuffer vertexBuffer;
    uint verticesCount;
}
pushConstants;
layout(set = 0, binding = 0) readonly uniform CameraBufferObject
{
    mat4 view;
    mat4 proj;
}
ubo;
void main()
{
    //     Vertex vertex = pushConstants.vertexBuffer.vertices[gl_VertexIndex];
    //     gl_Position = vec4(vertex.position, 1.0) * ubo.view * ubo.proj;
    //     fragTexCoord = vertex.UV;
    vec3 position = pushConstants.vertexBuffer.vertices[gl_VertexIndex];
//     vec3 position = Vec3Ptr(pushConstants.vertexBuffer).data[gl_VertexIndex];
    gl_Position = vec4(position, 1.0) * ubo.view * ubo.proj;
}

