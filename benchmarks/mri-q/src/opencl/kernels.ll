; ModuleID = '../benchmarks/mri-q/src/opencl/kernels.cl'
source_filename = "../benchmarks/mri-q/src/opencl/kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.kValues = type { float, float, float, float }

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @ComputePhiMag_GPU(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, i32 %3) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %5 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %6 = trunc i64 %5 to i32
  %7 = icmp slt i32 %6, %3
  br i1 %7, label %8, label %18

8:                                                ; preds = %4
  %9 = shl i64 %5, 32
  %10 = ashr exact i64 %9, 32
  %11 = getelementptr inbounds float, float* %0, i64 %10
  %12 = load float, float* %11, align 4, !tbaa !7
  %13 = getelementptr inbounds float, float* %1, i64 %10
  %14 = load float, float* %13, align 4, !tbaa !7
  %15 = fmul float %14, %14
  %16 = tail call float @llvm.fmuladd.f32(float %12, float %12, float %15)
  %17 = getelementptr inbounds float, float* %2, i64 %10
  store float %16, float* %17, align 4, !tbaa !7
  br label %18

18:                                               ; preds = %8, %4
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #2

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @ComputeQ_GPU(i32 %0, i32 %1, float* nocapture readonly %2, float* nocapture readonly %3, float* nocapture readonly %4, float* nocapture %5, float* nocapture %6, %struct.kValues* nocapture readonly %7) local_unnamed_addr #4 !kernel_arg_addr_space !11 !kernel_arg_access_qual !12 !kernel_arg_type !13 !kernel_arg_base_type !13 !kernel_arg_type_qual !14 {
  %9 = alloca [4 x float], align 16
  %10 = bitcast [4 x float]* %9 to i8*
  %11 = alloca [4 x float], align 16
  %12 = bitcast [4 x float]* %11 to i8*
  %13 = alloca [4 x float], align 16
  %14 = bitcast [4 x float]* %13 to i8*
  %15 = alloca [4 x float], align 16
  %16 = bitcast [4 x float]* %15 to i8*
  %17 = alloca [4 x float], align 16
  %18 = bitcast [4 x float]* %17 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %10) #6
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %12) #6
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %14) #6
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %16) #6
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %18) #6
  %19 = tail call i64 @_Z12get_group_idj(i32 0) #5
  %20 = shl i64 %19, 8
  %21 = tail call i64 @_Z12get_local_idj(i32 0) #5
  %22 = shl i64 %21, 2
  %23 = add i64 %22, %20
  %24 = shl i64 %23, 32
  %25 = ashr exact i64 %24, 32
  %26 = getelementptr float, float* %2, i64 %25
  %27 = bitcast float* %26 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(16) %10, i8* nonnull align 4 dereferenceable(16) %27, i64 16, i1 false)
  %28 = getelementptr float, float* %3, i64 %25
  %29 = bitcast float* %28 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(16) %12, i8* nonnull align 4 dereferenceable(16) %29, i64 16, i1 false)
  %30 = getelementptr float, float* %4, i64 %25
  %31 = bitcast float* %30 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(16) %14, i8* nonnull align 4 dereferenceable(16) %31, i64 16, i1 false)
  %32 = getelementptr float, float* %5, i64 %25
  %33 = bitcast float* %32 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(16) %16, i8* nonnull align 4 dereferenceable(16) %33, i64 16, i1 false)
  %34 = getelementptr float, float* %6, i64 %25
  %35 = bitcast float* %34 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(16) %18, i8* nonnull align 4 dereferenceable(16) %35, i64 16, i1 false)
  %36 = icmp slt i32 %1, %0
  br i1 %36, label %60, label %37

