; ModuleID = '../benchmarks/lbm/src/opencl_nvidia/kernel.cl'
source_filename = "../benchmarks/lbm/src/opencl_nvidia/kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @performStreamCollide_kernel(float* nocapture readonly %0, float* nocapture %1) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %3 = getelementptr inbounds float, float* %0, i64 30720
  %4 = getelementptr inbounds float, float* %1, i64 30720
  %5 = tail call i64 @_Z12get_local_idj(i32 0) #3
  %6 = trunc i64 %5 to i32
  %7 = tail call i64 @_Z12get_group_idj(i32 0) #3
  %8 = trunc i64 %7 to i32
  %9 = tail call i64 @_Z12get_group_idj(i32 1) #3
  %10 = trunc i64 %9 to i32
  %11 = shl i32 %8, 7
  %12 = add nsw i32 %11, %6
  %13 = mul i32 %10, 15360
  %14 = add nsw i32 %12, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, float* %3, i64 %15
  %17 = load float, float* %16, align 4, !tbaa !7
  %18 = add i32 %11, -128
  %19 = add nsw i32 %18, %6
  %20 = add i32 %13, 2365440
  %21 = add i32 %20, %19
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float* %3, i64 %22
  %24 = load float, float* %23, align 4, !tbaa !7
  %25 = add i32 %11, 128
  %26 = add nsw i32 %25, %6
  %27 = add i32 %13, 4730880
  %28 = add i32 %27, %26
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float* %3, i64 %29
  %31 = load float, float* %30, align 4, !tbaa !7
  %32 = add nsw i32 %6, -1
  %33 = add nsw i32 %11, %32
  %34 = add i32 %13, 7096320
  %35 = add i32 %34, %33
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float* %3, i64 %36
  %38 = load float, float* %37, align 4, !tbaa !7
  %39 = add nsw i32 %6, 1
  %40 = add nsw i32 %11, %39
  %41 = add i32 %13, 9461760
  %42 = add i32 %41, %40
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float* %3, i64 %43
  %45 = load float, float* %44, align 4, !tbaa !7
  %46 = add i32 %13, -15360
  %47 = add i32 %12, 11827200
  %48 = add i32 %47, %46
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float* %3, i64 %49
  %51 = load float, float* %50, align 4, !tbaa !7
  %52 = add i32 %13, 15360
  %53 = add i32 %12, 14192640
  %54 = add i32 %53, %52
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float* %3, i64 %55
  %57 = load float, float* %56, align 4, !tbaa !7
  %58 = add i32 %13, %18
  %59 = add i32 %58, 16558080
  %60 = add i32 %59, %32
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float* %3, i64 %61
  %63 = load float, float* %62, align 4, !tbaa !7
  %64 = add i32 %58, 18923520
  %65 = add i32 %64, %39
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float* %3, i64 %66
  %68 = load float, float* %67, align 4, !tbaa !7
  %69 = add i32 %13, %25
  %70 = add i32 %69, 21288960
  %71 = add i32 %70, %32
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float* %3, i64 %72
  %74 = load float, float* %73, align 4, !tbaa !7
  %75 = add i32 %69, 23654400
  %76 = add i32 %75, %39
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float* %3, i64 %77
  %79 = load float, float* %78, align 4, !tbaa !7
  %80 = add i32 %13, 26004480
  %81 = add i32 %80, %19
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float* %3, i64 %82
  %84 = load float, float* %83, align 4, !tbaa !7
  %85 = add i32 %13, 28400640
  %86 = add i32 %85, %19
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float* %3, i64 %87
  %89 = load float, float* %88, align 4, !tbaa !7
  %90 = add i32 %13, 30735360
  %91 = add i32 %90, %26
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float* %3, i64 %92
  %94 = load float, float* %93, align 4, !tbaa !7
  %95 = add i32 %13, 33131520
  %96 = add i32 %95, %26
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float* %3, i64 %97
  %99 = load float, float* %98, align 4, !tbaa !7
  %100 = add i32 %33, 35481600
  %101 = add i32 %100, %46
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float* %3, i64 %102
  %104 = load float, float* %103, align 4, !tbaa !7
  %105 = add i32 %33, 37847040
  %106 = add i32 %105, %52
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float* %3, i64 %107
  %109 = load float, float* %108, align 4, !tbaa !7
  %110 = add i32 %40, 40212480
  %111 = add i32 %110, %46
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float* %3, i64 %112
  %114 = load float, float* %113, align 4, !tbaa !7
  %115 = add i32 %40, 42577920
  %116 = add i32 %115, %52
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float* %3, i64 %117
  %119 = load float, float* %118, align 4, !tbaa !7
  %120 = add nsw i32 %14, 44943360
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float* %3, i64 %121
  %123 = bitcast float* %122 to i32*
  %124 = load i32, i32* %123, align 4, !tbaa !7
  %125 = and i32 %124, 1
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %127, label %278

