#version 450
#extension GL_EXT_nonuniform_qualifier : require

layout(location = 0) in vec2 inPos;
layout(location = 1) in flat uint inTextureIndex;

layout(set = 1, binding = 0) uniform texture2D diffuseTextures[];
layout(set = 1, binding = 1) uniform sampler terrainSampler;
layout(set = 2, binding = 0) uniform sampler2D palette;

layout(location = 0) out vec4 outColor;

vec3 GroundIBL = vec3(0.12, 0.26, 0.17);

float DirectLightIntensity = 5.0;
// vec3 SunDirection = (vec3(0, 0, 1));
vec3 SunDirection = normalize(vec3(1, 1, 1));
// vec3 SunDirection = (vec3(0.57291, 0.57291, 0.58613));
float ambient = 10.0;
void main()
{
    vec4 data = texture(sampler2D(diffuseTextures[nonuniformEXT(inTextureIndex)], terrainSampler), inPos);
    vec3 normal;
//     normal.xy = data.xy;
    normal.xy = data.xy * 2.0 - 1.0;
    normal.z = sqrt(1.0 - normal.x * normal.x - normal.y * normal.y);
	float alpha = data.a;
	vec3 color = texture(palette, vec2(alpha * 0.8750 - 0.0625, 0.5)).rgb;
    float diff = max(dot(normal, SunDirection), 0.0);
//     color += GroundIBL*0.5;
    color *= diff;
    color *= DirectLightIntensity;
	outColor = vec4(color, 1.0);

//     vec3 blueNormalMap = vec3(data.xy, 1.0);
//     blueNormalMap.xy *= diff;
// //     blueNormalMap *= ambient;
// //     color = blueNormalMap * color;
//     outColor = vec4(blueNormalMap, 1.0);

//     outColor = vec4(pow(color*diff, 2.2), 1.0);
//     alpha = pow(alpha, (2.2));
// 	outColor = vec4(vec3(alpha), 1.0);



//     vec3 TEXCOORD_4 = vec3(0, 0, 0);
//     float _109 = TEXCOORD_4.x;
//     float _111 = TEXCOORD_4.y;
//     float _113 = TEXCOORD_4.z;
//     vec4 TEXCOORD_3 = vec4(0, 0, 0, 1);
//     float _115 = TEXCOORD_3.x;
//     float _117 = TEXCOORD_3.y;
//     float _119 = TEXCOORD_3.z;
// //     vec2 TEXCOORD_2 = vec2(0, 0);
//     vec3 TEXCOORD = vec3(0, 0, 0);
//     float _133 = TEXCOORD.x;
//     float _135 = TEXCOORD.y;
//     float _137 = TEXCOORD.z;
//
}
