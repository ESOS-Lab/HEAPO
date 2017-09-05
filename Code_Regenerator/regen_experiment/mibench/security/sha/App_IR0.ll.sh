target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%struct.sdmprofile__struct_STrw = type { i64, i64, i64, i32, i8*, i8*, i8* }
%"class.std::forward_list" = type { %"struct.std::_Fwd_list_base" }
%"struct.std::_Fwd_list_base" = type { %"struct.std::_Fwd_list_base<GVMeta *, std::allocator<GVMeta *> >::_Fwd_list_impl" }
%"struct.std::_Fwd_list_base<GVMeta *, std::allocator<GVMeta *> >::_Fwd_list_impl" = type { %"struct.std::_Fwd_list_node_base" }
%"struct.std::_Fwd_list_node_base" = type { %"struct.std::_Fwd_list_node_base"* }
%struct.GVMeta = type { i64, i64, i64, i8*, i32, i8*, i8*, i8*, i8*, i8*, i64 }
%struct.HPMeta = type { i32, i64, i64, i8*, i8*, i8*, i64, i8*, i64, i64, i64, i64 }
%"class.std::list" = type { %"class.std::_List_base" }
%"class.std::_List_base" = type { %"struct.std::_List_base<HeapAllocationMeta *, std::allocator<HeapAllocationMeta *> >::_List_impl" }
%"struct.std::_List_base<HeapAllocationMeta *, std::allocator<HeapAllocationMeta *> >::_List_impl" = type { %"struct.std::__detail::_List_node_base" }
%"struct.std::__detail::_List_node_base" = type { %"struct.std::__detail::_List_node_base"*, %"struct.std::__detail::_List_node_base"* }
%struct.Thread = type { i32, i64, double, double, %struct.sdmprofile__Allocated_Stack_item*, %struct.sdmprofile__Allocated_Stack_item*, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [8 x %struct.HeapAllocationMeta*], [8 x i64], %struct.Cache2_Item*, %struct.GVCache_Item* }
%struct.sdmprofile__Allocated_Stack_item = type { i8*, i64, i8* }
%struct.HeapAllocationMeta = type { i8*, i8*, i64, i32, i64 }
%struct.Cache2_Item = type { %struct.HeapAllocationMeta*, %struct.Cache2_Item* }
%struct.GVCache_Item = type { %struct.GVMeta*, %struct.GVCache_Item* }
%union.pthread_mutex_t = type { %"struct.(anonymous union)::__pthread_mutex_s" }
%"struct.(anonymous union)::__pthread_mutex_s" = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%struct._IO_FILE.1 = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker.0*, %struct._IO_FILE.1*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker.0 = type { %struct._IO_marker.0*, %struct._IO_FILE.1*, i32 }
%"class.std::allocator.0" = type { i8 }
%"class.std::allocator" = type { i8 }
%"struct.std::_Fwd_list_iterator" = type { %"struct.std::_Fwd_list_node_base"* }
%"struct.std::_Fwd_list_node" = type { %"struct.std::_Fwd_list_node_base", %"union.std::aligned_storage<8, 8>::type" }
%"union.std::aligned_storage<8, 8>::type" = type { [8 x i8] }
%struct.timespec = type { i64, i64 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%"struct.std::_List_iterator" = type { %"struct.std::__detail::_List_node_base"* }
%"class.std::basic_string" = type { %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" }
%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" = type { i8* }
%"class.std::allocator.6" = type { i8 }
%"class.__gnu_cxx::__normal_iterator" = type { i8* }
%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep" = type { %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep_base" }
%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep_base" = type { i64, i64, i32 }
%"struct.std::_List_node" = type { %"struct.std::__detail::_List_node_base", %struct.HeapAllocationMeta* }
%"class.std::allocator.3" = type { i8 }
%"class.__gnu_cxx::new_allocator.4" = type { i8 }
%"struct.std::_Fwd_list_const_iterator" = type { %"struct.std::_Fwd_list_node_base"* }
%"class.__gnu_cxx::new_allocator.1" = type { i8 }
%"class.__gnu_cxx::new_allocator" = type { i8 }
%struct.SHA_INFO.2 = type { [5 x i64], i64, i64, [16 x i64] }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@STMetaArray = global [10000 x %struct.sdmprofile__struct_STrw] zeroinitializer, align 16
@GVMetalist = global %"class.std::forward_list" zeroinitializer, align 8
@Empty_GV_Item = global %struct.GVMeta zeroinitializer, align 8
@GV_AddrRangeHead = global i8* null, align 8
@GV_AddrRangeTail = global i8* null, align 8
@HPMetaItem = global %struct.HPMeta* null, align 8
@HPMetaArray = global [1000 x %struct.HPMeta] zeroinitializer, align 16
@HeapAllocationList = global %"class.std::list" zeroinitializer, align 8
@thds = global [100 x %struct.Thread] zeroinitializer, align 16
@thdsCount = global i32 0, align 4
@Empty_Item = global %struct.HeapAllocationMeta* null, align 8
@sdmprofile__AppStartTime = global double 0.000000e+00, align 8
@sdmprofile__AppEndTime = global double 0.000000e+00, align 8
@sdmprofile__HP_addressRangeFrom = global i8* null, align 8
@sdmprofile__HP_addressRangeTo = global i8* null, align 8
@sdmprofile__zeropointer = global i8* null, align 8
@BBhits = global [5000 x i64] zeroinitializer, align 16
@sdmprofile__profile_loopptr = global %struct.HeapAllocationMeta* null, align 8
@sdmprofile__profile_loopptrstack = global %struct.sdmprofile__Allocated_Stack_item* null, align 8
@cache_addr = global i8* null, align 8
@cache_upperbound = global i8* null, align 8
@sdmprofile__MainthreadNumber = global i32 0, align 4
@sdmprofile__BBcounter_1 = global i64 0, align 8
@sdmprofile__BBcounter_2 = global i64 0, align 8
@sdmprofile__BBcounter_3 = global i64 0, align 8
@sdmprofile__BBcounter_4 = global i64 0, align 8
@sdmprofile__BBcounter_5 = global i64 0, align 8
@sdmprofile__BBcounter_6 = global i64 0, align 8
@sdmprofile__BBcounter_7 = global i64 0, align 8
@sdmprofile__BBcounter_8 = global i64 0, align 8
@sdmprofile__BBcounter_9 = global i64 0, align 8
@sdmprofile__BBcounter_10 = global i64 0, align 8
@sdmprofile__BBcounter_11 = global i64 0, align 8
@sdmprofile__BBcounter_12 = global i64 0, align 8
@sdmprofile__BBcounter_13 = global i64 0, align 8
@sdmprofile__BBcounter_14 = global i64 0, align 8
@sdmprofile__BBcounter_15 = global i64 0, align 8
@sdmprofile__BBcounter_16 = global i64 0, align 8
@sdmprofile__BBcounter_17 = global i64 0, align 8
@sdmprofile__BBcounter_18 = global i64 0, align 8
@sdmprofile__BBcounter_19 = global i64 0, align 8
@sdmprofile__BBcounter_20 = global i64 0, align 8
@sdmprofile__BBcounter_21 = global i64 0, align 8
@sdmprofile__BBcounter_22 = global i64 0, align 8
@sdmprofile__BBcounter_23 = global i64 0, align 8
@sdmprofile__BBcounter_24 = global i64 0, align 8
@sdmprofile__BBcounter_25 = global i64 0, align 8
@sdmprofile__BBcounter_26 = global i64 0, align 8
@sdmprofile__BBcounter_27 = global i64 0, align 8
@sdmprofile__BBcounter_28 = global i64 0, align 8
@sdmprofile__BBcounter_29 = global i64 0, align 8
@sdmprofile__BBcounter_30 = global i64 0, align 8
@sdmprofile__BBcounter_31 = global i64 0, align 8
@sdmprofile__BBcounter_32 = global i64 0, align 8
@sdmprofile__BBcounter_33 = global i64 0, align 8
@sdmprofile__BBcounter_34 = global i64 0, align 8
@sdmprofile__BBcounter_35 = global i64 0, align 8
@sdmprofile__BBcounter_36 = global i64 0, align 8
@sdmprofile__BBcounter_37 = global i64 0, align 8
@sdmprofile__BBcounter_38 = global i64 0, align 8
@sdmprofile__BBcounter_39 = global i64 0, align 8
@sdmprofile__BBcounter_40 = global i64 0, align 8
@sdmprofile__BBcounter_41 = global i64 0, align 8
@sdmprofile__BBcounter_42 = global i64 0, align 8
@sdmprofile__BBcounter_43 = global i64 0, align 8
@sdmprofile__BBcounter_44 = global i64 0, align 8
@sdmprofile__BBcounter_45 = global i64 0, align 8
@sdmprofile__BBcounter_46 = global i64 0, align 8
@sdmprofile__BBcounter_47 = global i64 0, align 8
@sdmprofile__BBcounter_48 = global i64 0, align 8
@sdmprofile__BBcounter_49 = global i64 0, align 8
@sdmprofile__BBcounter_50 = global i64 0, align 8
@sdmprofile__BBcounter_51 = global i64 0, align 8
@sdmprofile__BBcounter_52 = global i64 0, align 8
@sdmprofile__BBcounter_53 = global i64 0, align 8
@sdmprofile__BBcounter_54 = global i64 0, align 8
@sdmprofile__BBcounter_55 = global i64 0, align 8
@sdmprofile__BBcounter_56 = global i64 0, align 8
@sdmprofile__BBcounterSample__ = global i64 0, align 8
@sdmprofile__profileAction = global i32 0, align 4
@sdmprofile__IncludeStackProfiling = global i32 0, align 4
@sdmprofile__heapallocationCount = global i64 0, align 8
@sdmprofile__stackallocationCount = global i64 0, align 8
@sdmprofile__BBcount = global i64 0, align 8
@sdmprofile__MainthreadStack_allo = global %struct.sdmprofile__Allocated_Stack_item* null, align 8
@_ZL10threadlock = internal global %union.pthread_mutex_t zeroinitializer, align 8
@.str = private unnamed_addr constant [18 x i8] c"debug_files_1.csv\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@.str4 = private unnamed_addr constant [100 x i8] c"Global Variable Memory Region Profile Result\0A\0AIndex,Read Count,Write Count,Memory Size,Name, Type  \00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"\0A%lu,%lu,%lu,%u,%s,%s \00", align 1
@.str6 = private unnamed_addr constant [4 x i8] c"\0A\0A\0A\00", align 1
@.str7 = private unnamed_addr constant [124 x i8] c"Stack Variable Memory Region Profile Result\0A\0AIndex,Read Count,Write Count,Memory Size,Estimated Name, Type, Function Name  \00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"\0A%lu,%lu,%lu,%u,%s,%s,%s \00", align 1
@.str9 = private unnamed_addr constant [171 x i8] c"Heap Variable Memory Region Profile Result\0A\0AIndex,Read Count,Write Count,Average Memory Size,Pointer Scope,Pointer Name,Pointer Type,Function Name,Line Number,Source File\00", align 1
@.str10 = private unnamed_addr constant [43 x i8] c"\0A%u,%lu,%lu,%u,%s,%s,%s,%lu,%s,%lu,%zu,%zu\00", align 1
@.str11 = private unnamed_addr constant [18 x i8] c"debug_files_2.csv\00", align 1
@.str12 = private unnamed_addr constant [28 x i8] c"BasicBlock Index,Hit Count\0A\00", align 1
@.str13 = private unnamed_addr constant [9 x i8] c"%lu,%lu\0A\00", align 1
@_ZZ34sdmprofile__EndProfiling_ProcessesE6errmsg = private unnamed_addr constant [64 x i8] c"file open failed\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str14 = private unnamed_addr constant [21 x i8] c"heapo_gen_result.csv\00", align 1
@.str15 = private unnamed_addr constant [3 x i8] c"a+\00", align 1
@stderr = external global %struct._IO_FILE.1*
@.str17 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str18 = private unnamed_addr constant [14 x i8] c"%s:%lu:%s/%s\0A\00", align 1
@.str20 = private unnamed_addr constant [46 x i8] c"[Global Variable Summary] ALL: %d, NVRAM: %d\0A\00", align 1
@.str21 = private unnamed_addr constant [125 x i8] c"\0AStack Variable Memory Region Profile Result\0A\0AIndex,Read Count,Write Count,Memory Size,Estimated Name, Type, Function Name  \00", align 1
@.str22 = private unnamed_addr constant [14 x i8] c"%s:%lu:%s:%s\0A\00", align 1
@.str23 = private unnamed_addr constant [65 x i8] c"[Heap Variable Summary] : %d heap variables among %d fit nvram \0A\00", align 1
@_ZNSs4_Rep20_S_empty_rep_storageE = external global [0 x i64]
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_pFunctions.cpp, i8* null }]
@.str1 = private unnamed_addr constant [31 x i8] c"%08lx %08lx %08lx %08lx %08lx\0A\00", align 1
@stdin = external global %struct._IO_FILE.1*
@.str16 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str127 = private unnamed_addr constant [30 x i8] c"error opening %s for reading\0A\00", align 1

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) #0

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) #1

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt12forward_listIP6GVMetaSaIS1_EEC2ERKS2_(%"class.std::forward_list"* nocapture %this, %"class.std::allocator.0"* nocapture readnone dereferenceable(1) %__al) unnamed_addr #3 align 2 {
entry:
  %ref.tmp = alloca %"class.std::allocator", align 1
  %0 = getelementptr inbounds %"class.std::forward_list"* %this, i64 0, i32 0
  call void @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EEC2ERKSaISt14_Fwd_list_nodeIS1_EE(%"struct.std::_Fwd_list_base"* %0, %"class.std::allocator"* dereferenceable(1) %ref.tmp)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EED2Ev(%"struct.std::_Fwd_list_base"* %this) unnamed_addr #3 align 2 {
entry:
  %_M_head = getelementptr inbounds %"struct.std::_Fwd_list_base"* %this, i64 0, i32 0, i32 0
  %call = tail call %"struct.std::_Fwd_list_node_base"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_M_erase_afterEPSt19_Fwd_list_node_baseS5_(%"struct.std::_Fwd_list_base"* %this, %"struct.std::_Fwd_list_node_base"* %_M_head, %"struct.std::_Fwd_list_node_base"* null)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt4listIP18HeapAllocationMetaSaIS1_EEC2Ev(%"class.std::list"* %this) unnamed_addr #3 align 2 {
entry:
  %0 = getelementptr inbounds %"class.std::list"* %this, i64 0, i32 0
  tail call void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EEC2Ev(%"class.std::_List_base"* %0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EED2Ev(%"class.std::_List_base"* readonly %this) unnamed_addr #3 align 2 {
entry:
  tail call void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE8_M_clearEv(%"class.std::_List_base"* %this)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__StartProfiling_Processes() #3 {
entry:
  %call = tail call noalias i8* @malloc(i64 40) #2
  %0 = bitcast i8* %call to %struct.HeapAllocationMeta*
  store %struct.HeapAllocationMeta* %0, %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !114
  %call1 = tail call i32 @_Z17RegisterNewThreadv()
  store i32 %call1, i32* @sdmprofile__MainthreadNumber, align 4, !tbaa !118
  %1 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !114
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %1, i64 0, i32 1
  %2 = bitcast i8** %upperbound to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 20, i32 8, i1 false)
  %3 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !114
  %ptr = getelementptr inbounds %struct.HeapAllocationMeta* %3, i64 0, i32 0
  store i8* null, i8** %ptr, align 8, !tbaa !120
  store i64 0, i64* getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 0), align 8, !tbaa !123
  store i8* null, i8** getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 3), align 8, !tbaa !125
  store i32 0, i32* getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 4), align 8, !tbaa !126
  call void @llvm.memset.p0i8.i64(i8* bitcast (i8** getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 5) to i8*), i8 0, i64 24, i32 8, i1 false)
  %4 = load i32* @sdmprofile__IncludeStackProfiling, align 4, !tbaa !118
  %tobool = icmp eq i32 %4, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call2 = tail call noalias i8* @malloc(i64 240000) #2
  %5 = bitcast i8* %call2 to %struct.sdmprofile__Allocated_Stack_item*
  store %struct.sdmprofile__Allocated_Stack_item* %5, %struct.sdmprofile__Allocated_Stack_item** @sdmprofile__MainthreadStack_allo, align 8, !tbaa !114
  %ptr.ind.end = getelementptr i8* %call2, i64 240000
  %6 = bitcast i8* %ptr.ind.end to %struct.sdmprofile__Allocated_Stack_item*
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %if.then
  %index = phi i64 [ 0, %if.then ], [ %index.next.1, %vector.body ]
  %gep.idx1315 = or i64 %index, 1
  %7 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index, i32 0
  %8 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315, i32 0
  store i8* null, i8** %7, align 8, !tbaa !127
  store i8* null, i8** %8, align 8, !tbaa !127
  %9 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index, i32 2
  %10 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315, i32 2
  store i8* null, i8** %9, align 8, !tbaa !129
  store i8* null, i8** %10, align 8, !tbaa !129
  %index.next = add i64 %index, 2
  %gep.idx1315.1 = or i64 %index.next, 1
  %11 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index.next, i32 0
  %12 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315.1, i32 0
  store i8* null, i8** %11, align 8, !tbaa !127
  store i8* null, i8** %12, align 8, !tbaa !127
  %13 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index.next, i32 2
  %14 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315.1, i32 2
  store i8* null, i8** %13, align 8, !tbaa !129
  store i8* null, i8** %14, align 8, !tbaa !129
  %index.next.1 = add i64 %index.next, 2
  %15 = icmp eq i64 %index.next.1, 10000
  br i1 %15, label %if.end.loopexit, label %vector.body, !llvm.loop !130

if.end.loopexit:                                  ; preds = %vector.body
  br label %if.end

if.end:                                           ; preds = %if.end.loopexit, %entry
  store double 0.000000e+00, double* @sdmprofile__AppEndTime, align 8, !tbaa !133
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind uwtable
define i32 @_Z17RegisterNewThreadv() #3 {
entry:
  %call = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %0 = load i32* @thdsCount, align 4, !tbaa !118
  %idxprom = sext i32 %0 to i64
  %threadnumber = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 0
  store i32 %0, i32* %threadnumber, align 8, !tbaa !135
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @thdsCount, align 4, !tbaa !118
  %call1 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %call2 = tail call i64 @pthread_self() #12
  %threadID = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 1
  store i64 %call2, i64* %threadID, align 8, !tbaa !137
  %call3 = tail call double @sdmprofile__getRealTime()
  %ThreadStartTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 2
  store double %call3, double* %ThreadStartTime, align 8, !tbaa !138
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double 0.000000e+00, double* %ThreadEndTime, align 8, !tbaa !139
  %Malloc_Calls = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 6
  %1 = bitcast i64* %Malloc_Calls to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 88, i32 8, i1 false)
  %2 = load i32* @sdmprofile__profileAction, align 4, !tbaa !118
  switch i32 %2, label %if.end [
    i32 4, label %if.then
    i32 1, label %if.then
  ]

if.then:                                          ; preds = %entry, %entry
  %call5 = tail call noalias i8* @malloc(i64 128) #2
  %3 = bitcast i8* %call5 to %struct.Cache2_Item*
  %Cache2_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 19
  store %struct.Cache2_Item* %3, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !140
  %4 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !114
  %ptr = bitcast i8* %call5 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !141
  %add.ptr8 = getelementptr inbounds i8* %call5, i64 16
  %5 = bitcast i8* %add.ptr8 to %struct.Cache2_Item*
  %next = getelementptr inbounds i8* %call5, i64 8
  %6 = bitcast i8* %next to %struct.Cache2_Item**
  store %struct.Cache2_Item* %5, %struct.Cache2_Item** %6, align 8, !tbaa !143
  %ptr.1 = getelementptr inbounds i8* %call5, i64 16
  %7 = bitcast i8* %ptr.1 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %7, align 8, !tbaa !141
  %add.ptr8.1 = getelementptr inbounds i8* %call5, i64 32
  %8 = bitcast i8* %add.ptr8.1 to %struct.Cache2_Item*
  %next.1 = getelementptr inbounds i8* %call5, i64 24
  %9 = bitcast i8* %next.1 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %8, %struct.Cache2_Item** %9, align 8, !tbaa !143
  %ptr.2 = getelementptr inbounds i8* %call5, i64 32
  %10 = bitcast i8* %ptr.2 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %10, align 8, !tbaa !141
  %add.ptr8.2 = getelementptr inbounds i8* %call5, i64 48
  %11 = bitcast i8* %add.ptr8.2 to %struct.Cache2_Item*
  %next.2 = getelementptr inbounds i8* %call5, i64 40
  %12 = bitcast i8* %next.2 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %11, %struct.Cache2_Item** %12, align 8, !tbaa !143
  %ptr.3 = getelementptr inbounds i8* %call5, i64 48
  %13 = bitcast i8* %ptr.3 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %13, align 8, !tbaa !141
  %add.ptr8.3 = getelementptr inbounds i8* %call5, i64 64
  %14 = bitcast i8* %add.ptr8.3 to %struct.Cache2_Item*
  %next.3 = getelementptr inbounds i8* %call5, i64 56
  %15 = bitcast i8* %next.3 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %14, %struct.Cache2_Item** %15, align 8, !tbaa !143
  %ptr.4 = getelementptr inbounds i8* %call5, i64 64
  %16 = bitcast i8* %ptr.4 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %16, align 8, !tbaa !141
  %add.ptr8.4 = getelementptr inbounds i8* %call5, i64 80
  %17 = bitcast i8* %add.ptr8.4 to %struct.Cache2_Item*
  %next.4 = getelementptr inbounds i8* %call5, i64 72
  %18 = bitcast i8* %next.4 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %17, %struct.Cache2_Item** %18, align 8, !tbaa !143
  %ptr.5 = getelementptr inbounds i8* %call5, i64 80
  %19 = bitcast i8* %ptr.5 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %19, align 8, !tbaa !141
  %add.ptr8.5 = getelementptr inbounds i8* %call5, i64 96
  %20 = bitcast i8* %add.ptr8.5 to %struct.Cache2_Item*
  %next.5 = getelementptr inbounds i8* %call5, i64 88
  %21 = bitcast i8* %next.5 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %20, %struct.Cache2_Item** %21, align 8, !tbaa !143
  %ptr.6 = getelementptr inbounds i8* %call5, i64 96
  %22 = bitcast i8* %ptr.6 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %22, align 8, !tbaa !141
  %add.ptr8.6 = getelementptr inbounds i8* %call5, i64 112
  %23 = bitcast i8* %add.ptr8.6 to %struct.Cache2_Item*
  %next.6 = getelementptr inbounds i8* %call5, i64 104
  %24 = bitcast i8* %next.6 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %23, %struct.Cache2_Item** %24, align 8, !tbaa !143
  %add.ptr10 = getelementptr inbounds i8* %call5, i64 112
  %ptr11 = bitcast i8* %add.ptr10 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %ptr11, align 8, !tbaa !141
  %next13 = getelementptr inbounds i8* %call5, i64 120
  %25 = bitcast i8* %next13 to %struct.Cache2_Item**
  store %struct.Cache2_Item* null, %struct.Cache2_Item** %25, align 8, !tbaa !143
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %.off = add i32 %2, -3
  %26 = icmp ult i32 %.off, 2
  br i1 %26, label %if.then17, label %if.end39

if.then17:                                        ; preds = %if.end
  %call19 = tail call noalias i8* @malloc(i64 128) #2
  %27 = bitcast i8* %call19 to %struct.GVCache_Item*
  %GVCache_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 20
  store %struct.GVCache_Item* %27, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !144
  %ptr27 = bitcast i8* %call19 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %ptr27, align 8, !tbaa !145
  %add.ptr30 = getelementptr inbounds i8* %call19, i64 16
  %28 = bitcast i8* %add.ptr30 to %struct.GVCache_Item*
  %next31 = getelementptr inbounds i8* %call19, i64 8
  %29 = bitcast i8* %next31 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %28, %struct.GVCache_Item** %29, align 8, !tbaa !147
  %ptr27.1 = getelementptr inbounds i8* %call19, i64 16
  %30 = bitcast i8* %ptr27.1 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %30, align 8, !tbaa !145
  %add.ptr30.1 = getelementptr inbounds i8* %call19, i64 32
  %31 = bitcast i8* %add.ptr30.1 to %struct.GVCache_Item*
  %next31.1 = getelementptr inbounds i8* %call19, i64 24
  %32 = bitcast i8* %next31.1 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %31, %struct.GVCache_Item** %32, align 8, !tbaa !147
  %ptr27.2 = getelementptr inbounds i8* %call19, i64 32
  %33 = bitcast i8* %ptr27.2 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %33, align 8, !tbaa !145
  %add.ptr30.2 = getelementptr inbounds i8* %call19, i64 48
  %34 = bitcast i8* %add.ptr30.2 to %struct.GVCache_Item*
  %next31.2 = getelementptr inbounds i8* %call19, i64 40
  %35 = bitcast i8* %next31.2 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %34, %struct.GVCache_Item** %35, align 8, !tbaa !147
  %ptr27.3 = getelementptr inbounds i8* %call19, i64 48
  %36 = bitcast i8* %ptr27.3 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %36, align 8, !tbaa !145
  %add.ptr30.3 = getelementptr inbounds i8* %call19, i64 64
  %37 = bitcast i8* %add.ptr30.3 to %struct.GVCache_Item*
  %next31.3 = getelementptr inbounds i8* %call19, i64 56
  %38 = bitcast i8* %next31.3 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %37, %struct.GVCache_Item** %38, align 8, !tbaa !147
  %ptr27.4 = getelementptr inbounds i8* %call19, i64 64
  %39 = bitcast i8* %ptr27.4 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %39, align 8, !tbaa !145
  %add.ptr30.4 = getelementptr inbounds i8* %call19, i64 80
  %40 = bitcast i8* %add.ptr30.4 to %struct.GVCache_Item*
  %next31.4 = getelementptr inbounds i8* %call19, i64 72
  %41 = bitcast i8* %next31.4 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %40, %struct.GVCache_Item** %41, align 8, !tbaa !147
  %ptr27.5 = getelementptr inbounds i8* %call19, i64 80
  %42 = bitcast i8* %ptr27.5 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %42, align 8, !tbaa !145
  %add.ptr30.5 = getelementptr inbounds i8* %call19, i64 96
  %43 = bitcast i8* %add.ptr30.5 to %struct.GVCache_Item*
  %next31.5 = getelementptr inbounds i8* %call19, i64 88
  %44 = bitcast i8* %next31.5 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %43, %struct.GVCache_Item** %44, align 8, !tbaa !147
  %ptr27.6 = getelementptr inbounds i8* %call19, i64 96
  %45 = bitcast i8* %ptr27.6 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %45, align 8, !tbaa !145
  %add.ptr30.6 = getelementptr inbounds i8* %call19, i64 112
  %46 = bitcast i8* %add.ptr30.6 to %struct.GVCache_Item*
  %next31.6 = getelementptr inbounds i8* %call19, i64 104
  %47 = bitcast i8* %next31.6 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %46, %struct.GVCache_Item** %47, align 8, !tbaa !147
  %add.ptr35 = getelementptr inbounds i8* %call19, i64 112
  %ptr36 = bitcast i8* %add.ptr35 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %ptr36, align 8, !tbaa !145
  %next38 = getelementptr inbounds i8* %call19, i64 120
  %48 = bitcast i8* %next38 to %struct.GVCache_Item**
  store %struct.GVCache_Item* null, %struct.GVCache_Item** %48, align 8, !tbaa !147
  br label %if.end39

if.end39:                                         ; preds = %if.then17, %if.end
  %49 = load i32* @sdmprofile__IncludeStackProfiling, align 4, !tbaa !118
  %tobool = icmp eq i32 %49, 0
  br i1 %tobool, label %if.end42, label %if.then40

if.then40:                                        ; preds = %if.end39
  %call41 = tail call noalias i8* @malloc(i64 240000) #2
  %50 = bitcast i8* %call41 to %struct.sdmprofile__Allocated_Stack_item*
  %Stack_allocations_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 4
  store %struct.sdmprofile__Allocated_Stack_item* %50, %struct.sdmprofile__Allocated_Stack_item** %Stack_allocations_head, align 8, !tbaa !148
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %if.end39
  %51 = load i32* %threadnumber, align 8, !tbaa !135
  ret i32 %51
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__Embed_metadata_GV(i64 %index__, i8* %AtAddress, i32 %size_, i8* %Name_string_ptr, i8* %DataType_string_ptr, i8* %FilenameStringptr_, i8* %FileDirStringptr_, i64 %linenumber__) #3 {
entry:
  %I = alloca %struct.GVMeta*, align 8
  %call = tail call noalias i8* @malloc(i64 88) #2
  %0 = bitcast i8* %call to %struct.GVMeta*
  store %struct.GVMeta* %0, %struct.GVMeta** %I, align 8, !tbaa !114
  %index = bitcast i8* %call to i64*
  store i64 %index__, i64* %index, align 8, !tbaa !123
  %address = getelementptr inbounds i8* %call, i64 24
  %1 = bitcast i8* %address to i8**
  store i8* %AtAddress, i8** %1, align 8, !tbaa !125
  %size = getelementptr inbounds i8* %call, i64 32
  %2 = bitcast i8* %size to i32*
  store i32 %size_, i32* %2, align 4, !tbaa !126
  %VarName = getelementptr inbounds i8* %call, i64 40
  %3 = bitcast i8* %VarName to i8**
  store i8* %Name_string_ptr, i8** %3, align 8, !tbaa !149
  %DataTypeString = getelementptr inbounds i8* %call, i64 48
  %4 = bitcast i8* %DataTypeString to i8**
  store i8* %DataType_string_ptr, i8** %4, align 8, !tbaa !150
  %5 = ptrtoint i8* %AtAddress to i64
  %conv = zext i32 %size_ to i64
  %add = add i64 %conv, %5
  %6 = inttoptr i64 %add to i8*
  %upperbound = getelementptr inbounds i8* %call, i64 56
  %7 = bitcast i8* %upperbound to i8**
  store i8* %6, i8** %7, align 8, !tbaa !151
  %r = getelementptr inbounds i8* %call, i64 8
  %FileName = getelementptr inbounds i8* %call, i64 64
  %8 = bitcast i8* %FileName to i8**
  call void @llvm.memset.p0i8.i64(i8* %r, i8 0, i64 16, i32 8, i1 false)
  store i8* %FilenameStringptr_, i8** %8, align 8, !tbaa !152
  %DirName = getelementptr inbounds i8* %call, i64 72
  %9 = bitcast i8* %DirName to i8**
  store i8* %FileDirStringptr_, i8** %9, align 8, !tbaa !153
  %linenumber = getelementptr inbounds i8* %call, i64 80
  %10 = bitcast i8* %linenumber to i64*
  store i64 %linenumber__, i64* %10, align 8, !tbaa !154
  call void @_ZNSt12forward_listIP6GVMetaSaIS1_EE10push_frontERKS1_(%"class.std::forward_list"* @GVMetalist, %struct.GVMeta** dereferenceable(8) %I)
  %11 = load i8** @GV_AddrRangeHead, align 8, !tbaa !114
  %cmp = icmp eq i8* %11, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i8* %AtAddress, i8** @GV_AddrRangeHead, align 8, !tbaa !114
  store i8* %6, i8** @GV_AddrRangeTail, align 8, !tbaa !114
  br label %if.end12

if.else:                                          ; preds = %entry
  %cmp3 = icmp ugt i8* %11, %AtAddress
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.else
  store i8* %AtAddress, i8** @GV_AddrRangeHead, align 8, !tbaa !114
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.else
  %12 = load i8** @GV_AddrRangeTail, align 8, !tbaa !114
  %cmp7 = icmp ult i8* %12, %6
  br i1 %cmp7, label %if.then8, label %if.end12

if.then8:                                         ; preds = %if.end
  store i8* %6, i8** @GV_AddrRangeTail, align 8, !tbaa !114
  br label %if.end12

if.end12:                                         ; preds = %if.then8, %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt12forward_listIP6GVMetaSaIS1_EE10push_frontERKS1_(%"class.std::forward_list"* %this, %struct.GVMeta** dereferenceable(8) %__val) #3 align 2 {
entry:
  %0 = getelementptr inbounds %"class.std::forward_list"* %this, i64 0, i32 0
  %call = tail call %"struct.std::_Fwd_list_node_base"* @_ZNKSt12forward_listIP6GVMetaSaIS1_EE13cbefore_beginEv(%"class.std::forward_list"* %this) #2
  %call3 = tail call %"struct.std::_Fwd_list_node_base"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE15_M_insert_afterIJRKS1_EEEPSt19_Fwd_list_node_baseSt24_Fwd_list_const_iteratorIS1_EDpOT_(%"struct.std::_Fwd_list_base"* %0, %"struct.std::_Fwd_list_node_base"* %call, %struct.GVMeta** dereferenceable(8) %__val)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__Embed_metadata_ST(i64 %index__, i32 %size_, i8* %Estimated_Name_string_ptr, i8* %DataType_string_ptr, i8* %FunctionName_string_ptr) #3 {
entry:
  %index = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 0
  store i64 %index__, i64* %index, align 8, !tbaa !155
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 3
  store i32 %size_, i32* %size, align 8, !tbaa !157
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 4
  store i8* %Estimated_Name_string_ptr, i8** %EstimatedName, align 8, !tbaa !158
  %DataTypeString = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 5
  store i8* %DataType_string_ptr, i8** %DataTypeString, align 8, !tbaa !159
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 6
  store i8* %FunctionName_string_ptr, i8** %FunctionName, align 8, !tbaa !160
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__Embed_metadata_HP(i32 %index__, i8* %Estimated_Name_string_ptr, i8* %DataType_string_ptr, i8* %FunctionName_string_ptr, i64 %linenumber__, i8* %SourceFile__) #3 {
entry:
  %idxprom = zext i32 %index__ to i64
  %index = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 0
  store i32 %index__, i32* %index, align 16, !tbaa !161
  %EstimatedName = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 3
  store i8* %Estimated_Name_string_ptr, i8** %EstimatedName, align 8, !tbaa !163
  %EstimatedDataTypeString = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 4
  store i8* %DataType_string_ptr, i8** %EstimatedDataTypeString, align 16, !tbaa !164
  %FunctionName = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 5
  store i8* %FunctionName_string_ptr, i8** %FunctionName, align 8, !tbaa !165
  %linenumber = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 6
  store i64 %linenumber__, i64* %linenumber, align 16, !tbaa !166
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 7
  store i8* %SourceFile__, i8** %SourceFile, align 8, !tbaa !167
  %hitcount = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 8
  %0 = bitcast i64* %hitcount to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 24, i32 16, i1 false)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__AddBBHitcount_GV(i64 %index__, i64 %BBhitcount, i32 %Rcount, i32 %Wcount) #3 {
entry:
  %__begin = alloca %"struct.std::_Fwd_list_iterator", align 8
  %__end = alloca %"struct.std::_Fwd_list_iterator", align 8
  %call = tail call %"struct.std::_Fwd_list_node_base"* @_ZNSt12forward_listIP6GVMetaSaIS1_EE5beginEv(%"class.std::forward_list"* @GVMetalist) #2
  %coerce.dive = getelementptr %"struct.std::_Fwd_list_iterator"* %__begin, i64 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* %call, %"struct.std::_Fwd_list_node_base"** %coerce.dive, align 8
  %call1 = tail call %"struct.std::_Fwd_list_node_base"* @_ZNSt12forward_listIP6GVMetaSaIS1_EE3endEv(%"class.std::forward_list"* @GVMetalist) #2
  %coerce.dive2 = getelementptr %"struct.std::_Fwd_list_iterator"* %__end, i64 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* %call1, %"struct.std::_Fwd_list_node_base"** %coerce.dive2, align 8
  %call316 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call316, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %conv = sext i32 %Rcount to i64
  %mul = mul i64 %conv, %BBhitcount
  %conv6 = sext i32 %Wcount to i64
  %mul7 = mul i64 %conv6, %BBhitcount
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %call4 = call dereferenceable(8) %struct.GVMeta** @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEdeEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %0 = load %struct.GVMeta** %call4, align 8, !tbaa !114
  %index = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 0
  %1 = load i64* %index, align 8, !tbaa !123
  %cmp = icmp eq i64 %1, %index__
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %r = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 1
  %2 = load i64* %r, align 8, !tbaa !168
  %add = add i64 %2, %mul
  store i64 %add, i64* %r, align 8, !tbaa !168
  %w = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 2
  %3 = load i64* %w, align 8, !tbaa !169
  %add8 = add i64 %3, %mul7
  store i64 %add8, i64* %w, align 8, !tbaa !169
  br label %for.inc

for.inc:                                          ; preds = %if.then, %for.body
  %call10 = call dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %call3 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call3, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden %"struct.std::_Fwd_list_node_base"* @_ZNSt12forward_listIP6GVMetaSaIS1_EE5beginEv(%"class.std::forward_list"* nocapture readonly %this) #3 align 2 {
