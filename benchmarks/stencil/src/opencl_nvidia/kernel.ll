; ModuleID = '../benchmarks/stencil/src/opencl_nvidia/kernel.cl'
source_filename = "../benchmarks/stencil/src/opencl_nvidia/kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @block2D_hybrid_coarsen_x(float %0, float %1, float* nocapture readonly %2, float* nocapture %3, i32 %4, i32 %5, i32 %6, float* nocapture %7) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %9 = tail call i64 @_Z12get_group_idj(i32 0) #4
  %10 = tail call i64 @_Z14get_local_sizej(i32 0) #4
  %11 = shl i64 %9, 1
  %12 = mul i64 %11, %10
  %13 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %14 = add i64 %12, %13
  %15 = trunc i64 %14 to i32
  %16 = add i64 %14, %10
  %17 = trunc i64 %16 to i32
  %18 = tail call i64 @_Z12get_group_idj(i32 1) #4
  %19 = tail call i64 @_Z14get_local_sizej(i32 1) #4
  %20 = mul i64 %19, %18
  %21 = tail call i64 @_Z12get_local_idj(i32 1) #4
  %22 = add i64 %20, %21
  %23 = trunc i64 %22 to i32
  %24 = shl i64 %10, 1
  %25 = mul i64 %24, %21
  %26 = add i64 %25, %13
  %27 = add i64 %13, %10
  %28 = add i64 %25, %27
  %29 = shl i64 %26, 32
  %30 = ashr exact i64 %29, 32
  %31 = getelementptr inbounds float, float* %7, i64 %30
  store float 0.000000e+00, float* %31, align 4, !tbaa !7
  %32 = shl i64 %28, 32
  %33 = ashr exact i64 %32, 32
  %34 = getelementptr inbounds float, float* %7, i64 %33
  store float 0.000000e+00, float* %34, align 4, !tbaa !7
  tail call void @_Z7barrierj(i32 3) #5
  %35 = icmp sgt i32 %15, 0
  %36 = icmp sgt i32 %23, 0
  %37 = and i1 %35, %36
  %38 = add nsw i32 %4, -1
  %39 = icmp sgt i32 %38, %15
  %40 = and i1 %39, %37
  br i1 %40, label %41, label %44

41:                                               ; preds = %8
  %42 = add nsw i32 %5, -1
  %43 = icmp sgt i32 %42, %23
  br label %44

44:                                               ; preds = %41, %8
  %45 = phi i1 [ false, %8 ], [ %43, %41 ]
  %46 = icmp sgt i32 %38, %17
  %47 = and i1 %46, %36
  br i1 %47, label %48, label %51

48:                                               ; preds = %44
  %49 = add nsw i32 %5, -1
  %50 = icmp sgt i32 %49, %23
  br label %51

51:                                               ; preds = %48, %44
  %52 = phi i1 [ false, %44 ], [ %50, %48 ]
  %53 = icmp eq i64 %13, 0
  %54 = add i64 %24, -1
  %55 = icmp eq i64 %27, %54
  %56 = icmp eq i64 %21, 0
  %57 = add i64 %19, -1
  %58 = icmp eq i64 %21, %57
  %59 = icmp slt i32 %15, %4
  %60 = icmp slt i32 %23, %5
  %61 = and i1 %59, %60
  br i1 %61, label %62, label %76

62:                                               ; preds = %51
  %63 = mul nsw i32 %23, %4
  %64 = add nsw i32 %63, %15
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float* %2, i64 %65
  %67 = load float, float* %66, align 4, !tbaa !7
  %68 = add nsw i32 %23, %5
  %69 = mul nsw i32 %68, %4
  %70 = add nsw i32 %69, %15
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float* %2, i64 %71
  %73 = bitcast float* %72 to i32*
  %74 = load i32, i32* %73, align 4, !tbaa !7
  %75 = bitcast float* %31 to i32*
  store i32 %74, i32* %75, align 4, !tbaa !7
  br label %76

76:                                               ; preds = %62, %51
  %77 = phi float [ %67, %62 ], [ 0.000000e+00, %51 ]
  %78 = icmp slt i32 %17, %4
  %79 = and i1 %78, %60
  br i1 %79, label %80, label %94

