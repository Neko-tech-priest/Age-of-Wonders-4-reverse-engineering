; SPIR-V
; Version: 1.0
; Generator: Google Shaderc over Glslang; 11
; Bound: 126
; Schema: 0
               OpCapability Shader
               OpCapability ShaderNonUniform
               OpCapability RuntimeDescriptorArray
               OpCapability SampledImageArrayNonUniformIndexing
               OpExtension "SPV_EXT_descriptor_indexing"
          %1 = OpExtInstImport "GLSL.std.450"
               OpMemoryModel Logical GLSL450
               OpEntryPoint Fragment %4 "main" %31 %45 %107
               OpExecutionMode %4 OriginUpperLeft
               OpDecorate %28 Binding 0
               OpDecorate %28 DescriptorSet 1
               OpDecorate %31 Flat
               OpDecorate %31 Location 1
               OpDecorate %33 NonUniform
               OpDecorate %35 NonUniform
               OpDecorate %36 NonUniform
               OpDecorate %39 Binding 1
               OpDecorate %39 DescriptorSet 1
               OpDecorate %45 Location 0
               OpDecorate %84 Binding 0
               OpDecorate %84 DescriptorSet 2
               OpDecorate %107 Location 0
       %void = OpTypeVoid
          %3 = OpTypeFunction %void
      %float = OpTypeFloat 32
    %v3float = OpTypeVector %float 3
    %float_1 = OpConstant %float 1
    %float_0 = OpConstant %float 0
    %v4float = OpTypeVector %float 4
         %25 = OpTypeImage %float 2D 0 0 0 1 Unknown
%_runtimearr_25 = OpTypeRuntimeArray %25
%_ptr_UniformConstant__runtimearr_25 = OpTypePointer UniformConstant %_runtimearr_25
         %28 = OpVariable %_ptr_UniformConstant__runtimearr_25 UniformConstant
       %uint = OpTypeInt 32 0
%_ptr_Input_uint = OpTypePointer Input %uint
         %31 = OpVariable %_ptr_Input_uint Input
%_ptr_UniformConstant_25 = OpTypePointer UniformConstant %25
         %37 = OpTypeSampler
%_ptr_UniformConstant_37 = OpTypePointer UniformConstant %37
         %39 = OpVariable %_ptr_UniformConstant_37 UniformConstant
         %41 = OpTypeSampledImage %25
    %v2float = OpTypeVector %float 2
%_ptr_Input_v2float = OpTypePointer Input %v2float
         %45 = OpVariable %_ptr_Input_v2float Input
    %float_2 = OpConstant %float 2
%_ptr_UniformConstant_41 = OpTypePointer UniformConstant %41
         %84 = OpVariable %_ptr_UniformConstant_41 UniformConstant
%float_0_875 = OpConstant %float 0.875
%float_0_0625 = OpConstant %float 0.0625
  %float_0_5 = OpConstant %float 0.5
%_ptr_Output_v4float = OpTypePointer Output %v4float
        %107 = OpVariable %_ptr_Output_v4float Output
        %125 = OpConstantComposite %v2float %float_1 %float_1
          %4 = OpFunction %void None %3
          %5 = OpLabel
         %32 = OpLoad %uint %31
         %33 = OpCopyObject %uint %32
         %35 = OpAccessChain %_ptr_UniformConstant_25 %28 %33
         %36 = OpLoad %25 %35
         %40 = OpLoad %37 %39
         %42 = OpSampledImage %41 %36 %40
         %46 = OpLoad %v2float %45
         %47 = OpImageSampleImplicitLod %v4float %42 %46
         %51 = OpVectorShuffle %v2float %47 %47 0 1
         %53 = OpVectorTimesScalar %v2float %51 %float_2
         %55 = OpFSub %v2float %53 %125
         %59 = OpCompositeExtract %float %55 0
         %62 = OpCompositeExtract %float %55 1
         %67 = OpFMul %float %59 %59
         %68 = OpFSub %float %float_1 %67
         %73 = OpFMul %float %62 %62
         %74 = OpFSub %float %68 %73
         %75 = OpExtInst %float %1 Sqrt %74
         %81 = OpCompositeExtract %float %47 3
         %85 = OpLoad %41 %84
         %88 = OpFMul %float %81 %float_0_875
         %90 = OpFSub %float %88 %float_0_0625
         %92 = OpCompositeConstruct %v2float %90 %float_0_5
         %93 = OpImageSampleImplicitLod %v4float %85 %92
         %94 = OpVectorShuffle %v3float %93 %93 0 1 2
         %99 = OpExtInst %float %1 FMax %75 %float_0
        %102 = OpVectorTimesScalar %v3float %94 %99
        %105 = OpVectorTimesScalar %v3float %102 %float_1
        %109 = OpCompositeExtract %float %105 0
        %110 = OpCompositeExtract %float %105 1
        %111 = OpCompositeExtract %float %105 2
        %112 = OpCompositeConstruct %v4float %109 %110 %111 %float_1
               OpStore %107 %112
               OpReturn
               OpFunctionEnd
