#version 450

layout(location = 0) in vec2 fragTexCoord;

// layout(set = 1, binding = 0) uniform texture2D diffuseTextures[];
// layout(set = 1, binding = 1) uniform sampler terrainSampler;

layout(set = 1, binding = 0) uniform texture2D diffuseTexture;
layout(set = 1, binding = 1) uniform sampler terrainSampler;

layout(location = 0) out vec4 outColor;

vec3 green = vec3(0.07031, 0.15332, 0.00699);
//0.12207, 0.06299, 0.02222
//0.07031, 0.15332, 0.00699
void main()
{
//     vec3 Color = texture(diffuseTexture, fragTexCoord).rgb;
    vec3 Color = texture(sampler2D(diffuseTexture, terrainSampler), fragTexCoord).rrr;
//     float alpha = texture(diffuseTexture, fragTexCoord).a;
    outColor = vec4(Color, 1.0);
}