37:                                               ; preds = %8
  %38 = bitcast [4 x float]* %15 to i32*
  %39 = load i32, i32* %38, align 16, !tbaa !7
  %40 = bitcast [4 x float]* %17 to i32*
  %41 = load i32, i32* %40, align 16, !tbaa !7
  %42 = getelementptr inbounds [4 x float], [4 x float]* %15, i64 0, i64 1
  %43 = bitcast float* %42 to i32*
  %44 = load i32, i32* %43, align 4, !tbaa !7
  %45 = getelementptr inbounds [4 x float], [4 x float]* %17, i64 0, i64 1
  %46 = bitcast float* %45 to i32*
  %47 = load i32, i32* %46, align 4, !tbaa !7
  %48 = getelementptr inbounds [4 x float], [4 x float]* %15, i64 0, i64 2
  %49 = bitcast float* %48 to i32*
  %50 = load i32, i32* %49, align 8, !tbaa !7
  %51 = getelementptr inbounds [4 x float], [4 x float]* %17, i64 0, i64 2
  %52 = bitcast float* %51 to i32*
  %53 = load i32, i32* %52, align 8, !tbaa !7
  %54 = getelementptr inbounds [4 x float], [4 x float]* %15, i64 0, i64 3
  %55 = bitcast float* %54 to i32*
  %56 = load i32, i32* %55, align 4, !tbaa !7
  %57 = getelementptr inbounds [4 x float], [4 x float]* %17, i64 0, i64 3
  %58 = bitcast float* %57 to i32*
  %59 = load i32, i32* %58, align 4, !tbaa !7
  br label %110

60:                                               ; preds = %8
  %61 = getelementptr inbounds [4 x float], [4 x float]* %9, i64 0, i64 0
  %62 = load float, float* %61, align 16, !tbaa !7
  %63 = getelementptr inbounds [4 x float], [4 x float]* %11, i64 0, i64 0
  %64 = load float, float* %63, align 16, !tbaa !7
  %65 = getelementptr inbounds [4 x float], [4 x float]* %13, i64 0, i64 0
  %66 = load float, float* %65, align 16, !tbaa !7
  %67 = getelementptr inbounds [4 x float], [4 x float]* %15, i64 0, i64 0
  %68 = load float, float* %67, align 16, !tbaa !7
  %69 = getelementptr inbounds [4 x float], [4 x float]* %17, i64 0, i64 0
  %70 = load float, float* %69, align 16, !tbaa !7
  %71 = getelementptr inbounds [4 x float], [4 x float]* %9, i64 0, i64 1
  %72 = load float, float* %71, align 4, !tbaa !7
  %73 = getelementptr inbounds [4 x float], [4 x float]* %11, i64 0, i64 1
  %74 = load float, float* %73, align 4, !tbaa !7
  %75 = getelementptr inbounds [4 x float], [4 x float]* %13, i64 0, i64 1
  %76 = load float, float* %75, align 4, !tbaa !7
  %77 = getelementptr inbounds [4 x float], [4 x float]* %15, i64 0, i64 1
  %78 = load float, float* %77, align 4, !tbaa !7
  %79 = getelementptr inbounds [4 x float], [4 x float]* %17, i64 0, i64 1
  %80 = load float, float* %79, align 4, !tbaa !7
  %81 = getelementptr inbounds [4 x float], [4 x float]* %9, i64 0, i64 2
  %82 = load float, float* %81, align 8, !tbaa !7
  %83 = getelementptr inbounds [4 x float], [4 x float]* %11, i64 0, i64 2
  %84 = load float, float* %83, align 8, !tbaa !7
  %85 = getelementptr inbounds [4 x float], [4 x float]* %13, i64 0, i64 2
  %86 = load float, float* %85, align 8, !tbaa !7
  %87 = getelementptr inbounds [4 x float], [4 x float]* %15, i64 0, i64 2
  %88 = load float, float* %87, align 8, !tbaa !7
  %89 = getelementptr inbounds [4 x float], [4 x float]* %17, i64 0, i64 2
  %90 = load float, float* %89, align 8, !tbaa !7
  %91 = getelementptr inbounds [4 x float], [4 x float]* %9, i64 0, i64 3
  %92 = load float, float* %91, align 4, !tbaa !7
  %93 = getelementptr inbounds [4 x float], [4 x float]* %11, i64 0, i64 3
  %94 = load float, float* %93, align 4, !tbaa !7
  %95 = getelementptr inbounds [4 x float], [4 x float]* %13, i64 0, i64 3
  %96 = load float, float* %95, align 4, !tbaa !7
  %97 = getelementptr inbounds [4 x float], [4 x float]* %15, i64 0, i64 3
  %98 = load float, float* %97, align 4, !tbaa !7
  %99 = getelementptr inbounds [4 x float], [4 x float]* %17, i64 0, i64 3
  %100 = load float, float* %99, align 4, !tbaa !7
  br label %142

