#version 450
#extension GL_EXT_nonuniform_qualifier : require
// layout in vec3 gl_FragCoord;
layout(location = 0) in vec2 fragTexCoord;
// layout(location = 1) in flat vec3 inNormal;
// layout(location = 1) in float z;

layout(set = 1, binding = 0) uniform texture2D diffuseTextures[];
layout(set = 1, binding = 1) uniform sampler generalSampler;


layout(push_constant) uniform constants
{
    layout(offset = 12+8)uint textureIndex;
}
pushConstants;

layout(location = 0) out vec4 outColor;

vec3 SunDirection = (vec3(1, 1, 1));
vec3 normal = vec3(0,0,1);
void main()
{
    vec4 color;
    color = texture(sampler2D(diffuseTextures[pushConstants.textureIndex], generalSampler), fragTexCoord).rgba;
//     if(color.a < 0.5)
//         discard;
    if(color.a < 1.0)
        discard;
    float diff = min(max(dot(normal, SunDirection), 0.0), 1.0);
    color.rgb *= diff;
    outColor = vec4(color);
}