entry:
  %retval = alloca %"struct.std::_Fwd_list_iterator", align 8
  %_M_next = getelementptr inbounds %"class.std::forward_list"* %this, i64 0, i32 0, i32 0, i32 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !170
  call void @_ZNSt18_Fwd_list_iteratorIP6GVMetaEC2EPSt19_Fwd_list_node_base(%"struct.std::_Fwd_list_iterator"* %retval, %"struct.std::_Fwd_list_node_base"* %0)
  %coerce.dive = getelementptr %"struct.std::_Fwd_list_iterator"* %retval, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %coerce.dive, align 8
  ret %"struct.std::_Fwd_list_node_base"* %1
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden %"struct.std::_Fwd_list_node_base"* @_ZNSt12forward_listIP6GVMetaSaIS1_EE3endEv(%"class.std::forward_list"* nocapture readnone %this) #3 align 2 {
entry:
  %retval = alloca %"struct.std::_Fwd_list_iterator", align 8
  call void @_ZNSt18_Fwd_list_iteratorIP6GVMetaEC2EPSt19_Fwd_list_node_base(%"struct.std::_Fwd_list_iterator"* %retval, %"struct.std::_Fwd_list_node_base"* null)
  %coerce.dive = getelementptr %"struct.std::_Fwd_list_iterator"* %retval, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %coerce.dive, align 8
  ret %"struct.std::_Fwd_list_node_base"* %0
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* nocapture readonly %this, %"struct.std::_Fwd_list_iterator"* nocapture readonly dereferenceable(8) %__x) #4 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !174
  %_M_node2 = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %__x, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_node2, align 8, !tbaa !174
  %cmp = icmp ne %"struct.std::_Fwd_list_node_base"* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(8) %struct.GVMeta** @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEdeEv(%"struct.std::_Fwd_list_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !174
  %1 = bitcast %"struct.std::_Fwd_list_node_base"* %0 to %"struct.std::_Fwd_list_node"*
  %call = tail call %struct.GVMeta** @_ZNSt14_Fwd_list_nodeIP6GVMetaE9_M_valptrEv(%"struct.std::_Fwd_list_node"* %1) #2
  ret %struct.GVMeta** %call
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %this) #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !174
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %0, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !176
  store %"struct.std::_Fwd_list_node_base"* %1, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !174
  ret %"struct.std::_Fwd_list_iterator"* %this
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__AddBBHitcount_ST(i64 %index__, i64 %BBhitcount, i32 %Rcount, i32 %Wcount) #3 {
entry:
  %r = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 1
  %0 = load i64* %r, align 8, !tbaa !177
  %conv = sext i32 %Rcount to i64
  %mul = mul i64 %conv, %BBhitcount
  %add = add i64 %0, %mul
  store i64 %add, i64* %r, align 8, !tbaa !177
  %w = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 2
  %1 = load i64* %w, align 8, !tbaa !178
  %conv4 = sext i32 %Wcount to i64
  %mul5 = mul i64 %conv4, %BBhitcount
  %add6 = add i64 %1, %mul5
  store i64 %add6, i64* %w, align 8, !tbaa !178
  ret void
}

; Function Attrs: noinline nounwind readnone uwtable
define void @sdmprofile__AddBBHitcount_HP(i64 %index__, i64 %BBhitcount, i32 %Rcount, i32 %Wcount) #5 {
entry:
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__BBHit(i64 %index__, i64 %cc) #3 {
entry:
  %arrayidx = getelementptr inbounds [5000 x i64]* @BBhits, i64 0, i64 %index__
  store i64 %cc, i64* %arrayidx, align 8, !tbaa !179
  ret void
}

; Function Attrs: noinline nounwind readnone uwtable
define noalias i8* @sdmprofile__DummyCallBack1(i8* nocapture readnone %arg, i32 %thdn) #5 {
entry:
  ret i8* null
}

; Function Attrs: noinline nounwind readnone uwtable
define noalias i8* @sdmprofile__DummyCallBack2(i8* nocapture readnone %arg, i32 %thdn, %struct.sdmprofile__Allocated_Stack_item* nocapture readnone %ptr) #5 {
entry:
  ret i8* null
}

; Function Attrs: noinline nounwind readnone uwtable
define i32 @sdmprofile__DummyCallBack3(i8* nocapture readnone %arg, i32 %thdn) #5 {
entry:
  ret i32 0
}

; Function Attrs: noinline nounwind readnone uwtable
define i32 @sdmprofile__DummyCallBack4(i8* nocapture readnone %arg, i32 %thdn, %struct.sdmprofile__Allocated_Stack_item* nocapture readnone %ptr) #5 {
entry:
  ret i32 0
}

; Function Attrs: noinline nounwind readnone uwtable
define i64 @sdmprofile__DummyCallBack5(i8* nocapture readnone %arg, i32 %thdn) #5 {
entry:
  ret i64 0
}

; Function Attrs: noinline nounwind readnone uwtable
define i64 @sdmprofile__DummyCallBack6(i8* nocapture readnone %arg, i32 %thdn, %struct.sdmprofile__Allocated_Stack_item* nocapture readnone %ptr) #5 {
entry:
  ret i64 0
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template1(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %call2 = tail call double @sdmprofile__getRealTime()
  %idxprom = zext i32 %call to i64
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !139
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define double @sdmprofile__getRealTime() #3 {
entry:
  %ts = alloca %struct.timespec, align 8
  %tm = alloca %struct.timeval, align 8
  %call = call i32 @clock_gettime(i32 4, %struct.timespec* %ts) #2
  %cmp = icmp eq i32 %call, -1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %tv_sec = getelementptr inbounds %struct.timespec* %ts, i64 0, i32 0
  %0 = load i64* %tv_sec, align 8, !tbaa !180
  %conv = sitofp i64 %0 to double
  %tv_nsec = getelementptr inbounds %struct.timespec* %ts, i64 0, i32 1
  %1 = load i64* %tv_nsec, align 8, !tbaa !182
  %conv1 = sitofp i64 %1 to double
  %div = fdiv double %conv1, 1.000000e+09
  %add = fadd double %conv, %div
  br label %return

if.end:                                           ; preds = %entry
  %call2 = call i32 @gettimeofday(%struct.timeval* %tm, %struct.timezone* null) #2
  %tv_sec3 = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 0
  %2 = load i64* %tv_sec3, align 8, !tbaa !183
  %conv4 = sitofp i64 %2 to double
  %tv_usec = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 1
  %3 = load i64* %tv_usec, align 8, !tbaa !185
  %conv5 = sitofp i64 %3 to double
  %div6 = fdiv double %conv5, 1.000000e+06
  %add7 = fadd double %conv4, %div6
  br label %return

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi double [ %add, %if.then ], [ %add7, %if.end ]
  ret double %retval.0
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template2(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %idxprom = zext i32 %call to i64
  %call2 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !139
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template3(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %conv = zext i32 %call to i64
  %call4 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %conv, i32 3
  store double %call4, double* %ThreadEndTime, align 8, !tbaa !139
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template4(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %conv = zext i32 %call to i64
  %call4 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %conv, i32 3
  store double %call4, double* %ThreadEndTime, align 8, !tbaa !139
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template5(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %call2 = tail call double @sdmprofile__getRealTime()
  %idxprom = zext i32 %call to i64
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !139
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template6(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %idxprom = zext i32 %call to i64
  %call2 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !139
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define i8* @sdmprofile__malloc(i64 %size_, i32 %heap_index, i32 %thdnumber) #3 {
entry:
  %I = alloca %struct.HeapAllocationMeta*, align 8
  %call = tail call noalias i8* @malloc(i64 %size_) #2
  %idxprom = zext i32 %thdnumber to i64
  %Malloc_Calls = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 6
  %0 = load i64* %Malloc_Calls, align 8, !tbaa !186
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Malloc_Calls, align 8, !tbaa !186
  %call1 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %call2 = tail call noalias i8* @malloc(i64 40) #2
  %1 = bitcast i8* %call2 to %struct.HeapAllocationMeta*
  store %struct.HeapAllocationMeta* %1, %struct.HeapAllocationMeta** %I, align 8, !tbaa !114
  %ptr = bitcast i8* %call2 to i8**
  store i8* %call, i8** %ptr, align 8, !tbaa !120
  %2 = ptrtoint i8* %call to i64
  %add = add i64 %2, %size_
  %3 = inttoptr i64 %add to i8*
  %upperbound = getelementptr inbounds i8* %call2, i64 8
  %4 = bitcast i8* %upperbound to i8**
  store i8* %3, i8** %4, align 8, !tbaa !187
  %size = getelementptr inbounds i8* %call2, i64 16
  %5 = bitcast i8* %size to i64*
  store i64 %size_, i64* %5, align 8, !tbaa !188
  %heapindex = getelementptr inbounds i8* %call2, i64 24
  %6 = bitcast i8* %heapindex to i32*
  store i32 %heap_index, i32* %6, align 4, !tbaa !189
  call void @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE10push_frontERKS1_(%"class.std::list"* @HeapAllocationList, %struct.HeapAllocationMeta** dereferenceable(8) %I)
  %call3 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %Current_Heap_Allocation = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 10
  %7 = load i64* %Current_Heap_Allocation, align 8, !tbaa !190
  %inc6 = add i64 %7, 1
  store i64 %inc6, i64* %Current_Heap_Allocation, align 8, !tbaa !190
  %Peak_Heap_Allocation = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 8
  %8 = load i64* %Peak_Heap_Allocation, align 8, !tbaa !191
  %cmp = icmp ult i64 %8, %inc6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 %inc6, i64* %Peak_Heap_Allocation, align 8, !tbaa !191
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %idxprom18 = zext i32 %heap_index to i64
  %arrayidx19 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18
  store %struct.HPMeta* %arrayidx19, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !114
  %hitcount = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 8
  %9 = load i64* %hitcount, align 16, !tbaa !192
  %cmp20 = icmp eq i64 %9, 0
  %MaxSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 9
  br i1 %cmp20, label %if.then21, label %if.else

if.then21:                                        ; preds = %if.end
  store i64 %size_, i64* %MaxSize, align 8, !tbaa !193
  %MinSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 10
  store i64 %size_, i64* %MinSize, align 16, !tbaa !194
  br label %if.end32

if.else:                                          ; preds = %if.end
  %10 = load i64* %MaxSize, align 8, !tbaa !193
  %cmp23 = icmp ult i64 %10, %size_
  br i1 %cmp23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %if.else
  store i64 %size_, i64* %MaxSize, align 8, !tbaa !193
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %if.else
  %MinSize27 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 10
  %11 = load i64* %MinSize27, align 16, !tbaa !194
  %cmp28 = icmp ugt i64 %11, %size_
  br i1 %cmp28, label %if.then29, label %if.end32

if.then29:                                        ; preds = %if.end26
  store i64 %size_, i64* %MinSize27, align 16, !tbaa !194
  br label %if.end32

if.end32:                                         ; preds = %if.then29, %if.end26, %if.then21
  %hitcount33 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 8
  %inc34 = add i64 %9, 1
  store i64 %inc34, i64* %hitcount33, align 16, !tbaa !192
  %12 = load i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !114
  %cmp35 = icmp eq i8* %12, null
  br i1 %cmp35, label %if.then36, label %if.else38

if.then36:                                        ; preds = %if.end32
  store i8* %call, i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !114
  store i8* %3, i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !114
  br label %if.end47

if.else38:                                        ; preds = %if.end32
  %cmp39 = icmp ugt i8* %12, %call
  br i1 %cmp39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.else38
  store i8* %call, i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !114
  br label %if.end41

if.end41:                                         ; preds = %if.then40, %if.else38
  %13 = load i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !114
  %cmp43 = icmp ult i8* %13, %3
  br i1 %cmp43, label %if.then44, label %if.end47

if.then44:                                        ; preds = %if.end41
  store i8* %3, i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !114
  br label %if.end47

if.end47:                                         ; preds = %if.then44, %if.end41, %if.then36
  ret i8* %call
}

; Function Attrs: nounwind
declare i32 @pthread_mutex_lock(%union.pthread_mutex_t*) #1

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE10push_frontERKS1_(%"class.std::list"* %this, %struct.HeapAllocationMeta** dereferenceable(8) %__x) #3 align 2 {
entry:
  %call = tail call %"struct.std::__detail::_List_node_base"* @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE5beginEv(%"class.std::list"* %this) #2
  tail call void @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE9_M_insertIJRKS1_EEEvSt14_List_iteratorIS1_EDpOT_(%"class.std::list"* %this, %"struct.std::__detail::_List_node_base"* %call, %struct.HeapAllocationMeta** dereferenceable(8) %__x)
  ret void
}

; Function Attrs: nounwind
declare i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) #1

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__free(i8* %pointer, i32 %thdnumber) #3 {
entry:
  %__begin = alloca %"struct.std::_List_iterator", align 8
  %__end = alloca %"struct.std::_List_iterator", align 8
  %idxprom = zext i32 %thdnumber to i64
  %Free_Calls = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 7
  %0 = load i64* %Free_Calls, align 8, !tbaa !195
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Free_Calls, align 8, !tbaa !195
  %call = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %call1 = tail call %"struct.std::__detail::_List_node_base"* @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE5beginEv(%"class.std::list"* @HeapAllocationList) #2
  %coerce.dive = getelementptr %"struct.std::_List_iterator"* %__begin, i64 0, i32 0
  store %"struct.std::__detail::_List_node_base"* %call1, %"struct.std::__detail::_List_node_base"** %coerce.dive, align 8
  %call2 = tail call %"struct.std::__detail::_List_node_base"* @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE3endEv(%"class.std::list"* @HeapAllocationList) #2
  %coerce.dive3 = getelementptr %"struct.std::_List_iterator"* %__end, i64 0, i32 0
  store %"struct.std::__detail::_List_node_base"* %call2, %"struct.std::__detail::_List_node_base"** %coerce.dive3, align 8
  %call418 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__begin, %"struct.std::_List_iterator"* dereferenceable(8) %__end)
  br i1 %call418, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %call5 = call dereferenceable(8) %struct.HeapAllocationMeta** @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEdeEv(%"struct.std::_List_iterator"* %__begin)
  %1 = load %struct.HeapAllocationMeta** %call5, align 8, !tbaa !114
  %ptr = getelementptr inbounds %struct.HeapAllocationMeta* %1, i64 0, i32 0
  %2 = load i8** %ptr, align 8, !tbaa !120
  %cmp = icmp eq i8* %2, %pointer
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %ptr.lcssa = phi i8** [ %ptr, %for.body ]
  %call5.lcssa = phi %struct.HeapAllocationMeta** [ %call5, %for.body ]
  store i8* null, i8** %ptr.lcssa, align 8, !tbaa !120
  %3 = load %struct.HeapAllocationMeta** %call5.lcssa, align 8, !tbaa !114
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %3, i64 0, i32 1
  store i8* null, i8** %upperbound, align 8, !tbaa !187
  %4 = load %struct.HeapAllocationMeta** %call5.lcssa, align 8, !tbaa !114
  %size = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 2
  store i64 0, i64* %size, align 8, !tbaa !188
  %heapindex = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 3
  store i32 0, i32* %heapindex, align 4, !tbaa !189
  call void @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE6removeERKS1_(%"class.std::list"* @HeapAllocationList, %struct.HeapAllocationMeta** dereferenceable(8) %call5.lcssa)
  br label %for.end

for.inc:                                          ; preds = %for.body
  %call7 = call dereferenceable(8) %"struct.std::_List_iterator"* @_ZNSt14_List_iteratorIP18HeapAllocationMetaEppEv(%"struct.std::_List_iterator"* %__begin)
  %call4 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__begin, %"struct.std::_List_iterator"* dereferenceable(8) %__end)
  br i1 %call4, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %if.then, %entry
  %call8 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %Current_Heap_Allocation = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 10
  %5 = load i64* %Current_Heap_Allocation, align 8, !tbaa !190
  %dec = add i64 %5, -1
  store i64 %dec, i64* %Current_Heap_Allocation, align 8, !tbaa !190
  call void @free(i8* %pointer) #2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden %"struct.std::__detail::_List_node_base"* @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE5beginEv(%"class.std::list"* nocapture readonly %this) #3 align 2 {
entry:
  %retval = alloca %"struct.std::_List_iterator", align 8
  %_M_next = getelementptr inbounds %"class.std::list"* %this, i64 0, i32 0, i32 0, i32 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !196
  call void @_ZNSt14_List_iteratorIP18HeapAllocationMetaEC2EPNSt8__detail15_List_node_baseE(%"struct.std::_List_iterator"* %retval, %"struct.std::__detail::_List_node_base"* %0)
  %coerce.dive = getelementptr %"struct.std::_List_iterator"* %retval, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %coerce.dive, align 8
  ret %"struct.std::__detail::_List_node_base"* %1
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden %"struct.std::__detail::_List_node_base"* @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE3endEv(%"class.std::list"* %this) #3 align 2 {
entry:
  %retval = alloca %"struct.std::_List_iterator", align 8
  %_M_node = getelementptr inbounds %"class.std::list"* %this, i64 0, i32 0, i32 0, i32 0
  call void @_ZNSt14_List_iteratorIP18HeapAllocationMetaEC2EPNSt8__detail15_List_node_baseE(%"struct.std::_List_iterator"* %retval, %"struct.std::__detail::_List_node_base"* %_M_node)
  %coerce.dive = getelementptr %"struct.std::_List_iterator"* %retval, i64 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %coerce.dive, align 8
  ret %"struct.std::__detail::_List_node_base"* %0
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* nocapture readonly %this, %"struct.std::_List_iterator"* nocapture readonly dereferenceable(8) %__x) #4 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_List_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !200
  %_M_node2 = getelementptr inbounds %"struct.std::_List_iterator"* %__x, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_node2, align 8, !tbaa !200
  %cmp = icmp ne %"struct.std::__detail::_List_node_base"* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(8) %struct.HeapAllocationMeta** @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEdeEv(%"struct.std::_List_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_List_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !200
  %_M_data = getelementptr inbounds %"struct.std::__detail::_List_node_base"* %0, i64 1
  %1 = bitcast %"struct.std::__detail::_List_node_base"* %_M_data to %struct.HeapAllocationMeta**
  ret %struct.HeapAllocationMeta** %1
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr void @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE6removeERKS1_(%"class.std::list"* %this, %struct.HeapAllocationMeta** readonly dereferenceable(8) %__value) #3 align 2 {
entry:
  %__first = alloca %"struct.std::_List_iterator", align 8
  %__last = alloca %"struct.std::_List_iterator", align 8
  %__extra = alloca %"struct.std::_List_iterator", align 8
  %__next = alloca %"struct.std::_List_iterator", align 8
  %call = tail call %"struct.std::__detail::_List_node_base"* @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE5beginEv(%"class.std::list"* %this) #2
  %coerce.dive = getelementptr %"struct.std::_List_iterator"* %__first, i64 0, i32 0
  store %"struct.std::__detail::_List_node_base"* %call, %"struct.std::__detail::_List_node_base"** %coerce.dive, align 8
  %call2 = tail call %"struct.std::__detail::_List_node_base"* @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE3endEv(%"class.std::list"* %this) #2
  %coerce.dive3 = getelementptr %"struct.std::_List_iterator"* %__last, i64 0, i32 0
  store %"struct.std::__detail::_List_node_base"* %call2, %"struct.std::__detail::_List_node_base"** %coerce.dive3, align 8
  %0 = getelementptr inbounds %"struct.std::_List_iterator"* %__extra, i64 0, i32 0
  store %"struct.std::__detail::_List_node_base"* %call2, %"struct.std::__detail::_List_node_base"** %0, align 8, !tbaa !114
  %call420 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__first, %"struct.std::_List_iterator"* dereferenceable(8) %__last)
  br i1 %call420, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %entry
  %1 = getelementptr inbounds %"struct.std::_List_iterator"* %__next, i64 0, i32 0
  br label %while.body

while.body:                                       ; preds = %if.end13, %while.body.lr.ph
  %agg.tmp16.sroa.0.0.copyload23 = phi %"struct.std::__detail::_List_node_base"* [ %call2, %while.body.lr.ph ], [ %agg.tmp16.sroa.0.0.copyload22, %if.end13 ]
  %2 = phi %"struct.std::__detail::_List_node_base"* [ %call, %while.body.lr.ph ], [ %5, %if.end13 ]
  store %"struct.std::__detail::_List_node_base"* %2, %"struct.std::__detail::_List_node_base"** %1, align 8, !tbaa !114
  %call5 = call dereferenceable(8) %"struct.std::_List_iterator"* @_ZNSt14_List_iteratorIP18HeapAllocationMetaEppEv(%"struct.std::_List_iterator"* %__next)
  %call6 = call dereferenceable(8) %struct.HeapAllocationMeta** @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEdeEv(%"struct.std::_List_iterator"* %__first)
  %3 = load %struct.HeapAllocationMeta** %call6, align 8, !tbaa !114
  %4 = load %struct.HeapAllocationMeta** %__value, align 8, !tbaa !114
  %cmp = icmp eq %struct.HeapAllocationMeta* %3, %4
  br i1 %cmp, label %if.then, label %if.end13

if.then:                                          ; preds = %while.body
  %call8 = call %struct.HeapAllocationMeta** @_ZSt11__addressofIP18HeapAllocationMetaEPT_RS2_(%struct.HeapAllocationMeta** dereferenceable(8) %call6) #2
  %call9 = call %struct.HeapAllocationMeta** @_ZSt11__addressofIKP18HeapAllocationMetaEPT_RS3_(%struct.HeapAllocationMeta** dereferenceable(8) %__value) #2
  %cmp10 = icmp eq %struct.HeapAllocationMeta** %call8, %call9
  br i1 %cmp10, label %if.else, label %if.then11

if.then11:                                        ; preds = %if.then
  call void @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE8_M_eraseESt14_List_iteratorIS1_E(%"class.std::list"* %this, %"struct.std::__detail::_List_node_base"* %2)
  br label %if.end13

if.else:                                          ; preds = %if.then
  store %"struct.std::__detail::_List_node_base"* %2, %"struct.std::__detail::_List_node_base"** %0, align 8, !tbaa !114
  br label %if.end13

if.end13:                                         ; preds = %if.else, %if.then11, %while.body
  %agg.tmp16.sroa.0.0.copyload22 = phi %"struct.std::__detail::_List_node_base"* [ %agg.tmp16.sroa.0.0.copyload23, %if.then11 ], [ %2, %if.else ], [ %agg.tmp16.sroa.0.0.copyload23, %while.body ]
  %5 = load %"struct.std::__detail::_List_node_base"** %1, align 8, !tbaa !114
  store %"struct.std::__detail::_List_node_base"* %5, %"struct.std::__detail::_List_node_base"** %coerce.dive, align 8, !tbaa !114
  %call4 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__first, %"struct.std::_List_iterator"* dereferenceable(8) %__last)
  br i1 %call4, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %if.end13
  %agg.tmp16.sroa.0.0.copyload22.lcssa = phi %"struct.std::__detail::_List_node_base"* [ %agg.tmp16.sroa.0.0.copyload22, %if.end13 ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  %agg.tmp16.sroa.0.0.copyload = phi %"struct.std::__detail::_List_node_base"* [ %call2, %entry ], [ %agg.tmp16.sroa.0.0.copyload22.lcssa, %while.end.loopexit ]
  %call14 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__extra, %"struct.std::_List_iterator"* dereferenceable(8) %__last)
  br i1 %call14, label %if.then15, label %if.end18

if.then15:                                        ; preds = %while.end
  call void @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE8_M_eraseESt14_List_iteratorIS1_E(%"class.std::list"* %this, %"struct.std::__detail::_List_node_base"* %agg.tmp16.sroa.0.0.copyload)
  br label %if.end18

if.end18:                                         ; preds = %if.then15, %while.end
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden dereferenceable(8) %"struct.std::_List_iterator"* @_ZNSt14_List_iteratorIP18HeapAllocationMetaEppEv(%"struct.std::_List_iterator"* %this) #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_List_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !200
  %_M_next = getelementptr inbounds %"struct.std::__detail::_List_node_base"* %0, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !202
  store %"struct.std::__detail::_List_node_base"* %1, %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !200
  ret %"struct.std::_List_iterator"* %this
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy1(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType) #3 {
entry:
  %0 = load i64* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 12), align 16, !tbaa !203
  %inc = add i64 %0, 1
  store i64 %inc, i64* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 12), align 16, !tbaa !203
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy2(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType, i32 %threadnumber) #3 {
entry:
  %idxprom = zext i32 %threadnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !203
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !203
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy3(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType, i32 %threadnumber, %struct.sdmprofile__Allocated_Stack_item* nocapture readnone %ptr) #3 {
entry:
  %idxprom = zext i32 %threadnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !203
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !203
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_GVonly(i8* readnone %AtAddress, i8 zeroext %AccessType, i32 %thdnumber) #3 {
entry:
  %__begin = alloca %"struct.std::_Fwd_list_iterator", align 8
  %__end = alloca %"struct.std::_Fwd_list_iterator", align 8
  %idxprom = zext i32 %thdnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !203
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !203
  %1 = load i8** @GV_AddrRangeHead, align 8, !tbaa !114
  %cmp = icmp ule i8* %1, %AtAddress
  %2 = load i8** @GV_AddrRangeTail, align 8
  %cmp1 = icmp ugt i8* %2, %AtAddress
  %or.cond = and i1 %cmp, %cmp1
  br i1 %or.cond, label %if.then, label %return

if.then:                                          ; preds = %entry
  %SearchWithinAddressRange = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 14
  %3 = load i64* %SearchWithinAddressRange, align 8, !tbaa !204
  %inc4 = add i64 %3, 1
  store i64 %inc4, i64* %SearchWithinAddressRange, align 8, !tbaa !204
  %GVCache_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 20
  %I.0136 = load %struct.GVCache_Item** %GVCache_head, align 8
  %cmp7137 = icmp eq %struct.GVCache_Item* %I.0136, null
  br i1 %cmp7137, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %if.then
  br label %while.body

while.body:                                       ; preds = %if.else37, %while.body.preheader
  %I.0139 = phi %struct.GVCache_Item* [ %I.0, %if.else37 ], [ %I.0136, %while.body.preheader ]
  %previous.0138 = phi %struct.GVCache_Item* [ %I.0139, %if.else37 ], [ undef, %while.body.preheader ]
  %ptr = getelementptr inbounds %struct.GVCache_Item* %I.0139, i64 0, i32 0
  %4 = load %struct.GVMeta** %ptr, align 8, !tbaa !145
  %address = getelementptr inbounds %struct.GVMeta* %4, i64 0, i32 3
  %5 = load i8** %address, align 8, !tbaa !125
  %cmp8 = icmp ugt i8* %5, %AtAddress
  br i1 %cmp8, label %if.else37, label %land.lhs.true9

land.lhs.true9:                                   ; preds = %while.body
  %upperbound = getelementptr inbounds %struct.GVMeta* %4, i64 0, i32 7
  %6 = load i8** %upperbound, align 8, !tbaa !151
  %cmp11 = icmp ugt i8* %6, %AtAddress
  br i1 %cmp11, label %if.then12, label %if.else37

if.then12:                                        ; preds = %land.lhs.true9
  %.lcssa154 = phi %struct.GVMeta* [ %4, %land.lhs.true9 ]
  %previous.0138.lcssa = phi %struct.GVCache_Item* [ %previous.0138, %land.lhs.true9 ]
  %I.0139.lcssa = phi %struct.GVCache_Item* [ %I.0139, %land.lhs.true9 ]
  %conv = zext i8 %AccessType to i32
  switch i32 %conv, label %sw.epilog [
    i32 2, label %sw.bb
    i32 1, label %sw.bb15
  ]

sw.bb:                                            ; preds = %if.then12
  %r = getelementptr inbounds %struct.GVMeta* %.lcssa154, i64 0, i32 1
  %7 = load i64* %r, align 8, !tbaa !168
  %inc14 = add i64 %7, 1
  store i64 %inc14, i64* %r, align 8, !tbaa !168
  br label %sw.epilog

sw.bb15:                                          ; preds = %if.then12
  %w = getelementptr inbounds %struct.GVMeta* %.lcssa154, i64 0, i32 2
  %8 = load i64* %w, align 8, !tbaa !169
  %inc17 = add i64 %8, 1
  store i64 %inc17, i64* %w, align 8, !tbaa !169
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb15, %sw.bb, %if.then12
  %Cache_Hits = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 16
  %9 = load i64* %Cache_Hits, align 8, !tbaa !205
  %inc20 = add i64 %9, 1
  store i64 %inc20, i64* %Cache_Hits, align 8, !tbaa !205
  %10 = load %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !144
  %cmp24 = icmp eq %struct.GVCache_Item* %I.0139.lcssa, %10
  br i1 %cmp24, label %return, label %if.else

if.else:                                          ; preds = %sw.epilog
  %next = getelementptr inbounds %struct.GVCache_Item* %I.0139.lcssa, i64 0, i32 1
  %11 = load %struct.GVCache_Item** %next, align 8, !tbaa !147
  %next26 = getelementptr inbounds %struct.GVCache_Item* %previous.0138.lcssa, i64 0, i32 1
  store %struct.GVCache_Item* %11, %struct.GVCache_Item** %next26, align 8, !tbaa !147
  store %struct.GVCache_Item* %I.0139.lcssa, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !144
  store %struct.GVCache_Item* %10, %struct.GVCache_Item** %next, align 8, !tbaa !147
  br label %return

if.else37:                                        ; preds = %land.lhs.true9, %while.body
  %next38 = getelementptr inbounds %struct.GVCache_Item* %I.0139, i64 0, i32 1
  %I.0 = load %struct.GVCache_Item** %next38, align 8
  %cmp7 = icmp eq %struct.GVCache_Item* %I.0, null
  br i1 %cmp7, label %while.end.loopexit, label %while.body

while.end.loopexit:                               ; preds = %if.else37
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %if.then
  %call = tail call %"struct.std::_Fwd_list_node_base"* @_ZNSt12forward_listIP6GVMetaSaIS1_EE5beginEv(%"class.std::forward_list"* @GVMetalist) #2
  %coerce.dive = getelementptr %"struct.std::_Fwd_list_iterator"* %__begin, i64 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* %call, %"struct.std::_Fwd_list_node_base"** %coerce.dive, align 8
  %call40 = tail call %"struct.std::_Fwd_list_node_base"* @_ZNSt12forward_listIP6GVMetaSaIS1_EE3endEv(%"class.std::forward_list"* @GVMetalist) #2
  %coerce.dive41 = getelementptr %"struct.std::_Fwd_list_iterator"* %__end, i64 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* %call40, %"struct.std::_Fwd_list_node_base"** %coerce.dive41, align 8
  %call42135 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call42135, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %while.end
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %call44 = call dereferenceable(8) %struct.GVMeta** @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEdeEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %12 = load %struct.GVMeta** %call44, align 8, !tbaa !114
  %address45 = getelementptr inbounds %struct.GVMeta* %12, i64 0, i32 3
  %13 = load i8** %address45, align 8, !tbaa !125
  %cmp46 = icmp ugt i8* %13, %AtAddress
  br i1 %cmp46, label %for.inc, label %land.lhs.true47

land.lhs.true47:                                  ; preds = %for.body
  %upperbound48 = getelementptr inbounds %struct.GVMeta* %12, i64 0, i32 7
  %14 = load i8** %upperbound48, align 8, !tbaa !151
  %cmp49 = icmp ugt i8* %14, %AtAddress
  br i1 %cmp49, label %if.then50, label %for.inc

if.then50:                                        ; preds = %land.lhs.true47
  %.lcssa = phi %struct.GVMeta* [ %12, %land.lhs.true47 ]
  %conv51 = zext i8 %AccessType to i32
  switch i32 %conv51, label %sw.epilog59 [
    i32 2, label %sw.bb52
    i32 1, label %sw.bb55
  ]

sw.bb52:                                          ; preds = %if.then50
  %r53 = getelementptr inbounds %struct.GVMeta* %.lcssa, i64 0, i32 1
  %15 = load i64* %r53, align 8, !tbaa !168
  %inc54 = add i64 %15, 1
  store i64 %inc54, i64* %r53, align 8, !tbaa !168
  br label %sw.epilog59

sw.bb55:                                          ; preds = %if.then50
  %w56 = getelementptr inbounds %struct.GVMeta* %.lcssa, i64 0, i32 2
  %16 = load i64* %w56, align 8, !tbaa !169
  %inc57 = add i64 %16, 1
  store i64 %inc57, i64* %w56, align 8, !tbaa !169
  br label %sw.epilog59

sw.epilog59:                                      ; preds = %sw.bb55, %sw.bb52, %if.then50
  %Cache_Miss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 15
  %17 = load i64* %Cache_Miss, align 8, !tbaa !206
  %inc68 = add i64 %17, 1
  store i64 %inc68, i64* %Cache_Miss, align 8, !tbaa !206
  %18 = load %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !144
  br label %while.cond75

for.inc:                                          ; preds = %land.lhs.true47, %for.body
  %call61 = call dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %call42 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call42, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %while.end
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %19 = load i64* %SearchMiss, align 8, !tbaa !207
  %inc64 = add i64 %19, 1
  store i64 %inc64, i64* %SearchMiss, align 8, !tbaa !207
  br label %return

while.cond75:                                     ; preds = %while.cond75, %sw.epilog59
  %previous70.0 = phi %struct.GVCache_Item* [ undef, %sw.epilog59 ], [ %I71.0, %while.cond75 ]
  %I71.0 = phi %struct.GVCache_Item* [ %18, %sw.epilog59 ], [ %20, %while.cond75 ]
  %next76 = getelementptr inbounds %struct.GVCache_Item* %I71.0, i64 0, i32 1
  %20 = load %struct.GVCache_Item** %next76, align 8, !tbaa !147
  %cmp77 = icmp eq %struct.GVCache_Item* %20, null
  br i1 %cmp77, label %while.end80, label %while.cond75

while.end80:                                      ; preds = %while.cond75
  %next76.lcssa = phi %struct.GVCache_Item** [ %next76, %while.cond75 ]
  %I71.0.lcssa = phi %struct.GVCache_Item* [ %I71.0, %while.cond75 ]
  %previous70.0.lcssa = phi %struct.GVCache_Item* [ %previous70.0, %while.cond75 ]
  %next81 = getelementptr inbounds %struct.GVCache_Item* %previous70.0.lcssa, i64 0, i32 1
  store %struct.GVCache_Item* null, %struct.GVCache_Item** %next81, align 8, !tbaa !147
  store %struct.GVCache_Item* %I71.0.lcssa, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !144
  store %struct.GVCache_Item* %18, %struct.GVCache_Item** %next76.lcssa, align 8, !tbaa !147
  %ptr95 = getelementptr inbounds %struct.GVCache_Item* %I71.0.lcssa, i64 0, i32 0
  store %struct.GVMeta* %.lcssa, %struct.GVMeta** %ptr95, align 8, !tbaa !145
  br label %return

return:                                           ; preds = %while.end80, %for.end, %if.else, %sw.epilog, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_HPonly(i8* readnone %AtAddress, i8 zeroext %AccessType, i32 %thdnumber) #3 {
entry:
  %__begin = alloca %"struct.std::_List_iterator", align 8
  %__end = alloca %"struct.std::_List_iterator", align 8
  %idxprom = zext i32 %thdnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !203
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !203
  %1 = load i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !114
  %cmp = icmp ugt i8* %1, %AtAddress
  %2 = load i8** @sdmprofile__HP_addressRangeTo, align 8
  %cmp1 = icmp ult i8* %2, %AtAddress
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %if.end96, label %if.then

if.then:                                          ; preds = %entry
  %SearchWithinAddressRange = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 14
  %3 = load i64* %SearchWithinAddressRange, align 8, !tbaa !204
  %inc4 = add i64 %3, 1
  store i64 %inc4, i64* %SearchWithinAddressRange, align 8, !tbaa !204
  %Cache2_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 19
  %I.0179 = load %struct.Cache2_Item** %Cache2_head, align 8
  %cmp7180 = icmp eq %struct.Cache2_Item* %I.0179, null
  br i1 %cmp7180, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %if.then
  br label %while.body

while.cond:                                       ; preds = %while.body
  %next44 = getelementptr inbounds %struct.Cache2_Item* %I.0182, i64 0, i32 1
  %I.0 = load %struct.Cache2_Item** %next44, align 8
  %cmp7 = icmp eq %struct.Cache2_Item* %I.0, null
  br i1 %cmp7, label %while.end.loopexit, label %while.body

while.body:                                       ; preds = %while.cond, %while.body.preheader
  %I.0182 = phi %struct.Cache2_Item* [ %I.0, %while.cond ], [ %I.0179, %while.body.preheader ]
  %previous.0181 = phi %struct.Cache2_Item* [ %I.0182, %while.cond ], [ undef, %while.body.preheader ]
  %ptr = getelementptr inbounds %struct.Cache2_Item* %I.0182, i64 0, i32 0
  %4 = load %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !141
  %ptr8 = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 0
  %5 = load i8** %ptr8, align 8, !tbaa !120
  store i8* %5, i8** @cache_addr, align 8, !tbaa !114
  %6 = load %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !141
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %6, i64 0, i32 1
  %7 = load i8** %upperbound, align 8, !tbaa !187
  store i8* %7, i8** @cache_upperbound, align 8, !tbaa !114
  %cmp10 = icmp ule i8* %5, %AtAddress
  %cmp12 = icmp ugt i8* %7, %AtAddress
  %or.cond172 = and i1 %cmp10, %cmp12
  br i1 %or.cond172, label %if.then13, label %while.cond

if.then13:                                        ; preds = %while.body
  %ptr.lcssa = phi %struct.HeapAllocationMeta** [ %ptr, %while.body ]
  %previous.0181.lcssa = phi %struct.Cache2_Item* [ %previous.0181, %while.body ]
  %I.0182.lcssa = phi %struct.Cache2_Item* [ %I.0182, %while.body ]
  %conv = zext i8 %AccessType to i32
  switch i32 %conv, label %sw.epilog [
    i32 2, label %sw.bb
    i32 1, label %sw.bb18
  ]

sw.bb:                                            ; preds = %if.then13
  %8 = load %struct.HeapAllocationMeta** %ptr.lcssa, align 8, !tbaa !141
  %heapindex = getelementptr inbounds %struct.HeapAllocationMeta* %8, i64 0, i32 3
  %9 = load i32* %heapindex, align 4, !tbaa !189
  %idxprom15 = zext i32 %9 to i64
  %r = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom15, i32 1
  %10 = load i64* %r, align 8, !tbaa !208
  %inc17 = add i64 %10, 1
  store i64 %inc17, i64* %r, align 8, !tbaa !208
  br label %sw.epilog

