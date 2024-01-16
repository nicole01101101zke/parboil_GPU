; ModuleID = '../benchmarks/tpacf/src/opencl_base/kernel.cl'
source_filename = "../benchmarks/tpacf/src/opencl_base/kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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
  br i1 %23, label %199, label %204

24:                                               ; preds = %268
  %25 = sub i32 %270, %3
  %26 = mul i32 %25, %4
  %27 = zext i32 %26 to i64
  br label %34

28:                                               ; preds = %268
  %29 = mul i32 %270, %4
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds float, float* %1, i64 %30
  %32 = getelementptr inbounds float, float* %9, i64 %30
  %33 = getelementptr inbounds float, float* %269, i64 %30
  br label %34

34:                                               ; preds = %28, %24
  %35 = phi i64 [ %30, %28 ], [ %27, %24 ]
  %36 = phi float* [ %33, %28 ], [ %269, %24 ]
  %37 = phi float* [ %32, %28 ], [ %9, %24 ]
  %38 = phi float* [ %31, %28 ], [ %1, %24 ]
  %39 = icmp eq i32 %4, 0
  br i1 %39, label %47, label %40

40:                                               ; preds = %34
  %41 = getelementptr inbounds float, float* %269, i64 %35
  %42 = getelementptr inbounds float, float* %9, i64 %35
  %43 = getelementptr inbounds float, float* %1, i64 %35
  %44 = lshr i64 %11, 1
  %45 = and i64 %44, 2147483647
  %46 = zext i32 %4 to i64
  br label %66

47:                                               ; preds = %93, %34
  %48 = and i32 %12, 63
  %49 = lshr i64 %11, 6
  %50 = zext i32 %48 to i64
  %51 = and i64 %49, 67108863
  %52 = icmp ugt i64 %51, 19
  %53 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %51, i64 %50
  %54 = add nuw nsw i64 %51, 4
  %55 = icmp ugt i64 %51, 15
  %56 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %54, i64 %50
  %57 = add nuw nsw i64 %51, 8
  %58 = icmp ugt i64 %51, 11
  %59 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %57, i64 %50
  %60 = add nuw nsw i64 %51, 12
  %61 = icmp ugt i64 %51, 7
  %62 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %60, i64 %50
  %63 = add nuw nsw i64 %51, 16
  %64 = icmp ugt i64 %51, 3
  %65 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %63, i64 %50
  br label %140

66:                                               ; preds = %40, %93
  %67 = phi i32 [ 0, %40 ], [ %85, %93 ]
  %68 = phi float [ undef, %40 ], [ %84, %93 ]
  %69 = phi float [ undef, %40 ], [ %83, %93 ]
  %70 = phi float [ undef, %40 ], [ %82, %93 ]
  %71 = add i32 %67, %12
  %72 = icmp ult i32 %71, %4
  br i1 %72, label %73, label %81

73:                                               ; preds = %66
  %74 = zext i32 %71 to i64
  %75 = getelementptr inbounds float, float* %43, i64 %74
  %76 = load float, float* %75, align 4, !tbaa !12
  %77 = getelementptr inbounds float, float* %42, i64 %74
  %78 = load float, float* %77, align 4, !tbaa !12
  %79 = getelementptr inbounds float, float* %41, i64 %74
  %80 = load float, float* %79, align 4, !tbaa !12
  br label %81

81:                                               ; preds = %66, %73
  %82 = phi float [ %76, %73 ], [ %70, %66 ]
  %83 = phi float [ %78, %73 ], [ %69, %66 ]
  %84 = phi float [ %80, %73 ], [ %68, %66 ]
  %85 = add i32 %67, 256
  %86 = xor i1 %72, true
  %87 = zext i32 %71 to i64
  %88 = zext i32 %85 to i64
  br label %89

89:                                               ; preds = %137, %81
  %90 = phi i64 [ 0, %81 ], [ %138, %137 ]
  %91 = icmp uge i64 %90, %88
  %92 = and i1 %271, %91
  br i1 %92, label %93, label %95

93:                                               ; preds = %89, %137
  %94 = icmp ult i32 %85, %4
  br i1 %94, label %66, label %47

95:                                               ; preds = %89
  %96 = getelementptr inbounds float, float* %38, i64 %90
  %97 = load float, float* %96, align 4, !tbaa !12
  %98 = getelementptr inbounds float, float* %37, i64 %90
  %99 = load float, float* %98, align 4, !tbaa !12
  %100 = fmul float %83, %99
  %101 = tail call float @llvm.fmuladd.f32(float %97, float %82, float %100)
  %102 = getelementptr inbounds float, float* %36, i64 %90
  %103 = load float, float* %102, align 4, !tbaa !12
  %104 = tail call float @llvm.fmuladd.f32(float %103, float %84, float %101)
  br label %105

