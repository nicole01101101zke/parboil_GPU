; ModuleID = '../benchmarks/cutcp/src/opencl_nvidia/kernel.cl'
source_filename = "../benchmarks/cutcp/src/opencl_nvidia/kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@opencl_cutoff_potential_lattice6overlap.AtomBinCache = internal unnamed_addr global [1024 x float] undef, align 16
@opencl_cutoff_potential_lattice6overlap.myBinIndex = internal unnamed_addr global <4 x i32> undef, align 16

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @opencl_cutoff_potential_lattice6overlap(i32 %0, i32 %1, <4 x float>* nocapture readonly %2, i32 %3, float %4, float %5, float %6, float* nocapture %7, i32 %8, i32* nocapture readonly %9, <4 x i32>* nocapture readonly %10) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %12 = sext i32 %3 to i64
  %13 = tail call i64 @_Z12get_group_idj(i32 0) #4
  %14 = trunc i64 %13 to i32
  %15 = tail call i64 @_Z12get_group_idj(i32 1) #4
  %16 = trunc i64 %15 to i32
  %17 = tail call i64 @_Z12get_local_idj(i32 2) #4
  %18 = tail call i64 @_Z14get_local_sizej(i32 1) #4
  %19 = mul i64 %18, %17
  %20 = tail call i64 @_Z12get_local_idj(i32 1) #4
  %21 = add i64 %19, %20
  %22 = tail call i64 @_Z14get_local_sizej(i32 0) #4
  %23 = mul i64 %21, %22
  %24 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %25 = add i64 %23, %24
  %26 = trunc i64 %25 to i32
  %27 = sext i32 %8 to i64
  %28 = tail call i64 @_Z14get_num_groupsj(i32 1) #4
  %29 = mul i64 %28, %27
  %30 = shl i64 %15, 32
  %31 = ashr exact i64 %30, 32
  %32 = add i64 %29, %31
  %33 = tail call i64 @_Z14get_num_groupsj(i32 0) #4
  %34 = mul i64 %32, %33
  %35 = shl i64 %13, 32
  %36 = ashr exact i64 %35, 32
  %37 = add i64 %34, %36
  %38 = shl i64 %37, 9
  %39 = getelementptr inbounds float, float* %7, i64 %38
  %40 = shl nsw i32 %14, 3
  %41 = sext i32 %40 to i64
  %42 = add i64 %24, %41
  %43 = uitofp i64 %42 to float
  %44 = fmul float %43, %4
  %45 = shl nsw i32 %16, 3
  %46 = sext i32 %45 to i64
  %47 = add i64 %20, %46
  %48 = uitofp i64 %47 to float
  %49 = fmul float %48, %4
  %50 = shl nsw i32 %8, 3
  %51 = sext i32 %50 to i64
  %52 = add i64 %17, %51
  %53 = uitofp i64 %52 to float
  %54 = fmul float %53, %4
  %55 = or i32 %40, 4
  %56 = sitofp i32 %55 to float
  %57 = fmul float %56, %4
  %58 = fmul float %57, 2.500000e-01
  %59 = tail call float @_Z5floorf(float %58) #4
  %60 = fptosi float %59 to i32
  %61 = load <4 x i32>, <4 x i32>* @opencl_cutoff_potential_lattice6overlap.myBinIndex, align 16
  %62 = insertelement <4 x i32> %61, i32 %60, i64 0
  %63 = or i32 %45, 4
  %64 = sitofp i32 %63 to float
  %65 = fmul float %64, %4
  %66 = fmul float %65, 2.500000e-01
  %67 = tail call float @_Z5floorf(float %66) #4
  %68 = fptosi float %67 to i32
  %69 = insertelement <4 x i32> %62, i32 %68, i64 1
  %70 = or i32 %50, 4
  %71 = sitofp i32 %70 to float
  %72 = fmul float %71, %4
  %73 = fmul float %72, 2.500000e-01
  %74 = tail call float @_Z5floorf(float %73) #4
  %75 = fptosi float %74 to i32
  %76 = insertelement <4 x i32> %69, i32 %75, i64 2
  store <4 x i32> %76, <4 x i32>* @opencl_cutoff_potential_lattice6overlap.myBinIndex, align 16
  %77 = ashr i32 %26, 4
  %78 = load i32, i32* %9, align 4, !tbaa !8
  %79 = icmp sgt i32 %78, 0
  br i1 %79, label %82, label %80

