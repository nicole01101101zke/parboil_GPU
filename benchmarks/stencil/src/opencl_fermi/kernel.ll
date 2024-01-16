; ModuleID = '../benchmarks/stencil/src/opencl_fermi/kernel.cl'
source_filename = "../benchmarks/stencil/src/opencl_fermi/kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @block2D_reg_tiling(float %0, float %1, float* nocapture readonly %2, float* nocapture %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %8 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %9 = trunc i64 %8 to i32
  %10 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %11 = trunc i64 %10 to i32
  %12 = icmp sgt i32 %9, 0
  %13 = icmp sgt i32 %11, 0
  %14 = and i1 %12, %13
  %15 = add nsw i32 %4, -1
  %16 = icmp sgt i32 %15, %9
  %17 = and i1 %16, %14
  %18 = add nsw i32 %5, -1
  %19 = icmp sgt i32 %18, %11
  %20 = and i1 %19, %17
  %21 = icmp sgt i32 %6, 2
  %22 = and i1 %20, %21
  br i1 %22, label %23, label %92

23:                                               ; preds = %7
  %24 = mul nsw i32 %11, %4
  %25 = add nsw i32 %24, %9
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float* %2, i64 %26
  %28 = load float, float* %27, align 4, !tbaa !7
  %29 = add nsw i32 %11, %5
  %30 = mul nsw i32 %29, %4
  %31 = add nsw i32 %30, %9
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float* %2, i64 %32
  %34 = load float, float* %33, align 4, !tbaa !7
  %35 = sext i32 %5 to i64
  %36 = shl i64 %10, 32
  %37 = ashr exact i64 %36, 32
  %38 = sext i32 %4 to i64
  %39 = shl i64 %8, 32
  %40 = ashr exact i64 %39, 32
  %41 = add nsw i32 %6, -1
  %42 = zext i32 %41 to i64
  br label %43

43:                                               ; preds = %43, %23
  %44 = phi i64 [ 1, %23 ], [ %47, %43 ]
  %45 = phi float [ %28, %23 ], [ %46, %43 ]
  %46 = phi float [ %34, %23 ], [ %53, %43 ]
  %47 = add nuw nsw i64 %44, 1
  %48 = mul nsw i64 %47, %35
  %49 = add nsw i64 %48, %37
  %50 = mul nsw i64 %49, %38
  %51 = add nsw i64 %50, %40
  %52 = getelementptr inbounds float, float* %2, i64 %51
  %53 = load float, float* %52, align 4, !tbaa !7
  %54 = fadd float %45, %53
  %55 = mul nsw i64 %44, %35
  %56 = trunc i64 %55 to i32
  %57 = add i32 %56, %11
  %58 = add i32 %57, 1
  %59 = mul nsw i32 %58, %4
  %60 = add nsw i32 %59, %9
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float* %2, i64 %61
  %63 = load float, float* %62, align 4, !tbaa !7
  %64 = fadd float %54, %63
  %65 = add i32 %57, -1
  %66 = mul nsw i32 %65, %4
  %67 = add nsw i32 %66, %9
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float* %2, i64 %68
  %70 = load float, float* %69, align 4, !tbaa !7
  %71 = fadd float %64, %70
  %72 = add nsw i64 %55, %37
  %73 = mul nsw i64 %72, %38
  %74 = trunc i64 %73 to i32
  %75 = add i32 %74, %9
  %76 = add i32 %75, 1
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float* %2, i64 %77
  %79 = load float, float* %78, align 4, !tbaa !7
  %80 = fadd float %71, %79
  %81 = add i32 %75, -1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float* %2, i64 %82
  %84 = load float, float* %83, align 4, !tbaa !7
  %85 = fadd float %80, %84
  %86 = fneg float %46
  %87 = fmul float %86, %0
  %88 = tail call float @llvm.fmuladd.f32(float %1, float %85, float %87)
  %89 = add nsw i64 %73, %40
  %90 = getelementptr inbounds float, float* %3, i64 %89
  store float %88, float* %90, align 4, !tbaa !7
  %91 = icmp eq i64 %47, %42
  br i1 %91, label %92, label %43

92:                                               ; preds = %43, %7
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