105:                                              ; preds = %95, %105
  %106 = phi i32 [ 20, %95 ], [ %115, %105 ]
  %107 = phi i32 [ 0, %95 ], [ %114, %105 ]
  %108 = add i32 %106, %107
  %109 = lshr i32 %108, 1
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float* %2, i64 %110
  %112 = load float, float* %111, align 4, !tbaa !12
  %113 = fcmp ult float %104, %112
  %114 = select i1 %113, i32 %109, i32 %107
  %115 = select i1 %113, i32 %106, i32 %109
  %116 = add i32 %114, 1
  %117 = icmp ugt i32 %115, %116
  br i1 %117, label %105, label %118

118:                                              ; preds = %105
  %119 = add i32 %115, -1
  %120 = zext i32 %114 to i64
  %121 = getelementptr inbounds float, float* %2, i64 %120
  %122 = load float, float* %121, align 4, !tbaa !12
  %123 = fcmp olt float %104, %122
  br i1 %123, label %124, label %137

124:                                              ; preds = %118
  %125 = zext i32 %115 to i64
  %126 = getelementptr inbounds float, float* %2, i64 %125
  %127 = load float, float* %126, align 4, !tbaa !12
  %128 = fcmp ult float %104, %127
  br i1 %128, label %137, label %129

129:                                              ; preds = %124
  %130 = icmp uge i64 %90, %87
  %131 = and i1 %271, %130
  %132 = or i1 %131, %86
  br i1 %132, label %137, label %133

133:                                              ; preds = %129
  %134 = zext i32 %119 to i64
  %135 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %134, i64 %45
  %136 = tail call i32 @_Z8atom_incPU7CLlocalVj(i32* nonnull %135) #5
  br label %137

137:                                              ; preds = %129, %124, %133, %118
  %138 = add nuw nsw i64 %90, 1
  %139 = icmp eq i64 %138, %46
  br i1 %139, label %93, label %89

140:                                              ; preds = %47, %196
  %141 = phi i32 [ 64, %47 ], [ %197, %196 ]
  %142 = icmp ult i32 %48, %141
  %143 = add nuw nsw i32 %141, %48
  %144 = zext i32 %143 to i64
  tail call void @_Z7barrierj(i32 3) #5
  %145 = xor i1 %142, true
  %146 = or i1 %52, %145
  br i1 %146, label %154, label %149

147:                                              ; preds = %196
  tail call void @_Z7barrierj(i32 3) #5
  %148 = icmp ult i32 %12, 20
  br i1 %148, label %157, label %166

149:                                              ; preds = %140
  %150 = load i32, i32* %53, align 4, !tbaa !8
  %151 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %51, i64 %144
  %152 = load i32, i32* %151, align 4, !tbaa !8
  %153 = add i32 %152, %150
  store i32 %153, i32* %53, align 4, !tbaa !8
  br label %154

154:                                              ; preds = %140, %149
  tail call void @_Z7barrierj(i32 3) #5
  %155 = xor i1 %142, true
  %156 = or i1 %55, %155
  br i1 %156, label %172, label %167

157:                                              ; preds = %147
  %158 = mul i64 %10, 20
  %159 = and i64 %158, 4294967292
  %160 = getelementptr inbounds i64, i64* %0, i64 %159
  %161 = and i64 %11, 4294967295
  %162 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %161, i64 0
  %163 = load i32, i32* %162, align 16, !tbaa !8
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds i64, i64* %160, i64 %161
  store i64 %164, i64* %165, align 8, !tbaa !14
  br label %166

166:                                              ; preds = %157, %147
  ret void

167:                                              ; preds = %154
  %168 = load i32, i32* %56, align 4, !tbaa !8
  %169 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %54, i64 %144
  %170 = load i32, i32* %169, align 4, !tbaa !8
  %171 = add i32 %170, %168
  store i32 %171, i32* %56, align 4, !tbaa !8
  br label %172

172:                                              ; preds = %154, %167
  tail call void @_Z7barrierj(i32 3) #5
  %173 = xor i1 %142, true
  %174 = or i1 %58, %173
  br i1 %174, label %180, label %175

175:                                              ; preds = %172
  %176 = load i32, i32* %59, align 4, !tbaa !8
  %177 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %57, i64 %144
  %178 = load i32, i32* %177, align 4, !tbaa !8
  %179 = add i32 %178, %176
  store i32 %179, i32* %59, align 4, !tbaa !8
  br label %180

180:                                              ; preds = %172, %175
  tail call void @_Z7barrierj(i32 3) #5
  %181 = xor i1 %142, true
  %182 = or i1 %61, %181
  br i1 %182, label %188, label %183

183:                                              ; preds = %180
  %184 = load i32, i32* %62, align 4, !tbaa !8
  %185 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %60, i64 %144
  %186 = load i32, i32* %185, align 4, !tbaa !8
  %187 = add i32 %186, %184
  store i32 %187, i32* %62, align 4, !tbaa !8
  br label %188

188:                                              ; preds = %180, %183
  tail call void @_Z7barrierj(i32 3) #5
  %189 = xor i1 %142, true
  %190 = or i1 %64, %189
  br i1 %190, label %196, label %191

