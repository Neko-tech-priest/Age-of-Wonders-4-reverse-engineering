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
    layout(offset = 8)uint textureIndex;
}
pushConstants;

layout(location = 0) out vec4 outColor;

vec3 SunDirection = (vec3(1, 1, 1));
vec3 normal = vec3(0,0,1);
void main()
{
    //     BC3_UNORM
    vec4 color;
    color = texture(sampler2D(diffuseTextures[pushConstants.textureIndex], generalSampler), fragTexCoord).rgba;
    float diff = min(max(dot(normal, SunDirection), 0.0), 1.0);
    color.rgb *= diff;
    //     color.rgb = vec3(normal.x, normal.y, normal.z);
    //     color.rgb = inNormal;
    //     if(gl_FragCoord.z *color.a < gl_FragDepth)
    //     {
    // //         color = vec4(0,0,0,1);
    //         discard;
    //     }
    //     if(color.a == 0)
    //     {
    //         //         color = vec4(0,0,0,1);
    //         discard;
    //     }
    //     if(z == gl_FragCoord.z)
    //     {
    //         discard;
    //     }
    //     color = vec4(z,z,z,1);
    //     color = vec4(gl_FragCoord.z,gl_FragCoord.z,gl_FragCoord.z,1);
    //     if(color.a < 1.0/2)
    //     {
    //         discard;
    //     }
    //     color.rgb *= color.a;
    //     gl_FragDepth = gl_FragDepth;
    //     gl_FragDepth = 1.0;
    outColor = vec4(color);
    // outColor = texture(diffuseTexture, fragTexCoord).aaaa;
}