80:                                               ; preds = %11
  %81 = and i32 %26, 15
  br label %253

82:                                               ; preds = %11
  %83 = shl i32 %77, 5
  %84 = and i32 %26, 15
  %85 = zext i32 %84 to i64
  %86 = or i32 %84, 16
  %87 = zext i32 %86 to i64
  br label %88

88:                                               ; preds = %82, %245
  %89 = phi i32 [ %78, %82 ], [ %251, %245 ]
  %90 = phi i32 [ %77, %82 ], [ %147, %245 ]
  %91 = phi i32 [ 0, %82 ], [ %250, %245 ]
  %92 = phi i32 [ 32, %82 ], [ %152, %245 ]
  %93 = phi float [ 0.000000e+00, %82 ], [ %249, %245 ]
  %94 = phi float [ 0.000000e+00, %82 ], [ %248, %245 ]
  %95 = phi float [ 0.000000e+00, %82 ], [ %247, %245 ]
  %96 = phi float [ 0.000000e+00, %82 ], [ %246, %245 ]
  %97 = icmp slt i32 %90, %89
  br i1 %97, label %98, label %146

98:                                               ; preds = %88
  %99 = load <4 x i32>, <4 x i32>* @opencl_cutoff_potential_lattice6overlap.myBinIndex, align 16
  %100 = extractelement <4 x i32> %99, i64 0
  %101 = extractelement <4 x i32> %99, i64 1
  %102 = extractelement <4 x i32> %99, i64 2
  %103 = sext i32 %90 to i64
  %104 = sext i32 %89 to i64
  br label %105

105:                                              ; preds = %98, %105
  %106 = phi i64 [ %103, %98 ], [ %140, %105 ]
  %107 = phi i32 [ 0, %98 ], [ %139, %105 ]
  %108 = getelementptr inbounds <4 x i32>, <4 x i32>* %10, i64 %106
  %109 = load <4 x i32>, <4 x i32>* %108, align 16
  %110 = extractelement <4 x i32> %109, i64 0
  %111 = add nsw i32 %110, %100
  %112 = extractelement <4 x i32> %109, i64 1
  %113 = add nsw i32 %112, %101
  %114 = extractelement <4 x i32> %109, i64 2
  %115 = add nsw i32 %114, %102
  %116 = tail call i32 @_Z5mul24ii(i32 %115, i32 %1) #4
  %117 = add nsw i32 %113, %116
  %118 = mul nsw i32 %117, %0
  %119 = add nsw i32 %111, %118
  %120 = shl i32 %119, 5
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %12, i64 %121
  %123 = shl nuw nsw i32 %107, 8
  %124 = add nsw i32 %123, %83
  %125 = getelementptr inbounds float, float* %122, i64 %85
  %126 = bitcast float* %125 to i32*
  %127 = load i32, i32* %126, align 4, !tbaa !12
  %128 = or i32 %124, %84
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice6overlap.AtomBinCache, i64 0, i64 %129
  %131 = bitcast float* %130 to i32*
  store i32 %127, i32* %131, align 4, !tbaa !12
  %132 = getelementptr inbounds float, float* %122, i64 %87
  %133 = bitcast float* %132 to i32*
  %134 = load i32, i32* %133, align 4, !tbaa !12
  %135 = or i32 %128, 16
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice6overlap.AtomBinCache, i64 0, i64 %136
  %138 = bitcast float* %137 to i32*
  store i32 %134, i32* %138, align 4, !tbaa !12
  %139 = add nuw nsw i32 %107, 1
  %140 = add nsw i64 %106, 8
  %141 = icmp ult i32 %107, 3
  %142 = icmp slt i64 %140, %104
  %143 = and i1 %141, %142
  br i1 %143, label %105, label %144

144:                                              ; preds = %105
  %145 = trunc i64 %140 to i32
  br label %146

146:                                              ; preds = %144, %88
  %147 = phi i32 [ %90, %88 ], [ %145, %144 ]
  tail call void @_Z7barrierj(i32 3) #5
  %148 = add nsw i32 %91, 32
  %149 = load i32, i32* %9, align 4, !tbaa !8
  %150 = icmp sgt i32 %148, %149
  %151 = sub nsw i32 %149, %91
  %152 = select i1 %150, i32 %151, i32 %92
  %153 = shl i32 %152, 5
  %154 = icmp sgt i32 %153, 0
  br i1 %154, label %155, label %245

