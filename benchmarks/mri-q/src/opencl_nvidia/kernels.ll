; ModuleID = '../benchmarks/mri-q/src/opencl_nvidia/kernels.cl'
source_filename = "../benchmarks/mri-q/src/opencl_nvidia/kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.kValues = type { float, float, float, float }

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @ComputePhiMag_GPU(float* nocapture readonly %0, float* nocapture readonly %1, float* nocapture %2, i32 %3) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %5 = tail call i64 @_Z13get_global_idj(i32 0) #3
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

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @ComputeQ_GPU(i32 %0, i32 %1, float* nocapture readonly %2, float* nocapture readonly %3, float* nocapture readonly %4, float* nocapture %5, float* nocapture %6, %struct.kValues* nocapture readonly %7) local_unnamed_addr #0 !kernel_arg_addr_space !11 !kernel_arg_access_qual !12 !kernel_arg_type !13 !kernel_arg_base_type !13 !kernel_arg_type_qual !14 {
  %9 = tail call i64 @_Z12get_group_idj(i32 0) #3
  %10 = shl i64 %9, 8
  %11 = tail call i64 @_Z12get_local_idj(i32 0) #3
  %12 = add i64 %10, %11
  %13 = shl i64 %12, 32
  %14 = ashr exact i64 %13, 32
  %15 = getelementptr inbounds float, float* %2, i64 %14
  %16 = load float, float* %15, align 4, !tbaa !7
  %17 = getelementptr inbounds float, float* %3, i64 %14
  %18 = load float, float* %17, align 4, !tbaa !7
  %19 = getelementptr inbounds float, float* %4, i64 %14
  %20 = load float, float* %19, align 4, !tbaa !7
  %21 = getelementptr inbounds float, float* %5, i64 %14
  %22 = load float, float* %21, align 4, !tbaa !7
  %23 = getelementptr inbounds float, float* %6, i64 %14
  %24 = load float, float* %23, align 4, !tbaa !7
  %25 = and i32 %0, 1
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %45, label %27

27:                                               ; preds = %8
  %28 = getelementptr inbounds %struct.kValues, %struct.kValues* %7, i64 0, i32 0
  %29 = load float, float* %28, align 4, !tbaa !15
  %30 = getelementptr inbounds %struct.kValues, %struct.kValues* %7, i64 0, i32 1
  %31 = load float, float* %30, align 4, !tbaa !17
  %32 = fmul float %18, %31
  %33 = tail call float @llvm.fmuladd.f32(float %29, float %16, float %32)
  %34 = getelementptr inbounds %struct.kValues, %struct.kValues* %7, i64 0, i32 2
  %35 = load float, float* %34, align 4, !tbaa !18
  %36 = tail call float @llvm.fmuladd.f32(float %35, float %20, float %33)
  %37 = fmul float %36, 0x401921FB60000000
  %38 = getelementptr inbounds %struct.kValues, %struct.kValues* %7, i64 0, i32 3
  %39 = load float, float* %38, align 4, !tbaa !19
  %40 = tail call float @_Z3cosf(float %37) #3
  %41 = tail call float @llvm.fmuladd.f32(float %39, float %40, float %22)
  %42 = tail call float @_Z3sinf(float %37) #3
  %43 = tail call float @llvm.fmuladd.f32(float %39, float %42, float %24)
  %44 = add nsw i32 %1, 1
  br label %45

45:                                               ; preds = %8, %27
  %46 = phi i64 [ 1, %27 ], [ 0, %8 ]
  %47 = phi float [ %43, %27 ], [ %24, %8 ]
  %48 = phi float [ %41, %27 ], [ %22, %8 ]
  %49 = phi i32 [ %44, %27 ], [ %1, %8 ]
  %50 = icmp slt i32 %49, %0
  br i1 %50, label %51, label %94