80:                                               ; preds = %76
  %81 = mul nsw i32 %23, %4
  %82 = add nsw i32 %81, %17
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float* %2, i64 %83
  %85 = load float, float* %84, align 4, !tbaa !7
  %86 = add nsw i32 %23, %5
  %87 = mul nsw i32 %86, %4
  %88 = add nsw i32 %87, %17
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float* %2, i64 %89
  %91 = bitcast float* %90 to i32*
  %92 = load i32, i32* %91, align 4, !tbaa !7
  %93 = bitcast float* %34 to i32*
  store i32 %92, i32* %93, align 4, !tbaa !7
  br label %94

94:                                               ; preds = %80, %76
  %95 = phi float [ %85, %80 ], [ 0.000000e+00, %76 ]
  tail call void @_Z7barrierj(i32 3) #5
  %96 = icmp sgt i32 %6, 2
  br i1 %96, label %97, label %140

97:                                               ; preds = %94
  %98 = add i64 %30, %24
  %99 = getelementptr inbounds float, float* %7, i64 %98
  %100 = sub i64 %30, %24
  %101 = getelementptr inbounds float, float* %7, i64 %100
  %102 = add i64 %29, -4294967296
  %103 = ashr exact i64 %102, 32
  %104 = getelementptr inbounds float, float* %7, i64 %103
  %105 = add i64 %29, 4294967296
  %106 = ashr exact i64 %105, 32
  %107 = getelementptr inbounds float, float* %7, i64 %106
  %108 = add i64 %33, %24
  %109 = getelementptr inbounds float, float* %7, i64 %108
  %110 = sub i64 %33, %24
  %111 = getelementptr inbounds float, float* %7, i64 %110
  %112 = add i64 %32, 4294967296
  %113 = ashr exact i64 %112, 32
  %114 = getelementptr inbounds float, float* %7, i64 %113
  %115 = add i64 %32, -4294967296
  %116 = ashr exact i64 %115, 32
  %117 = getelementptr inbounds float, float* %7, i64 %116
  %118 = sext i32 %5 to i64
  %119 = shl i64 %22, 32
  %120 = ashr exact i64 %119, 32
  %121 = sext i32 %4 to i64
  %122 = shl i64 %16, 32
  %123 = ashr exact i64 %122, 32
  %124 = shl i64 %16, 32
  %125 = add i64 %124, 4294967296
  %126 = ashr exact i64 %125, 32
  %127 = shl i64 %22, 32
  %128 = add i64 %127, -4294967296
  %129 = ashr exact i64 %128, 32
  %130 = shl i64 %22, 32
  %131 = add i64 %130, 4294967296
  %132 = ashr exact i64 %131, 32
  %133 = shl i64 %14, 32
  %134 = ashr exact i64 %133, 32
  %135 = shl i64 %14, 32
  %136 = add i64 %135, -4294967296
  %137 = ashr exact i64 %136, 32
  %138 = add nsw i32 %6, -1
  %139 = zext i32 %138 to i64
  br label %141

140:                                              ; preds = %236, %94
  ret void

141:                                              ; preds = %236, %97
  %142 = phi i64 [ 1, %97 ], [ %239, %236 ]
  %143 = phi float [ 0.000000e+00, %97 ], [ %201, %236 ]
  %144 = phi float [ 0.000000e+00, %97 ], [ %156, %236 ]
  %145 = phi float [ %95, %97 ], [ %238, %236 ]
  %146 = phi float [ %77, %97 ], [ %237, %236 ]
  br i1 %61, label %147, label %155

147:                                              ; preds = %141
  %148 = add nuw nsw i64 %142, 1
  %149 = mul nsw i64 %148, %118
  %150 = add nsw i64 %149, %120
  %151 = mul nsw i64 %150, %121
  %152 = add nsw i64 %151, %134
  %153 = getelementptr inbounds float, float* %2, i64 %152
  %154 = load float, float* %153, align 4, !tbaa !7
  br label %155

155:                                              ; preds = %147, %141
  %156 = phi float [ %154, %147 ], [ %144, %141 ]
  br i1 %45, label %157, label %191