101:                                              ; preds = %142
  store float %166, float* %67, align 16, !tbaa !7
  store float %168, float* %69, align 16, !tbaa !7
  store float %174, float* %77, align 4, !tbaa !7
  store float %176, float* %79, align 4, !tbaa !7
  store float %182, float* %87, align 8, !tbaa !7
  store float %184, float* %89, align 8, !tbaa !7
  store float %190, float* %97, align 4, !tbaa !7
  store float %192, float* %99, align 4, !tbaa !7
  %102 = bitcast float %192 to i32
  %103 = bitcast float %190 to i32
  %104 = bitcast float %184 to i32
  %105 = bitcast float %182 to i32
  %106 = bitcast float %176 to i32
  %107 = bitcast float %174 to i32
  %108 = bitcast float %168 to i32
  %109 = bitcast float %166 to i32
  br label %110

110:                                              ; preds = %37, %101
  %111 = phi i32 [ %59, %37 ], [ %102, %101 ]
  %112 = phi i32 [ %56, %37 ], [ %103, %101 ]
  %113 = phi i32 [ %53, %37 ], [ %104, %101 ]
  %114 = phi i32 [ %50, %37 ], [ %105, %101 ]
  %115 = phi i32 [ %47, %37 ], [ %106, %101 ]
  %116 = phi i32 [ %44, %37 ], [ %107, %101 ]
  %117 = phi i32 [ %41, %37 ], [ %108, %101 ]
  %118 = phi i32 [ %39, %37 ], [ %109, %101 ]
  %119 = bitcast float* %32 to i32*
  store i32 %118, i32* %119, align 4, !tbaa !7
  %120 = bitcast float* %34 to i32*
  store i32 %117, i32* %120, align 4, !tbaa !7
  %121 = shl i64 %23, 32
  %122 = ashr exact i64 %121, 32
  %123 = or i64 %122, 1
  %124 = getelementptr inbounds float, float* %5, i64 %123
  %125 = bitcast float* %124 to i32*
  store i32 %116, i32* %125, align 4, !tbaa !7
  %126 = getelementptr inbounds float, float* %6, i64 %123
  %127 = bitcast float* %126 to i32*
  store i32 %115, i32* %127, align 4, !tbaa !7
  %128 = shl i64 %23, 32
  %129 = ashr exact i64 %128, 32
  %130 = or i64 %129, 2
  %131 = getelementptr inbounds float, float* %5, i64 %130
  %132 = bitcast float* %131 to i32*
  store i32 %114, i32* %132, align 4, !tbaa !7
  %133 = getelementptr inbounds float, float* %6, i64 %130
  %134 = bitcast float* %133 to i32*
  store i32 %113, i32* %134, align 4, !tbaa !7
  %135 = shl i64 %23, 32
  %136 = ashr exact i64 %135, 32
  %137 = or i64 %136, 3
  %138 = getelementptr inbounds float, float* %5, i64 %137
  %139 = bitcast float* %138 to i32*
  store i32 %112, i32* %139, align 4, !tbaa !7
  %140 = getelementptr inbounds float, float* %6, i64 %137
  %141 = bitcast float* %140 to i32*
  store i32 %111, i32* %141, align 4, !tbaa !7
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %18) #6
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %16) #6
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %14) #6
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %12) #6
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %10) #6
  ret void

