; ModuleID = '../benchmarks/spmv/src/opencl_tex_nvidia/opencl_nvidia/kernel.cl'
source_filename = "../benchmarks/spmv/src/opencl_tex_nvidia/opencl_nvidia/kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @spmv_jds(float* nocapture %0, float* nocapture readonly %1, i32* nocapture readonly %2, i32* nocapture readonly %3, float* nocapture readonly %4, i32 %5, i32* nocapture readonly %6, i32* nocapture readonly %7) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %9 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %10 = trunc i64 %9 to i32
  %11 = icmp slt i32 %10, %5
  br i1 %11, label %12, label %128

12:                                               ; preds = %8
  %13 = ashr i32 %10, 5
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32* %7, i64 %14
  %16 = load i32, i32* %15, align 4, !tbaa !7
  %17 = load i32, i32* %6, align 4, !tbaa !7
  %18 = add nsw i32 %17, %10
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float* %1, i64 %19
  %21 = load float, float* %20, align 4, !tbaa !11
  %22 = getelementptr inbounds i32, i32* %2, i64 %19
  %23 = load i32, i32* %22, align 4, !tbaa !7
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float* %4, i64 %24
  %26 = load float, float* %25, align 4, !tbaa !11
  %27 = icmp sgt i32 %16, 1
  br i1 %27, label %28, label %117

28:                                               ; preds = %12
  %29 = getelementptr inbounds i32, i32* %6, i64 1
  %30 = load i32, i32* %29, align 4, !tbaa !7
  %31 = add nsw i32 %30, %10
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32* %2, i64 %32
  %34 = load i32, i32* %33, align 4, !tbaa !7
  %35 = icmp eq i32 %16, 2
  %36 = getelementptr inbounds float, float* %1, i64 %32
  %37 = load float, float* %36, align 4, !tbaa !11
  br i1 %35, label %71, label %38

38:                                               ; preds = %28
  %39 = zext i32 %16 to i64
  %40 = add nsw i64 %39, -2
  %41 = and i64 %40, 1
  %42 = icmp eq i32 %16, 3
  br i1 %42, label %45, label %43

43:                                               ; preds = %38
  %44 = sub nsw i64 %40, %41
  br label %81

45:                                               ; preds = %81, %38
  %46 = phi float [ undef, %38 ], [ %101, %81 ]
  %47 = phi float [ undef, %38 ], [ %105, %81 ]
  %48 = phi float [ undef, %38 ], [ %106, %81 ]
  %49 = phi i32 [ undef, %38 ], [ %112, %81 ]
  %50 = phi float [ undef, %38 ], [ %114, %81 ]
  %51 = phi i64 [ 2, %38 ], [ %107, %81 ]
  %52 = phi float [ %37, %38 ], [ %114, %81 ]
  %53 = phi i32 [ %34, %38 ], [ %112, %81 ]
  %54 = phi float [ 0.000000e+00, %38 ], [ %106, %81 ]
  %55 = phi float [ %26, %38 ], [ %105, %81 ]
  %56 = phi float [ %21, %38 ], [ %101, %81 ]
  %57 = icmp eq i64 %41, 0
  br i1 %57, label %71, label %58

58:                                               ; preds = %45
  %59 = getelementptr inbounds i32, i32* %6, i64 %51
  %60 = load i32, i32* %59, align 4, !tbaa !7
  %61 = add nsw i32 %60, %10
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float* %1, i64 %62
  %64 = load float, float* %63, align 4, !tbaa !11
  %65 = getelementptr inbounds i32, i32* %2, i64 %62
  %66 = load i32, i32* %65, align 4, !tbaa !7
  %67 = tail call float @llvm.fmuladd.f32(float %56, float %55, float %54)
  %68 = sext i32 %53 to i64
  %69 = getelementptr inbounds float, float* %4, i64 %68
  %70 = load float, float* %69, align 4, !tbaa !11
  br label %71

