; ModuleID = '../benchmarks/spmv/src/opencl_tex_nvidia/kernel.cl'
source_filename = "../benchmarks/spmv/src/opencl_tex_nvidia/kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%opencl.image2d_ro_t = type opaque
%opencl.sampler_t = type opaque

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @spmv_jds_texture(float* nocapture %0, float* nocapture readonly %1, i32* nocapture readonly %2, i32* nocapture readonly %3, %opencl.image2d_ro_t* %4, i32 %5, i32* nocapture readonly %6, i32* nocapture readonly %7) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %9 = tail call %opencl.sampler_t* @__translate_sampler_initializer(i32 16) #4
  %10 = tail call i32 @_Z15get_image_width14ocl_image2d_ro(%opencl.image2d_ro_t* %4) #5
  %11 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %12 = trunc i64 %11 to i32
  %13 = icmp slt i32 %12, %5
  br i1 %13, label %14, label %96

14:                                               ; preds = %8
  %15 = ashr i32 %12, 5
  %16 = shl i64 %11, 32
  %17 = ashr exact i64 %16, 32
  %18 = getelementptr inbounds i32, i32* %3, i64 %17
  %19 = load i32, i32* %18, align 4, !tbaa !7
  %20 = sext i32 %15 to i64
  %21 = getelementptr inbounds i32, i32* %7, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !7
  %23 = load i32, i32* %6, align 4, !tbaa !7
  %24 = add nsw i32 %23, %12
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float* %1, i64 %25
  %27 = load float, float* %26, align 4, !tbaa !11
  %28 = getelementptr inbounds i32, i32* %2, i64 %25
  %29 = load i32, i32* %28, align 4, !tbaa !7
  %30 = srem i32 %29, %10
  %31 = insertelement <2 x i32> undef, i32 %30, i64 0
  %32 = sdiv i32 %29, %10
  %33 = insertelement <2 x i32> %31, i32 %32, i64 1
  %34 = bitcast <2 x i32> %33 to double
  %35 = tail call <4 x float> @_Z11read_imagef14ocl_image2d_ro11ocl_samplerDv2_i(%opencl.image2d_ro_t* %4, %opencl.sampler_t* %9, double %34) #6
  %36 = icmp sgt i32 %22, 1
  br i1 %36, label %37, label %88

37:                                               ; preds = %14
  %38 = getelementptr inbounds i32, i32* %6, i64 1
  %39 = load i32, i32* %38, align 4, !tbaa !7
  %40 = add nsw i32 %39, %12
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32* %2, i64 %41
  %43 = load i32, i32* %42, align 4, !tbaa !7
  %44 = srem i32 %43, %10
  %45 = insertelement <2 x i32> undef, i32 %44, i64 0
  %46 = sdiv i32 %43, %10
  %47 = insertelement <2 x i32> %45, i32 %46, i64 1
  %48 = icmp eq i32 %22, 2
  %49 = getelementptr inbounds float, float* %1, i64 %41
  %50 = load float, float* %49, align 4, !tbaa !11
  br i1 %48, label %53, label %51

51:                                               ; preds = %37
  %52 = zext i32 %22 to i64
  br label %63

53:                                               ; preds = %63, %37
  %54 = phi <4 x float> [ %35, %37 ], [ %74, %63 ]
  %55 = phi <2 x i32> [ %47, %37 ], [ %83, %63 ]
  %56 = phi float [ %27, %37 ], [ %65, %63 ]
  %57 = phi float [ 0.000000e+00, %37 ], [ %76, %63 ]
  %58 = phi float [ %50, %37 ], [ %86, %63 ]
  %59 = bitcast <2 x i32> %55 to double
  %60 = tail call <4 x float> @_Z11read_imagef14ocl_image2d_ro11ocl_samplerDv2_i(%opencl.image2d_ro_t* %4, %opencl.sampler_t* %9, double %59) #6
  %61 = extractelement <4 x float> %54, i64 0
  %62 = tail call float @llvm.fmuladd.f32(float %56, float %61, float %57)
  br label %88

63:                                               ; preds = %63, %51
  %64 = phi i64 [ 2, %51 ], [ %84, %63 ]
  %65 = phi float [ %50, %51 ], [ %86, %63 ]
  %66 = phi float [ 0.000000e+00, %51 ], [ %76, %63 ]
  %67 = phi float [ %27, %51 ], [ %65, %63 ]
  %68 = phi <2 x i32> [ %47, %51 ], [ %83, %63 ]
  %69 = phi <4 x float> [ %35, %51 ], [ %74, %63 ]
  %70 = getelementptr inbounds i32, i32* %6, i64 %64
  %71 = load i32, i32* %70, align 4, !tbaa !7
  %72 = add nsw i32 %71, %12
  %73 = bitcast <2 x i32> %68 to double
  %74 = tail call <4 x float> @_Z11read_imagef14ocl_image2d_ro11ocl_samplerDv2_i(%opencl.image2d_ro_t* %4, %opencl.sampler_t* %9, double %73) #6
  %75 = extractelement <4 x float> %69, i64 0
  %76 = tail call float @llvm.fmuladd.f32(float %67, float %75, float %66)
  %77 = sext i32 %72 to i64
  %78 = getelementptr inbounds i32, i32* %2, i64 %77
  %79 = load i32, i32* %78, align 4, !tbaa !7
  %80 = srem i32 %79, %10
  %81 = insertelement <2 x i32> undef, i32 %80, i64 0
  %82 = sdiv i32 %79, %10
  %83 = insertelement <2 x i32> %81, i32 %82, i64 1
  %84 = add nuw nsw i64 %64, 1
  %85 = getelementptr inbounds float, float* %1, i64 %77
  %86 = load float, float* %85, align 4, !tbaa !11
  %87 = icmp eq i64 %84, %52
  br i1 %87, label %53, label %63

88:                                               ; preds = %53, %14
  %89 = phi <4 x float> [ %60, %53 ], [ %35, %14 ]
  %90 = phi float [ %58, %53 ], [ %27, %14 ]
  %91 = phi float [ %62, %53 ], [ 0.000000e+00, %14 ]
  %92 = extractelement <4 x float> %89, i64 0
  %93 = tail call float @llvm.fmuladd.f32(float %90, float %92, float %91)
  %94 = sext i32 %19 to i64
  %95 = getelementptr inbounds float, float* %0, i64 %94
  store float %93, float* %95, align 4, !tbaa !11
  br label %96

96:                                               ; preds = %88, %8
  ret void
}

declare dso_local %opencl.sampler_t* @__translate_sampler_initializer(i32) local_unnamed_addr

; Function Attrs: convergent nounwind readnone
declare dso_local i32 @_Z15get_image_width14ocl_image2d_ro(%opencl.image2d_ro_t*) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readonly
declare dso_local <4 x float> @_Z11read_imagef14ocl_image2d_ro11ocl_samplerDv2_i(%opencl.image2d_ro_t*, %opencl.sampler_t*, double) local_unnamed_addr #2

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #3

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }
attributes #5 = { convergent nounwind readnone }
attributes #6 = { convergent nounwind readonly }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 2, i32 2}
!4 = !{!"none", !"none", !"none", !"none", !"read_only", !"none", !"none", !"none"}
!5 = !{!"float*", !"float*", !"int*", !"int*", !"image2d_t", !"int", !"int*", !"int*"}
!6 = !{!"", !"", !"", !"", !"", !"", !"const", !"const"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
