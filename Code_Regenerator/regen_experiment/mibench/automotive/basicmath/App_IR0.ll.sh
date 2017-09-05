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
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
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
%struct.int_sqrt.0 = type { i32, i32 }

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
@sdmprofile__BBcounter_57 = global i64 0, align 8
@sdmprofile__BBcounter_58 = global i64 0, align 8
@sdmprofile__BBcounter_59 = global i64 0, align 8
@sdmprofile__BBcounter_60 = global i64 0, align 8
@sdmprofile__BBcounter_61 = global i64 0, align 8
@sdmprofile__BBcounter_62 = global i64 0, align 8
@sdmprofile__BBcounter_63 = global i64 0, align 8
@sdmprofile__BBcounter_64 = global i64 0, align 8
@sdmprofile__BBcounter_65 = global i64 0, align 8
@sdmprofile__BBcounter_66 = global i64 0, align 8
@sdmprofile__BBcounter_67 = global i64 0, align 8
@sdmprofile__BBcounter_68 = global i64 0, align 8
@sdmprofile__BBcounter_69 = global i64 0, align 8
@sdmprofile__BBcounter_70 = global i64 0, align 8
@sdmprofile__BBcounter_71 = global i64 0, align 8
@sdmprofile__BBcounter_72 = global i64 0, align 8
@sdmprofile__BBcounter_73 = global i64 0, align 8
@sdmprofile__BBcounter_74 = global i64 0, align 8
@sdmprofile__BBcounter_75 = global i64 0, align 8
@sdmprofile__BBcounter_76 = global i64 0, align 8
@sdmprofile__BBcounter_77 = global i64 0, align 8
@sdmprofile__BBcounter_78 = global i64 0, align 8
@sdmprofile__BBcounter_79 = global i64 0, align 8
@sdmprofile__BBcounter_80 = global i64 0, align 8
@sdmprofile__BBcounter_81 = global i64 0, align 8
@sdmprofile__BBcounter_82 = global i64 0, align 8
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
@stderr = external global %struct._IO_FILE*
@.str17 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str18 = private unnamed_addr constant [14 x i8] c"%s:%lu:%s/%s\0A\00", align 1
@.str20 = private unnamed_addr constant [46 x i8] c"[Global Variable Summary] ALL: %d, NVRAM: %d\0A\00", align 1
@.str21 = private unnamed_addr constant [125 x i8] c"\0AStack Variable Memory Region Profile Result\0A\0AIndex,Read Count,Write Count,Memory Size,Estimated Name, Type, Function Name  \00", align 1
@.str22 = private unnamed_addr constant [14 x i8] c"%s:%lu:%s:%s\0A\00", align 1
@.str23 = private unnamed_addr constant [65 x i8] c"[Heap Variable Summary] : %d heap variables among %d fit nvram \0A\00", align 1
@_ZNSs4_Rep20_S_empty_rep_storageE = external global [0 x i64]
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_pFunctions.cpp, i8* null }]
@.str1 = private unnamed_addr constant [39 x i8] c"********* CUBIC FUNCTIONS ***********\0A\00", align 1
@.str16 = private unnamed_addr constant [11 x i8] c"Solutions:\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c" %f\00", align 1
@.str37 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str48 = private unnamed_addr constant [41 x i8] c"********* INTEGER SQR ROOTS ***********\0A\00", align 1
@.str59 = private unnamed_addr constant [17 x i8] c"sqrt(%3d) = %2d\0A\00", align 1
@.str610 = private unnamed_addr constant [16 x i8] c"sqrt(%lX) = %X\0A\00", align 1
@.str711 = private unnamed_addr constant [40 x i8] c"********* ANGLE CONVERSION ***********\0A\00", align 1
@.str812 = private unnamed_addr constant [31 x i8] c"%3.0f degrees = %.12f radians\0A\00", align 1
@.str913 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str1014 = private unnamed_addr constant [31 x i8] c"%.12f radians = %3.0f degrees\0A\00", align 1

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
  store %struct.HeapAllocationMeta* %0, %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !45
  %call1 = tail call i32 @_Z17RegisterNewThreadv()
  store i32 %call1, i32* @sdmprofile__MainthreadNumber, align 4, !tbaa !49
  %1 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !45
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %1, i64 0, i32 1
  %2 = bitcast i8** %upperbound to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 20, i32 8, i1 false)
  %3 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !45
  %ptr = getelementptr inbounds %struct.HeapAllocationMeta* %3, i64 0, i32 0
  store i8* null, i8** %ptr, align 8, !tbaa !51
  store i64 0, i64* getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 0), align 8, !tbaa !54
  store i8* null, i8** getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 3), align 8, !tbaa !56
  store i32 0, i32* getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 4), align 8, !tbaa !57
  call void @llvm.memset.p0i8.i64(i8* bitcast (i8** getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 5) to i8*), i8 0, i64 24, i32 8, i1 false)
  %4 = load i32* @sdmprofile__IncludeStackProfiling, align 4, !tbaa !49
  %tobool = icmp eq i32 %4, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call2 = tail call noalias i8* @malloc(i64 240000) #2
  %5 = bitcast i8* %call2 to %struct.sdmprofile__Allocated_Stack_item*
  store %struct.sdmprofile__Allocated_Stack_item* %5, %struct.sdmprofile__Allocated_Stack_item** @sdmprofile__MainthreadStack_allo, align 8, !tbaa !45
  %ptr.ind.end = getelementptr i8* %call2, i64 240000
  %6 = bitcast i8* %ptr.ind.end to %struct.sdmprofile__Allocated_Stack_item*
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %if.then
  %index = phi i64 [ 0, %if.then ], [ %index.next.1, %vector.body ]
  %gep.idx1315 = or i64 %index, 1
  %7 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index, i32 0
  %8 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315, i32 0
  store i8* null, i8** %7, align 8, !tbaa !58
  store i8* null, i8** %8, align 8, !tbaa !58
  %9 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index, i32 2
  %10 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315, i32 2
  store i8* null, i8** %9, align 8, !tbaa !60
  store i8* null, i8** %10, align 8, !tbaa !60
  %index.next = add i64 %index, 2
  %gep.idx1315.1 = or i64 %index.next, 1
  %11 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index.next, i32 0
  %12 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315.1, i32 0
  store i8* null, i8** %11, align 8, !tbaa !58
  store i8* null, i8** %12, align 8, !tbaa !58
  %13 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index.next, i32 2
  %14 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315.1, i32 2
  store i8* null, i8** %13, align 8, !tbaa !60
  store i8* null, i8** %14, align 8, !tbaa !60
  %index.next.1 = add i64 %index.next, 2
  %15 = icmp eq i64 %index.next.1, 10000
  br i1 %15, label %if.end.loopexit, label %vector.body, !llvm.loop !61

if.end.loopexit:                                  ; preds = %vector.body
  br label %if.end

if.end:                                           ; preds = %if.end.loopexit, %entry
  store double 0.000000e+00, double* @sdmprofile__AppEndTime, align 8, !tbaa !64
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind uwtable
define i32 @_Z17RegisterNewThreadv() #3 {
entry:
  %call = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %0 = load i32* @thdsCount, align 4, !tbaa !49
  %idxprom = sext i32 %0 to i64
  %threadnumber = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 0
  store i32 %0, i32* %threadnumber, align 8, !tbaa !66
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @thdsCount, align 4, !tbaa !49
  %call1 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %call2 = tail call i64 @pthread_self() #12
  %threadID = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 1
  store i64 %call2, i64* %threadID, align 8, !tbaa !68
  %call3 = tail call double @sdmprofile__getRealTime()
  %ThreadStartTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 2
  store double %call3, double* %ThreadStartTime, align 8, !tbaa !69
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double 0.000000e+00, double* %ThreadEndTime, align 8, !tbaa !70
  %Malloc_Calls = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 6
  %1 = bitcast i64* %Malloc_Calls to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 88, i32 8, i1 false)
  %2 = load i32* @sdmprofile__profileAction, align 4, !tbaa !49
  switch i32 %2, label %if.end [
    i32 4, label %if.then
    i32 1, label %if.then
  ]

if.then:                                          ; preds = %entry, %entry
  %call5 = tail call noalias i8* @malloc(i64 128) #2
  %3 = bitcast i8* %call5 to %struct.Cache2_Item*
  %Cache2_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 19
  store %struct.Cache2_Item* %3, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !71
  %4 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !45
  %ptr = bitcast i8* %call5 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !72
  %add.ptr8 = getelementptr inbounds i8* %call5, i64 16
  %5 = bitcast i8* %add.ptr8 to %struct.Cache2_Item*
  %next = getelementptr inbounds i8* %call5, i64 8
  %6 = bitcast i8* %next to %struct.Cache2_Item**
  store %struct.Cache2_Item* %5, %struct.Cache2_Item** %6, align 8, !tbaa !74
  %ptr.1 = getelementptr inbounds i8* %call5, i64 16
  %7 = bitcast i8* %ptr.1 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %7, align 8, !tbaa !72
  %add.ptr8.1 = getelementptr inbounds i8* %call5, i64 32
  %8 = bitcast i8* %add.ptr8.1 to %struct.Cache2_Item*
  %next.1 = getelementptr inbounds i8* %call5, i64 24
  %9 = bitcast i8* %next.1 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %8, %struct.Cache2_Item** %9, align 8, !tbaa !74
  %ptr.2 = getelementptr inbounds i8* %call5, i64 32
  %10 = bitcast i8* %ptr.2 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %10, align 8, !tbaa !72
  %add.ptr8.2 = getelementptr inbounds i8* %call5, i64 48
  %11 = bitcast i8* %add.ptr8.2 to %struct.Cache2_Item*
  %next.2 = getelementptr inbounds i8* %call5, i64 40
  %12 = bitcast i8* %next.2 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %11, %struct.Cache2_Item** %12, align 8, !tbaa !74
  %ptr.3 = getelementptr inbounds i8* %call5, i64 48
  %13 = bitcast i8* %ptr.3 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %13, align 8, !tbaa !72
  %add.ptr8.3 = getelementptr inbounds i8* %call5, i64 64
  %14 = bitcast i8* %add.ptr8.3 to %struct.Cache2_Item*
  %next.3 = getelementptr inbounds i8* %call5, i64 56
  %15 = bitcast i8* %next.3 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %14, %struct.Cache2_Item** %15, align 8, !tbaa !74
  %ptr.4 = getelementptr inbounds i8* %call5, i64 64
  %16 = bitcast i8* %ptr.4 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %16, align 8, !tbaa !72
  %add.ptr8.4 = getelementptr inbounds i8* %call5, i64 80
  %17 = bitcast i8* %add.ptr8.4 to %struct.Cache2_Item*
  %next.4 = getelementptr inbounds i8* %call5, i64 72
  %18 = bitcast i8* %next.4 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %17, %struct.Cache2_Item** %18, align 8, !tbaa !74
  %ptr.5 = getelementptr inbounds i8* %call5, i64 80
  %19 = bitcast i8* %ptr.5 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %19, align 8, !tbaa !72
  %add.ptr8.5 = getelementptr inbounds i8* %call5, i64 96
  %20 = bitcast i8* %add.ptr8.5 to %struct.Cache2_Item*
  %next.5 = getelementptr inbounds i8* %call5, i64 88
  %21 = bitcast i8* %next.5 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %20, %struct.Cache2_Item** %21, align 8, !tbaa !74
  %ptr.6 = getelementptr inbounds i8* %call5, i64 96
  %22 = bitcast i8* %ptr.6 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %22, align 8, !tbaa !72
  %add.ptr8.6 = getelementptr inbounds i8* %call5, i64 112
  %23 = bitcast i8* %add.ptr8.6 to %struct.Cache2_Item*
  %next.6 = getelementptr inbounds i8* %call5, i64 104
  %24 = bitcast i8* %next.6 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %23, %struct.Cache2_Item** %24, align 8, !tbaa !74
  %add.ptr10 = getelementptr inbounds i8* %call5, i64 112
  %ptr11 = bitcast i8* %add.ptr10 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %ptr11, align 8, !tbaa !72
  %next13 = getelementptr inbounds i8* %call5, i64 120
  %25 = bitcast i8* %next13 to %struct.Cache2_Item**
  store %struct.Cache2_Item* null, %struct.Cache2_Item** %25, align 8, !tbaa !74
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %.off = add i32 %2, -3
  %26 = icmp ult i32 %.off, 2
  br i1 %26, label %if.then17, label %if.end39

if.then17:                                        ; preds = %if.end
  %call19 = tail call noalias i8* @malloc(i64 128) #2
  %27 = bitcast i8* %call19 to %struct.GVCache_Item*
  %GVCache_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 20
  store %struct.GVCache_Item* %27, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !75
  %ptr27 = bitcast i8* %call19 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %ptr27, align 8, !tbaa !76
  %add.ptr30 = getelementptr inbounds i8* %call19, i64 16
  %28 = bitcast i8* %add.ptr30 to %struct.GVCache_Item*
  %next31 = getelementptr inbounds i8* %call19, i64 8
  %29 = bitcast i8* %next31 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %28, %struct.GVCache_Item** %29, align 8, !tbaa !78
  %ptr27.1 = getelementptr inbounds i8* %call19, i64 16
  %30 = bitcast i8* %ptr27.1 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %30, align 8, !tbaa !76
  %add.ptr30.1 = getelementptr inbounds i8* %call19, i64 32
  %31 = bitcast i8* %add.ptr30.1 to %struct.GVCache_Item*
  %next31.1 = getelementptr inbounds i8* %call19, i64 24
  %32 = bitcast i8* %next31.1 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %31, %struct.GVCache_Item** %32, align 8, !tbaa !78
  %ptr27.2 = getelementptr inbounds i8* %call19, i64 32
  %33 = bitcast i8* %ptr27.2 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %33, align 8, !tbaa !76
  %add.ptr30.2 = getelementptr inbounds i8* %call19, i64 48
  %34 = bitcast i8* %add.ptr30.2 to %struct.GVCache_Item*
  %next31.2 = getelementptr inbounds i8* %call19, i64 40
  %35 = bitcast i8* %next31.2 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %34, %struct.GVCache_Item** %35, align 8, !tbaa !78
  %ptr27.3 = getelementptr inbounds i8* %call19, i64 48
  %36 = bitcast i8* %ptr27.3 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %36, align 8, !tbaa !76
  %add.ptr30.3 = getelementptr inbounds i8* %call19, i64 64
  %37 = bitcast i8* %add.ptr30.3 to %struct.GVCache_Item*
  %next31.3 = getelementptr inbounds i8* %call19, i64 56
  %38 = bitcast i8* %next31.3 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %37, %struct.GVCache_Item** %38, align 8, !tbaa !78
  %ptr27.4 = getelementptr inbounds i8* %call19, i64 64
  %39 = bitcast i8* %ptr27.4 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %39, align 8, !tbaa !76
  %add.ptr30.4 = getelementptr inbounds i8* %call19, i64 80
  %40 = bitcast i8* %add.ptr30.4 to %struct.GVCache_Item*
  %next31.4 = getelementptr inbounds i8* %call19, i64 72
  %41 = bitcast i8* %next31.4 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %40, %struct.GVCache_Item** %41, align 8, !tbaa !78
  %ptr27.5 = getelementptr inbounds i8* %call19, i64 80
  %42 = bitcast i8* %ptr27.5 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %42, align 8, !tbaa !76
  %add.ptr30.5 = getelementptr inbounds i8* %call19, i64 96
  %43 = bitcast i8* %add.ptr30.5 to %struct.GVCache_Item*
  %next31.5 = getelementptr inbounds i8* %call19, i64 88
  %44 = bitcast i8* %next31.5 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %43, %struct.GVCache_Item** %44, align 8, !tbaa !78
  %ptr27.6 = getelementptr inbounds i8* %call19, i64 96
  %45 = bitcast i8* %ptr27.6 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %45, align 8, !tbaa !76
  %add.ptr30.6 = getelementptr inbounds i8* %call19, i64 112
  %46 = bitcast i8* %add.ptr30.6 to %struct.GVCache_Item*
  %next31.6 = getelementptr inbounds i8* %call19, i64 104
  %47 = bitcast i8* %next31.6 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %46, %struct.GVCache_Item** %47, align 8, !tbaa !78
  %add.ptr35 = getelementptr inbounds i8* %call19, i64 112
  %ptr36 = bitcast i8* %add.ptr35 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %ptr36, align 8, !tbaa !76
  %next38 = getelementptr inbounds i8* %call19, i64 120
  %48 = bitcast i8* %next38 to %struct.GVCache_Item**
  store %struct.GVCache_Item* null, %struct.GVCache_Item** %48, align 8, !tbaa !78
  br label %if.end39

if.end39:                                         ; preds = %if.then17, %if.end
  %49 = load i32* @sdmprofile__IncludeStackProfiling, align 4, !tbaa !49
  %tobool = icmp eq i32 %49, 0
  br i1 %tobool, label %if.end42, label %if.then40

if.then40:                                        ; preds = %if.end39
  %call41 = tail call noalias i8* @malloc(i64 240000) #2
  %50 = bitcast i8* %call41 to %struct.sdmprofile__Allocated_Stack_item*
  %Stack_allocations_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 4
  store %struct.sdmprofile__Allocated_Stack_item* %50, %struct.sdmprofile__Allocated_Stack_item** %Stack_allocations_head, align 8, !tbaa !79
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %if.end39
  %51 = load i32* %threadnumber, align 8, !tbaa !66
  ret i32 %51
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__Embed_metadata_GV(i64 %index__, i8* %AtAddress, i32 %size_, i8* %Name_string_ptr, i8* %DataType_string_ptr, i8* %FilenameStringptr_, i8* %FileDirStringptr_, i64 %linenumber__) #3 {
entry:
  %I = alloca %struct.GVMeta*, align 8
  %call = tail call noalias i8* @malloc(i64 88) #2
  %0 = bitcast i8* %call to %struct.GVMeta*
  store %struct.GVMeta* %0, %struct.GVMeta** %I, align 8, !tbaa !45
  %index = bitcast i8* %call to i64*
  store i64 %index__, i64* %index, align 8, !tbaa !54
  %address = getelementptr inbounds i8* %call, i64 24
  %1 = bitcast i8* %address to i8**
  store i8* %AtAddress, i8** %1, align 8, !tbaa !56
  %size = getelementptr inbounds i8* %call, i64 32
  %2 = bitcast i8* %size to i32*
  store i32 %size_, i32* %2, align 4, !tbaa !57
  %VarName = getelementptr inbounds i8* %call, i64 40
  %3 = bitcast i8* %VarName to i8**
  store i8* %Name_string_ptr, i8** %3, align 8, !tbaa !80
  %DataTypeString = getelementptr inbounds i8* %call, i64 48
  %4 = bitcast i8* %DataTypeString to i8**
  store i8* %DataType_string_ptr, i8** %4, align 8, !tbaa !81
  %5 = ptrtoint i8* %AtAddress to i64
  %conv = zext i32 %size_ to i64
  %add = add i64 %conv, %5
  %6 = inttoptr i64 %add to i8*
  %upperbound = getelementptr inbounds i8* %call, i64 56
  %7 = bitcast i8* %upperbound to i8**
  store i8* %6, i8** %7, align 8, !tbaa !82
  %r = getelementptr inbounds i8* %call, i64 8
  %FileName = getelementptr inbounds i8* %call, i64 64
  %8 = bitcast i8* %FileName to i8**
  call void @llvm.memset.p0i8.i64(i8* %r, i8 0, i64 16, i32 8, i1 false)
  store i8* %FilenameStringptr_, i8** %8, align 8, !tbaa !83
  %DirName = getelementptr inbounds i8* %call, i64 72
  %9 = bitcast i8* %DirName to i8**
  store i8* %FileDirStringptr_, i8** %9, align 8, !tbaa !84
  %linenumber = getelementptr inbounds i8* %call, i64 80
  %10 = bitcast i8* %linenumber to i64*
  store i64 %linenumber__, i64* %10, align 8, !tbaa !85
  call void @_ZNSt12forward_listIP6GVMetaSaIS1_EE10push_frontERKS1_(%"class.std::forward_list"* @GVMetalist, %struct.GVMeta** dereferenceable(8) %I)
  %11 = load i8** @GV_AddrRangeHead, align 8, !tbaa !45
  %cmp = icmp eq i8* %11, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i8* %AtAddress, i8** @GV_AddrRangeHead, align 8, !tbaa !45
  store i8* %6, i8** @GV_AddrRangeTail, align 8, !tbaa !45
  br label %if.end12

if.else:                                          ; preds = %entry
  %cmp3 = icmp ugt i8* %11, %AtAddress
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.else
  store i8* %AtAddress, i8** @GV_AddrRangeHead, align 8, !tbaa !45
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.else
  %12 = load i8** @GV_AddrRangeTail, align 8, !tbaa !45
  %cmp7 = icmp ult i8* %12, %6
  br i1 %cmp7, label %if.then8, label %if.end12

if.then8:                                         ; preds = %if.end
  store i8* %6, i8** @GV_AddrRangeTail, align 8, !tbaa !45
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
  store i64 %index__, i64* %index, align 8, !tbaa !86
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 3
  store i32 %size_, i32* %size, align 8, !tbaa !88
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 4
  store i8* %Estimated_Name_string_ptr, i8** %EstimatedName, align 8, !tbaa !89
  %DataTypeString = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 5
  store i8* %DataType_string_ptr, i8** %DataTypeString, align 8, !tbaa !90
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 6
  store i8* %FunctionName_string_ptr, i8** %FunctionName, align 8, !tbaa !91
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__Embed_metadata_HP(i32 %index__, i8* %Estimated_Name_string_ptr, i8* %DataType_string_ptr, i8* %FunctionName_string_ptr, i64 %linenumber__, i8* %SourceFile__) #3 {
entry:
  %idxprom = zext i32 %index__ to i64
  %index = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 0
  store i32 %index__, i32* %index, align 16, !tbaa !92
  %EstimatedName = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 3
  store i8* %Estimated_Name_string_ptr, i8** %EstimatedName, align 8, !tbaa !94
  %EstimatedDataTypeString = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 4
  store i8* %DataType_string_ptr, i8** %EstimatedDataTypeString, align 16, !tbaa !95
  %FunctionName = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 5
  store i8* %FunctionName_string_ptr, i8** %FunctionName, align 8, !tbaa !96
  %linenumber = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 6
  store i64 %linenumber__, i64* %linenumber, align 16, !tbaa !97
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 7
  store i8* %SourceFile__, i8** %SourceFile, align 8, !tbaa !98
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
  %0 = load %struct.GVMeta** %call4, align 8, !tbaa !45
  %index = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 0
  %1 = load i64* %index, align 8, !tbaa !54
  %cmp = icmp eq i64 %1, %index__
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %r = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 1
  %2 = load i64* %r, align 8, !tbaa !99
  %add = add i64 %2, %mul
  store i64 %add, i64* %r, align 8, !tbaa !99
  %w = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 2
  %3 = load i64* %w, align 8, !tbaa !100
  %add8 = add i64 %3, %mul7
  store i64 %add8, i64* %w, align 8, !tbaa !100
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
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !101
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
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !105
  %_M_node2 = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %__x, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_node2, align 8, !tbaa !105
  %cmp = icmp ne %"struct.std::_Fwd_list_node_base"* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(8) %struct.GVMeta** @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEdeEv(%"struct.std::_Fwd_list_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !105
  %1 = bitcast %"struct.std::_Fwd_list_node_base"* %0 to %"struct.std::_Fwd_list_node"*
  %call = tail call %struct.GVMeta** @_ZNSt14_Fwd_list_nodeIP6GVMetaE9_M_valptrEv(%"struct.std::_Fwd_list_node"* %1) #2
  ret %struct.GVMeta** %call
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %this) #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !105
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %0, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !107
  store %"struct.std::_Fwd_list_node_base"* %1, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !105
  ret %"struct.std::_Fwd_list_iterator"* %this
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__AddBBHitcount_ST(i64 %index__, i64 %BBhitcount, i32 %Rcount, i32 %Wcount) #3 {
entry:
  %r = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 1
  %0 = load i64* %r, align 8, !tbaa !108
  %conv = sext i32 %Rcount to i64
  %mul = mul i64 %conv, %BBhitcount
  %add = add i64 %0, %mul
  store i64 %add, i64* %r, align 8, !tbaa !108
  %w = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 2
  %1 = load i64* %w, align 8, !tbaa !109
  %conv4 = sext i32 %Wcount to i64
  %mul5 = mul i64 %conv4, %BBhitcount
  %add6 = add i64 %1, %mul5
  store i64 %add6, i64* %w, align 8, !tbaa !109
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
  store i64 %cc, i64* %arrayidx, align 8, !tbaa !110
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
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !70
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
  %0 = load i64* %tv_sec, align 8, !tbaa !111
  %conv = sitofp i64 %0 to double
  %tv_nsec = getelementptr inbounds %struct.timespec* %ts, i64 0, i32 1
  %1 = load i64* %tv_nsec, align 8, !tbaa !113
  %conv1 = sitofp i64 %1 to double
  %div = fdiv double %conv1, 1.000000e+09
  %add = fadd double %conv, %div
  br label %return

