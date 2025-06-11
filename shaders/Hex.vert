#version 450
#extension GL_EXT_buffer_reference : require
// #extension GL_EXT_scalar_block_layout : enable
// Hex
struct Vertex
{
    vec3 position;
};
layout(buffer_reference) readonly buffer HexVertexBuffer{
    vec3 vertices[];
};
uint hexIndices[12] = uint[](
    0, 2, 4,
    0, 1, 2,
    2, 3, 4,
    4, 5, 0);
// hexData
struct HexData
{
    vec2 position;
    uint textureIndex;
    uint alignment;
};
layout(buffer_reference) readonly buffer HexDataBuffer{
    HexData data[];
};
layout( push_constant ) uniform constants
{
    HexVertexBuffer hexVertexBuffer;
    HexDataBuffer hexDataBuffer;
}
pushConstants;
layout(set = 0, binding = 0) uniform CameraBufferObject
{
	mat4 view;
	mat4 proj;
}
ubo;
layout(location = 0) out vec2 outPos;
layout(location = 1) out flat uint outTextureIndex;

void main()
{
    vec3 position = pushConstants.hexVertexBuffer.vertices[hexIndices[gl_VertexIndex]];
//     vec3 position = pushConstants.hexVertexBuffer.vertices[gl_VertexIndex];
    HexData data = pushConstants.hexDataBuffer.data[gl_InstanceIndex];
    position.xy += data.position;
	gl_Position = ubo.proj * ubo.view * vec4(position, 1.0);
	outPos = vec2(position.x, position.y)*sqrt(3.0)/6;
    outTextureIndex = data.textureIndex;
}
