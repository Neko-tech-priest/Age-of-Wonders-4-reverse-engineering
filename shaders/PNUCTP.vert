#version 450
#extension GL_EXT_buffer_reference : require
#extension GL_EXT_scalar_block_layout : enable
// Hex
struct Vertex
{
    vec3 position;
    vec3 normal;
    vec2 UV;
    uint color;
    vec4 tangent;
    vec3 position1;
};
// buffer_reference_align = 2
layout(scalar, buffer_reference, buffer_reference_align = 4) readonly buffer VertexBuffer{
    Vertex vertices[];
};
layout(push_constant) uniform constants
{
    VertexBuffer vertexBuffer;
}
pushConstants;
layout(set = 0, binding = 0) readonly uniform CameraBufferObject
{
    mat4 view;
    mat4 proj;
}
ubo;
layout(location = 0) out vec2 fragTexCoord;
void main()
{
    Vertex vertex = pushConstants.vertexBuffer.vertices[gl_VertexIndex];
    gl_Position = vec4(vertex.position, 1.0) * ubo.view * ubo.proj;
    fragTexCoord = vertex.UV;
}

