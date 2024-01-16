; ModuleID = '../benchmarks/cutcp/src/opencl_base/kernel.cl'
source_filename = "../benchmarks/cutcp/src/opencl_base/kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@opencl_cutoff_potential_lattice.AtomBinCache = internal unnamed_addr global [1024 x float] undef, align 16
@opencl_cutoff_potential_lattice.myBinIndex = internal unnamed_addr global <4 x i32> undef, align 16

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @opencl_cutoff_potential_lattice(i32 %0, i32 %1, <4 x float>* nocapture readonly %2, i32 %3, float %4, float %5, float %6, float* nocapture %7, i32 %8, i32* nocapture readonly %9, <4 x i32>* nocapture readonly %10) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %12 = sext i32 %3 to i64
  %13 = tail call i64 @_Z12get_local_idj(i32 2) #4
  %14 = shl i64 %13, 3
  %15 = tail call i64 @_Z12get_local_idj(i32 1) #4
  %16 = add i64 %14, %15
  %17 = shl i64 %16, 3
  %18 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %19 = add i64 %17, %18
  %20 = trunc i64 %19 to i32
  %21 = sext i32 %8 to i64
  %22 = tail call i64 @_Z14get_num_groupsj(i32 1) #4
  %23 = mul i64 %22, %21
  %24 = tail call i64 @_Z12get_group_idj(i32 1) #4
  %25 = add i64 %23, %24
  %26 = tail call i64 @_Z14get_num_groupsj(i32 0) #4
  %27 = lshr i64 %26, 2
  %28 = mul i64 %27, %25
  %29 = tail call i64 @_Z12get_group_idj(i32 0) #4
  %30 = lshr i64 %29, 2
  %31 = add i64 %28, %30
  %32 = shl i64 %31, 9
  %33 = getelementptr inbounds float, float* %7, i64 %32
  %34 = and i64 %29, 3
  %35 = shl nuw nsw i64 %34, 7
  %36 = getelementptr inbounds float, float* %33, i64 %35
  %37 = shl i64 %30, 3
  %38 = add i64 %37, %18
  %39 = uitofp i64 %38 to float
  %40 = fmul float %39, %4
  %41 = shl i64 %24, 3
  %42 = add i64 %41, %15
  %43 = uitofp i64 %42 to float
  %44 = fmul float %43, %4
  %45 = shl nsw i32 %8, 3
  %46 = sext i32 %45 to i64
  %47 = shl nuw nsw i64 %34, 1
  %48 = or i64 %47, %46
  %49 = add i64 %48, %13
  %50 = uitofp i64 %49 to float
  %51 = fmul float %50, %4
  %52 = or i64 %37, 4
  %53 = uitofp i64 %52 to float
  %54 = fmul float %53, %4
  %55 = fmul float %54, 2.500000e-01
  %56 = tail call float @_Z5floorf(float %55) #4
  %57 = fptosi float %56 to i32
  %58 = load <4 x i32>, <4 x i32>* @opencl_cutoff_potential_lattice.myBinIndex, align 16
  %59 = insertelement <4 x i32> %58, i32 %57, i64 0
  %60 = or i64 %41, 4
  %61 = uitofp i64 %60 to float
  %62 = fmul float %61, %4
  %63 = fmul float %62, 2.500000e-01
  %64 = tail call float @_Z5floorf(float %63) #4
  %65 = fptosi float %64 to i32
  %66 = insertelement <4 x i32> %59, i32 %65, i64 1
  %67 = or i32 %45, 4
  %68 = sitofp i32 %67 to float
  %69 = fmul float %68, %4
  %70 = fmul float %69, 2.500000e-01
  %71 = tail call float @_Z5floorf(float %70) #4
  %72 = fptosi float %71 to i32
  %73 = insertelement <4 x i32> %66, i32 %72, i64 2
  store <4 x i32> %73, <4 x i32>* @opencl_cutoff_potential_lattice.myBinIndex, align 16
  %74 = ashr i32 %20, 4
  %75 = load i32, i32* %9, align 4, !tbaa !8
  %76 = icmp sgt i32 %75, 0
  br i1 %76, label %77, label %223