155:                                              ; preds = %146
  %156 = zext i32 %153 to i64
  br label %157

157:                                              ; preds = %155, %238
  %158 = phi i64 [ 0, %155 ], [ %243, %238 ]
  %159 = phi float [ %93, %155 ], [ %242, %238 ]
  %160 = phi float [ %94, %155 ], [ %241, %238 ]
  %161 = phi float [ %95, %155 ], [ %240, %238 ]
  %162 = phi float [ %96, %155 ], [ %239, %238 ]
  br label %163

163:                                              ; preds = %234, %157
  %164 = phi i64 [ 0, %157 ], [ %236, %234 ]
  %165 = phi float [ %159, %157 ], [ %199, %234 ]
  %166 = phi float [ %160, %157 ], [ %211, %234 ]
  %167 = phi float [ %161, %157 ], [ %223, %234 ]
  %168 = phi float [ %162, %157 ], [ %235, %234 ]
  %169 = shl nuw nsw i64 %164, 2
  %170 = add nuw nsw i64 %169, %158
  %171 = or i64 %170, 3
  %172 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice6overlap.AtomBinCache, i64 0, i64 %171
  %173 = load float, float* %172, align 4, !tbaa !12
  %174 = fcmp oeq float %173, 0.000000e+00
  br i1 %174, label %238, label %175

175:                                              ; preds = %163
  %176 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice6overlap.AtomBinCache, i64 0, i64 %170
  %177 = load float, float* %176, align 16, !tbaa !12
  %178 = fsub float %177, %44
  %179 = or i64 %170, 2
  %180 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice6overlap.AtomBinCache, i64 0, i64 %179
  %181 = load float, float* %180, align 8, !tbaa !12
  %182 = fsub float %181, %54
  %183 = fmul float %182, %182
  %184 = tail call float @llvm.fmuladd.f32(float %178, float %178, float %183)
  %185 = or i64 %170, 1
  %186 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice6overlap.AtomBinCache, i64 0, i64 %185
  %187 = load float, float* %186, align 4, !tbaa !12
  %188 = fsub float %187, %49
  %189 = tail call float @llvm.fmuladd.f32(float %188, float %188, float %184)
  %190 = fcmp olt float %189, %5
  br i1 %190, label %191, label %198

191:                                              ; preds = %175
  %192 = fneg float %189
  %193 = tail call float @llvm.fmuladd.f32(float %192, float %6, float 1.000000e+00)
  %194 = tail call float @_Z5rsqrtf(float %189) #4
  %195 = fmul float %173, %194
  %196 = fmul float %193, %195
  %197 = tail call float @llvm.fmuladd.f32(float %196, float %193, float %165)
  br label %198

198:                                              ; preds = %191, %175
  %199 = phi float [ %197, %191 ], [ %165, %175 ]
  %200 = tail call float @llvm.fmuladd.f32(float %4, float -2.000000e+00, float %188)
  %201 = tail call float @llvm.fmuladd.f32(float %200, float %200, float %184)
  %202 = fcmp olt float %201, %5
  br i1 %202, label %203, label %210

203:                                              ; preds = %198
  %204 = fneg float %201
  %205 = tail call float @llvm.fmuladd.f32(float %204, float %6, float 1.000000e+00)
  %206 = tail call float @_Z5rsqrtf(float %201) #4
  %207 = fmul float %173, %206
  %208 = fmul float %205, %207
  %209 = tail call float @llvm.fmuladd.f32(float %208, float %205, float %166)
  br label %210

210:                                              ; preds = %203, %198
  %211 = phi float [ %209, %203 ], [ %166, %198 ]
  %212 = tail call float @llvm.fmuladd.f32(float %4, float -2.000000e+00, float %200)
  %213 = tail call float @llvm.fmuladd.f32(float %212, float %212, float %184)
  %214 = fcmp olt float %213, %5
  br i1 %214, label %215, label %222

