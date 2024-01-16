; ModuleID = '../benchmarks/spmv/src/opencl_ati_vec/kernel.cl'
source_filename = "../benchmarks/spmv/src/opencl_ati_vec/kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @spmv_jds_vec(float* nocapture %0, float* %1, i32* %2, i32* nocapture readonly %3, float* nocapture readonly %4, i32 %5, i32* nocapture readonly %6, i32* nocapture readonly %7, i32 %8) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %10 = tail call i64 @_Z13get_global_idj(i32 0) #4
  %11 = trunc i64 %10 to i32
  %12 = icmp slt i32 %11, %5
  br i1 %12, label %13, label %85

13:                                               ; preds = %9
  %14 = sdiv i32 %11, %8
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32* %7, i64 %15
  %17 = load i32, i32* %16, align 4, !tbaa !7
  %18 = icmp sgt i32 %17, 0
  %19 = shl i64 %10, 32
  %20 = ashr exact i64 %19, 32
  br i1 %18, label %21, label %72

21:                                               ; preds = %13
  %22 = zext i32 %17 to i64
  br label %23

23:                                               ; preds = %66, %21
  %24 = phi i64 [ 0, %21 ], [ %69, %66 ]
  %25 = phi <4 x float> [ zeroinitializer, %21 ], [ %70, %66 ]
  %26 = getelementptr inbounds i32, i32* %6, i64 %24
  %27 = load i32, i32* %26, align 4, !tbaa !7
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32* %2, i64 %28
  %30 = tail call <4 x i32> @_Z6vload4mPU9CLgenericKi(i64 %20, i32* %29) #5
  %31 = getelementptr inbounds float, float* %1, i64 %28
  %32 = tail call <4 x float> @_Z6vload4mPU9CLgenericKf(i64 %20, float* %31) #5
  %33 = extractelement <4 x i32> %30, i64 0
  %34 = icmp sgt i32 %33, -1
  br i1 %34, label %35, label %39

35:                                               ; preds = %23
  %36 = zext i32 %33 to i64
  %37 = getelementptr inbounds float, float* %4, i64 %36
  %38 = load float, float* %37, align 4, !tbaa !11
  br label %39

39:                                               ; preds = %23, %35
  %40 = phi float [ %38, %35 ], [ 0.000000e+00, %23 ]
  %41 = insertelement <4 x float> undef, float %40, i64 0
  %42 = extractelement <4 x i32> %30, i64 1
  %43 = icmp sgt i32 %42, -1
  br i1 %43, label %44, label %48

44:                                               ; preds = %39
  %45 = zext i32 %42 to i64
  %46 = getelementptr inbounds float, float* %4, i64 %45
  %47 = load float, float* %46, align 4, !tbaa !11
  br label %48

48:                                               ; preds = %39, %44
  %49 = phi float [ %47, %44 ], [ 0.000000e+00, %39 ]
  %50 = insertelement <4 x float> %41, float %49, i64 1
  %51 = extractelement <4 x i32> %30, i64 2
  %52 = icmp sgt i32 %51, -1
  br i1 %52, label %53, label %57

53:                                               ; preds = %48
  %54 = zext i32 %51 to i64
  %55 = getelementptr inbounds float, float* %4, i64 %54
  %56 = load float, float* %55, align 4, !tbaa !11
  br label %57

57:                                               ; preds = %48, %53
  %58 = phi float [ %56, %53 ], [ 0.000000e+00, %48 ]
  %59 = insertelement <4 x float> %50, float %58, i64 2
  %60 = extractelement <4 x i32> %30, i64 3
  %61 = icmp sgt i32 %60, -1
  br i1 %61, label %62, label %66

62:                                               ; preds = %57
  %63 = zext i32 %60 to i64
  %64 = getelementptr inbounds float, float* %4, i64 %63
  %65 = load float, float* %64, align 4, !tbaa !11
  br label %66

66:                                               ; preds = %57, %62
  %67 = phi float [ %65, %62 ], [ 0.000000e+00, %57 ]
  %68 = insertelement <4 x float> %59, float %67, i64 3
  %69 = add nuw nsw i64 %24, 1
  %70 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %68, <4 x float> %32, <4 x float> %25)
  %71 = icmp eq i64 %69, %22
  br i1 %71, label %72, label %23

72:                                               ; preds = %66, %13
  %73 = phi <4 x float> [ zeroinitializer, %13 ], [ %70, %66 ]
  %74 = extractelement <4 x float> %73, i64 0
  %75 = extractelement <4 x float> %73, i64 1
  %76 = fadd float %74, %75
  %77 = extractelement <4 x float> %73, i64 2
  %78 = fadd float %77, %76
  %79 = extractelement <4 x float> %73, i64 3
  %80 = fadd float %79, %78
  %81 = getelementptr inbounds i32, i32* %3, i64 %20
  %82 = load i32, i32* %81, align 4, !tbaa !7
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float* %0, i64 %83
  store float %80, float* %84, align 4, !tbaa !11
  br label %85

85:                                               ; preds = %72, %9
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local <4 x i32> @_Z6vload4mPU9CLgenericKi(i64, i32*) local_unnamed_addr #2

; Function Attrs: convergent
declare dso_local <4 x float> @_Z6vload4mPU9CLgenericKf(i64, float*) local_unnamed_addr #2

; Function Attrs: nounwind readnone speculatable willreturn
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #3

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