77:                                               ; preds = %11
  %78 = shl i32 %74, 5
  %79 = and i32 %20, 15
  %80 = zext i32 %79 to i64
  %81 = or i32 %79, 16
  %82 = zext i32 %81 to i64
  %83 = or i32 %78, %79
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice.AtomBinCache, i64 0, i64 %84
  %86 = bitcast float* %85 to i32*
  %87 = or i32 %83, 16
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice.AtomBinCache, i64 0, i64 %88
  %90 = bitcast float* %89 to i32*
  %91 = add nsw i32 %78, 256
  %92 = or i32 %91, %79
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice.AtomBinCache, i64 0, i64 %93
  %95 = bitcast float* %94 to i32*
  %96 = or i32 %92, 16
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice.AtomBinCache, i64 0, i64 %97
  %99 = bitcast float* %98 to i32*
  %100 = add nsw i32 %78, 512
  %101 = or i32 %100, %79
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice.AtomBinCache, i64 0, i64 %102
  %104 = bitcast float* %103 to i32*
  %105 = or i32 %101, 16
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice.AtomBinCache, i64 0, i64 %106
  %108 = bitcast float* %107 to i32*
  %109 = add nsw i32 %78, 768
  %110 = or i32 %109, %79
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice.AtomBinCache, i64 0, i64 %111
  %113 = bitcast float* %112 to i32*
  %114 = or i32 %110, 16
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice.AtomBinCache, i64 0, i64 %115
  %117 = bitcast float* %116 to i32*
  br label %118

118:                                              ; preds = %77, %218
  %119 = phi i32 [ %75, %77 ], [ %221, %218 ]
  %120 = phi i32 [ %74, %77 ], [ %159, %218 ]
  %121 = phi i32 [ 0, %77 ], [ %220, %218 ]
  %122 = phi i32 [ 32, %77 ], [ %164, %218 ]
  %123 = phi float [ 0.000000e+00, %77 ], [ %219, %218 ]
  %124 = icmp slt i32 %120, %119
  br i1 %124, label %125, label %158

125:                                              ; preds = %118
  %126 = load <4 x i32>, <4 x i32>* @opencl_cutoff_potential_lattice.myBinIndex, align 16
  %127 = extractelement <4 x i32> %126, i64 0
  %128 = extractelement <4 x i32> %126, i64 1
  %129 = extractelement <4 x i32> %126, i64 2
  %130 = sext i32 %120 to i64
  %131 = sext i32 %119 to i64
  %132 = getelementptr inbounds <4 x i32>, <4 x i32>* %10, i64 %130
  %133 = load <4 x i32>, <4 x i32>* %132, align 16
  %134 = extractelement <4 x i32> %133, i64 0
  %135 = add nsw i32 %134, %127
  %136 = extractelement <4 x i32> %133, i64 1
  %137 = add nsw i32 %136, %128
  %138 = extractelement <4 x i32> %133, i64 2
  %139 = add nsw i32 %138, %129
  %140 = mul nsw i32 %139, %1
  %141 = add nsw i32 %137, %140
  %142 = mul nsw i32 %141, %0
  %143 = add nsw i32 %135, %142
  %144 = shl nsw i32 %143, 5
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %12, i64 %145
  %147 = getelementptr inbounds float, float* %146, i64 %80
  %148 = bitcast float* %147 to i32*
  %149 = load i32, i32* %148, align 4, !tbaa !12
  store i32 %149, i32* %86, align 4, !tbaa !12
  %150 = getelementptr inbounds float, float* %146, i64 %82
  %151 = bitcast float* %150 to i32*
  %152 = load i32, i32* %151, align 4, !tbaa !12
  store i32 %152, i32* %90, align 4, !tbaa !12
  %153 = add nsw i64 %130, 8
  %154 = icmp slt i64 %153, %131
  br i1 %154, label %228, label %155

155:                                              ; preds = %276, %252, %228, %125
  %156 = phi i64 [ %153, %125 ], [ %250, %228 ], [ %274, %252 ], [ %298, %276 ]
  %157 = trunc i64 %156 to i32
  br label %158

158:                                              ; preds = %155, %118
  %159 = phi i32 [ %120, %118 ], [ %157, %155 ]
  tail call void @_Z7barrierj(i32 3) #5
  %160 = add nsw i32 %121, 32
  %161 = load i32, i32* %9, align 4, !tbaa !8
  %162 = icmp sgt i32 %160, %161
  %163 = sub nsw i32 %161, %121
  %164 = select i1 %162, i32 %163, i32 %122
  %165 = icmp sgt i32 %164, 0
  br i1 %165, label %166, label %218

