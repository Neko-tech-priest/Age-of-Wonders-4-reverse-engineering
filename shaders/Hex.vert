#version 450
#extension GL_EXT_buffer_reference : require
#extension GL_EXT_scalar_block_layout : enable
// Hex
// struct Vertex
// {
//     vec3 position;
// };
layout(scalar, buffer_reference) readonly buffer HexVertexBuffer{
    vec2 vertices[];
};
layout(scalar, buffer_reference) readonly buffer HexVerticesHeightsBuffer{
    float data[];
};
uint hexIndices[12] = uint[](
    0, 2, 4,
    0, 1, 2,
    2, 3, 4,
    4, 5, 0);
// hexData
struct HexData
{
    vec3 position;
    uint textureIndex;
    uint paletteIndex;
};
layout(scalar, buffer_reference, buffer_reference_align = 4) readonly buffer HexDataBuffer{
    HexData data[];
};
layout( push_constant ) uniform constants
{
    HexVertexBuffer hexVertexBuffer;
    HexDataBuffer hexDataBuffer;
    HexVerticesHeightsBuffer hexVerticesHeightsBuffer;
}
pushConstants;
layout(set = 0, binding = 0) readonly uniform CameraBufferObject
{
	mat4 view;
	mat4 view_proj;
}
ubo;
layout(location = 0) out vec3 outPos;
layout(location = 1) out flat uint outTextureIndex;
layout(location = 2) out flat uint outPaletteIndex;

void main()
{
    vec2 position = pushConstants.hexVertexBuffer.vertices[gl_VertexIndex];
    HexData data = pushConstants.hexDataBuffer.data[gl_InstanceIndex];
    float height = pushConstants.hexVerticesHeightsBuffer.data[gl_InstanceIndex*19+gl_VertexIndex];


//     vec3 globalPos = position+data.position.xy;
    vec3 globalPos = vec3(position+data.position.xy, height);
//     gl_Position = vec4(globalPos, data.position.z, 1) * ubo.view_proj;
    gl_Position = vec4(globalPos, 1) * ubo.view_proj;
    outPos = globalPos*(sqrt(3.0)/6);
    outTextureIndex = data.textureIndex;
    outPaletteIndex = data.paletteIndex;
//     pushConstants.hexDataBuffer.data[0].textureIndex = atomicAdd(pushConstants.hexDataBuffer.data[0].textureIndex, 1);
}