sw.bb18:                                          ; preds = %if.then13
  %11 = load %struct.HeapAllocationMeta** %ptr.lcssa, align 8, !tbaa !141
  %heapindex20 = getelementptr inbounds %struct.HeapAllocationMeta* %11, i64 0, i32 3
  %12 = load i32* %heapindex20, align 4, !tbaa !189
  %idxprom21 = zext i32 %12 to i64
  %w = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom21, i32 2
  %13 = load i64* %w, align 16, !tbaa !209
  %inc23 = add i64 %13, 1
  store i64 %inc23, i64* %w, align 16, !tbaa !209
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb18, %sw.bb, %if.then13
  %Cache_Hits = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 16
  %14 = load i64* %Cache_Hits, align 8, !tbaa !205
  %inc26 = add i64 %14, 1
  store i64 %inc26, i64* %Cache_Hits, align 8, !tbaa !205
  %cmp30 = icmp eq %struct.Cache2_Item* %I.0182.lcssa, %I.0179
  br i1 %cmp30, label %return, label %if.else

if.else:                                          ; preds = %sw.epilog
  %next = getelementptr inbounds %struct.Cache2_Item* %I.0182.lcssa, i64 0, i32 1
  %15 = load %struct.Cache2_Item** %next, align 8, !tbaa !143
  %next32 = getelementptr inbounds %struct.Cache2_Item* %previous.0181.lcssa, i64 0, i32 1
  store %struct.Cache2_Item* %15, %struct.Cache2_Item** %next32, align 8, !tbaa !143
  store %struct.Cache2_Item* %I.0182.lcssa, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !140
  store %struct.Cache2_Item* %I.0179, %struct.Cache2_Item** %next, align 8, !tbaa !143
  br label %return

while.end.loopexit:                               ; preds = %while.cond
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %if.then
  %call = tail call %"struct.std::__detail::_List_node_base"* @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE5beginEv(%"class.std::list"* @HeapAllocationList) #2
  %coerce.dive = getelementptr %"struct.std::_List_iterator"* %__begin, i64 0, i32 0
  store %"struct.std::__detail::_List_node_base"* %call, %"struct.std::__detail::_List_node_base"** %coerce.dive, align 8
  %call46 = tail call %"struct.std::__detail::_List_node_base"* @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE3endEv(%"class.std::list"* @HeapAllocationList) #2
  %coerce.dive47 = getelementptr %"struct.std::_List_iterator"* %__end, i64 0, i32 0
  store %"struct.std::__detail::_List_node_base"* %call46, %"struct.std::__detail::_List_node_base"** %coerce.dive47, align 8
  %call48178 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__begin, %"struct.std::_List_iterator"* dereferenceable(8) %__end)
  br i1 %call48178, label %for.body.preheader, label %if.end96

for.body.preheader:                               ; preds = %while.end
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %call50 = call dereferenceable(8) %struct.HeapAllocationMeta** @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEdeEv(%"struct.std::_List_iterator"* %__begin)
  %16 = load %struct.HeapAllocationMeta** %call50, align 8, !tbaa !114
  %ptr51 = getelementptr inbounds %struct.HeapAllocationMeta* %16, i64 0, i32 0
  %17 = load i8** %ptr51, align 8, !tbaa !120
  %cmp52 = icmp eq i8* %17, %AtAddress
  br i1 %cmp52, label %if.then53, label %if.else69

if.then53:                                        ; preds = %for.body
  %.lcssa = phi %struct.HeapAllocationMeta* [ %16, %for.body ]
  %call50.lcssa = phi %struct.HeapAllocationMeta** [ %call50, %for.body ]
  %conv54 = zext i8 %AccessType to i32
  switch i32 %conv54, label %return_2 [
    i32 2, label %sw.bb55
    i32 1, label %sw.bb61
  ]

sw.bb55:                                          ; preds = %if.then53
  %heapindex56 = getelementptr inbounds %struct.HeapAllocationMeta* %.lcssa, i64 0, i32 3
  %18 = load i32* %heapindex56, align 4, !tbaa !189
  %idxprom57 = zext i32 %18 to i64
  %r59 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom57, i32 1
  %19 = load i64* %r59, align 8, !tbaa !208
  %inc60 = add i64 %19, 1
  store i64 %inc60, i64* %r59, align 8, !tbaa !208
  br label %return_2

sw.bb61:                                          ; preds = %if.then53
  %heapindex62 = getelementptr inbounds %struct.HeapAllocationMeta* %.lcssa, i64 0, i32 3
  %20 = load i32* %heapindex62, align 4, !tbaa !189
  %idxprom63 = zext i32 %20 to i64
  %w65 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom63, i32 2
  %21 = load i64* %w65, align 16, !tbaa !209
  %inc66 = add i64 %21, 1
  store i64 %inc66, i64* %w65, align 16, !tbaa !209
  br label %return_2

if.else69:                                        ; preds = %for.body
  %cmp71 = icmp ugt i8* %17, %AtAddress
  br i1 %cmp71, label %for.inc, label %if.else73

if.else73:                                        ; preds = %if.else69
  %upperbound74 = getelementptr inbounds %struct.HeapAllocationMeta* %16, i64 0, i32 1
  %22 = load i8** %upperbound74, align 8, !tbaa !187
  %cmp75 = icmp ugt i8* %22, %AtAddress
  br i1 %cmp75, label %if.then76, label %for.inc

if.then76:                                        ; preds = %if.else73
  %.lcssa202 = phi %struct.HeapAllocationMeta* [ %16, %if.else73 ]
  %call50.lcssa199 = phi %struct.HeapAllocationMeta** [ %call50, %if.else73 ]
  %conv77 = zext i8 %AccessType to i32
  switch i32 %conv77, label %return_2 [
    i32 2, label %sw.bb78
    i32 1, label %sw.bb84
  ]

sw.bb78:                                          ; preds = %if.then76
  %heapindex79 = getelementptr inbounds %struct.HeapAllocationMeta* %.lcssa202, i64 0, i32 3
  %23 = load i32* %heapindex79, align 4, !tbaa !189
  %idxprom80 = zext i32 %23 to i64
  %r82 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom80, i32 1
  %24 = load i64* %r82, align 8, !tbaa !208
  %inc83 = add i64 %24, 1
  store i64 %inc83, i64* %r82, align 8, !tbaa !208
  br label %return_2

sw.bb84:                                          ; preds = %if.then76
  %heapindex85 = getelementptr inbounds %struct.HeapAllocationMeta* %.lcssa202, i64 0, i32 3
  %25 = load i32* %heapindex85, align 4, !tbaa !189
  %idxprom86 = zext i32 %25 to i64
  %w88 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom86, i32 2
  %26 = load i64* %w88, align 16, !tbaa !209
  %inc89 = add i64 %26, 1
  store i64 %inc89, i64* %w88, align 16, !tbaa !209
  br label %return_2

for.inc:                                          ; preds = %if.else73, %if.else69
  %call95 = call dereferenceable(8) %"struct.std::_List_iterator"* @_ZNSt14_List_iteratorIP18HeapAllocationMetaEppEv(%"struct.std::_List_iterator"* %__begin)
  %call48 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__begin, %"struct.std::_List_iterator"* dereferenceable(8) %__end)
  br i1 %call48, label %for.body, label %if.end96.loopexit

if.end96.loopexit:                                ; preds = %for.inc
  br label %if.end96

if.end96:                                         ; preds = %if.end96.loopexit, %while.end, %entry
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %27 = load i64* %SearchMiss, align 8, !tbaa !207
  %inc99 = add i64 %27, 1
  store i64 %inc99, i64* %SearchMiss, align 8, !tbaa !207
  br label %return

return_2:                                         ; preds = %sw.bb84, %sw.bb78, %if.then76, %sw.bb61, %sw.bb55, %if.then53
  %call50201 = phi %struct.HeapAllocationMeta** [ %call50.lcssa199, %sw.bb78 ], [ %call50.lcssa199, %sw.bb84 ], [ %call50.lcssa199, %if.then76 ], [ %call50.lcssa, %sw.bb55 ], [ %call50.lcssa, %sw.bb61 ], [ %call50.lcssa, %if.then53 ]
  %loopptr.0 = load %struct.HeapAllocationMeta** %call50201, align 8
  %Cache_Miss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 15
  %28 = load i64* %Cache_Miss, align 8, !tbaa !206
  %inc102 = add i64 %28, 1
  store i64 %inc102, i64* %Cache_Miss, align 8, !tbaa !206
  %29 = load %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !140
  br label %while.cond109

while.cond109:                                    ; preds = %while.cond109, %return_2
  %previous104.0 = phi %struct.Cache2_Item* [ undef, %return_2 ], [ %I105.0, %while.cond109 ]
  %I105.0 = phi %struct.Cache2_Item* [ %29, %return_2 ], [ %30, %while.cond109 ]
  %next110 = getelementptr inbounds %struct.Cache2_Item* %I105.0, i64 0, i32 1
  %30 = load %struct.Cache2_Item** %next110, align 8, !tbaa !143
  %cmp111 = icmp eq %struct.Cache2_Item* %30, null
  br i1 %cmp111, label %while.end114, label %while.cond109

while.end114:                                     ; preds = %while.cond109
  %next110.lcssa = phi %struct.Cache2_Item** [ %next110, %while.cond109 ]
  %I105.0.lcssa = phi %struct.Cache2_Item* [ %I105.0, %while.cond109 ]
  %previous104.0.lcssa = phi %struct.Cache2_Item* [ %previous104.0, %while.cond109 ]
  %next115 = getelementptr inbounds %struct.Cache2_Item* %previous104.0.lcssa, i64 0, i32 1
  store %struct.Cache2_Item* null, %struct.Cache2_Item** %next115, align 8, !tbaa !143
  store %struct.Cache2_Item* %I105.0.lcssa, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !140
  store %struct.Cache2_Item* %29, %struct.Cache2_Item** %next110.lcssa, align 8, !tbaa !143
  %ptr129 = getelementptr inbounds %struct.Cache2_Item* %I105.0.lcssa, i64 0, i32 0
  store %struct.HeapAllocationMeta* %loopptr.0, %struct.HeapAllocationMeta** %ptr129, align 8, !tbaa !141
  br label %return

return:                                           ; preds = %while.end114, %if.end96, %if.else, %sw.epilog
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_STonly(i8* readnone %AtAddress, i8 zeroext %AccessType, i32 %thdnumber, %struct.sdmprofile__Allocated_Stack_item* %ptr) #3 {
entry:
  %idxprom = zext i32 %thdnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !203
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !203
  %Stack_allocations_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 4
  %1 = load %struct.sdmprofile__Allocated_Stack_item** %Stack_allocations_head, align 8, !tbaa !148
  %loopptr.065 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %ptr, i64 -1
  %cmp66 = icmp ult %struct.sdmprofile__Allocated_Stack_item* %loopptr.065, %1
  br i1 %cmp66, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.cond.backedge, %while.body.preheader
  %2 = phi %struct.sdmprofile__Allocated_Stack_item* [ %loopptr.068, %while.cond.backedge ], [ %ptr, %while.body.preheader ]
  %loopptr.068 = phi %struct.sdmprofile__Allocated_Stack_item* [ %loopptr.0, %while.cond.backedge ], [ %loopptr.065, %while.body.preheader ]
  %ptr3 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %2, i64 -1, i32 0
  %3 = load i8** %ptr3, align 8, !tbaa !127
  %cmp4 = icmp eq i8* %3, %AtAddress
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %.lcssa = phi %struct.sdmprofile__Allocated_Stack_item* [ %2, %while.body ]
  %conv = zext i8 %AccessType to i32
  switch i32 %conv, label %return_ [
    i32 2, label %sw.bb
    i32 1, label %sw.bb7
  ]

sw.bb:                                            ; preds = %if.then
  %stackindex = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %.lcssa, i64 -1, i32 1
  %4 = load i64* %stackindex, align 8, !tbaa !210
  %r = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %4, i32 1
  %5 = load i64* %r, align 8, !tbaa !177
  %inc6 = add i64 %5, 1
  store i64 %inc6, i64* %r, align 8, !tbaa !177
  br label %return_

sw.bb7:                                           ; preds = %if.then
  %stackindex8 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %.lcssa, i64 -1, i32 1
  %6 = load i64* %stackindex8, align 8, !tbaa !210
  %w = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %6, i32 2
  %7 = load i64* %w, align 8, !tbaa !178
  %inc10 = add i64 %7, 1
  store i64 %inc10, i64* %w, align 8, !tbaa !178
  br label %return_

if.else:                                          ; preds = %while.body
  %cmp12 = icmp ugt i8* %3, %AtAddress
  br i1 %cmp12, label %while.cond.backedge, label %if.else14

while.cond.backedge:                              ; preds = %if.end, %if.else
  %loopptr.0 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %2, i64 -2
  %cmp = icmp ult %struct.sdmprofile__Allocated_Stack_item* %loopptr.0, %1
  br i1 %cmp, label %while.end.loopexit, label %while.body

if.else14:                                        ; preds = %if.else
  %upperbound = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %2, i64 -1, i32 2
  %8 = load i8** %upperbound, align 8, !tbaa !129
  %9 = load i8** @sdmprofile__zeropointer, align 8, !tbaa !114
  %cmp15 = icmp eq i8* %8, %9
  br i1 %cmp15, label %if.then16, label %if.end

if.then16:                                        ; preds = %if.else14
  %10 = ptrtoint i8* %3 to i64
  %stackindex18 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %2, i64 -1, i32 1
  %11 = load i64* %stackindex18, align 8, !tbaa !210
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %11, i32 3
  %12 = load i32* %size, align 8, !tbaa !157
  %conv20 = zext i32 %12 to i64
  %add = add i64 %conv20, %10
  %13 = inttoptr i64 %add to i8*
  store i8* %13, i8** %upperbound, align 8, !tbaa !129
  br label %if.end

if.end:                                           ; preds = %if.then16, %if.else14
  %14 = phi i8* [ %13, %if.then16 ], [ %8, %if.else14 ]
  %cmp23 = icmp ugt i8* %14, %AtAddress
  br i1 %cmp23, label %if.then24, label %while.cond.backedge

if.then24:                                        ; preds = %if.end
  %.lcssa73 = phi %struct.sdmprofile__Allocated_Stack_item* [ %2, %if.end ]
  %conv25 = zext i8 %AccessType to i32
  switch i32 %conv25, label %return_ [
    i32 2, label %sw.bb26
    i32 1, label %sw.bb31
  ]

sw.bb26:                                          ; preds = %if.then24
  %stackindex27 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %.lcssa73, i64 -1, i32 1
  %15 = load i64* %stackindex27, align 8, !tbaa !210
  %r29 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %15, i32 1
  %16 = load i64* %r29, align 8, !tbaa !177
  %inc30 = add i64 %16, 1
  store i64 %inc30, i64* %r29, align 8, !tbaa !177
  br label %return_

sw.bb31:                                          ; preds = %if.then24
  %stackindex32 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %.lcssa73, i64 -1, i32 1
  %17 = load i64* %stackindex32, align 8, !tbaa !210
  %w34 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %17, i32 2
  %18 = load i64* %w34, align 8, !tbaa !178
  %inc35 = add i64 %18, 1
  store i64 %inc35, i64* %w34, align 8, !tbaa !178
  br label %return_

while.end.loopexit:                               ; preds = %while.cond.backedge
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %19 = load i64* %SearchMiss, align 8, !tbaa !207
  %inc44 = add i64 %19, 1
  store i64 %inc44, i64* %SearchMiss, align 8, !tbaa !207
  br label %return_

return_:                                          ; preds = %while.end, %sw.bb31, %sw.bb26, %if.then24, %sw.bb7, %sw.bb, %if.then
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__PrintResultBeforeAddingBBcount() #3 {
entry:
  %__begin = alloca %"struct.std::_Fwd_list_iterator", align 8
  %__end = alloca %"struct.std::_Fwd_list_iterator", align 8
  %call = tail call %struct._IO_FILE.1* @fopen(i8* getelementptr inbounds ([18 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0)) #2
  %0 = load i32* @sdmprofile__profileAction, align 4, !tbaa !118
  %.off = add i32 %0, -3
  %1 = icmp ult i32 %.off, 2
  br i1 %1, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([100 x i8]* @.str4, i64 0, i64 0), i64 99, i64 1, %struct._IO_FILE.1* %call)
  %call3 = tail call %"struct.std::_Fwd_list_node_base"* @_ZNSt12forward_listIP6GVMetaSaIS1_EE5beginEv(%"class.std::forward_list"* @GVMetalist) #2
  %coerce.dive = getelementptr %"struct.std::_Fwd_list_iterator"* %__begin, i64 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* %call3, %"struct.std::_Fwd_list_node_base"** %coerce.dive, align 8
  %call4 = tail call %"struct.std::_Fwd_list_node_base"* @_ZNSt12forward_listIP6GVMetaSaIS1_EE3endEv(%"class.std::forward_list"* @GVMetalist) #2
  %coerce.dive5 = getelementptr %"struct.std::_Fwd_list_iterator"* %__end, i64 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* %call4, %"struct.std::_Fwd_list_node_base"** %coerce.dive5, align 8
  %call686 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call686, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %if.then
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %call7 = call dereferenceable(8) %struct.GVMeta** @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEdeEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %3 = load %struct.GVMeta** %call7, align 8, !tbaa !114
  %index = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 0
  %4 = load i64* %index, align 8, !tbaa !123
  %r = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 1
  %5 = load i64* %r, align 8, !tbaa !168
  %w = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 2
  %6 = load i64* %w, align 8, !tbaa !169
  %size = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 4
  %7 = load i32* %size, align 4, !tbaa !126
  %VarName = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 5
  %8 = load i8** %VarName, align 8, !tbaa !149
  %DataTypeString = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 6
  %9 = load i8** %DataTypeString, align 8, !tbaa !150
  %call8 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call, i8* getelementptr inbounds ([23 x i8]* @.str5, i64 0, i64 0), i64 %4, i64 %5, i64 %6, i32 %7, i8* %8, i8* %9) #2
  %call9 = call dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %call6 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call6, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %if.then
  %10 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE.1* %call)
  %.pr = load i32* @sdmprofile__profileAction, align 4, !tbaa !118
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  %11 = phi i32 [ %0, %entry ], [ %.pr, %for.end ]
  switch i32 %11, label %if.end34 [
    i32 4, label %if.then14
    i32 2, label %if.then14
  ]

if.then14:                                        ; preds = %if.end, %if.end
  %12 = call i64 @fwrite(i8* getelementptr inbounds ([124 x i8]* @.str7, i64 0, i64 0), i64 123, i64 1, %struct._IO_FILE.1* %call)
  %13 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !179
  %cmp1784 = icmp eq i64 %13, 0
  br i1 %cmp1784, label %for.end32, label %for.body18.preheader

for.body18.preheader:                             ; preds = %if.then14
  br label %for.body18

for.body18:                                       ; preds = %for.body18, %for.body18.preheader
  %ix.085 = phi i64 [ %inc, %for.body18 ], [ 0, %for.body18.preheader ]
  %index19 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 0
  %14 = load i64* %index19, align 8, !tbaa !155
  %r21 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 1
  %15 = load i64* %r21, align 8, !tbaa !177
  %w23 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 2
  %16 = load i64* %w23, align 8, !tbaa !178
  %size25 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 3
  %17 = load i32* %size25, align 8, !tbaa !157
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 4
  %18 = load i8** %EstimatedName, align 8, !tbaa !158
  %DataTypeString28 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 5
  %19 = load i8** %DataTypeString28, align 8, !tbaa !159
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 6
  %20 = load i8** %FunctionName, align 8, !tbaa !160
  %call30 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call, i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i64 %14, i64 %15, i64 %16, i32 %17, i8* %18, i8* %19, i8* %20) #2
  %inc = add i64 %ix.085, 1
  %21 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !179
  %cmp17 = icmp ult i64 %inc, %21
  br i1 %cmp17, label %for.body18, label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.body18
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %if.then14
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE.1* %call)
  %.pre = load i32* @sdmprofile__profileAction, align 4, !tbaa !118
  br label %if.end34

if.end34:                                         ; preds = %for.end32, %if.end
  %23 = phi i32 [ %11, %if.end ], [ %.pre, %for.end32 ]
  switch i32 %23, label %if.end55 [
    i32 4, label %if.then38
    i32 1, label %if.then38
  ]

if.then38:                                        ; preds = %if.end34, %if.end34
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([171 x i8]* @.str9, i64 0, i64 0), i64 170, i64 1, %struct._IO_FILE.1* %call)
  %25 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !179
  %cmp4282 = icmp eq i64 %25, 0
  br i1 %cmp4282, label %for.end53, label %for.body43.preheader

for.body43.preheader:                             ; preds = %if.then38
  br label %for.body43

for.body43:                                       ; preds = %for.body43, %for.body43.preheader
  %ix40.083 = phi i64 [ %inc52, %for.body43 ], [ 0, %for.body43.preheader ]
  %arrayidx44 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083
  store %struct.HPMeta* %arrayidx44, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !114
  %index45 = getelementptr inbounds %struct.HPMeta* %arrayidx44, i64 0, i32 0
  %26 = load i32* %index45, align 16, !tbaa !161
  %r46 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 1
  %27 = load i64* %r46, align 8, !tbaa !208
  %w47 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 2
  %28 = load i64* %w47, align 16, !tbaa !209
  %EstimatedName48 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 3
  %29 = load i8** %EstimatedName48, align 8, !tbaa !163
  %EstimatedDataTypeString = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 4
  %30 = load i8** %EstimatedDataTypeString, align 16, !tbaa !164
  %FunctionName49 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 5
  %31 = load i8** %FunctionName49, align 8, !tbaa !165
  %linenumber = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 6
  %32 = load i64* %linenumber, align 16, !tbaa !166
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 7
  %33 = load i8** %SourceFile, align 8, !tbaa !167
  %hitcount = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 8
  %34 = load i64* %hitcount, align 16, !tbaa !192
  %MinSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 10
  %35 = load i64* %MinSize, align 16, !tbaa !194
  %MaxSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 9
  %36 = load i64* %MaxSize, align 8, !tbaa !193
  %call50 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call, i8* getelementptr inbounds ([43 x i8]* @.str10, i64 0, i64 0), i32 %26, i64 %27, i64 %28, i32 0, i8* %29, i8* %30, i8* %31, i64 %32, i8* %33, i64 %34, i64 %35, i64 %36) #2
  %inc52 = add i64 %ix40.083, 1
  %37 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !179
  %cmp42 = icmp ult i64 %inc52, %37
  br i1 %cmp42, label %for.body43, label %for.end53.loopexit

for.end53.loopexit:                               ; preds = %for.body43
  br label %for.end53

for.end53:                                        ; preds = %for.end53.loopexit, %if.then38
  %38 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE.1* %call)
  br label %if.end55

if.end55:                                         ; preds = %for.end53, %if.end34
  %call56 = call i32 @fclose(%struct._IO_FILE.1* %call) #2
  ret void
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE.1* @fopen(i8* nocapture readonly, i8* nocapture readonly) #1

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE.1* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE.1* nocapture) #1

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__EndProfiling_Processes() #3 {
entry:
  %errmsg = alloca [64 x i8], align 16
  %__begin = alloca %"struct.std::_Fwd_list_iterator", align 8
  %__end = alloca %"struct.std::_Fwd_list_iterator", align 8
  %typestring = alloca %"class.std::basic_string", align 8
  %ref.tmp = alloca %"class.std::allocator.6", align 1
  %ref.tmp22 = alloca i8, align 1
  %ref.tmp23 = alloca i8, align 1
  %call = tail call double @sdmprofile__getRealTime()
  store double %call, double* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 3), align 8, !tbaa !139
  %call1 = tail call %struct._IO_FILE.1* @fopen(i8* getelementptr inbounds ([18 x i8]* @.str11, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0)) #2
  %0 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str12, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE.1* %call1)
  %1 = load i64* @sdmprofile__BBcount, align 8, !tbaa !179
  %cmp167 = icmp eq i64 %1, 0
  br i1 %cmp167, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %ix.0168 = phi i64 [ %inc, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds [5000 x i64]* @BBhits, i64 0, i64 %ix.0168
  %2 = load i64* %arrayidx, align 8, !tbaa !179
  %call3 = tail call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call1, i8* getelementptr inbounds ([9 x i8]* @.str13, i64 0, i64 0), i64 %ix.0168, i64 %2) #2
  %inc = add i64 %ix.0168, 1
  %3 = load i64* @sdmprofile__BBcount, align 8, !tbaa !179
  %cmp = icmp ult i64 %inc, %3
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %4 = getelementptr inbounds [64 x i8]* %errmsg, i64 0, i64 0
  call void @llvm.lifetime.start(i64 64, i8* %4) #2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* getelementptr inbounds ([64 x i8]* @_ZZ34sdmprofile__EndProfiling_ProcessesE6errmsg, i64 0, i64 0), i64 64, i32 16, i1 false)
  %call4 = tail call %struct._IO_FILE.1* @fopen(i8* getelementptr inbounds ([21 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str15, i64 0, i64 0)) #2
  %cmp5 = icmp eq %struct._IO_FILE.1* %call4, null
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %5 = load %struct._IO_FILE.1** @stderr, align 8, !tbaa !114
  %fputs = call i32 @fputs(i8* %4, %struct._IO_FILE.1* %5) #14
  br label %cleanup

if.end:                                           ; preds = %for.end
  %6 = load i32* @sdmprofile__profileAction, align 4, !tbaa !118
  %.off = add i32 %6, -3
  %7 = icmp ult i32 %.off, 2
  br i1 %7, label %if.then9, label %if.end50

if.then9:                                         ; preds = %if.end
  %call10 = tail call %"struct.std::_Fwd_list_node_base"* @_ZNSt12forward_listIP6GVMetaSaIS1_EE5beginEv(%"class.std::forward_list"* @GVMetalist) #2
  %coerce.dive = getelementptr %"struct.std::_Fwd_list_iterator"* %__begin, i64 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* %call10, %"struct.std::_Fwd_list_node_base"** %coerce.dive, align 8
  %call11 = tail call %"struct.std::_Fwd_list_node_base"* @_ZNSt12forward_listIP6GVMetaSaIS1_EE3endEv(%"class.std::forward_list"* @GVMetalist) #2
  %coerce.dive12 = getelementptr %"struct.std::_Fwd_list_iterator"* %__end, i64 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* %call11, %"struct.std::_Fwd_list_node_base"** %coerce.dive12, align 8
  %call14162 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call14162, label %for.body15.preheader, label %for.end47

for.body15.preheader:                             ; preds = %if.then9
  br label %for.body15

for.body15:                                       ; preds = %if.end44, %for.body15.preheader
  %variable_count.0164 = phi i32 [ %inc26, %if.end44 ], [ 0, %for.body15.preheader ]
  %nv_variable_count.0163 = phi i32 [ %nv_variable_count.1, %if.end44 ], [ 0, %for.body15.preheader ]
  %call16 = call dereferenceable(8) %struct.GVMeta** @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEdeEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %8 = load %struct.GVMeta** %call16, align 8, !tbaa !114
  %DataTypeString = getelementptr inbounds %struct.GVMeta* %8, i64 0, i32 6
  %9 = load i8** %DataTypeString, align 8, !tbaa !150
  call void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* %typestring, i8* %9, %"class.std::allocator.6"* dereferenceable(1) %ref.tmp) #2
  %call17 = call i8* @_ZNSs5beginEv(%"class.std::basic_string"* %typestring) #2
  %call20 = call i8* @_ZNSs3endEv(%"class.std::basic_string"* %typestring) #2
  store i8 44, i8* %ref.tmp22, align 1, !tbaa !211
  store i8 59, i8* %ref.tmp23, align 1, !tbaa !211
  call void @_ZSt7replaceIN9__gnu_cxx17__normal_iteratorIPcSsEEcEvT_S4_RKT0_S7_(i8* %call17, i8* %call20, i8* dereferenceable(1) %ref.tmp22, i8* dereferenceable(1) %ref.tmp23)
  %inc26 = add nsw i32 %variable_count.0164, 1
  %10 = load %struct.GVMeta** %call16, align 8, !tbaa !114
  %r = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 1
  %11 = load i64* %r, align 8, !tbaa !168
  %w = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 2
  %12 = load i64* %w, align 8, !tbaa !169
  %add = add i64 %12, %11
  %conv = uitofp i64 %add to double
  %mul = fmul double %conv, 7.200000e-01
  %conv28 = uitofp i64 %11 to double
  %mul29 = fmul double %conv28, 4.000000e-01
  %conv31 = uitofp i64 %12 to double
  %mul32 = fmul double %conv31, 2.300000e+00
  %add33 = fadd double %mul29, %mul32
  %cmp34 = fcmp olt double %add33, %mul
  br i1 %cmp34, label %if.then35, label %if.end44

if.then35:                                        ; preds = %for.body15
  %linenumber = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 10
  %13 = load i64* %linenumber, align 8, !tbaa !154
  %tobool = icmp eq i64 %13, 0
  br i1 %tobool, label %if.end44, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.then35
  %FileName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 8
  %14 = load i8** %FileName, align 8, !tbaa !152
  %call36 = call i32 @strcmp(i8* %14, i8* getelementptr inbounds ([2 x i8]* @.str17, i64 0, i64 0)) #15
  %tobool37 = icmp eq i32 %call36, 0
  br i1 %tobool37, label %if.end44, label %if.then38

if.then38:                                        ; preds = %land.lhs.true
  %VarName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 5
  %15 = load i8** %VarName, align 8, !tbaa !149
  %DirName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 9
  %16 = load i8** %DirName, align 8, !tbaa !153
  %call41 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call4, i8* getelementptr inbounds ([14 x i8]* @.str18, i64 0, i64 0), i8* %15, i64 %13, i8* %16, i8* %14) #2
  %inc42 = add nsw i32 %nv_variable_count.0163, 1
  br label %if.end44

if.end44:                                         ; preds = %if.then38, %land.lhs.true, %if.then35, %for.body15
  %nv_variable_count.1 = phi i32 [ %inc42, %if.then38 ], [ %nv_variable_count.0163, %land.lhs.true ], [ %nv_variable_count.0163, %if.then35 ], [ %nv_variable_count.0163, %for.body15 ]
  call void @_ZNSsD1Ev(%"class.std::basic_string"* %typestring) #2
  %call46 = call dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %call14 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call14, label %for.body15, label %for.end47.loopexit

for.end47.loopexit:                               ; preds = %if.end44
  %nv_variable_count.1.lcssa = phi i32 [ %nv_variable_count.1, %if.end44 ]
  %inc26.lcssa = phi i32 [ %inc26, %if.end44 ]
  br label %for.end47

for.end47:                                        ; preds = %for.end47.loopexit, %if.then9
  %variable_count.0.lcssa = phi i32 [ 0, %if.then9 ], [ %inc26.lcssa, %for.end47.loopexit ]
  %nv_variable_count.0.lcssa = phi i32 [ 0, %if.then9 ], [ %nv_variable_count.1.lcssa, %for.end47.loopexit ]
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE.1* %call4)
  %call49 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call4, i8* getelementptr inbounds ([46 x i8]* @.str20, i64 0, i64 0), i32 %variable_count.0.lcssa, i32 %nv_variable_count.0.lcssa) #2
  %.pr = load i32* @sdmprofile__profileAction, align 4, !tbaa !118
  br label %if.end50

if.end50:                                         ; preds = %for.end47, %if.end
  %17 = phi i32 [ %6, %if.end ], [ %.pr, %for.end47 ]
  %nv_variable_count.2 = phi i32 [ 0, %if.end ], [ %nv_variable_count.0.lcssa, %for.end47 ]
  %variable_count.1 = phi i32 [ 0, %if.end ], [ %variable_count.0.lcssa, %for.end47 ]
  switch i32 %17, label %if.end75 [
    i32 4, label %if.then54
    i32 2, label %if.then54
  ]

if.then54:                                        ; preds = %if.end50, %if.end50
  %18 = call i64 @fwrite(i8* getelementptr inbounds ([125 x i8]* @.str21, i64 0, i64 0), i64 124, i64 1, %struct._IO_FILE.1* %call4)
  %19 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !179
  %cmp58160 = icmp eq i64 %19, 0
  br i1 %cmp58160, label %for.end73, label %for.body59.preheader

for.body59.preheader:                             ; preds = %if.then54
  br label %for.body59

for.body59:                                       ; preds = %for.body59, %for.body59.preheader
  %ix56.0161 = phi i64 [ %inc72, %for.body59 ], [ 0, %for.body59.preheader ]
  %index = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 0
  %20 = load i64* %index, align 8, !tbaa !155
  %r62 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 1
  %21 = load i64* %r62, align 8, !tbaa !177
  %w64 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 2
  %22 = load i64* %w64, align 8, !tbaa !178
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 3
  %23 = load i32* %size, align 8, !tbaa !157
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 4
  %24 = load i8** %EstimatedName, align 8, !tbaa !158
  %DataTypeString68 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 5
  %25 = load i8** %DataTypeString68, align 8, !tbaa !159
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 6
  %26 = load i8** %FunctionName, align 8, !tbaa !160
  %call70 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call4, i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i64 %20, i64 %21, i64 %22, i32 %23, i8* %24, i8* %25, i8* %26) #2
  %inc72 = add i64 %ix56.0161, 1
  %27 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !179
  %cmp58 = icmp ult i64 %inc72, %27
  br i1 %cmp58, label %for.body59, label %for.end73.loopexit

for.end73.loopexit:                               ; preds = %for.body59
  br label %for.end73

for.end73:                                        ; preds = %for.end73.loopexit, %if.then54
  %28 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE.1* %call4)
  %.pre = load i32* @sdmprofile__profileAction, align 4, !tbaa !118
  br label %if.end75

if.end75:                                         ; preds = %for.end73, %if.end50
  %29 = phi i32 [ %17, %if.end50 ], [ %.pre, %for.end73 ]
  switch i32 %29, label %if.end112 [
    i32 4, label %for.cond81.preheader
    i32 1, label %for.cond81.preheader
  ]

for.cond81.preheader:                             ; preds = %if.end75, %if.end75
  %30 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !179
  %add82154 = add i64 %30, 1
  %cmp83155 = icmp ugt i64 %add82154, 1
  br i1 %cmp83155, label %for.body84.preheader, label %for.end110

for.body84.preheader:                             ; preds = %for.cond81.preheader
  br label %for.body84

for.body84:                                       ; preds = %if.end106, %for.body84.preheader
  %31 = phi i64 [ %37, %if.end106 ], [ %30, %for.body84.preheader ]
  %ix80.0158 = phi i64 [ %inc109, %if.end106 ], [ 1, %for.body84.preheader ]
  %variable_count.2157 = phi i32 [ %inc107, %if.end106 ], [ %variable_count.1, %for.body84.preheader ]
  %nv_variable_count.3156 = phi i32 [ %nv_variable_count.4, %if.end106 ], [ %nv_variable_count.2, %for.body84.preheader ]
  %arrayidx85 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158
  store %struct.HPMeta* %arrayidx85, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !114
  %r86 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 1
  %32 = load i64* %r86, align 8, !tbaa !208
  %cmp99 = icmp eq i64 %32, 0
  br i1 %cmp99, label %if.end106, label %if.then100

if.then100:                                       ; preds = %for.body84
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 7
  %33 = load i8** %SourceFile, align 8, !tbaa !167
  %linenumber101 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 6
  %34 = load i64* %linenumber101, align 16, !tbaa !166
  %FunctionName102 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 5
  %35 = load i8** %FunctionName102, align 8, !tbaa !165
  %EstimatedName103 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 3
  %36 = load i8** %EstimatedName103, align 8, !tbaa !163
  %call104 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call4, i8* getelementptr inbounds ([14 x i8]* @.str22, i64 0, i64 0), i8* %33, i64 %34, i8* %35, i8* %36) #2
  %inc105 = add nsw i32 %nv_variable_count.3156, 1
  %.pre169 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !179
  br label %if.end106

if.end106:                                        ; preds = %if.then100, %for.body84
  %37 = phi i64 [ %.pre169, %if.then100 ], [ %31, %for.body84 ]
  %nv_variable_count.4 = phi i32 [ %inc105, %if.then100 ], [ %nv_variable_count.3156, %for.body84 ]
  %inc107 = add nsw i32 %variable_count.2157, 1
  %inc109 = add i64 %ix80.0158, 1
  %add82 = add i64 %37, 1
  %cmp83 = icmp ult i64 %inc109, %add82
  br i1 %cmp83, label %for.body84, label %for.end110.loopexit

for.end110.loopexit:                              ; preds = %if.end106
  %inc107.lcssa = phi i32 [ %inc107, %if.end106 ]
  %nv_variable_count.4.lcssa = phi i32 [ %nv_variable_count.4, %if.end106 ]
  br label %for.end110

for.end110:                                       ; preds = %for.end110.loopexit, %for.cond81.preheader
  %variable_count.2.lcssa = phi i32 [ %variable_count.1, %for.cond81.preheader ], [ %inc107.lcssa, %for.end110.loopexit ]
  %nv_variable_count.3.lcssa = phi i32 [ %nv_variable_count.2, %for.cond81.preheader ], [ %nv_variable_count.4.lcssa, %for.end110.loopexit ]
  %call111 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call4, i8* getelementptr inbounds ([65 x i8]* @.str23, i64 0, i64 0), i32 %nv_variable_count.3.lcssa, i32 %variable_count.2.lcssa) #2
  br label %if.end112

if.end112:                                        ; preds = %for.end110, %if.end75
  %call113 = call i32 @fclose(%struct._IO_FILE.1* %call4) #2
  br label %cleanup

cleanup:                                          ; preds = %if.end112, %if.then
  call void @llvm.lifetime.end(i64 64, i8* %4) #2
  ret void
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

declare void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"*, i8*, %"class.std::allocator.6"* dereferenceable(1)) #0