215:                                              ; preds = %210
  %216 = fneg float %213
  %217 = tail call float @llvm.fmuladd.f32(float %216, float %6, float 1.000000e+00)
  %218 = tail call float @_Z5rsqrtf(float %213) #4
  %219 = fmul float %173, %218
  %220 = fmul float %217, %219
  %221 = tail call float @llvm.fmuladd.f32(float %220, float %217, float %167)
  br label %222

222:                                              ; preds = %215, %210
  %223 = phi float [ %221, %215 ], [ %167, %210 ]
  %224 = tail call float @llvm.fmuladd.f32(float %4, float -2.000000e+00, float %212)
  %225 = tail call float @llvm.fmuladd.f32(float %224, float %224, float %184)
  %226 = fcmp olt float %225, %5
  br i1 %226, label %227, label %234

227:                                              ; preds = %222
  %228 = fneg float %225
  %229 = tail call float @llvm.fmuladd.f32(float %228, float %6, float 1.000000e+00)
  %230 = tail call float @_Z5rsqrtf(float %225) #4
  %231 = fmul float %173, %230
  %232 = fmul float %229, %231
  %233 = tail call float @llvm.fmuladd.f32(float %232, float %229, float %168)
  br label %234

234:                                              ; preds = %227, %222
  %235 = phi float [ %168, %222 ], [ %233, %227 ]
  %236 = add nuw nsw i64 %164, 1
  %237 = icmp eq i64 %236, 8
  br i1 %237, label %238, label %163

238:                                              ; preds = %234, %163
  %239 = phi float [ %168, %163 ], [ %235, %234 ]
  %240 = phi float [ %167, %163 ], [ %223, %234 ]
  %241 = phi float [ %166, %163 ], [ %211, %234 ]
  %242 = phi float [ %165, %163 ], [ %199, %234 ]
  %243 = add nuw nsw i64 %158, 32
  %244 = icmp ult i64 %243, %156
  br i1 %244, label %157, label %245

245:                                              ; preds = %238, %146
  %246 = phi float [ %96, %146 ], [ %239, %238 ]
  %247 = phi float [ %95, %146 ], [ %240, %238 ]
  %248 = phi float [ %94, %146 ], [ %241, %238 ]
  %249 = phi float [ %93, %146 ], [ %242, %238 ]
  tail call void @_Z7barrierj(i32 3) #5
  %250 = add nsw i32 %152, %91
  %251 = load i32, i32* %9, align 4, !tbaa !8
  %252 = icmp slt i32 %250, %251
  br i1 %252, label %88, label %253

253:                                              ; preds = %245, %80
  %254 = phi i32 [ %81, %80 ], [ %84, %245 ]
  %255 = phi float [ 0.000000e+00, %80 ], [ %246, %245 ]
  %256 = phi float [ 0.000000e+00, %80 ], [ %247, %245 ]
  %257 = phi float [ 0.000000e+00, %80 ], [ %248, %245 ]
  %258 = phi float [ 0.000000e+00, %80 ], [ %249, %245 ]
  %259 = shl nsw i32 %77, 6
  %260 = or i32 %259, %254
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds float, float* %39, i64 %261
  store float %258, float* %262, align 4, !tbaa !12
  %263 = or i32 %260, 16
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds float, float* %39, i64 %264
  store float %257, float* %265, align 4, !tbaa !12
  %266 = or i32 %260, 32
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds float, float* %39, i64 %267
  store float %256, float* %268, align 4, !tbaa !12
  %269 = or i32 %260, 48
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds float, float* %39, i64 %270
  store float %255, float* %271, align 4, !tbaa !12
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_local_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_num_groupsj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z5floorf(float) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i32 @_Z5mul24ii(i32, i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #2

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z5rsqrtf(float) local_unnamed_addr #1

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { convergent nounwind readnone }
attributes #5 = { convergent nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 1, i32 0, i32 2, i32 2}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"int", !"int", !"float4*", !"int", !"float", !"float", !"float", !"ener_t*", !"int", !"int*", !"xyz*"}
!6 = !{!"int", !"int", !"float __attribute__((ext_vector_type(4)))*", !"int", !"float", !"float", !"float", !"float*", !"int", !"int*", !"int __attribute__((ext_vector_type(4)))*"}
!7 = !{!"", !"", !"", !"", !"", !"", !"", !"", !"", !"const", !"const"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !10, i64 0}