if.end:                                           ; preds = %entry
  %call2 = call i32 @gettimeofday(%struct.timeval* %tm, %struct.timezone* null) #2
  %tv_sec3 = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 0
  %2 = load i64* %tv_sec3, align 8, !tbaa !114
  %conv4 = sitofp i64 %2 to double
  %tv_usec = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 1
  %3 = load i64* %tv_usec, align 8, !tbaa !116
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
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !70
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template3(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %conv = zext i32 %call to i64
  %call4 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %conv, i32 3
  store double %call4, double* %ThreadEndTime, align 8, !tbaa !70
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template4(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %conv = zext i32 %call to i64
  %call4 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %conv, i32 3
  store double %call4, double* %ThreadEndTime, align 8, !tbaa !70
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template5(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %call2 = tail call double @sdmprofile__getRealTime()
  %idxprom = zext i32 %call to i64
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !70
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template6(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %idxprom = zext i32 %call to i64
  %call2 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !70
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define i8* @sdmprofile__malloc(i64 %size_, i32 %heap_index, i32 %thdnumber) #3 {
entry:
  %I = alloca %struct.HeapAllocationMeta*, align 8
  %call = tail call noalias i8* @malloc(i64 %size_) #2
  %idxprom = zext i32 %thdnumber to i64
  %Malloc_Calls = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 6
  %0 = load i64* %Malloc_Calls, align 8, !tbaa !117
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Malloc_Calls, align 8, !tbaa !117
  %call1 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %call2 = tail call noalias i8* @malloc(i64 40) #2
  %1 = bitcast i8* %call2 to %struct.HeapAllocationMeta*
  store %struct.HeapAllocationMeta* %1, %struct.HeapAllocationMeta** %I, align 8, !tbaa !45
  %ptr = bitcast i8* %call2 to i8**
  store i8* %call, i8** %ptr, align 8, !tbaa !51
  %2 = ptrtoint i8* %call to i64
  %add = add i64 %2, %size_
  %3 = inttoptr i64 %add to i8*
  %upperbound = getelementptr inbounds i8* %call2, i64 8
  %4 = bitcast i8* %upperbound to i8**
  store i8* %3, i8** %4, align 8, !tbaa !118
  %size = getelementptr inbounds i8* %call2, i64 16
  %5 = bitcast i8* %size to i64*
  store i64 %size_, i64* %5, align 8, !tbaa !119
  %heapindex = getelementptr inbounds i8* %call2, i64 24
  %6 = bitcast i8* %heapindex to i32*
  store i32 %heap_index, i32* %6, align 4, !tbaa !120
  call void @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE10push_frontERKS1_(%"class.std::list"* @HeapAllocationList, %struct.HeapAllocationMeta** dereferenceable(8) %I)
  %call3 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %Current_Heap_Allocation = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 10
  %7 = load i64* %Current_Heap_Allocation, align 8, !tbaa !121
  %inc6 = add i64 %7, 1
  store i64 %inc6, i64* %Current_Heap_Allocation, align 8, !tbaa !121
  %Peak_Heap_Allocation = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 8
  %8 = load i64* %Peak_Heap_Allocation, align 8, !tbaa !122
  %cmp = icmp ult i64 %8, %inc6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 %inc6, i64* %Peak_Heap_Allocation, align 8, !tbaa !122
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %idxprom18 = zext i32 %heap_index to i64
  %arrayidx19 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18
  store %struct.HPMeta* %arrayidx19, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !45
  %hitcount = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 8
  %9 = load i64* %hitcount, align 16, !tbaa !123
  %cmp20 = icmp eq i64 %9, 0
  %MaxSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 9
  br i1 %cmp20, label %if.then21, label %if.else

if.then21:                                        ; preds = %if.end
  store i64 %size_, i64* %MaxSize, align 8, !tbaa !124
  %MinSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 10
  store i64 %size_, i64* %MinSize, align 16, !tbaa !125
  br label %if.end32

if.else:                                          ; preds = %if.end
  %10 = load i64* %MaxSize, align 8, !tbaa !124
  %cmp23 = icmp ult i64 %10, %size_
  br i1 %cmp23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %if.else
  store i64 %size_, i64* %MaxSize, align 8, !tbaa !124
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %if.else
  %MinSize27 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 10
  %11 = load i64* %MinSize27, align 16, !tbaa !125
  %cmp28 = icmp ugt i64 %11, %size_
  br i1 %cmp28, label %if.then29, label %if.end32

if.then29:                                        ; preds = %if.end26
  store i64 %size_, i64* %MinSize27, align 16, !tbaa !125
  br label %if.end32

if.end32:                                         ; preds = %if.then29, %if.end26, %if.then21
  %hitcount33 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 8
  %inc34 = add i64 %9, 1
  store i64 %inc34, i64* %hitcount33, align 16, !tbaa !123
  %12 = load i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !45
  %cmp35 = icmp eq i8* %12, null
  br i1 %cmp35, label %if.then36, label %if.else38

if.then36:                                        ; preds = %if.end32
  store i8* %call, i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !45
  store i8* %3, i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !45
  br label %if.end47

if.else38:                                        ; preds = %if.end32
  %cmp39 = icmp ugt i8* %12, %call
  br i1 %cmp39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.else38
  store i8* %call, i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !45
  br label %if.end41

if.end41:                                         ; preds = %if.then40, %if.else38
  %13 = load i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !45
  %cmp43 = icmp ult i8* %13, %3
  br i1 %cmp43, label %if.then44, label %if.end47

if.then44:                                        ; preds = %if.end41
  store i8* %3, i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !45
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
  %0 = load i64* %Free_Calls, align 8, !tbaa !126
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Free_Calls, align 8, !tbaa !126
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
  %1 = load %struct.HeapAllocationMeta** %call5, align 8, !tbaa !45
  %ptr = getelementptr inbounds %struct.HeapAllocationMeta* %1, i64 0, i32 0
  %2 = load i8** %ptr, align 8, !tbaa !51
  %cmp = icmp eq i8* %2, %pointer
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %ptr.lcssa = phi i8** [ %ptr, %for.body ]
  %call5.lcssa = phi %struct.HeapAllocationMeta** [ %call5, %for.body ]
  store i8* null, i8** %ptr.lcssa, align 8, !tbaa !51
  %3 = load %struct.HeapAllocationMeta** %call5.lcssa, align 8, !tbaa !45
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %3, i64 0, i32 1
  store i8* null, i8** %upperbound, align 8, !tbaa !118
  %4 = load %struct.HeapAllocationMeta** %call5.lcssa, align 8, !tbaa !45
  %size = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 2
  store i64 0, i64* %size, align 8, !tbaa !119
  %heapindex = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 3
  store i32 0, i32* %heapindex, align 4, !tbaa !120
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
  %5 = load i64* %Current_Heap_Allocation, align 8, !tbaa !121
  %dec = add i64 %5, -1
  store i64 %dec, i64* %Current_Heap_Allocation, align 8, !tbaa !121
  call void @free(i8* %pointer) #2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden %"struct.std::__detail::_List_node_base"* @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE5beginEv(%"class.std::list"* nocapture readonly %this) #3 align 2 {
entry:
  %retval = alloca %"struct.std::_List_iterator", align 8
  %_M_next = getelementptr inbounds %"class.std::list"* %this, i64 0, i32 0, i32 0, i32 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !127
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
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !131
  %_M_node2 = getelementptr inbounds %"struct.std::_List_iterator"* %__x, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_node2, align 8, !tbaa !131
  %cmp = icmp ne %"struct.std::__detail::_List_node_base"* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(8) %struct.HeapAllocationMeta** @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEdeEv(%"struct.std::_List_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_List_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !131
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
  store %"struct.std::__detail::_List_node_base"* %call2, %"struct.std::__detail::_List_node_base"** %0, align 8, !tbaa !45
  %call420 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__first, %"struct.std::_List_iterator"* dereferenceable(8) %__last)
  br i1 %call420, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %entry
  %1 = getelementptr inbounds %"struct.std::_List_iterator"* %__next, i64 0, i32 0
  br label %while.body

while.body:                                       ; preds = %if.end13, %while.body.lr.ph
  %agg.tmp16.sroa.0.0.copyload23 = phi %"struct.std::__detail::_List_node_base"* [ %call2, %while.body.lr.ph ], [ %agg.tmp16.sroa.0.0.copyload22, %if.end13 ]
  %2 = phi %"struct.std::__detail::_List_node_base"* [ %call, %while.body.lr.ph ], [ %5, %if.end13 ]
  store %"struct.std::__detail::_List_node_base"* %2, %"struct.std::__detail::_List_node_base"** %1, align 8, !tbaa !45
  %call5 = call dereferenceable(8) %"struct.std::_List_iterator"* @_ZNSt14_List_iteratorIP18HeapAllocationMetaEppEv(%"struct.std::_List_iterator"* %__next)
  %call6 = call dereferenceable(8) %struct.HeapAllocationMeta** @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEdeEv(%"struct.std::_List_iterator"* %__first)
  %3 = load %struct.HeapAllocationMeta** %call6, align 8, !tbaa !45
  %4 = load %struct.HeapAllocationMeta** %__value, align 8, !tbaa !45
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
  store %"struct.std::__detail::_List_node_base"* %2, %"struct.std::__detail::_List_node_base"** %0, align 8, !tbaa !45
  br label %if.end13

if.end13:                                         ; preds = %if.else, %if.then11, %while.body
  %agg.tmp16.sroa.0.0.copyload22 = phi %"struct.std::__detail::_List_node_base"* [ %agg.tmp16.sroa.0.0.copyload23, %if.then11 ], [ %2, %if.else ], [ %agg.tmp16.sroa.0.0.copyload23, %while.body ]
  %5 = load %"struct.std::__detail::_List_node_base"** %1, align 8, !tbaa !45
  store %"struct.std::__detail::_List_node_base"* %5, %"struct.std::__detail::_List_node_base"** %coerce.dive, align 8, !tbaa !45
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
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !131
  %_M_next = getelementptr inbounds %"struct.std::__detail::_List_node_base"* %0, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !133
  store %"struct.std::__detail::_List_node_base"* %1, %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !131
  ret %"struct.std::_List_iterator"* %this
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy1(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType) #3 {
entry:
  %0 = load i64* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 12), align 16, !tbaa !134
  %inc = add i64 %0, 1
  store i64 %inc, i64* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 12), align 16, !tbaa !134
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy2(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType, i32 %threadnumber) #3 {
entry:
  %idxprom = zext i32 %threadnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !134
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !134
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy3(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType, i32 %threadnumber, %struct.sdmprofile__Allocated_Stack_item* nocapture readnone %ptr) #3 {
entry:
  %idxprom = zext i32 %threadnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !134
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !134
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_GVonly(i8* readnone %AtAddress, i8 zeroext %AccessType, i32 %thdnumber) #3 {
entry:
  %__begin = alloca %"struct.std::_Fwd_list_iterator", align 8
  %__end = alloca %"struct.std::_Fwd_list_iterator", align 8
  %idxprom = zext i32 %thdnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !134
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !134
  %1 = load i8** @GV_AddrRangeHead, align 8, !tbaa !45
  %cmp = icmp ule i8* %1, %AtAddress
  %2 = load i8** @GV_AddrRangeTail, align 8
  %cmp1 = icmp ugt i8* %2, %AtAddress
  %or.cond = and i1 %cmp, %cmp1
  br i1 %or.cond, label %if.then, label %return

if.then:                                          ; preds = %entry
  %SearchWithinAddressRange = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 14
  %3 = load i64* %SearchWithinAddressRange, align 8, !tbaa !135
  %inc4 = add i64 %3, 1
  store i64 %inc4, i64* %SearchWithinAddressRange, align 8, !tbaa !135
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
  %4 = load %struct.GVMeta** %ptr, align 8, !tbaa !76
  %address = getelementptr inbounds %struct.GVMeta* %4, i64 0, i32 3
  %5 = load i8** %address, align 8, !tbaa !56
  %cmp8 = icmp ugt i8* %5, %AtAddress
  br i1 %cmp8, label %if.else37, label %land.lhs.true9

land.lhs.true9:                                   ; preds = %while.body
  %upperbound = getelementptr inbounds %struct.GVMeta* %4, i64 0, i32 7
  %6 = load i8** %upperbound, align 8, !tbaa !82
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
  %7 = load i64* %r, align 8, !tbaa !99
  %inc14 = add i64 %7, 1
  store i64 %inc14, i64* %r, align 8, !tbaa !99
  br label %sw.epilog

sw.bb15:                                          ; preds = %if.then12
  %w = getelementptr inbounds %struct.GVMeta* %.lcssa154, i64 0, i32 2
  %8 = load i64* %w, align 8, !tbaa !100
  %inc17 = add i64 %8, 1
  store i64 %inc17, i64* %w, align 8, !tbaa !100
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb15, %sw.bb, %if.then12
  %Cache_Hits = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 16
  %9 = load i64* %Cache_Hits, align 8, !tbaa !136
  %inc20 = add i64 %9, 1
  store i64 %inc20, i64* %Cache_Hits, align 8, !tbaa !136
  %10 = load %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !75
  %cmp24 = icmp eq %struct.GVCache_Item* %I.0139.lcssa, %10
  br i1 %cmp24, label %return, label %if.else

if.else:                                          ; preds = %sw.epilog
  %next = getelementptr inbounds %struct.GVCache_Item* %I.0139.lcssa, i64 0, i32 1
  %11 = load %struct.GVCache_Item** %next, align 8, !tbaa !78
  %next26 = getelementptr inbounds %struct.GVCache_Item* %previous.0138.lcssa, i64 0, i32 1
  store %struct.GVCache_Item* %11, %struct.GVCache_Item** %next26, align 8, !tbaa !78
  store %struct.GVCache_Item* %I.0139.lcssa, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !75
  store %struct.GVCache_Item* %10, %struct.GVCache_Item** %next, align 8, !tbaa !78
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
  %12 = load %struct.GVMeta** %call44, align 8, !tbaa !45
  %address45 = getelementptr inbounds %struct.GVMeta* %12, i64 0, i32 3
  %13 = load i8** %address45, align 8, !tbaa !56
  %cmp46 = icmp ugt i8* %13, %AtAddress
  br i1 %cmp46, label %for.inc, label %land.lhs.true47

land.lhs.true47:                                  ; preds = %for.body
  %upperbound48 = getelementptr inbounds %struct.GVMeta* %12, i64 0, i32 7
  %14 = load i8** %upperbound48, align 8, !tbaa !82
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
  %15 = load i64* %r53, align 8, !tbaa !99
  %inc54 = add i64 %15, 1
  store i64 %inc54, i64* %r53, align 8, !tbaa !99
  br label %sw.epilog59

sw.bb55:                                          ; preds = %if.then50
  %w56 = getelementptr inbounds %struct.GVMeta* %.lcssa, i64 0, i32 2
  %16 = load i64* %w56, align 8, !tbaa !100
  %inc57 = add i64 %16, 1
  store i64 %inc57, i64* %w56, align 8, !tbaa !100
  br label %sw.epilog59

sw.epilog59:                                      ; preds = %sw.bb55, %sw.bb52, %if.then50
  %Cache_Miss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 15
  %17 = load i64* %Cache_Miss, align 8, !tbaa !137
  %inc68 = add i64 %17, 1
  store i64 %inc68, i64* %Cache_Miss, align 8, !tbaa !137
  %18 = load %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !75
  br label %while.cond75

for.inc:                                          ; preds = %land.lhs.true47, %for.body
  %call61 = call dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %call42 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call42, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %while.end
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %19 = load i64* %SearchMiss, align 8, !tbaa !138
  %inc64 = add i64 %19, 1
  store i64 %inc64, i64* %SearchMiss, align 8, !tbaa !138
  br label %return

while.cond75:                                     ; preds = %while.cond75, %sw.epilog59
  %previous70.0 = phi %struct.GVCache_Item* [ undef, %sw.epilog59 ], [ %I71.0, %while.cond75 ]
  %I71.0 = phi %struct.GVCache_Item* [ %18, %sw.epilog59 ], [ %20, %while.cond75 ]
  %next76 = getelementptr inbounds %struct.GVCache_Item* %I71.0, i64 0, i32 1
  %20 = load %struct.GVCache_Item** %next76, align 8, !tbaa !78
  %cmp77 = icmp eq %struct.GVCache_Item* %20, null
  br i1 %cmp77, label %while.end80, label %while.cond75

while.end80:                                      ; preds = %while.cond75
  %next76.lcssa = phi %struct.GVCache_Item** [ %next76, %while.cond75 ]
  %I71.0.lcssa = phi %struct.GVCache_Item* [ %I71.0, %while.cond75 ]
  %previous70.0.lcssa = phi %struct.GVCache_Item* [ %previous70.0, %while.cond75 ]
  %next81 = getelementptr inbounds %struct.GVCache_Item* %previous70.0.lcssa, i64 0, i32 1
  store %struct.GVCache_Item* null, %struct.GVCache_Item** %next81, align 8, !tbaa !78
  store %struct.GVCache_Item* %I71.0.lcssa, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !75
  store %struct.GVCache_Item* %18, %struct.GVCache_Item** %next76.lcssa, align 8, !tbaa !78
  %ptr95 = getelementptr inbounds %struct.GVCache_Item* %I71.0.lcssa, i64 0, i32 0
  store %struct.GVMeta* %.lcssa, %struct.GVMeta** %ptr95, align 8, !tbaa !76
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
  %0 = load i64* %Search, align 8, !tbaa !134
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !134
  %1 = load i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !45
  %cmp = icmp ugt i8* %1, %AtAddress
  %2 = load i8** @sdmprofile__HP_addressRangeTo, align 8
  %cmp1 = icmp ult i8* %2, %AtAddress
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %if.end96, label %if.then

if.then:                                          ; preds = %entry
  %SearchWithinAddressRange = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 14
  %3 = load i64* %SearchWithinAddressRange, align 8, !tbaa !135
  %inc4 = add i64 %3, 1
  store i64 %inc4, i64* %SearchWithinAddressRange, align 8, !tbaa !135
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
  %4 = load %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !72
  %ptr8 = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 0
  %5 = load i8** %ptr8, align 8, !tbaa !51
  store i8* %5, i8** @cache_addr, align 8, !tbaa !45
  %6 = load %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !72
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %6, i64 0, i32 1
  %7 = load i8** %upperbound, align 8, !tbaa !118
  store i8* %7, i8** @cache_upperbound, align 8, !tbaa !45
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
  %8 = load %struct.HeapAllocationMeta** %ptr.lcssa, align 8, !tbaa !72
  %heapindex = getelementptr inbounds %struct.HeapAllocationMeta* %8, i64 0, i32 3
  %9 = load i32* %heapindex, align 4, !tbaa !120
  %idxprom15 = zext i32 %9 to i64
  %r = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom15, i32 1
  %10 = load i64* %r, align 8, !tbaa !139
  %inc17 = add i64 %10, 1
  store i64 %inc17, i64* %r, align 8, !tbaa !139
  br label %sw.epilog

sw.bb18:                                          ; preds = %if.then13
  %11 = load %struct.HeapAllocationMeta** %ptr.lcssa, align 8, !tbaa !72
  %heapindex20 = getelementptr inbounds %struct.HeapAllocationMeta* %11, i64 0, i32 3
  %12 = load i32* %heapindex20, align 4, !tbaa !120
  %idxprom21 = zext i32 %12 to i64
  %w = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom21, i32 2
  %13 = load i64* %w, align 16, !tbaa !140
  %inc23 = add i64 %13, 1
  store i64 %inc23, i64* %w, align 16, !tbaa !140
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb18, %sw.bb, %if.then13
  %Cache_Hits = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 16
  %14 = load i64* %Cache_Hits, align 8, !tbaa !136
  %inc26 = add i64 %14, 1
  store i64 %inc26, i64* %Cache_Hits, align 8, !tbaa !136
  %cmp30 = icmp eq %struct.Cache2_Item* %I.0182.lcssa, %I.0179
  br i1 %cmp30, label %return, label %if.else

if.else:                                          ; preds = %sw.epilog
  %next = getelementptr inbounds %struct.Cache2_Item* %I.0182.lcssa, i64 0, i32 1
  %15 = load %struct.Cache2_Item** %next, align 8, !tbaa !74
  %next32 = getelementptr inbounds %struct.Cache2_Item* %previous.0181.lcssa, i64 0, i32 1
  store %struct.Cache2_Item* %15, %struct.Cache2_Item** %next32, align 8, !tbaa !74
  store %struct.Cache2_Item* %I.0182.lcssa, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !71
  store %struct.Cache2_Item* %I.0179, %struct.Cache2_Item** %next, align 8, !tbaa !74
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
  %16 = load %struct.HeapAllocationMeta** %call50, align 8, !tbaa !45
  %ptr51 = getelementptr inbounds %struct.HeapAllocationMeta* %16, i64 0, i32 0
  %17 = load i8** %ptr51, align 8, !tbaa !51
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
  %18 = load i32* %heapindex56, align 4, !tbaa !120
  %idxprom57 = zext i32 %18 to i64
  %r59 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom57, i32 1
  %19 = load i64* %r59, align 8, !tbaa !139
  %inc60 = add i64 %19, 1
  store i64 %inc60, i64* %r59, align 8, !tbaa !139
  br label %return_2

sw.bb61:                                          ; preds = %if.then53
  %heapindex62 = getelementptr inbounds %struct.HeapAllocationMeta* %.lcssa, i64 0, i32 3
  %20 = load i32* %heapindex62, align 4, !tbaa !120
  %idxprom63 = zext i32 %20 to i64
  %w65 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom63, i32 2
  %21 = load i64* %w65, align 16, !tbaa !140
  %inc66 = add i64 %21, 1
  store i64 %inc66, i64* %w65, align 16, !tbaa !140
  br label %return_2

if.else69:                                        ; preds = %for.body
  %cmp71 = icmp ugt i8* %17, %AtAddress
  br i1 %cmp71, label %for.inc, label %if.else73

if.else73:                                        ; preds = %if.else69
  %upperbound74 = getelementptr inbounds %struct.HeapAllocationMeta* %16, i64 0, i32 1
  %22 = load i8** %upperbound74, align 8, !tbaa !118
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
  %23 = load i32* %heapindex79, align 4, !tbaa !120
  %idxprom80 = zext i32 %23 to i64
  %r82 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom80, i32 1
  %24 = load i64* %r82, align 8, !tbaa !139
  %inc83 = add i64 %24, 1
  store i64 %inc83, i64* %r82, align 8, !tbaa !139
  br label %return_2

sw.bb84:                                          ; preds = %if.then76
  %heapindex85 = getelementptr inbounds %struct.HeapAllocationMeta* %.lcssa202, i64 0, i32 3
  %25 = load i32* %heapindex85, align 4, !tbaa !120
  %idxprom86 = zext i32 %25 to i64
  %w88 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom86, i32 2
  %26 = load i64* %w88, align 16, !tbaa !140
  %inc89 = add i64 %26, 1
  store i64 %inc89, i64* %w88, align 16, !tbaa !140
  br label %return_2

for.inc:                                          ; preds = %if.else73, %if.else69
  %call95 = call dereferenceable(8) %"struct.std::_List_iterator"* @_ZNSt14_List_iteratorIP18HeapAllocationMetaEppEv(%"struct.std::_List_iterator"* %__begin)
  %call48 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__begin, %"struct.std::_List_iterator"* dereferenceable(8) %__end)
  br i1 %call48, label %for.body, label %if.end96.loopexit

if.end96.loopexit:                                ; preds = %for.inc
  br label %if.end96

if.end96:                                         ; preds = %if.end96.loopexit, %while.end, %entry
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %27 = load i64* %SearchMiss, align 8, !tbaa !138
  %inc99 = add i64 %27, 1
  store i64 %inc99, i64* %SearchMiss, align 8, !tbaa !138
  br label %return

return_2:                                         ; preds = %sw.bb84, %sw.bb78, %if.then76, %sw.bb61, %sw.bb55, %if.then53
  %call50201 = phi %struct.HeapAllocationMeta** [ %call50.lcssa199, %sw.bb78 ], [ %call50.lcssa199, %sw.bb84 ], [ %call50.lcssa199, %if.then76 ], [ %call50.lcssa, %sw.bb55 ], [ %call50.lcssa, %sw.bb61 ], [ %call50.lcssa, %if.then53 ]
  %loopptr.0 = load %struct.HeapAllocationMeta** %call50201, align 8
  %Cache_Miss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 15
  %28 = load i64* %Cache_Miss, align 8, !tbaa !137
  %inc102 = add i64 %28, 1
  store i64 %inc102, i64* %Cache_Miss, align 8, !tbaa !137
  %29 = load %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !71
  br label %while.cond109

while.cond109:                                    ; preds = %while.cond109, %return_2
  %previous104.0 = phi %struct.Cache2_Item* [ undef, %return_2 ], [ %I105.0, %while.cond109 ]
  %I105.0 = phi %struct.Cache2_Item* [ %29, %return_2 ], [ %30, %while.cond109 ]
  %next110 = getelementptr inbounds %struct.Cache2_Item* %I105.0, i64 0, i32 1
  %30 = load %struct.Cache2_Item** %next110, align 8, !tbaa !74
  %cmp111 = icmp eq %struct.Cache2_Item* %30, null
  br i1 %cmp111, label %while.end114, label %while.cond109

while.end114:                                     ; preds = %while.cond109
  %next110.lcssa = phi %struct.Cache2_Item** [ %next110, %while.cond109 ]
  %I105.0.lcssa = phi %struct.Cache2_Item* [ %I105.0, %while.cond109 ]
  %previous104.0.lcssa = phi %struct.Cache2_Item* [ %previous104.0, %while.cond109 ]
  %next115 = getelementptr inbounds %struct.Cache2_Item* %previous104.0.lcssa, i64 0, i32 1
  store %struct.Cache2_Item* null, %struct.Cache2_Item** %next115, align 8, !tbaa !74
  store %struct.Cache2_Item* %I105.0.lcssa, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !71
  store %struct.Cache2_Item* %29, %struct.Cache2_Item** %next110.lcssa, align 8, !tbaa !74
  %ptr129 = getelementptr inbounds %struct.Cache2_Item* %I105.0.lcssa, i64 0, i32 0
  store %struct.HeapAllocationMeta* %loopptr.0, %struct.HeapAllocationMeta** %ptr129, align 8, !tbaa !72
  br label %return

return:                                           ; preds = %while.end114, %if.end96, %if.else, %sw.epilog
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_STonly(i8* readnone %AtAddress, i8 zeroext %AccessType, i32 %thdnumber, %struct.sdmprofile__Allocated_Stack_item* %ptr) #3 {
entry:
  %idxprom = zext i32 %thdnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !134
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !134
  %Stack_allocations_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 4
  %1 = load %struct.sdmprofile__Allocated_Stack_item** %Stack_allocations_head, align 8, !tbaa !79
  %loopptr.065 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %ptr, i64 -1
  %cmp66 = icmp ult %struct.sdmprofile__Allocated_Stack_item* %loopptr.065, %1
  br i1 %cmp66, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.cond.backedge, %while.body.preheader
  %2 = phi %struct.sdmprofile__Allocated_Stack_item* [ %loopptr.068, %while.cond.backedge ], [ %ptr, %while.body.preheader ]
  %loopptr.068 = phi %struct.sdmprofile__Allocated_Stack_item* [ %loopptr.0, %while.cond.backedge ], [ %loopptr.065, %while.body.preheader ]
  %ptr3 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %2, i64 -1, i32 0
  %3 = load i8** %ptr3, align 8, !tbaa !58
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
  %4 = load i64* %stackindex, align 8, !tbaa !141
  %r = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %4, i32 1
  %5 = load i64* %r, align 8, !tbaa !108
  %inc6 = add i64 %5, 1
  store i64 %inc6, i64* %r, align 8, !tbaa !108
  br label %return_

sw.bb7:                                           ; preds = %if.then
  %stackindex8 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %.lcssa, i64 -1, i32 1
  %6 = load i64* %stackindex8, align 8, !tbaa !141
  %w = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %6, i32 2
  %7 = load i64* %w, align 8, !tbaa !109
  %inc10 = add i64 %7, 1
  store i64 %inc10, i64* %w, align 8, !tbaa !109
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
  %8 = load i8** %upperbound, align 8, !tbaa !60
  %9 = load i8** @sdmprofile__zeropointer, align 8, !tbaa !45
  %cmp15 = icmp eq i8* %8, %9
  br i1 %cmp15, label %if.then16, label %if.end

if.then16:                                        ; preds = %if.else14
  %10 = ptrtoint i8* %3 to i64
  %stackindex18 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %2, i64 -1, i32 1
  %11 = load i64* %stackindex18, align 8, !tbaa !141
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %11, i32 3
  %12 = load i32* %size, align 8, !tbaa !88
  %conv20 = zext i32 %12 to i64
  %add = add i64 %conv20, %10
  %13 = inttoptr i64 %add to i8*
  store i8* %13, i8** %upperbound, align 8, !tbaa !60
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
  %15 = load i64* %stackindex27, align 8, !tbaa !141
  %r29 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %15, i32 1
  %16 = load i64* %r29, align 8, !tbaa !108
  %inc30 = add i64 %16, 1
  store i64 %inc30, i64* %r29, align 8, !tbaa !108
  br label %return_

sw.bb31:                                          ; preds = %if.then24
  %stackindex32 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %.lcssa73, i64 -1, i32 1
  %17 = load i64* %stackindex32, align 8, !tbaa !141
  %w34 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %17, i32 2
  %18 = load i64* %w34, align 8, !tbaa !109
  %inc35 = add i64 %18, 1
  store i64 %inc35, i64* %w34, align 8, !tbaa !109
  br label %return_

while.end.loopexit:                               ; preds = %while.cond.backedge
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %19 = load i64* %SearchMiss, align 8, !tbaa !138
  %inc44 = add i64 %19, 1
  store i64 %inc44, i64* %SearchMiss, align 8, !tbaa !138
  br label %return_

return_:                                          ; preds = %while.end, %sw.bb31, %sw.bb26, %if.then24, %sw.bb7, %sw.bb, %if.then
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__PrintResultBeforeAddingBBcount() #3 {
entry:
  %__begin = alloca %"struct.std::_Fwd_list_iterator", align 8
  %__end = alloca %"struct.std::_Fwd_list_iterator", align 8
  %call = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([18 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0)) #2
  %0 = load i32* @sdmprofile__profileAction, align 4, !tbaa !49
  %.off = add i32 %0, -3
  %1 = icmp ult i32 %.off, 2
  br i1 %1, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([100 x i8]* @.str4, i64 0, i64 0), i64 99, i64 1, %struct._IO_FILE* %call)
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
  %3 = load %struct.GVMeta** %call7, align 8, !tbaa !45
  %index = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 0
  %4 = load i64* %index, align 8, !tbaa !54
  %r = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 1
  %5 = load i64* %r, align 8, !tbaa !99
  %w = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 2
  %6 = load i64* %w, align 8, !tbaa !100
  %size = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 4
  %7 = load i32* %size, align 4, !tbaa !57
  %VarName = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 5
  %8 = load i8** %VarName, align 8, !tbaa !80
  %DataTypeString = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 6
  %9 = load i8** %DataTypeString, align 8, !tbaa !81
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([23 x i8]* @.str5, i64 0, i64 0), i64 %4, i64 %5, i64 %6, i32 %7, i8* %8, i8* %9) #2
  %call9 = call dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %call6 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call6, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %if.then
  %10 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE* %call)
  %.pr = load i32* @sdmprofile__profileAction, align 4, !tbaa !49
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  %11 = phi i32 [ %0, %entry ], [ %.pr, %for.end ]
  switch i32 %11, label %if.end34 [
    i32 4, label %if.then14
    i32 2, label %if.then14
  ]