; Function Attrs: noinline nounwind uwtable
define linkonce_odr void @_ZSt7replaceIN9__gnu_cxx17__normal_iteratorIPcSsEEcEvT_S4_RKT0_S7_(i8* %__first.coerce, i8* %__last.coerce, i8* nocapture readonly dereferenceable(1) %__old_value, i8* nocapture readonly dereferenceable(1) %__new_value) #3 {
entry:
  %__first = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %__last = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %coerce.dive = getelementptr %"class.__gnu_cxx::__normal_iterator"* %__first, i64 0, i32 0
  store i8* %__first.coerce, i8** %coerce.dive, align 8
  %coerce.dive1 = getelementptr %"class.__gnu_cxx::__normal_iterator"* %__last, i64 0, i32 0
  store i8* %__last.coerce, i8** %coerce.dive1, align 8
  %call6 = call zeroext i1 @_ZN9__gnu_cxxneIPcSsEEbRKNS_17__normal_iteratorIT_T0_EES7_(%"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %__first, %"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %__last)
  br i1 %call6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %call2 = call dereferenceable(1) i8* @_ZNK9__gnu_cxx17__normal_iteratorIPcSsEdeEv(%"class.__gnu_cxx::__normal_iterator"* %__first)
  %0 = load i8* %call2, align 1, !tbaa !211
  %1 = load i8* %__old_value, align 1, !tbaa !211
  %cmp = icmp eq i8 %0, %1
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %2 = load i8* %__new_value, align 1, !tbaa !211
  store i8 %2, i8* %call2, align 1, !tbaa !211
  br label %for.inc

for.inc:                                          ; preds = %if.then, %for.body
  %call5 = call dereferenceable(8) %"class.__gnu_cxx::__normal_iterator"* @_ZN9__gnu_cxx17__normal_iteratorIPcSsEppEv(%"class.__gnu_cxx::__normal_iterator"* %__first)
  %call = call zeroext i1 @_ZN9__gnu_cxxneIPcSsEEbRKNS_17__normal_iteratorIT_T0_EES7_(%"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %__first, %"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %__last)
  br i1 %call, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define available_externally i8* @_ZNSs5beginEv(%"class.std::basic_string"* %this) #3 align 2 {
entry:
  %retval = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %ref.tmp = alloca i8*, align 8
  tail call void @_ZNSs7_M_leakEv(%"class.std::basic_string"* %this)
  %call = tail call i8* @_ZNKSs7_M_dataEv(%"class.std::basic_string"* %this)
  store i8* %call, i8** %ref.tmp, align 8, !tbaa !114
  call void @_ZN9__gnu_cxx17__normal_iteratorIPcSsEC2ERKS1_(%"class.__gnu_cxx::__normal_iterator"* %retval, i8** dereferenceable(8) %ref.tmp)
  %coerce.dive = getelementptr %"class.__gnu_cxx::__normal_iterator"* %retval, i64 0, i32 0
  %0 = load i8** %coerce.dive, align 8
  ret i8* %0
}

; Function Attrs: noinline nounwind uwtable
define available_externally i8* @_ZNSs3endEv(%"class.std::basic_string"* %this) #3 align 2 {
entry:
  %retval = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %ref.tmp = alloca i8*, align 8
  tail call void @_ZNSs7_M_leakEv(%"class.std::basic_string"* %this)
  %call = tail call i8* @_ZNKSs7_M_dataEv(%"class.std::basic_string"* %this)
  %call2 = tail call i64 @_ZNKSs4sizeEv(%"class.std::basic_string"* %this) #2
  %add.ptr = getelementptr inbounds i8* %call, i64 %call2
  store i8* %add.ptr, i8** %ref.tmp, align 8, !tbaa !114
  call void @_ZN9__gnu_cxx17__normal_iteratorIPcSsEC2ERKS1_(%"class.__gnu_cxx::__normal_iterator"* %retval, i8** dereferenceable(8) %ref.tmp)
  %coerce.dive = getelementptr %"class.__gnu_cxx::__normal_iterator"* %retval, i64 0, i32 0
  %0 = load i8** %coerce.dive, align 8
  ret i8* %0
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #6

; Function Attrs: noinline nounwind uwtable
define available_externally void @_ZNSsD1Ev(%"class.std::basic_string"* nocapture readonly %this) unnamed_addr #3 align 2 {
entry:
  tail call void @_ZNSsD2Ev(%"class.std::basic_string"* %this) #2
  ret void
}

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: noinline nounwind uwtable
define i32 @sdmprofile__FindThread() #3 {
entry:
  %call = tail call i64 @pthread_self() #12
  %0 = load i32* @thdsCount, align 4, !tbaa !118
  %cmp6 = icmp sgt i32 %0, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.cond:                                         ; preds = %for.body
  %1 = trunc i64 %indvars.iv.next to i32
  %cmp = icmp slt i32 %1, %0
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.body:                                         ; preds = %for.cond, %for.body.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond ], [ 0, %for.body.preheader ]
  %threadID = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %indvars.iv, i32 1
  %2 = load i64* %threadID, align 8, !tbaa !137
  %cmp1 = icmp eq i64 %2, %call
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %cmp1, label %return.loopexit, label %for.cond

for.end.loopexit:                                 ; preds = %for.cond
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %call2 = tail call i32 @_Z17RegisterNewThreadv()
  br label %return

return.loopexit:                                  ; preds = %for.body
  %indvars.iv.lcssa = phi i64 [ %indvars.iv, %for.body ]
  %3 = trunc i64 %indvars.iv.lcssa to i32
  br label %return

return:                                           ; preds = %return.loopexit, %for.end
  %retval.0 = phi i32 [ %call2, %for.end ], [ %3, %return.loopexit ]
  ret i32 %retval.0
}

; Function Attrs: nounwind readnone
declare i64 @pthread_self() #7

; Function Attrs: nounwind
declare i32 @clock_gettime(i32, %struct.timespec*) #1

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) #1

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr zeroext i1 @_ZN9__gnu_cxxneIPcSsEEbRKNS_17__normal_iteratorIT_T0_EES7_(%"class.__gnu_cxx::__normal_iterator"* readonly dereferenceable(8) %__lhs, %"class.__gnu_cxx::__normal_iterator"* readonly dereferenceable(8) %__rhs) #4 {
entry:
  %call = tail call dereferenceable(8) i8** @_ZNK9__gnu_cxx17__normal_iteratorIPcSsE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %__lhs)
  %0 = load i8** %call, align 8, !tbaa !114
  %call1 = tail call dereferenceable(8) i8** @_ZNK9__gnu_cxx17__normal_iteratorIPcSsE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %__rhs)
  %1 = load i8** %call1, align 8, !tbaa !114
  %cmp = icmp ne i8* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(1) i8* @_ZNK9__gnu_cxx17__normal_iteratorIPcSsEdeEv(%"class.__gnu_cxx::__normal_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %_M_current, align 8, !tbaa !212
  ret i8* %0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden dereferenceable(8) %"class.__gnu_cxx::__normal_iterator"* @_ZN9__gnu_cxx17__normal_iteratorIPcSsEppEv(%"class.__gnu_cxx::__normal_iterator"* %this) #3 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %_M_current, align 8, !tbaa !212
  %incdec.ptr = getelementptr inbounds i8* %0, i64 1
  store i8* %incdec.ptr, i8** %_M_current, align 8, !tbaa !212
  ret %"class.__gnu_cxx::__normal_iterator"* %this
}

; Function Attrs: noinline nounwind readnone uwtable
define linkonce_odr hidden dereferenceable(8) i8** @_ZNK9__gnu_cxx17__normal_iteratorIPcSsE4baseEv(%"class.__gnu_cxx::__normal_iterator"* readnone %this) #5 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  ret i8** %_M_current
}

; Function Attrs: noinline nounwind uwtable
define available_externally void @_ZNSs7_M_leakEv(%"class.std::basic_string"* %this) #3 align 2 {
entry:
  %call = tail call %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* @_ZNKSs6_M_repEv(%"class.std::basic_string"* %this)
  %call2 = tail call zeroext i1 @_ZNKSs4_Rep12_M_is_leakedEv(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* %call)
  br i1 %call2, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @_ZNSs12_M_leak_hardEv(%"class.std::basic_string"* %this) #2
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind readonly uwtable
define available_externally i8* @_ZNKSs7_M_dataEv(%"class.std::basic_string"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_p = getelementptr inbounds %"class.std::basic_string"* %this, i64 0, i32 0, i32 0
  %0 = load i8** %_M_p, align 8, !tbaa !214
  ret i8* %0
}

; Function Attrs: noinline nounwind readonly uwtable
define available_externally i64 @_ZNKSs4sizeEv(%"class.std::basic_string"* nocapture readonly %this) #4 align 2 {
entry:
  %call = tail call %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* @_ZNKSs6_M_repEv(%"class.std::basic_string"* %this)
  %_M_length = getelementptr inbounds %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* %call, i64 0, i32 0, i32 0
  %0 = load i64* %_M_length, align 8, !tbaa !217
  ret i64 %0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZN9__gnu_cxx17__normal_iteratorIPcSsEC2ERKS1_(%"class.__gnu_cxx::__normal_iterator"* nocapture %this, i8** nocapture readonly dereferenceable(8) %__i) unnamed_addr #3 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %__i, align 8, !tbaa !114
  store i8* %0, i8** %_M_current, align 8, !tbaa !212
  ret void
}

; Function Attrs: noinline nounwind readonly uwtable
define available_externally %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* @_ZNKSs6_M_repEv(%"class.std::basic_string"* nocapture readonly %this) #4 align 2 {
entry:
  %call = tail call i8* @_ZNKSs7_M_dataEv(%"class.std::basic_string"* %this)
  %arrayidx = getelementptr inbounds i8* %call, i64 -24
  %0 = bitcast i8* %arrayidx to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  ret %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* %0
}

; Function Attrs: noinline nounwind readonly uwtable
define available_externally zeroext i1 @_ZNKSs4_Rep12_M_is_leakedEv(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_refcount = getelementptr inbounds %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* %this, i64 0, i32 0, i32 2
  %0 = load i32* %_M_refcount, align 4, !tbaa !219
  %cmp = icmp slt i32 %0, 0
  ret i1 %cmp
}

declare void @_ZNSs12_M_leak_hardEv(%"class.std::basic_string"*) #0

; Function Attrs: noinline nounwind readnone uwtable
define linkonce_odr %struct.HeapAllocationMeta** @_ZSt11__addressofIP18HeapAllocationMetaEPT_RS2_(%struct.HeapAllocationMeta** readnone dereferenceable(8) %__r) #5 {
entry:
  ret %struct.HeapAllocationMeta** %__r
}

; Function Attrs: noinline nounwind readnone uwtable
define linkonce_odr %struct.HeapAllocationMeta** @_ZSt11__addressofIKP18HeapAllocationMetaEPT_RS3_(%struct.HeapAllocationMeta** readnone dereferenceable(8) %__r) #5 {
entry:
  ret %struct.HeapAllocationMeta** %__r
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE8_M_eraseESt14_List_iteratorIS1_E(%"class.std::list"* readnone %this, %"struct.std::__detail::_List_node_base"* %__position.coerce) #3 align 2 {
entry:
  tail call void @_ZNSt8__detail15_List_node_base9_M_unhookEv(%"struct.std::__detail::_List_node_base"* %__position.coerce) #2
  %0 = bitcast %"struct.std::__detail::_List_node_base"* %__position.coerce to %"struct.std::_List_node"*
  %1 = getelementptr inbounds %"class.std::list"* %this, i64 0, i32 0
  tail call void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE11_M_put_nodeEPSt10_List_nodeIS1_E(%"class.std::_List_base"* %1, %"struct.std::_List_node"* %0)
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt8__detail15_List_node_base9_M_unhookEv(%"struct.std::__detail::_List_node_base"*) #1

; Function Attrs: noinline nounwind readnone uwtable
define linkonce_odr hidden dereferenceable(1) %"class.std::allocator.3"* @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE21_M_get_Node_allocatorEv(%"class.std::_List_base"* readnone %this) #5 align 2 {
entry:
  %0 = bitcast %"class.std::_List_base"* %this to %"class.std::allocator.3"*
  ret %"class.std::allocator.3"* %0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE11_M_put_nodeEPSt10_List_nodeIS1_E(%"class.std::_List_base"* nocapture readnone %this, %"struct.std::_List_node"* %__p) #3 align 2 {
entry:
  %0 = bitcast %"class.std::_List_base"* %this to %"class.__gnu_cxx::new_allocator.4"*
  tail call void @_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIP18HeapAllocationMetaEE10deallocateEPS4_m(%"class.__gnu_cxx::new_allocator.4"* %0, %"struct.std::_List_node"* %__p, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIP18HeapAllocationMetaEE10deallocateEPS4_m(%"class.__gnu_cxx::new_allocator.4"* nocapture readnone %this, %"struct.std::_List_node"* %__p, i64) #3 align 2 {
entry:
  %1 = bitcast %"struct.std::_List_node"* %__p to i8*
  tail call void @_ZdlPv(i8* %1) #2
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #8

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt14_List_iteratorIP18HeapAllocationMetaEC2EPNSt8__detail15_List_node_baseE(%"struct.std::_List_iterator"* nocapture %this, %"struct.std::__detail::_List_node_base"* %__x) unnamed_addr #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_List_iterator"* %this, i64 0, i32 0
  store %"struct.std::__detail::_List_node_base"* %__x, %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !200
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE9_M_insertIJRKS1_EEEvSt14_List_iteratorIS1_EDpOT_(%"class.std::list"* %this, %"struct.std::__detail::_List_node_base"* %__position.coerce, %struct.HeapAllocationMeta** dereferenceable(8) %__args) #3 align 2 {
entry:
  %call = tail call dereferenceable(8) %struct.HeapAllocationMeta** @_ZSt7forwardIRKP18HeapAllocationMetaEOT_RNSt16remove_referenceIS4_E4typeE(%struct.HeapAllocationMeta** dereferenceable(8) %__args) #2
  %call2 = tail call %"struct.std::_List_node"* @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE14_M_create_nodeIJRKS1_EEEPSt10_List_nodeIS1_EDpOT_(%"class.std::list"* %this, %struct.HeapAllocationMeta** dereferenceable(8) %call)
  %0 = getelementptr inbounds %"struct.std::_List_node"* %call2, i64 0, i32 0
  tail call void @_ZNSt8__detail15_List_node_base7_M_hookEPS0_(%"struct.std::__detail::_List_node_base"* %0, %"struct.std::__detail::_List_node_base"* %__position.coerce) #2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden %"struct.std::_List_node"* @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE14_M_create_nodeIJRKS1_EEEPSt10_List_nodeIS1_EDpOT_(%"class.std::list"* readnone %this, %struct.HeapAllocationMeta** readonly dereferenceable(8) %__args) #3 align 2 {
entry:
  %0 = getelementptr inbounds %"class.std::list"* %this, i64 0, i32 0
  %call = tail call %"struct.std::_List_node"* @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE11_M_get_nodeEv(%"class.std::_List_base"* %0)
  %call2 = tail call dereferenceable(1) %"class.std::allocator.3"* @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE21_M_get_Node_allocatorEv(%"class.std::_List_base"* %0) #2
  %1 = bitcast %"class.std::allocator.3"* %call2 to %"class.__gnu_cxx::new_allocator.4"*
  %call3 = tail call dereferenceable(8) %struct.HeapAllocationMeta** @_ZSt7forwardIRKP18HeapAllocationMetaEOT_RNSt16remove_referenceIS4_E4typeE(%struct.HeapAllocationMeta** dereferenceable(8) %__args) #2
  tail call void @_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIP18HeapAllocationMetaEE9constructIS4_JRKS3_EEEvPT_DpOT0_(%"class.__gnu_cxx::new_allocator.4"* %1, %"struct.std::_List_node"* %call, %struct.HeapAllocationMeta** dereferenceable(8) %call3)
  ret %"struct.std::_List_node"* %call
}

; Function Attrs: noinline nounwind readnone uwtable
define linkonce_odr dereferenceable(8) %struct.HeapAllocationMeta** @_ZSt7forwardIRKP18HeapAllocationMetaEOT_RNSt16remove_referenceIS4_E4typeE(%struct.HeapAllocationMeta** readnone dereferenceable(8) %__t) #5 {
entry:
  ret %struct.HeapAllocationMeta** %__t
}

; Function Attrs: nounwind
declare void @_ZNSt8__detail15_List_node_base7_M_hookEPS0_(%"struct.std::__detail::_List_node_base"*, %"struct.std::__detail::_List_node_base"*) #1

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden noalias %"struct.std::_List_node"* @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE11_M_get_nodeEv(%"class.std::_List_base"* nocapture readnone %this) #3 align 2 {
entry:
  %0 = bitcast %"class.std::_List_base"* %this to %"class.__gnu_cxx::new_allocator.4"*
  %call = tail call %"struct.std::_List_node"* @_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIP18HeapAllocationMetaEE8allocateEmPKv(%"class.__gnu_cxx::new_allocator.4"* %0, i64 1, i8* null)
  ret %"struct.std::_List_node"* %call
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIP18HeapAllocationMetaEE9constructIS4_JRKS3_EEEvPT_DpOT0_(%"class.__gnu_cxx::new_allocator.4"* nocapture readnone %this, %"struct.std::_List_node"* %__p, %struct.HeapAllocationMeta** readonly dereferenceable(8) %__args) #3 align 2 {
entry:
  %new.isnull = icmp eq %"struct.std::_List_node"* %__p, null
  br i1 %new.isnull, label %new.cont, label %new.notnull

new.notnull:                                      ; preds = %entry
  %call = tail call dereferenceable(8) %struct.HeapAllocationMeta** @_ZSt7forwardIRKP18HeapAllocationMetaEOT_RNSt16remove_referenceIS4_E4typeE(%struct.HeapAllocationMeta** dereferenceable(8) %__args) #2
  tail call void @_ZNSt10_List_nodeIP18HeapAllocationMetaEC2IJRKS1_EEEDpOT_(%"struct.std::_List_node"* %__p, %struct.HeapAllocationMeta** dereferenceable(8) %call)
  br label %new.cont

new.cont:                                         ; preds = %new.notnull, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt10_List_nodeIP18HeapAllocationMetaEC2IJRKS1_EEEDpOT_(%"struct.std::_List_node"* nocapture %this, %struct.HeapAllocationMeta** readonly dereferenceable(8) %__args) unnamed_addr #3 align 2 {
entry:
  %0 = bitcast %"struct.std::_List_node"* %this to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 16, i32 8, i1 false)
  %_M_data = getelementptr inbounds %"struct.std::_List_node"* %this, i64 0, i32 1
  %call = tail call dereferenceable(8) %struct.HeapAllocationMeta** @_ZSt7forwardIRKP18HeapAllocationMetaEOT_RNSt16remove_referenceIS4_E4typeE(%struct.HeapAllocationMeta** dereferenceable(8) %__args) #2
  %1 = load %struct.HeapAllocationMeta** %call, align 8, !tbaa !114
  store %struct.HeapAllocationMeta* %1, %struct.HeapAllocationMeta** %_M_data, align 8, !tbaa !220
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden noalias %"struct.std::_List_node"* @_ZN9__gnu_cxx13new_allocatorISt10_List_nodeIP18HeapAllocationMetaEE8allocateEmPKv(%"class.__gnu_cxx::new_allocator.4"* nocapture readnone %this, i64 %__n, i8* nocapture readnone) #3 align 2 {
entry:
  %cmp = icmp ugt i64 %__n, 768614336404564650
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @_ZSt17__throw_bad_allocv() #16
  unreachable

if.end:                                           ; preds = %entry
  %mul = mul i64 %__n, 24
  %call2 = tail call noalias i8* @_Znwm(i64 %mul) #2
  %1 = bitcast i8* %call2 to %"struct.std::_List_node"*
  ret %"struct.std::_List_node"* %1
}

; Function Attrs: noreturn
declare void @_ZSt17__throw_bad_allocv() #9

; Function Attrs: nobuiltin
declare noalias i8* @_Znwm(i64) #10

; Function Attrs: noinline nounwind readnone uwtable
define linkonce_odr hidden %struct.GVMeta** @_ZNSt14_Fwd_list_nodeIP6GVMetaE9_M_valptrEv(%"struct.std::_Fwd_list_node"* readnone %this) #5 align 2 {
entry:
  %0 = getelementptr inbounds %"struct.std::_Fwd_list_node"* %this, i64 0, i32 1, i32 0, i64 0
  %1 = bitcast i8* %0 to %struct.GVMeta**
  ret %struct.GVMeta** %1
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt18_Fwd_list_iteratorIP6GVMetaEC2EPSt19_Fwd_list_node_base(%"struct.std::_Fwd_list_iterator"* nocapture %this, %"struct.std::_Fwd_list_node_base"* %__n) unnamed_addr #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %this, i64 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* %__n, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !174
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr %"struct.std::_Fwd_list_node_base"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE15_M_insert_afterIJRKS1_EEEPSt19_Fwd_list_node_baseSt24_Fwd_list_const_iteratorIS1_EDpOT_(%"struct.std::_Fwd_list_base"* %this, %"struct.std::_Fwd_list_node_base"* nocapture %__pos.coerce, %struct.GVMeta** dereferenceable(8) %__args) #3 align 2 {
entry:
  %call = tail call dereferenceable(8) %struct.GVMeta** @_ZSt7forwardIRKP6GVMetaEOT_RNSt16remove_referenceIS4_E4typeE(%struct.GVMeta** dereferenceable(8) %__args) #2
  %call2 = tail call %"struct.std::_Fwd_list_node"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_M_create_nodeIJRKS1_EEEPSt14_Fwd_list_nodeIS1_EDpOT_(%"struct.std::_Fwd_list_base"* %this, %struct.GVMeta** dereferenceable(8) %call)
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__pos.coerce, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !176
  %1 = getelementptr inbounds %"struct.std::_Fwd_list_node"* %call2, i64 0, i32 0
  %_M_next3 = getelementptr inbounds %"struct.std::_Fwd_list_node"* %call2, i64 0, i32 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* %0, %"struct.std::_Fwd_list_node_base"** %_M_next3, align 8, !tbaa !176
  store %"struct.std::_Fwd_list_node_base"* %1, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !176
  ret %"struct.std::_Fwd_list_node_base"* %1
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden %"struct.std::_Fwd_list_node_base"* @_ZNKSt12forward_listIP6GVMetaSaIS1_EE13cbefore_beginEv(%"class.std::forward_list"* %this) #3 align 2 {
entry:
  %retval = alloca %"struct.std::_Fwd_list_const_iterator", align 8
  %_M_head = getelementptr inbounds %"class.std::forward_list"* %this, i64 0, i32 0, i32 0, i32 0
  call void @_ZNSt24_Fwd_list_const_iteratorIP6GVMetaEC2EPKSt19_Fwd_list_node_base(%"struct.std::_Fwd_list_const_iterator"* %retval, %"struct.std::_Fwd_list_node_base"* %_M_head)
  %coerce.dive = getelementptr %"struct.std::_Fwd_list_const_iterator"* %retval, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %coerce.dive, align 8
  ret %"struct.std::_Fwd_list_node_base"* %0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt24_Fwd_list_const_iteratorIP6GVMetaEC2EPKSt19_Fwd_list_node_base(%"struct.std::_Fwd_list_const_iterator"* nocapture %this, %"struct.std::_Fwd_list_node_base"* %__n) unnamed_addr #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_Fwd_list_const_iterator"* %this, i64 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* %__n, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !222
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden %"struct.std::_Fwd_list_node"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_M_create_nodeIJRKS1_EEEPSt14_Fwd_list_nodeIS1_EDpOT_(%"struct.std::_Fwd_list_base"* %this, %struct.GVMeta** readonly dereferenceable(8) %__args) #3 align 2 {
entry:
  %__a = alloca %"class.std::allocator.0", align 1
  %call = tail call %"struct.std::_Fwd_list_node"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE11_M_get_nodeEv(%"struct.std::_Fwd_list_base"* %this)
  %new.isnull = icmp eq %"struct.std::_Fwd_list_node"* %call, null
  br i1 %new.isnull, label %new.cont, label %new.notnull

new.notnull:                                      ; preds = %entry
  %0 = bitcast %"struct.std::_Fwd_list_node"* %call to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 16, i32 8, i1 false)
  tail call void @_ZNSt14_Fwd_list_nodeIP6GVMetaEC2Ev(%"struct.std::_Fwd_list_node"* %call) #2
  br label %new.cont

new.cont:                                         ; preds = %new.notnull, %entry
  %call3 = tail call %struct.GVMeta** @_ZNSt14_Fwd_list_nodeIP6GVMetaE9_M_valptrEv(%"struct.std::_Fwd_list_node"* %call) #2
  %call4 = tail call dereferenceable(8) %struct.GVMeta** @_ZSt7forwardIRKP6GVMetaEOT_RNSt16remove_referenceIS4_E4typeE(%struct.GVMeta** dereferenceable(8) %__args) #2
  call void @_ZNSt16allocator_traitsISaIP6GVMetaEE9constructIS1_JRKS1_EEEDTcl12_S_constructfp_fp0_spclsr3stdE7forwardIT0_Efp1_EEERS2_PT_DpOS7_(%"class.std::allocator.0"* dereferenceable(1) %__a, %struct.GVMeta** %call3, %struct.GVMeta** dereferenceable(8) %call4)
  ret %"struct.std::_Fwd_list_node"* %call
}

; Function Attrs: noinline nounwind readnone uwtable
define linkonce_odr dereferenceable(8) %struct.GVMeta** @_ZSt7forwardIRKP6GVMetaEOT_RNSt16remove_referenceIS4_E4typeE(%struct.GVMeta** readnone dereferenceable(8) %__t) #5 {
entry:
  ret %struct.GVMeta** %__t
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden noalias %"struct.std::_Fwd_list_node"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE11_M_get_nodeEv(%"struct.std::_Fwd_list_base"* readnone %this) #3 align 2 {
entry:
  %call = tail call dereferenceable(1) %"class.std::allocator"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE21_M_get_Node_allocatorEv(%"struct.std::_Fwd_list_base"* %this) #2
  %call2 = tail call %"struct.std::_Fwd_list_node"* @_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIP6GVMetaEEE8allocateERS4_m(%"class.std::allocator"* dereferenceable(1) %call, i64 1)
  ret %"struct.std::_Fwd_list_node"* %call2
}

; Function Attrs: noinline nounwind readnone uwtable
define linkonce_odr hidden dereferenceable(1) %"class.std::allocator"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE21_M_get_Node_allocatorEv(%"struct.std::_Fwd_list_base"* readnone %this) #5 align 2 {
entry:
  %0 = bitcast %"struct.std::_Fwd_list_base"* %this to %"class.std::allocator"*
  ret %"class.std::allocator"* %0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt14_Fwd_list_nodeIP6GVMetaEC2Ev(%"struct.std::_Fwd_list_node"* nocapture %this) unnamed_addr #3 align 2 {
entry:
  %0 = getelementptr inbounds %"struct.std::_Fwd_list_node"* %this, i64 0, i32 0
  tail call void @_ZNSt19_Fwd_list_node_baseC2Ev(%"struct.std::_Fwd_list_node_base"* %0) #2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt16allocator_traitsISaIP6GVMetaEE9constructIS1_JRKS1_EEEDTcl12_S_constructfp_fp0_spclsr3stdE7forwardIT0_Efp1_EEERS2_PT_DpOS7_(%"class.std::allocator.0"* nocapture readnone dereferenceable(1) %__a, %struct.GVMeta** %__p, %struct.GVMeta** readonly dereferenceable(8) %__args) #3 align 2 {
entry:
  %call = tail call dereferenceable(8) %struct.GVMeta** @_ZSt7forwardIRKP6GVMetaEOT_RNSt16remove_referenceIS4_E4typeE(%struct.GVMeta** dereferenceable(8) %__args) #2
  tail call void @_ZNSt16allocator_traitsISaIP6GVMetaEE12_S_constructIS1_JRKS1_EEENSt9enable_ifIXsr18__construct_helperIT_DpT0_EE5valueEvE4typeERS2_PS8_DpOS9_(%"class.std::allocator.0"* dereferenceable(1) %__a, %struct.GVMeta** %__p, %struct.GVMeta** dereferenceable(8) %call)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt16allocator_traitsISaIP6GVMetaEE12_S_constructIS1_JRKS1_EEENSt9enable_ifIXsr18__construct_helperIT_DpT0_EE5valueEvE4typeERS2_PS8_DpOS9_(%"class.std::allocator.0"* nocapture readnone dereferenceable(1) %__a, %struct.GVMeta** %__p, %struct.GVMeta** readonly dereferenceable(8) %__args) #3 align 2 {
entry:
  %0 = bitcast %"class.std::allocator.0"* %__a to %"class.__gnu_cxx::new_allocator.1"*
  %call = tail call dereferenceable(8) %struct.GVMeta** @_ZSt7forwardIRKP6GVMetaEOT_RNSt16remove_referenceIS4_E4typeE(%struct.GVMeta** dereferenceable(8) %__args) #2
  tail call void @_ZN9__gnu_cxx13new_allocatorIP6GVMetaE9constructIS2_JRKS2_EEEvPT_DpOT0_(%"class.__gnu_cxx::new_allocator.1"* %0, %struct.GVMeta** %__p, %struct.GVMeta** dereferenceable(8) %call)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZN9__gnu_cxx13new_allocatorIP6GVMetaE9constructIS2_JRKS2_EEEvPT_DpOT0_(%"class.__gnu_cxx::new_allocator.1"* nocapture readnone %this, %struct.GVMeta** %__p, %struct.GVMeta** readonly dereferenceable(8) %__args) #3 align 2 {
entry:
  %new.isnull = icmp eq %struct.GVMeta** %__p, null
  br i1 %new.isnull, label %new.cont, label %new.notnull

new.notnull:                                      ; preds = %entry
  %call = tail call dereferenceable(8) %struct.GVMeta** @_ZSt7forwardIRKP6GVMetaEOT_RNSt16remove_referenceIS4_E4typeE(%struct.GVMeta** dereferenceable(8) %__args) #2
  %0 = load %struct.GVMeta** %call, align 8, !tbaa !114
  store %struct.GVMeta* %0, %struct.GVMeta** %__p, align 8, !tbaa !114
  br label %new.cont

new.cont:                                         ; preds = %new.notnull, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden noalias %"struct.std::_Fwd_list_node"* @_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIP6GVMetaEEE8allocateERS4_m(%"class.std::allocator"* nocapture readnone dereferenceable(1) %__a, i64 %__n) #3 align 2 {
entry:
  %0 = bitcast %"class.std::allocator"* %__a to %"class.__gnu_cxx::new_allocator"*
  %call = tail call %"struct.std::_Fwd_list_node"* @_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIP6GVMetaEE8allocateEmPKv(%"class.__gnu_cxx::new_allocator"* %0, i64 %__n, i8* null)
  ret %"struct.std::_Fwd_list_node"* %call
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden noalias %"struct.std::_Fwd_list_node"* @_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIP6GVMetaEE8allocateEmPKv(%"class.__gnu_cxx::new_allocator"* nocapture readnone %this, i64 %__n, i8* nocapture readnone) #3 align 2 {
entry:
  %cmp = icmp ugt i64 %__n, 1152921504606846975
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @_ZSt17__throw_bad_allocv() #16
  unreachable

if.end:                                           ; preds = %entry
  %mul = shl i64 %__n, 4
  %call2 = tail call noalias i8* @_Znwm(i64 %mul) #2
  %1 = bitcast i8* %call2 to %"struct.std::_Fwd_list_node"*
  ret %"struct.std::_Fwd_list_node"* %1
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EEC2Ev(%"class.std::_List_base"* %this) unnamed_addr #3 align 2 {
entry:
  %_M_impl = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0
  tail call void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE10_List_implC2Ev(%"struct.std::_List_base<HeapAllocationMeta *, std::allocator<HeapAllocationMeta *> >::_List_impl"* %_M_impl)
  tail call void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE7_M_initEv(%"class.std::_List_base"* %this)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE10_List_implC2Ev(%"struct.std::_List_base<HeapAllocationMeta *, std::allocator<HeapAllocationMeta *> >::_List_impl"* nocapture %this) unnamed_addr #3 align 2 {
entry:
  %0 = bitcast %"struct.std::_List_base<HeapAllocationMeta *, std::allocator<HeapAllocationMeta *> >::_List_impl"* %this to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 16, i32 8, i1 false)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE7_M_initEv(%"class.std::_List_base"* %this) #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0
  %_M_next = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0, i32 0
  store %"struct.std::__detail::_List_node_base"* %_M_node, %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !196
  %_M_prev = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0, i32 1
  store %"struct.std::__detail::_List_node_base"* %_M_node, %"struct.std::__detail::_List_node_base"** %_M_prev, align 8, !tbaa !224
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr %"struct.std::_Fwd_list_node_base"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_M_erase_afterEPSt19_Fwd_list_node_baseS5_(%"struct.std::_Fwd_list_base"* readnone %this, %"struct.std::_Fwd_list_node_base"* nocapture %__pos, %"struct.std::_Fwd_list_node_base"* %__last) #3 align 2 {
entry:
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__pos, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !176
  %cmp12 = icmp eq %"struct.std::_Fwd_list_node_base"* %0, %__last
  br i1 %cmp12, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.preheader
  %__curr.0.in13 = phi %"struct.std::_Fwd_list_node_base"* [ %1, %while.body ], [ %0, %while.body.preheader ]
  %__curr.0 = bitcast %"struct.std::_Fwd_list_node_base"* %__curr.0.in13 to %"struct.std::_Fwd_list_node"*
  %_M_next2 = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__curr.0.in13, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_next2, align 8, !tbaa !176
  tail call void @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE11_M_put_nodeEPSt14_Fwd_list_nodeIS1_E(%"struct.std::_Fwd_list_base"* %this, %"struct.std::_Fwd_list_node"* %__curr.0)
  %cmp = icmp eq %"struct.std::_Fwd_list_node_base"* %1, %__last
  br i1 %cmp, label %while.end.loopexit, label %while.body

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  store %"struct.std::_Fwd_list_node_base"* %__last, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !176
  ret %"struct.std::_Fwd_list_node_base"* %__last
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE11_M_put_nodeEPSt14_Fwd_list_nodeIS1_E(%"struct.std::_Fwd_list_base"* readnone %this, %"struct.std::_Fwd_list_node"* %__p) #3 align 2 {
entry:
  %call = tail call dereferenceable(1) %"class.std::allocator"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE21_M_get_Node_allocatorEv(%"struct.std::_Fwd_list_base"* %this) #2
  tail call void @_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIP6GVMetaEEE10deallocateERS4_PS3_m(%"class.std::allocator"* dereferenceable(1) %call, %"struct.std::_Fwd_list_node"* %__p, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIP6GVMetaEEE10deallocateERS4_PS3_m(%"class.std::allocator"* nocapture readnone dereferenceable(1) %__a, %"struct.std::_Fwd_list_node"* %__p, i64 %__n) #3 align 2 {
entry:
  %0 = bitcast %"class.std::allocator"* %__a to %"class.__gnu_cxx::new_allocator"*
  tail call void @_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIP6GVMetaEE10deallocateEPS4_m(%"class.__gnu_cxx::new_allocator"* %0, %"struct.std::_Fwd_list_node"* %__p, i64 %__n)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIP6GVMetaEE10deallocateEPS4_m(%"class.__gnu_cxx::new_allocator"* nocapture readnone %this, %"struct.std::_Fwd_list_node"* %__p, i64) #3 align 2 {
entry:
  %1 = bitcast %"struct.std::_Fwd_list_node"* %__p to i8*
  tail call void @_ZdlPv(i8* %1) #2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EEC2ERKSaISt14_Fwd_list_nodeIS1_EE(%"struct.std::_Fwd_list_base"* nocapture %this, %"class.std::allocator"* nocapture readnone dereferenceable(1) %__a) unnamed_addr #3 align 2 {
entry:
  %_M_impl = getelementptr inbounds %"struct.std::_Fwd_list_base"* %this, i64 0, i32 0
  tail call void @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_Fwd_list_implC2ERKSaISt14_Fwd_list_nodeIS1_EE(%"struct.std::_Fwd_list_base<GVMeta *, std::allocator<GVMeta *> >::_Fwd_list_impl"* %_M_impl, %"class.std::allocator"* dereferenceable(1) %__a)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_Fwd_list_implC2ERKSaISt14_Fwd_list_nodeIS1_EE(%"struct.std::_Fwd_list_base<GVMeta *, std::allocator<GVMeta *> >::_Fwd_list_impl"* nocapture %this, %"class.std::allocator"* nocapture readnone dereferenceable(1) %__a) unnamed_addr #3 align 2 {
entry:
  %_M_head = getelementptr inbounds %"struct.std::_Fwd_list_base<GVMeta *, std::allocator<GVMeta *> >::_Fwd_list_impl"* %this, i64 0, i32 0
  %0 = getelementptr inbounds %"struct.std::_Fwd_list_base<GVMeta *, std::allocator<GVMeta *> >::_Fwd_list_impl"* %this, i64 0, i32 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* null, %"struct.std::_Fwd_list_node_base"** %0, align 8
  tail call void @_ZNSt19_Fwd_list_node_baseC2Ev(%"struct.std::_Fwd_list_node_base"* %_M_head) #2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZNSt19_Fwd_list_node_baseC2Ev(%"struct.std::_Fwd_list_node_base"* nocapture %this) unnamed_addr #3 align 2 {
entry:
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %this, i64 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* null, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !176
  ret void
}

; Function Attrs: noinline nounwind uwtable
define available_externally void @_ZNSsD2Ev(%"class.std::basic_string"* nocapture readonly %this) unnamed_addr #3 align 2 {
entry:
  %ref.tmp = alloca %"class.std::allocator.6", align 1
  %call = tail call %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* @_ZNKSs6_M_repEv(%"class.std::basic_string"* %this)
  call void @_ZNSs4_Rep10_M_disposeERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* %call, %"class.std::allocator.6"* dereferenceable(1) %ref.tmp)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define available_externally void @_ZNSs4_Rep10_M_disposeERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* %this, %"class.std::allocator.6"* dereferenceable(1) %__a) #3 align 2 {
entry:
  %cmp = icmp eq %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* %this, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*)
  br i1 %cmp, label %if.end5, label %if.then, !prof !225

if.then:                                          ; preds = %entry
  %_M_refcount = getelementptr inbounds %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* %this, i64 0, i32 0, i32 2
  %call2 = tail call fastcc i32 @_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii(i32* %_M_refcount)
  %cmp3 = icmp slt i32 %call2, 1
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.then
  tail call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* %this, %"class.std::allocator.6"* dereferenceable(1) %__a) #2
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii(i32* %__mem) #3 {
entry:
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call1 = tail call fastcc i32 @_ZN9__gnu_cxxL18__exchange_and_addEPVii(i32* %__mem)
  br label %return