191:                                              ; preds = %188
  %192 = load i32, i32* %65, align 4, !tbaa !8
  %193 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %63, i64 %144
  %194 = load i32, i32* %193, align 4, !tbaa !8
  %195 = add i32 %194, %192
  store i32 %195, i32* %65, align 4, !tbaa !8
  br label %196

196:                                              ; preds = %188, %191
  %197 = lshr i32 %141, 1
  %198 = icmp eq i32 %197, 0
  br i1 %198, label %147, label %140

199:                                              ; preds = %21
  %200 = lshr i32 %22, 7
  %201 = zext i32 %200 to i64
  %202 = zext i32 %14 to i64
  %203 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %201, i64 %202
  store i32 0, i32* %203, align 4, !tbaa !8
  br label %204

204:                                              ; preds = %199, %21
  %205 = add i32 %12, 512
  %206 = icmp ult i32 %205, 2560
  br i1 %206, label %207, label %212

207:                                              ; preds = %204
  %208 = lshr i32 %205, 7
  %209 = zext i32 %208 to i64
  %210 = zext i32 %14 to i64
  %211 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %209, i64 %210
  store i32 0, i32* %211, align 4, !tbaa !8
  br label %212

212:                                              ; preds = %207, %204
  %213 = add i32 %12, 768
  %214 = icmp ult i32 %213, 2560
  br i1 %214, label %215, label %220

215:                                              ; preds = %212
  %216 = lshr i32 %213, 7
  %217 = zext i32 %216 to i64
  %218 = zext i32 %14 to i64
  %219 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %217, i64 %218
  store i32 0, i32* %219, align 4, !tbaa !8
  br label %220

220:                                              ; preds = %215, %212
  %221 = add i32 %12, 1024
  %222 = icmp ult i32 %221, 2560
  br i1 %222, label %223, label %228

223:                                              ; preds = %220
  %224 = lshr i32 %221, 7
  %225 = zext i32 %224 to i64
  %226 = zext i32 %14 to i64
  %227 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %225, i64 %226
  store i32 0, i32* %227, align 4, !tbaa !8
  br label %228

228:                                              ; preds = %223, %220
  %229 = add i32 %12, 1280
  %230 = icmp ult i32 %229, 2560
  br i1 %230, label %231, label %236

231:                                              ; preds = %228
  %232 = lshr i32 %229, 7
  %233 = zext i32 %232 to i64
  %234 = zext i32 %14 to i64
  %235 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %233, i64 %234
  store i32 0, i32* %235, align 4, !tbaa !8
  br label %236

236:                                              ; preds = %231, %228
  %237 = add i32 %12, 1536
  %238 = icmp ult i32 %237, 2560
  br i1 %238, label %239, label %244

239:                                              ; preds = %236
  %240 = lshr i32 %237, 7
  %241 = zext i32 %240 to i64
  %242 = zext i32 %14 to i64
  %243 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %241, i64 %242
  store i32 0, i32* %243, align 4, !tbaa !8
  br label %244

244:                                              ; preds = %239, %236
  %245 = add i32 %12, 1792
  %246 = icmp ult i32 %245, 2560
  br i1 %246, label %247, label %252

247:                                              ; preds = %244
  %248 = lshr i32 %245, 7
  %249 = zext i32 %248 to i64
  %250 = zext i32 %14 to i64
  %251 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %249, i64 %250
  store i32 0, i32* %251, align 4, !tbaa !8
  br label %252

252:                                              ; preds = %247, %244
  %253 = add i32 %12, 2048
  %254 = icmp ult i32 %253, 2560
  br i1 %254, label %255, label %260

255:                                              ; preds = %252
  %256 = lshr i32 %253, 7
  %257 = zext i32 %256 to i64
  %258 = zext i32 %14 to i64
  %259 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %257, i64 %258
  store i32 0, i32* %259, align 4, !tbaa !8
  br label %260

260:                                              ; preds = %255, %252
  %261 = add i32 %12, 2304
  %262 = icmp ult i32 %261, 2560
  br i1 %262, label %263, label %268

263:                                              ; preds = %260
  %264 = lshr i32 %261, 7
  %265 = zext i32 %264 to i64
  %266 = zext i32 %14 to i64
  %267 = getelementptr inbounds [20 x [128 x i32]], [20 x [128 x i32]]* @gen_hists.warp_hists, i64 0, i64 %265, i64 %266
  store i32 0, i32* %267, align 4, !tbaa !8
  br label %268

268:                                              ; preds = %263, %260
  %269 = getelementptr inbounds float, float* %9, i64 %8
  %270 = trunc i64 %10 to i32
  %271 = icmp ugt i32 %6, %270
  br i1 %271, label %28, label %24
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: convergent
declare dso_local i32 @_Z8atom_incPU7CLlocalVj(i32*) local_unnamed_addr #3

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #3

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!14 = !{!15, !15, i64 0}
!15 = !{!"long", !10, i64 0}
