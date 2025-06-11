#version 450

layout(location = 0) in vec2 fragTexCoord;

layout(set = 1, binding = 1) uniform sampler2D diffuseTexture;

layout(location = 0) out vec4 outColor;

void main()
{
    vec3 Color;
    Color.xy = texture(diffuseTexture, fragTexCoord).rg;// * 2.0 - 1.0
//     Color = Color*0.5+0.5;
    Color.z = sqrt(1.0 - Color.x * Color.x - Color.y * Color.y);
//     Color = Color*0.5+0.5;
    outColor = vec4(Color, 1.0);
}