if.else:                                          ; preds = %entry
  %call2 = tail call fastcc i32 @_ZN9__gnu_cxxL25__exchange_and_add_singleEPii(i32* %__mem)
  br label %return

return:                                           ; preds = %if.else, %if.then
  %retval.0 = phi i32 [ %call1, %if.then ], [ %call2, %if.else ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*, %"class.std::allocator.6"* dereferenceable(1)) #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @_ZN9__gnu_cxxL18__exchange_and_addEPVii(i32* %__mem) #3 {
entry:
  %.atomicdst = alloca i32, align 4
  %0 = atomicrmw volatile add i32* %__mem, i32 -1 acq_rel
  store i32 %0, i32* %.atomicdst, align 4
  %.atomicdst.0..atomicdst.0. = load volatile i32* %.atomicdst, align 4
  ret i32 %.atomicdst.0..atomicdst.0.
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @_ZN9__gnu_cxxL25__exchange_and_add_singleEPii(i32* nocapture %__mem) #3 {
entry:
  %0 = load i32* %__mem, align 4, !tbaa !118
  %add = add nsw i32 %0, -1
  store i32 %add, i32* %__mem, align 4, !tbaa !118
  ret i32 %0
}

; Function Attrs: nounwind
declare extern_weak i32 @__pthread_key_create(i32*, void (i8*)*) #1

; Function Attrs: noinline nounwind uwtable
define linkonce_odr void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE8_M_clearEv(%"class.std::_List_base"* readonly %this) #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0
  %_M_next = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !196
  %cmp8 = icmp eq %"struct.std::__detail::_List_node_base"* %0, %_M_node
  br i1 %cmp8, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.preheader
  %__cur.0.in9 = phi %"struct.std::__detail::_List_node_base"* [ %1, %while.body ], [ %0, %while.body.preheader ]
  %__cur.0 = bitcast %"struct.std::__detail::_List_node_base"* %__cur.0.in9 to %"struct.std::_List_node"*
  %_M_next4 = getelementptr inbounds %"struct.std::__detail::_List_node_base"* %__cur.0.in9, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_next4, align 8, !tbaa !202
  tail call void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE11_M_put_nodeEPSt10_List_nodeIS1_E(%"class.std::_List_base"* %this, %"struct.std::_List_node"* %__cur.0)
  %cmp = icmp eq %"struct.std::__detail::_List_node_base"* %1, %_M_node
  br i1 %cmp, label %while.end.loopexit, label %while.body

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  ret void
}

; Function Attrs: nounwind
define internal void @_GLOBAL__sub_I_pFunctions.cpp() #2 section ".text.startup" {
entry:
  %ref.tmp.i = alloca %"class.std::allocator.0", align 1
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit) #2
  %0 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* @__dso_handle) #2
  %1 = getelementptr inbounds %"class.std::allocator.0"* %ref.tmp.i, i64 0, i32 0
  call void @llvm.lifetime.start(i64 1, i8* %1)
  call void @_ZNSt12forward_listIP6GVMetaSaIS1_EEC2ERKS2_(%"class.std::forward_list"* @GVMetalist, %"class.std::allocator.0"* dereferenceable(1) %ref.tmp.i) #2
  %2 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"struct.std::_Fwd_list_base"*)* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EED2Ev to void (i8*)*), i8* bitcast (%"class.std::forward_list"* @GVMetalist to i8*), i8* @__dso_handle) #2
  call void @llvm.lifetime.end(i64 1, i8* %1)
  tail call void @_ZNSt4listIP18HeapAllocationMetaSaIS1_EEC2Ev(%"class.std::list"* @HeapAllocationList) #2
  %3 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::_List_base"*)* @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EED2Ev to void (i8*)*), i8* bitcast (%"class.std::list"* @HeapAllocationList to i8*), i8* @__dso_handle) #2
  ret void
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE.1* nocapture) #2

; Function Attrs: nounwind
declare i32 @fputs(i8* nocapture readonly, %struct._IO_FILE.1* nocapture) #2

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE.1* nocapture) #2

; Function Attrs: nounwind uwtable
define void @sha_init_original(%struct.SHA_INFO.2* %sha_info) #11 {
  %sha_info_st = alloca %struct.SHA_INFO.2*
  %thdnumber_st = alloca i32
  store %struct.SHA_INFO.2* %sha_info, %struct.SHA_INFO.2** %sha_info_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load %struct.SHA_INFO.2** %sha_info_st
  call void @sha_init(%struct.SHA_INFO.2* %2, i32 %1)
  ret void
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #12

; Function Attrs: nounwind uwtable
define void @sha_update_original(%struct.SHA_INFO.2* %sha_info, i8* %buffer, i32 %count) #11 {
  %sha_info_st = alloca %struct.SHA_INFO.2*
  %buffer_st = alloca i8*
  %count_st = alloca i32
  %thdnumber_st = alloca i32
  store %struct.SHA_INFO.2* %sha_info, %struct.SHA_INFO.2** %sha_info_st, align 8
  store i8* %buffer, i8** %buffer_st, align 8
  store i32 %count, i32* %count_st, align 4
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load %struct.SHA_INFO.2** %sha_info_st
  %3 = load i8** %buffer_st
  %4 = load i32* %count_st
  call void @sha_update(%struct.SHA_INFO.2* %2, i8* %3, i32 %4, i32 %1)
  ret void
}

; Function Attrs: nounwind uwtable
define void @sha_final_original(%struct.SHA_INFO.2* %sha_info) #11 {
  %sha_info_st = alloca %struct.SHA_INFO.2*
  %thdnumber_st = alloca i32
  store %struct.SHA_INFO.2* %sha_info, %struct.SHA_INFO.2** %sha_info_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load %struct.SHA_INFO.2** %sha_info_st
  call void @sha_final(%struct.SHA_INFO.2* %2, i32 %1)
  ret void
}

; Function Attrs: nounwind uwtable
define void @sha_stream_original(%struct.SHA_INFO.2* %sha_info, %struct._IO_FILE.1* %fin) #11 {
  %sha_info_st = alloca %struct.SHA_INFO.2*
  %fin_st = alloca %struct._IO_FILE.1*
  %thdnumber_st = alloca i32
  store %struct.SHA_INFO.2* %sha_info, %struct.SHA_INFO.2** %sha_info_st, align 8
  store %struct._IO_FILE.1* %fin, %struct._IO_FILE.1** %fin_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load %struct.SHA_INFO.2** %sha_info_st
  %3 = load %struct._IO_FILE.1** %fin_st
  call void @sha_stream(%struct.SHA_INFO.2* %2, %struct._IO_FILE.1* %3, i32 %1)
  ret void
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE.1*) #13

; Function Attrs: nounwind uwtable
define void @sha_print_original(%struct.SHA_INFO.2* %sha_info) #11 {
  %sha_info_st = alloca %struct.SHA_INFO.2*
  %thdnumber_st = alloca i32
  store %struct.SHA_INFO.2* %sha_info, %struct.SHA_INFO.2** %sha_info_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load %struct.SHA_INFO.2** %sha_info_st
  call void @sha_print(%struct.SHA_INFO.2* %2, i32 %1)
  ret void
}

declare i32 @printf(i8*, ...) #13

; Function Attrs: nounwind uwtable
define i32 @main_original(i32 %argc, i8** %argv) #11 {
  %argc_st = alloca i32
  %argv_st = alloca i8**
  %thdnumber_st = alloca i32
  store i32 %argc, i32* %argc_st, align 4
  store i8** %argv, i8*** %argv_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i32* %argc_st
  %3 = load i8*** %argv_st
  %4 = call i32 @app__mainfunction__(i32 %2, i8** %3, i32 %1)
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define internal void @byte_reverse_original(i64* %buffer, i32 %count) #11 {
  %buffer_st = alloca i64*
  %count_st = alloca i32
  %thdnumber_st = alloca i32
  store i64* %buffer, i64** %buffer_st, align 8
  store i32 %count, i32* %count_st, align 4
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i64** %buffer_st
  %3 = load i32* %count_st
  call void @byte_reverse(i64* %2, i32 %3, i32 %1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @sha_transform_original(%struct.SHA_INFO.2* %sha_info) #11 {
  %sha_info_st = alloca %struct.SHA_INFO.2*
  %thdnumber_st = alloca i32
  store %struct.SHA_INFO.2* %sha_info, %struct.SHA_INFO.2** %sha_info_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load %struct.SHA_INFO.2** %sha_info_st
  call void @sha_transform(%struct.SHA_INFO.2* %2, i32 %1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @byte_reverse(i64* %buffer, i32 %count, i32 %sdmprofile__threadnumber) #11 {
entry:
  %buffer.addr = alloca i64*, align 8
  %count.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %ct = alloca [4 x i8], align 1
  %cp = alloca i8*, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i64* %buffer, i64** %buffer.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_11, i64 1 seq_cst, !dbg !226
  call void @llvm.dbg.declare(metadata !{i64** %buffer.addr}, metadata !227), !dbg !226
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %count.addr}, metadata !228), !dbg !229
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !230), !dbg !231
  call void @llvm.dbg.declare(metadata !{[4 x i8]* %ct}, metadata !232), !dbg !236
  call void @llvm.dbg.declare(metadata !{i8** %cp}, metadata !237), !dbg !238
  %1 = load i32* %count.addr, align 4, !dbg !239
  %conv = sext i32 %1 to i64, !dbg !239
  %div = udiv i64 %conv, 8, !dbg !239
  %conv1 = trunc i64 %div to i32, !dbg !239
  store i32 %conv1, i32* %count.addr, align 4, !dbg !239
  %2 = load i64** %buffer.addr, align 8, !dbg !240
  %3 = bitcast i64* %2 to i8*, !dbg !240
  store i8* %3, i8** %cp, align 8, !dbg !240
  store i32 0, i32* %i, align 4, !dbg !241
  br label %for.cond, !dbg !241

for.cond:                                         ; preds = %for.inc, %entry
  %4 = atomicrmw add i64* @sdmprofile__BBcounter_12, i64 1 seq_cst, !dbg !243
  %5 = load i32* %i, align 4, !dbg !243
  %6 = load i32* %count.addr, align 4, !dbg !243
  %cmp = icmp slt i32 %5, %6, !dbg !243
  br i1 %cmp, label %for.body, label %for.end, !dbg !243

for.body:                                         ; preds = %for.cond
  %7 = atomicrmw add i64* @sdmprofile__BBcounter_13, i64 1 seq_cst, !dbg !246
  %8 = load i8** %cp, align 8, !dbg !246
  %arrayidx = getelementptr inbounds i8* %8, i64 0, !dbg !246
  %9 = load i32* %sdmprofile__threadnumber_st, !dbg !246
  call void @sdmprofile__SearchRoutine_HPonly(i8* %arrayidx, i8 2, i32 %9), !dbg !246
  %10 = load i8* %arrayidx, align 1, !dbg !246
  %arrayidx3 = getelementptr inbounds [4 x i8]* %ct, i32 0, i64 0, !dbg !246
  store i8 %10, i8* %arrayidx3, align 1, !dbg !246
  %11 = load i8** %cp, align 8, !dbg !248
  %arrayidx4 = getelementptr inbounds i8* %11, i64 1, !dbg !248
  %12 = load i32* %sdmprofile__threadnumber_st, !dbg !248
  call void @sdmprofile__SearchRoutine_HPonly(i8* %arrayidx4, i8 2, i32 %12), !dbg !248
  %13 = load i8* %arrayidx4, align 1, !dbg !248
  %arrayidx5 = getelementptr inbounds [4 x i8]* %ct, i32 0, i64 1, !dbg !248
  store i8 %13, i8* %arrayidx5, align 1, !dbg !248
  %14 = load i8** %cp, align 8, !dbg !249
  %arrayidx6 = getelementptr inbounds i8* %14, i64 2, !dbg !249
  %15 = load i32* %sdmprofile__threadnumber_st, !dbg !249
  call void @sdmprofile__SearchRoutine_HPonly(i8* %arrayidx6, i8 2, i32 %15), !dbg !249
  %16 = load i8* %arrayidx6, align 1, !dbg !249
  %arrayidx7 = getelementptr inbounds [4 x i8]* %ct, i32 0, i64 2, !dbg !249
  store i8 %16, i8* %arrayidx7, align 1, !dbg !249
  %17 = load i8** %cp, align 8, !dbg !250
  %arrayidx8 = getelementptr inbounds i8* %17, i64 3, !dbg !250
  %18 = load i32* %sdmprofile__threadnumber_st, !dbg !250
  call void @sdmprofile__SearchRoutine_HPonly(i8* %arrayidx8, i8 2, i32 %18), !dbg !250
  %19 = load i8* %arrayidx8, align 1, !dbg !250
  %arrayidx9 = getelementptr inbounds [4 x i8]* %ct, i32 0, i64 3, !dbg !250
  store i8 %19, i8* %arrayidx9, align 1, !dbg !250
  %arrayidx10 = getelementptr inbounds [4 x i8]* %ct, i32 0, i64 3, !dbg !251
  %20 = load i8* %arrayidx10, align 1, !dbg !251
  %21 = load i8** %cp, align 8, !dbg !251
  %arrayidx11 = getelementptr inbounds i8* %21, i64 0, !dbg !251
  %22 = load i32* %sdmprofile__threadnumber_st, !dbg !251
  call void @sdmprofile__SearchRoutine_HPonly(i8* %arrayidx11, i8 1, i32 %22), !dbg !251
  store i8 %20, i8* %arrayidx11, align 1, !dbg !251
  %arrayidx12 = getelementptr inbounds [4 x i8]* %ct, i32 0, i64 2, !dbg !252
  %23 = load i8* %arrayidx12, align 1, !dbg !252
  %24 = load i8** %cp, align 8, !dbg !252
  %arrayidx13 = getelementptr inbounds i8* %24, i64 1, !dbg !252
  %25 = load i32* %sdmprofile__threadnumber_st, !dbg !252
  call void @sdmprofile__SearchRoutine_HPonly(i8* %arrayidx13, i8 1, i32 %25), !dbg !252
  store i8 %23, i8* %arrayidx13, align 1, !dbg !252
  %arrayidx14 = getelementptr inbounds [4 x i8]* %ct, i32 0, i64 1, !dbg !253
  %26 = load i8* %arrayidx14, align 1, !dbg !253
  %27 = load i8** %cp, align 8, !dbg !253
  %arrayidx15 = getelementptr inbounds i8* %27, i64 2, !dbg !253
  %28 = load i32* %sdmprofile__threadnumber_st, !dbg !253
  call void @sdmprofile__SearchRoutine_HPonly(i8* %arrayidx15, i8 1, i32 %28), !dbg !253
  store i8 %26, i8* %arrayidx15, align 1, !dbg !253
  %arrayidx16 = getelementptr inbounds [4 x i8]* %ct, i32 0, i64 0, !dbg !254
  %29 = load i8* %arrayidx16, align 1, !dbg !254
  %30 = load i8** %cp, align 8, !dbg !254
  %arrayidx17 = getelementptr inbounds i8* %30, i64 3, !dbg !254
  %31 = load i32* %sdmprofile__threadnumber_st, !dbg !254
  call void @sdmprofile__SearchRoutine_HPonly(i8* %arrayidx17, i8 1, i32 %31), !dbg !254
  store i8 %29, i8* %arrayidx17, align 1, !dbg !254
  %32 = load i8** %cp, align 8, !dbg !255
  %add.ptr = getelementptr inbounds i8* %32, i64 8, !dbg !255
  store i8* %add.ptr, i8** %cp, align 8, !dbg !255
  br label %for.inc, !dbg !256

for.inc:                                          ; preds = %for.body
  %33 = atomicrmw add i64* @sdmprofile__BBcounter_14, i64 1 seq_cst, !dbg !257
  %34 = load i32* %i, align 4, !dbg !257
  %inc = add nsw i32 %34, 1, !dbg !257
  store i32 %inc, i32* %i, align 4, !dbg !257
  br label %for.cond, !dbg !257

for.end:                                          ; preds = %for.cond
  %35 = atomicrmw add i64* @sdmprofile__BBcounter_15, i64 1 seq_cst, !dbg !258
  ret void, !dbg !258
}

; Function Attrs: nounwind uwtable
define i32 @app__mainfunction__(i32 %argc, i8** %argv, i32 %sdmprofile__threadnumber) #11 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %fin = alloca %struct._IO_FILE.1*, align 8
  %sha_info = alloca %struct.SHA_INFO.2, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_1, i64 1 seq_cst, !dbg !259
  call void @llvm.dbg.declare(metadata !{i32* %argc.addr}, metadata !260), !dbg !259
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %argv.addr}, metadata !261), !dbg !262
  call void @llvm.dbg.declare(metadata !{%struct._IO_FILE.1** %fin}, metadata !263), !dbg !304
  call void @llvm.dbg.declare(metadata !{%struct.SHA_INFO.2* %sha_info}, metadata !305), !dbg !313
  %1 = load i32* %argc.addr, align 4, !dbg !314
  %cmp = icmp slt i32 %1, 2, !dbg !314
  br i1 %cmp, label %if.then, label %if.else, !dbg !314

if.then:                                          ; preds = %entry
  %2 = atomicrmw add i64* @sdmprofile__BBcounter_2, i64 1 seq_cst, !dbg !316
  %3 = load %struct._IO_FILE.1** @stdin, align 8, !dbg !316
  store %struct._IO_FILE.1* %3, %struct._IO_FILE.1** %fin, align 8, !dbg !316
  %4 = load %struct._IO_FILE.1** %fin, align 8, !dbg !318
  %sdmprofile__LD9 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @sha_stream(%struct.SHA_INFO.2* %sha_info, %struct._IO_FILE.1* %4, i32 %sdmprofile__LD9), !dbg !318
  %sdmprofile__LD7 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @sha_print(%struct.SHA_INFO.2* %sha_info, i32 %sdmprofile__LD7), !dbg !319
  br label %if.end6, !dbg !320

if.else:                                          ; preds = %entry
  %5 = atomicrmw add i64* @sdmprofile__BBcounter_3, i64 1 seq_cst, !dbg !321
  br label %while.cond, !dbg !321

while.cond:                                       ; preds = %if.end, %if.else
  %6 = atomicrmw add i64* @sdmprofile__BBcounter_4, i64 1 seq_cst, !dbg !323
  %7 = load i32* %argc.addr, align 4, !dbg !323
  %dec = add nsw i32 %7, -1, !dbg !323
  store i32 %dec, i32* %argc.addr, align 4, !dbg !323
  %tobool = icmp ne i32 %dec, 0, !dbg !323
  br i1 %tobool, label %while.body, label %while.end, !dbg !323

while.body:                                       ; preds = %while.cond
  %8 = atomicrmw add i64* @sdmprofile__BBcounter_5, i64 1 seq_cst, !dbg !325
  %9 = load i8*** %argv.addr, align 8, !dbg !325
  %incdec.ptr = getelementptr inbounds i8** %9, i32 1, !dbg !325
  store i8** %incdec.ptr, i8*** %argv.addr, align 8, !dbg !325
  %10 = bitcast i8** %incdec.ptr to i8*, !dbg !325
  %11 = load i32* %sdmprofile__threadnumber_st, !dbg !325
  call void @sdmprofile__SearchRoutine_HPonly(i8* %10, i8 2, i32 %11), !dbg !325
  %12 = load i8** %incdec.ptr, align 8, !dbg !325
  %call = call %struct._IO_FILE.1* @fopen(i8* %12, i8* getelementptr inbounds ([3 x i8]* @.str16, i32 0, i32 0)), !dbg !325
  store %struct._IO_FILE.1* %call, %struct._IO_FILE.1** %fin, align 8, !dbg !325
  %13 = load %struct._IO_FILE.1** %fin, align 8, !dbg !327
  %cmp1 = icmp eq %struct._IO_FILE.1* %13, null, !dbg !327
  br i1 %cmp1, label %if.then2, label %if.else4, !dbg !327

if.then2:                                         ; preds = %while.body
  %14 = atomicrmw add i64* @sdmprofile__BBcounter_6, i64 1 seq_cst, !dbg !329
  %15 = load i8*** %argv.addr, align 8, !dbg !329
  %16 = bitcast i8** %15 to i8*, !dbg !329
  %17 = load i32* %sdmprofile__threadnumber_st, !dbg !329
  call void @sdmprofile__SearchRoutine_HPonly(i8* %16, i8 2, i32 %17), !dbg !329
  %18 = load i8** %15, align 8, !dbg !329
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str127, i32 0, i32 0), i8* %18), !dbg !329
  br label %if.end, !dbg !331

if.else4:                                         ; preds = %while.body
  %19 = atomicrmw add i64* @sdmprofile__BBcounter_7, i64 1 seq_cst, !dbg !332
  %20 = load %struct._IO_FILE.1** %fin, align 8, !dbg !332
  %sdmprofile__LD8 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @sha_stream(%struct.SHA_INFO.2* %sha_info, %struct._IO_FILE.1* %20, i32 %sdmprofile__LD8), !dbg !332
  %sdmprofile__LD6 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @sha_print(%struct.SHA_INFO.2* %sha_info, i32 %sdmprofile__LD6), !dbg !334
  %21 = load %struct._IO_FILE.1** %fin, align 8, !dbg !335
  %call5 = call i32 @fclose(%struct._IO_FILE.1* %21), !dbg !335
  br label %if.end

if.end:                                           ; preds = %if.else4, %if.then2
  %22 = atomicrmw add i64* @sdmprofile__BBcounter_8, i64 1 seq_cst, !dbg !336
  br label %while.cond, !dbg !336

while.end:                                        ; preds = %while.cond
  %23 = atomicrmw add i64* @sdmprofile__BBcounter_9, i64 1 seq_cst
  br label %if.end6

if.end6:                                          ; preds = %while.end, %if.then
  %24 = atomicrmw add i64* @sdmprofile__BBcounter_10, i64 1 seq_cst, !dbg !337
  ret i32 0, !dbg !337
}

; Function Attrs: nounwind uwtable
define void @sha_final(%struct.SHA_INFO.2* %sha_info, i32 %sdmprofile__threadnumber) #11 {
entry:
  %sha_info.addr = alloca %struct.SHA_INFO.2*, align 8
  %count = alloca i32, align 4
  %lo_bit_count = alloca i64, align 8
  %hi_bit_count = alloca i64, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store %struct.SHA_INFO.2* %sha_info, %struct.SHA_INFO.2** %sha_info.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_16, i64 1 seq_cst, !dbg !338
  call void @llvm.dbg.declare(metadata !{%struct.SHA_INFO.2** %sha_info.addr}, metadata !350), !dbg !338
  call void @llvm.dbg.declare(metadata !{i32* %count}, metadata !351), !dbg !352
  call void @llvm.dbg.declare(metadata !{i64* %lo_bit_count}, metadata !353), !dbg !354
  call void @llvm.dbg.declare(metadata !{i64* %hi_bit_count}, metadata !355), !dbg !356
  %1 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !357
  %count_lo = getelementptr inbounds %struct.SHA_INFO.2* %1, i32 0, i32 1, !dbg !357
  %2 = bitcast i64* %count_lo to i8*, !dbg !357
  %3 = load i32* %sdmprofile__threadnumber_st, !dbg !357
  call void @sdmprofile__SearchRoutine_HPonly(i8* %2, i8 2, i32 %3), !dbg !357
  %4 = load i64* %count_lo, align 8, !dbg !357
  store i64 %4, i64* %lo_bit_count, align 8, !dbg !357
  %5 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !358
  %count_hi = getelementptr inbounds %struct.SHA_INFO.2* %5, i32 0, i32 2, !dbg !358
  %6 = bitcast i64* %count_hi to i8*, !dbg !358
  %7 = load i32* %sdmprofile__threadnumber_st, !dbg !358
  call void @sdmprofile__SearchRoutine_HPonly(i8* %6, i8 2, i32 %7), !dbg !358
  %8 = load i64* %count_hi, align 8, !dbg !358
  store i64 %8, i64* %hi_bit_count, align 8, !dbg !358
  %9 = load i64* %lo_bit_count, align 8, !dbg !359
  %shr = lshr i64 %9, 3, !dbg !359
  %and = and i64 %shr, 63, !dbg !359
  %conv = trunc i64 %and to i32, !dbg !359
  store i32 %conv, i32* %count, align 4, !dbg !359
  %10 = load i32* %count, align 4, !dbg !360
  %inc = add nsw i32 %10, 1, !dbg !360
  store i32 %inc, i32* %count, align 4, !dbg !360
  %idxprom = sext i32 %10 to i64, !dbg !360
  %11 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !360
  %data = getelementptr inbounds %struct.SHA_INFO.2* %11, i32 0, i32 3, !dbg !360
  %arraydecay = getelementptr inbounds [16 x i64]* %data, i32 0, i32 0, !dbg !360
  %12 = bitcast i64* %arraydecay to i8*, !dbg !360
  %arrayidx = getelementptr inbounds i8* %12, i64 %idxprom, !dbg !360
  %13 = load i32* %sdmprofile__threadnumber_st, !dbg !360
  call void @sdmprofile__SearchRoutine_HPonly(i8* %arrayidx, i8 1, i32 %13), !dbg !360
  store i8 -128, i8* %arrayidx, align 1, !dbg !360
  %14 = load i32* %count, align 4, !dbg !361
  %cmp = icmp sgt i32 %14, 56, !dbg !361
  br i1 %cmp, label %if.then, label %if.else, !dbg !361

if.then:                                          ; preds = %entry
  %15 = atomicrmw add i64* @sdmprofile__BBcounter_17, i64 1 seq_cst, !dbg !363
  %16 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !363
  %data2 = getelementptr inbounds %struct.SHA_INFO.2* %16, i32 0, i32 3, !dbg !363
  %17 = bitcast [16 x i64]* %data2 to i8*, !dbg !363
  %18 = load i32* %count, align 4, !dbg !363
  %idx.ext = sext i32 %18 to i64, !dbg !363
  %add.ptr = getelementptr inbounds i8* %17, i64 %idx.ext, !dbg !363
  %19 = load i32* %count, align 4, !dbg !363
  %sub = sub nsw i32 64, %19, !dbg !363
  %conv3 = sext i32 %sub to i64, !dbg !363
  call void @llvm.memset.p0i8.i64(i8* %add.ptr, i8 0, i64 %conv3, i32 1, i1 false), !dbg !363
  %20 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !365
  %data4 = getelementptr inbounds %struct.SHA_INFO.2* %20, i32 0, i32 3, !dbg !365
  %arraydecay5 = getelementptr inbounds [16 x i64]* %data4, i32 0, i32 0, !dbg !365
  %sdmprofile__LD3 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @byte_reverse(i64* %arraydecay5, i32 64, i32 %sdmprofile__LD3), !dbg !365
  %21 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !366
  %sdmprofile__LD12 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @sha_transform(%struct.SHA_INFO.2* %21, i32 %sdmprofile__LD12), !dbg !366
  %22 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !367
  %data6 = getelementptr inbounds %struct.SHA_INFO.2* %22, i32 0, i32 3, !dbg !367
  %23 = bitcast [16 x i64]* %data6 to i8*, !dbg !367
  call void @llvm.memset.p0i8.i64(i8* %23, i8 0, i64 56, i32 8, i1 false), !dbg !367
  br label %if.end, !dbg !368

if.else:                                          ; preds = %entry
  %24 = atomicrmw add i64* @sdmprofile__BBcounter_18, i64 1 seq_cst, !dbg !369
  %25 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !369
  %data7 = getelementptr inbounds %struct.SHA_INFO.2* %25, i32 0, i32 3, !dbg !369
  %26 = bitcast [16 x i64]* %data7 to i8*, !dbg !369
  %27 = load i32* %count, align 4, !dbg !369
  %idx.ext8 = sext i32 %27 to i64, !dbg !369
  %add.ptr9 = getelementptr inbounds i8* %26, i64 %idx.ext8, !dbg !369
  %28 = load i32* %count, align 4, !dbg !369
  %sub10 = sub nsw i32 56, %28, !dbg !369
  %conv11 = sext i32 %sub10 to i64, !dbg !369
  call void @llvm.memset.p0i8.i64(i8* %add.ptr9, i8 0, i64 %conv11, i32 1, i1 false), !dbg !369
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %29 = atomicrmw add i64* @sdmprofile__BBcounter_19, i64 1 seq_cst, !dbg !371
  %30 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !371
  %data12 = getelementptr inbounds %struct.SHA_INFO.2* %30, i32 0, i32 3, !dbg !371
  %arraydecay13 = getelementptr inbounds [16 x i64]* %data12, i32 0, i32 0, !dbg !371
  %sdmprofile__LD2 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @byte_reverse(i64* %arraydecay13, i32 64, i32 %sdmprofile__LD2), !dbg !371
  %31 = load i64* %hi_bit_count, align 8, !dbg !372
  %32 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !372
  %data14 = getelementptr inbounds %struct.SHA_INFO.2* %32, i32 0, i32 3, !dbg !372
  %arrayidx15 = getelementptr inbounds [16 x i64]* %data14, i32 0, i64 14, !dbg !372
  %33 = bitcast i64* %arrayidx15 to i8*, !dbg !372
  %34 = load i32* %sdmprofile__threadnumber_st, !dbg !372
  call void @sdmprofile__SearchRoutine_HPonly(i8* %33, i8 1, i32 %34), !dbg !372
  store i64 %31, i64* %arrayidx15, align 8, !dbg !372
  %35 = load i64* %lo_bit_count, align 8, !dbg !373
  %36 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !373
  %data16 = getelementptr inbounds %struct.SHA_INFO.2* %36, i32 0, i32 3, !dbg !373
  %arrayidx17 = getelementptr inbounds [16 x i64]* %data16, i32 0, i64 15, !dbg !373
  %37 = bitcast i64* %arrayidx17 to i8*, !dbg !373
  %38 = load i32* %sdmprofile__threadnumber_st, !dbg !373
  call void @sdmprofile__SearchRoutine_HPonly(i8* %37, i8 1, i32 %38), !dbg !373
  store i64 %35, i64* %arrayidx17, align 8, !dbg !373
  %39 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !374
  %sdmprofile__LD11 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @sha_transform(%struct.SHA_INFO.2* %39, i32 %sdmprofile__LD11), !dbg !374
  ret void, !dbg !375
}

; Function Attrs: nounwind uwtable
define void @sha_init(%struct.SHA_INFO.2* %sha_info, i32 %sdmprofile__threadnumber) #11 {
entry:
  %sha_info.addr = alloca %struct.SHA_INFO.2*, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store %struct.SHA_INFO.2* %sha_info, %struct.SHA_INFO.2** %sha_info.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_20, i64 1 seq_cst, !dbg !376
  call void @llvm.dbg.declare(metadata !{%struct.SHA_INFO.2** %sha_info.addr}, metadata !388), !dbg !376
  %1 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !389
  %digest = getelementptr inbounds %struct.SHA_INFO.2* %1, i32 0, i32 0, !dbg !389
  %arrayidx = getelementptr inbounds [5 x i64]* %digest, i32 0, i64 0, !dbg !389
  %2 = bitcast i64* %arrayidx to i8*, !dbg !389
  %3 = load i32* %sdmprofile__threadnumber_st, !dbg !389
  call void @sdmprofile__SearchRoutine_HPonly(i8* %2, i8 1, i32 %3), !dbg !389
  store i64 1732584193, i64* %arrayidx, align 8, !dbg !389
  %4 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !390
  %digest1 = getelementptr inbounds %struct.SHA_INFO.2* %4, i32 0, i32 0, !dbg !390
  %arrayidx2 = getelementptr inbounds [5 x i64]* %digest1, i32 0, i64 1, !dbg !390
  %5 = bitcast i64* %arrayidx2 to i8*, !dbg !390
  %6 = load i32* %sdmprofile__threadnumber_st, !dbg !390
  call void @sdmprofile__SearchRoutine_HPonly(i8* %5, i8 1, i32 %6), !dbg !390
  store i64 4023233417, i64* %arrayidx2, align 8, !dbg !390
  %7 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !391
  %digest3 = getelementptr inbounds %struct.SHA_INFO.2* %7, i32 0, i32 0, !dbg !391
  %arrayidx4 = getelementptr inbounds [5 x i64]* %digest3, i32 0, i64 2, !dbg !391
  %8 = bitcast i64* %arrayidx4 to i8*, !dbg !391
  %9 = load i32* %sdmprofile__threadnumber_st, !dbg !391
  call void @sdmprofile__SearchRoutine_HPonly(i8* %8, i8 1, i32 %9), !dbg !391
  store i64 2562383102, i64* %arrayidx4, align 8, !dbg !391
  %10 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !392
  %digest5 = getelementptr inbounds %struct.SHA_INFO.2* %10, i32 0, i32 0, !dbg !392
  %arrayidx6 = getelementptr inbounds [5 x i64]* %digest5, i32 0, i64 3, !dbg !392
  %11 = bitcast i64* %arrayidx6 to i8*, !dbg !392
  %12 = load i32* %sdmprofile__threadnumber_st, !dbg !392
  call void @sdmprofile__SearchRoutine_HPonly(i8* %11, i8 1, i32 %12), !dbg !392
  store i64 271733878, i64* %arrayidx6, align 8, !dbg !392
  %13 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !393
  %digest7 = getelementptr inbounds %struct.SHA_INFO.2* %13, i32 0, i32 0, !dbg !393
  %arrayidx8 = getelementptr inbounds [5 x i64]* %digest7, i32 0, i64 4, !dbg !393
  %14 = bitcast i64* %arrayidx8 to i8*, !dbg !393
  %15 = load i32* %sdmprofile__threadnumber_st, !dbg !393
  call void @sdmprofile__SearchRoutine_HPonly(i8* %14, i8 1, i32 %15), !dbg !393
  store i64 3285377520, i64* %arrayidx8, align 8, !dbg !393
  %16 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !394
  %count_lo = getelementptr inbounds %struct.SHA_INFO.2* %16, i32 0, i32 1, !dbg !394
  %17 = bitcast i64* %count_lo to i8*, !dbg !394
  %18 = load i32* %sdmprofile__threadnumber_st, !dbg !394
  call void @sdmprofile__SearchRoutine_HPonly(i8* %17, i8 1, i32 %18), !dbg !394
  store i64 0, i64* %count_lo, align 8, !dbg !394
  %19 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !395
  %count_hi = getelementptr inbounds %struct.SHA_INFO.2* %19, i32 0, i32 2, !dbg !395
  %20 = bitcast i64* %count_hi to i8*, !dbg !395
  %21 = load i32* %sdmprofile__threadnumber_st, !dbg !395
  call void @sdmprofile__SearchRoutine_HPonly(i8* %20, i8 1, i32 %21), !dbg !395
  store i64 0, i64* %count_hi, align 8, !dbg !395
  ret void, !dbg !396
}

; Function Attrs: nounwind uwtable
define void @sha_print(%struct.SHA_INFO.2* %sha_info, i32 %sdmprofile__threadnumber) #11 {
entry:
  %sha_info.addr = alloca %struct.SHA_INFO.2*, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store %struct.SHA_INFO.2* %sha_info, %struct.SHA_INFO.2** %sha_info.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_21, i64 1 seq_cst, !dbg !397
  call void @llvm.dbg.declare(metadata !{%struct.SHA_INFO.2** %sha_info.addr}, metadata !409), !dbg !397
  %1 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !410
  %digest = getelementptr inbounds %struct.SHA_INFO.2* %1, i32 0, i32 0, !dbg !410
  %arrayidx = getelementptr inbounds [5 x i64]* %digest, i32 0, i64 0, !dbg !410
  %2 = bitcast i64* %arrayidx to i8*, !dbg !410
  %3 = load i32* %sdmprofile__threadnumber_st, !dbg !410
  call void @sdmprofile__SearchRoutine_HPonly(i8* %2, i8 2, i32 %3), !dbg !410
  %4 = load i64* %arrayidx, align 8, !dbg !410
  %5 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !410
  %digest1 = getelementptr inbounds %struct.SHA_INFO.2* %5, i32 0, i32 0, !dbg !410
  %arrayidx2 = getelementptr inbounds [5 x i64]* %digest1, i32 0, i64 1, !dbg !410
  %6 = bitcast i64* %arrayidx2 to i8*, !dbg !410
  %7 = load i32* %sdmprofile__threadnumber_st, !dbg !410
  call void @sdmprofile__SearchRoutine_HPonly(i8* %6, i8 2, i32 %7), !dbg !410
  %8 = load i64* %arrayidx2, align 8, !dbg !410
  %9 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !410
  %digest3 = getelementptr inbounds %struct.SHA_INFO.2* %9, i32 0, i32 0, !dbg !410
  %arrayidx4 = getelementptr inbounds [5 x i64]* %digest3, i32 0, i64 2, !dbg !410
  %10 = bitcast i64* %arrayidx4 to i8*, !dbg !410
  %11 = load i32* %sdmprofile__threadnumber_st, !dbg !410
  call void @sdmprofile__SearchRoutine_HPonly(i8* %10, i8 2, i32 %11), !dbg !410
  %12 = load i64* %arrayidx4, align 8, !dbg !410
  %13 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !410
  %digest5 = getelementptr inbounds %struct.SHA_INFO.2* %13, i32 0, i32 0, !dbg !410
  %arrayidx6 = getelementptr inbounds [5 x i64]* %digest5, i32 0, i64 3, !dbg !410
  %14 = bitcast i64* %arrayidx6 to i8*, !dbg !410
  %15 = load i32* %sdmprofile__threadnumber_st, !dbg !410
  call void @sdmprofile__SearchRoutine_HPonly(i8* %14, i8 2, i32 %15), !dbg !410
  %16 = load i64* %arrayidx6, align 8, !dbg !410
  %17 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !410
  %digest7 = getelementptr inbounds %struct.SHA_INFO.2* %17, i32 0, i32 0, !dbg !410
  %arrayidx8 = getelementptr inbounds [5 x i64]* %digest7, i32 0, i64 4, !dbg !410
  %18 = bitcast i64* %arrayidx8 to i8*, !dbg !410
  %19 = load i32* %sdmprofile__threadnumber_st, !dbg !410
  call void @sdmprofile__SearchRoutine_HPonly(i8* %18, i8 2, i32 %19), !dbg !410
  %20 = load i64* %arrayidx8, align 8, !dbg !410
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str1, i32 0, i32 0), i64 %4, i64 %8, i64 %12, i64 %16, i64 %20), !dbg !410
  ret void, !dbg !411
}

