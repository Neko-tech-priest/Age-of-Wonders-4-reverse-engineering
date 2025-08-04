const std = @import("std");
const mem = std.mem;

const Vulkan = @import("Vulkan.zig");

const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;
const VkPipeline = @import("VkPipeline.zig");
const Image = @import("Image.zig");
const Texture = @import("Texture.zig").Texture;

const Camera = @import("Camera.zig");

// const AoW4_clb_custom = @import("AoW4_clb_custom.zig");

pub const HexData = struct
{
	x: f32,
	y: f32,
    textureIndex: u32,
//     alignment: u32,
};
pub const Vertex = struct
{
//     position: [3]f32 align(16),
	position: [3]f32
};

pub fn Create_DiffuseMaterial_VkDescriptorSetLayout(texturesCount: u32, descriptorSetLayout: *Vulkan.VkDescriptorSetLayout) void
{
	const descriptorSetLayoutBindings = [2]Vulkan.VkDescriptorSetLayoutBinding
	{
		.{
			.binding = 0,
			.descriptorCount = texturesCount,
			.descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE,
			.pImmutableSamplers = null,
			.stageFlags = Vulkan.VK_SHADER_STAGE_FRAGMENT_BIT,
		},
		.{
			.binding = 1,
			.descriptorCount = 1,
			.descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_SAMPLER,
			.pImmutableSamplers = &VulkanGlobalState._textureSampler,
			.stageFlags = Vulkan.VK_SHADER_STAGE_FRAGMENT_BIT,
		},
	};
	const layoutInfo = Vulkan.VkDescriptorSetLayoutCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO,
		.bindingCount = descriptorSetLayoutBindings.len,
		.pBindings = &descriptorSetLayoutBindings,
	};
	VK_CHECK(Vulkan.vkCreateDescriptorSetLayout(VulkanGlobalState._device, &layoutInfo, null, descriptorSetLayout));
}
pub fn Create_DiffuseMaterial_VkDescriptorPool(texturesCount: u32, descriptorPool: *Vulkan.VkDescriptorPool) void
{
	const poolSizes = [2]Vulkan.VkDescriptorPoolSize
	{
		.{
			.type = Vulkan.VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE,
			.descriptorCount = texturesCount,
		},
		.{
			.type = Vulkan.VK_DESCRIPTOR_TYPE_SAMPLER,
			.descriptorCount = 1,
		},
	};

	const poolInfo = Vulkan.VkDescriptorPoolCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO,
		.poolSizeCount = poolSizes.len,
		.pPoolSizes = &poolSizes,
		.maxSets = 1,
	};
	//
	VK_CHECK(Vulkan.vkCreateDescriptorPool(VulkanGlobalState._device, &poolInfo, null, descriptorPool));
}
pub fn Create_DiffuseMaterial_VkDescriptorSet(texturesCount: u32, textures: [*]Texture, descriptorSetLayout: Vulkan.VkDescriptorSetLayout, descriptorPool: Vulkan.VkDescriptorPool, descriptorSet: *Vulkan.VkDescriptorSet) void
{
	const allocInfo = Vulkan.VkDescriptorSetAllocateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO,
		.descriptorPool = descriptorPool,
		.descriptorSetCount = 1,
		.pSetLayouts = &descriptorSetLayout,
	};

	VK_CHECK(Vulkan.vkAllocateDescriptorSets(VulkanGlobalState._device, &allocInfo, descriptorSet));

	var textureInfo: [256]Vulkan.VkDescriptorImageInfo = undefined;
	for(0..texturesCount) |i|
	{
		textureInfo[i].imageLayout = Vulkan.VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;
		textureInfo[i].imageView = textures[i].vkImageView;
//      textureInfo[i].sampler = VulkanGlobalState._textureSampler;
	}

	const descriptorWrites = [1]Vulkan.VkWriteDescriptorSet
	{
		.{
			.sType = Vulkan.VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET,
			.dstSet = descriptorSet.*,
			.dstBinding = 0,
			.dstArrayElement = 0,
			.descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE,
			.descriptorCount = texturesCount,
			.pImageInfo = &textureInfo,
		},
//         .{
//             .sType = Vulkan.VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET,
//             .dstSet = descriptorSet.*,
//             .dstBinding = 1,
//             .dstArrayElement = 0,
//             .descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_SAMPLER,
//             .descriptorCount = 1,
//             .pImageInfo = &samplerInfo,
//         },
	};

	Vulkan.vkUpdateDescriptorSets(VulkanGlobalState._device, descriptorWrites.len, &descriptorWrites, 0, null);
}
pub var _paletteSampler: Vulkan.VkSampler = undefined;
pub fn createHexPaletteSampler() void
{
    const samplerInfo = Vulkan.VkSamplerCreateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO,
        // VK_FILTER_NEAREST
        // VK_FILTER_LINEAR
        .magFilter = Vulkan.VK_FILTER_LINEAR,
        .minFilter = Vulkan.VK_FILTER_LINEAR,
        // VK_SAMPLER_MIPMAP_MODE_NEAREST
        // VK_SAMPLER_MIPMAP_MODE_LINEAR
//         .mipmapMode = Vulkan.VK_SAMPLER_MIPMAP_MODE_LINEAR,
        .addressModeU = Vulkan.VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE,
        .addressModeV = Vulkan.VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE,
        .addressModeW = Vulkan.VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE,
//       .mipLodBias
//       .anisotropyEnable = Vulkan.VK_TRUE,
//       .maxAnisotropy = VulkanGlobalState._deviceProperties.limits.maxSamplerAnisotropy,
        .compareEnable = Vulkan.VK_FALSE,
        .compareOp = Vulkan.VK_COMPARE_OP_NEVER,//VK_COMPARE_OP_ALWAYS
//       .minLod = 0.0,
//       .maxLod = Vulkan.VK_LOD_CLAMP_NONE,
//       .borderColor = Vulkan.VK_BORDER_COLOR_INT_OPAQUE_BLACK,
      .unnormalizedCoordinates = Vulkan.VK_TRUE,

    };
    VK_CHECK(Vulkan.vkCreateSampler(VulkanGlobalState._device, &samplerInfo, null, &_paletteSampler));
}
pub var palette_DescriptorSetLayout: Vulkan.VkDescriptorSetLayout = undefined;
pub var palette_DescriptorPool: Vulkan.VkDescriptorPool = undefined;
pub var palette_DescriptorSet: Vulkan.VkDescriptorSet = undefined;