if.then14:                                        ; preds = %if.end, %if.end
  %12 = call i64 @fwrite(i8* getelementptr inbounds ([124 x i8]* @.str7, i64 0, i64 0), i64 123, i64 1, %struct._IO_FILE* %call)
  %13 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !110
  %cmp1784 = icmp eq i64 %13, 0
  br i1 %cmp1784, label %for.end32, label %for.body18.preheader

for.body18.preheader:                             ; preds = %if.then14
  br label %for.body18

for.body18:                                       ; preds = %for.body18, %for.body18.preheader
  %ix.085 = phi i64 [ %inc, %for.body18 ], [ 0, %for.body18.preheader ]
  %index19 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 0
  %14 = load i64* %index19, align 8, !tbaa !86
  %r21 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 1
  %15 = load i64* %r21, align 8, !tbaa !108
  %w23 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 2
  %16 = load i64* %w23, align 8, !tbaa !109
  %size25 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 3
  %17 = load i32* %size25, align 8, !tbaa !88
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 4
  %18 = load i8** %EstimatedName, align 8, !tbaa !89
  %DataTypeString28 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 5
  %19 = load i8** %DataTypeString28, align 8, !tbaa !90
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 6
  %20 = load i8** %FunctionName, align 8, !tbaa !91
  %call30 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i64 %14, i64 %15, i64 %16, i32 %17, i8* %18, i8* %19, i8* %20) #2
  %inc = add i64 %ix.085, 1
  %21 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !110
  %cmp17 = icmp ult i64 %inc, %21
  br i1 %cmp17, label %for.body18, label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.body18
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %if.then14
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE* %call)
  %.pre = load i32* @sdmprofile__profileAction, align 4, !tbaa !49
  br label %if.end34

if.end34:                                         ; preds = %for.end32, %if.end
  %23 = phi i32 [ %11, %if.end ], [ %.pre, %for.end32 ]
  switch i32 %23, label %if.end55 [
    i32 4, label %if.then38
    i32 1, label %if.then38
  ]

if.then38:                                        ; preds = %if.end34, %if.end34
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([171 x i8]* @.str9, i64 0, i64 0), i64 170, i64 1, %struct._IO_FILE* %call)
  %25 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !110
  %cmp4282 = icmp eq i64 %25, 0
  br i1 %cmp4282, label %for.end53, label %for.body43.preheader

for.body43.preheader:                             ; preds = %if.then38
  br label %for.body43

for.body43:                                       ; preds = %for.body43, %for.body43.preheader
  %ix40.083 = phi i64 [ %inc52, %for.body43 ], [ 0, %for.body43.preheader ]
  %arrayidx44 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083
  store %struct.HPMeta* %arrayidx44, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !45
  %index45 = getelementptr inbounds %struct.HPMeta* %arrayidx44, i64 0, i32 0
  %26 = load i32* %index45, align 16, !tbaa !92
  %r46 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 1
  %27 = load i64* %r46, align 8, !tbaa !139
  %w47 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 2
  %28 = load i64* %w47, align 16, !tbaa !140
  %EstimatedName48 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 3
  %29 = load i8** %EstimatedName48, align 8, !tbaa !94
  %EstimatedDataTypeString = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 4
  %30 = load i8** %EstimatedDataTypeString, align 16, !tbaa !95
  %FunctionName49 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 5
  %31 = load i8** %FunctionName49, align 8, !tbaa !96
  %linenumber = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 6
  %32 = load i64* %linenumber, align 16, !tbaa !97
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 7
  %33 = load i8** %SourceFile, align 8, !tbaa !98
  %hitcount = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 8
  %34 = load i64* %hitcount, align 16, !tbaa !123
  %MinSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 10
  %35 = load i64* %MinSize, align 16, !tbaa !125
  %MaxSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 9
  %36 = load i64* %MaxSize, align 8, !tbaa !124
  %call50 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([43 x i8]* @.str10, i64 0, i64 0), i32 %26, i64 %27, i64 %28, i32 0, i8* %29, i8* %30, i8* %31, i64 %32, i8* %33, i64 %34, i64 %35, i64 %36) #2
  %inc52 = add i64 %ix40.083, 1
  %37 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !110
  %cmp42 = icmp ult i64 %inc52, %37
  br i1 %cmp42, label %for.body43, label %for.end53.loopexit

for.end53.loopexit:                               ; preds = %for.body43
  br label %for.end53

for.end53:                                        ; preds = %for.end53.loopexit, %if.then38
  %38 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE* %call)
  br label %if.end55

if.end55:                                         ; preds = %for.end53, %if.end34
  %call56 = call i32 @fclose(%struct._IO_FILE* %call) #2
  ret void
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) #1

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) #1

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
  store double %call, double* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 3), align 8, !tbaa !70
  %call1 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([18 x i8]* @.str11, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0)) #2
  %0 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str12, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %call1)
  %1 = load i64* @sdmprofile__BBcount, align 8, !tbaa !110
  %cmp167 = icmp eq i64 %1, 0
  br i1 %cmp167, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %ix.0168 = phi i64 [ %inc, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds [5000 x i64]* @BBhits, i64 0, i64 %ix.0168
  %2 = load i64* %arrayidx, align 8, !tbaa !110
  %call3 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %call1, i8* getelementptr inbounds ([9 x i8]* @.str13, i64 0, i64 0), i64 %ix.0168, i64 %2) #2
  %inc = add i64 %ix.0168, 1
  %3 = load i64* @sdmprofile__BBcount, align 8, !tbaa !110
  %cmp = icmp ult i64 %inc, %3
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %4 = getelementptr inbounds [64 x i8]* %errmsg, i64 0, i64 0
  call void @llvm.lifetime.start(i64 64, i8* %4) #2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* getelementptr inbounds ([64 x i8]* @_ZZ34sdmprofile__EndProfiling_ProcessesE6errmsg, i64 0, i64 0), i64 64, i32 16, i1 false)
  %call4 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([21 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str15, i64 0, i64 0)) #2
  %cmp5 = icmp eq %struct._IO_FILE* %call4, null
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %5 = load %struct._IO_FILE** @stderr, align 8, !tbaa !45
  %fputs = call i32 @fputs(i8* %4, %struct._IO_FILE* %5) #16
  br label %cleanup

if.end:                                           ; preds = %for.end
  %6 = load i32* @sdmprofile__profileAction, align 4, !tbaa !49
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
  %8 = load %struct.GVMeta** %call16, align 8, !tbaa !45
  %DataTypeString = getelementptr inbounds %struct.GVMeta* %8, i64 0, i32 6
  %9 = load i8** %DataTypeString, align 8, !tbaa !81
  call void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* %typestring, i8* %9, %"class.std::allocator.6"* dereferenceable(1) %ref.tmp) #2
  %call17 = call i8* @_ZNSs5beginEv(%"class.std::basic_string"* %typestring) #2
  %call20 = call i8* @_ZNSs3endEv(%"class.std::basic_string"* %typestring) #2
  store i8 44, i8* %ref.tmp22, align 1, !tbaa !142
  store i8 59, i8* %ref.tmp23, align 1, !tbaa !142
  call void @_ZSt7replaceIN9__gnu_cxx17__normal_iteratorIPcSsEEcEvT_S4_RKT0_S7_(i8* %call17, i8* %call20, i8* dereferenceable(1) %ref.tmp22, i8* dereferenceable(1) %ref.tmp23)
  %inc26 = add nsw i32 %variable_count.0164, 1
  %10 = load %struct.GVMeta** %call16, align 8, !tbaa !45
  %r = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 1
  %11 = load i64* %r, align 8, !tbaa !99
  %w = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 2
  %12 = load i64* %w, align 8, !tbaa !100
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
  %13 = load i64* %linenumber, align 8, !tbaa !85
  %tobool = icmp eq i64 %13, 0
  br i1 %tobool, label %if.end44, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.then35
  %FileName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 8
  %14 = load i8** %FileName, align 8, !tbaa !83
  %call36 = call i32 @strcmp(i8* %14, i8* getelementptr inbounds ([2 x i8]* @.str17, i64 0, i64 0)) #17
  %tobool37 = icmp eq i32 %call36, 0
  br i1 %tobool37, label %if.end44, label %if.then38

if.then38:                                        ; preds = %land.lhs.true
  %VarName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 5
  %15 = load i8** %VarName, align 8, !tbaa !80
  %DirName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 9
  %16 = load i8** %DirName, align 8, !tbaa !84
  %call41 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %call4, i8* getelementptr inbounds ([14 x i8]* @.str18, i64 0, i64 0), i8* %15, i64 %13, i8* %16, i8* %14) #2
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
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %call4)
  %call49 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %call4, i8* getelementptr inbounds ([46 x i8]* @.str20, i64 0, i64 0), i32 %variable_count.0.lcssa, i32 %nv_variable_count.0.lcssa) #2
  %.pr = load i32* @sdmprofile__profileAction, align 4, !tbaa !49
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
  %18 = call i64 @fwrite(i8* getelementptr inbounds ([125 x i8]* @.str21, i64 0, i64 0), i64 124, i64 1, %struct._IO_FILE* %call4)
  %19 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !110
  %cmp58160 = icmp eq i64 %19, 0
  br i1 %cmp58160, label %for.end73, label %for.body59.preheader

for.body59.preheader:                             ; preds = %if.then54
  br label %for.body59

for.body59:                                       ; preds = %for.body59, %for.body59.preheader
  %ix56.0161 = phi i64 [ %inc72, %for.body59 ], [ 0, %for.body59.preheader ]
  %index = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 0
  %20 = load i64* %index, align 8, !tbaa !86
  %r62 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 1
  %21 = load i64* %r62, align 8, !tbaa !108
  %w64 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 2
  %22 = load i64* %w64, align 8, !tbaa !109
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 3
  %23 = load i32* %size, align 8, !tbaa !88
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 4
  %24 = load i8** %EstimatedName, align 8, !tbaa !89
  %DataTypeString68 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 5
  %25 = load i8** %DataTypeString68, align 8, !tbaa !90
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 6
  %26 = load i8** %FunctionName, align 8, !tbaa !91
  %call70 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %call4, i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i64 %20, i64 %21, i64 %22, i32 %23, i8* %24, i8* %25, i8* %26) #2
  %inc72 = add i64 %ix56.0161, 1
  %27 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !110
  %cmp58 = icmp ult i64 %inc72, %27
  br i1 %cmp58, label %for.body59, label %for.end73.loopexit

for.end73.loopexit:                               ; preds = %for.body59
  br label %for.end73

for.end73:                                        ; preds = %for.end73.loopexit, %if.then54
  %28 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE* %call4)
  %.pre = load i32* @sdmprofile__profileAction, align 4, !tbaa !49
  br label %if.end75

if.end75:                                         ; preds = %for.end73, %if.end50
  %29 = phi i32 [ %17, %if.end50 ], [ %.pre, %for.end73 ]
  switch i32 %29, label %if.end112 [
    i32 4, label %for.cond81.preheader
    i32 1, label %for.cond81.preheader
  ]

for.cond81.preheader:                             ; preds = %if.end75, %if.end75
  %30 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !110
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
  store %struct.HPMeta* %arrayidx85, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !45
  %r86 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 1
  %32 = load i64* %r86, align 8, !tbaa !139
  %cmp99 = icmp eq i64 %32, 0
  br i1 %cmp99, label %if.end106, label %if.then100

if.then100:                                       ; preds = %for.body84
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 7
  %33 = load i8** %SourceFile, align 8, !tbaa !98
  %linenumber101 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 6
  %34 = load i64* %linenumber101, align 16, !tbaa !97
  %FunctionName102 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 5
  %35 = load i8** %FunctionName102, align 8, !tbaa !96
  %EstimatedName103 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 3
  %36 = load i8** %EstimatedName103, align 8, !tbaa !94
  %call104 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %call4, i8* getelementptr inbounds ([14 x i8]* @.str22, i64 0, i64 0), i8* %33, i64 %34, i8* %35, i8* %36) #2
  %inc105 = add nsw i32 %nv_variable_count.3156, 1
  %.pre169 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !110
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
  %call111 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %call4, i8* getelementptr inbounds ([65 x i8]* @.str23, i64 0, i64 0), i32 %nv_variable_count.3.lcssa, i32 %variable_count.2.lcssa) #2
  br label %if.end112

if.end112:                                        ; preds = %for.end110, %if.end75
  %call113 = call i32 @fclose(%struct._IO_FILE* %call4) #2
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
  %0 = load i8* %call2, align 1, !tbaa !142
  %1 = load i8* %__old_value, align 1, !tbaa !142
  %cmp = icmp eq i8 %0, %1
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %2 = load i8* %__new_value, align 1, !tbaa !142
  store i8 %2, i8* %call2, align 1, !tbaa !142
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
  store i8* %call, i8** %ref.tmp, align 8, !tbaa !45
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
  store i8* %add.ptr, i8** %ref.tmp, align 8, !tbaa !45
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
  %0 = load i32* @thdsCount, align 4, !tbaa !49
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
  %2 = load i64* %threadID, align 8, !tbaa !68
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
  %0 = load i8** %call, align 8, !tbaa !45
  %call1 = tail call dereferenceable(8) i8** @_ZNK9__gnu_cxx17__normal_iteratorIPcSsE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %__rhs)
  %1 = load i8** %call1, align 8, !tbaa !45
  %cmp = icmp ne i8* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(1) i8* @_ZNK9__gnu_cxx17__normal_iteratorIPcSsEdeEv(%"class.__gnu_cxx::__normal_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %_M_current, align 8, !tbaa !143
  ret i8* %0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden dereferenceable(8) %"class.__gnu_cxx::__normal_iterator"* @_ZN9__gnu_cxx17__normal_iteratorIPcSsEppEv(%"class.__gnu_cxx::__normal_iterator"* %this) #3 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %_M_current, align 8, !tbaa !143
  %incdec.ptr = getelementptr inbounds i8* %0, i64 1
  store i8* %incdec.ptr, i8** %_M_current, align 8, !tbaa !143
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
  %0 = load i8** %_M_p, align 8, !tbaa !145
  ret i8* %0
}

; Function Attrs: noinline nounwind readonly uwtable
define available_externally i64 @_ZNKSs4sizeEv(%"class.std::basic_string"* nocapture readonly %this) #4 align 2 {
entry:
  %call = tail call %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* @_ZNKSs6_M_repEv(%"class.std::basic_string"* %this)
  %_M_length = getelementptr inbounds %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* %call, i64 0, i32 0, i32 0
  %0 = load i64* %_M_length, align 8, !tbaa !148
  ret i64 %0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZN9__gnu_cxx17__normal_iteratorIPcSsEC2ERKS1_(%"class.__gnu_cxx::__normal_iterator"* nocapture %this, i8** nocapture readonly dereferenceable(8) %__i) unnamed_addr #3 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %__i, align 8, !tbaa !45
  store i8* %0, i8** %_M_current, align 8, !tbaa !143
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
  %0 = load i32* %_M_refcount, align 4, !tbaa !150
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
  store %"struct.std::__detail::_List_node_base"* %__x, %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !131
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
  %1 = load %struct.HeapAllocationMeta** %call, align 8, !tbaa !45
  store %struct.HeapAllocationMeta* %1, %struct.HeapAllocationMeta** %_M_data, align 8, !tbaa !151
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
  tail call void @_ZSt17__throw_bad_allocv() #18
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
  store %"struct.std::_Fwd_list_node_base"* %__n, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !105
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr %"struct.std::_Fwd_list_node_base"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE15_M_insert_afterIJRKS1_EEEPSt19_Fwd_list_node_baseSt24_Fwd_list_const_iteratorIS1_EDpOT_(%"struct.std::_Fwd_list_base"* %this, %"struct.std::_Fwd_list_node_base"* nocapture %__pos.coerce, %struct.GVMeta** dereferenceable(8) %__args) #3 align 2 {
entry:
  %call = tail call dereferenceable(8) %struct.GVMeta** @_ZSt7forwardIRKP6GVMetaEOT_RNSt16remove_referenceIS4_E4typeE(%struct.GVMeta** dereferenceable(8) %__args) #2
  %call2 = tail call %"struct.std::_Fwd_list_node"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_M_create_nodeIJRKS1_EEEPSt14_Fwd_list_nodeIS1_EDpOT_(%"struct.std::_Fwd_list_base"* %this, %struct.GVMeta** dereferenceable(8) %call)
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__pos.coerce, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !107
  %1 = getelementptr inbounds %"struct.std::_Fwd_list_node"* %call2, i64 0, i32 0
  %_M_next3 = getelementptr inbounds %"struct.std::_Fwd_list_node"* %call2, i64 0, i32 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* %0, %"struct.std::_Fwd_list_node_base"** %_M_next3, align 8, !tbaa !107
  store %"struct.std::_Fwd_list_node_base"* %1, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !107
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
  store %"struct.std::_Fwd_list_node_base"* %__n, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !153
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
  %0 = load %struct.GVMeta** %call, align 8, !tbaa !45
  store %struct.GVMeta* %0, %struct.GVMeta** %__p, align 8, !tbaa !45
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
  tail call void @_ZSt17__throw_bad_allocv() #18
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
  store %"struct.std::__detail::_List_node_base"* %_M_node, %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !127
  %_M_prev = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0, i32 1
  store %"struct.std::__detail::_List_node_base"* %_M_node, %"struct.std::__detail::_List_node_base"** %_M_prev, align 8, !tbaa !155
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr %"struct.std::_Fwd_list_node_base"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_M_erase_afterEPSt19_Fwd_list_node_baseS5_(%"struct.std::_Fwd_list_base"* readnone %this, %"struct.std::_Fwd_list_node_base"* nocapture %__pos, %"struct.std::_Fwd_list_node_base"* %__last) #3 align 2 {
entry:
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__pos, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !107
  %cmp12 = icmp eq %"struct.std::_Fwd_list_node_base"* %0, %__last
  br i1 %cmp12, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.preheader
  %__curr.0.in13 = phi %"struct.std::_Fwd_list_node_base"* [ %1, %while.body ], [ %0, %while.body.preheader ]
  %__curr.0 = bitcast %"struct.std::_Fwd_list_node_base"* %__curr.0.in13 to %"struct.std::_Fwd_list_node"*
  %_M_next2 = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__curr.0.in13, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_next2, align 8, !tbaa !107
  tail call void @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE11_M_put_nodeEPSt14_Fwd_list_nodeIS1_E(%"struct.std::_Fwd_list_base"* %this, %"struct.std::_Fwd_list_node"* %__curr.0)
  %cmp = icmp eq %"struct.std::_Fwd_list_node_base"* %1, %__last
  br i1 %cmp, label %while.end.loopexit, label %while.body

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  store %"struct.std::_Fwd_list_node_base"* %__last, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !107
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
  store %"struct.std::_Fwd_list_node_base"* null, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !107
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
  br i1 %cmp, label %if.end5, label %if.then, !prof !156

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
  %0 = load i32* %__mem, align 4, !tbaa !49
  %add = add nsw i32 %0, -1
  store i32 %add, i32* %__mem, align 4, !tbaa !49
  ret i32 %0
}

