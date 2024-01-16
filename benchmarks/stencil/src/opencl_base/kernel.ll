; ModuleID = '../benchmarks/stencil/src/opencl_base/kernel.cl'
source_filename = "../benchmarks/stencil/src/opencl_base/kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @naive_kernel(float %0, float %1, float* nocapture readonly %2, float* nocapture %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %8 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %9 = trunc i64 %8 to i32
  %10 = add i32 %9, 1
  %11 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %12 = trunc i64 %11 to i32
  %13 = add i32 %12, 1
  %14 = tail call i64 @_Z13get_global_idj(i32 2) #3
  %15 = trunc i64 %14 to i32
  %16 = add nsw i32 %4, -1
  %17 = icmp slt i32 %10, %16
  br i1 %17, label %18, label %71

18:                                               ; preds = %7
  %19 = add i32 %15, 1
  %20 = add i32 %15, 2
  %21 = mul nsw i32 %20, %5
  %22 = add nsw i32 %21, %13
  %23 = mul nsw i32 %22, %4
  %24 = add nsw i32 %23, %10
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float* %2, i64 %25
  %27 = load float, float* %26, align 4, !tbaa !7
  %28 = mul nsw i32 %15, %5
  %29 = add nsw i32 %28, %13
  %30 = mul nsw i32 %29, %4
  %31 = add nsw i32 %30, %10
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float* %2, i64 %32
  %34 = load float, float* %33, align 4, !tbaa !7
  %35 = fadd float %27, %34
  %36 = mul nsw i32 %19, %5
  %37 = add i32 %36, %12
  %38 = add i32 %37, 2
  %39 = mul nsw i32 %38, %4
  %40 = add nsw i32 %39, %10
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float* %2, i64 %41
  %43 = load float, float* %42, align 4, !tbaa !7
  %44 = fadd float %35, %43
  %45 = mul nsw i32 %37, %4
  %46 = add nsw i32 %45, %10
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float* %2, i64 %47
  %49 = load float, float* %48, align 4, !tbaa !7
  %50 = fadd float %44, %49
  %51 = add nsw i32 %36, %13
  %52 = mul nsw i32 %51, %4
  %53 = add i32 %52, %9
  %54 = add i32 %53, 2
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float* %2, i64 %55
  %57 = load float, float* %56, align 4, !tbaa !7
  %58 = fadd float %50, %57
  %59 = sext i32 %53 to i64
  %60 = getelementptr inbounds float, float* %2, i64 %59
  %61 = load float, float* %60, align 4, !tbaa !7
  %62 = fadd float %58, %61
  %63 = add nsw i32 %52, %10
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float* %2, i64 %64
  %66 = load float, float* %65, align 4, !tbaa !7
  %67 = fneg float %66
  %68 = fmul float %67, %0
  %69 = tail call float @llvm.fmuladd.f32(float %1, float %62, float %68)
  %70 = getelementptr inbounds float, float* %3, i64 %64
  store float %69, float* %70, align 4, !tbaa !7
  br label %71

71:                                               ; preds = %18, %7
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
!3 = !{i32 0, i32 0, i32 1, i32 1, i32 0, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"float", !"float", !"float*", !"float*", !"int", !"int", !"int"}
!6 = !{!"", !"", !"", !"", !"", !"", !""}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