pub var Hex_Pipeline: Vulkan.VkPipeline = null;
pub var Hex_PipelineLayout: Vulkan.VkPipelineLayout = null;
pub fn createPaletteDescriptorsData(imageView: Vulkan.VkImageView, descriptorSetLayout: *Vulkan.VkDescriptorSetLayout, descriptorPool: *Vulkan.VkDescriptorPool, descriptorSet: *Vulkan.VkDescriptorSet) void
{
//     _ = imageView;
    const descriptorSetLayoutBindings = [1]Vulkan.VkDescriptorSetLayoutBinding
    {
        .{
            .binding = 0,
            .descriptorCount = 1,
            .descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER,
            .pImmutableSamplers = null,
            .stageFlags = Vulkan.VK_SHADER_STAGE_FRAGMENT_BIT,
        },
    };
    const layoutInfo = Vulkan.VkDescriptorSetLayoutCreateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO,
        .bindingCount = descriptorSetLayoutBindings.len,
        .pBindings = &descriptorSetLayoutBindings,
    };
    VK_CHECK(Vulkan.vkCreateDescriptorSetLayout(VulkanGlobalState._device, &layoutInfo, null, descriptorSetLayout));

    const poolSizes = [1]Vulkan.VkDescriptorPoolSize
    {
        .{
            .type = Vulkan.VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER,
            .descriptorCount = 1,
        },
    };
    const poolInfo = Vulkan.VkDescriptorPoolCreateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO,
        .poolSizeCount = poolSizes.len,
        .pPoolSizes = &poolSizes,
        .maxSets = 1,
    };
    VK_CHECK(Vulkan.vkCreateDescriptorPool(VulkanGlobalState._device, &poolInfo, null, descriptorPool));

    const allocInfo = Vulkan.VkDescriptorSetAllocateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO,
        .descriptorPool = descriptorPool.*,
        .descriptorSetCount = 1,
        .pSetLayouts = descriptorSetLayout,
    };

    VK_CHECK(Vulkan.vkAllocateDescriptorSets(VulkanGlobalState._device, &allocInfo, descriptorSet));

    const imageInfo = Vulkan.VkDescriptorImageInfo
    {
        .sampler = _paletteSampler,
        .imageView = imageView,
        .imageLayout = Vulkan.VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL,
    };
    // const bufferInfo = Vulkan.VkDescriptorBufferInfo
    // {
    //  .buffer = buffer,
    //  .offset = 0,
    //  .range = Vulkan.VK_WHOLE_SIZE,
    // };
    // for(0..descriptorsCount) |i|
    // {
    // bufferInfo[i].buffer = buffer;
    //  bufferInfo[i].offset = i*8;
    //  bufferInfo[i].range = 8;
    // }
    const descriptorWrites = [1]Vulkan.VkWriteDescriptorSet
    {
        .{
            .sType = Vulkan.VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET,
            .dstSet = descriptorSet.*,
            .dstBinding = 0,
            .dstArrayElement = 0,
            .descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER,
            .descriptorCount = 1,
            .pImageInfo = &imageInfo,
            // .pBufferInfo = &bufferInfo,
        },
    };

    Vulkan.vkUpdateDescriptorSets(VulkanGlobalState._device, descriptorWrites.len, &descriptorWrites, 0, null);
}
pub fn Create_Hex_Pipeline(texturesDescriptorSetLayout: Vulkan.VkDescriptorSetLayout, paletteDescriptorSetLayout: Vulkan.VkDescriptorSetLayout, pipelineLayout: *Vulkan.VkPipelineLayout, pipeline: *Vulkan.VkPipeline) void
{
	const vertShaderModule: Vulkan.VkShaderModule = VkPipeline.createShaderModule("shaders/Hex.vert.spv");
	const fragShaderModule: Vulkan.VkShaderModule = VkPipeline.createShaderModule("shaders/Hex.frag.spv");
	defer Vulkan.vkDestroyShaderModule(VulkanGlobalState._device, fragShaderModule, null);
	defer Vulkan.vkDestroyShaderModule(VulkanGlobalState._device, vertShaderModule, null);

	const shaderStages = [2]Vulkan.VkPipelineShaderStageCreateInfo
	{
		.{
			.sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO,
			.stage = Vulkan.VK_SHADER_STAGE_VERTEX_BIT,
			.module = vertShaderModule,
			.pName = "main",
		},
		.{
			.sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO,
			.stage = Vulkan.VK_SHADER_STAGE_FRAGMENT_BIT,
			.module = fragShaderModule,
			.pName = "main",
		}
	};
    const VertexInputState = Vulkan.VkPipelineVertexInputStateCreateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO,

//         .vertexBindingDescriptionCount = bindingDescriptions.len,
//         .vertexAttributeDescriptionCount = attributeDescriptions.len,
//         .pVertexBindingDescriptions = &bindingDescriptions,
//         .pVertexAttributeDescriptions = &attributeDescriptions,
    };
	const InputAssemblyState = Vulkan.VkPipelineInputAssemblyStateCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO,
		.topology = Vulkan.VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST,
		.primitiveRestartEnable = Vulkan.VK_FALSE,
	};
	//VkPipelineTessellationStateCreateInfo TessellationState{};
	const ViewportState = Vulkan.VkPipelineViewportStateCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO,
		.viewportCount = 1,
		//.pViewports = &_viewport;
		.scissorCount = 1,
		//.pScissors = &_scissor;
	};
	//configure the rasterizer to draw filled triangles
	const RasterizationState = Vulkan.VkPipelineRasterizationStateCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO,

		.depthClampEnable = Vulkan.VK_FALSE,
		//discards all primitives before the rasterization stage if enabled which we don't want
		.rasterizerDiscardEnable = Vulkan.VK_FALSE,

		.polygonMode = Vulkan.VK_POLYGON_MODE_FILL,
		.lineWidth = 1.0,
		.cullMode = Vulkan.VK_CULL_MODE_NONE,
		.frontFace = Vulkan.VK_FRONT_FACE_CLOCKWISE,
		//no depth bias
		.depthBiasEnable = Vulkan.VK_FALSE,
		.depthBiasConstantFactor = 0.0,
		.depthBiasClamp = 0.0,
		.depthBiasSlopeFactor = 0.0,
	};
	//we dont use multisampling, so just run the default one
	const MultisampleState = Vulkan.VkPipelineMultisampleStateCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO,

		.sampleShadingEnable = Vulkan.VK_FALSE,
		.rasterizationSamples = Vulkan.VK_SAMPLE_COUNT_1_BIT,
		//multisampling defaulted to no multisampling (1 sample per pixel)
		.minSampleShading = 1.0,
		.pSampleMask = null,
		.alphaToCoverageEnable = Vulkan.VK_FALSE,
		.alphaToOneEnable = Vulkan.VK_FALSE,
	};
	const DepthStencilState = Vulkan.VkPipelineDepthStencilStateCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO,

		.depthTestEnable = Vulkan.VK_TRUE,
		.depthWriteEnable = Vulkan.VK_TRUE,
		.depthCompareOp = Vulkan.VK_COMPARE_OP_GREATER,//VK_COMPARE_OP_GREATER