; Function Attrs: nounwind
declare extern_weak i32 @__pthread_key_create(i32*, void (i8*)*) #1

; Function Attrs: noinline nounwind uwtable
define linkonce_odr void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE8_M_clearEv(%"class.std::_List_base"* readonly %this) #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0
  %_M_next = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !127
  %cmp8 = icmp eq %"struct.std::__detail::_List_node_base"* %0, %_M_node
  br i1 %cmp8, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.preheader
  %__cur.0.in9 = phi %"struct.std::__detail::_List_node_base"* [ %1, %while.body ], [ %0, %while.body.preheader ]
  %__cur.0 = bitcast %"struct.std::__detail::_List_node_base"* %__cur.0.in9 to %"struct.std::_List_node"*
  %_M_next4 = getelementptr inbounds %"struct.std::__detail::_List_node_base"* %__cur.0.in9, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_next4, align 8, !tbaa !133
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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind
declare i32 @fputs(i8* nocapture readonly, %struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind uwtable
define i32 @main_original() #11 {
  %thdnumber_st = alloca i32
  %1 = call i32 @sdmprofile__FindThread()
  %2 = call i32 @app__mainfunction__(i32 %1)
  ret i32 %2
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #12

declare i32 @printf(i8*, ...) #13

; Function Attrs: nounwind
declare double @atan(double) #14

declare i32 @puts(...) #13

; Function Attrs: nounwind uwtable
define double @rad2deg_original(double %rad) #11 {
  %rad_st = alloca double
  %thdnumber_st = alloca i32
  store double %rad, double* %rad_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load double* %rad_st
  %3 = call double @rad2deg(double %2, i32 %1)
  ret double %3
}

; Function Attrs: nounwind uwtable
define double @deg2rad_original(double %deg) #11 {
  %deg_st = alloca double
  %thdnumber_st = alloca i32
  store double %deg, double* %deg_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load double* %deg_st
  %3 = call double @deg2rad(double %2, i32 %1)
  ret double %3
}

; Function Attrs: nounwind uwtable
define void @SolveCubic_original(double %a, double %b, double %c, double %d, i32* %solutions, double* %x) #11 {
  %a_st = alloca double
  %b_st = alloca double
  %c_st = alloca double
  %d_st = alloca double
  %solutions_st = alloca i32*
  %x_st = alloca double*
  %thdnumber_st = alloca i32
  store double %a, double* %a_st, align 8
  store double %b, double* %b_st, align 8
  store double %c, double* %c_st, align 8
  store double %d, double* %d_st, align 8
  store i32* %solutions, i32** %solutions_st, align 8
  store double* %x, double** %x_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load double* %a_st
  %3 = load double* %b_st
  %4 = load double* %c_st
  %5 = load double* %d_st
  %6 = load i32** %solutions_st
  %7 = load double** %x_st
  call void @SolveCubic(double %2, double %3, double %4, double %5, i32* %6, double* %7, i32 %1)
  ret void
}

; Function Attrs: nounwind
declare double @acos(double) #14

; Function Attrs: nounwind
declare double @sqrt(double) #14

; Function Attrs: nounwind
declare double @cos(double) #14

; Function Attrs: nounwind
declare double @pow(double, double) #14

; Function Attrs: nounwind readnone
declare double @fabs(double) #15

; Function Attrs: nounwind uwtable
define void @usqrt_original(i64 %x, %struct.int_sqrt.0* %q) #11 {
  %x_st = alloca i64
  %q_st = alloca %struct.int_sqrt.0*
  %thdnumber_st = alloca i32
  store i64 %x, i64* %x_st, align 8
  store %struct.int_sqrt.0* %q, %struct.int_sqrt.0** %q_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i64* %x_st
  %3 = load %struct.int_sqrt.0** %q_st
  call void @usqrt(i64 %2, %struct.int_sqrt.0* %3, i32 %1)
  ret void
}

; Function Attrs: nounwind uwtable
define void @SolveCubic(double %a, double %b, double %c, double %d, i32* %solutions, double* %x, i32 %sdmprofile__threadnumber) #11 {
entry:
  %a.addr = alloca double, align 8
  %b.addr = alloca double, align 8
  %c.addr = alloca double, align 8
  %d.addr = alloca double, align 8
  %solutions.addr = alloca i32*, align 8
  %x.addr = alloca double*, align 8
  %a1 = alloca x86_fp80, align 16
  %a2 = alloca x86_fp80, align 16
  %a3 = alloca x86_fp80, align 16
  %Q = alloca x86_fp80, align 16
  %R = alloca x86_fp80, align 16
  %R2_Q3 = alloca double, align 8
  %theta = alloca double, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store double %a, double* %a.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_1, i64 1 seq_cst, !dbg !157
  call void @llvm.dbg.declare(metadata !{double* %a.addr}, metadata !158), !dbg !157
  store double %b, double* %b.addr, align 8
  call void @llvm.dbg.declare(metadata !{double* %b.addr}, metadata !159), !dbg !160
  store double %c, double* %c.addr, align 8
  call void @llvm.dbg.declare(metadata !{double* %c.addr}, metadata !161), !dbg !162
  store double %d, double* %d.addr, align 8
  call void @llvm.dbg.declare(metadata !{double* %d.addr}, metadata !163), !dbg !164
  store i32* %solutions, i32** %solutions.addr, align 8
  call void @llvm.dbg.declare(metadata !{i32** %solutions.addr}, metadata !165), !dbg !166
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata !{double** %x.addr}, metadata !167), !dbg !168
  call void @llvm.dbg.declare(metadata !{x86_fp80* %a1}, metadata !169), !dbg !171
  %1 = load double* %b.addr, align 8, !dbg !172
  %2 = load double* %a.addr, align 8, !dbg !172
  %div = fdiv double %1, %2, !dbg !172
  %conv = fpext double %div to x86_fp80, !dbg !172
  store x86_fp80 %conv, x86_fp80* %a1, align 16, !dbg !172
  call void @llvm.dbg.declare(metadata !{x86_fp80* %a2}, metadata !173), !dbg !174
  %3 = load double* %c.addr, align 8, !dbg !172
  %4 = load double* %a.addr, align 8, !dbg !172
  %div1 = fdiv double %3, %4, !dbg !172
  %conv2 = fpext double %div1 to x86_fp80, !dbg !172
  store x86_fp80 %conv2, x86_fp80* %a2, align 16, !dbg !172
  call void @llvm.dbg.declare(metadata !{x86_fp80* %a3}, metadata !175), !dbg !176
  %5 = load double* %d.addr, align 8, !dbg !172
  %6 = load double* %a.addr, align 8, !dbg !172
  %div3 = fdiv double %5, %6, !dbg !172
  %conv4 = fpext double %div3 to x86_fp80, !dbg !172
  store x86_fp80 %conv4, x86_fp80* %a3, align 16, !dbg !172
  call void @llvm.dbg.declare(metadata !{x86_fp80* %Q}, metadata !177), !dbg !178
  %7 = load x86_fp80* %a1, align 16, !dbg !179
  %8 = load x86_fp80* %a1, align 16, !dbg !179
  %mul = fmul x86_fp80 %7, %8, !dbg !179
  %9 = load x86_fp80* %a2, align 16, !dbg !179
  %mul5 = fmul x86_fp80 0xK4000C000000000000000, %9, !dbg !179
  %sub = fsub x86_fp80 %mul, %mul5, !dbg !179
  %div6 = fdiv x86_fp80 %sub, 0xK40029000000000000000, !dbg !179
  store x86_fp80 %div6, x86_fp80* %Q, align 16, !dbg !179
  call void @llvm.dbg.declare(metadata !{x86_fp80* %R}, metadata !180), !dbg !181
  %10 = load x86_fp80* %a1, align 16, !dbg !182
  %mul7 = fmul x86_fp80 0xK40008000000000000000, %10, !dbg !182
  %11 = load x86_fp80* %a1, align 16, !dbg !182
  %mul8 = fmul x86_fp80 %mul7, %11, !dbg !182
  %12 = load x86_fp80* %a1, align 16, !dbg !182
  %mul9 = fmul x86_fp80 %mul8, %12, !dbg !182
  %13 = load x86_fp80* %a1, align 16, !dbg !182
  %mul10 = fmul x86_fp80 0xK40029000000000000000, %13, !dbg !182
  %14 = load x86_fp80* %a2, align 16, !dbg !182
  %mul11 = fmul x86_fp80 %mul10, %14, !dbg !182
  %sub12 = fsub x86_fp80 %mul9, %mul11, !dbg !182
  %15 = load x86_fp80* %a3, align 16, !dbg !182
  %mul13 = fmul x86_fp80 0xK4003D800000000000000, %15, !dbg !182
  %add = fadd x86_fp80 %sub12, %mul13, !dbg !182
  %div14 = fdiv x86_fp80 %add, 0xK4004D800000000000000, !dbg !182
  store x86_fp80 %div14, x86_fp80* %R, align 16, !dbg !182
  call void @llvm.dbg.declare(metadata !{double* %R2_Q3}, metadata !183), !dbg !184
  %16 = load x86_fp80* %R, align 16, !dbg !185
  %17 = load x86_fp80* %R, align 16, !dbg !185
  %mul15 = fmul x86_fp80 %16, %17, !dbg !185
  %18 = load x86_fp80* %Q, align 16, !dbg !185
  %19 = load x86_fp80* %Q, align 16, !dbg !185
  %mul16 = fmul x86_fp80 %18, %19, !dbg !185
  %20 = load x86_fp80* %Q, align 16, !dbg !185
  %mul17 = fmul x86_fp80 %mul16, %20, !dbg !185
  %sub18 = fsub x86_fp80 %mul15, %mul17, !dbg !185
  %conv19 = fptrunc x86_fp80 %sub18 to double, !dbg !185
  store double %conv19, double* %R2_Q3, align 8, !dbg !185
  call void @llvm.dbg.declare(metadata !{double* %theta}, metadata !186), !dbg !187
  %21 = load double* %R2_Q3, align 8, !dbg !188
  %cmp = fcmp ole double %21, 0.000000e+00, !dbg !188
  br i1 %cmp, label %if.then, label %if.else, !dbg !188

if.then:                                          ; preds = %entry
  %22 = atomicrmw add i64* @sdmprofile__BBcounter_2, i64 1 seq_cst, !dbg !190
  %23 = load i32** %solutions.addr, align 8, !dbg !190
  %24 = bitcast i32* %23 to i8*, !dbg !190
  %25 = load i32* %sdmprofile__threadnumber_st, !dbg !190
  call void @sdmprofile__SearchRoutine_HPonly(i8* %24, i8 1, i32 %25), !dbg !190
  store i32 3, i32* %23, align 4, !dbg !190
  %26 = load x86_fp80* %R, align 16, !dbg !192
  %27 = load x86_fp80* %Q, align 16, !dbg !193
  %28 = load x86_fp80* %Q, align 16, !dbg !193
  %mul21 = fmul x86_fp80 %27, %28, !dbg !193
  %29 = load x86_fp80* %Q, align 16, !dbg !193
  %mul22 = fmul x86_fp80 %mul21, %29, !dbg !193
  %conv23 = fptrunc x86_fp80 %mul22 to double, !dbg !193
  %call = call double @sqrt(double %conv23) #2, !dbg !193
  %conv24 = fpext double %call to x86_fp80, !dbg !193
  %div25 = fdiv x86_fp80 %26, %conv24, !dbg !193
  %conv26 = fptrunc x86_fp80 %div25 to double, !dbg !193
  %call27 = call double @acos(double %conv26) #2, !dbg !192
  store double %call27, double* %theta, align 8, !dbg !192
  %30 = load x86_fp80* %Q, align 16, !dbg !194
  %conv28 = fptrunc x86_fp80 %30 to double, !dbg !194
  %call29 = call double @sqrt(double %conv28) #2, !dbg !194
  %mul30 = fmul double -2.000000e+00, %call29, !dbg !194
  %31 = load double* %theta, align 8, !dbg !195
  %div31 = fdiv double %31, 3.000000e+00, !dbg !195
  %call32 = call double @cos(double %div31) #2, !dbg !195
  %mul33 = fmul double %mul30, %call32, !dbg !195
  %conv34 = fpext double %mul33 to x86_fp80, !dbg !195
  %32 = load x86_fp80* %a1, align 16, !dbg !195
  %div35 = fdiv x86_fp80 %32, 0xK4000C000000000000000, !dbg !195
  %sub36 = fsub x86_fp80 %conv34, %div35, !dbg !195
  %conv37 = fptrunc x86_fp80 %sub36 to double, !dbg !195
  %33 = load double** %x.addr, align 8, !dbg !195
  %arrayidx = getelementptr inbounds double* %33, i64 0, !dbg !195
  %34 = bitcast double* %arrayidx to i8*, !dbg !195
  %35 = load i32* %sdmprofile__threadnumber_st, !dbg !195
  call void @sdmprofile__SearchRoutine_HPonly(i8* %34, i8 1, i32 %35), !dbg !195
  store double %conv37, double* %arrayidx, align 8, !dbg !195
  %36 = load x86_fp80* %Q, align 16, !dbg !196
  %conv38 = fptrunc x86_fp80 %36 to double, !dbg !196
  %call39 = call double @sqrt(double %conv38) #2, !dbg !196
  %mul40 = fmul double -2.000000e+00, %call39, !dbg !196
  %37 = load double* %theta, align 8, !dbg !197
  %call41 = call double @atan(double 1.000000e+00) #2, !dbg !198
  %mul42 = fmul double 4.000000e+00, %call41, !dbg !198
  %mul43 = fmul double 2.000000e+00, %mul42, !dbg !198
  %add44 = fadd double %37, %mul43, !dbg !198
  %div45 = fdiv double %add44, 3.000000e+00, !dbg !198
  %call46 = call double @cos(double %div45) #2, !dbg !197
  %mul47 = fmul double %mul40, %call46, !dbg !197
  %conv48 = fpext double %mul47 to x86_fp80, !dbg !197
  %38 = load x86_fp80* %a1, align 16, !dbg !197
  %div49 = fdiv x86_fp80 %38, 0xK4000C000000000000000, !dbg !197
  %sub50 = fsub x86_fp80 %conv48, %div49, !dbg !197
  %conv51 = fptrunc x86_fp80 %sub50 to double, !dbg !197
  %39 = load double** %x.addr, align 8, !dbg !197
  %arrayidx52 = getelementptr inbounds double* %39, i64 1, !dbg !197
  %40 = bitcast double* %arrayidx52 to i8*, !dbg !197
  %41 = load i32* %sdmprofile__threadnumber_st, !dbg !197
  call void @sdmprofile__SearchRoutine_HPonly(i8* %40, i8 1, i32 %41), !dbg !197
  store double %conv51, double* %arrayidx52, align 8, !dbg !197
  %42 = load x86_fp80* %Q, align 16, !dbg !199
  %conv53 = fptrunc x86_fp80 %42 to double, !dbg !199
  %call54 = call double @sqrt(double %conv53) #2, !dbg !199
  %mul55 = fmul double -2.000000e+00, %call54, !dbg !199
  %43 = load double* %theta, align 8, !dbg !200
  %call56 = call double @atan(double 1.000000e+00) #2, !dbg !201
  %mul57 = fmul double 4.000000e+00, %call56, !dbg !201
  %mul58 = fmul double 4.000000e+00, %mul57, !dbg !201
  %add59 = fadd double %43, %mul58, !dbg !201
  %div60 = fdiv double %add59, 3.000000e+00, !dbg !201
  %call61 = call double @cos(double %div60) #2, !dbg !200
  %mul62 = fmul double %mul55, %call61, !dbg !200
  %conv63 = fpext double %mul62 to x86_fp80, !dbg !200
  %44 = load x86_fp80* %a1, align 16, !dbg !200
  %div64 = fdiv x86_fp80 %44, 0xK4000C000000000000000, !dbg !200
  %sub65 = fsub x86_fp80 %conv63, %div64, !dbg !200
  %conv66 = fptrunc x86_fp80 %sub65 to double, !dbg !200
  %45 = load double** %x.addr, align 8, !dbg !200
  %arrayidx67 = getelementptr inbounds double* %45, i64 2, !dbg !200
  %46 = bitcast double* %arrayidx67 to i8*, !dbg !200
  %47 = load i32* %sdmprofile__threadnumber_st, !dbg !200
  call void @sdmprofile__SearchRoutine_HPonly(i8* %46, i8 1, i32 %47), !dbg !200
  store double %conv66, double* %arrayidx67, align 8, !dbg !200
  br label %if.end, !dbg !202

if.else:                                          ; preds = %entry
  %48 = atomicrmw add i64* @sdmprofile__BBcounter_3, i64 1 seq_cst, !dbg !203
  %49 = load i32** %solutions.addr, align 8, !dbg !203
  %50 = bitcast i32* %49 to i8*, !dbg !203
  %51 = load i32* %sdmprofile__threadnumber_st, !dbg !203
  call void @sdmprofile__SearchRoutine_HPonly(i8* %50, i8 1, i32 %51), !dbg !203
  store i32 1, i32* %49, align 4, !dbg !203
  %52 = load double* %R2_Q3, align 8, !dbg !205
  %call68 = call double @sqrt(double %52) #2, !dbg !205
  %53 = load x86_fp80* %R, align 16, !dbg !206
  %conv69 = fptrunc x86_fp80 %53 to double, !dbg !206
  %call70 = call double @fabs(double %conv69) #12, !dbg !206
  %add71 = fadd double %call68, %call70, !dbg !206
  %call72 = call double @pow(double %add71, double 0x3FD5555555555555) #2, !dbg !207
  %54 = load double** %x.addr, align 8, !dbg !207
  %arrayidx73 = getelementptr inbounds double* %54, i64 0, !dbg !207
  %55 = bitcast double* %arrayidx73 to i8*, !dbg !207
  %56 = load i32* %sdmprofile__threadnumber_st, !dbg !207
  call void @sdmprofile__SearchRoutine_HPonly(i8* %55, i8 1, i32 %56), !dbg !207
  store double %call72, double* %arrayidx73, align 8, !dbg !207
  %57 = load x86_fp80* %Q, align 16, !dbg !208
  %58 = load double** %x.addr, align 8, !dbg !208
  %arrayidx74 = getelementptr inbounds double* %58, i64 0, !dbg !208
  %59 = bitcast double* %arrayidx74 to i8*, !dbg !208
  %60 = load i32* %sdmprofile__threadnumber_st, !dbg !208
  call void @sdmprofile__SearchRoutine_HPonly(i8* %59, i8 2, i32 %60), !dbg !208
  %61 = load double* %arrayidx74, align 8, !dbg !208
  %conv75 = fpext double %61 to x86_fp80, !dbg !208
  %div76 = fdiv x86_fp80 %57, %conv75, !dbg !208
  %62 = load double** %x.addr, align 8, !dbg !208
  %arrayidx77 = getelementptr inbounds double* %62, i64 0, !dbg !208
  %63 = bitcast double* %arrayidx77 to i8*, !dbg !208
  %64 = load i32* %sdmprofile__threadnumber_st, !dbg !208
  call void @sdmprofile__SearchRoutine_HPonly(i8* %63, i8 2, i32 %64), !dbg !208
  %65 = load double* %arrayidx77, align 8, !dbg !208
  %conv78 = fpext double %65 to x86_fp80, !dbg !208
  %add79 = fadd x86_fp80 %conv78, %div76, !dbg !208
  %conv80 = fptrunc x86_fp80 %add79 to double, !dbg !208
  %66 = bitcast double* %arrayidx77 to i8*, !dbg !208
  %67 = load i32* %sdmprofile__threadnumber_st, !dbg !208
  call void @sdmprofile__SearchRoutine_HPonly(i8* %66, i8 1, i32 %67), !dbg !208
  store double %conv80, double* %arrayidx77, align 8, !dbg !208
  %68 = load x86_fp80* %R, align 16, !dbg !209
  %cmp81 = fcmp olt x86_fp80 %68, 0xK00000000000000000000, !dbg !209
  %cond = select i1 %cmp81, i32 1, i32 -1, !dbg !209
  %conv83 = sitofp i32 %cond to double, !dbg !209
  %69 = load double** %x.addr, align 8, !dbg !209
  %arrayidx84 = getelementptr inbounds double* %69, i64 0, !dbg !209
  %70 = bitcast double* %arrayidx84 to i8*, !dbg !209
  %71 = load i32* %sdmprofile__threadnumber_st, !dbg !209
  call void @sdmprofile__SearchRoutine_HPonly(i8* %70, i8 2, i32 %71), !dbg !209
  %72 = load double* %arrayidx84, align 8, !dbg !209
  %mul85 = fmul double %72, %conv83, !dbg !209
  %73 = bitcast double* %arrayidx84 to i8*, !dbg !209
  %74 = load i32* %sdmprofile__threadnumber_st, !dbg !209
  call void @sdmprofile__SearchRoutine_HPonly(i8* %73, i8 1, i32 %74), !dbg !209
  store double %mul85, double* %arrayidx84, align 8, !dbg !209
  %75 = load x86_fp80* %a1, align 16, !dbg !210
  %div86 = fdiv x86_fp80 %75, 0xK4000C000000000000000, !dbg !210
  %76 = load double** %x.addr, align 8, !dbg !210
  %arrayidx87 = getelementptr inbounds double* %76, i64 0, !dbg !210
  %77 = bitcast double* %arrayidx87 to i8*, !dbg !210
  %78 = load i32* %sdmprofile__threadnumber_st, !dbg !210
  call void @sdmprofile__SearchRoutine_HPonly(i8* %77, i8 2, i32 %78), !dbg !210
  %79 = load double* %arrayidx87, align 8, !dbg !210
  %conv88 = fpext double %79 to x86_fp80, !dbg !210
  %sub89 = fsub x86_fp80 %conv88, %div86, !dbg !210
  %conv90 = fptrunc x86_fp80 %sub89 to double, !dbg !210
  %80 = bitcast double* %arrayidx87 to i8*, !dbg !210
  %81 = load i32* %sdmprofile__threadnumber_st, !dbg !210
  call void @sdmprofile__SearchRoutine_HPonly(i8* %80, i8 1, i32 %81), !dbg !210
  store double %conv90, double* %arrayidx87, align 8, !dbg !210
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %82 = atomicrmw add i64* @sdmprofile__BBcounter_4, i64 1 seq_cst, !dbg !211
  ret void, !dbg !211
}