127:                                              ; preds = %2
  %128 = fadd float %17, %24
  %129 = fadd float %128, %31
  %130 = fadd float %129, %38
  %131 = fadd float %130, %45
  %132 = fadd float %131, %51
  %133 = fadd float %132, %57
  %134 = fadd float %133, %63
  %135 = fadd float %134, %68
  %136 = fadd float %135, %74
  %137 = fadd float %136, %79
  %138 = fadd float %137, %84
  %139 = fadd float %138, %89
  %140 = fadd float %139, %94
  %141 = fadd float %140, %99
  %142 = fadd float %141, %104
  %143 = fadd float %142, %109
  %144 = fadd float %143, %114
  %145 = fadd float %144, %119
  %146 = fsub float %38, %45
  %147 = fadd float %146, %63
  %148 = fsub float %147, %68
  %149 = fadd float %148, %74
  %150 = fsub float %149, %79
  %151 = fadd float %150, %104
  %152 = fadd float %151, %109
  %153 = fsub float %152, %114
  %154 = fsub float %153, %119
  %155 = fsub float %24, %31
  %156 = fadd float %155, %63
  %157 = fadd float %156, %68
  %158 = fsub float %157, %74
  %159 = fsub float %158, %79
  %160 = fadd float %159, %84
  %161 = fadd float %160, %89
  %162 = fsub float %161, %94
  %163 = fsub float %162, %99
  %164 = fsub float %51, %57
  %165 = fadd float %164, %84
  %166 = fsub float %165, %89
  %167 = fadd float %166, %94
  %168 = fsub float %167, %99
  %169 = fadd float %168, %104
  %170 = fsub float %169, %109
  %171 = fadd float %170, %114
  %172 = fsub float %171, %119
  %173 = fdiv float %154, %145, !fpmath !11
  %174 = fdiv float %163, %145, !fpmath !11
  %175 = fdiv float %172, %145, !fpmath !11
  %176 = and i32 %124, 2
  %177 = icmp eq i32 %176, 0
  %178 = select i1 %177, float %173, float 0x3F747AE140000000
  %179 = select i1 %177, float %174, float 0x3F60624DE0000000
  %180 = select i1 %177, float %175, float 0.000000e+00
  %181 = fmul float %179, %179
  %182 = tail call float @llvm.fmuladd.f32(float %178, float %178, float %181)
  %183 = tail call float @llvm.fmuladd.f32(float %180, float %180, float %182)
  %184 = tail call float @llvm.fmuladd.f32(float %183, float 1.500000e+00, float -1.000000e+00)
  %185 = fmul float %145, 0x3FFF333340000000
  %186 = fmul float %185, 0x3FD5555560000000
  %187 = fneg float %184
  %188 = fmul float %186, %187
  %189 = tail call float @llvm.fmuladd.f32(float %17, float 0xBFEE666680000000, float %188)
  %190 = fmul float %185, 0x3FAC71C720000000
  %191 = tail call float @llvm.fmuladd.f32(float %179, float 4.500000e+00, float 3.000000e+00)
  %192 = tail call float @llvm.fmuladd.f32(float %179, float %191, float %187)
  %193 = fmul float %190, %192
  %194 = tail call float @llvm.fmuladd.f32(float %24, float 0xBFEE666680000000, float %193)
  %195 = tail call float @llvm.fmuladd.f32(float %179, float 4.500000e+00, float -3.000000e+00)
  %196 = tail call float @llvm.fmuladd.f32(float %179, float %195, float %187)
  %197 = fmul float %190, %196
  %198 = tail call float @llvm.fmuladd.f32(float %31, float 0xBFEE666680000000, float %197)
  %199 = tail call float @llvm.fmuladd.f32(float %180, float 4.500000e+00, float 3.000000e+00)
  %200 = tail call float @llvm.fmuladd.f32(float %180, float %199, float %187)
  %201 = fmul float %190, %200
  %202 = tail call float @llvm.fmuladd.f32(float %51, float 0xBFEE666680000000, float %201)
  %203 = tail call float @llvm.fmuladd.f32(float %180, float 4.500000e+00, float -3.000000e+00)
  %204 = tail call float @llvm.fmuladd.f32(float %180, float %203, float %187)
  %205 = fmul float %190, %204
  %206 = tail call float @llvm.fmuladd.f32(float %57, float 0xBFEE666680000000, float %205)
  %207 = tail call float @llvm.fmuladd.f32(float %178, float 4.500000e+00, float 3.000000e+00)
  %208 = tail call float @llvm.fmuladd.f32(float %178, float %207, float %187)
  %209 = fmul float %190, %208
  %210 = tail call float @llvm.fmuladd.f32(float %38, float 0xBFEE666680000000, float %209)
  %211 = tail call float @llvm.fmuladd.f32(float %178, float 4.500000e+00, float -3.000000e+00)
  %212 = tail call float @llvm.fmuladd.f32(float %178, float %211, float %187)
  %213 = fmul float %190, %212
  %214 = tail call float @llvm.fmuladd.f32(float %45, float 0xBFEE666680000000, float %213)
  %215 = fmul float %185, 0x3F9C71C720000000
  %216 = fadd float %179, %180
  %217 = tail call float @llvm.fmuladd.f32(float %216, float 4.500000e+00, float 3.000000e+00)
  %218 = tail call float @llvm.fmuladd.f32(float %216, float %217, float %187)
  %219 = fmul float %215, %218
  %220 = tail call float @llvm.fmuladd.f32(float %84, float 0xBFEE666680000000, float %219)
  %221 = fsub float %179, %180
  %222 = tail call float @llvm.fmuladd.f32(float %221, float 4.500000e+00, float 3.000000e+00)
  %223 = tail call float @llvm.fmuladd.f32(float %221, float %222, float %187)
  %224 = fmul float %215, %223
  %225 = tail call float @llvm.fmuladd.f32(float %89, float 0xBFEE666680000000, float %224)
  %226 = fneg float %179
  %227 = fsub float %180, %179
  %228 = tail call float @llvm.fmuladd.f32(float %227, float 4.500000e+00, float 3.000000e+00)
  %229 = tail call float @llvm.fmuladd.f32(float %227, float %228, float %187)
  %230 = fmul float %215, %229
  %231 = tail call float @llvm.fmuladd.f32(float %94, float 0xBFEE666680000000, float %230)
  %232 = fsub float %226, %180
  %233 = tail call float @llvm.fmuladd.f32(float %232, float 4.500000e+00, float 3.000000e+00)
  %234 = tail call float @llvm.fmuladd.f32(float %232, float %233, float %187)
  %235 = fmul float %215, %234
  %236 = tail call float @llvm.fmuladd.f32(float %99, float 0xBFEE666680000000, float %235)
  %237 = fadd float %178, %179
  %238 = tail call float @llvm.fmuladd.f32(float %237, float 4.500000e+00, float 3.000000e+00)
  %239 = tail call float @llvm.fmuladd.f32(float %237, float %238, float %187)
  %240 = fmul float %215, %239
  %241 = tail call float @llvm.fmuladd.f32(float %63, float 0xBFEE666680000000, float %240)
  %242 = fsub float %178, %179
  %243 = tail call float @llvm.fmuladd.f32(float %242, float 4.500000e+00, float 3.000000e+00)
  %244 = tail call float @llvm.fmuladd.f32(float %242, float %243, float %187)
  %245 = fmul float %215, %244
  %246 = tail call float @llvm.fmuladd.f32(float %74, float 0xBFEE666680000000, float %245)
  %247 = fadd float %178, %180
  %248 = tail call float @llvm.fmuladd.f32(float %247, float 4.500000e+00, float 3.000000e+00)
  %249 = tail call float @llvm.fmuladd.f32(float %247, float %248, float %187)
  %250 = fmul float %215, %249
  %251 = tail call float @llvm.fmuladd.f32(float %104, float 0xBFEE666680000000, float %250)
  %252 = fsub float %178, %180
  %253 = tail call float @llvm.fmuladd.f32(float %252, float 4.500000e+00, float 3.000000e+00)
  %254 = tail call float @llvm.fmuladd.f32(float %252, float %253, float %187)
  %255 = fmul float %215, %254
  %256 = tail call float @llvm.fmuladd.f32(float %109, float 0xBFEE666680000000, float %255)
  %257 = fneg float %178
  %258 = fsub float %179, %178
  %259 = tail call float @llvm.fmuladd.f32(float %258, float 4.500000e+00, float 3.000000e+00)
  %260 = tail call float @llvm.fmuladd.f32(float %258, float %259, float %187)
  %261 = fmul float %215, %260
  %262 = tail call float @llvm.fmuladd.f32(float %68, float 0xBFEE666680000000, float %261)
  %263 = fsub float %257, %179
  %264 = tail call float @llvm.fmuladd.f32(float %263, float 4.500000e+00, float 3.000000e+00)
  %265 = tail call float @llvm.fmuladd.f32(float %263, float %264, float %187)
  %266 = fmul float %215, %265
  %267 = tail call float @llvm.fmuladd.f32(float %79, float 0xBFEE666680000000, float %266)
  %268 = fsub float %180, %178
  %269 = tail call float @llvm.fmuladd.f32(float %268, float 4.500000e+00, float 3.000000e+00)
  %270 = tail call float @llvm.fmuladd.f32(float %268, float %269, float %187)
  %271 = fmul float %215, %270
  %272 = tail call float @llvm.fmuladd.f32(float %114, float 0xBFEE666680000000, float %271)
  %273 = fsub float %257, %180
  %274 = tail call float @llvm.fmuladd.f32(float %273, float 4.500000e+00, float 3.000000e+00)
  %275 = tail call float @llvm.fmuladd.f32(float %273, float %274, float %187)
  %276 = fmul float %215, %275
  %277 = tail call float @llvm.fmuladd.f32(float %119, float 0xBFEE666680000000, float %276)
  br label %278

