const std = @import("std");

const Vulkan = @import("Vulkan.zig");
const VkPipeline = @import("VkPipeline.zig");
const VulkanGlobalState = @import("VulkanGlobalState.zig");
const VK_CHECK = VulkanGlobalState.VK_CHECK;

const Camera = @import("Camera.zig");

pub var PNUCT_Pipeline: Vulkan.VkPipeline = null;
pub var PNUCT_PipelineLayout: Vulkan.VkPipelineLayout = null;
pub var PNUCTP_Pipeline: Vulkan.VkPipeline = null;
// pub var PNUCTP_PipelineLayout: Vulkan.VkPipelineLayout = null;
pub fn Create_PNUCT_Pipeline(texturesDescriptorSetLayout: Vulkan.VkDescriptorSetLayout, pipelineLayout: *Vulkan.VkPipelineLayout, pipeline: *Vulkan.VkPipeline) void
{
    const vertShaderModule: Vulkan.VkShaderModule = VkPipeline.createShaderModule("shaders/PNUCT.vert.spv");
    const fragShaderModule: Vulkan.VkShaderModule = VkPipeline.createShaderModule("shaders/PNUCT.frag.spv");
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
    //
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

//         .depthTestEnable = Vulkan.VK_TRUE,
//         .depthWriteEnable = Vulkan.VK_TRUE,
        .depthCompareOp = Vulkan.VK_COMPARE_OP_LESS,//VK_COMPARE_OP_GREATER
//         .depthBoundsTestEnable = Vulkan.VK_FALSE,
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
        .blendEnable = Vulkan.VK_TRUE,
        .srcColorBlendFactor = Vulkan.VK_BLEND_FACTOR_SRC_ALPHA,
        .dstColorBlendFactor = Vulkan.VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA,
        .colorBlendOp = Vulkan.VK_BLEND_OP_ADD,
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
        texturesDescriptorSetLayout,
//         paletteDescriptorSetLayout,
    };
    const pushConstantRange  = [2]Vulkan.VkPushConstantRange
    {
        .{
            .stageFlags = Vulkan.VK_SHADER_STAGE_VERTEX_BIT,
            .offset = 0,
            .size = 8,
        },
        .{
            .stageFlags = Vulkan.VK_SHADER_STAGE_FRAGMENT_BIT,
            .offset = 8,
            .size = 4,
        },
    };
    const pipelineLayoutInfo = Vulkan.VkPipelineLayoutCreateInfo
    {
        .sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO,
        //.flags = 0,
        .setLayoutCount = descriptorSetLayouts.len,
        .pSetLayouts = &descriptorSetLayouts,
        .pushConstantRangeCount = 2,
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
pub fn Create_PNUCTP_Pipeline() void
{
    const vertShaderModule: Vulkan.VkShaderModule = VkPipeline.createShaderModule("shaders/PNUCTP.vert.spv");
    const fragShaderModule: Vulkan.VkShaderModule = VkPipeline.createShaderModule("shaders/PNUCTP.frag.spv");
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
    //
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

//         .depthTestEnable = Vulkan.VK_TRUE,
//         .depthWriteEnable = Vulkan.VK_TRUE,
        .depthCompareOp = Vulkan.VK_COMPARE_OP_LESS,//VK_COMPARE_OP_GREATER
//         .depthBoundsTestEnable = Vulkan.VK_FALSE,
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
        .blendEnable = Vulkan.VK_TRUE,
        .srcColorBlendFactor = Vulkan.VK_BLEND_FACTOR_SRC_ALPHA,
        .dstColorBlendFactor = Vulkan.VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA,
        .colorBlendOp = Vulkan.VK_BLEND_OP_ADD,
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
//     const pushConstantRange  = [2]Vulkan.VkPushConstantRange
//     {
//         .{
//             .stageFlags = Vulkan.VK_SHADER_STAGE_VERTEX_BIT,
//             .offset = 0,
//             .size = 8,
//         },
//         .{
//             .stageFlags = Vulkan.VK_SHADER_STAGE_FRAGMENT_BIT,
//             .offset = 8,
//             .size = 4,
//         },
//     };
//     const pipelineLayoutInfo = Vulkan.VkPipelineLayoutCreateInfo
//     {
//         .sType = Vulkan.VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO,
//         //.flags = 0,
//         .setLayoutCount = descriptorSetLayouts.len,
//         .pSetLayouts = &descriptorSetLayouts,
//         .pushConstantRangeCount = 2,
//         .pPushConstantRanges = &pushConstantRange,
//     };
//     VK_CHECK(Vulkan.vkCreatePipelineLayout(VulkanGlobalState._device, &pipelineLayoutInfo, null, pipelineLayout));

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
        .layout = PNUCT_PipelineLayout,
        //.renderPass = _renderPass,
        .subpass = 0,
        .basePipelineHandle = null,

        .renderPass = null,
        .pNext = &pipelineRenderingCreateInfo,
    };
    VK_CHECK(Vulkan.vkCreateGraphicsPipelines(VulkanGlobalState._device, null, 1, &pipelineInfo, null, &PNUCTP_Pipeline));
}