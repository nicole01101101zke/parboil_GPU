; ModuleID = 'kernel.ll'
source_filename = "kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-redhat-linux-gnu"

%struct.Node = type { i32, i32 }
%struct.Edge = type { i32, i32 }

; Function Attrs: convergent norecurse nounwind uwtable
define dso_local spir_kernel void @BFS_kernel(ptr nocapture noundef readonly align 4 %0, ptr nocapture noundef writeonly align 4 %1, ptr nocapture noundef readonly align 4 %2, ptr nocapture noundef readonly align 4 %3, ptr noundef align 4 %4, ptr noundef align 4 %5, ptr noundef align 4 %6, i32 noundef %7, i32 noundef %8, i32 noundef %9, ptr noundef align 4 %10, ptr nocapture noundef align 4 %11, ptr nocapture noundef align 4 %12) local_unnamed_addr #0 !kernel_arg_addr_space !5 !kernel_arg_access_qual !6 !kernel_arg_type !7 !kernel_arg_base_type !7 !kernel_arg_type_qual !8 {
  %14 = tail call i64 @_Z12get_local_idj(i32 noundef 0) #3
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  store i32 0, ptr %10, align 4, !tbaa !9
  br label %17

17:                                               ; preds = %16, %13
  tail call void @_Z7barrierj(i32 noundef 1) #4
  %18 = tail call i64 @_Z13get_global_idj(i32 noundef 0) #3
  %19 = trunc i64 %18 to i32
  %20 = icmp slt i32 %19, %7
  br i1 %20, label %21, label %64

21:                                               ; preds = %17
  %22 = shl i64 %18, 32
  %23 = ashr exact i64 %22, 32
  %24 = getelementptr inbounds i32, ptr %0, i64 %23
  %25 = load i32, ptr %24, align 4, !tbaa !9
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, ptr %4, i64 %26
  store i32 16677221, ptr %27, align 4, !tbaa !9
  %28 = getelementptr inbounds i32, ptr %5, i64 %26
  %29 = load i32, ptr %28, align 4, !tbaa !9
  %30 = getelementptr inbounds %struct.Node, ptr %2, i64 %26
  %31 = getelementptr inbounds i8, ptr %30, i64 4
  %32 = load i32, ptr %31, align 4, !tbaa.struct !13
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %34, label %64

34:                                               ; preds = %21
  %35 = load i32, ptr %30, align 4, !tbaa.struct !14
  %36 = add nsw i32 %32, %35
  %37 = sext i32 %35 to i64
  %38 = sext i32 %36 to i64
  br label %39

39:                                               ; preds = %61, %34
  %40 = phi i64 [ %37, %34 ], [ %62, %61 ]
  %41 = getelementptr inbounds %struct.Edge, ptr %3, i64 %40
  %42 = load i32, ptr %41, align 4, !tbaa.struct !14
  %43 = getelementptr inbounds i8, ptr %41, i64 4
  %44 = load i32, ptr %43, align 4, !tbaa.struct !13
  %45 = add nsw i32 %44, %29
  %46 = sext i32 %42 to i64
  %47 = getelementptr inbounds i32, ptr %5, i64 %46
  %48 = tail call i32 @_Z8atom_minPU8CLglobalVii(ptr noundef %47, i32 noundef %45) #4
  %49 = icmp sgt i32 %48, %45
  br i1 %49, label %50, label %61

50:                                               ; preds = %39
  %51 = getelementptr inbounds i32, ptr %4, i64 %46
  %52 = load i32, ptr %51, align 4, !tbaa !9
  %53 = icmp sgt i32 %52, 16677216
  br i1 %53, label %54, label %61

54:                                               ; preds = %50
  %55 = tail call i32 @_Z9atom_xchgPU8CLglobalVii(ptr noundef nonnull %51, i32 noundef %8) #4
  %56 = icmp eq i32 %55, %8
  br i1 %56, label %61, label %57