; Function Attrs: nounwind uwtable
define double @deg2rad(double %deg, i32 %sdmprofile__threadnumber) #11 {
entry:
  %deg.addr = alloca double, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store double %deg, double* %deg.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_74, i64 1 seq_cst, !dbg !212
  call void @llvm.dbg.declare(metadata !{double* %deg.addr}, metadata !213), !dbg !212
  %call = call double @atan(double 1.000000e+00) #2, !dbg !214
  %mul = fmul double 4.000000e+00, %call, !dbg !214
  %1 = load double* %deg.addr, align 8, !dbg !214
  %mul1 = fmul double %mul, %1, !dbg !214
  %div = fdiv double %mul1, 1.800000e+02, !dbg !214
  ret double %div, !dbg !214
}

; Function Attrs: nounwind uwtable
define i32 @app__mainfunction__(i32 %sdmprofile__threadnumber) #11 {
entry:
  %retval = alloca i32, align 4
  %a1 = alloca double, align 8
  %b1 = alloca double, align 8
  %c1 = alloca double, align 8
  %d1 = alloca double, align 8
  %x = alloca [3 x double], align 16
  %X = alloca double, align 8
  %solutions = alloca i32, align 4
  %i = alloca i32, align 4
  %l = alloca i64, align 8
  %q = alloca %struct.int_sqrt.0, align 4
  %n = alloca i64, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  store i32 0, i32* %retval
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_5, i64 1 seq_cst, !dbg !215
  call void @llvm.dbg.declare(metadata !{double* %a1}, metadata !216), !dbg !215
  store double 1.000000e+00, double* %a1, align 8, !dbg !217
  call void @llvm.dbg.declare(metadata !{double* %b1}, metadata !218), !dbg !219
  store double -1.050000e+01, double* %b1, align 8, !dbg !217
  call void @llvm.dbg.declare(metadata !{double* %c1}, metadata !220), !dbg !221
  store double 3.200000e+01, double* %c1, align 8, !dbg !217
  call void @llvm.dbg.declare(metadata !{double* %d1}, metadata !222), !dbg !223
  store double -3.000000e+01, double* %d1, align 8, !dbg !217
  call void @llvm.dbg.declare(metadata !{[3 x double]* %x}, metadata !224), !dbg !228
  call void @llvm.dbg.declare(metadata !{double* %X}, metadata !229), !dbg !230
  call void @llvm.dbg.declare(metadata !{i32* %solutions}, metadata !231), !dbg !232
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !233), !dbg !234
  call void @llvm.dbg.declare(metadata !{i64* %l}, metadata !235), !dbg !236
  store i64 1072497001, i64* %l, align 8, !dbg !237
  call void @llvm.dbg.declare(metadata !{%struct.int_sqrt.0* %q}, metadata !238), !dbg !243
  call void @llvm.dbg.declare(metadata !{i64* %n}, metadata !244), !dbg !246
  store i64 0, i64* %n, align 8, !dbg !247
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str1, i32 0, i32 0)), !dbg !248
  %1 = load double* %a1, align 8, !dbg !249
  %2 = load double* %b1, align 8, !dbg !249
  %3 = load double* %c1, align 8, !dbg !249
  %4 = load double* %d1, align 8, !dbg !249
  %arraydecay = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !dbg !249
  %sdmprofile__LD9 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @SolveCubic(double %1, double %2, double %3, double %4, i32* %solutions, double* %arraydecay, i32 %sdmprofile__LD9), !dbg !249
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str16, i32 0, i32 0)), !dbg !250
  store i32 0, i32* %i, align 4, !dbg !251
  br label %for.cond, !dbg !251

for.cond:                                         ; preds = %for.inc, %entry
  %5 = atomicrmw add i64* @sdmprofile__BBcounter_6, i64 1 seq_cst, !dbg !253
  %6 = load i32* %i, align 4, !dbg !253
  %7 = load i32* %solutions, align 4, !dbg !253
  %cmp = icmp slt i32 %6, %7, !dbg !253
  br i1 %cmp, label %for.body, label %for.end, !dbg !253

for.body:                                         ; preds = %for.cond
  %8 = atomicrmw add i64* @sdmprofile__BBcounter_7, i64 1 seq_cst, !dbg !256
  %9 = load i32* %i, align 4, !dbg !256
  %idxprom = sext i32 %9 to i64, !dbg !256
  %arrayidx = getelementptr inbounds [3 x double]* %x, i32 0, i64 %idxprom, !dbg !256
  %10 = load double* %arrayidx, align 8, !dbg !256
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %10), !dbg !256
  br label %for.inc, !dbg !256

for.inc:                                          ; preds = %for.body
  %11 = atomicrmw add i64* @sdmprofile__BBcounter_8, i64 1 seq_cst, !dbg !257
  %12 = load i32* %i, align 4, !dbg !257
  %inc = add nsw i32 %12, 1, !dbg !257
  store i32 %inc, i32* %i, align 4, !dbg !257
  br label %for.cond, !dbg !257

for.end:                                          ; preds = %for.cond
  %13 = atomicrmw add i64* @sdmprofile__BBcounter_9, i64 1 seq_cst, !dbg !258
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str37, i32 0, i32 0)), !dbg !258
  store double 1.000000e+00, double* %a1, align 8, !dbg !259
  store double -4.500000e+00, double* %b1, align 8, !dbg !260
  store double 1.700000e+01, double* %c1, align 8, !dbg !261
  store double -3.000000e+01, double* %d1, align 8, !dbg !262
  %14 = load double* %a1, align 8, !dbg !263
  %15 = load double* %b1, align 8, !dbg !263
  %16 = load double* %c1, align 8, !dbg !263
  %17 = load double* %d1, align 8, !dbg !263
  %arraydecay4 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !dbg !263
  %sdmprofile__LD8 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @SolveCubic(double %14, double %15, double %16, double %17, i32* %solutions, double* %arraydecay4, i32 %sdmprofile__LD8), !dbg !263
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str16, i32 0, i32 0)), !dbg !264
  store i32 0, i32* %i, align 4, !dbg !265
  br label %for.cond6, !dbg !265

for.cond6:                                        ; preds = %for.inc12, %for.end
  %18 = atomicrmw add i64* @sdmprofile__BBcounter_10, i64 1 seq_cst, !dbg !267
  %19 = load i32* %i, align 4, !dbg !267
  %20 = load i32* %solutions, align 4, !dbg !267
  %cmp7 = icmp slt i32 %19, %20, !dbg !267
  br i1 %cmp7, label %for.body8, label %for.end14, !dbg !267

for.body8:                                        ; preds = %for.cond6
  %21 = atomicrmw add i64* @sdmprofile__BBcounter_11, i64 1 seq_cst, !dbg !270
  %22 = load i32* %i, align 4, !dbg !270
  %idxprom9 = sext i32 %22 to i64, !dbg !270
  %arrayidx10 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %idxprom9, !dbg !270
  %23 = load double* %arrayidx10, align 8, !dbg !270
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %23), !dbg !270
  br label %for.inc12, !dbg !270

for.inc12:                                        ; preds = %for.body8
  %24 = atomicrmw add i64* @sdmprofile__BBcounter_12, i64 1 seq_cst, !dbg !271
  %25 = load i32* %i, align 4, !dbg !271
  %inc13 = add nsw i32 %25, 1, !dbg !271
  store i32 %inc13, i32* %i, align 4, !dbg !271
  br label %for.cond6, !dbg !271

for.end14:                                        ; preds = %for.cond6
  %26 = atomicrmw add i64* @sdmprofile__BBcounter_13, i64 1 seq_cst, !dbg !272
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str37, i32 0, i32 0)), !dbg !272
  store double 1.000000e+00, double* %a1, align 8, !dbg !273
  store double -3.500000e+00, double* %b1, align 8, !dbg !274
  store double 2.200000e+01, double* %c1, align 8, !dbg !275
  store double -3.100000e+01, double* %d1, align 8, !dbg !276
  %27 = load double* %a1, align 8, !dbg !277
  %28 = load double* %b1, align 8, !dbg !277
  %29 = load double* %c1, align 8, !dbg !277
  %30 = load double* %d1, align 8, !dbg !277
  %arraydecay16 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !dbg !277
  %sdmprofile__LD7 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @SolveCubic(double %27, double %28, double %29, double %30, i32* %solutions, double* %arraydecay16, i32 %sdmprofile__LD7), !dbg !277
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str16, i32 0, i32 0)), !dbg !278
  store i32 0, i32* %i, align 4, !dbg !279
  br label %for.cond18, !dbg !279

for.cond18:                                       ; preds = %for.inc24, %for.end14
  %31 = atomicrmw add i64* @sdmprofile__BBcounter_14, i64 1 seq_cst, !dbg !281
  %32 = load i32* %i, align 4, !dbg !281
  %33 = load i32* %solutions, align 4, !dbg !281
  %cmp19 = icmp slt i32 %32, %33, !dbg !281
  br i1 %cmp19, label %for.body20, label %for.end26, !dbg !281

for.body20:                                       ; preds = %for.cond18
  %34 = atomicrmw add i64* @sdmprofile__BBcounter_15, i64 1 seq_cst, !dbg !284
  %35 = load i32* %i, align 4, !dbg !284
  %idxprom21 = sext i32 %35 to i64, !dbg !284
  %arrayidx22 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %idxprom21, !dbg !284
  %36 = load double* %arrayidx22, align 8, !dbg !284
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %36), !dbg !284
  br label %for.inc24, !dbg !284

for.inc24:                                        ; preds = %for.body20
  %37 = atomicrmw add i64* @sdmprofile__BBcounter_16, i64 1 seq_cst, !dbg !285
  %38 = load i32* %i, align 4, !dbg !285
  %inc25 = add nsw i32 %38, 1, !dbg !285
  store i32 %inc25, i32* %i, align 4, !dbg !285
  br label %for.cond18, !dbg !285

for.end26:                                        ; preds = %for.cond18
  %39 = atomicrmw add i64* @sdmprofile__BBcounter_17, i64 1 seq_cst, !dbg !286
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str37, i32 0, i32 0)), !dbg !286
  store double 1.000000e+00, double* %a1, align 8, !dbg !287
  store double -1.370000e+01, double* %b1, align 8, !dbg !288
  store double 1.000000e+00, double* %c1, align 8, !dbg !289
  store double -3.500000e+01, double* %d1, align 8, !dbg !290
  %40 = load double* %a1, align 8, !dbg !291
  %41 = load double* %b1, align 8, !dbg !291
  %42 = load double* %c1, align 8, !dbg !291
  %43 = load double* %d1, align 8, !dbg !291
  %arraydecay28 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !dbg !291
  %sdmprofile__LD6 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @SolveCubic(double %40, double %41, double %42, double %43, i32* %solutions, double* %arraydecay28, i32 %sdmprofile__LD6), !dbg !291
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str16, i32 0, i32 0)), !dbg !292
  store i32 0, i32* %i, align 4, !dbg !293
  br label %for.cond30, !dbg !293

for.cond30:                                       ; preds = %for.inc36, %for.end26
  %44 = atomicrmw add i64* @sdmprofile__BBcounter_18, i64 1 seq_cst, !dbg !295
  %45 = load i32* %i, align 4, !dbg !295
  %46 = load i32* %solutions, align 4, !dbg !295
  %cmp31 = icmp slt i32 %45, %46, !dbg !295
  br i1 %cmp31, label %for.body32, label %for.end38, !dbg !295

for.body32:                                       ; preds = %for.cond30
  %47 = atomicrmw add i64* @sdmprofile__BBcounter_19, i64 1 seq_cst, !dbg !298
  %48 = load i32* %i, align 4, !dbg !298
  %idxprom33 = sext i32 %48 to i64, !dbg !298
  %arrayidx34 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %idxprom33, !dbg !298
  %49 = load double* %arrayidx34, align 8, !dbg !298
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %49), !dbg !298
  br label %for.inc36, !dbg !298

for.inc36:                                        ; preds = %for.body32
  %50 = atomicrmw add i64* @sdmprofile__BBcounter_20, i64 1 seq_cst, !dbg !299
  %51 = load i32* %i, align 4, !dbg !299
  %inc37 = add nsw i32 %51, 1, !dbg !299
  store i32 %inc37, i32* %i, align 4, !dbg !299
  br label %for.cond30, !dbg !299

for.end38:                                        ; preds = %for.cond30
  %52 = atomicrmw add i64* @sdmprofile__BBcounter_21, i64 1 seq_cst, !dbg !300
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str37, i32 0, i32 0)), !dbg !300
  store double 3.000000e+00, double* %a1, align 8, !dbg !301
  store double 1.234000e+01, double* %b1, align 8, !dbg !302
  store double 5.000000e+00, double* %c1, align 8, !dbg !303
  store double 1.200000e+01, double* %d1, align 8, !dbg !304
  %53 = load double* %a1, align 8, !dbg !305
  %54 = load double* %b1, align 8, !dbg !305
  %55 = load double* %c1, align 8, !dbg !305
  %56 = load double* %d1, align 8, !dbg !305
  %arraydecay40 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !dbg !305
  %sdmprofile__LD5 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @SolveCubic(double %53, double %54, double %55, double %56, i32* %solutions, double* %arraydecay40, i32 %sdmprofile__LD5), !dbg !305
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str16, i32 0, i32 0)), !dbg !306
  store i32 0, i32* %i, align 4, !dbg !307
  br label %for.cond42, !dbg !307

for.cond42:                                       ; preds = %for.inc48, %for.end38
  %57 = atomicrmw add i64* @sdmprofile__BBcounter_22, i64 1 seq_cst, !dbg !309
  %58 = load i32* %i, align 4, !dbg !309
  %59 = load i32* %solutions, align 4, !dbg !309
  %cmp43 = icmp slt i32 %58, %59, !dbg !309
  br i1 %cmp43, label %for.body44, label %for.end50, !dbg !309

for.body44:                                       ; preds = %for.cond42
  %60 = atomicrmw add i64* @sdmprofile__BBcounter_23, i64 1 seq_cst, !dbg !312
  %61 = load i32* %i, align 4, !dbg !312
  %idxprom45 = sext i32 %61 to i64, !dbg !312
  %arrayidx46 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %idxprom45, !dbg !312
  %62 = load double* %arrayidx46, align 8, !dbg !312
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %62), !dbg !312
  br label %for.inc48, !dbg !312

for.inc48:                                        ; preds = %for.body44
  %63 = atomicrmw add i64* @sdmprofile__BBcounter_24, i64 1 seq_cst, !dbg !313
  %64 = load i32* %i, align 4, !dbg !313
  %inc49 = add nsw i32 %64, 1, !dbg !313
  store i32 %inc49, i32* %i, align 4, !dbg !313
  br label %for.cond42, !dbg !313

for.end50:                                        ; preds = %for.cond42
  %65 = atomicrmw add i64* @sdmprofile__BBcounter_25, i64 1 seq_cst, !dbg !314
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str37, i32 0, i32 0)), !dbg !314
  store double -8.000000e+00, double* %a1, align 8, !dbg !315
  store double -6.789000e+01, double* %b1, align 8, !dbg !316
  store double 6.000000e+00, double* %c1, align 8, !dbg !317
  store double -2.360000e+01, double* %d1, align 8, !dbg !318
  %66 = load double* %a1, align 8, !dbg !319
  %67 = load double* %b1, align 8, !dbg !319
  %68 = load double* %c1, align 8, !dbg !319
  %69 = load double* %d1, align 8, !dbg !319
  %arraydecay52 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !dbg !319
  %sdmprofile__LD4 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @SolveCubic(double %66, double %67, double %68, double %69, i32* %solutions, double* %arraydecay52, i32 %sdmprofile__LD4), !dbg !319
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str16, i32 0, i32 0)), !dbg !320
  store i32 0, i32* %i, align 4, !dbg !321
  br label %for.cond54, !dbg !321

for.cond54:                                       ; preds = %for.inc60, %for.end50
  %70 = atomicrmw add i64* @sdmprofile__BBcounter_26, i64 1 seq_cst, !dbg !323
  %71 = load i32* %i, align 4, !dbg !323
  %72 = load i32* %solutions, align 4, !dbg !323
  %cmp55 = icmp slt i32 %71, %72, !dbg !323
  br i1 %cmp55, label %for.body56, label %for.end62, !dbg !323

for.body56:                                       ; preds = %for.cond54
  %73 = atomicrmw add i64* @sdmprofile__BBcounter_27, i64 1 seq_cst, !dbg !326
  %74 = load i32* %i, align 4, !dbg !326
  %idxprom57 = sext i32 %74 to i64, !dbg !326
  %arrayidx58 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %idxprom57, !dbg !326
  %75 = load double* %arrayidx58, align 8, !dbg !326
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %75), !dbg !326
  br label %for.inc60, !dbg !326

for.inc60:                                        ; preds = %for.body56
  %76 = atomicrmw add i64* @sdmprofile__BBcounter_28, i64 1 seq_cst, !dbg !327
  %77 = load i32* %i, align 4, !dbg !327
  %inc61 = add nsw i32 %77, 1, !dbg !327
  store i32 %inc61, i32* %i, align 4, !dbg !327
  br label %for.cond54, !dbg !327

for.end62:                                        ; preds = %for.cond54
  %78 = atomicrmw add i64* @sdmprofile__BBcounter_29, i64 1 seq_cst, !dbg !328
  %call63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str37, i32 0, i32 0)), !dbg !328
  store double 4.500000e+01, double* %a1, align 8, !dbg !329
  store double 8.670000e+00, double* %b1, align 8, !dbg !330
  store double 7.500000e+00, double* %c1, align 8, !dbg !331
  store double 3.400000e+01, double* %d1, align 8, !dbg !332
  %79 = load double* %a1, align 8, !dbg !333
  %80 = load double* %b1, align 8, !dbg !333
  %81 = load double* %c1, align 8, !dbg !333
  %82 = load double* %d1, align 8, !dbg !333
  %arraydecay64 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !dbg !333
  %sdmprofile__LD3 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @SolveCubic(double %79, double %80, double %81, double %82, i32* %solutions, double* %arraydecay64, i32 %sdmprofile__LD3), !dbg !333
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str16, i32 0, i32 0)), !dbg !334
  store i32 0, i32* %i, align 4, !dbg !335
  br label %for.cond66, !dbg !335

for.cond66:                                       ; preds = %for.inc72, %for.end62
  %83 = atomicrmw add i64* @sdmprofile__BBcounter_30, i64 1 seq_cst, !dbg !337
  %84 = load i32* %i, align 4, !dbg !337
  %85 = load i32* %solutions, align 4, !dbg !337
  %cmp67 = icmp slt i32 %84, %85, !dbg !337
  br i1 %cmp67, label %for.body68, label %for.end74, !dbg !337

for.body68:                                       ; preds = %for.cond66
  %86 = atomicrmw add i64* @sdmprofile__BBcounter_31, i64 1 seq_cst, !dbg !340
  %87 = load i32* %i, align 4, !dbg !340
  %idxprom69 = sext i32 %87 to i64, !dbg !340
  %arrayidx70 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %idxprom69, !dbg !340
  %88 = load double* %arrayidx70, align 8, !dbg !340
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %88), !dbg !340
  br label %for.inc72, !dbg !340

for.inc72:                                        ; preds = %for.body68
  %89 = atomicrmw add i64* @sdmprofile__BBcounter_32, i64 1 seq_cst, !dbg !341
  %90 = load i32* %i, align 4, !dbg !341
  %inc73 = add nsw i32 %90, 1, !dbg !341
  store i32 %inc73, i32* %i, align 4, !dbg !341
  br label %for.cond66, !dbg !341

for.end74:                                        ; preds = %for.cond66
  %91 = atomicrmw add i64* @sdmprofile__BBcounter_33, i64 1 seq_cst, !dbg !342
  %call75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str37, i32 0, i32 0)), !dbg !342
  store double -1.200000e+01, double* %a1, align 8, !dbg !343
  store double -1.700000e+00, double* %b1, align 8, !dbg !344
  store double 5.300000e+00, double* %c1, align 8, !dbg !345
  store double 1.600000e+01, double* %d1, align 8, !dbg !346
  %92 = load double* %a1, align 8, !dbg !347
  %93 = load double* %b1, align 8, !dbg !347
  %94 = load double* %c1, align 8, !dbg !347
  %95 = load double* %d1, align 8, !dbg !347
  %arraydecay76 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !dbg !347
  %sdmprofile__LD2 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @SolveCubic(double %92, double %93, double %94, double %95, i32* %solutions, double* %arraydecay76, i32 %sdmprofile__LD2), !dbg !347
  %call77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str16, i32 0, i32 0)), !dbg !348
  store i32 0, i32* %i, align 4, !dbg !349
  br label %for.cond78, !dbg !349

for.cond78:                                       ; preds = %for.inc84, %for.end74
  %96 = atomicrmw add i64* @sdmprofile__BBcounter_34, i64 1 seq_cst, !dbg !351
  %97 = load i32* %i, align 4, !dbg !351
  %98 = load i32* %solutions, align 4, !dbg !351
  %cmp79 = icmp slt i32 %97, %98, !dbg !351
  br i1 %cmp79, label %for.body80, label %for.end86, !dbg !351

for.body80:                                       ; preds = %for.cond78
  %99 = atomicrmw add i64* @sdmprofile__BBcounter_35, i64 1 seq_cst, !dbg !354
  %100 = load i32* %i, align 4, !dbg !354
  %idxprom81 = sext i32 %100 to i64, !dbg !354
  %arrayidx82 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %idxprom81, !dbg !354
  %101 = load double* %arrayidx82, align 8, !dbg !354
  %call83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %101), !dbg !354
  br label %for.inc84, !dbg !354

for.inc84:                                        ; preds = %for.body80
  %102 = atomicrmw add i64* @sdmprofile__BBcounter_36, i64 1 seq_cst, !dbg !355
  %103 = load i32* %i, align 4, !dbg !355
  %inc85 = add nsw i32 %103, 1, !dbg !355
  store i32 %inc85, i32* %i, align 4, !dbg !355
  br label %for.cond78, !dbg !355

for.end86:                                        ; preds = %for.cond78
  %104 = atomicrmw add i64* @sdmprofile__BBcounter_37, i64 1 seq_cst, !dbg !356
  %call87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str37, i32 0, i32 0)), !dbg !356
  store double 1.000000e+00, double* %a1, align 8, !dbg !357
  br label %for.cond88, !dbg !357

for.cond88:                                       ; preds = %for.inc119, %for.end86
  %105 = atomicrmw add i64* @sdmprofile__BBcounter_38, i64 1 seq_cst, !dbg !359
  %106 = load double* %a1, align 8, !dbg !359
  %cmp89 = fcmp olt double %106, 1.000000e+01, !dbg !359
  br i1 %cmp89, label %for.body90, label %for.end121, !dbg !359

for.body90:                                       ; preds = %for.cond88
  %107 = atomicrmw add i64* @sdmprofile__BBcounter_39, i64 1 seq_cst, !dbg !362
  store double 1.000000e+01, double* %b1, align 8, !dbg !362
  br label %for.cond91, !dbg !362

for.cond91:                                       ; preds = %for.inc116, %for.body90
  %108 = atomicrmw add i64* @sdmprofile__BBcounter_40, i64 1 seq_cst, !dbg !365
  %109 = load double* %b1, align 8, !dbg !365
  %cmp92 = fcmp ogt double %109, 0.000000e+00, !dbg !365
  br i1 %cmp92, label %for.body93, label %for.end118, !dbg !365

for.body93:                                       ; preds = %for.cond91
  %110 = atomicrmw add i64* @sdmprofile__BBcounter_41, i64 1 seq_cst, !dbg !368
  store double 5.000000e+00, double* %c1, align 8, !dbg !368
  br label %for.cond94, !dbg !368

for.cond94:                                       ; preds = %for.inc114, %for.body93
  %111 = atomicrmw add i64* @sdmprofile__BBcounter_42, i64 1 seq_cst, !dbg !371
  %112 = load double* %c1, align 8, !dbg !371
  %cmp95 = fcmp olt double %112, 1.500000e+01, !dbg !371
  br i1 %cmp95, label %for.body96, label %for.end115, !dbg !371

for.body96:                                       ; preds = %for.cond94
  %113 = atomicrmw add i64* @sdmprofile__BBcounter_43, i64 1 seq_cst, !dbg !374
  store double -1.000000e+00, double* %d1, align 8, !dbg !374
  br label %for.cond97, !dbg !374

for.cond97:                                       ; preds = %for.inc112, %for.body96
  %114 = atomicrmw add i64* @sdmprofile__BBcounter_44, i64 1 seq_cst, !dbg !377
  %115 = load double* %d1, align 8, !dbg !377
  %cmp98 = fcmp ogt double %115, -5.000000e+00, !dbg !377
  br i1 %cmp98, label %for.body99, label %for.end113, !dbg !377

