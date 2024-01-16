; ModuleID = '../benchmarks/sgemm/src/opencl_base/kernel.cl'
source_filename = "../benchmarks/sgemm/src/opencl_base/kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @mysgemmNT(float* nocapture readonly %0, i32 %1, float* nocapture readonly %2, i32 %3, float* nocapture %4, i32 %5, i32 %6, float %7, float %8) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %10 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %11 = trunc i64 %10 to i32
  %12 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %13 = trunc i64 %12 to i32
  %14 = icmp sgt i32 %6, 0
  br i1 %14, label %15, label %42

15:                                               ; preds = %9
  %16 = sext i32 %3 to i64
  %17 = shl i64 %12, 32
  %18 = ashr exact i64 %17, 32
  %19 = sext i32 %1 to i64
  %20 = shl i64 %10, 32
  %21 = ashr exact i64 %20, 32
  %22 = zext i32 %6 to i64
  %23 = and i64 %22, 1
  %24 = icmp eq i32 %6, 1
  br i1 %24, label %27, label %25

25:                                               ; preds = %15
  %26 = sub nsw i64 %22, %23
  br label %51

27:                                               ; preds = %51, %15
  %28 = phi float [ undef, %15 ], [ %73, %51 ]
  %29 = phi i64 [ 0, %15 ], [ %74, %51 ]
  %30 = phi float [ 0.000000e+00, %15 ], [ %73, %51 ]
  %31 = icmp eq i64 %23, 0
  br i1 %31, label %42, label %32

32:                                               ; preds = %27
  %33 = mul nsw i64 %29, %19
  %34 = add nsw i64 %33, %21
  %35 = getelementptr inbounds float, float* %0, i64 %34
  %36 = load float, float* %35, align 4, !tbaa !7
  %37 = mul nsw i64 %29, %16
  %38 = add nsw i64 %37, %18
  %39 = getelementptr inbounds float, float* %2, i64 %38
  %40 = load float, float* %39, align 4, !tbaa !7
  %41 = tail call float @llvm.fmuladd.f32(float %36, float %40, float %30)
  br label %42

42:                                               ; preds = %32, %27, %9
  %43 = phi float [ 0.000000e+00, %9 ], [ %28, %27 ], [ %41, %32 ]
  %44 = mul nsw i32 %13, %5
  %45 = add nsw i32 %44, %11
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float* %4, i64 %46
  %48 = load float, float* %47, align 4, !tbaa !7
  %49 = fmul float %43, %7
  %50 = tail call float @llvm.fmuladd.f32(float %48, float %8, float %49)
  store float %50, float* %47, align 4, !tbaa !7
  ret void

51:                                               ; preds = %51, %25
  %52 = phi i64 [ 0, %25 ], [ %74, %51 ]
  %53 = phi float [ 0.000000e+00, %25 ], [ %73, %51 ]
  %54 = phi i64 [ %26, %25 ], [ %75, %51 ]
  %55 = mul nsw i64 %52, %19
  %56 = add nsw i64 %55, %21
  %57 = getelementptr inbounds float, float* %0, i64 %56
  %58 = load float, float* %57, align 4, !tbaa !7
  %59 = mul nsw i64 %52, %16
  %60 = add nsw i64 %59, %18
  %61 = getelementptr inbounds float, float* %2, i64 %60
  %62 = load float, float* %61, align 4, !tbaa !7
  %63 = tail call float @llvm.fmuladd.f32(float %58, float %62, float %53)
  %64 = or i64 %52, 1
  %65 = mul nsw i64 %64, %19
  %66 = add nsw i64 %65, %21
  %67 = getelementptr inbounds float, float* %0, i64 %66
  %68 = load float, float* %67, align 4, !tbaa !7
  %69 = mul nsw i64 %64, %16
  %70 = add nsw i64 %69, %18
  %71 = getelementptr inbounds float, float* %2, i64 %70
  %72 = load float, float* %71, align 4, !tbaa !7
  %73 = tail call float @llvm.fmuladd.f32(float %68, float %72, float %63)
  %74 = add nuw nsw i64 %52, 2
  %75 = add i64 %54, -2
  %76 = icmp eq i64 %75, 0
  br i1 %76, label %27, label %51
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
!3 = !{i32 1, i32 0, i32 1, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"float*", !"int", !"float*", !"int", !"float*", !"int", !"int", !"float", !"float"}
!6 = !{!"const", !"", !"const", !"", !"", !"", !"", !"", !""}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