57:                                               ; preds = %54
  %58 = tail call i32 @_Z8atom_addPU7CLlocalVii(ptr noundef %10, i32 noundef 1) #4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %11, i64 %59
  store i32 %42, ptr %60, align 4, !tbaa !9
  br label %61

61:                                               ; preds = %57, %54, %50, %39
  %62 = add nsw i64 %40, 1
  %63 = icmp slt i64 %62, %38
  br i1 %63, label %39, label %64

64:                                               ; preds = %61, %21, %17
  tail call void @_Z7barrierj(i32 noundef 1) #4
  br i1 %15, label %65, label %68

65:                                               ; preds = %64
  %66 = load i32, ptr %10, align 4, !tbaa !9
  %67 = tail call i32 @_Z8atom_addPU8CLglobalVii(ptr noundef %6, i32 noundef %66) #4
  store i32 %67, ptr %12, align 4, !tbaa !9
  br label %68

68:                                               ; preds = %65, %64
  tail call void @_Z7barrierj(i32 noundef 1) #4
  %69 = trunc i64 %14 to i32
  %70 = load i32, ptr %10, align 4, !tbaa !9
  %71 = icmp sgt i32 %70, %69
  br i1 %71, label %72, label %88

72:                                               ; preds = %72, %68
  %73 = phi i32 [ %85, %72 ], [ %69, %68 ]
  %74 = phi i64 [ %84, %72 ], [ %14, %68 ]
  %75 = shl i64 %74, 32
  %76 = ashr exact i64 %75, 32
  %77 = getelementptr inbounds i32, ptr %11, i64 %76
  %78 = load i32, ptr %77, align 4, !tbaa !9
  %79 = load i32, ptr %12, align 4, !tbaa !9
  %80 = add nsw i32 %79, %73
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, ptr %1, i64 %81
  store i32 %78, ptr %82, align 4, !tbaa !9
  %83 = tail call i64 @_Z14get_local_sizej(i32 noundef 0) #3
  %84 = add i64 %83, %76
  %85 = trunc i64 %84 to i32
  %86 = load i32, ptr %10, align 4, !tbaa !9
  %87 = icmp sgt i32 %86, %85
  br i1 %87, label %72, label %88

88:                                               ; preds = %72, %68
  ret void
}

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare dso_local i64 @_Z12get_local_idj(i32 noundef) local_unnamed_addr #1

; Function Attrs: convergent nounwind
declare dso_local void @_Z7barrierj(i32 noundef) local_unnamed_addr #2

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare dso_local i64 @_Z13get_global_idj(i32 noundef) local_unnamed_addr #1

; Function Attrs: convergent nounwind
declare dso_local i32 @_Z8atom_minPU8CLglobalVii(ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: convergent nounwind
declare dso_local i32 @_Z9atom_xchgPU8CLglobalVii(ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: convergent nounwind
declare dso_local i32 @_Z8atom_addPU7CLlocalVii(ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: convergent nounwind
declare dso_local i32 @_Z8atom_addPU8CLglobalVii(ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare dso_local i64 @_Z14get_local_sizej(i32 noundef) local_unnamed_addr #1

attributes #0 = { convergent norecurse nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size"="false" }
attributes #1 = { convergent mustprogress nofree nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { convergent nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { convergent nounwind willreturn memory(none) }
attributes #4 = { convergent nounwind }

!llvm.module.flags = !{!0, !1, !2}
!opencl.ocl.version = !{!3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{i32 2, i32 0}
!4 = !{!"clang version 16.0.5 (Fedora 16.0.5-1.fc38)"}
!5 = !{i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 3, i32 3, i32 3}
!6 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!7 = !{!"int*", !"int*", !"struct Node*", !"struct Edge*", !"int*", !"int*", !"int*", !"int", !"int", !"int", !"int*", !"int*", !"int*"}
!8 = !{!"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !""}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
!13 = !{i64 0, i64 4, !9}
!14 = !{i64 0, i64 4, !9, i64 4, i64 4, !9}