for.body99:                                       ; preds = %for.cond97
  %116 = atomicrmw add i64* @sdmprofile__BBcounter_45, i64 1 seq_cst, !dbg !380
  %117 = load double* %a1, align 8, !dbg !380
  %118 = load double* %b1, align 8, !dbg !380
  %119 = load double* %c1, align 8, !dbg !380
  %120 = load double* %d1, align 8, !dbg !380
  %arraydecay100 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !dbg !380
  %sdmprofile__LD1 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @SolveCubic(double %117, double %118, double %119, double %120, i32* %solutions, double* %arraydecay100, i32 %sdmprofile__LD1), !dbg !380
  %call101 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str16, i32 0, i32 0)), !dbg !382
  store i32 0, i32* %i, align 4, !dbg !383
  br label %for.cond102, !dbg !383

for.cond102:                                      ; preds = %for.inc108, %for.body99
  %121 = atomicrmw add i64* @sdmprofile__BBcounter_46, i64 1 seq_cst, !dbg !385
  %122 = load i32* %i, align 4, !dbg !385
  %123 = load i32* %solutions, align 4, !dbg !385
  %cmp103 = icmp slt i32 %122, %123, !dbg !385
  br i1 %cmp103, label %for.body104, label %for.end110, !dbg !385

for.body104:                                      ; preds = %for.cond102
  %124 = atomicrmw add i64* @sdmprofile__BBcounter_47, i64 1 seq_cst, !dbg !388
  %125 = load i32* %i, align 4, !dbg !388
  %idxprom105 = sext i32 %125 to i64, !dbg !388
  %arrayidx106 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %idxprom105, !dbg !388
  %126 = load double* %arrayidx106, align 8, !dbg !388
  %call107 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %126), !dbg !388
  br label %for.inc108, !dbg !388

for.inc108:                                       ; preds = %for.body104
  %127 = atomicrmw add i64* @sdmprofile__BBcounter_48, i64 1 seq_cst, !dbg !389
  %128 = load i32* %i, align 4, !dbg !389
  %inc109 = add nsw i32 %128, 1, !dbg !389
  store i32 %inc109, i32* %i, align 4, !dbg !389
  br label %for.cond102, !dbg !389

for.end110:                                       ; preds = %for.cond102
  %129 = atomicrmw add i64* @sdmprofile__BBcounter_49, i64 1 seq_cst, !dbg !390
  %call111 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str37, i32 0, i32 0)), !dbg !390
  br label %for.inc112, !dbg !391

for.inc112:                                       ; preds = %for.end110
  %130 = atomicrmw add i64* @sdmprofile__BBcounter_50, i64 1 seq_cst, !dbg !392
  %131 = load double* %d1, align 8, !dbg !392
  %sub = fsub double %131, 4.510000e-01, !dbg !392
  store double %sub, double* %d1, align 8, !dbg !392
  br label %for.cond97, !dbg !392

for.end113:                                       ; preds = %for.cond97
  %132 = atomicrmw add i64* @sdmprofile__BBcounter_51, i64 1 seq_cst, !dbg !393
  br label %for.inc114, !dbg !393

for.inc114:                                       ; preds = %for.end113
  %133 = atomicrmw add i64* @sdmprofile__BBcounter_52, i64 1 seq_cst, !dbg !394
  %134 = load double* %c1, align 8, !dbg !394
  %add = fadd double %134, 6.100000e-01, !dbg !394
  store double %add, double* %c1, align 8, !dbg !394
  br label %for.cond94, !dbg !394

for.end115:                                       ; preds = %for.cond94
  %135 = atomicrmw add i64* @sdmprofile__BBcounter_53, i64 1 seq_cst, !dbg !395
  br label %for.inc116, !dbg !395

for.inc116:                                       ; preds = %for.end115
  %136 = atomicrmw add i64* @sdmprofile__BBcounter_54, i64 1 seq_cst, !dbg !396
  %137 = load double* %b1, align 8, !dbg !396
  %sub117 = fsub double %137, 2.500000e-01, !dbg !396
  store double %sub117, double* %b1, align 8, !dbg !396
  br label %for.cond91, !dbg !396

for.end118:                                       ; preds = %for.cond91
  %138 = atomicrmw add i64* @sdmprofile__BBcounter_55, i64 1 seq_cst, !dbg !397
  br label %for.inc119, !dbg !397

for.inc119:                                       ; preds = %for.end118
  %139 = atomicrmw add i64* @sdmprofile__BBcounter_56, i64 1 seq_cst, !dbg !398
  %140 = load double* %a1, align 8, !dbg !398
  %add120 = fadd double %140, 1.000000e+00, !dbg !398
  store double %add120, double* %a1, align 8, !dbg !398
  br label %for.cond88, !dbg !398

for.end121:                                       ; preds = %for.cond88
  %141 = atomicrmw add i64* @sdmprofile__BBcounter_57, i64 1 seq_cst, !dbg !399
  %call122 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str48, i32 0, i32 0)), !dbg !399
  store i32 0, i32* %i, align 4, !dbg !400
  br label %for.cond123, !dbg !400

for.cond123:                                      ; preds = %for.inc127, %for.end121
  %142 = atomicrmw add i64* @sdmprofile__BBcounter_58, i64 1 seq_cst, !dbg !402
  %143 = load i32* %i, align 4, !dbg !402
  %cmp124 = icmp slt i32 %143, 100000, !dbg !402
  br i1 %cmp124, label %for.body125, label %for.end129, !dbg !402

for.body125:                                      ; preds = %for.cond123
  %144 = atomicrmw add i64* @sdmprofile__BBcounter_59, i64 1 seq_cst, !dbg !405
  %145 = load i32* %i, align 4, !dbg !405
  %conv = sext i32 %145 to i64, !dbg !405
  %sdmprofile__LD11 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @usqrt(i64 %conv, %struct.int_sqrt.0* %q, i32 %sdmprofile__LD11), !dbg !405
  %146 = load i32* %i, align 4, !dbg !407
  %sqrt = getelementptr inbounds %struct.int_sqrt.0* %q, i32 0, i32 0, !dbg !407
  %147 = load i32* %sqrt, align 4, !dbg !407
  %call126 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str59, i32 0, i32 0), i32 %146, i32 %147), !dbg !407
  br label %for.inc127, !dbg !408

for.inc127:                                       ; preds = %for.body125
  %148 = atomicrmw add i64* @sdmprofile__BBcounter_60, i64 1 seq_cst, !dbg !409
  %149 = load i32* %i, align 4, !dbg !409
  %add128 = add nsw i32 %149, 2, !dbg !409
  store i32 %add128, i32* %i, align 4, !dbg !409
  br label %for.cond123, !dbg !409

for.end129:                                       ; preds = %for.cond123
  %150 = atomicrmw add i64* @sdmprofile__BBcounter_61, i64 1 seq_cst, !dbg !410
  %call130 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str37, i32 0, i32 0)), !dbg !410
  store i64 1072497001, i64* %l, align 8, !dbg !411
  br label %for.cond131, !dbg !411

for.cond131:                                      ; preds = %for.inc137, %for.end129
  %151 = atomicrmw add i64* @sdmprofile__BBcounter_62, i64 1 seq_cst, !dbg !413
  %152 = load i64* %l, align 8, !dbg !413
  %cmp132 = icmp ult i64 %152, 1072513385, !dbg !413
  br i1 %cmp132, label %for.body134, label %for.end139, !dbg !413

for.body134:                                      ; preds = %for.cond131
  %153 = atomicrmw add i64* @sdmprofile__BBcounter_63, i64 1 seq_cst, !dbg !416
  %154 = load i64* %l, align 8, !dbg !416
  %sdmprofile__LD10 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @usqrt(i64 %154, %struct.int_sqrt.0* %q, i32 %sdmprofile__LD10), !dbg !416
  %155 = load i64* %l, align 8, !dbg !418
  %sqrt135 = getelementptr inbounds %struct.int_sqrt.0* %q, i32 0, i32 0, !dbg !418
  %156 = load i32* %sqrt135, align 4, !dbg !418
  %call136 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str610, i32 0, i32 0), i64 %155, i32 %156), !dbg !418
  br label %for.inc137, !dbg !419

for.inc137:                                       ; preds = %for.body134
  %157 = atomicrmw add i64* @sdmprofile__BBcounter_64, i64 1 seq_cst, !dbg !420
  %158 = load i64* %l, align 8, !dbg !420
  %inc138 = add i64 %158, 1, !dbg !420
  store i64 %inc138, i64* %l, align 8, !dbg !420
  br label %for.cond131, !dbg !420

for.end139:                                       ; preds = %for.cond131
  %159 = atomicrmw add i64* @sdmprofile__BBcounter_65, i64 1 seq_cst, !dbg !421
  %call140 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str711, i32 0, i32 0)), !dbg !421
  store double 0.000000e+00, double* %X, align 8, !dbg !422
  br label %for.cond141, !dbg !422

for.cond141:                                      ; preds = %for.inc148, %for.end139
  %160 = atomicrmw add i64* @sdmprofile__BBcounter_66, i64 1 seq_cst, !dbg !424
  %161 = load double* %X, align 8, !dbg !424
  %cmp142 = fcmp ole double %161, 3.600000e+02, !dbg !424
  br i1 %cmp142, label %for.body144, label %for.end150, !dbg !424

for.body144:                                      ; preds = %for.cond141
  %162 = atomicrmw add i64* @sdmprofile__BBcounter_67, i64 1 seq_cst, !dbg !427
  %163 = load double* %X, align 8, !dbg !427
  %164 = load double* %X, align 8, !dbg !427
  %call145 = call double @atan(double 1.000000e+00) #2, !dbg !428
  %mul = fmul double 4.000000e+00, %call145, !dbg !428
  %mul146 = fmul double %164, %mul, !dbg !428
  %div = fdiv double %mul146, 1.800000e+02, !dbg !428
  %call147 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str812, i32 0, i32 0), double %163, double %div), !dbg !427
  br label %for.inc148, !dbg !427

for.inc148:                                       ; preds = %for.body144
  %165 = atomicrmw add i64* @sdmprofile__BBcounter_68, i64 1 seq_cst, !dbg !429
  %166 = load double* %X, align 8, !dbg !429
  %add149 = fadd double %166, 1.000000e-03, !dbg !429
  store double %add149, double* %X, align 8, !dbg !429
  br label %for.cond141, !dbg !429

for.end150:                                       ; preds = %for.cond141
  %167 = atomicrmw add i64* @sdmprofile__BBcounter_69, i64 1 seq_cst, !dbg !430
  %call151 = call i32 (i8*, ...)* bitcast (i32 (...)* @puts to i32 (i8*, ...)*)(i8* getelementptr inbounds ([1 x i8]* @.str913, i32 0, i32 0)), !dbg !430
  store double 0.000000e+00, double* %X, align 8, !dbg !431
  br label %for.cond152, !dbg !431

for.cond152:                                      ; preds = %for.inc165, %for.end150
  %168 = atomicrmw add i64* @sdmprofile__BBcounter_70, i64 1 seq_cst, !dbg !433
  %169 = load double* %X, align 8, !dbg !433
  %call153 = call double @atan(double 1.000000e+00) #2, !dbg !436
  %mul154 = fmul double 4.000000e+00, %call153, !dbg !436
  %mul155 = fmul double 2.000000e+00, %mul154, !dbg !436
  %add156 = fadd double %mul155, 1.000000e-06, !dbg !436
  %cmp157 = fcmp ole double %169, %add156, !dbg !436
  br i1 %cmp157, label %for.body159, label %for.end170, !dbg !436

for.body159:                                      ; preds = %for.cond152
  %170 = atomicrmw add i64* @sdmprofile__BBcounter_71, i64 1 seq_cst, !dbg !437
  %171 = load double* %X, align 8, !dbg !437
  %172 = load double* %X, align 8, !dbg !437
  %mul160 = fmul double %172, 1.800000e+02, !dbg !437
  %call161 = call double @atan(double 1.000000e+00) #2, !dbg !438
  %mul162 = fmul double 4.000000e+00, %call161, !dbg !438
  %div163 = fdiv double %mul160, %mul162, !dbg !438
  %call164 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str1014, i32 0, i32 0), double %171, double %div163), !dbg !437
  br label %for.inc165, !dbg !437

for.inc165:                                       ; preds = %for.body159
  %173 = atomicrmw add i64* @sdmprofile__BBcounter_72, i64 1 seq_cst, !dbg !439
  %call166 = call double @atan(double 1.000000e+00) #2, !dbg !439
  %mul167 = fmul double 4.000000e+00, %call166, !dbg !439
  %div168 = fdiv double %mul167, 5.760000e+03, !dbg !439
  %174 = load double* %X, align 8, !dbg !439
  %add169 = fadd double %174, %div168, !dbg !439
  store double %add169, double* %X, align 8, !dbg !439
  br label %for.cond152, !dbg !439

for.end170:                                       ; preds = %for.cond152
  %175 = atomicrmw add i64* @sdmprofile__BBcounter_73, i64 1 seq_cst, !dbg !440
  ret i32 0, !dbg !440
}

; Function Attrs: nounwind uwtable
define double @rad2deg(double %rad, i32 %sdmprofile__threadnumber) #11 {
entry:
  %rad.addr = alloca double, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store double %rad, double* %rad.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_75, i64 1 seq_cst, !dbg !441
  call void @llvm.dbg.declare(metadata !{double* %rad.addr}, metadata !442), !dbg !441
  %1 = load double* %rad.addr, align 8, !dbg !443
  %mul = fmul double 1.800000e+02, %1, !dbg !443
  %call = call double @atan(double 1.000000e+00) #2, !dbg !444
  %mul1 = fmul double 4.000000e+00, %call, !dbg !444
  %div = fdiv double %mul, %mul1, !dbg !444
  ret double %div, !dbg !444
}

; Function Attrs: nounwind uwtable
define void @usqrt(i64 %x, %struct.int_sqrt.0* %q, i32 %sdmprofile__threadnumber) #11 {
entry:
  %x.addr = alloca i64, align 8
  %q.addr = alloca %struct.int_sqrt.0*, align 8
  %a = alloca i64, align 8
  %r = alloca i64, align 8
  %e = alloca i64, align 8
  %i = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i64 %x, i64* %x.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_76, i64 1 seq_cst, !dbg !445
  call void @llvm.dbg.declare(metadata !{i64* %x.addr}, metadata !454), !dbg !445
  store %struct.int_sqrt.0* %q, %struct.int_sqrt.0** %q.addr, align 8
  call void @llvm.dbg.declare(metadata !{%struct.int_sqrt.0** %q.addr}, metadata !455), !dbg !456
  call void @llvm.dbg.declare(metadata !{i64* %a}, metadata !457), !dbg !458
  store i64 0, i64* %a, align 8, !dbg !459
  call void @llvm.dbg.declare(metadata !{i64* %r}, metadata !460), !dbg !461
  store i64 0, i64* %r, align 8, !dbg !462
  call void @llvm.dbg.declare(metadata !{i64* %e}, metadata !463), !dbg !464
  store i64 0, i64* %e, align 8, !dbg !465
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !466), !dbg !467
  store i32 0, i32* %i, align 4, !dbg !468
  br label %for.cond, !dbg !468

for.cond:                                         ; preds = %for.inc, %entry
  %1 = atomicrmw add i64* @sdmprofile__BBcounter_77, i64 1 seq_cst, !dbg !470
  %2 = load i32* %i, align 4, !dbg !470
  %cmp = icmp slt i32 %2, 32, !dbg !470
  br i1 %cmp, label %for.body, label %for.end, !dbg !470

for.body:                                         ; preds = %for.cond
  %3 = atomicrmw add i64* @sdmprofile__BBcounter_78, i64 1 seq_cst, !dbg !473
  %4 = load i64* %r, align 8, !dbg !473
  %shl = shl i64 %4, 2, !dbg !473
  %5 = load i64* %x.addr, align 8, !dbg !473
  %and = and i64 %5, 3221225472, !dbg !473
  %shr = lshr i64 %and, 30, !dbg !473
  %add = add i64 %shl, %shr, !dbg !473
  store i64 %add, i64* %r, align 8, !dbg !473
  %6 = load i64* %x.addr, align 8, !dbg !475
  %shl1 = shl i64 %6, 2, !dbg !475
  store i64 %shl1, i64* %x.addr, align 8, !dbg !475
  %7 = load i64* %a, align 8, !dbg !476
  %shl2 = shl i64 %7, 1, !dbg !476
  store i64 %shl2, i64* %a, align 8, !dbg !476
  %8 = load i64* %a, align 8, !dbg !477
  %shl3 = shl i64 %8, 1, !dbg !477
  %add4 = add i64 %shl3, 1, !dbg !477
  store i64 %add4, i64* %e, align 8, !dbg !477
  %9 = load i64* %r, align 8, !dbg !478
  %10 = load i64* %e, align 8, !dbg !478
  %cmp5 = icmp uge i64 %9, %10, !dbg !478
  br i1 %cmp5, label %if.then, label %if.end, !dbg !478

if.then:                                          ; preds = %for.body
  %11 = atomicrmw add i64* @sdmprofile__BBcounter_79, i64 1 seq_cst, !dbg !480
  %12 = load i64* %e, align 8, !dbg !480
  %13 = load i64* %r, align 8, !dbg !480
  %sub = sub i64 %13, %12, !dbg !480
  store i64 %sub, i64* %r, align 8, !dbg !480
  %14 = load i64* %a, align 8, !dbg !482
  %inc = add i64 %14, 1, !dbg !482
  store i64 %inc, i64* %a, align 8, !dbg !482
  br label %if.end, !dbg !483

if.end:                                           ; preds = %if.then, %for.body
  %15 = atomicrmw add i64* @sdmprofile__BBcounter_80, i64 1 seq_cst, !dbg !484
  br label %for.inc, !dbg !484

for.inc:                                          ; preds = %if.end
  %16 = atomicrmw add i64* @sdmprofile__BBcounter_81, i64 1 seq_cst, !dbg !485
  %17 = load i32* %i, align 4, !dbg !485
  %inc6 = add nsw i32 %17, 1, !dbg !485
  store i32 %inc6, i32* %i, align 4, !dbg !485
  br label %for.cond, !dbg !485

for.end:                                          ; preds = %for.cond
  %18 = atomicrmw add i64* @sdmprofile__BBcounter_82, i64 1 seq_cst, !dbg !486
  %19 = load %struct.int_sqrt.0** %q.addr, align 8, !dbg !486
  %20 = bitcast %struct.int_sqrt.0* %19 to i8*, !dbg !486
  %21 = bitcast i64* %a to i8*, !dbg !486
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %20, i8* %21, i64 8, i32 4, i1 false), !dbg !486
  ret void, !dbg !487
}