; Function Attrs: nounwind uwtable
define void @sha_stream(%struct.SHA_INFO.2* %sha_info, %struct._IO_FILE.1* %fin, i32 %sdmprofile__threadnumber) #11 {
entry:
  %sha_info.addr = alloca %struct.SHA_INFO.2*, align 8
  %fin.addr = alloca %struct._IO_FILE.1*, align 8
  %i = alloca i32, align 4
  %data = alloca [8192 x i8], align 16
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store %struct.SHA_INFO.2* %sha_info, %struct.SHA_INFO.2** %sha_info.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_22, i64 1 seq_cst, !dbg !412
  call void @llvm.dbg.declare(metadata !{%struct.SHA_INFO.2** %sha_info.addr}, metadata !464), !dbg !412
  store %struct._IO_FILE.1* %fin, %struct._IO_FILE.1** %fin.addr, align 8
  call void @llvm.dbg.declare(metadata !{%struct._IO_FILE.1** %fin.addr}, metadata !465), !dbg !466
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !467), !dbg !468
  call void @llvm.dbg.declare(metadata !{[8192 x i8]* %data}, metadata !469), !dbg !473
  %1 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !474
  %sdmprofile__LD5 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @sha_init(%struct.SHA_INFO.2* %1, i32 %sdmprofile__LD5), !dbg !474
  br label %while.cond, !dbg !475

while.cond:                                       ; preds = %while.body, %entry
  %2 = atomicrmw add i64* @sdmprofile__BBcounter_23, i64 1 seq_cst, !dbg !476
  %arraydecay = getelementptr inbounds [8192 x i8]* %data, i32 0, i32 0, !dbg !476
  %3 = load %struct._IO_FILE.1** %fin.addr, align 8, !dbg !476
  %call = call i64 @fread(i8* %arraydecay, i64 1, i64 8192, %struct._IO_FILE.1* %3), !dbg !476
  %conv = trunc i64 %call to i32, !dbg !476
  store i32 %conv, i32* %i, align 4, !dbg !476
  %cmp = icmp sgt i32 %conv, 0, !dbg !476
  br i1 %cmp, label %while.body, label %while.end, !dbg !476

while.body:                                       ; preds = %while.cond
  %4 = atomicrmw add i64* @sdmprofile__BBcounter_24, i64 1 seq_cst, !dbg !478
  %5 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !478
  %arraydecay2 = getelementptr inbounds [8192 x i8]* %data, i32 0, i32 0, !dbg !478
  %6 = load i32* %i, align 4, !dbg !478
  %sdmprofile__LD13 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @sha_update(%struct.SHA_INFO.2* %5, i8* %arraydecay2, i32 %6, i32 %sdmprofile__LD13), !dbg !478
  br label %while.cond, !dbg !480

while.end:                                        ; preds = %while.cond
  %7 = atomicrmw add i64* @sdmprofile__BBcounter_25, i64 1 seq_cst, !dbg !481
  %8 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !481
  %sdmprofile__LD4 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @sha_final(%struct.SHA_INFO.2* %8, i32 %sdmprofile__LD4), !dbg !481
  ret void, !dbg !482
}

; Function Attrs: nounwind uwtable
define internal void @sha_transform(%struct.SHA_INFO.2* %sha_info, i32 %sdmprofile__threadnumber) #11 {
entry:
  %sha_info.addr = alloca %struct.SHA_INFO.2*, align 8
  %i = alloca i32, align 4
  %temp = alloca i64, align 8
  %A = alloca i64, align 8
  %B = alloca i64, align 8
  %C = alloca i64, align 8
  %D = alloca i64, align 8
  %E = alloca i64, align 8
  %W = alloca [80 x i64], align 16
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store %struct.SHA_INFO.2* %sha_info, %struct.SHA_INFO.2** %sha_info.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_26, i64 1 seq_cst, !dbg !483
  call void @llvm.dbg.declare(metadata !{%struct.SHA_INFO.2** %sha_info.addr}, metadata !495), !dbg !483
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !496), !dbg !497
  call void @llvm.dbg.declare(metadata !{i64* %temp}, metadata !498), !dbg !499
  call void @llvm.dbg.declare(metadata !{i64* %A}, metadata !500), !dbg !501
  call void @llvm.dbg.declare(metadata !{i64* %B}, metadata !502), !dbg !503
  call void @llvm.dbg.declare(metadata !{i64* %C}, metadata !504), !dbg !505
  call void @llvm.dbg.declare(metadata !{i64* %D}, metadata !506), !dbg !507
  call void @llvm.dbg.declare(metadata !{i64* %E}, metadata !508), !dbg !509
  call void @llvm.dbg.declare(metadata !{[80 x i64]* %W}, metadata !510), !dbg !514
  store i32 0, i32* %i, align 4, !dbg !515
  br label %for.cond, !dbg !515

for.cond:                                         ; preds = %for.inc, %entry
  %1 = atomicrmw add i64* @sdmprofile__BBcounter_27, i64 1 seq_cst, !dbg !517
  %2 = load i32* %i, align 4, !dbg !517
  %cmp = icmp slt i32 %2, 16, !dbg !517
  br i1 %cmp, label %for.body, label %for.end, !dbg !517

for.body:                                         ; preds = %for.cond
  %3 = atomicrmw add i64* @sdmprofile__BBcounter_28, i64 1 seq_cst, !dbg !520
  %4 = load i32* %i, align 4, !dbg !520
  %idxprom = sext i32 %4 to i64, !dbg !520
  %5 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !520
  %data = getelementptr inbounds %struct.SHA_INFO.2* %5, i32 0, i32 3, !dbg !520
  %arrayidx = getelementptr inbounds [16 x i64]* %data, i32 0, i64 %idxprom, !dbg !520
  %6 = bitcast i64* %arrayidx to i8*, !dbg !520
  %7 = load i32* %sdmprofile__threadnumber_st, !dbg !520
  call void @sdmprofile__SearchRoutine_HPonly(i8* %6, i8 2, i32 %7), !dbg !520
  %8 = load i64* %arrayidx, align 8, !dbg !520
  %9 = load i32* %i, align 4, !dbg !520
  %idxprom1 = sext i32 %9 to i64, !dbg !520
  %arrayidx2 = getelementptr inbounds [80 x i64]* %W, i32 0, i64 %idxprom1, !dbg !520
  store i64 %8, i64* %arrayidx2, align 8, !dbg !520
  br label %for.inc, !dbg !522

for.inc:                                          ; preds = %for.body
  %10 = atomicrmw add i64* @sdmprofile__BBcounter_29, i64 1 seq_cst, !dbg !523
  %11 = load i32* %i, align 4, !dbg !523
  %inc = add nsw i32 %11, 1, !dbg !523
  store i32 %inc, i32* %i, align 4, !dbg !523
  br label %for.cond, !dbg !523

for.end:                                          ; preds = %for.cond
  %12 = atomicrmw add i64* @sdmprofile__BBcounter_30, i64 1 seq_cst, !dbg !524
  store i32 16, i32* %i, align 4, !dbg !524
  br label %for.cond3, !dbg !524

for.cond3:                                        ; preds = %for.inc21, %for.end
  %13 = atomicrmw add i64* @sdmprofile__BBcounter_31, i64 1 seq_cst, !dbg !526
  %14 = load i32* %i, align 4, !dbg !526
  %cmp4 = icmp slt i32 %14, 80, !dbg !526
  br i1 %cmp4, label %for.body5, label %for.end23, !dbg !526

for.body5:                                        ; preds = %for.cond3
  %15 = atomicrmw add i64* @sdmprofile__BBcounter_32, i64 1 seq_cst, !dbg !529
  %16 = load i32* %i, align 4, !dbg !529
  %sub = sub nsw i32 %16, 3, !dbg !529
  %idxprom6 = sext i32 %sub to i64, !dbg !529
  %arrayidx7 = getelementptr inbounds [80 x i64]* %W, i32 0, i64 %idxprom6, !dbg !529
  %17 = load i64* %arrayidx7, align 8, !dbg !529
  %18 = load i32* %i, align 4, !dbg !529
  %sub8 = sub nsw i32 %18, 8, !dbg !529
  %idxprom9 = sext i32 %sub8 to i64, !dbg !529
  %arrayidx10 = getelementptr inbounds [80 x i64]* %W, i32 0, i64 %idxprom9, !dbg !529
  %19 = load i64* %arrayidx10, align 8, !dbg !529
  %xor = xor i64 %17, %19, !dbg !529
  %20 = load i32* %i, align 4, !dbg !529
  %sub11 = sub nsw i32 %20, 14, !dbg !529
  %idxprom12 = sext i32 %sub11 to i64, !dbg !529
  %arrayidx13 = getelementptr inbounds [80 x i64]* %W, i32 0, i64 %idxprom12, !dbg !529
  %21 = load i64* %arrayidx13, align 8, !dbg !529
  %xor14 = xor i64 %xor, %21, !dbg !529
  %22 = load i32* %i, align 4, !dbg !529
  %sub15 = sub nsw i32 %22, 16, !dbg !529
  %idxprom16 = sext i32 %sub15 to i64, !dbg !529
  %arrayidx17 = getelementptr inbounds [80 x i64]* %W, i32 0, i64 %idxprom16, !dbg !529
  %23 = load i64* %arrayidx17, align 8, !dbg !529
  %xor18 = xor i64 %xor14, %23, !dbg !529
  %24 = load i32* %i, align 4, !dbg !529
  %idxprom19 = sext i32 %24 to i64, !dbg !529
  %arrayidx20 = getelementptr inbounds [80 x i64]* %W, i32 0, i64 %idxprom19, !dbg !529
  store i64 %xor18, i64* %arrayidx20, align 8, !dbg !529
  br label %for.inc21, !dbg !531

for.inc21:                                        ; preds = %for.body5
  %25 = atomicrmw add i64* @sdmprofile__BBcounter_33, i64 1 seq_cst, !dbg !532
  %26 = load i32* %i, align 4, !dbg !532
  %inc22 = add nsw i32 %26, 1, !dbg !532
  store i32 %inc22, i32* %i, align 4, !dbg !532
  br label %for.cond3, !dbg !532

for.end23:                                        ; preds = %for.cond3
  %27 = atomicrmw add i64* @sdmprofile__BBcounter_34, i64 1 seq_cst, !dbg !533
  %28 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !533
  %digest = getelementptr inbounds %struct.SHA_INFO.2* %28, i32 0, i32 0, !dbg !533
  %arrayidx24 = getelementptr inbounds [5 x i64]* %digest, i32 0, i64 0, !dbg !533
  %29 = bitcast i64* %arrayidx24 to i8*, !dbg !533
  %30 = load i32* %sdmprofile__threadnumber_st, !dbg !533
  call void @sdmprofile__SearchRoutine_HPonly(i8* %29, i8 2, i32 %30), !dbg !533
  %31 = load i64* %arrayidx24, align 8, !dbg !533
  store i64 %31, i64* %A, align 8, !dbg !533
  %32 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !534
  %digest25 = getelementptr inbounds %struct.SHA_INFO.2* %32, i32 0, i32 0, !dbg !534
  %arrayidx26 = getelementptr inbounds [5 x i64]* %digest25, i32 0, i64 1, !dbg !534
  %33 = bitcast i64* %arrayidx26 to i8*, !dbg !534
  %34 = load i32* %sdmprofile__threadnumber_st, !dbg !534
  call void @sdmprofile__SearchRoutine_HPonly(i8* %33, i8 2, i32 %34), !dbg !534
  %35 = load i64* %arrayidx26, align 8, !dbg !534
  store i64 %35, i64* %B, align 8, !dbg !534
  %36 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !535
  %digest27 = getelementptr inbounds %struct.SHA_INFO.2* %36, i32 0, i32 0, !dbg !535
  %arrayidx28 = getelementptr inbounds [5 x i64]* %digest27, i32 0, i64 2, !dbg !535
  %37 = bitcast i64* %arrayidx28 to i8*, !dbg !535
  %38 = load i32* %sdmprofile__threadnumber_st, !dbg !535
  call void @sdmprofile__SearchRoutine_HPonly(i8* %37, i8 2, i32 %38), !dbg !535
  %39 = load i64* %arrayidx28, align 8, !dbg !535
  store i64 %39, i64* %C, align 8, !dbg !535
  %40 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !536
  %digest29 = getelementptr inbounds %struct.SHA_INFO.2* %40, i32 0, i32 0, !dbg !536
  %arrayidx30 = getelementptr inbounds [5 x i64]* %digest29, i32 0, i64 3, !dbg !536
  %41 = bitcast i64* %arrayidx30 to i8*, !dbg !536
  %42 = load i32* %sdmprofile__threadnumber_st, !dbg !536
  call void @sdmprofile__SearchRoutine_HPonly(i8* %41, i8 2, i32 %42), !dbg !536
  %43 = load i64* %arrayidx30, align 8, !dbg !536
  store i64 %43, i64* %D, align 8, !dbg !536
  %44 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !537
  %digest31 = getelementptr inbounds %struct.SHA_INFO.2* %44, i32 0, i32 0, !dbg !537
  %arrayidx32 = getelementptr inbounds [5 x i64]* %digest31, i32 0, i64 4, !dbg !537
  %45 = bitcast i64* %arrayidx32 to i8*, !dbg !537
  %46 = load i32* %sdmprofile__threadnumber_st, !dbg !537
  call void @sdmprofile__SearchRoutine_HPonly(i8* %45, i8 2, i32 %46), !dbg !537
  %47 = load i64* %arrayidx32, align 8, !dbg !537
  store i64 %47, i64* %E, align 8, !dbg !537
  store i32 0, i32* %i, align 4, !dbg !538
  br label %for.cond33, !dbg !538

for.cond33:                                       ; preds = %for.inc46, %for.end23
  %48 = atomicrmw add i64* @sdmprofile__BBcounter_35, i64 1 seq_cst, !dbg !540
  %49 = load i32* %i, align 4, !dbg !540
  %cmp34 = icmp slt i32 %49, 20, !dbg !540
  br i1 %cmp34, label %for.body35, label %for.end48, !dbg !540

for.body35:                                       ; preds = %for.cond33
  %50 = atomicrmw add i64* @sdmprofile__BBcounter_36, i64 1 seq_cst, !dbg !543
  %51 = load i64* %A, align 8, !dbg !543
  %shl = shl i64 %51, 5, !dbg !543
  %52 = load i64* %A, align 8, !dbg !543
  %shr = lshr i64 %52, 27, !dbg !543
  %or = or i64 %shl, %shr, !dbg !543
  %53 = load i64* %B, align 8, !dbg !543
  %54 = load i64* %C, align 8, !dbg !543
  %and = and i64 %53, %54, !dbg !543
  %55 = load i64* %B, align 8, !dbg !543
  %neg = xor i64 %55, -1, !dbg !543
  %56 = load i64* %D, align 8, !dbg !543
  %and36 = and i64 %neg, %56, !dbg !543
  %or37 = or i64 %and, %and36, !dbg !543
  %add = add i64 %or, %or37, !dbg !543
  %57 = load i64* %E, align 8, !dbg !543
  %add38 = add i64 %add, %57, !dbg !543
  %58 = load i32* %i, align 4, !dbg !543
  %idxprom39 = sext i32 %58 to i64, !dbg !543
  %arrayidx40 = getelementptr inbounds [80 x i64]* %W, i32 0, i64 %idxprom39, !dbg !543
  %59 = load i64* %arrayidx40, align 8, !dbg !543
  %add41 = add i64 %add38, %59, !dbg !543
  %add42 = add i64 %add41, 1518500249, !dbg !543
  store i64 %add42, i64* %temp, align 8, !dbg !543
  %60 = load i64* %D, align 8, !dbg !543
  store i64 %60, i64* %E, align 8, !dbg !543
  %61 = load i64* %C, align 8, !dbg !543
  store i64 %61, i64* %D, align 8, !dbg !543
  %62 = load i64* %B, align 8, !dbg !543
  %shl43 = shl i64 %62, 30, !dbg !543
  %63 = load i64* %B, align 8, !dbg !543
  %shr44 = lshr i64 %63, 2, !dbg !543
  %or45 = or i64 %shl43, %shr44, !dbg !543
  store i64 %or45, i64* %C, align 8, !dbg !543
  %64 = load i64* %A, align 8, !dbg !543
  store i64 %64, i64* %B, align 8, !dbg !543
  %65 = load i64* %temp, align 8, !dbg !543
  store i64 %65, i64* %A, align 8, !dbg !543
  br label %for.inc46, !dbg !545

for.inc46:                                        ; preds = %for.body35
  %66 = atomicrmw add i64* @sdmprofile__BBcounter_37, i64 1 seq_cst, !dbg !546
  %67 = load i32* %i, align 4, !dbg !546
  %inc47 = add nsw i32 %67, 1, !dbg !546
  store i32 %inc47, i32* %i, align 4, !dbg !546
  br label %for.cond33, !dbg !546

for.end48:                                        ; preds = %for.cond33
  %68 = atomicrmw add i64* @sdmprofile__BBcounter_38, i64 1 seq_cst, !dbg !547
  store i32 20, i32* %i, align 4, !dbg !547
  br label %for.cond49, !dbg !547

for.cond49:                                       ; preds = %for.inc66, %for.end48
  %69 = atomicrmw add i64* @sdmprofile__BBcounter_39, i64 1 seq_cst, !dbg !549
  %70 = load i32* %i, align 4, !dbg !549
  %cmp50 = icmp slt i32 %70, 40, !dbg !549
  br i1 %cmp50, label %for.body51, label %for.end68, !dbg !549

for.body51:                                       ; preds = %for.cond49
  %71 = atomicrmw add i64* @sdmprofile__BBcounter_40, i64 1 seq_cst, !dbg !552
  %72 = load i64* %A, align 8, !dbg !552
  %shl52 = shl i64 %72, 5, !dbg !552
  %73 = load i64* %A, align 8, !dbg !552
  %shr53 = lshr i64 %73, 27, !dbg !552
  %or54 = or i64 %shl52, %shr53, !dbg !552
  %74 = load i64* %B, align 8, !dbg !552
  %75 = load i64* %C, align 8, !dbg !552
  %xor55 = xor i64 %74, %75, !dbg !552
  %76 = load i64* %D, align 8, !dbg !552
  %xor56 = xor i64 %xor55, %76, !dbg !552
  %add57 = add i64 %or54, %xor56, !dbg !552
  %77 = load i64* %E, align 8, !dbg !552
  %add58 = add i64 %add57, %77, !dbg !552
  %78 = load i32* %i, align 4, !dbg !552
  %idxprom59 = sext i32 %78 to i64, !dbg !552
  %arrayidx60 = getelementptr inbounds [80 x i64]* %W, i32 0, i64 %idxprom59, !dbg !552
  %79 = load i64* %arrayidx60, align 8, !dbg !552
  %add61 = add i64 %add58, %79, !dbg !552
  %add62 = add i64 %add61, 1859775393, !dbg !552
  store i64 %add62, i64* %temp, align 8, !dbg !552
  %80 = load i64* %D, align 8, !dbg !552
  store i64 %80, i64* %E, align 8, !dbg !552
  %81 = load i64* %C, align 8, !dbg !552
  store i64 %81, i64* %D, align 8, !dbg !552
  %82 = load i64* %B, align 8, !dbg !552
  %shl63 = shl i64 %82, 30, !dbg !552
  %83 = load i64* %B, align 8, !dbg !552
  %shr64 = lshr i64 %83, 2, !dbg !552
  %or65 = or i64 %shl63, %shr64, !dbg !552
  store i64 %or65, i64* %C, align 8, !dbg !552
  %84 = load i64* %A, align 8, !dbg !552
  store i64 %84, i64* %B, align 8, !dbg !552
  %85 = load i64* %temp, align 8, !dbg !552
  store i64 %85, i64* %A, align 8, !dbg !552
  br label %for.inc66, !dbg !554

for.inc66:                                        ; preds = %for.body51
  %86 = atomicrmw add i64* @sdmprofile__BBcounter_41, i64 1 seq_cst, !dbg !555
  %87 = load i32* %i, align 4, !dbg !555
  %inc67 = add nsw i32 %87, 1, !dbg !555
  store i32 %inc67, i32* %i, align 4, !dbg !555
  br label %for.cond49, !dbg !555

for.end68:                                        ; preds = %for.cond49
  %88 = atomicrmw add i64* @sdmprofile__BBcounter_42, i64 1 seq_cst, !dbg !556
  store i32 40, i32* %i, align 4, !dbg !556
  br label %for.cond69, !dbg !556

for.cond69:                                       ; preds = %for.inc89, %for.end68
  %89 = atomicrmw add i64* @sdmprofile__BBcounter_43, i64 1 seq_cst, !dbg !558
  %90 = load i32* %i, align 4, !dbg !558
  %cmp70 = icmp slt i32 %90, 60, !dbg !558
  br i1 %cmp70, label %for.body71, label %for.end91, !dbg !558

for.body71:                                       ; preds = %for.cond69
  %91 = atomicrmw add i64* @sdmprofile__BBcounter_44, i64 1 seq_cst, !dbg !561
  %92 = load i64* %A, align 8, !dbg !561
  %shl72 = shl i64 %92, 5, !dbg !561
  %93 = load i64* %A, align 8, !dbg !561
  %shr73 = lshr i64 %93, 27, !dbg !561
  %or74 = or i64 %shl72, %shr73, !dbg !561
  %94 = load i64* %B, align 8, !dbg !561
  %95 = load i64* %C, align 8, !dbg !561
  %and75 = and i64 %94, %95, !dbg !561
  %96 = load i64* %B, align 8, !dbg !561
  %97 = load i64* %D, align 8, !dbg !561
  %and76 = and i64 %96, %97, !dbg !561
  %or77 = or i64 %and75, %and76, !dbg !561
  %98 = load i64* %C, align 8, !dbg !561
  %99 = load i64* %D, align 8, !dbg !561
  %and78 = and i64 %98, %99, !dbg !561
  %or79 = or i64 %or77, %and78, !dbg !561
  %add80 = add i64 %or74, %or79, !dbg !561
  %100 = load i64* %E, align 8, !dbg !561
  %add81 = add i64 %add80, %100, !dbg !561
  %101 = load i32* %i, align 4, !dbg !561
  %idxprom82 = sext i32 %101 to i64, !dbg !561
  %arrayidx83 = getelementptr inbounds [80 x i64]* %W, i32 0, i64 %idxprom82, !dbg !561
  %102 = load i64* %arrayidx83, align 8, !dbg !561
  %add84 = add i64 %add81, %102, !dbg !561
  %add85 = add i64 %add84, 2400959708, !dbg !561
  store i64 %add85, i64* %temp, align 8, !dbg !561
  %103 = load i64* %D, align 8, !dbg !561
  store i64 %103, i64* %E, align 8, !dbg !561
  %104 = load i64* %C, align 8, !dbg !561
  store i64 %104, i64* %D, align 8, !dbg !561
  %105 = load i64* %B, align 8, !dbg !561
  %shl86 = shl i64 %105, 30, !dbg !561
  %106 = load i64* %B, align 8, !dbg !561
  %shr87 = lshr i64 %106, 2, !dbg !561
  %or88 = or i64 %shl86, %shr87, !dbg !561
  store i64 %or88, i64* %C, align 8, !dbg !561
  %107 = load i64* %A, align 8, !dbg !561
  store i64 %107, i64* %B, align 8, !dbg !561
  %108 = load i64* %temp, align 8, !dbg !561
  store i64 %108, i64* %A, align 8, !dbg !561
  br label %for.inc89, !dbg !563

for.inc89:                                        ; preds = %for.body71
  %109 = atomicrmw add i64* @sdmprofile__BBcounter_45, i64 1 seq_cst, !dbg !564
  %110 = load i32* %i, align 4, !dbg !564
  %inc90 = add nsw i32 %110, 1, !dbg !564
  store i32 %inc90, i32* %i, align 4, !dbg !564
  br label %for.cond69, !dbg !564

for.end91:                                        ; preds = %for.cond69
  %111 = atomicrmw add i64* @sdmprofile__BBcounter_46, i64 1 seq_cst, !dbg !565
  store i32 60, i32* %i, align 4, !dbg !565
  br label %for.cond92, !dbg !565

for.cond92:                                       ; preds = %for.inc109, %for.end91
  %112 = atomicrmw add i64* @sdmprofile__BBcounter_47, i64 1 seq_cst, !dbg !567
  %113 = load i32* %i, align 4, !dbg !567
  %cmp93 = icmp slt i32 %113, 80, !dbg !567
  br i1 %cmp93, label %for.body94, label %for.end111, !dbg !567

for.body94:                                       ; preds = %for.cond92
  %114 = atomicrmw add i64* @sdmprofile__BBcounter_48, i64 1 seq_cst, !dbg !570
  %115 = load i64* %A, align 8, !dbg !570
  %shl95 = shl i64 %115, 5, !dbg !570
  %116 = load i64* %A, align 8, !dbg !570
  %shr96 = lshr i64 %116, 27, !dbg !570
  %or97 = or i64 %shl95, %shr96, !dbg !570
  %117 = load i64* %B, align 8, !dbg !570
  %118 = load i64* %C, align 8, !dbg !570
  %xor98 = xor i64 %117, %118, !dbg !570
  %119 = load i64* %D, align 8, !dbg !570
  %xor99 = xor i64 %xor98, %119, !dbg !570
  %add100 = add i64 %or97, %xor99, !dbg !570
  %120 = load i64* %E, align 8, !dbg !570
  %add101 = add i64 %add100, %120, !dbg !570
  %121 = load i32* %i, align 4, !dbg !570
  %idxprom102 = sext i32 %121 to i64, !dbg !570
  %arrayidx103 = getelementptr inbounds [80 x i64]* %W, i32 0, i64 %idxprom102, !dbg !570
  %122 = load i64* %arrayidx103, align 8, !dbg !570
  %add104 = add i64 %add101, %122, !dbg !570
  %add105 = add i64 %add104, 3395469782, !dbg !570
  store i64 %add105, i64* %temp, align 8, !dbg !570
  %123 = load i64* %D, align 8, !dbg !570
  store i64 %123, i64* %E, align 8, !dbg !570
  %124 = load i64* %C, align 8, !dbg !570
  store i64 %124, i64* %D, align 8, !dbg !570
  %125 = load i64* %B, align 8, !dbg !570
  %shl106 = shl i64 %125, 30, !dbg !570
  %126 = load i64* %B, align 8, !dbg !570
  %shr107 = lshr i64 %126, 2, !dbg !570
  %or108 = or i64 %shl106, %shr107, !dbg !570
  store i64 %or108, i64* %C, align 8, !dbg !570
  %127 = load i64* %A, align 8, !dbg !570
  store i64 %127, i64* %B, align 8, !dbg !570
  %128 = load i64* %temp, align 8, !dbg !570
  store i64 %128, i64* %A, align 8, !dbg !570
  br label %for.inc109, !dbg !572

for.inc109:                                       ; preds = %for.body94
  %129 = atomicrmw add i64* @sdmprofile__BBcounter_49, i64 1 seq_cst, !dbg !573
  %130 = load i32* %i, align 4, !dbg !573
  %inc110 = add nsw i32 %130, 1, !dbg !573
  store i32 %inc110, i32* %i, align 4, !dbg !573
  br label %for.cond92, !dbg !573

for.end111:                                       ; preds = %for.cond92
  %131 = atomicrmw add i64* @sdmprofile__BBcounter_50, i64 1 seq_cst, !dbg !574
  %132 = load i64* %A, align 8, !dbg !574
  %133 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !574
  %digest112 = getelementptr inbounds %struct.SHA_INFO.2* %133, i32 0, i32 0, !dbg !574
  %arrayidx113 = getelementptr inbounds [5 x i64]* %digest112, i32 0, i64 0, !dbg !574
  %134 = bitcast i64* %arrayidx113 to i8*, !dbg !574
  %135 = load i32* %sdmprofile__threadnumber_st, !dbg !574
  call void @sdmprofile__SearchRoutine_HPonly(i8* %134, i8 2, i32 %135), !dbg !574
  %136 = load i64* %arrayidx113, align 8, !dbg !574
  %add114 = add i64 %136, %132, !dbg !574
  %137 = bitcast i64* %arrayidx113 to i8*, !dbg !574
  %138 = load i32* %sdmprofile__threadnumber_st, !dbg !574
  call void @sdmprofile__SearchRoutine_HPonly(i8* %137, i8 1, i32 %138), !dbg !574
  store i64 %add114, i64* %arrayidx113, align 8, !dbg !574
  %139 = load i64* %B, align 8, !dbg !575
  %140 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !575
  %digest115 = getelementptr inbounds %struct.SHA_INFO.2* %140, i32 0, i32 0, !dbg !575
  %arrayidx116 = getelementptr inbounds [5 x i64]* %digest115, i32 0, i64 1, !dbg !575
  %141 = bitcast i64* %arrayidx116 to i8*, !dbg !575
  %142 = load i32* %sdmprofile__threadnumber_st, !dbg !575
  call void @sdmprofile__SearchRoutine_HPonly(i8* %141, i8 2, i32 %142), !dbg !575
  %143 = load i64* %arrayidx116, align 8, !dbg !575
  %add117 = add i64 %143, %139, !dbg !575
  %144 = bitcast i64* %arrayidx116 to i8*, !dbg !575
  %145 = load i32* %sdmprofile__threadnumber_st, !dbg !575
  call void @sdmprofile__SearchRoutine_HPonly(i8* %144, i8 1, i32 %145), !dbg !575
  store i64 %add117, i64* %arrayidx116, align 8, !dbg !575
  %146 = load i64* %C, align 8, !dbg !576
  %147 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !576
  %digest118 = getelementptr inbounds %struct.SHA_INFO.2* %147, i32 0, i32 0, !dbg !576
  %arrayidx119 = getelementptr inbounds [5 x i64]* %digest118, i32 0, i64 2, !dbg !576
  %148 = bitcast i64* %arrayidx119 to i8*, !dbg !576
  %149 = load i32* %sdmprofile__threadnumber_st, !dbg !576
  call void @sdmprofile__SearchRoutine_HPonly(i8* %148, i8 2, i32 %149), !dbg !576
  %150 = load i64* %arrayidx119, align 8, !dbg !576
  %add120 = add i64 %150, %146, !dbg !576
  %151 = bitcast i64* %arrayidx119 to i8*, !dbg !576
  %152 = load i32* %sdmprofile__threadnumber_st, !dbg !576
  call void @sdmprofile__SearchRoutine_HPonly(i8* %151, i8 1, i32 %152), !dbg !576
  store i64 %add120, i64* %arrayidx119, align 8, !dbg !576
  %153 = load i64* %D, align 8, !dbg !577
  %154 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !577
  %digest121 = getelementptr inbounds %struct.SHA_INFO.2* %154, i32 0, i32 0, !dbg !577
  %arrayidx122 = getelementptr inbounds [5 x i64]* %digest121, i32 0, i64 3, !dbg !577
  %155 = bitcast i64* %arrayidx122 to i8*, !dbg !577
  %156 = load i32* %sdmprofile__threadnumber_st, !dbg !577
  call void @sdmprofile__SearchRoutine_HPonly(i8* %155, i8 2, i32 %156), !dbg !577
  %157 = load i64* %arrayidx122, align 8, !dbg !577
  %add123 = add i64 %157, %153, !dbg !577
  %158 = bitcast i64* %arrayidx122 to i8*, !dbg !577
  %159 = load i32* %sdmprofile__threadnumber_st, !dbg !577
  call void @sdmprofile__SearchRoutine_HPonly(i8* %158, i8 1, i32 %159), !dbg !577
  store i64 %add123, i64* %arrayidx122, align 8, !dbg !577
  %160 = load i64* %E, align 8, !dbg !578
  %161 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !578
  %digest124 = getelementptr inbounds %struct.SHA_INFO.2* %161, i32 0, i32 0, !dbg !578
  %arrayidx125 = getelementptr inbounds [5 x i64]* %digest124, i32 0, i64 4, !dbg !578
  %162 = bitcast i64* %arrayidx125 to i8*, !dbg !578
  %163 = load i32* %sdmprofile__threadnumber_st, !dbg !578
  call void @sdmprofile__SearchRoutine_HPonly(i8* %162, i8 2, i32 %163), !dbg !578
  %164 = load i64* %arrayidx125, align 8, !dbg !578
  %add126 = add i64 %164, %160, !dbg !578
  %165 = bitcast i64* %arrayidx125 to i8*, !dbg !578
  %166 = load i32* %sdmprofile__threadnumber_st, !dbg !578
  call void @sdmprofile__SearchRoutine_HPonly(i8* %165, i8 1, i32 %166), !dbg !578
  store i64 %add126, i64* %arrayidx125, align 8, !dbg !578
  ret void, !dbg !579
}

; Function Attrs: nounwind uwtable
define void @sha_update(%struct.SHA_INFO.2* %sha_info, i8* %buffer, i32 %count, i32 %sdmprofile__threadnumber) #11 {
entry:
  %sha_info.addr = alloca %struct.SHA_INFO.2*, align 8
  %buffer.addr = alloca i8*, align 8
  %count.addr = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store %struct.SHA_INFO.2* %sha_info, %struct.SHA_INFO.2** %sha_info.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_51, i64 1 seq_cst, !dbg !580
  call void @llvm.dbg.declare(metadata !{%struct.SHA_INFO.2** %sha_info.addr}, metadata !592), !dbg !580
  store i8* %buffer, i8** %buffer.addr, align 8
  call void @llvm.dbg.declare(metadata !{i8** %buffer.addr}, metadata !593), !dbg !594
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %count.addr}, metadata !595), !dbg !596
  %1 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !597
  %count_lo = getelementptr inbounds %struct.SHA_INFO.2* %1, i32 0, i32 1, !dbg !597
  %2 = bitcast i64* %count_lo to i8*, !dbg !597
  %3 = load i32* %sdmprofile__threadnumber_st, !dbg !597
  call void @sdmprofile__SearchRoutine_HPonly(i8* %2, i8 2, i32 %3), !dbg !597
  %4 = load i64* %count_lo, align 8, !dbg !597
  %5 = load i32* %count.addr, align 4, !dbg !597
  %conv = sext i32 %5 to i64, !dbg !597
  %shl = shl i64 %conv, 3, !dbg !597
  %add = add i64 %4, %shl, !dbg !597
  %6 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !597
  %count_lo1 = getelementptr inbounds %struct.SHA_INFO.2* %6, i32 0, i32 1, !dbg !597
  %7 = bitcast i64* %count_lo1 to i8*, !dbg !597
  %8 = load i32* %sdmprofile__threadnumber_st, !dbg !597
  call void @sdmprofile__SearchRoutine_HPonly(i8* %7, i8 2, i32 %8), !dbg !597
  %9 = load i64* %count_lo1, align 8, !dbg !597
  %cmp = icmp ult i64 %add, %9, !dbg !597
  br i1 %cmp, label %if.then, label %if.end, !dbg !597

if.then:                                          ; preds = %entry
  %10 = atomicrmw add i64* @sdmprofile__BBcounter_52, i64 1 seq_cst, !dbg !599
  %11 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !599
  %count_hi = getelementptr inbounds %struct.SHA_INFO.2* %11, i32 0, i32 2, !dbg !599
  %12 = bitcast i64* %count_hi to i8*, !dbg !599
  %13 = load i32* %sdmprofile__threadnumber_st, !dbg !599
  call void @sdmprofile__SearchRoutine_HPonly(i8* %12, i8 2, i32 %13), !dbg !599
  %14 = load i64* %count_hi, align 8, !dbg !599
  %inc = add i64 %14, 1, !dbg !599
  %15 = bitcast i64* %count_hi to i8*, !dbg !599
  %16 = load i32* %sdmprofile__threadnumber_st, !dbg !599
  call void @sdmprofile__SearchRoutine_HPonly(i8* %15, i8 1, i32 %16), !dbg !599
  store i64 %inc, i64* %count_hi, align 8, !dbg !599
  br label %if.end, !dbg !601

if.end:                                           ; preds = %if.then, %entry
  %17 = atomicrmw add i64* @sdmprofile__BBcounter_53, i64 1 seq_cst, !dbg !602
  %18 = load i32* %count.addr, align 4, !dbg !602
  %conv3 = sext i32 %18 to i64, !dbg !602
  %shl4 = shl i64 %conv3, 3, !dbg !602
  %19 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !602
  %count_lo5 = getelementptr inbounds %struct.SHA_INFO.2* %19, i32 0, i32 1, !dbg !602
  %20 = bitcast i64* %count_lo5 to i8*, !dbg !602
  %21 = load i32* %sdmprofile__threadnumber_st, !dbg !602
  call void @sdmprofile__SearchRoutine_HPonly(i8* %20, i8 2, i32 %21), !dbg !602
  %22 = load i64* %count_lo5, align 8, !dbg !602
  %add6 = add i64 %22, %shl4, !dbg !602
  %23 = bitcast i64* %count_lo5 to i8*, !dbg !602
  %24 = load i32* %sdmprofile__threadnumber_st, !dbg !602
  call void @sdmprofile__SearchRoutine_HPonly(i8* %23, i8 1, i32 %24), !dbg !602
  store i64 %add6, i64* %count_lo5, align 8, !dbg !602
  %25 = load i32* %count.addr, align 4, !dbg !603
  %conv7 = sext i32 %25 to i64, !dbg !603
  %shr = lshr i64 %conv7, 29, !dbg !603
  %26 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !603
  %count_hi8 = getelementptr inbounds %struct.SHA_INFO.2* %26, i32 0, i32 2, !dbg !603
  %27 = bitcast i64* %count_hi8 to i8*, !dbg !603
  %28 = load i32* %sdmprofile__threadnumber_st, !dbg !603
  call void @sdmprofile__SearchRoutine_HPonly(i8* %27, i8 2, i32 %28), !dbg !603
  %29 = load i64* %count_hi8, align 8, !dbg !603
  %add9 = add i64 %29, %shr, !dbg !603
  %30 = bitcast i64* %count_hi8 to i8*, !dbg !603
  %31 = load i32* %sdmprofile__threadnumber_st, !dbg !603
  call void @sdmprofile__SearchRoutine_HPonly(i8* %30, i8 1, i32 %31), !dbg !603
  store i64 %add9, i64* %count_hi8, align 8, !dbg !603
  br label %while.cond, !dbg !604

