#version 450
#extension GL_EXT_nonuniform_qualifier : require

layout(location = 0) in vec2 inPos;
layout(location = 1) in flat uint inTextureIndex;

layout(set = 1, binding = 0) uniform texture2D diffuseTextures[];
layout(set = 1, binding = 1) uniform sampler terrainSampler;
// layout(set = 2, binding = 0) uniform sampler2D palette;

layout(location = 0) out vec4 outColor;

void main()
{
	vec3 color = texture(sampler2D(diffuseTextures[nonuniformEXT(inTextureIndex)], terrainSampler), inPos).rgb;
// 	alpha = pow(alpha, (2.2));
// 	vec3 color = texture(palette, vec2(alpha+0.0625, 0.0)).rgb;
// 	color += GroundIBL*(1.0-alpha);
// 	alpha = alpha * 2.0 - 1.0;
// 	color = pow(color, vec3(2.2));
	outColor = vec4(color, 1.0);
//     outColor = vec4(vec3(0.0), 1.0);
// 	outColor = vec4(alpha.xxx, 1.0);
}