; Function Attrs: nounwind uwtable
define i32 @main() #11 {
  %rtn = alloca i32, align 4
  %1 = load i32* @sdmprofile__MainthreadNumber, align 4
  store i32 1, i32* @sdmprofile__profileAction
  store i64 0, i64* @sdmprofile__heapallocationCount
  store i64 0, i64* @sdmprofile__stackallocationCount
  store i64 83, i64* @sdmprofile__BBcount
  store i32 0, i32* @sdmprofile__IncludeStackProfiling
  call void @sdmprofile__StartProfiling_Processes()
  %2 = call i32 @app__mainfunction__(i32 %1)
  store i32 %2, i32* %rtn, align 4
  call void @sdmprofile__PrintResultBeforeAddingBBcount()
  %3 = load i64* @sdmprofile__BBcounter_1
  call void @sdmprofile__BBHit(i64 1, i64 %3)
  %4 = load i64* @sdmprofile__BBcounter_2
  call void @sdmprofile__BBHit(i64 2, i64 %4)
  %5 = load i64* @sdmprofile__BBcounter_3
  call void @sdmprofile__BBHit(i64 3, i64 %5)
  %6 = load i64* @sdmprofile__BBcounter_4
  call void @sdmprofile__BBHit(i64 4, i64 %6)
  %7 = load i64* @sdmprofile__BBcounter_5
  call void @sdmprofile__BBHit(i64 5, i64 %7)
  %8 = load i64* @sdmprofile__BBcounter_6
  call void @sdmprofile__BBHit(i64 6, i64 %8)
  %9 = load i64* @sdmprofile__BBcounter_7
  call void @sdmprofile__BBHit(i64 7, i64 %9)
  %10 = load i64* @sdmprofile__BBcounter_8
  call void @sdmprofile__BBHit(i64 8, i64 %10)
  %11 = load i64* @sdmprofile__BBcounter_9
  call void @sdmprofile__BBHit(i64 9, i64 %11)
  %12 = load i64* @sdmprofile__BBcounter_10
  call void @sdmprofile__BBHit(i64 10, i64 %12)
  %13 = load i64* @sdmprofile__BBcounter_11
  call void @sdmprofile__BBHit(i64 11, i64 %13)
  %14 = load i64* @sdmprofile__BBcounter_12
  call void @sdmprofile__BBHit(i64 12, i64 %14)
  %15 = load i64* @sdmprofile__BBcounter_13
  call void @sdmprofile__BBHit(i64 13, i64 %15)
  %16 = load i64* @sdmprofile__BBcounter_14
  call void @sdmprofile__BBHit(i64 14, i64 %16)
  %17 = load i64* @sdmprofile__BBcounter_15
  call void @sdmprofile__BBHit(i64 15, i64 %17)
  %18 = load i64* @sdmprofile__BBcounter_16
  call void @sdmprofile__BBHit(i64 16, i64 %18)
  %19 = load i64* @sdmprofile__BBcounter_17
  call void @sdmprofile__BBHit(i64 17, i64 %19)
  %20 = load i64* @sdmprofile__BBcounter_18
  call void @sdmprofile__BBHit(i64 18, i64 %20)
  %21 = load i64* @sdmprofile__BBcounter_19
  call void @sdmprofile__BBHit(i64 19, i64 %21)
  %22 = load i64* @sdmprofile__BBcounter_20
  call void @sdmprofile__BBHit(i64 20, i64 %22)
  %23 = load i64* @sdmprofile__BBcounter_21
  call void @sdmprofile__BBHit(i64 21, i64 %23)
  %24 = load i64* @sdmprofile__BBcounter_22
  call void @sdmprofile__BBHit(i64 22, i64 %24)
  %25 = load i64* @sdmprofile__BBcounter_23
  call void @sdmprofile__BBHit(i64 23, i64 %25)
  %26 = load i64* @sdmprofile__BBcounter_24
  call void @sdmprofile__BBHit(i64 24, i64 %26)
  %27 = load i64* @sdmprofile__BBcounter_25
  call void @sdmprofile__BBHit(i64 25, i64 %27)
  %28 = load i64* @sdmprofile__BBcounter_26
  call void @sdmprofile__BBHit(i64 26, i64 %28)
  %29 = load i64* @sdmprofile__BBcounter_27
  call void @sdmprofile__BBHit(i64 27, i64 %29)
  %30 = load i64* @sdmprofile__BBcounter_28
  call void @sdmprofile__BBHit(i64 28, i64 %30)
  %31 = load i64* @sdmprofile__BBcounter_29
  call void @sdmprofile__BBHit(i64 29, i64 %31)
  %32 = load i64* @sdmprofile__BBcounter_30
  call void @sdmprofile__BBHit(i64 30, i64 %32)
  %33 = load i64* @sdmprofile__BBcounter_31
  call void @sdmprofile__BBHit(i64 31, i64 %33)
  %34 = load i64* @sdmprofile__BBcounter_32
  call void @sdmprofile__BBHit(i64 32, i64 %34)
  %35 = load i64* @sdmprofile__BBcounter_33
  call void @sdmprofile__BBHit(i64 33, i64 %35)
  %36 = load i64* @sdmprofile__BBcounter_34
  call void @sdmprofile__BBHit(i64 34, i64 %36)
  %37 = load i64* @sdmprofile__BBcounter_35
  call void @sdmprofile__BBHit(i64 35, i64 %37)
  %38 = load i64* @sdmprofile__BBcounter_36
  call void @sdmprofile__BBHit(i64 36, i64 %38)
  %39 = load i64* @sdmprofile__BBcounter_37
  call void @sdmprofile__BBHit(i64 37, i64 %39)
  %40 = load i64* @sdmprofile__BBcounter_38
  call void @sdmprofile__BBHit(i64 38, i64 %40)
  %41 = load i64* @sdmprofile__BBcounter_39
  call void @sdmprofile__BBHit(i64 39, i64 %41)
  %42 = load i64* @sdmprofile__BBcounter_40
  call void @sdmprofile__BBHit(i64 40, i64 %42)
  %43 = load i64* @sdmprofile__BBcounter_41
  call void @sdmprofile__BBHit(i64 41, i64 %43)
  %44 = load i64* @sdmprofile__BBcounter_42
  call void @sdmprofile__BBHit(i64 42, i64 %44)
  %45 = load i64* @sdmprofile__BBcounter_43
  call void @sdmprofile__BBHit(i64 43, i64 %45)
  %46 = load i64* @sdmprofile__BBcounter_44
  call void @sdmprofile__BBHit(i64 44, i64 %46)
  %47 = load i64* @sdmprofile__BBcounter_45
  call void @sdmprofile__BBHit(i64 45, i64 %47)
  %48 = load i64* @sdmprofile__BBcounter_46
  call void @sdmprofile__BBHit(i64 46, i64 %48)
  %49 = load i64* @sdmprofile__BBcounter_47
  call void @sdmprofile__BBHit(i64 47, i64 %49)
  %50 = load i64* @sdmprofile__BBcounter_48
  call void @sdmprofile__BBHit(i64 48, i64 %50)
  %51 = load i64* @sdmprofile__BBcounter_49
  call void @sdmprofile__BBHit(i64 49, i64 %51)
  %52 = load i64* @sdmprofile__BBcounter_50
  call void @sdmprofile__BBHit(i64 50, i64 %52)
  %53 = load i64* @sdmprofile__BBcounter_51
  call void @sdmprofile__BBHit(i64 51, i64 %53)
  %54 = load i64* @sdmprofile__BBcounter_52
  call void @sdmprofile__BBHit(i64 52, i64 %54)
  %55 = load i64* @sdmprofile__BBcounter_53
  call void @sdmprofile__BBHit(i64 53, i64 %55)
  %56 = load i64* @sdmprofile__BBcounter_54
  call void @sdmprofile__BBHit(i64 54, i64 %56)
  %57 = load i64* @sdmprofile__BBcounter_55
  call void @sdmprofile__BBHit(i64 55, i64 %57)
  %58 = load i64* @sdmprofile__BBcounter_56
  call void @sdmprofile__BBHit(i64 56, i64 %58)
  %59 = load i64* @sdmprofile__BBcounter_57
  call void @sdmprofile__BBHit(i64 57, i64 %59)
  %60 = load i64* @sdmprofile__BBcounter_58
  call void @sdmprofile__BBHit(i64 58, i64 %60)
  %61 = load i64* @sdmprofile__BBcounter_59
  call void @sdmprofile__BBHit(i64 59, i64 %61)
  %62 = load i64* @sdmprofile__BBcounter_60
  call void @sdmprofile__BBHit(i64 60, i64 %62)
  %63 = load i64* @sdmprofile__BBcounter_61
  call void @sdmprofile__BBHit(i64 61, i64 %63)
  %64 = load i64* @sdmprofile__BBcounter_62
  call void @sdmprofile__BBHit(i64 62, i64 %64)
  %65 = load i64* @sdmprofile__BBcounter_63
  call void @sdmprofile__BBHit(i64 63, i64 %65)
  %66 = load i64* @sdmprofile__BBcounter_64
  call void @sdmprofile__BBHit(i64 64, i64 %66)
  %67 = load i64* @sdmprofile__BBcounter_65
  call void @sdmprofile__BBHit(i64 65, i64 %67)
  %68 = load i64* @sdmprofile__BBcounter_66
  call void @sdmprofile__BBHit(i64 66, i64 %68)
  %69 = load i64* @sdmprofile__BBcounter_67
  call void @sdmprofile__BBHit(i64 67, i64 %69)
  %70 = load i64* @sdmprofile__BBcounter_68
  call void @sdmprofile__BBHit(i64 68, i64 %70)
  %71 = load i64* @sdmprofile__BBcounter_69
  call void @sdmprofile__BBHit(i64 69, i64 %71)
  %72 = load i64* @sdmprofile__BBcounter_70
  call void @sdmprofile__BBHit(i64 70, i64 %72)
  %73 = load i64* @sdmprofile__BBcounter_71
  call void @sdmprofile__BBHit(i64 71, i64 %73)
  %74 = load i64* @sdmprofile__BBcounter_72
  call void @sdmprofile__BBHit(i64 72, i64 %74)
  %75 = load i64* @sdmprofile__BBcounter_73
  call void @sdmprofile__BBHit(i64 73, i64 %75)
  %76 = load i64* @sdmprofile__BBcounter_74
  call void @sdmprofile__BBHit(i64 74, i64 %76)
  %77 = load i64* @sdmprofile__BBcounter_75
  call void @sdmprofile__BBHit(i64 75, i64 %77)
  %78 = load i64* @sdmprofile__BBcounter_76
  call void @sdmprofile__BBHit(i64 76, i64 %78)
  %79 = load i64* @sdmprofile__BBcounter_77
  call void @sdmprofile__BBHit(i64 77, i64 %79)
  %80 = load i64* @sdmprofile__BBcounter_78
  call void @sdmprofile__BBHit(i64 78, i64 %80)
  %81 = load i64* @sdmprofile__BBcounter_79
  call void @sdmprofile__BBHit(i64 79, i64 %81)
  %82 = load i64* @sdmprofile__BBcounter_80
  call void @sdmprofile__BBHit(i64 80, i64 %82)
  %83 = load i64* @sdmprofile__BBcounter_81
  call void @sdmprofile__BBHit(i64 81, i64 %83)
  %84 = load i64* @sdmprofile__BBcounter_82
  call void @sdmprofile__BBHit(i64 82, i64 %84)
  call void @sdmprofile__EndProfiling_Processes()
  %85 = load i32* %rtn, align 4
  ret i32 %85
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
attributes #14 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #16 = { cold }
attributes #17 = { nounwind readonly }
attributes #18 = { noreturn nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0}
!llvm.dbg.cu = !{!1, !10, !19, !28}
!llvm.module.flags = !{!43, !44}

