#version 450
#extension GL_EXT_buffer_reference : require
#extension GL_EXT_scalar_block_layout : enable
// Hex
// struct Vertex
// {
//     vec3 position;
// };
layout(scalar, buffer_reference) readonly buffer HexVertexBuffer{
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
};
layout(scalar, buffer_reference, buffer_reference_align = 4) readonly buffer HexDataBuffer{
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
	mat4 view_proj;
}
ubo;
layout(location = 0) out vec2 outPos;
layout(location = 1) out flat uint outTextureIndex;

void main()
{
    vec3 position = pushConstants.hexVertexBuffer.vertices[gl_VertexIndex];
    HexData data = pushConstants.hexDataBuffer.data[gl_InstanceIndex];

// 	gl_Position = vec4(position+vec3(data.position, 0), 1.0) * ubo.view_proj;
// 	outPos = position.xy*sqrt(3.0)/6;
    vec2 globalPos = position.xy+data.position;
    gl_Position = vec4(globalPos, 0, 1) * ubo.view_proj;
    outPos = globalPos*(sqrt(3.0)/6);
    outTextureIndex = data.textureIndex;
//     pushConstants.hexDataBuffer.data[0].textureIndex = atomicAdd(pushConstants.hexDataBuffer.data[0].textureIndex, 1);
}