while.cond:                                       ; preds = %while.body, %if.end
  %32 = atomicrmw add i64* @sdmprofile__BBcounter_54, i64 1 seq_cst, !dbg !605
  %33 = load i32* %count.addr, align 4, !dbg !605
  %cmp10 = icmp sge i32 %33, 64, !dbg !605
  br i1 %cmp10, label %while.body, label %while.end, !dbg !605

while.body:                                       ; preds = %while.cond
  %34 = atomicrmw add i64* @sdmprofile__BBcounter_55, i64 1 seq_cst, !dbg !607
  %35 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !607
  %data = getelementptr inbounds %struct.SHA_INFO.2* %35, i32 0, i32 3, !dbg !607
  %36 = bitcast [16 x i64]* %data to i8*, !dbg !607
  %37 = load i8** %buffer.addr, align 8, !dbg !607
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %36, i8* %37, i64 64, i32 1, i1 false), !dbg !607
  %38 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !609
  %data12 = getelementptr inbounds %struct.SHA_INFO.2* %38, i32 0, i32 3, !dbg !609
  %arraydecay = getelementptr inbounds [16 x i64]* %data12, i32 0, i32 0, !dbg !609
  %sdmprofile__LD1 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @byte_reverse(i64* %arraydecay, i32 64, i32 %sdmprofile__LD1), !dbg !609
  %39 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !610
  %sdmprofile__LD10 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @sha_transform(%struct.SHA_INFO.2* %39, i32 %sdmprofile__LD10), !dbg !610
  %40 = load i8** %buffer.addr, align 8, !dbg !611
  %add.ptr = getelementptr inbounds i8* %40, i64 64, !dbg !611
  store i8* %add.ptr, i8** %buffer.addr, align 8, !dbg !611
  %41 = load i32* %count.addr, align 4, !dbg !612
  %sub = sub nsw i32 %41, 64, !dbg !612
  store i32 %sub, i32* %count.addr, align 4, !dbg !612
  br label %while.cond, !dbg !613

while.end:                                        ; preds = %while.cond
  %42 = atomicrmw add i64* @sdmprofile__BBcounter_56, i64 1 seq_cst, !dbg !614
  %43 = load %struct.SHA_INFO.2** %sha_info.addr, align 8, !dbg !614
  %data13 = getelementptr inbounds %struct.SHA_INFO.2* %43, i32 0, i32 3, !dbg !614
  %44 = bitcast [16 x i64]* %data13 to i8*, !dbg !614
  %45 = load i8** %buffer.addr, align 8, !dbg !614
  %46 = load i32* %count.addr, align 4, !dbg !614
  %conv14 = sext i32 %46 to i64, !dbg !614
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %44, i8* %45, i64 %conv14, i32 1, i1 false), !dbg !614
  ret void, !dbg !615
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #11 {
  %argc_ptr = alloca i32, align 4
  %argv_ptr = alloca i8**, align 8
  %rtn = alloca i32, align 4
  store i32 %argc, i32* %argc_ptr, align 4
  store i8** %argv, i8*** %argv_ptr, align 8
  store i32 1, i32* @sdmprofile__profileAction
  store i64 0, i64* @sdmprofile__heapallocationCount
  store i64 0, i64* @sdmprofile__stackallocationCount
  store i64 57, i64* @sdmprofile__BBcount
  store i32 0, i32* @sdmprofile__IncludeStackProfiling
  call void @sdmprofile__StartProfiling_Processes()
  %1 = load i32* %argc_ptr, align 4
  %2 = load i8*** %argv_ptr, align 8
  %3 = load i32* @sdmprofile__MainthreadNumber, align 4
  %4 = call i32 @app__mainfunction__(i32 %1, i8** %2, i32 %3)
  store i32 %4, i32* %rtn, align 4
  call void @sdmprofile__PrintResultBeforeAddingBBcount()
  %5 = load i64* @sdmprofile__BBcounter_1
  call void @sdmprofile__BBHit(i64 1, i64 %5)
  %6 = load i64* @sdmprofile__BBcounter_2
  call void @sdmprofile__BBHit(i64 2, i64 %6)
  %7 = load i64* @sdmprofile__BBcounter_3
  call void @sdmprofile__BBHit(i64 3, i64 %7)
  %8 = load i64* @sdmprofile__BBcounter_4
  call void @sdmprofile__BBHit(i64 4, i64 %8)
  %9 = load i64* @sdmprofile__BBcounter_5
  call void @sdmprofile__BBHit(i64 5, i64 %9)
  %10 = load i64* @sdmprofile__BBcounter_6
  call void @sdmprofile__BBHit(i64 6, i64 %10)
  %11 = load i64* @sdmprofile__BBcounter_7
  call void @sdmprofile__BBHit(i64 7, i64 %11)
  %12 = load i64* @sdmprofile__BBcounter_8
  call void @sdmprofile__BBHit(i64 8, i64 %12)
  %13 = load i64* @sdmprofile__BBcounter_9
  call void @sdmprofile__BBHit(i64 9, i64 %13)
  %14 = load i64* @sdmprofile__BBcounter_10
  call void @sdmprofile__BBHit(i64 10, i64 %14)
  %15 = load i64* @sdmprofile__BBcounter_11
  call void @sdmprofile__BBHit(i64 11, i64 %15)
  %16 = load i64* @sdmprofile__BBcounter_12
  call void @sdmprofile__BBHit(i64 12, i64 %16)
  %17 = load i64* @sdmprofile__BBcounter_13
  call void @sdmprofile__BBHit(i64 13, i64 %17)
  %18 = load i64* @sdmprofile__BBcounter_14
  call void @sdmprofile__BBHit(i64 14, i64 %18)
  %19 = load i64* @sdmprofile__BBcounter_15
  call void @sdmprofile__BBHit(i64 15, i64 %19)
  %20 = load i64* @sdmprofile__BBcounter_16
  call void @sdmprofile__BBHit(i64 16, i64 %20)
  %21 = load i64* @sdmprofile__BBcounter_17
  call void @sdmprofile__BBHit(i64 17, i64 %21)
  %22 = load i64* @sdmprofile__BBcounter_18
  call void @sdmprofile__BBHit(i64 18, i64 %22)
  %23 = load i64* @sdmprofile__BBcounter_19
  call void @sdmprofile__BBHit(i64 19, i64 %23)
  %24 = load i64* @sdmprofile__BBcounter_20
  call void @sdmprofile__BBHit(i64 20, i64 %24)
  %25 = load i64* @sdmprofile__BBcounter_21
  call void @sdmprofile__BBHit(i64 21, i64 %25)
  %26 = load i64* @sdmprofile__BBcounter_22
  call void @sdmprofile__BBHit(i64 22, i64 %26)
  %27 = load i64* @sdmprofile__BBcounter_23
  call void @sdmprofile__BBHit(i64 23, i64 %27)
  %28 = load i64* @sdmprofile__BBcounter_24
  call void @sdmprofile__BBHit(i64 24, i64 %28)
  %29 = load i64* @sdmprofile__BBcounter_25
  call void @sdmprofile__BBHit(i64 25, i64 %29)
  %30 = load i64* @sdmprofile__BBcounter_26
  call void @sdmprofile__BBHit(i64 26, i64 %30)
  %31 = load i64* @sdmprofile__BBcounter_27
  call void @sdmprofile__BBHit(i64 27, i64 %31)
  %32 = load i64* @sdmprofile__BBcounter_28
  call void @sdmprofile__BBHit(i64 28, i64 %32)
  %33 = load i64* @sdmprofile__BBcounter_29
  call void @sdmprofile__BBHit(i64 29, i64 %33)
  %34 = load i64* @sdmprofile__BBcounter_30
  call void @sdmprofile__BBHit(i64 30, i64 %34)
  %35 = load i64* @sdmprofile__BBcounter_31
  call void @sdmprofile__BBHit(i64 31, i64 %35)
  %36 = load i64* @sdmprofile__BBcounter_32
  call void @sdmprofile__BBHit(i64 32, i64 %36)
  %37 = load i64* @sdmprofile__BBcounter_33
  call void @sdmprofile__BBHit(i64 33, i64 %37)
  %38 = load i64* @sdmprofile__BBcounter_34
  call void @sdmprofile__BBHit(i64 34, i64 %38)
  %39 = load i64* @sdmprofile__BBcounter_35
  call void @sdmprofile__BBHit(i64 35, i64 %39)
  %40 = load i64* @sdmprofile__BBcounter_36
  call void @sdmprofile__BBHit(i64 36, i64 %40)
  %41 = load i64* @sdmprofile__BBcounter_37
  call void @sdmprofile__BBHit(i64 37, i64 %41)
  %42 = load i64* @sdmprofile__BBcounter_38
  call void @sdmprofile__BBHit(i64 38, i64 %42)
  %43 = load i64* @sdmprofile__BBcounter_39
  call void @sdmprofile__BBHit(i64 39, i64 %43)
  %44 = load i64* @sdmprofile__BBcounter_40
  call void @sdmprofile__BBHit(i64 40, i64 %44)
  %45 = load i64* @sdmprofile__BBcounter_41
  call void @sdmprofile__BBHit(i64 41, i64 %45)
  %46 = load i64* @sdmprofile__BBcounter_42
  call void @sdmprofile__BBHit(i64 42, i64 %46)
  %47 = load i64* @sdmprofile__BBcounter_43
  call void @sdmprofile__BBHit(i64 43, i64 %47)
  %48 = load i64* @sdmprofile__BBcounter_44
  call void @sdmprofile__BBHit(i64 44, i64 %48)
  %49 = load i64* @sdmprofile__BBcounter_45
  call void @sdmprofile__BBHit(i64 45, i64 %49)
  %50 = load i64* @sdmprofile__BBcounter_46
  call void @sdmprofile__BBHit(i64 46, i64 %50)
  %51 = load i64* @sdmprofile__BBcounter_47
  call void @sdmprofile__BBHit(i64 47, i64 %51)
  %52 = load i64* @sdmprofile__BBcounter_48
  call void @sdmprofile__BBHit(i64 48, i64 %52)
  %53 = load i64* @sdmprofile__BBcounter_49
  call void @sdmprofile__BBHit(i64 49, i64 %53)
  %54 = load i64* @sdmprofile__BBcounter_50
  call void @sdmprofile__BBHit(i64 50, i64 %54)
  %55 = load i64* @sdmprofile__BBcounter_51
  call void @sdmprofile__BBHit(i64 51, i64 %55)
  %56 = load i64* @sdmprofile__BBcounter_52
  call void @sdmprofile__BBHit(i64 52, i64 %56)
  %57 = load i64* @sdmprofile__BBcounter_53
  call void @sdmprofile__BBHit(i64 53, i64 %57)
  %58 = load i64* @sdmprofile__BBcounter_54
  call void @sdmprofile__BBHit(i64 54, i64 %58)
  %59 = load i64* @sdmprofile__BBcounter_55
  call void @sdmprofile__BBHit(i64 55, i64 %59)
  %60 = load i64* @sdmprofile__BBcounter_56
  call void @sdmprofile__BBHit(i64 56, i64 %60)
  call void @sdmprofile__EndProfiling_Processes()
  %61 = load i32* %rtn, align 4
  ret i32 %61
}

attributes #0 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nobuiltin nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nobuiltin "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nounwind readnone }
attributes #13 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { cold }
attributes #15 = { nounwind readonly }
attributes #16 = { noreturn nounwind }

!llvm.ident = !{!0, !0, !0}
!llvm.dbg.cu = !{!1, !104}
!llvm.module.flags = !{!112, !113}

