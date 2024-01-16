; ModuleID = '../benchmarks/tpacf/src/opencl_nvidia/kernel.cl'
source_filename = "../benchmarks/tpacf/src/opencl_nvidia/kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.cartesian = type { float, float, float }

@gen_hists.data_s = internal unnamed_addr global [256 x %struct.cartesian] undef, align 16
@gen_hists.warp_hists = internal global [20 x [128 x i32]] undef, align 16

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @gen_hists(i64* nocapture %0, float* nocapture readonly %1, float* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %6 = add nsw i32 %3, 1
  %7 = mul nsw i32 %6, %4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds float, float* %1, i64 %8
  %10 = tail call i64 @_Z12get_group_idj(i32 0) #4
  %11 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %12 = trunc i64 %11 to i32
  %13 = trunc i64 %11 to i32
  %14 = and i32 %13, 127
  %15 = icmp ult i32 %12, 2560
  br i1 %15, label %16, label %21

16:                                               ; preds = %5
  %17 = lshr i64 %11, 7
  %18 = and i64 %17, 33554431
  %19 = zext i32 %14 to i64
  %20 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %18, i64 %19
  store i32 0, i32* %20, align 4, !tbaa !8
  br label %21

21:                                               ; preds = %5, %16
  %22 = add i32 %12, 256
  %23 = icmp ult i32 %22, 2560
  br i1 %23, label %234, label %239

24:                                               ; preds = %303
  %25 = sub i32 %305, %3
  %26 = mul i32 %25, %4
  %27 = zext i32 %26 to i64
  br label %34

28:                                               ; preds = %303
  %29 = mul i32 %305, %4
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds float, float* %1, i64 %30
  %32 = getelementptr inbounds float, float* %9, i64 %30
  %33 = getelementptr inbounds float, float* %304, i64 %30
  br label %34

34:                                               ; preds = %28, %24
  %35 = phi i64 [ %30, %28 ], [ %27, %24 ]
  %36 = phi float* [ %33, %28 ], [ %304, %24 ]
  %37 = phi float* [ %32, %28 ], [ %9, %24 ]
  %38 = phi float* [ %31, %28 ], [ %1, %24 ]
  %39 = icmp eq i32 %4, 0
  br i1 %39, label %54, label %40

40:                                               ; preds = %34
  %41 = and i64 %11, 4294967295
  %42 = getelementptr inbounds [256 x %struct.cartesian], [256 x %struct.cartesian]* @gen_hists.data_s, i64 0, i64 %41
  %43 = bitcast %struct.cartesian* %42 to i32*
  %44 = getelementptr inbounds [256 x %struct.cartesian], [256 x %struct.cartesian]* @gen_hists.data_s, i64 0, i64 %41, i32 1
  %45 = bitcast float* %44 to i32*
  %46 = getelementptr inbounds [256 x %struct.cartesian], [256 x %struct.cartesian]* @gen_hists.data_s, i64 0, i64 %41, i32 2
  %47 = bitcast float* %46 to i32*
  %48 = getelementptr inbounds float, float* %304, i64 %35
  %49 = getelementptr inbounds float, float* %9, i64 %35
  %50 = getelementptr inbounds float, float* %1, i64 %35
  %51 = lshr i64 %11, 1
  %52 = and i64 %51, 2147483647
  %53 = zext i32 %4 to i64
  br label %73

54:                                               ; preds = %97, %34
  %55 = and i32 %12, 63
  %56 = lshr i64 %11, 6
  %57 = zext i32 %55 to i64
  %58 = and i64 %56, 67108863
  %59 = icmp ugt i64 %58, 19
  %60 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %58, i64 %57
  %61 = add nuw nsw i64 %58, 4
  %62 = icmp ugt i64 %58, 15
  %63 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %61, i64 %57
  %64 = add nuw nsw i64 %58, 8
  %65 = icmp ugt i64 %58, 11
  %66 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %64, i64 %57
  %67 = add nuw nsw i64 %58, 12
  %68 = icmp ugt i64 %58, 7
  %69 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %67, i64 %57
  %70 = add nuw nsw i64 %58, 16
  %71 = icmp ugt i64 %58, 3
  %72 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %70, i64 %57
  br label %175

73:                                               ; preds = %40, %97
  %74 = phi i32 [ 0, %40 ], [ %101, %97 ]
  %75 = phi float [ undef, %40 ], [ %100, %97 ]
  %76 = phi float [ undef, %40 ], [ %99, %97 ]
  %77 = phi float [ undef, %40 ], [ %98, %97 ]
  %78 = add i32 %74, %12
  %79 = icmp ult i32 %78, %4
  br i1 %79, label %80, label %91

80:                                               ; preds = %73
  %81 = zext i32 %78 to i64
  %82 = getelementptr inbounds float, float* %38, i64 %81
  %83 = bitcast float* %82 to i32*
  %84 = load i32, i32* %83, align 4, !tbaa !12
  %85 = getelementptr inbounds float, float* %37, i64 %81
  %86 = bitcast float* %85 to i32*
  %87 = load i32, i32* %86, align 4, !tbaa !12
  %88 = getelementptr inbounds float, float* %36, i64 %81
  %89 = bitcast float* %88 to i32*
  %90 = load i32, i32* %89, align 4, !tbaa !12
  store i32 %84, i32* %43, align 4, !tbaa.struct !14
  store i32 %87, i32* %45, align 4, !tbaa.struct !14
  store i32 %90, i32* %47, align 4, !tbaa.struct !14
  br label %91

91:                                               ; preds = %80, %73
  tail call void @_Z7barrierj(i32 3) #5
  %92 = or i32 %74, 1
  %93 = select i1 %306, i32 %92, i32 0
  %94 = icmp ult i32 %93, %4
  br i1 %94, label %95, label %97

95:                                               ; preds = %91
  %96 = zext i32 %74 to i64
  br label %103

97:                                               ; preds = %127, %91
  %98 = phi float [ %77, %91 ], [ %119, %127 ]
  %99 = phi float [ %76, %91 ], [ %120, %127 ]
  %100 = phi float [ %75, %91 ], [ %121, %127 ]
  %101 = add i32 %74, 256
  %102 = icmp ult i32 %101, %4
  br i1 %102, label %73, label %54

103:                                              ; preds = %95, %127
  %104 = phi float [ %121, %127 ], [ %75, %95 ]
  %105 = phi float [ %120, %127 ], [ %76, %95 ]
  %106 = phi float [ %119, %127 ], [ %77, %95 ]
  %107 = phi i32 [ %128, %127 ], [ %93, %95 ]
  %108 = add i32 %107, %12
  %109 = icmp ult i32 %108, %4
  %110 = zext i32 %108 to i64
  br i1 %109, label %111, label %118

111:                                              ; preds = %103
  %112 = getelementptr inbounds float, float* %50, i64 %110
  %113 = load float, float* %112, align 4, !tbaa !12
  %114 = getelementptr inbounds float, float* %49, i64 %110
  %115 = load float, float* %114, align 4, !tbaa !12
  %116 = getelementptr inbounds float, float* %48, i64 %110
  %117 = load float, float* %116, align 4, !tbaa !12
  br label %118

118:                                              ; preds = %103, %111
  %119 = phi float [ %113, %111 ], [ %106, %103 ]
  %120 = phi float [ %115, %111 ], [ %105, %103 ]
  %121 = phi float [ %117, %111 ], [ %104, %103 ]
  %122 = xor i1 %109, true
  br label %123

123:                                              ; preds = %172, %118
  %124 = phi i64 [ 0, %118 ], [ %173, %172 ]
  %125 = add nuw nsw i64 %124, %96
  %126 = icmp ult i64 %125, %53
  br i1 %126, label %130, label %127

127:                                              ; preds = %172, %123
  %128 = add i32 %107, 256
  %129 = icmp ult i32 %128, %4
  br i1 %129, label %103, label %97

130:                                              ; preds = %123
  %131 = getelementptr inbounds [256 x %struct.cartesian], [256 x %struct.cartesian]* @gen_hists.data_s, i64 0, i64 %124, i32 0
  %132 = load float, float* %131, align 4, !tbaa !15
  %133 = getelementptr inbounds [256 x %struct.cartesian], [256 x %struct.cartesian]* @gen_hists.data_s, i64 0, i64 %124, i32 1
  %134 = load float, float* %133, align 4, !tbaa !17
  %135 = fmul float %120, %134
  %136 = tail call float @llvm.fmuladd.f32(float %132, float %119, float %135)
  %137 = getelementptr inbounds [256 x %struct.cartesian], [256 x %struct.cartesian]* @gen_hists.data_s, i64 0, i64 %124, i32 2
  %138 = load float, float* %137, align 4, !tbaa !18
  %139 = tail call float @llvm.fmuladd.f32(float %138, float %121, float %136)
  br label %140

140:                                              ; preds = %130, %140
  %141 = phi i32 [ 20, %130 ], [ %150, %140 ]
  %142 = phi i32 [ 0, %130 ], [ %149, %140 ]
  %143 = add i32 %141, %142
  %144 = lshr i32 %143, 1
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds float, float* %2, i64 %145
  %147 = load float, float* %146, align 4, !tbaa !12
  %148 = fcmp ult float %139, %147
  %149 = select i1 %148, i32 %144, i32 %142
  %150 = select i1 %148, i32 %141, i32 %144
  %151 = add i32 %149, 1
  %152 = icmp ugt i32 %150, %151
  br i1 %152, label %140, label %153

153:                                              ; preds = %140
  %154 = add i32 %150, -1
  %155 = zext i32 %149 to i64
  %156 = getelementptr inbounds float, float* %2, i64 %155
  %157 = load float, float* %156, align 4, !tbaa !12
  %158 = fcmp olt float %139, %157
  br i1 %158, label %159, label %172

159:                                              ; preds = %153
  %160 = zext i32 %150 to i64
  %161 = getelementptr inbounds float, float* %2, i64 %160
  %162 = load float, float* %161, align 4, !tbaa !12
  %163 = fcmp ult float %139, %162
  br i1 %163, label %172, label %164

164:                                              ; preds = %159
  %165 = icmp uge i64 %125, %110
  %166 = and i1 %306, %165
  %167 = or i1 %166, %122
  br i1 %167, label %172, label %168

168:                                              ; preds = %164
  %169 = zext i32 %154 to i64
  %170 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %169, i64 %52
  %171 = tail call i32 @_Z8atom_incPU7CLlocalVj(i32* nonnull %170) #5
  br label %172

172:                                              ; preds = %164, %159, %168, %153
  %173 = add nuw nsw i64 %124, 1
  %174 = icmp eq i64 %173, 256
  br i1 %174, label %127, label %123

175:                                              ; preds = %54, %231
  %176 = phi i32 [ 64, %54 ], [ %232, %231 ]
  %177 = icmp ult i32 %55, %176
  %178 = add nuw nsw i32 %176, %55
  %179 = zext i32 %178 to i64
  tail call void @_Z7barrierj(i32 3) #5
  %180 = xor i1 %177, true
  %181 = or i1 %59, %180
  br i1 %181, label %189, label %184

182:                                              ; preds = %231
  tail call void @_Z7barrierj(i32 3) #5
  %183 = icmp ult i32 %12, 20
  br i1 %183, label %192, label %201

184:                                              ; preds = %175
  %185 = load i32, i32* %60, align 4, !tbaa !8
  %186 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %58, i64 %179
  %187 = load i32, i32* %186, align 4, !tbaa !8
  %188 = add i32 %187, %185
  store i32 %188, i32* %60, align 4, !tbaa !8
  br label %189

189:                                              ; preds = %175, %184
  tail call void @_Z7barrierj(i32 3) #5
  %190 = xor i1 %177, true
  %191 = or i1 %62, %190
  br i1 %191, label %207, label %202

192:                                              ; preds = %182
  %193 = mul i64 %10, 20
  %194 = and i64 %193, 4294967292
  %195 = getelementptr inbounds i64, i64* %0, i64 %194
  %196 = and i64 %11, 4294967295
  %197 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %196, i64 0
  %198 = load i32, i32* %197, align 16, !tbaa !8
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds i64, i64* %195, i64 %196
  store i64 %199, i64* %200, align 8, !tbaa !19
  br label %201

201:                                              ; preds = %192, %182
  ret void

202:                                              ; preds = %189
  %203 = load i32, i32* %63, align 4, !tbaa !8
  %204 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %61, i64 %179
  %205 = load i32, i32* %204, align 4, !tbaa !8
  %206 = add i32 %205, %203
  store i32 %206, i32* %63, align 4, !tbaa !8
  br label %207

207:                                              ; preds = %189, %202
  tail call void @_Z7barrierj(i32 3) #5
  %208 = xor i1 %177, true
  %209 = or i1 %65, %208
  br i1 %209, label %215, label %210

210:                                              ; preds = %207
  %211 = load i32, i32* %66, align 4, !tbaa !8
  %212 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %64, i64 %179
  %213 = load i32, i32* %212, align 4, !tbaa !8
  %214 = add i32 %213, %211
  store i32 %214, i32* %66, align 4, !tbaa !8
  br label %215

215:                                              ; preds = %207, %210
  tail call void @_Z7barrierj(i32 3) #5
  %216 = xor i1 %177, true
  %217 = or i1 %68, %216
  br i1 %217, label %223, label %218

218:                                              ; preds = %215
  %219 = load i32, i32* %69, align 4, !tbaa !8
  %220 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %67, i64 %179
  %221 = load i32, i32* %220, align 4, !tbaa !8
  %222 = add i32 %221, %219
  store i32 %222, i32* %69, align 4, !tbaa !8
  br label %223

223:                                              ; preds = %215, %218
  tail call void @_Z7barrierj(i32 3) #5
  %224 = xor i1 %177, true
  %225 = or i1 %71, %224
  br i1 %225, label %231, label %226

226:                                              ; preds = %223
  %227 = load i32, i32* %72, align 4, !tbaa !8
  %228 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %70, i64 %179
  %229 = load i32, i32* %228, align 4, !tbaa !8
  %230 = add i32 %229, %227
  store i32 %230, i32* %72, align 4, !tbaa !8
  br label %231

231:                                              ; preds = %223, %226
  %232 = lshr i32 %176, 1
  %233 = icmp eq i32 %232, 0
  br i1 %233, label %182, label %175

234:                                              ; preds = %21
  %235 = lshr i32 %22, 7
  %236 = zext i32 %235 to i64
  %237 = zext i32 %14 to i64
  %238 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %236, i64 %237
  store i32 0, i32* %238, align 4, !tbaa !8
  br label %239

239:                                              ; preds = %234, %21
  %240 = add i32 %12, 512
  %241 = icmp ult i32 %240, 2560
  br i1 %241, label %242, label %247

242:                                              ; preds = %239
  %243 = lshr i32 %240, 7
  %244 = zext i32 %243 to i64
  %245 = zext i32 %14 to i64
  %246 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %244, i64 %245
  store i32 0, i32* %246, align 4, !tbaa !8
  br label %247

247:                                              ; preds = %242, %239
  %248 = add i32 %12, 768
  %249 = icmp ult i32 %248, 2560
  br i1 %249, label %250, label %255

250:                                              ; preds = %247
  %251 = lshr i32 %248, 7
  %252 = zext i32 %251 to i64
  %253 = zext i32 %14 to i64
  %254 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %252, i64 %253
  store i32 0, i32* %254, align 4, !tbaa !8
  br label %255

255:                                              ; preds = %250, %247
  %256 = add i32 %12, 1024
  %257 = icmp ult i32 %256, 2560
  br i1 %257, label %258, label %263

258:                                              ; preds = %255
  %259 = lshr i32 %256, 7
  %260 = zext i32 %259 to i64
  %261 = zext i32 %14 to i64
  %262 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %260, i64 %261
  store i32 0, i32* %262, align 4, !tbaa !8
  br label %263

263:                                              ; preds = %258, %255
  %264 = add i32 %12, 1280
  %265 = icmp ult i32 %264, 2560
  br i1 %265, label %266, label %271

266:                                              ; preds = %263
  %267 = lshr i32 %264, 7
  %268 = zext i32 %267 to i64
  %269 = zext i32 %14 to i64
  %270 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %268, i64 %269
  store i32 0, i32* %270, align 4, !tbaa !8
  br label %271

271:                                              ; preds = %266, %263
  %272 = add i32 %12, 1536
  %273 = icmp ult i32 %272, 2560
  br i1 %273, label %274, label %279

274:                                              ; preds = %271
  %275 = lshr i32 %272, 7
  %276 = zext i32 %275 to i64
  %277 = zext i32 %14 to i64
  %278 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %276, i64 %277
  store i32 0, i32* %278, align 4, !tbaa !8
  br label %279

279:                                              ; preds = %274, %271
  %280 = add i32 %12, 1792
  %281 = icmp ult i32 %280, 2560
  br i1 %281, label %282, label %287

282:                                              ; preds = %279
  %283 = lshr i32 %280, 7
  %284 = zext i32 %283 to i64
  %285 = zext i32 %14 to i64
  %286 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %284, i64 %285
  store i32 0, i32* %286, align 4, !tbaa !8
  br label %287

287:                                              ; preds = %282, %279
  %288 = add i32 %12, 2048
  %289 = icmp ult i32 %288, 2560
  br i1 %289, label %290, label %295

290:                                              ; preds = %287
  %291 = lshr i32 %288, 7
  %292 = zext i32 %291 to i64
  %293 = zext i32 %14 to i64
  %294 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %292, i64 %293
  store i32 0, i32* %294, align 4, !tbaa !8
  br label %295

295:                                              ; preds = %290, %287
  %296 = add i32 %12, 2304
  %297 = icmp ult i32 %296, 2560
  br i1 %297, label %298, label %303

298:                                              ; preds = %295
  %299 = lshr i32 %296, 7
  %300 = zext i32 %299 to i64
  %301 = zext i32 %14 to i64
  %302 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %300, i64 %301
  store i32 0, i32* %302, align 4, !tbaa !8
  br label %303

303:                                              ; preds = %298, %295
  %304 = getelementptr inbounds float, float* %9, i64 %8
  %305 = trunc i64 %10 to i32
  %306 = icmp ugt i32 %6, %305
  br i1 %306, label %28, label %24
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #2

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: convergent
declare dso_local i32 @_Z8atom_incPU7CLlocalVj(i32*) local_unnamed_addr #2

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
!3 = !{i32 1, i32 1, i32 2, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none"}
!5 = !{!"hist_t*", !"float*", !"float*", !"int", !"int"}
!6 = !{!"ulong*", !"float*", !"float*", !"int", !"int"}
!7 = !{!"", !"", !"const", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !10, i64 0}
!14 = !{i64 0, i64 4, !12, i64 4, i64 4, !12, i64 8, i64 4, !12}
!15 = !{!16, !13, i64 0}
!16 = !{!"cartesian", !13, i64 0, !13, i64 4, !13, i64 8}
!17 = !{!16, !13, i64 4}
!18 = !{!16, !13, i64 8}
!19 = !{!20, !20, i64 0}
!20 = !{!"long", !10, i64 0}