166:                                              ; preds = %158
  %167 = zext i32 %164 to i64
  br label %168

168:                                              ; preds = %214, %166
  %169 = phi i64 [ 0, %166 ], [ %216, %214 ]
  %170 = phi float [ %123, %166 ], [ %215, %214 ]
  %171 = trunc i64 %169 to i32
  %172 = shl nsw i32 %171, 5
  %173 = sext i32 %172 to i64
  br label %174

174:                                              ; preds = %210, %168
  %175 = phi i64 [ 0, %168 ], [ %212, %210 ]
  %176 = phi float [ %170, %168 ], [ %211, %210 ]
  %177 = shl nuw nsw i64 %175, 2
  %178 = add nuw nsw i64 %177, %173
  %179 = and i64 %178, 4294967292
  %180 = or i64 %179, 3
  %181 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice.AtomBinCache, i64 0, i64 %180
  %182 = load float, float* %181, align 4, !tbaa !12
  %183 = fcmp oeq float %182, 0.000000e+00
  br i1 %183, label %214, label %184

184:                                              ; preds = %174
  %185 = and i64 %178, 4294967292
  %186 = or i64 %185, 2
  %187 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice.AtomBinCache, i64 0, i64 %186
  %188 = load float, float* %187, align 8, !tbaa !12
  %189 = and i64 %178, 4294967292
  %190 = or i64 %189, 1
  %191 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice.AtomBinCache, i64 0, i64 %190
  %192 = load float, float* %191, align 4, !tbaa !12
  %193 = and i64 %178, 4294967292
  %194 = getelementptr inbounds [1024 x float], [1024 x float]* @opencl_cutoff_potential_lattice.AtomBinCache, i64 0, i64 %193
  %195 = load float, float* %194, align 16, !tbaa !12
  %196 = fsub float %195, %40
  %197 = fsub float %192, %44
  %198 = fmul float %197, %197
  %199 = tail call float @llvm.fmuladd.f32(float %196, float %196, float %198)
  %200 = fsub float %188, %51
  %201 = tail call float @llvm.fmuladd.f32(float %200, float %200, float %199)
  %202 = fcmp olt float %201, %5
  br i1 %202, label %203, label %210

203:                                              ; preds = %184
  %204 = fneg float %201
  %205 = tail call float @llvm.fmuladd.f32(float %204, float %6, float 1.000000e+00)
  %206 = tail call float @_Z5rsqrtf(float %201) #4
  %207 = fmul float %182, %206
  %208 = fmul float %205, %207
  %209 = tail call float @llvm.fmuladd.f32(float %208, float %205, float %176)
  br label %210

210:                                              ; preds = %203, %184
  %211 = phi float [ %176, %184 ], [ %209, %203 ]
  %212 = add nuw nsw i64 %175, 1
  %213 = icmp eq i64 %212, 8
  br i1 %213, label %214, label %174

214:                                              ; preds = %210, %174
  %215 = phi float [ %176, %174 ], [ %211, %210 ]
  %216 = add nuw nsw i64 %169, 1
  %217 = icmp eq i64 %216, %167
  br i1 %217, label %218, label %168

218:                                              ; preds = %214, %158
  %219 = phi float [ %123, %158 ], [ %215, %214 ]
  tail call void @_Z7barrierj(i32 3) #5
  %220 = add nsw i32 %164, %121
  %221 = load i32, i32* %9, align 4, !tbaa !8
  %222 = icmp slt i32 %220, %221
  br i1 %222, label %118, label %223

223:                                              ; preds = %218, %11
  %224 = phi float [ 0.000000e+00, %11 ], [ %219, %218 ]
  %225 = shl i64 %19, 32
  %226 = ashr exact i64 %225, 32
  %227 = getelementptr inbounds float, float* %36, i64 %226
  store float %224, float* %227, align 4, !tbaa !12
  ret void