278:                                              ; preds = %2, %127
  %279 = phi float [ %210, %127 ], [ %45, %2 ]
  %280 = phi float [ %214, %127 ], [ %38, %2 ]
  %281 = phi float [ %202, %127 ], [ %57, %2 ]
  %282 = phi float [ %206, %127 ], [ %51, %2 ]
  %283 = phi float [ %241, %127 ], [ %79, %2 ]
  %284 = phi float [ %262, %127 ], [ %74, %2 ]
  %285 = phi float [ %246, %127 ], [ %68, %2 ]
  %286 = phi float [ %267, %127 ], [ %63, %2 ]
  %287 = phi float [ %220, %127 ], [ %99, %2 ]
  %288 = phi float [ %225, %127 ], [ %94, %2 ]
  %289 = phi float [ %231, %127 ], [ %89, %2 ]
  %290 = phi float [ %236, %127 ], [ %84, %2 ]
  %291 = phi float [ %251, %127 ], [ %119, %2 ]
  %292 = phi float [ %256, %127 ], [ %114, %2 ]
  %293 = phi float [ %272, %127 ], [ %109, %2 ]
  %294 = phi float [ %277, %127 ], [ %104, %2 ]
  %295 = phi float [ %198, %127 ], [ %24, %2 ]
  %296 = phi float [ %194, %127 ], [ %31, %2 ]
  %297 = phi float [ %189, %127 ], [ %17, %2 ]
  %298 = getelementptr inbounds float, float* %4, i64 %15
  store float %297, float* %298, align 4, !tbaa !7
  %299 = add nsw i32 %14, 2365440
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds float, float* %4, i64 %300
  store float %296, float* %301, align 4, !tbaa !7
  %302 = add nsw i32 %14, 4730880
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds float, float* %4, i64 %303
  store float %295, float* %304, align 4, !tbaa !7
  %305 = add nsw i32 %14, 7096320
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds float, float* %4, i64 %306
  store float %279, float* %307, align 4, !tbaa !7
  %308 = add nsw i32 %14, 9461760
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds float, float* %4, i64 %309
  store float %280, float* %310, align 4, !tbaa !7
  %311 = add nsw i32 %14, 11827200
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds float, float* %4, i64 %312
  store float %281, float* %313, align 4, !tbaa !7
  %314 = add nsw i32 %14, 14192640
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds float, float* %4, i64 %315
  store float %282, float* %316, align 4, !tbaa !7
  %317 = add nsw i32 %14, 16558080
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds float, float* %4, i64 %318
  store float %283, float* %319, align 4, !tbaa !7
  %320 = add nsw i32 %14, 18923520
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds float, float* %4, i64 %321
  store float %284, float* %322, align 4, !tbaa !7
  %323 = add nsw i32 %14, 21288960
  %324 = sext i32 %323 to i64
  %325 = getelementptr inbounds float, float* %4, i64 %324
  store float %285, float* %325, align 4, !tbaa !7
  %326 = add nsw i32 %14, 23654400
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds float, float* %4, i64 %327
  store float %286, float* %328, align 4, !tbaa !7
  %329 = add nsw i32 %14, 26019840
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds float, float* %4, i64 %330
  store float %287, float* %331, align 4, !tbaa !7
  %332 = add nsw i32 %14, 28385280
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds float, float* %4, i64 %333
  store float %288, float* %334, align 4, !tbaa !7
  %335 = add nsw i32 %14, 30750720
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds float, float* %4, i64 %336
  store float %289, float* %337, align 4, !tbaa !7
  %338 = add nsw i32 %14, 33116160
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds float, float* %4, i64 %339
  store float %290, float* %340, align 4, !tbaa !7
  %341 = add nsw i32 %14, 35481600
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds float, float* %4, i64 %342
  store float %291, float* %343, align 4, !tbaa !7
  %344 = add nsw i32 %14, 37847040
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds float, float* %4, i64 %345
  store float %292, float* %346, align 4, !tbaa !7
  %347 = add nsw i32 %14, 40212480
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds float, float* %4, i64 %348
  store float %293, float* %349, align 4, !tbaa !7
  %350 = add nsw i32 %14, 42577920
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds float, float* %4, i64 %351
  store float %294, float* %352, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

attributes #0 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { convergent nounwind readnone }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1}
!4 = !{!"none", !"none"}
!5 = !{!"float*", !"float*"}
!6 = !{!"", !""}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{float 2.500000e+00}