142:                                              ; preds = %60, %142
  %143 = phi float [ %100, %60 ], [ %192, %142 ]
  %144 = phi float [ %98, %60 ], [ %190, %142 ]
  %145 = phi float [ %90, %60 ], [ %184, %142 ]
  %146 = phi float [ %88, %60 ], [ %182, %142 ]
  %147 = phi float [ %80, %60 ], [ %176, %142 ]
  %148 = phi float [ %78, %60 ], [ %174, %142 ]
  %149 = phi float [ %70, %60 ], [ %168, %142 ]
  %150 = phi float [ %68, %60 ], [ %166, %142 ]
  %151 = phi i64 [ 0, %60 ], [ %193, %142 ]
  %152 = phi i32 [ %1, %60 ], [ %194, %142 ]
  %153 = getelementptr inbounds %struct.kValues, %struct.kValues* %7, i64 %151, i32 0
  %154 = load float, float* %153, align 4, !tbaa !15
  %155 = getelementptr inbounds %struct.kValues, %struct.kValues* %7, i64 %151, i32 1
  %156 = load float, float* %155, align 4, !tbaa !17
  %157 = getelementptr inbounds %struct.kValues, %struct.kValues* %7, i64 %151, i32 2
  %158 = load float, float* %157, align 4, !tbaa !18
  %159 = getelementptr inbounds %struct.kValues, %struct.kValues* %7, i64 %151, i32 3
  %160 = load float, float* %159, align 4, !tbaa !19
  %161 = fmul float %156, %64
  %162 = tail call float @llvm.fmuladd.f32(float %154, float %62, float %161)
  %163 = tail call float @llvm.fmuladd.f32(float %158, float %66, float %162)
  %164 = fmul float %163, 0x401921FB60000000
  %165 = tail call float @_Z3cosf(float %164) #5
  %166 = tail call float @llvm.fmuladd.f32(float %160, float %165, float %150)
  %167 = tail call float @_Z3sinf(float %164) #5
  %168 = tail call float @llvm.fmuladd.f32(float %160, float %167, float %149)
  %169 = fmul float %156, %74
  %170 = tail call float @llvm.fmuladd.f32(float %154, float %72, float %169)
  %171 = tail call float @llvm.fmuladd.f32(float %158, float %76, float %170)
  %172 = fmul float %171, 0x401921FB60000000
  %173 = tail call float @_Z3cosf(float %172) #5
  %174 = tail call float @llvm.fmuladd.f32(float %160, float %173, float %148)
  %175 = tail call float @_Z3sinf(float %172) #5
  %176 = tail call float @llvm.fmuladd.f32(float %160, float %175, float %147)
  %177 = fmul float %156, %84
  %178 = tail call float @llvm.fmuladd.f32(float %154, float %82, float %177)
  %179 = tail call float @llvm.fmuladd.f32(float %158, float %86, float %178)
  %180 = fmul float %179, 0x401921FB60000000
  %181 = tail call float @_Z3cosf(float %180) #5
  %182 = tail call float @llvm.fmuladd.f32(float %160, float %181, float %146)
  %183 = tail call float @_Z3sinf(float %180) #5
  %184 = tail call float @llvm.fmuladd.f32(float %160, float %183, float %145)
  %185 = fmul float %156, %94
  %186 = tail call float @llvm.fmuladd.f32(float %154, float %92, float %185)
  %187 = tail call float @llvm.fmuladd.f32(float %158, float %96, float %186)
  %188 = fmul float %187, 0x401921FB60000000
  %189 = tail call float @_Z3cosf(float %188) #5
  %190 = tail call float @llvm.fmuladd.f32(float %160, float %189, float %144)
  %191 = tail call float @_Z3sinf(float %188) #5
  %192 = tail call float @llvm.fmuladd.f32(float %160, float %191, float %143)
  %193 = add nuw nsw i64 %151, 1
  %194 = add nsw i32 %152, 1
  %195 = icmp ult i64 %151, 1023
  %196 = icmp slt i32 %194, %0
  %197 = and i1 %195, %196
  br i1 %197, label %142, label %101
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3cosf(float) local_unnamed_addr #2

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3sinf(float) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

attributes #0 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { convergent nounwind readnone }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 1, i32 0}
!4 = !{!"none", !"none", !"none", !"none"}
!5 = !{!"float*", !"float*", !"float*", !"int"}
!6 = !{!"", !"", !"", !""}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1}
!12 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!13 = !{!"int", !"int", !"float*", !"float*", !"float*", !"float*", !"float*", !"struct kValues*"}
!14 = !{!"", !"", !"", !"", !"", !"", !"", !""}
!15 = !{!16, !8, i64 0}
!16 = !{!"kValues", !8, i64 0, !8, i64 4, !8, i64 8, !8, i64 12}
!17 = !{!16, !8, i64 4}
!18 = !{!16, !8, i64 8}
!19 = !{!16, !8, i64 12}
