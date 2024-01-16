; ModuleID = '../benchmarks/spmv/src/opencl_ati/kernel.cl'
source_filename = "../benchmarks/spmv/src/opencl_ati/kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @spmv_jds_vec(float* nocapture %0, float* nocapture readonly %1, i32* nocapture readonly %2, i32* nocapture readonly %3, float* nocapture readonly %4, i32 %5, i32* nocapture readonly %6, i32* nocapture readonly %7, i32 %8) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %10 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %11 = trunc i64 %10 to i32
  %12 = icmp slt i32 %11, %5
  br i1 %12, label %13, label %83

13:                                               ; preds = %9
  %14 = sdiv i32 %11, %8
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32* %7, i64 %15
  %17 = load i32, i32* %16, align 4, !tbaa !7
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %19, label %75

19:                                               ; preds = %13
  %20 = zext i32 %17 to i64
  %21 = and i64 %20, 1
  %22 = icmp eq i32 %17, 1
  br i1 %22, label %57, label %23

23:                                               ; preds = %19
  %24 = sub nsw i64 %20, %21
  br label %25

25:                                               ; preds = %25, %23
  %26 = phi i64 [ 0, %23 ], [ %53, %25 ]
  %27 = phi float [ 0.000000e+00, %23 ], [ %54, %25 ]
  %28 = phi i64 [ %24, %23 ], [ %55, %25 ]
  %29 = getelementptr inbounds i32, i32* %6, i64 %26
  %30 = load i32, i32* %29, align 4, !tbaa !7
  %31 = add nsw i32 %30, %11
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32* %2, i64 %32
  %34 = load i32, i32* %33, align 4, !tbaa !7
  %35 = getelementptr inbounds float, float* %1, i64 %32
  %36 = load float, float* %35, align 4, !tbaa !11
  %37 = sext i32 %34 to i64
  %38 = getelementptr inbounds float, float* %4, i64 %37
  %39 = load float, float* %38, align 4, !tbaa !11
  %40 = or i64 %26, 1
  %41 = tail call float @llvm.fmuladd.f32(float %39, float %36, float %27)
  %42 = getelementptr inbounds i32, i32* %6, i64 %40
  %43 = load i32, i32* %42, align 4, !tbaa !7
  %44 = add nsw i32 %43, %11
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32* %2, i64 %45
  %47 = load i32, i32* %46, align 4, !tbaa !7
  %48 = getelementptr inbounds float, float* %1, i64 %45
  %49 = load float, float* %48, align 4, !tbaa !11
  %50 = sext i32 %47 to i64
  %51 = getelementptr inbounds float, float* %4, i64 %50
  %52 = load float, float* %51, align 4, !tbaa !11
  %53 = add nuw nsw i64 %26, 2
  %54 = tail call float @llvm.fmuladd.f32(float %52, float %49, float %41)
  %55 = add i64 %28, -2
  %56 = icmp eq i64 %55, 0
  br i1 %56, label %57, label %25

57:                                               ; preds = %25, %19
  %58 = phi float [ undef, %19 ], [ %54, %25 ]
  %59 = phi i64 [ 0, %19 ], [ %53, %25 ]
  %60 = phi float [ 0.000000e+00, %19 ], [ %54, %25 ]
  %61 = icmp eq i64 %21, 0
  br i1 %61, label %75, label %62

62:                                               ; preds = %57
  %63 = getelementptr inbounds i32, i32* %6, i64 %59
  %64 = load i32, i32* %63, align 4, !tbaa !7
  %65 = add nsw i32 %64, %11
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32* %2, i64 %66
  %68 = load i32, i32* %67, align 4, !tbaa !7
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float* %4, i64 %69
  %71 = load float, float* %70, align 4, !tbaa !11
  %72 = getelementptr inbounds float, float* %1, i64 %66
  %73 = load float, float* %72, align 4, !tbaa !11
  %74 = tail call float @llvm.fmuladd.f32(float %71, float %73, float %60)
  br label %75

75:                                               ; preds = %62, %57, %13
  %76 = phi float [ 0.000000e+00, %13 ], [ %58, %57 ], [ %74, %62 ]
  %77 = shl i64 %10, 32
  %78 = ashr exact i64 %77, 32
  %79 = getelementptr inbounds i32, i32* %3, i64 %78
  %80 = load i32, i32* %79, align 4, !tbaa !7
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float* %0, i64 %81
  store float %76, float* %82, align 4, !tbaa !11
  br label %83

83:                                               ; preds = %75, %9
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
!3 = !{i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 2, i32 2, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"float*", !"float*", !"int*", !"int*", !"float*", !"int", !"int*", !"int*", !"int"}
!6 = !{!"", !"", !"", !"", !"", !"", !"const", !"const", !""}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
