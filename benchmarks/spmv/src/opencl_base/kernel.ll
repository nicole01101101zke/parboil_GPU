; ModuleID = '../benchmarks/spmv/src/opencl_base/kernel.cl'
source_filename = "../benchmarks/spmv/src/opencl_base/kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @spmv_jds_naive(float* nocapture %0, float* nocapture readonly %1, i32* nocapture readonly %2, i32* nocapture readonly %3, float* nocapture readonly %4, i32 %5, i32* nocapture readonly %6, i32* nocapture readonly %7) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %9 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %10 = trunc i64 %9 to i32
  %11 = icmp slt i32 %10, %5
  br i1 %11, label %12, label %82

12:                                               ; preds = %8
  %13 = sdiv i32 %10, 32
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32* %7, i64 %14
  %16 = load i32, i32* %15, align 4, !tbaa !7
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %42

18:                                               ; preds = %12
  %19 = zext i32 %16 to i64
  %20 = and i64 %19, 1
  %21 = icmp eq i32 %16, 1
  br i1 %21, label %24, label %22

22:                                               ; preds = %18
  %23 = sub nsw i64 %19, %20
  br label %50

24:                                               ; preds = %50, %18
  %25 = phi float [ undef, %18 ], [ %78, %50 ]
  %26 = phi i64 [ 0, %18 ], [ %79, %50 ]
  %27 = phi float [ 0.000000e+00, %18 ], [ %78, %50 ]
  %28 = icmp eq i64 %20, 0
  br i1 %28, label %42, label %29

29:                                               ; preds = %24
  %30 = getelementptr inbounds i32, i32* %6, i64 %26
  %31 = load i32, i32* %30, align 4, !tbaa !7
  %32 = add nsw i32 %31, %10
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float* %1, i64 %33
  %35 = load float, float* %34, align 4, !tbaa !11
  %36 = getelementptr inbounds i32, i32* %2, i64 %33
  %37 = load i32, i32* %36, align 4, !tbaa !7
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float* %4, i64 %38
  %40 = load float, float* %39, align 4, !tbaa !11
  %41 = tail call float @llvm.fmuladd.f32(float %35, float %40, float %27)
  br label %42

42:                                               ; preds = %29, %24, %12
  %43 = phi float [ 0.000000e+00, %12 ], [ %25, %24 ], [ %41, %29 ]
  %44 = shl i64 %9, 32
  %45 = ashr exact i64 %44, 32
  %46 = getelementptr inbounds i32, i32* %3, i64 %45
  %47 = load i32, i32* %46, align 4, !tbaa !7
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float* %0, i64 %48
  store float %43, float* %49, align 4, !tbaa !11
  br label %82

50:                                               ; preds = %50, %22
  %51 = phi i64 [ 0, %22 ], [ %79, %50 ]
  %52 = phi float [ 0.000000e+00, %22 ], [ %78, %50 ]
  %53 = phi i64 [ %23, %22 ], [ %80, %50 ]
  %54 = getelementptr inbounds i32, i32* %6, i64 %51
  %55 = load i32, i32* %54, align 4, !tbaa !7
  %56 = add nsw i32 %55, %10
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32* %2, i64 %57
  %59 = load i32, i32* %58, align 4, !tbaa !7
  %60 = getelementptr inbounds float, float* %1, i64 %57
  %61 = load float, float* %60, align 4, !tbaa !11
  %62 = sext i32 %59 to i64
  %63 = getelementptr inbounds float, float* %4, i64 %62
  %64 = load float, float* %63, align 4, !tbaa !11
  %65 = tail call float @llvm.fmuladd.f32(float %61, float %64, float %52)
  %66 = or i64 %51, 1
  %67 = getelementptr inbounds i32, i32* %6, i64 %66
  %68 = load i32, i32* %67, align 4, !tbaa !7
  %69 = add nsw i32 %68, %10
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32* %2, i64 %70
  %72 = load i32, i32* %71, align 4, !tbaa !7
  %73 = getelementptr inbounds float, float* %1, i64 %70
  %74 = load float, float* %73, align 4, !tbaa !11
  %75 = sext i32 %72 to i64
  %76 = getelementptr inbounds float, float* %4, i64 %75
  %77 = load float, float* %76, align 4, !tbaa !11
  %78 = tail call float @llvm.fmuladd.f32(float %74, float %77, float %65)
  %79 = add nuw nsw i64 %51, 2
  %80 = add i64 %53, -2
  %81 = icmp eq i64 %80, 0
  br i1 %81, label %24, label %50

82:                                               ; preds = %42, %8
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
