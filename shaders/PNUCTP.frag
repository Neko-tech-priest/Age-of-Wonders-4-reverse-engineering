#version 450

// layout in vec3 gl_FragCoord;
layout(location = 0) in vec2 fragTexCoord;
// layout(location = 1) in float z;

layout(set = 1, binding = 0) uniform texture2D diffuseTextures[];
layout(set = 1, binding = 1) uniform sampler generalSampler;

layout(location = 0) out vec4 outColor;

// layout(depth_unchanged) in float gl_FragDepth;
// layout(depth_unchanged) out float gl_FragDepth;
// layout(depth_greater) out float gl_FragDepth;
void main()
{
//     BC3_UNORM
    vec4 color;
//     color.xy = texture(sampler2D(diffuseTextures[0+1], generalSampler), fragTexCoord).xy;//91
//     color.xy = color.xy*2.0-1.0;
//     color.z = sqrt(1.0 - color.x * color.x - color.y * color.y);
//     vec3 Color = texture(diffuseTexture, fragTexCoord).rgb;
    color = texture(sampler2D(diffuseTextures[91+5], generalSampler), fragTexCoord).rgba;
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