71:                                               ; preds = %58, %45, %28
  %72 = phi float [ %21, %28 ], [ %46, %45 ], [ %52, %58 ]
  %73 = phi float [ %26, %28 ], [ %47, %45 ], [ %70, %58 ]
  %74 = phi float [ 0.000000e+00, %28 ], [ %48, %45 ], [ %67, %58 ]
  %75 = phi i32 [ %34, %28 ], [ %49, %45 ], [ %66, %58 ]
  %76 = phi float [ %37, %28 ], [ %50, %45 ], [ %64, %58 ]
  %77 = sext i32 %75 to i64
  %78 = getelementptr inbounds float, float* %4, i64 %77
  %79 = load float, float* %78, align 4, !tbaa !11
  %80 = tail call float @llvm.fmuladd.f32(float %72, float %73, float %74)
  br label %117

81:                                               ; preds = %81, %43
  %82 = phi i64 [ 2, %43 ], [ %107, %81 ]
  %83 = phi float [ %37, %43 ], [ %114, %81 ]
  %84 = phi i32 [ %34, %43 ], [ %112, %81 ]
  %85 = phi float [ 0.000000e+00, %43 ], [ %106, %81 ]
  %86 = phi float [ %26, %43 ], [ %105, %81 ]
  %87 = phi float [ %21, %43 ], [ %101, %81 ]
  %88 = phi i64 [ %44, %43 ], [ %115, %81 ]
  %89 = getelementptr inbounds i32, i32* %6, i64 %82
  %90 = sext i32 %84 to i64
  %91 = getelementptr inbounds float, float* %4, i64 %90
  %92 = load float, float* %91, align 4, !tbaa !11
  %93 = tail call float @llvm.fmuladd.f32(float %87, float %86, float %85)
  %94 = or i64 %82, 1
  %95 = load i32, i32* %89, align 4, !tbaa !7
  %96 = add nsw i32 %95, %10
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32* %2, i64 %97
  %99 = load i32, i32* %98, align 4, !tbaa !7
  %100 = getelementptr inbounds float, float* %1, i64 %97
  %101 = load float, float* %100, align 4, !tbaa !11
  %102 = getelementptr inbounds i32, i32* %6, i64 %94
  %103 = sext i32 %99 to i64
  %104 = getelementptr inbounds float, float* %4, i64 %103
  %105 = load float, float* %104, align 4, !tbaa !11
  %106 = tail call float @llvm.fmuladd.f32(float %83, float %92, float %93)
  %107 = add nuw nsw i64 %82, 2
  %108 = load i32, i32* %102, align 4, !tbaa !7
  %109 = add nsw i32 %108, %10
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32* %2, i64 %110
  %112 = load i32, i32* %111, align 4, !tbaa !7
  %113 = getelementptr inbounds float, float* %1, i64 %110
  %114 = load float, float* %113, align 4, !tbaa !11
  %115 = add i64 %88, -2
  %116 = icmp eq i64 %115, 0
  br i1 %116, label %45, label %81

117:                                              ; preds = %71, %12
  %118 = phi float [ %76, %71 ], [ %21, %12 ]
  %119 = phi float [ %79, %71 ], [ %26, %12 ]
  %120 = phi float [ %80, %71 ], [ 0.000000e+00, %12 ]
  %121 = tail call float @llvm.fmuladd.f32(float %118, float %119, float %120)
  %122 = shl i64 %9, 32
  %123 = ashr exact i64 %122, 32
  %124 = getelementptr inbounds i32, i32* %3, i64 %123
  %125 = load i32, i32* %124, align 4, !tbaa !7
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float* %0, i64 %126
  store float %121, float* %127, align 4, !tbaa !11
  br label %128

128:                                              ; preds = %117, %8
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

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
!3 = !{i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 2, i32 2}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"float*", !"float*", !"int*", !"int*", !"float*", !"int", !"int*", !"int*"}
!6 = !{!"", !"", !"", !"", !"", !"", !"const", !"const"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