!0 = metadata !{metadata !"clang version 3.5.1 (tags/RELEASE_351/final)"}
!1 = metadata !{i32 786449, metadata !2, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !4, metadata !3, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c] [DW_LANG_C99]
!2 = metadata !{metadata !"basicmath_large.c", metadata !"/home/sslee/work/regen/test/mibench/automotive/basicmath"}
!3 = metadata !{}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"main", metadata !"main", metadata !"", i32 6, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main_original, null, null, metadata !3, i32 7} ; [ DW_TAG_subprogram ] [line 6] [def] [scope 7] [main]
!6 = metadata !{i32 786473, metadata !2}          ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9}
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786449, metadata !11, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !12, metadata !3, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/rad2deg.c] [DW_LANG_C99]
!11 = metadata !{metadata !"rad2deg.c", metadata !"/home/sslee/work/regen/test/mibench/automotive/basicmath"}
!12 = metadata !{metadata !13, metadata !18}
!13 = metadata !{i32 786478, metadata !11, metadata !14, metadata !"rad2deg", metadata !"rad2deg", metadata !"", i32 13, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (double)* @rad2deg_original, null, null, metadata !3, i32 14} ; [ DW_TAG_subprogram ] [line 13] [def] [scope 14] [rad2deg]
!14 = metadata !{i32 786473, metadata !11}        ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/rad2deg.c]
!15 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{metadata !17, metadata !17}
!17 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!18 = metadata !{i32 786478, metadata !11, metadata !14, metadata !"deg2rad", metadata !"deg2rad", metadata !"", i32 18, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (double)* @deg2rad_original, null, null, metadata !3, i32 19} ; [ DW_TAG_subprogram ] [line 18] [def] [scope 19] [deg2rad]
!19 = metadata !{i32 786449, metadata !20, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !21, metadata !3, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/cubic.c] [DW_LANG_C99]
!20 = metadata !{metadata !"cubic.c", metadata !"/home/sslee/work/regen/test/mibench/automotive/basicmath"}
!21 = metadata !{metadata !22}
!22 = metadata !{i32 786478, metadata !20, metadata !23, metadata !"SolveCubic", metadata !"SolveCubic", metadata !"", i32 12, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (double, double, double, double, i32*, double*)* @SolveCubic_original, null, null, metadata !3, i32 18} ; [ DW_TAG_subprogram ] [line 12] [def] [scope 18] [SolveCubic]
!23 = metadata !{i32 786473, metadata !20}        ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/cubic.c]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{null, metadata !17, metadata !17, metadata !17, metadata !17, metadata !26, metadata !27}
!26 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!27 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!28 = metadata !{i32 786449, metadata !29, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !30, metadata !3, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/isqrt.c] [DW_LANG_C99]
!29 = metadata !{metadata !"isqrt.c", metadata !"/home/sslee/work/regen/test/mibench/automotive/basicmath"}
!30 = metadata !{metadata !31}
!31 = metadata !{i32 786478, metadata !29, metadata !32, metadata !"usqrt", metadata !"usqrt", metadata !"", i32 45, metadata !33, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i64, %struct.int_sqrt.0*)* @usqrt_original, null, null, metadata !3, i32 46} ; [ DW_TAG_subprogram ] [line 45] [def] [scope 46] [usqrt]
!32 = metadata !{i32 786473, metadata !29}        ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/isqrt.c]
!33 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !34, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!34 = metadata !{null, metadata !35, metadata !36}
!35 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!36 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !37} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int_sqrt]
!37 = metadata !{i32 786451, metadata !38, null, metadata !"int_sqrt", i32 67, i64 64, i64 32, i32 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [int_sqrt] [line 67, size 64, align 32, offset 0] [def] [from ]
!38 = metadata !{metadata !"./snipmath.h", metadata !"/home/sslee/work/regen/test/mibench/automotive/basicmath"}
!39 = metadata !{metadata !40, metadata !42}
!40 = metadata !{i32 786445, metadata !38, metadata !37, metadata !"sqrt", i32 68, i64 32, i64 32, i64 0, i32 0, metadata !41} ; [ DW_TAG_member ] [sqrt] [line 68, size 32, align 32, offset 0] [from unsigned int]
!41 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!42 = metadata !{i32 786445, metadata !38, metadata !37, metadata !"frac", i32 69, i64 32, i64 32, i64 32, i32 0, metadata !41} ; [ DW_TAG_member ] [frac] [line 69, size 32, align 32, offset 32] [from unsigned int]
!43 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!44 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!45 = metadata !{metadata !46, metadata !46, i64 0}
!46 = metadata !{metadata !"any pointer", metadata !47, i64 0}
!47 = metadata !{metadata !"omnipotent char", metadata !48, i64 0}
!48 = metadata !{metadata !"Simple C/C++ TBAA"}
!49 = metadata !{metadata !50, metadata !50, i64 0}
!50 = metadata !{metadata !"int", metadata !47, i64 0}
!51 = metadata !{metadata !52, metadata !46, i64 0}
!52 = metadata !{metadata !"_ZTS18HeapAllocationMeta", metadata !46, i64 0, metadata !46, i64 8, metadata !53, i64 16, metadata !50, i64 24, metadata !53, i64 32}
!53 = metadata !{metadata !"long", metadata !47, i64 0}
!54 = metadata !{metadata !55, metadata !53, i64 0}
!55 = metadata !{metadata !"_ZTS6GVMeta", metadata !53, i64 0, metadata !53, i64 8, metadata !53, i64 16, metadata !46, i64 24, metadata !50, i64 32, metadata !46, i64 40, metadata !46, i64 48, metadata !46, i64 56, metadata !46, i64 64, metadata !46, i64 72, metadata !53, i64 80}
!56 = metadata !{metadata !55, metadata !46, i64 24}
!57 = metadata !{metadata !55, metadata !50, i64 32}
!58 = metadata !{metadata !59, metadata !46, i64 0}
!59 = metadata !{metadata !"_ZTS32sdmprofile__Allocated_Stack_item", metadata !46, i64 0, metadata !53, i64 8, metadata !46, i64 16}
!60 = metadata !{metadata !59, metadata !46, i64 16}
!61 = metadata !{metadata !61, metadata !62, metadata !63}
!62 = metadata !{metadata !"llvm.loop.vectorize.width", i32 1}
!63 = metadata !{metadata !"llvm.loop.interleave.count", i32 1}
!64 = metadata !{metadata !65, metadata !65, i64 0}
!65 = metadata !{metadata !"double", metadata !47, i64 0}
!66 = metadata !{metadata !67, metadata !50, i64 0}
!67 = metadata !{metadata !"_ZTS6Thread", metadata !50, i64 0, metadata !53, i64 8, metadata !65, i64 16, metadata !65, i64 24, metadata !46, i64 32, metadata !46, i64 40, metadata !53, i64 48, metadata !53, i64 56, metadata !53, i64 64, metadata !53, i64 72, metadata !53, i64 80, metadata !53, i64 88, metadata !53, i64 96, metadata !53, i64 104, metadata !53, i64 112, metadata !53, i64 120, metadata !53, i64 128, metadata !47, i64 136, metadata !47, i64 200, metadata !46, i64 264, metadata !46, i64 272}
!68 = metadata !{metadata !67, metadata !53, i64 8}
!69 = metadata !{metadata !67, metadata !65, i64 16}
!70 = metadata !{metadata !67, metadata !65, i64 24}
!71 = metadata !{metadata !67, metadata !46, i64 264}
!72 = metadata !{metadata !73, metadata !46, i64 0}
!73 = metadata !{metadata !"_ZTS11Cache2_Item", metadata !46, i64 0, metadata !46, i64 8}
!74 = metadata !{metadata !73, metadata !46, i64 8}
!75 = metadata !{metadata !67, metadata !46, i64 272}
!76 = metadata !{metadata !77, metadata !46, i64 0}
!77 = metadata !{metadata !"_ZTS12GVCache_Item", metadata !46, i64 0, metadata !46, i64 8}
!78 = metadata !{metadata !77, metadata !46, i64 8}
!79 = metadata !{metadata !67, metadata !46, i64 32}
!80 = metadata !{metadata !55, metadata !46, i64 40}
!81 = metadata !{metadata !55, metadata !46, i64 48}
!82 = metadata !{metadata !55, metadata !46, i64 56}
!83 = metadata !{metadata !55, metadata !46, i64 64}
!84 = metadata !{metadata !55, metadata !46, i64 72}
!85 = metadata !{metadata !55, metadata !53, i64 80}
!86 = metadata !{metadata !87, metadata !53, i64 0}
!87 = metadata !{metadata !"_ZTS23sdmprofile__struct_STrw", metadata !53, i64 0, metadata !53, i64 8, metadata !53, i64 16, metadata !50, i64 24, metadata !46, i64 32, metadata !46, i64 40, metadata !46, i64 48}
!88 = metadata !{metadata !87, metadata !50, i64 24}
!89 = metadata !{metadata !87, metadata !46, i64 32}
!90 = metadata !{metadata !87, metadata !46, i64 40}
!91 = metadata !{metadata !87, metadata !46, i64 48}
!92 = metadata !{metadata !93, metadata !50, i64 0}
!93 = metadata !{metadata !"_ZTS6HPMeta", metadata !50, i64 0, metadata !53, i64 8, metadata !53, i64 16, metadata !46, i64 24, metadata !46, i64 32, metadata !46, i64 40, metadata !53, i64 48, metadata !46, i64 56, metadata !53, i64 64, metadata !53, i64 72, metadata !53, i64 80, metadata !53, i64 88}
!94 = metadata !{metadata !93, metadata !46, i64 24}
!95 = metadata !{metadata !93, metadata !46, i64 32}
!96 = metadata !{metadata !93, metadata !46, i64 40}
!97 = metadata !{metadata !93, metadata !53, i64 48}
!98 = metadata !{metadata !93, metadata !46, i64 56}
!99 = metadata !{metadata !55, metadata !53, i64 8}
!100 = metadata !{metadata !55, metadata !53, i64 16}
!101 = metadata !{metadata !102, metadata !46, i64 0}
!102 = metadata !{metadata !"_ZTSSt14_Fwd_list_baseIP6GVMetaSaIS1_EE", metadata !103, i64 0}
!103 = metadata !{metadata !"_ZTSNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_Fwd_list_implE", metadata !104, i64 0}
!104 = metadata !{metadata !"_ZTSSt19_Fwd_list_node_base", metadata !46, i64 0}
!105 = metadata !{metadata !106, metadata !46, i64 0}
!106 = metadata !{metadata !"_ZTSSt18_Fwd_list_iteratorIP6GVMetaE", metadata !46, i64 0}
!107 = metadata !{metadata !104, metadata !46, i64 0}
!108 = metadata !{metadata !87, metadata !53, i64 8}
!109 = metadata !{metadata !87, metadata !53, i64 16}
!110 = metadata !{metadata !53, metadata !53, i64 0}
!111 = metadata !{metadata !112, metadata !53, i64 0}
!112 = metadata !{metadata !"_ZTS8timespec", metadata !53, i64 0, metadata !53, i64 8}
!113 = metadata !{metadata !112, metadata !53, i64 8}
!114 = metadata !{metadata !115, metadata !53, i64 0}
!115 = metadata !{metadata !"_ZTS7timeval", metadata !53, i64 0, metadata !53, i64 8}
!116 = metadata !{metadata !115, metadata !53, i64 8}
!117 = metadata !{metadata !67, metadata !53, i64 48}
!118 = metadata !{metadata !52, metadata !46, i64 8}
!119 = metadata !{metadata !52, metadata !53, i64 16}
!120 = metadata !{metadata !52, metadata !50, i64 24}
!121 = metadata !{metadata !67, metadata !53, i64 80}
!122 = metadata !{metadata !67, metadata !53, i64 64}
!123 = metadata !{metadata !93, metadata !53, i64 64}
!124 = metadata !{metadata !93, metadata !53, i64 72}
!125 = metadata !{metadata !93, metadata !53, i64 80}
!126 = metadata !{metadata !67, metadata !53, i64 56}
!127 = metadata !{metadata !128, metadata !46, i64 0}
!128 = metadata !{metadata !"_ZTSSt10_List_baseIP18HeapAllocationMetaSaIS1_EE", metadata !129, i64 0}
!129 = metadata !{metadata !"_ZTSNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE10_List_implE", metadata !130, i64 0}
!130 = metadata !{metadata !"_ZTSNSt8__detail15_List_node_baseE", metadata !46, i64 0, metadata !46, i64 8}
!131 = metadata !{metadata !132, metadata !46, i64 0}
!132 = metadata !{metadata !"_ZTSSt14_List_iteratorIP18HeapAllocationMetaE", metadata !46, i64 0}
!133 = metadata !{metadata !130, metadata !46, i64 0}
!134 = metadata !{metadata !67, metadata !53, i64 96}
!135 = metadata !{metadata !67, metadata !53, i64 112}
!136 = metadata !{metadata !67, metadata !53, i64 128}
!137 = metadata !{metadata !67, metadata !53, i64 120}
!138 = metadata !{metadata !67, metadata !53, i64 104}
!139 = metadata !{metadata !93, metadata !53, i64 8}
!140 = metadata !{metadata !93, metadata !53, i64 16}
!141 = metadata !{metadata !59, metadata !53, i64 8}
!142 = metadata !{metadata !47, metadata !47, i64 0}
!143 = metadata !{metadata !144, metadata !46, i64 0}
!144 = metadata !{metadata !"_ZTSN9__gnu_cxx17__normal_iteratorIPcSsEE", metadata !46, i64 0}
!145 = metadata !{metadata !146, metadata !46, i64 0}
!146 = metadata !{metadata !"_ZTSSs", metadata !147, i64 0}
!147 = metadata !{metadata !"_ZTSNSs12_Alloc_hiderE", metadata !46, i64 0}
!148 = metadata !{metadata !149, metadata !53, i64 0}
!149 = metadata !{metadata !"_ZTSNSs9_Rep_baseE", metadata !53, i64 0, metadata !53, i64 8, metadata !50, i64 16}
!150 = metadata !{metadata !149, metadata !50, i64 16}
!151 = metadata !{metadata !152, metadata !46, i64 16}
!152 = metadata !{metadata !"_ZTSSt10_List_nodeIP18HeapAllocationMetaE", metadata !46, i64 16}
!153 = metadata !{metadata !154, metadata !46, i64 0}
!154 = metadata !{metadata !"_ZTSSt24_Fwd_list_const_iteratorIP6GVMetaE", metadata !46, i64 0}
!155 = metadata !{metadata !128, metadata !46, i64 8}
!156 = metadata !{metadata !"branch_weights", i32 64, i32 4}
!157 = metadata !{i32 12, i32 25, metadata !22, null}
!158 = metadata !{i32 786689, metadata !22, metadata !"a", metadata !23, i32 16777228, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 12]
!159 = metadata !{i32 786689, metadata !22, metadata !"b", metadata !23, i32 33554445, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 13]
!160 = metadata !{i32 13, i32 25, metadata !22, null}
!161 = metadata !{i32 786689, metadata !22, metadata !"c", metadata !23, i32 50331662, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 14]
!162 = metadata !{i32 14, i32 25, metadata !22, null}
!163 = metadata !{i32 786689, metadata !22, metadata !"d", metadata !23, i32 67108879, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d] [line 15]
!164 = metadata !{i32 15, i32 25, metadata !22, null}
!165 = metadata !{i32 786689, metadata !22, metadata !"solutions", metadata !23, i32 83886096, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [solutions] [line 16]
!166 = metadata !{i32 16, i32 25, metadata !22, null}
!167 = metadata !{i32 786689, metadata !22, metadata !"x", metadata !23, i32 100663313, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 17]
!168 = metadata !{i32 17, i32 25, metadata !22, null}
!169 = metadata !{i32 786688, metadata !22, metadata !"a1", metadata !23, i32 19, metadata !170, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a1] [line 19]
!170 = metadata !{i32 786468, null, null, metadata !"long double", i32 0, i64 128, i64 128, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [long double] [line 0, size 128, align 128, offset 0, enc DW_ATE_float]
!171 = metadata !{i32 19, i32 22, metadata !22, null}
!172 = metadata !{i32 19, i32 7, metadata !22, null}
!173 = metadata !{i32 786688, metadata !22, metadata !"a2", metadata !23, i32 19, metadata !170, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a2] [line 19]
!174 = metadata !{i32 19, i32 32, metadata !22, null}
!175 = metadata !{i32 786688, metadata !22, metadata !"a3", metadata !23, i32 19, metadata !170, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a3] [line 19]
!176 = metadata !{i32 19, i32 42, metadata !22, null}
!177 = metadata !{i32 786688, metadata !22, metadata !"Q", metadata !23, i32 20, metadata !170, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Q] [line 20]
!178 = metadata !{i32 20, i32 22, metadata !22, null}
!179 = metadata !{i32 20, i32 7, metadata !22, null}
!180 = metadata !{i32 786688, metadata !22, metadata !"R", metadata !23, i32 21, metadata !170, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [R] [line 21]
!181 = metadata !{i32 21, i32 19, metadata !22, null}
!182 = metadata !{i32 21, i32 7, metadata !22, null}
!183 = metadata !{i32 786688, metadata !22, metadata !"R2_Q3", metadata !23, i32 22, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [R2_Q3] [line 22]
!184 = metadata !{i32 22, i32 17, metadata !22, null}
!185 = metadata !{i32 22, i32 7, metadata !22, null}
!186 = metadata !{i32 786688, metadata !22, metadata !"theta", metadata !23, i32 24, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [theta] [line 24]
!187 = metadata !{i32 24, i32 17, metadata !22, null}
!188 = metadata !{i32 26, i32 11, metadata !189, null}
!189 = metadata !{i32 786443, metadata !20, metadata !22, i32 26, i32 11, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/cubic.c]
!190 = metadata !{i32 28, i32 13, metadata !191, null}
!191 = metadata !{i32 786443, metadata !20, metadata !189, i32 27, i32 7, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/cubic.c]
!192 = metadata !{i32 29, i32 21, metadata !191, null}
!193 = metadata !{i32 29, i32 28, metadata !191, null}
!194 = metadata !{i32 30, i32 25, metadata !191, null}
!195 = metadata !{i32 30, i32 33, metadata !191, null}
!196 = metadata !{i32 31, i32 25, metadata !191, null}
!197 = metadata !{i32 31, i32 33, metadata !191, null}
!198 = metadata !{i32 31, i32 48, metadata !191, null}
!199 = metadata !{i32 32, i32 25, metadata !191, null}
!200 = metadata !{i32 32, i32 33, metadata !191, null}
!201 = metadata !{i32 32, i32 48, metadata !191, null}
!202 = metadata !{i32 33, i32 7, metadata !191, null}
!203 = metadata !{i32 36, i32 13, metadata !204, null}
!204 = metadata !{i32 786443, metadata !20, metadata !189, i32 35, i32 7, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/cubic.c]
!205 = metadata !{i32 37, i32 24, metadata !204, null}
!206 = metadata !{i32 37, i32 36, metadata !204, null}
!207 = metadata !{i32 37, i32 20, metadata !204, null}
!208 = metadata !{i32 38, i32 13, metadata !204, null}
!209 = metadata !{i32 39, i32 13, metadata !204, null}
!210 = metadata !{i32 40, i32 13, metadata !204, null}
!211 = metadata !{i32 42, i32 1, metadata !22, null}
!212 = metadata !{i32 18, i32 23, metadata !18, null}
!213 = metadata !{i32 786689, metadata !18, metadata !"deg", metadata !14, i32 16777234, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [deg] [line 18]
!214 = metadata !{i32 20, i32 15, metadata !18, null}
!215 = metadata !{i32 8, i32 11, metadata !5, null} ; [ DW_TAG_imported_declaration ]
!216 = metadata !{i32 786688, metadata !5, metadata !"a1", metadata !6, i32 8, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a1] [line 8]
!217 = metadata !{i32 8, i32 3, metadata !5, null} ; [ DW_TAG_imported_declaration ]
!218 = metadata !{i32 786688, metadata !5, metadata !"b1", metadata !6, i32 8, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b1] [line 8]
!219 = metadata !{i32 8, i32 21, metadata !5, null} ; [ DW_TAG_imported_declaration ]
!220 = metadata !{i32 786688, metadata !5, metadata !"c1", metadata !6, i32 8, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c1] [line 8]
!221 = metadata !{i32 8, i32 33, metadata !5, null} ; [ DW_TAG_imported_declaration ]
!222 = metadata !{i32 786688, metadata !5, metadata !"d1", metadata !6, i32 8, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [d1] [line 8]
!223 = metadata !{i32 8, i32 44, metadata !5, null} ; [ DW_TAG_imported_declaration ]
!224 = metadata !{i32 786688, metadata !5, metadata !"x", metadata !6, i32 9, metadata !225, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 9]
!225 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !17, metadata !226, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from double]
!226 = metadata !{metadata !227}
!227 = metadata !{i32 786465, i64 0, i64 3}       ; [ DW_TAG_subrange_type ] [0, 2]
!228 = metadata !{i32 9, i32 11, metadata !5, null}
!229 = metadata !{i32 786688, metadata !5, metadata !"X", metadata !6, i32 10, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X] [line 10]
!230 = metadata !{i32 10, i32 10, metadata !5, null}
!231 = metadata !{i32 786688, metadata !5, metadata !"solutions", metadata !6, i32 11, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [solutions] [line 11]
!232 = metadata !{i32 11, i32 11, metadata !5, null}
!233 = metadata !{i32 786688, metadata !5, metadata !"i", metadata !6, i32 12, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 12]
!234 = metadata !{i32 12, i32 7, metadata !5, null}
!235 = metadata !{i32 786688, metadata !5, metadata !"l", metadata !6, i32 13, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 13]
!236 = metadata !{i32 13, i32 17, metadata !5, null}
!237 = metadata !{i32 13, i32 3, metadata !5, null}
!238 = metadata !{i32 786688, metadata !5, metadata !"q", metadata !6, i32 14, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [q] [line 14]
!239 = metadata !{i32 786451, metadata !38, null, metadata !"int_sqrt", i32 67, i64 64, i64 32, i32 0, i32 0, null, metadata !240, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [int_sqrt] [line 67, size 64, align 32, offset 0] [def] [from ]
!240 = metadata !{metadata !241, metadata !242}
!241 = metadata !{i32 786445, metadata !38, metadata !239, metadata !"sqrt", i32 68, i64 32, i64 32, i64 0, i32 0, metadata !41} ; [ DW_TAG_member ] [sqrt] [line 68, size 32, align 32, offset 0] [from unsigned int]
!242 = metadata !{i32 786445, metadata !38, metadata !239, metadata !"frac", i32 69, i64 32, i64 32, i64 32, i32 0, metadata !41} ; [ DW_TAG_member ] [frac] [line 69, size 32, align 32, offset 32] [from unsigned int]
!243 = metadata !{i32 14, i32 19, metadata !5, null}
!244 = metadata !{i32 786688, metadata !5, metadata !"n", metadata !6, i32 15, metadata !245, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 15]
!245 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!246 = metadata !{i32 15, i32 8, metadata !5, null}
!247 = metadata !{i32 15, i32 3, metadata !5, null}
!248 = metadata !{i32 18, i32 3, metadata !5, null}
!249 = metadata !{i32 20, i32 3, metadata !5, null}
!250 = metadata !{i32 21, i32 3, metadata !5, null}
!251 = metadata !{i32 22, i32 7, metadata !252, null}
!252 = metadata !{i32 786443, metadata !2, metadata !5, i32 22, i32 3, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!253 = metadata !{i32 22, i32 7, metadata !254, null}
!254 = metadata !{i32 786443, metadata !2, metadata !255, i32 22, i32 7, i32 2, i32 24} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!255 = metadata !{i32 786443, metadata !2, metadata !252, i32 22, i32 7, i32 1, i32 23} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!256 = metadata !{i32 23, i32 5, metadata !252, null}
!257 = metadata !{i32 22, i32 23, metadata !252, null}
!258 = metadata !{i32 24, i32 3, metadata !5, null}
!259 = metadata !{i32 26, i32 3, metadata !5, null}
!260 = metadata !{i32 26, i32 13, metadata !5, null}
!261 = metadata !{i32 26, i32 24, metadata !5, null}
!262 = metadata !{i32 26, i32 35, metadata !5, null}
!263 = metadata !{i32 28, i32 3, metadata !5, null}
!264 = metadata !{i32 29, i32 3, metadata !5, null}
!265 = metadata !{i32 30, i32 7, metadata !266, null}
!266 = metadata !{i32 786443, metadata !2, metadata !5, i32 30, i32 3, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!267 = metadata !{i32 30, i32 7, metadata !268, null}
!268 = metadata !{i32 786443, metadata !2, metadata !269, i32 30, i32 7, i32 2, i32 26} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!269 = metadata !{i32 786443, metadata !2, metadata !266, i32 30, i32 7, i32 1, i32 25} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!270 = metadata !{i32 31, i32 5, metadata !266, null}
!271 = metadata !{i32 30, i32 23, metadata !266, null}
!272 = metadata !{i32 32, i32 3, metadata !5, null}
!273 = metadata !{i32 34, i32 3, metadata !5, null}
!274 = metadata !{i32 34, i32 13, metadata !5, null}
!275 = metadata !{i32 34, i32 24, metadata !5, null}
!276 = metadata !{i32 34, i32 35, metadata !5, null}
!277 = metadata !{i32 35, i32 3, metadata !5, null}
!278 = metadata !{i32 36, i32 3, metadata !5, null}
!279 = metadata !{i32 37, i32 7, metadata !280, null}
!280 = metadata !{i32 786443, metadata !2, metadata !5, i32 37, i32 3, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!281 = metadata !{i32 37, i32 7, metadata !282, null}
!282 = metadata !{i32 786443, metadata !2, metadata !283, i32 37, i32 7, i32 2, i32 28} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!283 = metadata !{i32 786443, metadata !2, metadata !280, i32 37, i32 7, i32 1, i32 27} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!284 = metadata !{i32 38, i32 5, metadata !280, null}
!285 = metadata !{i32 37, i32 23, metadata !280, null}
!286 = metadata !{i32 39, i32 3, metadata !5, null}
!287 = metadata !{i32 41, i32 3, metadata !5, null}
!288 = metadata !{i32 41, i32 13, metadata !5, null}
!289 = metadata !{i32 41, i32 25, metadata !5, null}
!290 = metadata !{i32 41, i32 35, metadata !5, null}
!291 = metadata !{i32 42, i32 3, metadata !5, null}
!292 = metadata !{i32 43, i32 3, metadata !5, null}
!293 = metadata !{i32 44, i32 7, metadata !294, null}
!294 = metadata !{i32 786443, metadata !2, metadata !5, i32 44, i32 3, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!295 = metadata !{i32 44, i32 7, metadata !296, null}
!296 = metadata !{i32 786443, metadata !2, metadata !297, i32 44, i32 7, i32 2, i32 30} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!297 = metadata !{i32 786443, metadata !2, metadata !294, i32 44, i32 7, i32 1, i32 29} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!298 = metadata !{i32 45, i32 5, metadata !294, null}
!299 = metadata !{i32 44, i32 23, metadata !294, null}
!300 = metadata !{i32 46, i32 3, metadata !5, null}
!301 = metadata !{i32 48, i32 3, metadata !5, null}
!302 = metadata !{i32 48, i32 13, metadata !5, null}
!303 = metadata !{i32 48, i32 25, metadata !5, null}
!304 = metadata !{i32 48, i32 35, metadata !5, null}
!305 = metadata !{i32 49, i32 3, metadata !5, null}
!306 = metadata !{i32 50, i32 3, metadata !5, null}
!307 = metadata !{i32 51, i32 7, metadata !308, null}
!308 = metadata !{i32 786443, metadata !2, metadata !5, i32 51, i32 3, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!309 = metadata !{i32 51, i32 7, metadata !310, null}
!310 = metadata !{i32 786443, metadata !2, metadata !311, i32 51, i32 7, i32 2, i32 32} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!311 = metadata !{i32 786443, metadata !2, metadata !308, i32 51, i32 7, i32 1, i32 31} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!312 = metadata !{i32 52, i32 5, metadata !308, null}
!313 = metadata !{i32 51, i32 23, metadata !308, null}
!314 = metadata !{i32 53, i32 3, metadata !5, null}
!315 = metadata !{i32 55, i32 3, metadata !5, null}
!316 = metadata !{i32 55, i32 14, metadata !5, null}
!317 = metadata !{i32 55, i32 27, metadata !5, null}
!318 = metadata !{i32 55, i32 37, metadata !5, null}
!319 = metadata !{i32 56, i32 3, metadata !5, null}
!320 = metadata !{i32 57, i32 3, metadata !5, null}
!321 = metadata !{i32 58, i32 7, metadata !322, null} ; [ DW_TAG_imported_module ]
!322 = metadata !{i32 786443, metadata !2, metadata !5, i32 58, i32 3, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!323 = metadata !{i32 58, i32 7, metadata !324, null} ; [ DW_TAG_imported_module ]
!324 = metadata !{i32 786443, metadata !2, metadata !325, i32 58, i32 7, i32 2, i32 34} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!325 = metadata !{i32 786443, metadata !2, metadata !322, i32 58, i32 7, i32 1, i32 33} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!326 = metadata !{i32 59, i32 5, metadata !322, null}
!327 = metadata !{i32 58, i32 23, metadata !322, null} ; [ DW_TAG_imported_module ]
!328 = metadata !{i32 60, i32 3, metadata !5, null}
!329 = metadata !{i32 62, i32 3, metadata !5, null}
!330 = metadata !{i32 62, i32 14, metadata !5, null}
!331 = metadata !{i32 62, i32 25, metadata !5, null}
!332 = metadata !{i32 62, i32 35, metadata !5, null}
!333 = metadata !{i32 63, i32 3, metadata !5, null}
!334 = metadata !{i32 64, i32 3, metadata !5, null}
!335 = metadata !{i32 65, i32 7, metadata !336, null}
!336 = metadata !{i32 786443, metadata !2, metadata !5, i32 65, i32 3, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!337 = metadata !{i32 65, i32 7, metadata !338, null}
!338 = metadata !{i32 786443, metadata !2, metadata !339, i32 65, i32 7, i32 2, i32 36} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!339 = metadata !{i32 786443, metadata !2, metadata !336, i32 65, i32 7, i32 1, i32 35} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!340 = metadata !{i32 66, i32 5, metadata !336, null}
!341 = metadata !{i32 65, i32 23, metadata !336, null}
!342 = metadata !{i32 67, i32 3, metadata !5, null}
!343 = metadata !{i32 69, i32 3, metadata !5, null}
!344 = metadata !{i32 69, i32 15, metadata !5, null}
!345 = metadata !{i32 69, i32 26, metadata !5, null}
!346 = metadata !{i32 69, i32 36, metadata !5, null}
!347 = metadata !{i32 70, i32 3, metadata !5, null}
!348 = metadata !{i32 71, i32 3, metadata !5, null}
!349 = metadata !{i32 72, i32 7, metadata !350, null}
!350 = metadata !{i32 786443, metadata !2, metadata !5, i32 72, i32 3, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!351 = metadata !{i32 72, i32 7, metadata !352, null}
!352 = metadata !{i32 786443, metadata !2, metadata !353, i32 72, i32 7, i32 2, i32 38} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!353 = metadata !{i32 786443, metadata !2, metadata !350, i32 72, i32 7, i32 1, i32 37} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!354 = metadata !{i32 73, i32 5, metadata !350, null}
!355 = metadata !{i32 72, i32 23, metadata !350, null}
!356 = metadata !{i32 74, i32 3, metadata !5, null}
!357 = metadata !{i32 77, i32 7, metadata !358, null}
!358 = metadata !{i32 786443, metadata !2, metadata !5, i32 77, i32 3, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!359 = metadata !{i32 77, i32 7, metadata !360, null}
!360 = metadata !{i32 786443, metadata !2, metadata !361, i32 77, i32 7, i32 2, i32 48} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!361 = metadata !{i32 786443, metadata !2, metadata !358, i32 77, i32 7, i32 1, i32 39} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!362 = metadata !{i32 78, i32 9, metadata !363, null}
!363 = metadata !{i32 786443, metadata !2, metadata !364, i32 78, i32 5, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!364 = metadata !{i32 786443, metadata !2, metadata !358, i32 77, i32 25, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!365 = metadata !{i32 78, i32 9, metadata !366, null}
!366 = metadata !{i32 786443, metadata !2, metadata !367, i32 78, i32 9, i32 2, i32 47} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!367 = metadata !{i32 786443, metadata !2, metadata !363, i32 78, i32 9, i32 1, i32 40} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!368 = metadata !{i32 79, i32 11, metadata !369, null}
!369 = metadata !{i32 786443, metadata !2, metadata !370, i32 79, i32 7, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!370 = metadata !{i32 786443, metadata !2, metadata !363, i32 78, i32 29, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!371 = metadata !{i32 79, i32 11, metadata !372, null}
!372 = metadata !{i32 786443, metadata !2, metadata !373, i32 79, i32 11, i32 2, i32 46} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!373 = metadata !{i32 786443, metadata !2, metadata !369, i32 79, i32 11, i32 1, i32 41} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!374 = metadata !{i32 80, i32 9, metadata !375, null}
!375 = metadata !{i32 786443, metadata !2, metadata !376, i32 80, i32 5, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!376 = metadata !{i32 786443, metadata !2, metadata !369, i32 79, i32 32, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!377 = metadata !{i32 80, i32 9, metadata !378, null}
!378 = metadata !{i32 786443, metadata !2, metadata !379, i32 80, i32 9, i32 2, i32 45} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!379 = metadata !{i32 786443, metadata !2, metadata !375, i32 80, i32 9, i32 1, i32 42} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!380 = metadata !{i32 81, i32 3, metadata !381, null}
!381 = metadata !{i32 786443, metadata !2, metadata !375, i32 80, i32 31, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!382 = metadata !{i32 82, i32 3, metadata !381, null}
!383 = metadata !{i32 83, i32 7, metadata !384, null}
!384 = metadata !{i32 786443, metadata !2, metadata !381, i32 83, i32 3, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!385 = metadata !{i32 83, i32 7, metadata !386, null}
!386 = metadata !{i32 786443, metadata !2, metadata !387, i32 83, i32 7, i32 2, i32 44} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!387 = metadata !{i32 786443, metadata !2, metadata !384, i32 83, i32 7, i32 1, i32 43} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!388 = metadata !{i32 84, i32 5, metadata !384, null}
!389 = metadata !{i32 83, i32 23, metadata !384, null}
!390 = metadata !{i32 85, i32 3, metadata !381, null}
!391 = metadata !{i32 86, i32 5, metadata !381, null}
!392 = metadata !{i32 80, i32 21, metadata !375, null}
!393 = metadata !{i32 87, i32 7, metadata !376, null}
!394 = metadata !{i32 79, i32 22, metadata !369, null}
!395 = metadata !{i32 88, i32 5, metadata !370, null}
!396 = metadata !{i32 78, i32 20, metadata !363, null}
!397 = metadata !{i32 89, i32 3, metadata !364, null}
!398 = metadata !{i32 77, i32 18, metadata !358, null}
!399 = metadata !{i32 92, i32 3, metadata !5, null}
!400 = metadata !{i32 94, i32 8, metadata !401, null}
!401 = metadata !{i32 786443, metadata !2, metadata !5, i32 94, i32 3, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!402 = metadata !{i32 94, i32 8, metadata !403, null}
!403 = metadata !{i32 786443, metadata !2, metadata !404, i32 94, i32 8, i32 2, i32 50} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!404 = metadata !{i32 786443, metadata !2, metadata !401, i32 94, i32 8, i32 1, i32 49} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!405 = metadata !{i32 96, i32 7, metadata !406, null}
!406 = metadata !{i32 786443, metadata !2, metadata !401, i32 95, i32 5, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!407 = metadata !{i32 99, i32 6, metadata !406, null}
!408 = metadata !{i32 101, i32 5, metadata !406, null}
!409 = metadata !{i32 94, i32 27, metadata !401, null}
!410 = metadata !{i32 102, i32 3, metadata !5, null}
!411 = metadata !{i32 103, i32 8, metadata !412, null}
!412 = metadata !{i32 786443, metadata !2, metadata !5, i32 103, i32 3, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!413 = metadata !{i32 103, i32 8, metadata !414, null}
!414 = metadata !{i32 786443, metadata !2, metadata !415, i32 103, i32 8, i32 2, i32 52} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!415 = metadata !{i32 786443, metadata !2, metadata !412, i32 103, i32 8, i32 1, i32 51} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!416 = metadata !{i32 105, i32 3, metadata !417, null}
!417 = metadata !{i32 786443, metadata !2, metadata !412, i32 104, i32 5, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!418 = metadata !{i32 107, i32 3, metadata !417, null}
!419 = metadata !{i32 108, i32 5, metadata !417, null}
!420 = metadata !{i32 103, i32 42, metadata !412, null}
!421 = metadata !{i32 111, i32 3, metadata !5, null}
!422 = metadata !{i32 114, i32 8, metadata !423, null}
!423 = metadata !{i32 786443, metadata !2, metadata !5, i32 114, i32 3, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!424 = metadata !{i32 114, i32 8, metadata !425, null}
!425 = metadata !{i32 786443, metadata !2, metadata !426, i32 114, i32 8, i32 2, i32 54} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!426 = metadata !{i32 786443, metadata !2, metadata !423, i32 114, i32 8, i32 1, i32 53} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!427 = metadata !{i32 115, i32 5, metadata !423, null}
!428 = metadata !{i32 115, i32 50, metadata !423, null}
!429 = metadata !{i32 114, i32 29, metadata !423, null}
!430 = metadata !{i32 116, i32 3, metadata !5, null}
!431 = metadata !{i32 118, i32 8, metadata !432, null}
!432 = metadata !{i32 786443, metadata !2, metadata !5, i32 118, i32 3, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!433 = metadata !{i32 118, i32 8, metadata !434, null}
!434 = metadata !{i32 786443, metadata !2, metadata !435, i32 118, i32 8, i32 2, i32 56} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!435 = metadata !{i32 786443, metadata !2, metadata !432, i32 118, i32 8, i32 1, i32 55} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/basicmath_large.c]
!436 = metadata !{i32 118, i32 27, metadata !432, null}
!437 = metadata !{i32 119, i32 5, metadata !432, null}
!438 = metadata !{i32 119, i32 50, metadata !432, null}
!439 = metadata !{i32 118, i32 45, metadata !432, null}
!440 = metadata !{i32 122, i32 3, metadata !5, null}
!441 = metadata !{i32 13, i32 23, metadata !13, null}
!442 = metadata !{i32 786689, metadata !13, metadata !"rad", metadata !14, i32 16777229, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rad] [line 13]
!443 = metadata !{i32 15, i32 7, metadata !13, null}
!444 = metadata !{i32 15, i32 30, metadata !13, null}
!445 = metadata !{i32 45, i32 26, metadata !446, null}
!446 = metadata !{i32 786478, metadata !29, metadata !32, metadata !"usqrt", metadata !"usqrt", metadata !"", i32 45, metadata !447, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i64, %struct.int_sqrt.0*)* @usqrt_original, null, null, metadata !3, i32 46} ; [ DW_TAG_subprogram ] [line 45] [def] [scope 46] [usqrt]
!447 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !448, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!448 = metadata !{null, metadata !35, metadata !449}
!449 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !450} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int_sqrt]
!450 = metadata !{i32 786451, metadata !38, null, metadata !"int_sqrt", i32 67, i64 64, i64 32, i32 0, i32 0, null, metadata !451, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [int_sqrt] [line 67, size 64, align 32, offset 0] [def] [from ]
!451 = metadata !{metadata !452, metadata !453}
!452 = metadata !{i32 786445, metadata !38, metadata !450, metadata !"sqrt", i32 68, i64 32, i64 32, i64 0, i32 0, metadata !41} ; [ DW_TAG_member ] [sqrt] [line 68, size 32, align 32, offset 0] [from unsigned int]
!453 = metadata !{i32 786445, metadata !38, metadata !450, metadata !"frac", i32 69, i64 32, i64 32, i64 32, i32 0, metadata !41} ; [ DW_TAG_member ] [frac] [line 69, size 32, align 32, offset 32] [from unsigned int]
!454 = metadata !{i32 786689, metadata !446, metadata !"x", metadata !32, i32 16777261, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 45]
!455 = metadata !{i32 786689, metadata !446, metadata !"q", metadata !32, i32 33554477, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [q] [line 45]
!456 = metadata !{i32 45, i32 46, metadata !446, null}
!457 = metadata !{i32 786688, metadata !446, metadata !"a", metadata !32, i32 47, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 47]
!458 = metadata !{i32 47, i32 21, metadata !446, null}
!459 = metadata !{i32 47, i32 7, metadata !446, null}
!460 = metadata !{i32 786688, metadata !446, metadata !"r", metadata !32, i32 48, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 48]
!461 = metadata !{i32 48, i32 21, metadata !446, null}
!462 = metadata !{i32 48, i32 7, metadata !446, null}
!463 = metadata !{i32 786688, metadata !446, metadata !"e", metadata !32, i32 49, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [e] [line 49]
!464 = metadata !{i32 49, i32 21, metadata !446, null}
!465 = metadata !{i32 49, i32 7, metadata !446, null}
!466 = metadata !{i32 786688, metadata !446, metadata !"i", metadata !32, i32 51, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 51]
!467 = metadata !{i32 51, i32 11, metadata !446, null}
!468 = metadata !{i32 53, i32 12, metadata !469, null}
!469 = metadata !{i32 786443, metadata !29, metadata !446, i32 53, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/isqrt.c]
!470 = metadata !{i32 53, i32 12, metadata !471, null}
!471 = metadata !{i32 786443, metadata !29, metadata !472, i32 53, i32 12, i32 2, i32 5} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/isqrt.c]
!472 = metadata !{i32 786443, metadata !29, metadata !469, i32 53, i32 12, i32 1, i32 4} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/isqrt.c]
!473 = metadata !{i32 55, i32 13, metadata !474, null}
!474 = metadata !{i32 786443, metadata !29, metadata !469, i32 54, i32 7, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/isqrt.c]
!475 = metadata !{i32 55, i32 41, metadata !474, null}
!476 = metadata !{i32 56, i32 13, metadata !474, null}
!477 = metadata !{i32 57, i32 13, metadata !474, null}
!478 = metadata !{i32 58, i32 17, metadata !479, null} ; [ DW_TAG_imported_module ]
!479 = metadata !{i32 786443, metadata !29, metadata !474, i32 58, i32 17, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/isqrt.c]
!480 = metadata !{i32 60, i32 19, metadata !481, null}
!481 = metadata !{i32 786443, metadata !29, metadata !479, i32 59, i32 13, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/basicmath/isqrt.c]
!482 = metadata !{i32 61, i32 19, metadata !481, null}
!483 = metadata !{i32 62, i32 13, metadata !481, null}
!484 = metadata !{i32 63, i32 7, metadata !474, null}
!485 = metadata !{i32 53, i32 36, metadata !469, null}
!486 = metadata !{i32 64, i32 7, metadata !446, null}
!487 = metadata !{i32 65, i32 1, metadata !446, null}
