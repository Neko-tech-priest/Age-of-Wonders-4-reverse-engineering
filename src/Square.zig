const std = @import("std");
const mem = std.mem;
const print = std.debug.print;

// const Vulkan = @import("Vulkan.zig");
const Vulkan = @import("Vulkan.zig");

const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;
const VkPipeline = @import("VkPipeline.zig");
const Image = @import("Image.zig");

const Camera = @import("Camera.zig");

pub const Vertex = struct
{
	position: [3]f32,
	uv: [2]f32,
};
pub const Mesh = struct
{
	vertexVkBuffer: Vulkan.VkBuffer,
	indexVkBuffer: Vulkan.VkBuffer,
	indicesCount: u32,

	pub fn unload(self: Mesh) void
	{
		Vulkan.vkDestroyBuffer(VulkanGlobalState._device, self.vertexVkBuffer, null);
		Vulkan.vkDestroyBuffer(VulkanGlobalState._device, self.indexVkBuffer, null);
	}
};

pub const DiffuseMaterial = packed struct
{
	textureVkImage: Vulkan.VkImage = undefined,
	textureVkImageView: Vulkan.VkImageView = undefined,

	descriptorSet: Vulkan.VkDescriptorSet = undefined,

	pub fn unload(self: DiffuseMaterial) void
	{
		Vulkan.vkDestroyImage(VulkanGlobalState._device, self.textureVkImage, null);
		Vulkan.vkDestroyImageView(VulkanGlobalState._device, self.textureVkImageView, null);
	}
	pub fn Create_DiffuseMaterial_VkDescriptorSet(self: *DiffuseMaterial, descriptorSetLayout: Vulkan.VkDescriptorSetLayout, descriptorPool: Vulkan.VkDescriptorPool) void
	{
		const allocInfo = Vulkan.VkDescriptorSetAllocateInfo
		{
			.sType = Vulkan.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO,
			.descriptorPool = descriptorPool,
			.descriptorSetCount = 1,
			.pSetLayouts = &descriptorSetLayout,
		};

		VK_CHECK(Vulkan.vkAllocateDescriptorSets(VulkanGlobalState._device, &allocInfo, &self.descriptorSet));

		const textureInfo = Vulkan.VkDescriptorImageInfo
		{
			.imageLayout = Vulkan.VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL,
			.imageView = self.textureVkImageView,
			.sampler = VulkanGlobalState._textureSampler,
		};

		const descriptorWrites = [1]Vulkan.VkWriteDescriptorSet
		{
			.{
				.sType = Vulkan.VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET,
				.dstSet = self.descriptorSet,
				.dstBinding = 1,
				.dstArrayElement = 0,
				.descriptorType = Vulkan.VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER,
				.descriptorCount = 1,
				.pImageInfo = &textureInfo,
			},
		};

		Vulkan.vkUpdateDescriptorSets(VulkanGlobalState._device, descriptorWrites.len, &descriptorWrites, 0, null);
	}
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
pub fn Create_DiffuseMaterial_VkDescriptorSet(texturesCount: u32, textures: [*]Image.Texture, descriptorSetLayout: Vulkan.VkDescriptorSetLayout, descriptorPool: Vulkan.VkDescriptorPool, descriptorSet: *Vulkan.VkDescriptorSet) void
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

pub fn Create_Square_Pipeline(descriptorSetLayout: Vulkan.VkDescriptorSetLayout, pipelineLayout: *Vulkan.VkPipelineLayout, pipeline: *Vulkan.VkPipeline) void
{
	const vertShaderModule: Vulkan.VkShaderModule = VkPipeline.createShaderModule("shaders/Square.vert.spv");
	const fragShaderModule: Vulkan.VkShaderModule = VkPipeline.createShaderModule("shaders/Square.frag.spv");
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
	const bindingDescriptions = [1]Vulkan.VkVertexInputBindingDescription
	{
		.{
			.binding = 0,
			.stride = 20,
			.inputRate = Vulkan.VK_VERTEX_INPUT_RATE_VERTEX,
		}
	};
	const attributeDescriptions = [2]Vulkan.VkVertexInputAttributeDescription
	{
		.{
			.binding = 0,
			.location = 0,
			.format = Vulkan.VK_FORMAT_R32G32B32_SFLOAT,
			.offset = 0,
		},
		.{
			.binding = 0,
			.location = 1,
			.format = Vulkan.VK_FORMAT_R32G32_SFLOAT,
			.offset = 12,
		},
	};

	const VertexInputState = Vulkan.VkPipelineVertexInputStateCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO,

		.vertexBindingDescriptionCount = bindingDescriptions.len,
		.vertexAttributeDescriptionCount = attributeDescriptions.len,
		.pVertexBindingDescriptions = &bindingDescriptions,
		.pVertexAttributeDescriptions = &attributeDescriptions,
	};
	const InputAssemblyState = Vulkan.VkPipelineInputAssemblyStateCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO,
		.topology = Vulkan.VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST,
		.primitiveRestartEnable = Vulkan.VK_FALSE,
	};
	//VkPipelineTessellationStateCreateInfo TessellationState{};

	//make viewport state from our stored viewport and scissor.
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
		.depthCompareOp = Vulkan.VK_COMPARE_OP_LESS,//VK_COMPARE_OP_GREATER
		.depthBoundsTestEnable = Vulkan.VK_FALSE,
		.minDepthBounds = 0.0, // Optional
		.maxDepthBounds = 1.0, // Optional
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
	const descriptorSetLayouts = [2]Vulkan.VkDescriptorSetLayout
	{
		Camera._cameraDescriptorSetLayout,
		descriptorSetLayout,
	};
	const pipelineLayoutInfo = Vulkan.VkPipelineLayoutCreateInfo
	{
		.sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO,
		//.flags = 0,
		.setLayoutCount = 2,
		.pSetLayouts = &descriptorSetLayouts,
		//.pushConstantRangeCount = 1,
		//.pPushConstantRanges = &push_constant,
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
