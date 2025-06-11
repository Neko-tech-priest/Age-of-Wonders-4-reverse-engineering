#version 450

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec2 inUV;

layout(set = 0, binding = 0) uniform CameraBufferObject
{
	mat4 view;
	mat4 proj;
}
ubo;

layout(location = 0) out vec2 fragTexCoord;
//layout(location = 1) out vec3 fragColor;
void main()
{
	vec3 position = inPosition;
	gl_Position = ubo.proj * ubo.view * vec4(position, 1.0);
	fragTexCoord = inUV;
	//fragColor.x = (inColor>>0) & 255;
	//fragColor.y = (inColor>>8) & 255;
	//fragColor.z = (inColor>>16) & 255;

	//fragColor = inColor;
}
