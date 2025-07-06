#version 450
#extension GL_EXT_buffer_reference : require
#extension GL_EXT_scalar_block_layout : enable
// Hex
struct Vertex
{
    vec3 position;
};
layout(scalar, buffer_reference) readonly buffer HexVertexBuffer{
    Vertex vertices[];
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
};
layout(scalar, buffer_reference) readonly buffer HexDataBuffer{
    HexData data[];
};
layout( push_constant ) uniform constants
{
    HexVertexBuffer hexVertexBuffer;
    HexDataBuffer hexDataBuffer;
}
pushConstants;
layout(set = 0, binding = 0) readonly uniform CameraBufferObject
{
	mat4 view;
	mat4 proj;
}
ubo;
layout(location = 0) out vec2 outPos;
layout(location = 1) out flat uint outTextureIndex;

void main()
{
//     vec3 position = pushConstants.hexVertexBuffer.vertices[hexIndices[gl_VertexIndex]];
    Vertex vertex = pushConstants.hexVertexBuffer.vertices[gl_VertexIndex];
    HexData data = pushConstants.hexDataBuffer.data[gl_InstanceIndex];
    vec3 position = vertex.position;
    position.xy += data.position;
	gl_Position = vec4(vertex.position, 1.0) * ubo.view * ubo.proj;
	outPos = vec2(position.x, position.y)*sqrt(3.0)/6;
    outTextureIndex = data.textureIndex;
//     pushConstants.hexDataBuffer.data[0].textureIndex+=1;
//     pushConstants.hexDataBuffer.data[0].textureIndex = atomicAdd(pushConstants.hexDataBuffer.data[0].textureIndex, 1);
//     outTextureIndex =  5;
}