//         .depthBoundsTestEnable = Vulkan.VK_TRUE,
//         .minDepthBounds = 0.0, // Optional
//         .maxDepthBounds = 1.0, // Optional
		.stencilTestEnable = Vulkan.VK_FALSE,
	};
	//setup dummy color blending. We arent using transparent objects yet
	//the blending is just "no blend", but we do write to the color attachment

	//a single blend attachment with no blending and writing to RGBA
	const colorBlendAttachment = Vulkan.VkPipelineColorBlendAttachmentState
	{
		.colorWriteMask = Vulkan.VK_COLOR_COMPONENT_R_BIT | Vulkan.VK_COLOR_COMPONENT_G_BIT | Vulkan.VK_COLOR_COMPONENT_B_BIT | Vulkan.VK_COLOR_COMPONENT_A_BIT,
		.blendEnable = Vulkan.VK_FALSE,
	};
	const ColorBlendState = Vulkan.VkPipelineColorBlendStateCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO,

		.logicOpEnable = Vulkan.VK_FALSE,
		.logicOp = Vulkan.VK_LOGIC_OP_COPY,
		.attachmentCount = 1,
		.pAttachments = &colorBlendAttachment,
	};
	const dynamicStates = [2]Vulkan.VkDynamicState
	{
		Vulkan.VK_DYNAMIC_STATE_VIEWPORT,
		Vulkan.VK_DYNAMIC_STATE_SCISSOR,
	};
	const DynamicState = Vulkan.VkPipelineDynamicStateCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO,
		.dynamicStateCount = dynamicStates.len,
		.pDynamicStates = &dynamicStates,
	};
	const descriptorSetLayouts = [3]Vulkan.VkDescriptorSetLayout
	{
		Camera._cameraDescriptorSetLayout,
		texturesDescriptorSetLayout,
		paletteDescriptorSetLayout,
	};
    const pushConstantRange  = Vulkan.VkPushConstantRange
    {
        .stageFlags = Vulkan.VK_SHADER_STAGE_VERTEX_BIT,
        .offset = 0,
        .size = 16,
    };
	const pipelineLayoutInfo = Vulkan.VkPipelineLayoutCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO,
		//.flags = 0,
		.setLayoutCount = descriptorSetLayouts.len,
		.pSetLayouts = &descriptorSetLayouts,
        .pushConstantRangeCount = 1,
        .pPushConstantRanges = &pushConstantRange,
	};
	VK_CHECK(Vulkan.vkCreatePipelineLayout(VulkanGlobalState._device, &pipelineLayoutInfo, null, pipelineLayout));

	const pipelineRenderingCreateInfo = Vulkan.VkPipelineRenderingCreateInfoKHR
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_RENDERING_CREATE_INFO_KHR,
		.colorAttachmentCount = 1,
		.pColorAttachmentFormats = &VulkanGlobalState._swapchainImageFormat,
		.depthAttachmentFormat = VulkanGlobalState._depthFormat,
	};
	const pipelineInfo = Vulkan.VkGraphicsPipelineCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO,
		//.flags = VK_PIPELINE_CREATE_DESCRIPTOR_BUFFER_BIT_EXT,

		.stageCount = 2,
		.pStages = &shaderStages,
        .pVertexInputState = &VertexInputState,
		.pInputAssemblyState = &InputAssemblyState,
		.pViewportState = &ViewportState,
		.pRasterizationState = &RasterizationState,
		.pMultisampleState = &MultisampleState,
		.pDepthStencilState = &DepthStencilState,
		.pColorBlendState = &ColorBlendState,
		.pDynamicState = &DynamicState,
		.layout = pipelineLayout.*,
		//.renderPass = _renderPass,
		.subpass = 0,
		.basePipelineHandle = null,

		.renderPass = null,
		.pNext = &pipelineRenderingCreateInfo,
	};
	VK_CHECK(Vulkan.vkCreateGraphicsPipelines(VulkanGlobalState._device, null, 1, &pipelineInfo, null, pipeline));
}