!0 = metadata !{metadata !"clang version 3.5.1 (tags/RELEASE_351/final)"}
!1 = metadata !{i32 786449, metadata !2, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !4, metadata !3, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c] [DW_LANG_C99]
!2 = metadata !{metadata !"sha.c", metadata !"/home/sslee/work/regen/test/mibench/security/sha"}
!3 = metadata !{}
!4 = metadata !{metadata !5, metadata !26, metadata !33, metadata !34, metadata !98, metadata !99, metadata !100}
!5 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"sha_init", metadata !"sha_init", metadata !"", i32 126, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.SHA_INFO.2*)* @sha_init_original, null, null, metadata !3, i32 127} ; [ DW_TAG_subprogram ] [line 126] [def] [scope 127] [sha_init]
!6 = metadata !{i32 786473, metadata !2}          ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from SHA_INFO]
!10 = metadata !{i32 786454, metadata !11, null, metadata !"SHA_INFO", i32 19, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ] [SHA_INFO] [line 19, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !"./sha.h", metadata !"/home/sslee/work/regen/test/mibench/security/sha"}
!12 = metadata !{i32 786451, metadata !11, null, metadata !"", i32 15, i64 1472, i64 64, i32 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 15, size 1472, align 64, offset 0] [def] [from ]
!13 = metadata !{metadata !14, metadata !20, metadata !21, metadata !22}
!14 = metadata !{i32 786445, metadata !11, metadata !12, metadata !"digest", i32 16, i64 320, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [digest] [line 16, size 320, align 64, offset 0] [from ]
!15 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 320, i64 64, i32 0, i32 0, metadata !16, metadata !18, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 320, align 64, offset 0] [from LONG]
!16 = metadata !{i32 786454, metadata !11, null, metadata !"LONG", i32 10, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ] [LONG] [line 10, size 0, align 0, offset 0] [from long unsigned int]
!17 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!18 = metadata !{metadata !19}
!19 = metadata !{i32 786465, i64 0, i64 5}        ; [ DW_TAG_subrange_type ] [0, 4]
!20 = metadata !{i32 786445, metadata !11, metadata !12, metadata !"count_lo", i32 17, i64 64, i64 64, i64 320, i32 0, metadata !16} ; [ DW_TAG_member ] [count_lo] [line 17, size 64, align 64, offset 320] [from LONG]
!21 = metadata !{i32 786445, metadata !11, metadata !12, metadata !"count_hi", i32 17, i64 64, i64 64, i64 384, i32 0, metadata !16} ; [ DW_TAG_member ] [count_hi] [line 17, size 64, align 64, offset 384] [from LONG]
!22 = metadata !{i32 786445, metadata !11, metadata !12, metadata !"data", i32 18, i64 1024, i64 64, i64 448, i32 0, metadata !23} ; [ DW_TAG_member ] [data] [line 18, size 1024, align 64, offset 448] [from ]
!23 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1024, i64 64, i32 0, i32 0, metadata !16, metadata !24, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024, align 64, offset 0] [from LONG]
!24 = metadata !{metadata !25}
!25 = metadata !{i32 786465, i64 0, i64 16}       ; [ DW_TAG_subrange_type ] [0, 15]
!26 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"sha_update", metadata !"sha_update", metadata !"", i32 139, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.SHA_INFO.2*, i8*, i32)* @sha_update_original, null, null, metadata !3, i32 140} ; [ DW_TAG_subprogram ] [line 139] [def] [scope 140] [sha_update]
!27 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = metadata !{null, metadata !9, metadata !29, metadata !32}
!29 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from BYTE]
!30 = metadata !{i32 786454, metadata !11, null, metadata !"BYTE", i32 9, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_typedef ] [BYTE] [line 9, size 0, align 0, offset 0] [from unsigned char]
!31 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!32 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!33 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"sha_final", metadata !"sha_final", metadata !"", i32 160, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.SHA_INFO.2*)* @sha_final_original, null, null, metadata !3, i32 161} ; [ DW_TAG_subprogram ] [line 160] [def] [scope 161] [sha_final]
!34 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"sha_stream", metadata !"sha_stream", metadata !"", i32 191, metadata !35, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.SHA_INFO.2*, %struct._IO_FILE.1*)* @sha_stream_original, null, null, metadata !3, i32 192} ; [ DW_TAG_subprogram ] [line 191] [def] [scope 192] [sha_stream]
!35 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !36, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = metadata !{null, metadata !9, metadata !37}
!37 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !38} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!38 = metadata !{i32 786454, metadata !39, null, metadata !"FILE", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !40} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!39 = metadata !{metadata !"/usr/include/stdio.h", metadata !"/home/sslee/work/regen/test/mibench/security/sha"}
!40 = metadata !{i32 786451, metadata !41, null, metadata !"_IO_FILE", i32 245, i64 1728, i64 64, i32 0, i32 0, null, metadata !42, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!41 = metadata !{metadata !"/usr/include/libio.h", metadata !"/home/sslee/work/regen/test/mibench/security/sha"}
!42 = metadata !{metadata !43, metadata !44, metadata !47, metadata !48, metadata !49, metadata !50, metadata !51, metadata !52, metadata !53, metadata !54, metadata !55, metadata !56, metadata !57, metadata !65, metadata !66, metadata !67, metadata !68, metadata !72, metadata !74, metadata !76, metadata !80, metadata !83, metadata !85, metadata !87, metadata !88, metadata !89, metadata !90, metadata !93, metadata !94}
!43 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_flags", i32 246, i64 32, i64 32, i64 0, i32 0, metadata !32} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!44 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_IO_read_ptr", i32 251, i64 64, i64 64, i64 64, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!45 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !46} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!46 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!47 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_IO_read_end", i32 252, i64 64, i64 64, i64 128, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!48 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_IO_read_base", i32 253, i64 64, i64 64, i64 192, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!49 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_IO_write_base", i32 254, i64 64, i64 64, i64 256, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!50 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_IO_write_ptr", i32 255, i64 64, i64 64, i64 320, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!51 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_IO_write_end", i32 256, i64 64, i64 64, i64 384, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!52 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_IO_buf_base", i32 257, i64 64, i64 64, i64 448, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!53 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_IO_buf_end", i32 258, i64 64, i64 64, i64 512, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!54 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_IO_save_base", i32 260, i64 64, i64 64, i64 576, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!55 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_IO_backup_base", i32 261, i64 64, i64 64, i64 640, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!56 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_IO_save_end", i32 262, i64 64, i64 64, i64 704, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!57 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_markers", i32 264, i64 64, i64 64, i64 768, i32 0, metadata !58} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!58 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !59} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!59 = metadata !{i32 786451, metadata !41, null, metadata !"_IO_marker", i32 160, i64 192, i64 64, i32 0, i32 0, null, metadata !60, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [def] [from ]
!60 = metadata !{metadata !61, metadata !62, metadata !64}
!61 = metadata !{i32 786445, metadata !41, metadata !59, metadata !"_next", i32 161, i64 64, i64 64, i64 0, i32 0, metadata !58} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!62 = metadata !{i32 786445, metadata !41, metadata !59, metadata !"_sbuf", i32 162, i64 64, i64 64, i64 64, i32 0, metadata !63} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!63 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !40} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!64 = metadata !{i32 786445, metadata !41, metadata !59, metadata !"_pos", i32 166, i64 32, i64 32, i64 128, i32 0, metadata !32} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!65 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_chain", i32 266, i64 64, i64 64, i64 832, i32 0, metadata !63} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!66 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_fileno", i32 268, i64 32, i64 32, i64 896, i32 0, metadata !32} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!67 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_flags2", i32 272, i64 32, i64 32, i64 928, i32 0, metadata !32} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!68 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_old_offset", i32 274, i64 64, i64 64, i64 960, i32 0, metadata !69} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!69 = metadata !{i32 786454, metadata !70, null, metadata !"__off_t", i32 131, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!70 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/sslee/work/regen/test/mibench/security/sha"}
!71 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!72 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_cur_column", i32 278, i64 16, i64 16, i64 1024, i32 0, metadata !73} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!73 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!74 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_vtable_offset", i32 279, i64 8, i64 8, i64 1040, i32 0, metadata !75} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!75 = metadata !{i32 786468, null, null, metadata !"signed char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!76 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_shortbuf", i32 280, i64 8, i64 8, i64 1048, i32 0, metadata !77} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!77 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8, i64 8, i32 0, i32 0, metadata !46, metadata !78, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!78 = metadata !{metadata !79}
!79 = metadata !{i32 786465, i64 0, i64 1}        ; [ DW_TAG_subrange_type ] [0, 0]
!80 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_lock", i32 284, i64 64, i64 64, i64 1088, i32 0, metadata !81} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!81 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !82} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_lock_t]
!82 = metadata !{i32 786454, metadata !41, null, metadata !"_IO_lock_t", i32 154, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_typedef ] [_IO_lock_t] [line 154, size 0, align 0, offset 0] [from ]
!83 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_offset", i32 293, i64 64, i64 64, i64 1152, i32 0, metadata !84} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!84 = metadata !{i32 786454, metadata !70, null, metadata !"__off64_t", i32 132, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!85 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"__pad1", i32 302, i64 64, i64 64, i64 1216, i32 0, metadata !86} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!86 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!87 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"__pad2", i32 303, i64 64, i64 64, i64 1280, i32 0, metadata !86} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!88 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"__pad3", i32 304, i64 64, i64 64, i64 1344, i32 0, metadata !86} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!89 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"__pad4", i32 305, i64 64, i64 64, i64 1408, i32 0, metadata !86} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!90 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"__pad5", i32 306, i64 64, i64 64, i64 1472, i32 0, metadata !91} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!91 = metadata !{i32 786454, metadata !92, null, metadata !"size_t", i32 58, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ] [size_t] [line 58, size 0, align 0, offset 0] [from long unsigned int]
!92 = metadata !{metadata !"/usr/local/bin/../lib/clang/3.5.1/include/stddef.h", metadata !"/home/sslee/work/regen/test/mibench/security/sha"}
!93 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_mode", i32 308, i64 32, i64 32, i64 1536, i32 0, metadata !32} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!94 = metadata !{i32 786445, metadata !41, metadata !40, metadata !"_unused2", i32 310, i64 160, i64 8, i64 1568, i32 0, metadata !95} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!95 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160, i64 8, i32 0, i32 0, metadata !46, metadata !96, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!96 = metadata !{metadata !97}
!97 = metadata !{i32 786465, i64 0, i64 20}       ; [ DW_TAG_subrange_type ] [0, 19]
!98 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"sha_print", metadata !"sha_print", metadata !"", i32 205, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.SHA_INFO.2*)* @sha_print_original, null, null, metadata !3, i32 206} ; [ DW_TAG_subprogram ] [line 205] [def] [scope 206] [sha_print]
!99 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"sha_transform", metadata !"sha_transform", metadata !"", i32 38, metadata !7, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.SHA_INFO.2*)* @sha_transform_original, null, null, metadata !3, i32 39} ; [ DW_TAG_subprogram ] [line 38] [local] [def] [scope 39] [sha_transform]
!100 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"byte_reverse", metadata !"byte_reverse", metadata !"", i32 102, metadata !101, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i64*, i32)* @byte_reverse_original, null, null, metadata !3, i32 103} ; [ DW_TAG_subprogram ] [line 102] [local] [def] [scope 103] [byte_reverse]
!101 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !102, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!102 = metadata !{null, metadata !103, metadata !32}
!103 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from LONG]
!104 = metadata !{i32 786449, metadata !105, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !106, metadata !3, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/security/sha/sha_driver.c] [DW_LANG_C99]
!105 = metadata !{metadata !"sha_driver.c", metadata !"/home/sslee/work/regen/test/mibench/security/sha"}
!106 = metadata !{metadata !107}
!107 = metadata !{i32 786478, metadata !105, metadata !108, metadata !"main", metadata !"main", metadata !"", i32 9, metadata !109, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main_original, null, null, metadata !3, i32 10} ; [ DW_TAG_subprogram ] [line 9] [def] [scope 10] [main]
!108 = metadata !{i32 786473, metadata !105}      ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/security/sha/sha_driver.c]
!109 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !110, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!110 = metadata !{metadata !32, metadata !32, metadata !111}
!111 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !45} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!112 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!113 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!114 = metadata !{metadata !115, metadata !115, i64 0}
!115 = metadata !{metadata !"any pointer", metadata !116, i64 0}
!116 = metadata !{metadata !"omnipotent char", metadata !117, i64 0}
!117 = metadata !{metadata !"Simple C/C++ TBAA"}
!118 = metadata !{metadata !119, metadata !119, i64 0}
!119 = metadata !{metadata !"int", metadata !116, i64 0}
!120 = metadata !{metadata !121, metadata !115, i64 0}
!121 = metadata !{metadata !"_ZTS18HeapAllocationMeta", metadata !115, i64 0, metadata !115, i64 8, metadata !122, i64 16, metadata !119, i64 24, metadata !122, i64 32}
!122 = metadata !{metadata !"long", metadata !116, i64 0}
!123 = metadata !{metadata !124, metadata !122, i64 0}
!124 = metadata !{metadata !"_ZTS6GVMeta", metadata !122, i64 0, metadata !122, i64 8, metadata !122, i64 16, metadata !115, i64 24, metadata !119, i64 32, metadata !115, i64 40, metadata !115, i64 48, metadata !115, i64 56, metadata !115, i64 64, metadata !115, i64 72, metadata !122, i64 80}
!125 = metadata !{metadata !124, metadata !115, i64 24}
!126 = metadata !{metadata !124, metadata !119, i64 32}
!127 = metadata !{metadata !128, metadata !115, i64 0}
!128 = metadata !{metadata !"_ZTS32sdmprofile__Allocated_Stack_item", metadata !115, i64 0, metadata !122, i64 8, metadata !115, i64 16}
!129 = metadata !{metadata !128, metadata !115, i64 16}
!130 = metadata !{metadata !130, metadata !131, metadata !132}
!131 = metadata !{metadata !"llvm.loop.vectorize.width", i32 1}
!132 = metadata !{metadata !"llvm.loop.interleave.count", i32 1}
!133 = metadata !{metadata !134, metadata !134, i64 0}
!134 = metadata !{metadata !"double", metadata !116, i64 0}
!135 = metadata !{metadata !136, metadata !119, i64 0}
!136 = metadata !{metadata !"_ZTS6Thread", metadata !119, i64 0, metadata !122, i64 8, metadata !134, i64 16, metadata !134, i64 24, metadata !115, i64 32, metadata !115, i64 40, metadata !122, i64 48, metadata !122, i64 56, metadata !122, i64 64, metadata !122, i64 72, metadata !122, i64 80, metadata !122, i64 88, metadata !122, i64 96, metadata !122, i64 104, metadata !122, i64 112, metadata !122, i64 120, metadata !122, i64 128, metadata !116, i64 136, metadata !116, i64 200, metadata !115, i64 264, metadata !115, i64 272}
!137 = metadata !{metadata !136, metadata !122, i64 8}
!138 = metadata !{metadata !136, metadata !134, i64 16}
!139 = metadata !{metadata !136, metadata !134, i64 24}
!140 = metadata !{metadata !136, metadata !115, i64 264}
!141 = metadata !{metadata !142, metadata !115, i64 0}
!142 = metadata !{metadata !"_ZTS11Cache2_Item", metadata !115, i64 0, metadata !115, i64 8}
!143 = metadata !{metadata !142, metadata !115, i64 8}
!144 = metadata !{metadata !136, metadata !115, i64 272}
!145 = metadata !{metadata !146, metadata !115, i64 0}
!146 = metadata !{metadata !"_ZTS12GVCache_Item", metadata !115, i64 0, metadata !115, i64 8}
!147 = metadata !{metadata !146, metadata !115, i64 8}
!148 = metadata !{metadata !136, metadata !115, i64 32}
!149 = metadata !{metadata !124, metadata !115, i64 40}
!150 = metadata !{metadata !124, metadata !115, i64 48}
!151 = metadata !{metadata !124, metadata !115, i64 56}
!152 = metadata !{metadata !124, metadata !115, i64 64}
!153 = metadata !{metadata !124, metadata !115, i64 72}
!154 = metadata !{metadata !124, metadata !122, i64 80}
!155 = metadata !{metadata !156, metadata !122, i64 0}
!156 = metadata !{metadata !"_ZTS23sdmprofile__struct_STrw", metadata !122, i64 0, metadata !122, i64 8, metadata !122, i64 16, metadata !119, i64 24, metadata !115, i64 32, metadata !115, i64 40, metadata !115, i64 48}
!157 = metadata !{metadata !156, metadata !119, i64 24}
!158 = metadata !{metadata !156, metadata !115, i64 32}
!159 = metadata !{metadata !156, metadata !115, i64 40}
!160 = metadata !{metadata !156, metadata !115, i64 48}
!161 = metadata !{metadata !162, metadata !119, i64 0}
!162 = metadata !{metadata !"_ZTS6HPMeta", metadata !119, i64 0, metadata !122, i64 8, metadata !122, i64 16, metadata !115, i64 24, metadata !115, i64 32, metadata !115, i64 40, metadata !122, i64 48, metadata !115, i64 56, metadata !122, i64 64, metadata !122, i64 72, metadata !122, i64 80, metadata !122, i64 88}
!163 = metadata !{metadata !162, metadata !115, i64 24}
!164 = metadata !{metadata !162, metadata !115, i64 32}
!165 = metadata !{metadata !162, metadata !115, i64 40}
!166 = metadata !{metadata !162, metadata !122, i64 48}
!167 = metadata !{metadata !162, metadata !115, i64 56}
!168 = metadata !{metadata !124, metadata !122, i64 8}
!169 = metadata !{metadata !124, metadata !122, i64 16}
!170 = metadata !{metadata !171, metadata !115, i64 0}
!171 = metadata !{metadata !"_ZTSSt14_Fwd_list_baseIP6GVMetaSaIS1_EE", metadata !172, i64 0}
!172 = metadata !{metadata !"_ZTSNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_Fwd_list_implE", metadata !173, i64 0}
!173 = metadata !{metadata !"_ZTSSt19_Fwd_list_node_base", metadata !115, i64 0}
!174 = metadata !{metadata !175, metadata !115, i64 0}
!175 = metadata !{metadata !"_ZTSSt18_Fwd_list_iteratorIP6GVMetaE", metadata !115, i64 0}
!176 = metadata !{metadata !173, metadata !115, i64 0}
!177 = metadata !{metadata !156, metadata !122, i64 8}
!178 = metadata !{metadata !156, metadata !122, i64 16}
!179 = metadata !{metadata !122, metadata !122, i64 0}
!180 = metadata !{metadata !181, metadata !122, i64 0}
!181 = metadata !{metadata !"_ZTS8timespec", metadata !122, i64 0, metadata !122, i64 8}
!182 = metadata !{metadata !181, metadata !122, i64 8}
!183 = metadata !{metadata !184, metadata !122, i64 0}
!184 = metadata !{metadata !"_ZTS7timeval", metadata !122, i64 0, metadata !122, i64 8}
!185 = metadata !{metadata !184, metadata !122, i64 8}
!186 = metadata !{metadata !136, metadata !122, i64 48}
!187 = metadata !{metadata !121, metadata !115, i64 8}
!188 = metadata !{metadata !121, metadata !122, i64 16}
!189 = metadata !{metadata !121, metadata !119, i64 24}
!190 = metadata !{metadata !136, metadata !122, i64 80}
!191 = metadata !{metadata !136, metadata !122, i64 64}
!192 = metadata !{metadata !162, metadata !122, i64 64}
!193 = metadata !{metadata !162, metadata !122, i64 72}
!194 = metadata !{metadata !162, metadata !122, i64 80}
!195 = metadata !{metadata !136, metadata !122, i64 56}
!196 = metadata !{metadata !197, metadata !115, i64 0}
!197 = metadata !{metadata !"_ZTSSt10_List_baseIP18HeapAllocationMetaSaIS1_EE", metadata !198, i64 0}
!198 = metadata !{metadata !"_ZTSNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE10_List_implE", metadata !199, i64 0}
!199 = metadata !{metadata !"_ZTSNSt8__detail15_List_node_baseE", metadata !115, i64 0, metadata !115, i64 8}
!200 = metadata !{metadata !201, metadata !115, i64 0}
!201 = metadata !{metadata !"_ZTSSt14_List_iteratorIP18HeapAllocationMetaE", metadata !115, i64 0}
!202 = metadata !{metadata !199, metadata !115, i64 0}
!203 = metadata !{metadata !136, metadata !122, i64 96}
!204 = metadata !{metadata !136, metadata !122, i64 112}
!205 = metadata !{metadata !136, metadata !122, i64 128}
!206 = metadata !{metadata !136, metadata !122, i64 120}
!207 = metadata !{metadata !136, metadata !122, i64 104}
!208 = metadata !{metadata !162, metadata !122, i64 8}
!209 = metadata !{metadata !162, metadata !122, i64 16}
!210 = metadata !{metadata !128, metadata !122, i64 8}
!211 = metadata !{metadata !116, metadata !116, i64 0}
!212 = metadata !{metadata !213, metadata !115, i64 0}
!213 = metadata !{metadata !"_ZTSN9__gnu_cxx17__normal_iteratorIPcSsEE", metadata !115, i64 0}
!214 = metadata !{metadata !215, metadata !115, i64 0}
!215 = metadata !{metadata !"_ZTSSs", metadata !216, i64 0}
!216 = metadata !{metadata !"_ZTSNSs12_Alloc_hiderE", metadata !115, i64 0}
!217 = metadata !{metadata !218, metadata !122, i64 0}
!218 = metadata !{metadata !"_ZTSNSs9_Rep_baseE", metadata !122, i64 0, metadata !122, i64 8, metadata !119, i64 16}
!219 = metadata !{metadata !218, metadata !119, i64 16}
!220 = metadata !{metadata !221, metadata !115, i64 16}
!221 = metadata !{metadata !"_ZTSSt10_List_nodeIP18HeapAllocationMetaE", metadata !115, i64 16}
!222 = metadata !{metadata !223, metadata !115, i64 0}
!223 = metadata !{metadata !"_ZTSSt24_Fwd_list_const_iteratorIP6GVMetaE", metadata !115, i64 0}
!224 = metadata !{metadata !197, metadata !115, i64 8}
!225 = metadata !{metadata !"branch_weights", i32 64, i32 4}
!226 = metadata !{i32 102, i32 32, metadata !100, null}
!227 = metadata !{i32 786689, metadata !100, metadata !"buffer", metadata !6, i32 16777318, metadata !103, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buffer] [line 102]
!228 = metadata !{i32 786689, metadata !100, metadata !"count", metadata !6, i32 33554534, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 102]
!229 = metadata !{i32 102, i32 44, metadata !100, null}
!230 = metadata !{i32 786688, metadata !100, metadata !"i", metadata !6, i32 104, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 104]
!231 = metadata !{i32 104, i32 9, metadata !100, null}
!232 = metadata !{i32 786688, metadata !100, metadata !"ct", metadata !6, i32 105, metadata !233, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ct] [line 105]
!233 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 32, i64 8, i32 0, i32 0, metadata !30, metadata !234, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from BYTE]
!234 = metadata !{metadata !235}
!235 = metadata !{i32 786465, i64 0, i64 4}       ; [ DW_TAG_subrange_type ] [0, 3]
!236 = metadata !{i32 105, i32 10, metadata !100, null}
!237 = metadata !{i32 786688, metadata !100, metadata !"cp", metadata !6, i32 105, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cp] [line 105]
!238 = metadata !{i32 105, i32 18, metadata !100, null}
!239 = metadata !{i32 107, i32 5, metadata !100, null}
!240 = metadata !{i32 108, i32 5, metadata !100, null}
!241 = metadata !{i32 109, i32 10, metadata !242, null}
!242 = metadata !{i32 786443, metadata !2, metadata !100, i32 109, i32 5, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!243 = metadata !{i32 109, i32 10, metadata !244, null}
!244 = metadata !{i32 786443, metadata !2, metadata !245, i32 109, i32 10, i32 2, i32 23} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!245 = metadata !{i32 786443, metadata !2, metadata !242, i32 109, i32 10, i32 1, i32 22} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!246 = metadata !{i32 110, i32 2, metadata !247, null}
!247 = metadata !{i32 786443, metadata !2, metadata !242, i32 109, i32 33, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!248 = metadata !{i32 111, i32 2, metadata !247, null}
!249 = metadata !{i32 112, i32 2, metadata !247, null}
!250 = metadata !{i32 113, i32 2, metadata !247, null}
!251 = metadata !{i32 114, i32 2, metadata !247, null}
!252 = metadata !{i32 115, i32 2, metadata !247, null}
!253 = metadata !{i32 116, i32 2, metadata !247, null}
!254 = metadata !{i32 117, i32 2, metadata !247, null}
!255 = metadata !{i32 118, i32 2, metadata !247, null}
!256 = metadata !{i32 119, i32 5, metadata !247, null}
!257 = metadata !{i32 109, i32 28, metadata !242, null}
!258 = metadata !{i32 120, i32 1, metadata !100, null}
!259 = metadata !{i32 9, i32 14, metadata !107, null}
!260 = metadata !{i32 786689, metadata !107, metadata !"argc", metadata !108, i32 16777225, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 9]
!261 = metadata !{i32 786689, metadata !107, metadata !"argv", metadata !108, i32 33554441, metadata !111, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 9]
!262 = metadata !{i32 9, i32 27, metadata !107, null}
!263 = metadata !{i32 786688, metadata !107, metadata !"fin", metadata !108, i32 11, metadata !264, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fin] [line 11]
!264 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !265} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!265 = metadata !{i32 786454, metadata !39, null, metadata !"FILE", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !266} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!266 = metadata !{i32 786451, metadata !41, null, metadata !"_IO_FILE", i32 245, i64 1728, i64 64, i32 0, i32 0, null, metadata !267, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!267 = metadata !{metadata !268, metadata !269, metadata !270, metadata !271, metadata !272, metadata !273, metadata !274, metadata !275, metadata !276, metadata !277, metadata !278, metadata !279, metadata !280, metadata !288, metadata !289, metadata !290, metadata !291, metadata !292, metadata !293, metadata !294, metadata !295, metadata !296, metadata !297, metadata !298, metadata !299, metadata !300, metadata !301, metadata !302, metadata !303}
!268 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_flags", i32 246, i64 32, i64 32, i64 0, i32 0, metadata !32} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!269 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_IO_read_ptr", i32 251, i64 64, i64 64, i64 64, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!270 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_IO_read_end", i32 252, i64 64, i64 64, i64 128, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!271 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_IO_read_base", i32 253, i64 64, i64 64, i64 192, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!272 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_IO_write_base", i32 254, i64 64, i64 64, i64 256, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!273 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_IO_write_ptr", i32 255, i64 64, i64 64, i64 320, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!274 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_IO_write_end", i32 256, i64 64, i64 64, i64 384, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!275 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_IO_buf_base", i32 257, i64 64, i64 64, i64 448, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!276 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_IO_buf_end", i32 258, i64 64, i64 64, i64 512, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!277 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_IO_save_base", i32 260, i64 64, i64 64, i64 576, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!278 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_IO_backup_base", i32 261, i64 64, i64 64, i64 640, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!279 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_IO_save_end", i32 262, i64 64, i64 64, i64 704, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!280 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_markers", i32 264, i64 64, i64 64, i64 768, i32 0, metadata !281} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!281 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !282} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!282 = metadata !{i32 786451, metadata !41, null, metadata !"_IO_marker", i32 160, i64 192, i64 64, i32 0, i32 0, null, metadata !283, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [def] [from ]
!283 = metadata !{metadata !284, metadata !285, metadata !287}
!284 = metadata !{i32 786445, metadata !41, metadata !282, metadata !"_next", i32 161, i64 64, i64 64, i64 0, i32 0, metadata !281} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!285 = metadata !{i32 786445, metadata !41, metadata !282, metadata !"_sbuf", i32 162, i64 64, i64 64, i64 64, i32 0, metadata !286} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!286 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !266} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!287 = metadata !{i32 786445, metadata !41, metadata !282, metadata !"_pos", i32 166, i64 32, i64 32, i64 128, i32 0, metadata !32} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!288 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_chain", i32 266, i64 64, i64 64, i64 832, i32 0, metadata !286} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!289 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_fileno", i32 268, i64 32, i64 32, i64 896, i32 0, metadata !32} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!290 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_flags2", i32 272, i64 32, i64 32, i64 928, i32 0, metadata !32} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!291 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_old_offset", i32 274, i64 64, i64 64, i64 960, i32 0, metadata !69} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!292 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_cur_column", i32 278, i64 16, i64 16, i64 1024, i32 0, metadata !73} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!293 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_vtable_offset", i32 279, i64 8, i64 8, i64 1040, i32 0, metadata !75} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!294 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_shortbuf", i32 280, i64 8, i64 8, i64 1048, i32 0, metadata !77} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!295 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_lock", i32 284, i64 64, i64 64, i64 1088, i32 0, metadata !81} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!296 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_offset", i32 293, i64 64, i64 64, i64 1152, i32 0, metadata !84} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!297 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"__pad1", i32 302, i64 64, i64 64, i64 1216, i32 0, metadata !86} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!298 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"__pad2", i32 303, i64 64, i64 64, i64 1280, i32 0, metadata !86} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!299 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"__pad3", i32 304, i64 64, i64 64, i64 1344, i32 0, metadata !86} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!300 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"__pad4", i32 305, i64 64, i64 64, i64 1408, i32 0, metadata !86} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!301 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"__pad5", i32 306, i64 64, i64 64, i64 1472, i32 0, metadata !91} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!302 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_mode", i32 308, i64 32, i64 32, i64 1536, i32 0, metadata !32} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!303 = metadata !{i32 786445, metadata !41, metadata !266, metadata !"_unused2", i32 310, i64 160, i64 8, i64 1568, i32 0, metadata !95} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!304 = metadata !{i32 11, i32 11, metadata !107, null}
!305 = metadata !{i32 786688, metadata !107, metadata !"sha_info", metadata !108, i32 12, metadata !306, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sha_info] [line 12]
!306 = metadata !{i32 786454, metadata !11, null, metadata !"SHA_INFO", i32 19, i64 0, i64 0, i64 0, i32 0, metadata !307} ; [ DW_TAG_typedef ] [SHA_INFO] [line 19, size 0, align 0, offset 0] [from ]
!307 = metadata !{i32 786451, metadata !11, null, metadata !"", i32 15, i64 1472, i64 64, i32 0, i32 0, null, metadata !308, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 15, size 1472, align 64, offset 0] [def] [from ]
!308 = metadata !{metadata !309, metadata !310, metadata !311, metadata !312}
!309 = metadata !{i32 786445, metadata !11, metadata !307, metadata !"digest", i32 16, i64 320, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [digest] [line 16, size 320, align 64, offset 0] [from ]
!310 = metadata !{i32 786445, metadata !11, metadata !307, metadata !"count_lo", i32 17, i64 64, i64 64, i64 320, i32 0, metadata !16} ; [ DW_TAG_member ] [count_lo] [line 17, size 64, align 64, offset 320] [from LONG]
!311 = metadata !{i32 786445, metadata !11, metadata !307, metadata !"count_hi", i32 17, i64 64, i64 64, i64 384, i32 0, metadata !16} ; [ DW_TAG_member ] [count_hi] [line 17, size 64, align 64, offset 384] [from LONG]
!312 = metadata !{i32 786445, metadata !11, metadata !307, metadata !"data", i32 18, i64 1024, i64 64, i64 448, i32 0, metadata !23} ; [ DW_TAG_member ] [data] [line 18, size 1024, align 64, offset 448] [from ]
!313 = metadata !{i32 12, i32 14, metadata !107, null}
!314 = metadata !{i32 14, i32 9, metadata !315, null}
!315 = metadata !{i32 786443, metadata !105, metadata !107, i32 14, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha_driver.c]
!316 = metadata !{i32 15, i32 2, metadata !317, null}
!317 = metadata !{i32 786443, metadata !105, metadata !315, i32 14, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha_driver.c]
!318 = metadata !{i32 16, i32 2, metadata !317, null}
!319 = metadata !{i32 17, i32 2, metadata !317, null}
!320 = metadata !{i32 18, i32 5, metadata !317, null}
!321 = metadata !{i32 19, i32 2, metadata !322, null}
!322 = metadata !{i32 786443, metadata !105, metadata !315, i32 18, i32 12, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha_driver.c]
!323 = metadata !{i32 19, i32 2, metadata !324, null}
!324 = metadata !{i32 786443, metadata !105, metadata !322, i32 19, i32 2, i32 1, i32 7} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha_driver.c]
!325 = metadata !{i32 20, i32 12, metadata !326, null}
!326 = metadata !{i32 786443, metadata !105, metadata !322, i32 19, i32 17, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha_driver.c]
!327 = metadata !{i32 21, i32 10, metadata !328, null}
!328 = metadata !{i32 786443, metadata !105, metadata !326, i32 21, i32 10, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha_driver.c]
!329 = metadata !{i32 22, i32 3, metadata !330, null}
!330 = metadata !{i32 786443, metadata !105, metadata !328, i32 21, i32 23, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha_driver.c]
!331 = metadata !{i32 23, i32 6, metadata !330, null}
!332 = metadata !{i32 24, i32 3, metadata !333, null}
!333 = metadata !{i32 786443, metadata !105, metadata !328, i32 23, i32 13, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha_driver.c]
!334 = metadata !{i32 25, i32 3, metadata !333, null}
!335 = metadata !{i32 26, i32 3, metadata !333, null}
!336 = metadata !{i32 28, i32 2, metadata !326, null}
!337 = metadata !{i32 30, i32 5, metadata !107, null}
!338 = metadata !{i32 160, i32 26, metadata !339, null}
!339 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"sha_final", metadata !"sha_final", metadata !"", i32 160, metadata !340, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.SHA_INFO.2*)* @sha_final_original, null, null, metadata !3, i32 161} ; [ DW_TAG_subprogram ] [line 160] [def] [scope 161] [sha_final]
!340 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !341, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!341 = metadata !{null, metadata !342}
!342 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !343} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from SHA_INFO]
!343 = metadata !{i32 786454, metadata !11, null, metadata !"SHA_INFO", i32 19, i64 0, i64 0, i64 0, i32 0, metadata !344} ; [ DW_TAG_typedef ] [SHA_INFO] [line 19, size 0, align 0, offset 0] [from ]
!344 = metadata !{i32 786451, metadata !11, null, metadata !"", i32 15, i64 1472, i64 64, i32 0, i32 0, null, metadata !345, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 15, size 1472, align 64, offset 0] [def] [from ]
!345 = metadata !{metadata !346, metadata !347, metadata !348, metadata !349}
!346 = metadata !{i32 786445, metadata !11, metadata !344, metadata !"digest", i32 16, i64 320, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [digest] [line 16, size 320, align 64, offset 0] [from ]
!347 = metadata !{i32 786445, metadata !11, metadata !344, metadata !"count_lo", i32 17, i64 64, i64 64, i64 320, i32 0, metadata !16} ; [ DW_TAG_member ] [count_lo] [line 17, size 64, align 64, offset 320] [from LONG]
!348 = metadata !{i32 786445, metadata !11, metadata !344, metadata !"count_hi", i32 17, i64 64, i64 64, i64 384, i32 0, metadata !16} ; [ DW_TAG_member ] [count_hi] [line 17, size 64, align 64, offset 384] [from LONG]
!349 = metadata !{i32 786445, metadata !11, metadata !344, metadata !"data", i32 18, i64 1024, i64 64, i64 448, i32 0, metadata !23} ; [ DW_TAG_member ] [data] [line 18, size 1024, align 64, offset 448] [from ]
!350 = metadata !{i32 786689, metadata !339, metadata !"sha_info", metadata !6, i32 16777376, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sha_info] [line 160]
!351 = metadata !{i32 786688, metadata !339, metadata !"count", metadata !6, i32 162, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 162]
!352 = metadata !{i32 162, i32 9, metadata !339, null}
!353 = metadata !{i32 786688, metadata !339, metadata !"lo_bit_count", metadata !6, i32 163, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [lo_bit_count] [line 163]
!354 = metadata !{i32 163, i32 10, metadata !339, null}
!355 = metadata !{i32 786688, metadata !339, metadata !"hi_bit_count", metadata !6, i32 163, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [hi_bit_count] [line 163]
!356 = metadata !{i32 163, i32 24, metadata !339, null}
!357 = metadata !{i32 165, i32 5, metadata !339, null}
!358 = metadata !{i32 166, i32 5, metadata !339, null}
!359 = metadata !{i32 167, i32 5, metadata !339, null}
!360 = metadata !{i32 168, i32 5, metadata !339, null}
!361 = metadata !{i32 169, i32 9, metadata !362, null}
!362 = metadata !{i32 786443, metadata !2, metadata !339, i32 169, i32 9, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!363 = metadata !{i32 170, i32 2, metadata !364, null}
!364 = metadata !{i32 786443, metadata !2, metadata !362, i32 169, i32 21, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!365 = metadata !{i32 172, i32 2, metadata !364, null}
!366 = metadata !{i32 174, i32 2, metadata !364, null}
!367 = metadata !{i32 175, i32 2, metadata !364, null}
!368 = metadata !{i32 176, i32 5, metadata !364, null}
!369 = metadata !{i32 177, i32 2, metadata !370, null}
!370 = metadata !{i32 786443, metadata !2, metadata !362, i32 176, i32 12, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!371 = metadata !{i32 180, i32 5, metadata !339, null}
!372 = metadata !{i32 182, i32 5, metadata !339, null}
!373 = metadata !{i32 183, i32 5, metadata !339, null}
!374 = metadata !{i32 184, i32 5, metadata !339, null}
!375 = metadata !{i32 185, i32 1, metadata !339, null}
!376 = metadata !{i32 126, i32 25, metadata !377, null}
!377 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"sha_init", metadata !"sha_init", metadata !"", i32 126, metadata !378, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.SHA_INFO.2*)* @sha_init_original, null, null, metadata !3, i32 127} ; [ DW_TAG_subprogram ] [line 126] [def] [scope 127] [sha_init]
!378 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !379, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!379 = metadata !{null, metadata !380}
!380 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !381} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from SHA_INFO]
!381 = metadata !{i32 786454, metadata !11, null, metadata !"SHA_INFO", i32 19, i64 0, i64 0, i64 0, i32 0, metadata !382} ; [ DW_TAG_typedef ] [SHA_INFO] [line 19, size 0, align 0, offset 0] [from ]
!382 = metadata !{i32 786451, metadata !11, null, metadata !"", i32 15, i64 1472, i64 64, i32 0, i32 0, null, metadata !383, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 15, size 1472, align 64, offset 0] [def] [from ]
!383 = metadata !{metadata !384, metadata !385, metadata !386, metadata !387}
!384 = metadata !{i32 786445, metadata !11, metadata !382, metadata !"digest", i32 16, i64 320, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [digest] [line 16, size 320, align 64, offset 0] [from ]
!385 = metadata !{i32 786445, metadata !11, metadata !382, metadata !"count_lo", i32 17, i64 64, i64 64, i64 320, i32 0, metadata !16} ; [ DW_TAG_member ] [count_lo] [line 17, size 64, align 64, offset 320] [from LONG]
!386 = metadata !{i32 786445, metadata !11, metadata !382, metadata !"count_hi", i32 17, i64 64, i64 64, i64 384, i32 0, metadata !16} ; [ DW_TAG_member ] [count_hi] [line 17, size 64, align 64, offset 384] [from LONG]
!387 = metadata !{i32 786445, metadata !11, metadata !382, metadata !"data", i32 18, i64 1024, i64 64, i64 448, i32 0, metadata !23} ; [ DW_TAG_member ] [data] [line 18, size 1024, align 64, offset 448] [from ]
!388 = metadata !{i32 786689, metadata !377, metadata !"sha_info", metadata !6, i32 16777342, metadata !380, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sha_info] [line 126]
!389 = metadata !{i32 128, i32 5, metadata !377, null}
!390 = metadata !{i32 129, i32 5, metadata !377, null}
!391 = metadata !{i32 130, i32 5, metadata !377, null}
!392 = metadata !{i32 131, i32 5, metadata !377, null}
!393 = metadata !{i32 132, i32 5, metadata !377, null}
!394 = metadata !{i32 133, i32 5, metadata !377, null}
!395 = metadata !{i32 134, i32 5, metadata !377, null}
!396 = metadata !{i32 135, i32 1, metadata !377, null}
!397 = metadata !{i32 205, i32 26, metadata !398, null}
!398 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"sha_print", metadata !"sha_print", metadata !"", i32 205, metadata !399, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.SHA_INFO.2*)* @sha_print_original, null, null, metadata !3, i32 206} ; [ DW_TAG_subprogram ] [line 205] [def] [scope 206] [sha_print]
!399 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !400, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!400 = metadata !{null, metadata !401}
!401 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !402} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from SHA_INFO]
!402 = metadata !{i32 786454, metadata !11, null, metadata !"SHA_INFO", i32 19, i64 0, i64 0, i64 0, i32 0, metadata !403} ; [ DW_TAG_typedef ] [SHA_INFO] [line 19, size 0, align 0, offset 0] [from ]
!403 = metadata !{i32 786451, metadata !11, null, metadata !"", i32 15, i64 1472, i64 64, i32 0, i32 0, null, metadata !404, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 15, size 1472, align 64, offset 0] [def] [from ]
!404 = metadata !{metadata !405, metadata !406, metadata !407, metadata !408}
!405 = metadata !{i32 786445, metadata !11, metadata !403, metadata !"digest", i32 16, i64 320, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [digest] [line 16, size 320, align 64, offset 0] [from ]
!406 = metadata !{i32 786445, metadata !11, metadata !403, metadata !"count_lo", i32 17, i64 64, i64 64, i64 320, i32 0, metadata !16} ; [ DW_TAG_member ] [count_lo] [line 17, size 64, align 64, offset 320] [from LONG]
!407 = metadata !{i32 786445, metadata !11, metadata !403, metadata !"count_hi", i32 17, i64 64, i64 64, i64 384, i32 0, metadata !16} ; [ DW_TAG_member ] [count_hi] [line 17, size 64, align 64, offset 384] [from LONG]
!408 = metadata !{i32 786445, metadata !11, metadata !403, metadata !"data", i32 18, i64 1024, i64 64, i64 448, i32 0, metadata !23} ; [ DW_TAG_member ] [data] [line 18, size 1024, align 64, offset 448] [from ]
!409 = metadata !{i32 786689, metadata !398, metadata !"sha_info", metadata !6, i32 16777421, metadata !401, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sha_info] [line 205]
!410 = metadata !{i32 207, i32 5, metadata !398, null}
!411 = metadata !{i32 210, i32 1, metadata !398, null}
!412 = metadata !{i32 191, i32 27, metadata !413, null}
!413 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"sha_stream", metadata !"sha_stream", metadata !"", i32 191, metadata !414, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.SHA_INFO.2*, %struct._IO_FILE.1*)* @sha_stream_original, null, null, metadata !3, i32 192} ; [ DW_TAG_subprogram ] [line 191] [def] [scope 192] [sha_stream]
!414 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !415, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!415 = metadata !{null, metadata !416, metadata !424}
!416 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !417} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from SHA_INFO]
!417 = metadata !{i32 786454, metadata !11, null, metadata !"SHA_INFO", i32 19, i64 0, i64 0, i64 0, i32 0, metadata !418} ; [ DW_TAG_typedef ] [SHA_INFO] [line 19, size 0, align 0, offset 0] [from ]
!418 = metadata !{i32 786451, metadata !11, null, metadata !"", i32 15, i64 1472, i64 64, i32 0, i32 0, null, metadata !419, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 15, size 1472, align 64, offset 0] [def] [from ]
!419 = metadata !{metadata !420, metadata !421, metadata !422, metadata !423}
!420 = metadata !{i32 786445, metadata !11, metadata !418, metadata !"digest", i32 16, i64 320, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [digest] [line 16, size 320, align 64, offset 0] [from ]
!421 = metadata !{i32 786445, metadata !11, metadata !418, metadata !"count_lo", i32 17, i64 64, i64 64, i64 320, i32 0, metadata !16} ; [ DW_TAG_member ] [count_lo] [line 17, size 64, align 64, offset 320] [from LONG]
!422 = metadata !{i32 786445, metadata !11, metadata !418, metadata !"count_hi", i32 17, i64 64, i64 64, i64 384, i32 0, metadata !16} ; [ DW_TAG_member ] [count_hi] [line 17, size 64, align 64, offset 384] [from LONG]
!423 = metadata !{i32 786445, metadata !11, metadata !418, metadata !"data", i32 18, i64 1024, i64 64, i64 448, i32 0, metadata !23} ; [ DW_TAG_member ] [data] [line 18, size 1024, align 64, offset 448] [from ]
!424 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !425} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!425 = metadata !{i32 786454, metadata !39, null, metadata !"FILE", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !426} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!426 = metadata !{i32 786451, metadata !41, null, metadata !"_IO_FILE", i32 245, i64 1728, i64 64, i32 0, i32 0, null, metadata !427, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!427 = metadata !{metadata !428, metadata !429, metadata !430, metadata !431, metadata !432, metadata !433, metadata !434, metadata !435, metadata !436, metadata !437, metadata !438, metadata !439, metadata !440, metadata !448, metadata !449, metadata !450, metadata !451, metadata !452, metadata !453, metadata !454, metadata !455, metadata !456, metadata !457, metadata !458, metadata !459, metadata !460, metadata !461, metadata !462, metadata !463}
!428 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_flags", i32 246, i64 32, i64 32, i64 0, i32 0, metadata !32} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!429 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_IO_read_ptr", i32 251, i64 64, i64 64, i64 64, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!430 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_IO_read_end", i32 252, i64 64, i64 64, i64 128, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!431 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_IO_read_base", i32 253, i64 64, i64 64, i64 192, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!432 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_IO_write_base", i32 254, i64 64, i64 64, i64 256, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!433 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_IO_write_ptr", i32 255, i64 64, i64 64, i64 320, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!434 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_IO_write_end", i32 256, i64 64, i64 64, i64 384, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!435 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_IO_buf_base", i32 257, i64 64, i64 64, i64 448, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!436 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_IO_buf_end", i32 258, i64 64, i64 64, i64 512, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!437 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_IO_save_base", i32 260, i64 64, i64 64, i64 576, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!438 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_IO_backup_base", i32 261, i64 64, i64 64, i64 640, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!439 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_IO_save_end", i32 262, i64 64, i64 64, i64 704, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!440 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_markers", i32 264, i64 64, i64 64, i64 768, i32 0, metadata !441} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!441 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !442} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!442 = metadata !{i32 786451, metadata !41, null, metadata !"_IO_marker", i32 160, i64 192, i64 64, i32 0, i32 0, null, metadata !443, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [def] [from ]
!443 = metadata !{metadata !444, metadata !445, metadata !447}
!444 = metadata !{i32 786445, metadata !41, metadata !442, metadata !"_next", i32 161, i64 64, i64 64, i64 0, i32 0, metadata !441} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!445 = metadata !{i32 786445, metadata !41, metadata !442, metadata !"_sbuf", i32 162, i64 64, i64 64, i64 64, i32 0, metadata !446} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!446 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !426} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!447 = metadata !{i32 786445, metadata !41, metadata !442, metadata !"_pos", i32 166, i64 32, i64 32, i64 128, i32 0, metadata !32} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!448 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_chain", i32 266, i64 64, i64 64, i64 832, i32 0, metadata !446} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!449 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_fileno", i32 268, i64 32, i64 32, i64 896, i32 0, metadata !32} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!450 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_flags2", i32 272, i64 32, i64 32, i64 928, i32 0, metadata !32} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!451 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_old_offset", i32 274, i64 64, i64 64, i64 960, i32 0, metadata !69} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!452 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_cur_column", i32 278, i64 16, i64 16, i64 1024, i32 0, metadata !73} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!453 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_vtable_offset", i32 279, i64 8, i64 8, i64 1040, i32 0, metadata !75} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!454 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_shortbuf", i32 280, i64 8, i64 8, i64 1048, i32 0, metadata !77} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!455 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_lock", i32 284, i64 64, i64 64, i64 1088, i32 0, metadata !81} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!456 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_offset", i32 293, i64 64, i64 64, i64 1152, i32 0, metadata !84} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!457 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"__pad1", i32 302, i64 64, i64 64, i64 1216, i32 0, metadata !86} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!458 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"__pad2", i32 303, i64 64, i64 64, i64 1280, i32 0, metadata !86} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!459 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"__pad3", i32 304, i64 64, i64 64, i64 1344, i32 0, metadata !86} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!460 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"__pad4", i32 305, i64 64, i64 64, i64 1408, i32 0, metadata !86} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!461 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"__pad5", i32 306, i64 64, i64 64, i64 1472, i32 0, metadata !91} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!462 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_mode", i32 308, i64 32, i64 32, i64 1536, i32 0, metadata !32} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!463 = metadata !{i32 786445, metadata !41, metadata !426, metadata !"_unused2", i32 310, i64 160, i64 8, i64 1568, i32 0, metadata !95} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!464 = metadata !{i32 786689, metadata !413, metadata !"sha_info", metadata !6, i32 16777407, metadata !416, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sha_info] [line 191]
!465 = metadata !{i32 786689, metadata !413, metadata !"fin", metadata !6, i32 33554623, metadata !424, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fin] [line 191]
!466 = metadata !{i32 191, i32 43, metadata !413, null}
!467 = metadata !{i32 786688, metadata !413, metadata !"i", metadata !6, i32 193, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 193]
!468 = metadata !{i32 193, i32 9, metadata !413, null}
!469 = metadata !{i32 786688, metadata !413, metadata !"data", metadata !6, i32 194, metadata !470, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [data] [line 194]
!470 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 65536, i64 8, i32 0, i32 0, metadata !30, metadata !471, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 8, offset 0] [from BYTE]
!471 = metadata !{metadata !472}
!472 = metadata !{i32 786465, i64 0, i64 8192}    ; [ DW_TAG_subrange_type ] [0, 8191]
!473 = metadata !{i32 194, i32 10, metadata !413, null}
!474 = metadata !{i32 196, i32 5, metadata !413, null}
!475 = metadata !{i32 197, i32 5, metadata !413, null}
!476 = metadata !{i32 197, i32 17, metadata !477, null}
!477 = metadata !{i32 786443, metadata !2, metadata !413, i32 197, i32 17, i32 1, i32 36} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!478 = metadata !{i32 198, i32 2, metadata !479, null}
!479 = metadata !{i32 786443, metadata !2, metadata !413, i32 197, i32 55, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!480 = metadata !{i32 199, i32 5, metadata !479, null}
!481 = metadata !{i32 200, i32 5, metadata !413, null}
!482 = metadata !{i32 201, i32 1, metadata !413, null}
!483 = metadata !{i32 38, i32 37, metadata !484, null}
!484 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"sha_transform", metadata !"sha_transform", metadata !"", i32 38, metadata !485, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.SHA_INFO.2*)* @sha_transform_original, null, null, metadata !3, i32 39} ; [ DW_TAG_subprogram ] [line 38] [local] [def] [scope 39] [sha_transform]
!485 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !486, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!486 = metadata !{null, metadata !487}
!487 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !488} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from SHA_INFO]
!488 = metadata !{i32 786454, metadata !11, null, metadata !"SHA_INFO", i32 19, i64 0, i64 0, i64 0, i32 0, metadata !489} ; [ DW_TAG_typedef ] [SHA_INFO] [line 19, size 0, align 0, offset 0] [from ]
!489 = metadata !{i32 786451, metadata !11, null, metadata !"", i32 15, i64 1472, i64 64, i32 0, i32 0, null, metadata !490, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 15, size 1472, align 64, offset 0] [def] [from ]
!490 = metadata !{metadata !491, metadata !492, metadata !493, metadata !494}
!491 = metadata !{i32 786445, metadata !11, metadata !489, metadata !"digest", i32 16, i64 320, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [digest] [line 16, size 320, align 64, offset 0] [from ]
!492 = metadata !{i32 786445, metadata !11, metadata !489, metadata !"count_lo", i32 17, i64 64, i64 64, i64 320, i32 0, metadata !16} ; [ DW_TAG_member ] [count_lo] [line 17, size 64, align 64, offset 320] [from LONG]
!493 = metadata !{i32 786445, metadata !11, metadata !489, metadata !"count_hi", i32 17, i64 64, i64 64, i64 384, i32 0, metadata !16} ; [ DW_TAG_member ] [count_hi] [line 17, size 64, align 64, offset 384] [from LONG]
!494 = metadata !{i32 786445, metadata !11, metadata !489, metadata !"data", i32 18, i64 1024, i64 64, i64 448, i32 0, metadata !23} ; [ DW_TAG_member ] [data] [line 18, size 1024, align 64, offset 448] [from ]
!495 = metadata !{i32 786689, metadata !484, metadata !"sha_info", metadata !6, i32 16777254, metadata !487, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sha_info] [line 38]
!496 = metadata !{i32 786688, metadata !484, metadata !"i", metadata !6, i32 40, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 40]
!497 = metadata !{i32 40, i32 9, metadata !484, null}
!498 = metadata !{i32 786688, metadata !484, metadata !"temp", metadata !6, i32 41, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 41]
!499 = metadata !{i32 41, i32 10, metadata !484, null}
!500 = metadata !{i32 786688, metadata !484, metadata !"A", metadata !6, i32 41, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [A] [line 41]
!501 = metadata !{i32 41, i32 16, metadata !484, null}
!502 = metadata !{i32 786688, metadata !484, metadata !"B", metadata !6, i32 41, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [B] [line 41]
!503 = metadata !{i32 41, i32 19, metadata !484, null}
!504 = metadata !{i32 786688, metadata !484, metadata !"C", metadata !6, i32 41, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [C] [line 41]
!505 = metadata !{i32 41, i32 22, metadata !484, null}
!506 = metadata !{i32 786688, metadata !484, metadata !"D", metadata !6, i32 41, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [D] [line 41]
!507 = metadata !{i32 41, i32 25, metadata !484, null}
!508 = metadata !{i32 786688, metadata !484, metadata !"E", metadata !6, i32 41, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [E] [line 41]
!509 = metadata !{i32 41, i32 28, metadata !484, null}
!510 = metadata !{i32 786688, metadata !484, metadata !"W", metadata !6, i32 41, metadata !511, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [W] [line 41]
!511 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 5120, i64 64, i32 0, i32 0, metadata !16, metadata !512, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 5120, align 64, offset 0] [from LONG]
!512 = metadata !{metadata !513}
!513 = metadata !{i32 786465, i64 0, i64 80}      ; [ DW_TAG_subrange_type ] [0, 79]
!514 = metadata !{i32 41, i32 31, metadata !484, null}
!515 = metadata !{i32 43, i32 10, metadata !516, null}
!516 = metadata !{i32 786443, metadata !2, metadata !484, i32 43, i32 5, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!517 = metadata !{i32 43, i32 10, metadata !518, null}
!518 = metadata !{i32 786443, metadata !2, metadata !519, i32 43, i32 10, i32 2, i32 25} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!519 = metadata !{i32 786443, metadata !2, metadata !516, i32 43, i32 10, i32 1, i32 24} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!520 = metadata !{i32 44, i32 2, metadata !521, null}
!521 = metadata !{i32 786443, metadata !2, metadata !516, i32 43, i32 30, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!522 = metadata !{i32 45, i32 5, metadata !521, null}
!523 = metadata !{i32 43, i32 25, metadata !516, null}
!524 = metadata !{i32 46, i32 10, metadata !525, null}
!525 = metadata !{i32 786443, metadata !2, metadata !484, i32 46, i32 5, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!526 = metadata !{i32 46, i32 10, metadata !527, null}
!527 = metadata !{i32 786443, metadata !2, metadata !528, i32 46, i32 10, i32 2, i32 27} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!528 = metadata !{i32 786443, metadata !2, metadata !525, i32 46, i32 10, i32 1, i32 26} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!529 = metadata !{i32 47, i32 2, metadata !530, null}
!530 = metadata !{i32 786443, metadata !2, metadata !525, i32 46, i32 31, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!531 = metadata !{i32 51, i32 5, metadata !530, null}
!532 = metadata !{i32 46, i32 26, metadata !525, null}
!533 = metadata !{i32 52, i32 5, metadata !484, null}
!534 = metadata !{i32 53, i32 5, metadata !484, null}
!535 = metadata !{i32 54, i32 5, metadata !484, null}
!536 = metadata !{i32 55, i32 5, metadata !484, null}
!537 = metadata !{i32 56, i32 5, metadata !484, null}
!538 = metadata !{i32 78, i32 10, metadata !539, null}
!539 = metadata !{i32 786443, metadata !2, metadata !484, i32 78, i32 5, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!540 = metadata !{i32 78, i32 10, metadata !541, null}
!541 = metadata !{i32 786443, metadata !2, metadata !542, i32 78, i32 10, i32 2, i32 29} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!542 = metadata !{i32 786443, metadata !2, metadata !539, i32 78, i32 10, i32 1, i32 28} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!543 = metadata !{i32 79, i32 2, metadata !544, null}
!544 = metadata !{i32 786443, metadata !2, metadata !539, i32 78, i32 30, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!545 = metadata !{i32 80, i32 5, metadata !544, null}
!546 = metadata !{i32 78, i32 25, metadata !539, null}
!547 = metadata !{i32 81, i32 10, metadata !548, null}
!548 = metadata !{i32 786443, metadata !2, metadata !484, i32 81, i32 5, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!549 = metadata !{i32 81, i32 10, metadata !550, null}
!550 = metadata !{i32 786443, metadata !2, metadata !551, i32 81, i32 10, i32 2, i32 31} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!551 = metadata !{i32 786443, metadata !2, metadata !548, i32 81, i32 10, i32 1, i32 30} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!552 = metadata !{i32 82, i32 2, metadata !553, null}
!553 = metadata !{i32 786443, metadata !2, metadata !548, i32 81, i32 31, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!554 = metadata !{i32 83, i32 5, metadata !553, null}
!555 = metadata !{i32 81, i32 26, metadata !548, null}
!556 = metadata !{i32 84, i32 10, metadata !557, null}
!557 = metadata !{i32 786443, metadata !2, metadata !484, i32 84, i32 5, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!558 = metadata !{i32 84, i32 10, metadata !559, null}
!559 = metadata !{i32 786443, metadata !2, metadata !560, i32 84, i32 10, i32 2, i32 33} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!560 = metadata !{i32 786443, metadata !2, metadata !557, i32 84, i32 10, i32 1, i32 32} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!561 = metadata !{i32 85, i32 2, metadata !562, null}
!562 = metadata !{i32 786443, metadata !2, metadata !557, i32 84, i32 31, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!563 = metadata !{i32 86, i32 5, metadata !562, null}
!564 = metadata !{i32 84, i32 26, metadata !557, null}
!565 = metadata !{i32 87, i32 10, metadata !566, null}
!566 = metadata !{i32 786443, metadata !2, metadata !484, i32 87, i32 5, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!567 = metadata !{i32 87, i32 10, metadata !568, null}
!568 = metadata !{i32 786443, metadata !2, metadata !569, i32 87, i32 10, i32 2, i32 35} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!569 = metadata !{i32 786443, metadata !2, metadata !566, i32 87, i32 10, i32 1, i32 34} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!570 = metadata !{i32 88, i32 2, metadata !571, null}
!571 = metadata !{i32 786443, metadata !2, metadata !566, i32 87, i32 31, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!572 = metadata !{i32 89, i32 5, metadata !571, null}
!573 = metadata !{i32 87, i32 26, metadata !566, null}
!574 = metadata !{i32 91, i32 5, metadata !484, null}
!575 = metadata !{i32 92, i32 5, metadata !484, null}
!576 = metadata !{i32 93, i32 5, metadata !484, null}
!577 = metadata !{i32 94, i32 5, metadata !484, null}
!578 = metadata !{i32 95, i32 5, metadata !484, null}
!579 = metadata !{i32 96, i32 1, metadata !484, null}
!580 = metadata !{i32 139, i32 27, metadata !581, null}
!581 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"sha_update", metadata !"sha_update", metadata !"", i32 139, metadata !582, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.SHA_INFO.2*, i8*, i32)* @sha_update_original, null, null, metadata !3, i32 140} ; [ DW_TAG_subprogram ] [line 139] [def] [scope 140] [sha_update]
!582 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !583, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!583 = metadata !{null, metadata !584, metadata !29, metadata !32}
!584 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !585} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from SHA_INFO]
!585 = metadata !{i32 786454, metadata !11, null, metadata !"SHA_INFO", i32 19, i64 0, i64 0, i64 0, i32 0, metadata !586} ; [ DW_TAG_typedef ] [SHA_INFO] [line 19, size 0, align 0, offset 0] [from ]
!586 = metadata !{i32 786451, metadata !11, null, metadata !"", i32 15, i64 1472, i64 64, i32 0, i32 0, null, metadata !587, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 15, size 1472, align 64, offset 0] [def] [from ]
!587 = metadata !{metadata !588, metadata !589, metadata !590, metadata !591}
!588 = metadata !{i32 786445, metadata !11, metadata !586, metadata !"digest", i32 16, i64 320, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [digest] [line 16, size 320, align 64, offset 0] [from ]
!589 = metadata !{i32 786445, metadata !11, metadata !586, metadata !"count_lo", i32 17, i64 64, i64 64, i64 320, i32 0, metadata !16} ; [ DW_TAG_member ] [count_lo] [line 17, size 64, align 64, offset 320] [from LONG]
!590 = metadata !{i32 786445, metadata !11, metadata !586, metadata !"count_hi", i32 17, i64 64, i64 64, i64 384, i32 0, metadata !16} ; [ DW_TAG_member ] [count_hi] [line 17, size 64, align 64, offset 384] [from LONG]
!591 = metadata !{i32 786445, metadata !11, metadata !586, metadata !"data", i32 18, i64 1024, i64 64, i64 448, i32 0, metadata !23} ; [ DW_TAG_member ] [data] [line 18, size 1024, align 64, offset 448] [from ]
!592 = metadata !{i32 786689, metadata !581, metadata !"sha_info", metadata !6, i32 16777355, metadata !584, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sha_info] [line 139]
!593 = metadata !{i32 786689, metadata !581, metadata !"buffer", metadata !6, i32 33554571, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buffer] [line 139]
!594 = metadata !{i32 139, i32 43, metadata !581, null}
!595 = metadata !{i32 786689, metadata !581, metadata !"count", metadata !6, i32 50331787, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 139]
!596 = metadata !{i32 139, i32 55, metadata !581, null}
!597 = metadata !{i32 141, i32 9, metadata !598, null}
!598 = metadata !{i32 786443, metadata !2, metadata !581, i32 141, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!599 = metadata !{i32 142, i32 2, metadata !600, null}
!600 = metadata !{i32 786443, metadata !2, metadata !598, i32 141, i32 74, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!601 = metadata !{i32 143, i32 5, metadata !600, null}
!602 = metadata !{i32 144, i32 5, metadata !581, null}
!603 = metadata !{i32 145, i32 5, metadata !581, null}
!604 = metadata !{i32 146, i32 5, metadata !581, null}
!605 = metadata !{i32 146, i32 5, metadata !606, null}
!606 = metadata !{i32 786443, metadata !2, metadata !581, i32 146, i32 5, i32 1, i32 21} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!607 = metadata !{i32 147, i32 2, metadata !608, null}
!608 = metadata !{i32 786443, metadata !2, metadata !581, i32 146, i32 36, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/security/sha/sha.c]
!609 = metadata !{i32 149, i32 2, metadata !608, null}
!610 = metadata !{i32 151, i32 2, metadata !608, null}
!611 = metadata !{i32 152, i32 2, metadata !608, null}
!612 = metadata !{i32 153, i32 2, metadata !608, null}
!613 = metadata !{i32 154, i32 5, metadata !608, null}
!614 = metadata !{i32 155, i32 5, metadata !581, null}
!615 = metadata !{i32 156, i32 1, metadata !581, null}