157:                                              ; preds = %155
  %158 = mul nsw i64 %142, %118
  %159 = add nsw i64 %132, %158
  %160 = mul nsw i64 %159, %121
  %161 = add nsw i64 %160, %134
  %162 = getelementptr inbounds float, float* %2, i64 %161
  %163 = select i1 %58, float* %162, float* %99
  %164 = load float, float* %163, align 4, !tbaa !7
  %165 = mul nsw i64 %142, %118
  %166 = add nsw i64 %129, %165
  %167 = mul nsw i64 %166, %121
  %168 = add nsw i64 %167, %134
  %169 = getelementptr inbounds float, float* %2, i64 %168
  %170 = select i1 %56, float* %169, float* %101
  %171 = load float, float* %170, align 4, !tbaa !7
  %172 = mul nsw i64 %142, %118
  %173 = add nsw i64 %172, %120
  %174 = mul nsw i64 %173, %121
  %175 = add nsw i64 %137, %174
  %176 = getelementptr inbounds float, float* %2, i64 %175
  %177 = select i1 %53, float* %176, float* %104
  %178 = load float, float* %177, align 4, !tbaa !7
  %179 = fadd float %146, %156
  %180 = fadd float %179, %164
  %181 = fadd float %180, %171
  %182 = load float, float* %107, align 4, !tbaa !7
  %183 = fadd float %181, %182
  %184 = fadd float %178, %183
  %185 = load float, float* %31, align 4, !tbaa !7
  %186 = fneg float %185
  %187 = fmul float %186, %0
  %188 = tail call float @llvm.fmuladd.f32(float %184, float %1, float %187)
  %189 = add nsw i64 %174, %134
  %190 = getelementptr inbounds float, float* %3, i64 %189
  store float %188, float* %190, align 4, !tbaa !7
  br label %191

191:                                              ; preds = %157, %155
  br i1 %79, label %192, label %200

192:                                              ; preds = %191
  %193 = add nuw nsw i64 %142, 1
  %194 = mul nsw i64 %193, %118
  %195 = add nsw i64 %194, %120
  %196 = mul nsw i64 %195, %121
  %197 = add nsw i64 %196, %123
  %198 = getelementptr inbounds float, float* %2, i64 %197
  %199 = load float, float* %198, align 4, !tbaa !7
  br label %200

200:                                              ; preds = %192, %191
  %201 = phi float [ %199, %192 ], [ %143, %191 ]
  br i1 %52, label %202, label %236

202:                                              ; preds = %200
  %203 = mul nsw i64 %142, %118
  %204 = add nsw i64 %132, %203
  %205 = mul nsw i64 %204, %121
  %206 = add nsw i64 %205, %123
  %207 = getelementptr inbounds float, float* %2, i64 %206
  %208 = select i1 %58, float* %207, float* %109
  %209 = load float, float* %208, align 4, !tbaa !7
  %210 = mul nsw i64 %142, %118
  %211 = add nsw i64 %129, %210
  %212 = mul nsw i64 %211, %121
  %213 = add nsw i64 %212, %123
  %214 = getelementptr inbounds float, float* %2, i64 %213
  %215 = select i1 %56, float* %214, float* %111
  %216 = load float, float* %215, align 4, !tbaa !7
  %217 = mul nsw i64 %142, %118
  %218 = add nsw i64 %217, %120
  %219 = mul nsw i64 %218, %121
  %220 = add nsw i64 %126, %219
  %221 = getelementptr inbounds float, float* %2, i64 %220
  %222 = select i1 %55, float* %221, float* %114
  %223 = load float, float* %222, align 4, !tbaa !7
  %224 = fadd float %145, %201
  %225 = fadd float %224, %209
  %226 = fadd float %225, %216
  %227 = fadd float %226, %223
  %228 = load float, float* %117, align 4, !tbaa !7
  %229 = fadd float %227, %228
  %230 = load float, float* %34, align 4, !tbaa !7
  %231 = fneg float %230
  %232 = fmul float %231, %0
  %233 = tail call float @llvm.fmuladd.f32(float %229, float %1, float %232)
  %234 = add nsw i64 %219, %123
  %235 = getelementptr inbounds float, float* %3, i64 %234
  store float %233, float* %235, align 4, !tbaa !7
  br label %236

236:                                              ; preds = %202, %200
  tail call void @_Z7barrierj(i32 3) #5
  %237 = load float, float* %31, align 4, !tbaa !7
  store float %156, float* %31, align 4, !tbaa !7
  %238 = load float, float* %34, align 4, !tbaa !7
  store float %201, float* %34, align 4, !tbaa !7
  tail call void @_Z7barrierj(i32 3) #5
  %239 = add nuw nsw i64 %142, 1
  %240 = icmp eq i64 %239, %139
  br i1 %240, label %140, label %141
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_local_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #2

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #3

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
!3 = !{i32 0, i32 0, i32 1, i32 1, i32 0, i32 0, i32 0, i32 3}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"float", !"float", !"float*", !"float*", !"int", !"int", !"int", !"float*"}
!6 = !{!"", !"", !"", !"", !"", !"", !"", !""}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
