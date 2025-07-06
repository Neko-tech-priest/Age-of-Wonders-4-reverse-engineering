#version 450

layout(location = 0) in vec2 fragTexCoord;

layout(set = 1, binding = 0) uniform texture2D diffuseTextures[];
layout(set = 1, binding = 1) uniform sampler generalSampler;

layout(location = 0) out vec4 outColor;

void main()
{
//     vec3 Color = texture(diffuseTexture, fragTexCoord).rgb;
    vec3 Color = texture(sampler2D(diffuseTextures[91+1], generalSampler), fragTexCoord).rgb;
    outColor = vec4(Color, 1.0);
    // outColor = texture(diffuseTexture, fragTexCoord).aaaa;
}
