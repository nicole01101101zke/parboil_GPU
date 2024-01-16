; ModuleID = '../benchmarks/bfs/src/opencl_base/kernel.cl'
source_filename = "../benchmarks/bfs/src/opencl_base/kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Node = type { i32, i32 }
%struct.Edge = type { i32, i32 }

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @BFS_kernel(i32* nocapture readonly %0, i32* nocapture %1, %struct.Node* nocapture readonly %2, %struct.Edge* nocapture readonly %3, i32* %4, i32* %5, i32* %6, i32 %7, i32 %8, i32 %9, i32* %10, i32* nocapture %11, i32* nocapture %12) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %14 = tail call i64 @_Z12get_local_idj(i32 0) #3
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  store i32 0, i32* %10, align 4, !tbaa !7
  br label %17

17:                                               ; preds = %16, %13
  tail call void @_Z7barrierj(i32 1) #4
  %18 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %19 = trunc i64 %18 to i32
  %20 = icmp slt i32 %19, %7
  br i1 %20, label %21, label %64

21:                                               ; preds = %17
  %22 = shl i64 %18, 32
  %23 = ashr exact i64 %22, 32
  %24 = getelementptr inbounds i32, i32* %0, i64 %23
  %25 = load i32, i32* %24, align 4, !tbaa !7
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32* %4, i64 %26
  store i32 16677221, i32* %27, align 4, !tbaa !7
  %28 = getelementptr inbounds i32, i32* %5, i64 %26
  %29 = load i32, i32* %28, align 4, !tbaa !7
  %30 = getelementptr inbounds %struct.Node, %struct.Node* %2, i64 %26, i32 0
  %31 = load i32, i32* %30, align 4, !tbaa.struct !11
  %32 = getelementptr inbounds %struct.Node, %struct.Node* %2, i64 %26, i32 1
  %33 = load i32, i32* %32, align 4, !tbaa.struct !11
  %34 = icmp sgt i32 %33, 0
  br i1 %34, label %35, label %64

35:                                               ; preds = %21
  %36 = add nsw i32 %33, %31
  %37 = sext i32 %31 to i64
  %38 = sext i32 %36 to i64
  br label %39

39:                                               ; preds = %35, %61
  %40 = phi i64 [ %37, %35 ], [ %62, %61 ]
  %41 = getelementptr inbounds %struct.Edge, %struct.Edge* %3, i64 %40, i32 0
  %42 = load i32, i32* %41, align 4, !tbaa.struct !11
  %43 = getelementptr inbounds %struct.Edge, %struct.Edge* %3, i64 %40, i32 1
  %44 = load i32, i32* %43, align 4, !tbaa.struct !11
  %45 = add nsw i32 %44, %29
  %46 = sext i32 %42 to i64
  %47 = getelementptr inbounds i32, i32* %5, i64 %46
  %48 = tail call i32 @_Z8atom_minPU8CLglobalVii(i32* %47, i32 %45) #4
  %49 = icmp sgt i32 %48, %45
  br i1 %49, label %50, label %61

50:                                               ; preds = %39
  %51 = getelementptr inbounds i32, i32* %4, i64 %46
  %52 = load i32, i32* %51, align 4, !tbaa !7
  %53 = icmp sgt i32 %52, 16677216
  br i1 %53, label %54, label %61

54:                                               ; preds = %50
  %55 = tail call i32 @_Z9atom_xchgPU8CLglobalVii(i32* nonnull %51, i32 %8) #4
  %56 = icmp eq i32 %55, %8
  br i1 %56, label %61, label %57

57:                                               ; preds = %54
  %58 = tail call i32 @_Z8atom_addPU7CLlocalVii(i32* %10, i32 1) #4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32* %11, i64 %59
  store i32 %42, i32* %60, align 4, !tbaa !7
  br label %61

61:                                               ; preds = %57, %54, %50, %39
  %62 = add nsw i64 %40, 1
  %63 = icmp slt i64 %62, %38
  br i1 %63, label %39, label %64

64:                                               ; preds = %61, %21, %17
  tail call void @_Z7barrierj(i32 1) #4
  br i1 %15, label %65, label %68

65:                                               ; preds = %64
  %66 = load i32, i32* %10, align 4, !tbaa !7
  %67 = tail call i32 @_Z8atom_addPU8CLglobalVii(i32* %6, i32 %66) #4
  store i32 %67, i32* %12, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %65, %64
  tail call void @_Z7barrierj(i32 1) #4
  %69 = trunc i64 %14 to i32
  %70 = load i32, i32* %10, align 4, !tbaa !7
  %71 = icmp sgt i32 %70, %69
  br i1 %71, label %72, label %89

72:                                               ; preds = %68
  %73 = tail call i64 @_Z14get_local_sizej(i32 0) #3
  br label %74

74:                                               ; preds = %72, %74
  %75 = phi i32 [ %69, %72 ], [ %86, %74 ]
  %76 = phi i64 [ %14, %72 ], [ %85, %74 ]
  %77 = shl i64 %76, 32
  %78 = ashr exact i64 %77, 32
  %79 = getelementptr inbounds i32, i32* %11, i64 %78
  %80 = load i32, i32* %79, align 4, !tbaa !7
  %81 = load i32, i32* %12, align 4, !tbaa !7
  %82 = add nsw i32 %81, %75
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32* %1, i64 %83
  store i32 %80, i32* %84, align 4, !tbaa !7
  %85 = add i64 %73, %78
  %86 = trunc i64 %85 to i32
  %87 = load i32, i32* %10, align 4, !tbaa !7
  %88 = icmp sgt i32 %87, %86
  br i1 %88, label %74, label %89

89:                                               ; preds = %74, %68
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local i32 @_Z8atom_minPU8CLglobalVii(i32*, i32) local_unnamed_addr #2

; Function Attrs: convergent
declare dso_local i32 @_Z9atom_xchgPU8CLglobalVii(i32*, i32) local_unnamed_addr #2

; Function Attrs: convergent
declare dso_local i32 @_Z8atom_addPU7CLlocalVii(i32*, i32) local_unnamed_addr #2

; Function Attrs: convergent
declare dso_local i32 @_Z8atom_addPU8CLglobalVii(i32*, i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_local_sizej(i32) local_unnamed_addr #1

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent nounwind readnone }
attributes #4 = { convergent nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 3, i32 3, i32 3}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"int*", !"int*", !"struct Node*", !"struct Edge*", !"int*", !"int*", !"int*", !"int", !"int", !"int", !"int*", !"int*", !"int*"}
!6 = !{!"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !""}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{i64 0, i64 4, !7, i64 4, i64 4, !7}