228:                                              ; preds = %125
  %229 = getelementptr inbounds <4 x i32>, <4 x i32>* %10, i64 %153
  %230 = load <4 x i32>, <4 x i32>* %229, align 16
  %231 = extractelement <4 x i32> %230, i64 0
  %232 = add nsw i32 %231, %127
  %233 = extractelement <4 x i32> %230, i64 1
  %234 = add nsw i32 %233, %128
  %235 = extractelement <4 x i32> %230, i64 2
  %236 = add nsw i32 %235, %129
  %237 = mul nsw i32 %236, %1
  %238 = add nsw i32 %234, %237
  %239 = mul nsw i32 %238, %0
  %240 = add nsw i32 %232, %239
  %241 = shl nsw i32 %240, 5
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %12, i64 %242
  %244 = getelementptr inbounds float, float* %243, i64 %80
  %245 = bitcast float* %244 to i32*
  %246 = load i32, i32* %245, align 4, !tbaa !12
  store i32 %246, i32* %95, align 4, !tbaa !12
  %247 = getelementptr inbounds float, float* %243, i64 %82
  %248 = bitcast float* %247 to i32*
  %249 = load i32, i32* %248, align 4, !tbaa !12
  store i32 %249, i32* %99, align 4, !tbaa !12
  %250 = add nsw i64 %130, 16
  %251 = icmp slt i64 %250, %131
  br i1 %251, label %252, label %155

252:                                              ; preds = %228
  %253 = getelementptr inbounds <4 x i32>, <4 x i32>* %10, i64 %250
  %254 = load <4 x i32>, <4 x i32>* %253, align 16
  %255 = extractelement <4 x i32> %254, i64 0
  %256 = add nsw i32 %255, %127
  %257 = extractelement <4 x i32> %254, i64 1
  %258 = add nsw i32 %257, %128
  %259 = extractelement <4 x i32> %254, i64 2
  %260 = add nsw i32 %259, %129
  %261 = mul nsw i32 %260, %1
  %262 = add nsw i32 %258, %261
  %263 = mul nsw i32 %262, %0
  %264 = add nsw i32 %256, %263
  %265 = shl nsw i32 %264, 5
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %12, i64 %266
  %268 = getelementptr inbounds float, float* %267, i64 %80
  %269 = bitcast float* %268 to i32*
  %270 = load i32, i32* %269, align 4, !tbaa !12
  store i32 %270, i32* %104, align 4, !tbaa !12
  %271 = getelementptr inbounds float, float* %267, i64 %82
  %272 = bitcast float* %271 to i32*
  %273 = load i32, i32* %272, align 4, !tbaa !12
  store i32 %273, i32* %108, align 4, !tbaa !12
  %274 = add nsw i64 %130, 24
  %275 = icmp slt i64 %274, %131
  br i1 %275, label %276, label %155

276:                                              ; preds = %252
  %277 = getelementptr inbounds <4 x i32>, <4 x i32>* %10, i64 %274
  %278 = load <4 x i32>, <4 x i32>* %277, align 16
  %279 = extractelement <4 x i32> %278, i64 0
  %280 = add nsw i32 %279, %127
  %281 = extractelement <4 x i32> %278, i64 1
  %282 = add nsw i32 %281, %128
  %283 = extractelement <4 x i32> %278, i64 2
  %284 = add nsw i32 %283, %129
  %285 = mul nsw i32 %284, %1
  %286 = add nsw i32 %282, %285
  %287 = mul nsw i32 %286, %0
  %288 = add nsw i32 %280, %287
  %289 = shl nsw i32 %288, 5
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %12, i64 %290
  %292 = getelementptr inbounds float, float* %291, i64 %80
  %293 = bitcast float* %292 to i32*
  %294 = load i32, i32* %293, align 4, !tbaa !12
  store i32 %294, i32* %113, align 4, !tbaa !12
  %295 = getelementptr inbounds float, float* %291, i64 %82
  %296 = bitcast float* %295 to i32*
  %297 = load i32, i32* %296, align 4, !tbaa !12
  store i32 %297, i32* %117, align 4, !tbaa !12
  %298 = add nsw i64 %130, 32
  br label %155
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_num_groupsj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z5floorf(float) local_unnamed_addr #1

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
!5 = !{!"int", !"int", !"float4*", !"int", !"float", !"float", !"float", !"float*", !"int", !"int*", !"xyz*"}
!6 = !{!"int", !"int", !"float __attribute__((ext_vector_type(4)))*", !"int", !"float", !"float", !"float", !"float*", !"int", !"int*", !"int __attribute__((ext_vector_type(4)))*"}
!7 = !{!"", !"", !"", !"", !"", !"", !"", !"", !"", !"const", !"const"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !10, i64 0}
