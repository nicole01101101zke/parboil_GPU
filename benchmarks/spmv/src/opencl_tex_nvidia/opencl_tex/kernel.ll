; ModuleID = '../benchmarks/spmv/src/opencl_tex_nvidia/opencl_tex/kernel.cl'
source_filename = "../benchmarks/spmv/src/opencl_tex_nvidia/opencl_tex/kernel.cl"
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
  br i1 %13, label %14, label %51

14:                                               ; preds = %8
  %15 = sdiv i32 %12, 32
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32* %7, i64 %16
  %18 = load i32, i32* %17, align 4, !tbaa !7
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %14
  %21 = zext i32 %18 to i64
  br label %30

22:                                               ; preds = %30, %14
  %23 = phi float [ 0.000000e+00, %14 ], [ %48, %30 ]
  %24 = shl i64 %11, 32
  %25 = ashr exact i64 %24, 32
  %26 = getelementptr inbounds i32, i32* %3, i64 %25
  %27 = load i32, i32* %26, align 4, !tbaa !7
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float* %0, i64 %28
  store float %23, float* %29, align 4, !tbaa !11
  br label %51

30:                                               ; preds = %30, %20
  %31 = phi i64 [ 0, %20 ], [ %49, %30 ]
  %32 = phi float [ 0.000000e+00, %20 ], [ %48, %30 ]
  %33 = getelementptr inbounds i32, i32* %6, i64 %31
  %34 = load i32, i32* %33, align 4, !tbaa !7
  %35 = add nsw i32 %34, %12
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float* %1, i64 %36
  %38 = load float, float* %37, align 4, !tbaa !11
  %39 = getelementptr inbounds i32, i32* %2, i64 %36
  %40 = load i32, i32* %39, align 4, !tbaa !7
  %41 = srem i32 %40, %10
  %42 = insertelement <2 x i32> undef, i32 %41, i64 0
  %43 = sdiv i32 %40, %10
  %44 = insertelement <2 x i32> %42, i32 %43, i64 1
  %45 = bitcast <2 x i32> %44 to double
  %46 = tail call <4 x float> @_Z11read_imagef14ocl_image2d_ro11ocl_samplerDv2_i(%opencl.image2d_ro_t* %4, %opencl.sampler_t* %9, double %45) #6
  %47 = extractelement <4 x float> %46, i64 0
  %48 = tail call float @llvm.fmuladd.f32(float %38, float %47, float %32)
  %49 = add nuw nsw i64 %31, 1
  %50 = icmp eq i64 %49, %21
  br i1 %50, label %22, label %30

51:                                               ; preds = %22, %8
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