51:                                               ; preds = %45, %51
  %52 = phi i64 [ %89, %51 ], [ %46, %45 ]
  %53 = phi i32 [ %90, %51 ], [ %49, %45 ]
  %54 = phi float [ %86, %51 ], [ %48, %45 ]
  %55 = phi float [ %88, %51 ], [ %47, %45 ]
  %56 = getelementptr inbounds %struct.kValues, %struct.kValues* %7, i64 %52, i32 0
  %57 = load float, float* %56, align 4, !tbaa !15
  %58 = getelementptr inbounds %struct.kValues, %struct.kValues* %7, i64 %52, i32 1
  %59 = load float, float* %58, align 4, !tbaa !17
  %60 = fmul float %18, %59
  %61 = tail call float @llvm.fmuladd.f32(float %57, float %16, float %60)
  %62 = getelementptr inbounds %struct.kValues, %struct.kValues* %7, i64 %52, i32 2
  %63 = load float, float* %62, align 4, !tbaa !18
  %64 = tail call float @llvm.fmuladd.f32(float %63, float %20, float %61)
  %65 = fmul float %64, 0x401921FB60000000
  %66 = getelementptr inbounds %struct.kValues, %struct.kValues* %7, i64 %52, i32 3
  %67 = load float, float* %66, align 4, !tbaa !19
  %68 = tail call float @_Z3cosf(float %65) #3
  %69 = tail call float @llvm.fmuladd.f32(float %67, float %68, float %54)
  %70 = tail call float @_Z3sinf(float %65) #3
  %71 = tail call float @llvm.fmuladd.f32(float %67, float %70, float %55)
  %72 = add nuw nsw i64 %52, 1
  %73 = getelementptr inbounds %struct.kValues, %struct.kValues* %7, i64 %72, i32 0
  %74 = load float, float* %73, align 4, !tbaa !15
  %75 = getelementptr inbounds %struct.kValues, %struct.kValues* %7, i64 %72, i32 1
  %76 = load float, float* %75, align 4, !tbaa !17
  %77 = fmul float %18, %76
  %78 = tail call float @llvm.fmuladd.f32(float %74, float %16, float %77)
  %79 = getelementptr inbounds %struct.kValues, %struct.kValues* %7, i64 %72, i32 2
  %80 = load float, float* %79, align 4, !tbaa !18
  %81 = tail call float @llvm.fmuladd.f32(float %80, float %20, float %78)
  %82 = fmul float %81, 0x401921FB60000000
  %83 = getelementptr inbounds %struct.kValues, %struct.kValues* %7, i64 %72, i32 3
  %84 = load float, float* %83, align 4, !tbaa !19
  %85 = tail call float @_Z3cosf(float %82) #3
  %86 = tail call float @llvm.fmuladd.f32(float %84, float %85, float %69)
  %87 = tail call float @_Z3sinf(float %82) #3
  %88 = tail call float @llvm.fmuladd.f32(float %84, float %87, float %71)
  %89 = add nuw nsw i64 %52, 2
  %90 = add nsw i32 %53, 2
  %91 = icmp ult i64 %52, 1022
  %92 = icmp slt i32 %90, %0
  %93 = and i1 %91, %92
  br i1 %93, label %51, label %94

94:                                               ; preds = %51, %45
  %95 = phi float [ %47, %45 ], [ %88, %51 ]
  %96 = phi float [ %48, %45 ], [ %86, %51 ]
  store float %96, float* %21, align 4, !tbaa !7
  store float %95, float* %23, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3cosf(float) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3sinf(float) local_unnamed_addr #1

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
!3 = !{i32 1, i32 1, i32 1, i32 0}
!4 = !{!"none", !"none", !"none", !"none"}
!5 = !{!"float*", !"float*", !"float*", !"int"}
!6 = !{!"", !"", !"", !""}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 2}
!12 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!13 = !{!"int", !"int", !"float*", !"float*", !"float*", !"float*", !"float*", !"struct kValues*"}
!14 = !{!"", !"", !"", !"", !"", !"", !"", !"const"}
!15 = !{!16, !8, i64 0}
!16 = !{!"kValues", !8, i64 0, !8, i64 4, !8, i64 8, !8, i64 12}
!17 = !{!16, !8, i64 4}
!18 = !{!16, !8, i64 8}
!19 = !{!16, !8, i64 12}
