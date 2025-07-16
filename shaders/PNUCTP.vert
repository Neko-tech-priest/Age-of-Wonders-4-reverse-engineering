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
//     mat4 rotatePos = mat4(
//         1, 0, 0, ubo.view[0][3],
//         0, 1, 0, ubo.view[1][3],
//         1, 0, 1, ubo.view[2][3],
//         0, 0, 0, 1
//     );
//     mat4 rotatePos = mat4(
//         1, ubo.view[0][1], 0, 0,
//         0, 1, 0, 0,
//         1, 0, 1, 0,
//         0, 0, 0, 1
//     );
    mat4 rotatePos = ubo.view;
    rotatePos[0][3] = 0;
    rotatePos[1][3] = 0;
    rotatePos[2][3] = 0;
//     vec3 offset_pos = vec3();
//     gl_Position = vec4(vertex.position+vertex.position1, 1.0) * ubo.view * ubo.proj;
    gl_Position = (rotatePos*vec4(vertex.position, 1.0) + (vec4(vertex.position1, 1.0))) * ubo.view * ubo.proj;
    fragTexCoord = vertex.UV;
}

