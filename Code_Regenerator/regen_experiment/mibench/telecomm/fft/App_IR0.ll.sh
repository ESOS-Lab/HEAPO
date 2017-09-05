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
@sdmprofile__BBcounter_83 = global i64 0, align 8
@sdmprofile__BBcounter_84 = global i64 0, align 8
@sdmprofile__BBcounter_85 = global i64 0, align 8
@sdmprofile__BBcounter_86 = global i64 0, align 8
@sdmprofile__BBcounter_87 = global i64 0, align 8
@sdmprofile__BBcounter_88 = global i64 0, align 8
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
@.str1 = private unnamed_addr constant [32 x i8] c"Usage: fft <waves> <length> -i\0A\00", align 1
@.str16 = private unnamed_addr constant [28 x i8] c"-i performs an inverse fft\0A\00", align 1
@.str2 = private unnamed_addr constant [30 x i8] c"make <waves> random sinusoids\00", align 1
@.str37 = private unnamed_addr constant [35 x i8] c"<length> is the number of samples\0A\00", align 1
@.str48 = private unnamed_addr constant [3 x i8] c"-i\00", align 1
@.str59 = private unnamed_addr constant [10 x i8] c"RealOut:\0A\00", align 1
@.str610 = private unnamed_addr constant [5 x i8] c"%f \09\00", align 1
@.str711 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str812 = private unnamed_addr constant [10 x i8] c"ImagOut:\0A\00", align 1
@.str913 = private unnamed_addr constant [73 x i8] c">>> Error in fftmisc.c: argument %d to NumberOfBitsNeeded is too small.\0A\00", align 1
@.str1014 = private unnamed_addr constant [52 x i8] c"Error in fft():  NumSamples=%u is not power of two\0A\00", align 1
@.str111 = private unnamed_addr constant [7 x i8] c"RealIn\00", align 1
@.str212 = private unnamed_addr constant [8 x i8] c"RealOut\00", align 1
@.str313 = private unnamed_addr constant [8 x i8] c"ImagOut\00", align 1
@.str414 = private unnamed_addr constant [35 x i8] c"Error in fft_float():  %s == NULL\0A\00", align 1
@sdmprofile__HP_Name_1 = private unnamed_addr constant [6 x i8] c"--,--\00"
@sdmprofile__HP_Type_1 = private unnamed_addr constant [7 x i8] c"float*\00"
@sdmprofile__HP_Fname_1 = private unnamed_addr constant [20 x i8] c"app__mainfunction__\00"
@sdmprofile__HP_SourceFile_1 = private unnamed_addr constant [7 x i8] c"main.c\00"
@sdmprofile__HP_Name_2 = private unnamed_addr constant [6 x i8] c"--,--\00"
@sdmprofile__HP_Type_2 = private unnamed_addr constant [7 x i8] c"float*\00"
@sdmprofile__HP_Fname_2 = private unnamed_addr constant [20 x i8] c"app__mainfunction__\00"
@sdmprofile__HP_SourceFile_2 = private unnamed_addr constant [7 x i8] c"main.c\00"
@sdmprofile__HP_Name_3 = private unnamed_addr constant [6 x i8] c"--,--\00"
@sdmprofile__HP_Type_3 = private unnamed_addr constant [7 x i8] c"float*\00"
@sdmprofile__HP_Fname_3 = private unnamed_addr constant [20 x i8] c"app__mainfunction__\00"
@sdmprofile__HP_SourceFile_3 = private unnamed_addr constant [7 x i8] c"main.c\00"
@sdmprofile__HP_Name_4 = private unnamed_addr constant [6 x i8] c"--,--\00"
@sdmprofile__HP_Type_4 = private unnamed_addr constant [7 x i8] c"float*\00"
@sdmprofile__HP_Fname_4 = private unnamed_addr constant [20 x i8] c"app__mainfunction__\00"
@sdmprofile__HP_SourceFile_4 = private unnamed_addr constant [7 x i8] c"main.c\00"
@sdmprofile__HP_Name_5 = private unnamed_addr constant [6 x i8] c"--,--\00"
@sdmprofile__HP_Type_5 = private unnamed_addr constant [7 x i8] c"float*\00"
@sdmprofile__HP_Fname_5 = private unnamed_addr constant [20 x i8] c"app__mainfunction__\00"
@sdmprofile__HP_SourceFile_5 = private unnamed_addr constant [7 x i8] c"main.c\00"
@sdmprofile__HP_Name_6 = private unnamed_addr constant [6 x i8] c"--,--\00"
@sdmprofile__HP_Type_6 = private unnamed_addr constant [7 x i8] c"float*\00"
@sdmprofile__HP_Fname_6 = private unnamed_addr constant [20 x i8] c"app__mainfunction__\00"
@sdmprofile__HP_SourceFile_6 = private unnamed_addr constant [7 x i8] c"main.c\00"

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
  store %struct.HeapAllocationMeta* %0, %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !46
  %call1 = tail call i32 @_Z17RegisterNewThreadv()
  store i32 %call1, i32* @sdmprofile__MainthreadNumber, align 4, !tbaa !50
  %1 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !46
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %1, i64 0, i32 1
  %2 = bitcast i8** %upperbound to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 20, i32 8, i1 false)
  %3 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !46
  %ptr = getelementptr inbounds %struct.HeapAllocationMeta* %3, i64 0, i32 0
  store i8* null, i8** %ptr, align 8, !tbaa !52
  store i64 0, i64* getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 0), align 8, !tbaa !55
  store i8* null, i8** getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 3), align 8, !tbaa !57
  store i32 0, i32* getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 4), align 8, !tbaa !58
  call void @llvm.memset.p0i8.i64(i8* bitcast (i8** getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 5) to i8*), i8 0, i64 24, i32 8, i1 false)
  %4 = load i32* @sdmprofile__IncludeStackProfiling, align 4, !tbaa !50
  %tobool = icmp eq i32 %4, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call2 = tail call noalias i8* @malloc(i64 240000) #2
  %5 = bitcast i8* %call2 to %struct.sdmprofile__Allocated_Stack_item*
  store %struct.sdmprofile__Allocated_Stack_item* %5, %struct.sdmprofile__Allocated_Stack_item** @sdmprofile__MainthreadStack_allo, align 8, !tbaa !46
  %ptr.ind.end = getelementptr i8* %call2, i64 240000
  %6 = bitcast i8* %ptr.ind.end to %struct.sdmprofile__Allocated_Stack_item*
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %if.then
  %index = phi i64 [ 0, %if.then ], [ %index.next.1, %vector.body ]
  %gep.idx1315 = or i64 %index, 1
  %7 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index, i32 0
  %8 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315, i32 0
  store i8* null, i8** %7, align 8, !tbaa !59
  store i8* null, i8** %8, align 8, !tbaa !59
  %9 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index, i32 2
  %10 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315, i32 2
  store i8* null, i8** %9, align 8, !tbaa !61
  store i8* null, i8** %10, align 8, !tbaa !61
  %index.next = add i64 %index, 2
  %gep.idx1315.1 = or i64 %index.next, 1
  %11 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index.next, i32 0
  %12 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315.1, i32 0
  store i8* null, i8** %11, align 8, !tbaa !59
  store i8* null, i8** %12, align 8, !tbaa !59
  %13 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index.next, i32 2
  %14 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315.1, i32 2
  store i8* null, i8** %13, align 8, !tbaa !61
  store i8* null, i8** %14, align 8, !tbaa !61
  %index.next.1 = add i64 %index.next, 2
  %15 = icmp eq i64 %index.next.1, 10000
  br i1 %15, label %if.end.loopexit, label %vector.body, !llvm.loop !62

if.end.loopexit:                                  ; preds = %vector.body
  br label %if.end

if.end:                                           ; preds = %if.end.loopexit, %entry
  store double 0.000000e+00, double* @sdmprofile__AppEndTime, align 8, !tbaa !65
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind uwtable
define i32 @_Z17RegisterNewThreadv() #3 {
entry:
  %call = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %0 = load i32* @thdsCount, align 4, !tbaa !50
  %idxprom = sext i32 %0 to i64
  %threadnumber = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 0
  store i32 %0, i32* %threadnumber, align 8, !tbaa !67
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @thdsCount, align 4, !tbaa !50
  %call1 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %call2 = tail call i64 @pthread_self() #12
  %threadID = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 1
  store i64 %call2, i64* %threadID, align 8, !tbaa !69
  %call3 = tail call double @sdmprofile__getRealTime()
  %ThreadStartTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 2
  store double %call3, double* %ThreadStartTime, align 8, !tbaa !70
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double 0.000000e+00, double* %ThreadEndTime, align 8, !tbaa !71
  %Malloc_Calls = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 6
  %1 = bitcast i64* %Malloc_Calls to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 88, i32 8, i1 false)
  %2 = load i32* @sdmprofile__profileAction, align 4, !tbaa !50
  switch i32 %2, label %if.end [
    i32 4, label %if.then
    i32 1, label %if.then
  ]

if.then:                                          ; preds = %entry, %entry
  %call5 = tail call noalias i8* @malloc(i64 128) #2
  %3 = bitcast i8* %call5 to %struct.Cache2_Item*
  %Cache2_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 19
  store %struct.Cache2_Item* %3, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !72
  %4 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !46
  %ptr = bitcast i8* %call5 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !73
  %add.ptr8 = getelementptr inbounds i8* %call5, i64 16
  %5 = bitcast i8* %add.ptr8 to %struct.Cache2_Item*
  %next = getelementptr inbounds i8* %call5, i64 8
  %6 = bitcast i8* %next to %struct.Cache2_Item**
  store %struct.Cache2_Item* %5, %struct.Cache2_Item** %6, align 8, !tbaa !75
  %ptr.1 = getelementptr inbounds i8* %call5, i64 16
  %7 = bitcast i8* %ptr.1 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %7, align 8, !tbaa !73
  %add.ptr8.1 = getelementptr inbounds i8* %call5, i64 32
  %8 = bitcast i8* %add.ptr8.1 to %struct.Cache2_Item*
  %next.1 = getelementptr inbounds i8* %call5, i64 24
  %9 = bitcast i8* %next.1 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %8, %struct.Cache2_Item** %9, align 8, !tbaa !75
  %ptr.2 = getelementptr inbounds i8* %call5, i64 32
  %10 = bitcast i8* %ptr.2 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %10, align 8, !tbaa !73
  %add.ptr8.2 = getelementptr inbounds i8* %call5, i64 48
  %11 = bitcast i8* %add.ptr8.2 to %struct.Cache2_Item*
  %next.2 = getelementptr inbounds i8* %call5, i64 40
  %12 = bitcast i8* %next.2 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %11, %struct.Cache2_Item** %12, align 8, !tbaa !75
  %ptr.3 = getelementptr inbounds i8* %call5, i64 48
  %13 = bitcast i8* %ptr.3 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %13, align 8, !tbaa !73
  %add.ptr8.3 = getelementptr inbounds i8* %call5, i64 64
  %14 = bitcast i8* %add.ptr8.3 to %struct.Cache2_Item*
  %next.3 = getelementptr inbounds i8* %call5, i64 56
  %15 = bitcast i8* %next.3 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %14, %struct.Cache2_Item** %15, align 8, !tbaa !75
  %ptr.4 = getelementptr inbounds i8* %call5, i64 64
  %16 = bitcast i8* %ptr.4 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %16, align 8, !tbaa !73
  %add.ptr8.4 = getelementptr inbounds i8* %call5, i64 80
  %17 = bitcast i8* %add.ptr8.4 to %struct.Cache2_Item*
  %next.4 = getelementptr inbounds i8* %call5, i64 72
  %18 = bitcast i8* %next.4 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %17, %struct.Cache2_Item** %18, align 8, !tbaa !75
  %ptr.5 = getelementptr inbounds i8* %call5, i64 80
  %19 = bitcast i8* %ptr.5 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %19, align 8, !tbaa !73
  %add.ptr8.5 = getelementptr inbounds i8* %call5, i64 96
  %20 = bitcast i8* %add.ptr8.5 to %struct.Cache2_Item*
  %next.5 = getelementptr inbounds i8* %call5, i64 88
  %21 = bitcast i8* %next.5 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %20, %struct.Cache2_Item** %21, align 8, !tbaa !75
  %ptr.6 = getelementptr inbounds i8* %call5, i64 96
  %22 = bitcast i8* %ptr.6 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %22, align 8, !tbaa !73
  %add.ptr8.6 = getelementptr inbounds i8* %call5, i64 112
  %23 = bitcast i8* %add.ptr8.6 to %struct.Cache2_Item*
  %next.6 = getelementptr inbounds i8* %call5, i64 104
  %24 = bitcast i8* %next.6 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %23, %struct.Cache2_Item** %24, align 8, !tbaa !75
  %add.ptr10 = getelementptr inbounds i8* %call5, i64 112
  %ptr11 = bitcast i8* %add.ptr10 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %ptr11, align 8, !tbaa !73
  %next13 = getelementptr inbounds i8* %call5, i64 120
  %25 = bitcast i8* %next13 to %struct.Cache2_Item**
  store %struct.Cache2_Item* null, %struct.Cache2_Item** %25, align 8, !tbaa !75
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %.off = add i32 %2, -3
  %26 = icmp ult i32 %.off, 2
  br i1 %26, label %if.then17, label %if.end39

if.then17:                                        ; preds = %if.end
  %call19 = tail call noalias i8* @malloc(i64 128) #2
  %27 = bitcast i8* %call19 to %struct.GVCache_Item*
  %GVCache_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 20
  store %struct.GVCache_Item* %27, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !76
  %ptr27 = bitcast i8* %call19 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %ptr27, align 8, !tbaa !77
  %add.ptr30 = getelementptr inbounds i8* %call19, i64 16
  %28 = bitcast i8* %add.ptr30 to %struct.GVCache_Item*
  %next31 = getelementptr inbounds i8* %call19, i64 8
  %29 = bitcast i8* %next31 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %28, %struct.GVCache_Item** %29, align 8, !tbaa !79
  %ptr27.1 = getelementptr inbounds i8* %call19, i64 16
  %30 = bitcast i8* %ptr27.1 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %30, align 8, !tbaa !77
  %add.ptr30.1 = getelementptr inbounds i8* %call19, i64 32
  %31 = bitcast i8* %add.ptr30.1 to %struct.GVCache_Item*
  %next31.1 = getelementptr inbounds i8* %call19, i64 24
  %32 = bitcast i8* %next31.1 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %31, %struct.GVCache_Item** %32, align 8, !tbaa !79
  %ptr27.2 = getelementptr inbounds i8* %call19, i64 32
  %33 = bitcast i8* %ptr27.2 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %33, align 8, !tbaa !77
  %add.ptr30.2 = getelementptr inbounds i8* %call19, i64 48
  %34 = bitcast i8* %add.ptr30.2 to %struct.GVCache_Item*
  %next31.2 = getelementptr inbounds i8* %call19, i64 40
  %35 = bitcast i8* %next31.2 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %34, %struct.GVCache_Item** %35, align 8, !tbaa !79
  %ptr27.3 = getelementptr inbounds i8* %call19, i64 48
  %36 = bitcast i8* %ptr27.3 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %36, align 8, !tbaa !77
  %add.ptr30.3 = getelementptr inbounds i8* %call19, i64 64
  %37 = bitcast i8* %add.ptr30.3 to %struct.GVCache_Item*
  %next31.3 = getelementptr inbounds i8* %call19, i64 56
  %38 = bitcast i8* %next31.3 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %37, %struct.GVCache_Item** %38, align 8, !tbaa !79
  %ptr27.4 = getelementptr inbounds i8* %call19, i64 64
  %39 = bitcast i8* %ptr27.4 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %39, align 8, !tbaa !77
  %add.ptr30.4 = getelementptr inbounds i8* %call19, i64 80
  %40 = bitcast i8* %add.ptr30.4 to %struct.GVCache_Item*
  %next31.4 = getelementptr inbounds i8* %call19, i64 72
  %41 = bitcast i8* %next31.4 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %40, %struct.GVCache_Item** %41, align 8, !tbaa !79
  %ptr27.5 = getelementptr inbounds i8* %call19, i64 80
  %42 = bitcast i8* %ptr27.5 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %42, align 8, !tbaa !77
  %add.ptr30.5 = getelementptr inbounds i8* %call19, i64 96
  %43 = bitcast i8* %add.ptr30.5 to %struct.GVCache_Item*
  %next31.5 = getelementptr inbounds i8* %call19, i64 88
  %44 = bitcast i8* %next31.5 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %43, %struct.GVCache_Item** %44, align 8, !tbaa !79
  %ptr27.6 = getelementptr inbounds i8* %call19, i64 96
  %45 = bitcast i8* %ptr27.6 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %45, align 8, !tbaa !77
  %add.ptr30.6 = getelementptr inbounds i8* %call19, i64 112
  %46 = bitcast i8* %add.ptr30.6 to %struct.GVCache_Item*
  %next31.6 = getelementptr inbounds i8* %call19, i64 104
  %47 = bitcast i8* %next31.6 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %46, %struct.GVCache_Item** %47, align 8, !tbaa !79
  %add.ptr35 = getelementptr inbounds i8* %call19, i64 112
  %ptr36 = bitcast i8* %add.ptr35 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %ptr36, align 8, !tbaa !77
  %next38 = getelementptr inbounds i8* %call19, i64 120
  %48 = bitcast i8* %next38 to %struct.GVCache_Item**
  store %struct.GVCache_Item* null, %struct.GVCache_Item** %48, align 8, !tbaa !79
  br label %if.end39

if.end39:                                         ; preds = %if.then17, %if.end
  %49 = load i32* @sdmprofile__IncludeStackProfiling, align 4, !tbaa !50
  %tobool = icmp eq i32 %49, 0
  br i1 %tobool, label %if.end42, label %if.then40

if.then40:                                        ; preds = %if.end39
  %call41 = tail call noalias i8* @malloc(i64 240000) #2
  %50 = bitcast i8* %call41 to %struct.sdmprofile__Allocated_Stack_item*
  %Stack_allocations_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 4
  store %struct.sdmprofile__Allocated_Stack_item* %50, %struct.sdmprofile__Allocated_Stack_item** %Stack_allocations_head, align 8, !tbaa !80
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %if.end39
  %51 = load i32* %threadnumber, align 8, !tbaa !67
  ret i32 %51
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__Embed_metadata_GV(i64 %index__, i8* %AtAddress, i32 %size_, i8* %Name_string_ptr, i8* %DataType_string_ptr, i8* %FilenameStringptr_, i8* %FileDirStringptr_, i64 %linenumber__) #3 {
entry:
  %I = alloca %struct.GVMeta*, align 8
  %call = tail call noalias i8* @malloc(i64 88) #2
  %0 = bitcast i8* %call to %struct.GVMeta*
  store %struct.GVMeta* %0, %struct.GVMeta** %I, align 8, !tbaa !46
  %index = bitcast i8* %call to i64*
  store i64 %index__, i64* %index, align 8, !tbaa !55
  %address = getelementptr inbounds i8* %call, i64 24
  %1 = bitcast i8* %address to i8**
  store i8* %AtAddress, i8** %1, align 8, !tbaa !57
  %size = getelementptr inbounds i8* %call, i64 32
  %2 = bitcast i8* %size to i32*
  store i32 %size_, i32* %2, align 4, !tbaa !58
  %VarName = getelementptr inbounds i8* %call, i64 40
  %3 = bitcast i8* %VarName to i8**
  store i8* %Name_string_ptr, i8** %3, align 8, !tbaa !81
  %DataTypeString = getelementptr inbounds i8* %call, i64 48
  %4 = bitcast i8* %DataTypeString to i8**
  store i8* %DataType_string_ptr, i8** %4, align 8, !tbaa !82
  %5 = ptrtoint i8* %AtAddress to i64
  %conv = zext i32 %size_ to i64
  %add = add i64 %conv, %5
  %6 = inttoptr i64 %add to i8*
  %upperbound = getelementptr inbounds i8* %call, i64 56
  %7 = bitcast i8* %upperbound to i8**
  store i8* %6, i8** %7, align 8, !tbaa !83
  %r = getelementptr inbounds i8* %call, i64 8
  %FileName = getelementptr inbounds i8* %call, i64 64
  %8 = bitcast i8* %FileName to i8**
  call void @llvm.memset.p0i8.i64(i8* %r, i8 0, i64 16, i32 8, i1 false)
  store i8* %FilenameStringptr_, i8** %8, align 8, !tbaa !84
  %DirName = getelementptr inbounds i8* %call, i64 72
  %9 = bitcast i8* %DirName to i8**
  store i8* %FileDirStringptr_, i8** %9, align 8, !tbaa !85
  %linenumber = getelementptr inbounds i8* %call, i64 80
  %10 = bitcast i8* %linenumber to i64*
  store i64 %linenumber__, i64* %10, align 8, !tbaa !86
  call void @_ZNSt12forward_listIP6GVMetaSaIS1_EE10push_frontERKS1_(%"class.std::forward_list"* @GVMetalist, %struct.GVMeta** dereferenceable(8) %I)
  %11 = load i8** @GV_AddrRangeHead, align 8, !tbaa !46
  %cmp = icmp eq i8* %11, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i8* %AtAddress, i8** @GV_AddrRangeHead, align 8, !tbaa !46
  store i8* %6, i8** @GV_AddrRangeTail, align 8, !tbaa !46
  br label %if.end12

if.else:                                          ; preds = %entry
  %cmp3 = icmp ugt i8* %11, %AtAddress
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.else
  store i8* %AtAddress, i8** @GV_AddrRangeHead, align 8, !tbaa !46
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.else
  %12 = load i8** @GV_AddrRangeTail, align 8, !tbaa !46
  %cmp7 = icmp ult i8* %12, %6
  br i1 %cmp7, label %if.then8, label %if.end12

if.then8:                                         ; preds = %if.end
  store i8* %6, i8** @GV_AddrRangeTail, align 8, !tbaa !46
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
  store i64 %index__, i64* %index, align 8, !tbaa !87
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 3
  store i32 %size_, i32* %size, align 8, !tbaa !89
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 4
  store i8* %Estimated_Name_string_ptr, i8** %EstimatedName, align 8, !tbaa !90
  %DataTypeString = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 5
  store i8* %DataType_string_ptr, i8** %DataTypeString, align 8, !tbaa !91
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 6
  store i8* %FunctionName_string_ptr, i8** %FunctionName, align 8, !tbaa !92
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__Embed_metadata_HP(i32 %index__, i8* %Estimated_Name_string_ptr, i8* %DataType_string_ptr, i8* %FunctionName_string_ptr, i64 %linenumber__, i8* %SourceFile__) #3 {
entry:
  %idxprom = zext i32 %index__ to i64
  %index = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 0
  store i32 %index__, i32* %index, align 16, !tbaa !93
  %EstimatedName = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 3
  store i8* %Estimated_Name_string_ptr, i8** %EstimatedName, align 8, !tbaa !95
  %EstimatedDataTypeString = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 4
  store i8* %DataType_string_ptr, i8** %EstimatedDataTypeString, align 16, !tbaa !96
  %FunctionName = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 5
  store i8* %FunctionName_string_ptr, i8** %FunctionName, align 8, !tbaa !97
  %linenumber = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 6
  store i64 %linenumber__, i64* %linenumber, align 16, !tbaa !98
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 7
  store i8* %SourceFile__, i8** %SourceFile, align 8, !tbaa !99
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
  %0 = load %struct.GVMeta** %call4, align 8, !tbaa !46
  %index = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 0
  %1 = load i64* %index, align 8, !tbaa !55
  %cmp = icmp eq i64 %1, %index__
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %r = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 1
  %2 = load i64* %r, align 8, !tbaa !100
  %add = add i64 %2, %mul
  store i64 %add, i64* %r, align 8, !tbaa !100
  %w = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 2
  %3 = load i64* %w, align 8, !tbaa !101
  %add8 = add i64 %3, %mul7
  store i64 %add8, i64* %w, align 8, !tbaa !101
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
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !102
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
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !106
  %_M_node2 = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %__x, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_node2, align 8, !tbaa !106
  %cmp = icmp ne %"struct.std::_Fwd_list_node_base"* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(8) %struct.GVMeta** @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEdeEv(%"struct.std::_Fwd_list_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !106
  %1 = bitcast %"struct.std::_Fwd_list_node_base"* %0 to %"struct.std::_Fwd_list_node"*
  %call = tail call %struct.GVMeta** @_ZNSt14_Fwd_list_nodeIP6GVMetaE9_M_valptrEv(%"struct.std::_Fwd_list_node"* %1) #2
  ret %struct.GVMeta** %call
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %this) #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !106
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %0, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !108
  store %"struct.std::_Fwd_list_node_base"* %1, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !106
  ret %"struct.std::_Fwd_list_iterator"* %this
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__AddBBHitcount_ST(i64 %index__, i64 %BBhitcount, i32 %Rcount, i32 %Wcount) #3 {
entry:
  %r = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 1
  %0 = load i64* %r, align 8, !tbaa !109
  %conv = sext i32 %Rcount to i64
  %mul = mul i64 %conv, %BBhitcount
  %add = add i64 %0, %mul
  store i64 %add, i64* %r, align 8, !tbaa !109
  %w = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 2
  %1 = load i64* %w, align 8, !tbaa !110
  %conv4 = sext i32 %Wcount to i64
  %mul5 = mul i64 %conv4, %BBhitcount
  %add6 = add i64 %1, %mul5
  store i64 %add6, i64* %w, align 8, !tbaa !110
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
  store i64 %cc, i64* %arrayidx, align 8, !tbaa !111
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
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !71
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
  %0 = load i64* %tv_sec, align 8, !tbaa !112
  %conv = sitofp i64 %0 to double
  %tv_nsec = getelementptr inbounds %struct.timespec* %ts, i64 0, i32 1
  %1 = load i64* %tv_nsec, align 8, !tbaa !114
  %conv1 = sitofp i64 %1 to double
  %div = fdiv double %conv1, 1.000000e+09
  %add = fadd double %conv, %div
  br label %return

if.end:                                           ; preds = %entry
  %call2 = call i32 @gettimeofday(%struct.timeval* %tm, %struct.timezone* null) #2
  %tv_sec3 = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 0
  %2 = load i64* %tv_sec3, align 8, !tbaa !115
  %conv4 = sitofp i64 %2 to double
  %tv_usec = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 1
  %3 = load i64* %tv_usec, align 8, !tbaa !117
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
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !71
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template3(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %conv = zext i32 %call to i64
  %call4 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %conv, i32 3
  store double %call4, double* %ThreadEndTime, align 8, !tbaa !71
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template4(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %conv = zext i32 %call to i64
  %call4 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %conv, i32 3
  store double %call4, double* %ThreadEndTime, align 8, !tbaa !71
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template5(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %call2 = tail call double @sdmprofile__getRealTime()
  %idxprom = zext i32 %call to i64
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !71
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template6(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %idxprom = zext i32 %call to i64
  %call2 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !71
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define i8* @sdmprofile__malloc(i64 %size_, i32 %heap_index, i32 %thdnumber) #3 {
entry:
  %I = alloca %struct.HeapAllocationMeta*, align 8
  %call = tail call noalias i8* @malloc(i64 %size_) #2
  %idxprom = zext i32 %thdnumber to i64
  %Malloc_Calls = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 6
  %0 = load i64* %Malloc_Calls, align 8, !tbaa !118
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Malloc_Calls, align 8, !tbaa !118
  %call1 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %call2 = tail call noalias i8* @malloc(i64 40) #2
  %1 = bitcast i8* %call2 to %struct.HeapAllocationMeta*
  store %struct.HeapAllocationMeta* %1, %struct.HeapAllocationMeta** %I, align 8, !tbaa !46
  %ptr = bitcast i8* %call2 to i8**
  store i8* %call, i8** %ptr, align 8, !tbaa !52
  %2 = ptrtoint i8* %call to i64
  %add = add i64 %2, %size_
  %3 = inttoptr i64 %add to i8*
  %upperbound = getelementptr inbounds i8* %call2, i64 8
  %4 = bitcast i8* %upperbound to i8**
  store i8* %3, i8** %4, align 8, !tbaa !119
  %size = getelementptr inbounds i8* %call2, i64 16
  %5 = bitcast i8* %size to i64*
  store i64 %size_, i64* %5, align 8, !tbaa !120
  %heapindex = getelementptr inbounds i8* %call2, i64 24
  %6 = bitcast i8* %heapindex to i32*
  store i32 %heap_index, i32* %6, align 4, !tbaa !121
  call void @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE10push_frontERKS1_(%"class.std::list"* @HeapAllocationList, %struct.HeapAllocationMeta** dereferenceable(8) %I)
  %call3 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %Current_Heap_Allocation = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 10
  %7 = load i64* %Current_Heap_Allocation, align 8, !tbaa !122
  %inc6 = add i64 %7, 1
  store i64 %inc6, i64* %Current_Heap_Allocation, align 8, !tbaa !122
  %Peak_Heap_Allocation = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 8
  %8 = load i64* %Peak_Heap_Allocation, align 8, !tbaa !123
  %cmp = icmp ult i64 %8, %inc6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 %inc6, i64* %Peak_Heap_Allocation, align 8, !tbaa !123
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %idxprom18 = zext i32 %heap_index to i64
  %arrayidx19 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18
  store %struct.HPMeta* %arrayidx19, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !46
  %hitcount = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 8
  %9 = load i64* %hitcount, align 16, !tbaa !124
  %cmp20 = icmp eq i64 %9, 0
  %MaxSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 9
  br i1 %cmp20, label %if.then21, label %if.else

if.then21:                                        ; preds = %if.end
  store i64 %size_, i64* %MaxSize, align 8, !tbaa !125
  %MinSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 10
  store i64 %size_, i64* %MinSize, align 16, !tbaa !126
  br label %if.end32

if.else:                                          ; preds = %if.end
  %10 = load i64* %MaxSize, align 8, !tbaa !125
  %cmp23 = icmp ult i64 %10, %size_
  br i1 %cmp23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %if.else
  store i64 %size_, i64* %MaxSize, align 8, !tbaa !125
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %if.else
  %MinSize27 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 10
  %11 = load i64* %MinSize27, align 16, !tbaa !126
  %cmp28 = icmp ugt i64 %11, %size_
  br i1 %cmp28, label %if.then29, label %if.end32

if.then29:                                        ; preds = %if.end26
  store i64 %size_, i64* %MinSize27, align 16, !tbaa !126
  br label %if.end32

if.end32:                                         ; preds = %if.then29, %if.end26, %if.then21
  %hitcount33 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 8
  %inc34 = add i64 %9, 1
  store i64 %inc34, i64* %hitcount33, align 16, !tbaa !124
  %12 = load i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !46
  %cmp35 = icmp eq i8* %12, null
  br i1 %cmp35, label %if.then36, label %if.else38

if.then36:                                        ; preds = %if.end32
  store i8* %call, i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !46
  store i8* %3, i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !46
  br label %if.end47

if.else38:                                        ; preds = %if.end32
  %cmp39 = icmp ugt i8* %12, %call
  br i1 %cmp39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.else38
  store i8* %call, i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !46
  br label %if.end41

if.end41:                                         ; preds = %if.then40, %if.else38
  %13 = load i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !46
  %cmp43 = icmp ult i8* %13, %3
  br i1 %cmp43, label %if.then44, label %if.end47

if.then44:                                        ; preds = %if.end41
  store i8* %3, i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !46
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
  %0 = load i64* %Free_Calls, align 8, !tbaa !127
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Free_Calls, align 8, !tbaa !127
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
  %1 = load %struct.HeapAllocationMeta** %call5, align 8, !tbaa !46
  %ptr = getelementptr inbounds %struct.HeapAllocationMeta* %1, i64 0, i32 0
  %2 = load i8** %ptr, align 8, !tbaa !52
  %cmp = icmp eq i8* %2, %pointer
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %ptr.lcssa = phi i8** [ %ptr, %for.body ]
  %call5.lcssa = phi %struct.HeapAllocationMeta** [ %call5, %for.body ]
  store i8* null, i8** %ptr.lcssa, align 8, !tbaa !52
  %3 = load %struct.HeapAllocationMeta** %call5.lcssa, align 8, !tbaa !46
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %3, i64 0, i32 1
  store i8* null, i8** %upperbound, align 8, !tbaa !119
  %4 = load %struct.HeapAllocationMeta** %call5.lcssa, align 8, !tbaa !46
  %size = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 2
  store i64 0, i64* %size, align 8, !tbaa !120
  %heapindex = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 3
  store i32 0, i32* %heapindex, align 4, !tbaa !121
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
  %5 = load i64* %Current_Heap_Allocation, align 8, !tbaa !122
  %dec = add i64 %5, -1
  store i64 %dec, i64* %Current_Heap_Allocation, align 8, !tbaa !122
  call void @free(i8* %pointer) #2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden %"struct.std::__detail::_List_node_base"* @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE5beginEv(%"class.std::list"* nocapture readonly %this) #3 align 2 {
entry:
  %retval = alloca %"struct.std::_List_iterator", align 8
  %_M_next = getelementptr inbounds %"class.std::list"* %this, i64 0, i32 0, i32 0, i32 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !128
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
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !132
  %_M_node2 = getelementptr inbounds %"struct.std::_List_iterator"* %__x, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_node2, align 8, !tbaa !132
  %cmp = icmp ne %"struct.std::__detail::_List_node_base"* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(8) %struct.HeapAllocationMeta** @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEdeEv(%"struct.std::_List_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_List_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !132
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
  store %"struct.std::__detail::_List_node_base"* %call2, %"struct.std::__detail::_List_node_base"** %0, align 8, !tbaa !46
  %call420 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__first, %"struct.std::_List_iterator"* dereferenceable(8) %__last)
  br i1 %call420, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %entry
  %1 = getelementptr inbounds %"struct.std::_List_iterator"* %__next, i64 0, i32 0
  br label %while.body

while.body:                                       ; preds = %if.end13, %while.body.lr.ph
  %agg.tmp16.sroa.0.0.copyload23 = phi %"struct.std::__detail::_List_node_base"* [ %call2, %while.body.lr.ph ], [ %agg.tmp16.sroa.0.0.copyload22, %if.end13 ]
  %2 = phi %"struct.std::__detail::_List_node_base"* [ %call, %while.body.lr.ph ], [ %5, %if.end13 ]
  store %"struct.std::__detail::_List_node_base"* %2, %"struct.std::__detail::_List_node_base"** %1, align 8, !tbaa !46
  %call5 = call dereferenceable(8) %"struct.std::_List_iterator"* @_ZNSt14_List_iteratorIP18HeapAllocationMetaEppEv(%"struct.std::_List_iterator"* %__next)
  %call6 = call dereferenceable(8) %struct.HeapAllocationMeta** @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEdeEv(%"struct.std::_List_iterator"* %__first)
  %3 = load %struct.HeapAllocationMeta** %call6, align 8, !tbaa !46
  %4 = load %struct.HeapAllocationMeta** %__value, align 8, !tbaa !46
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
  store %"struct.std::__detail::_List_node_base"* %2, %"struct.std::__detail::_List_node_base"** %0, align 8, !tbaa !46
  br label %if.end13

if.end13:                                         ; preds = %if.else, %if.then11, %while.body
  %agg.tmp16.sroa.0.0.copyload22 = phi %"struct.std::__detail::_List_node_base"* [ %agg.tmp16.sroa.0.0.copyload23, %if.then11 ], [ %2, %if.else ], [ %agg.tmp16.sroa.0.0.copyload23, %while.body ]
  %5 = load %"struct.std::__detail::_List_node_base"** %1, align 8, !tbaa !46
  store %"struct.std::__detail::_List_node_base"* %5, %"struct.std::__detail::_List_node_base"** %coerce.dive, align 8, !tbaa !46
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
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !132
  %_M_next = getelementptr inbounds %"struct.std::__detail::_List_node_base"* %0, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !134
  store %"struct.std::__detail::_List_node_base"* %1, %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !132
  ret %"struct.std::_List_iterator"* %this
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy1(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType) #3 {
entry:
  %0 = load i64* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 12), align 16, !tbaa !135
  %inc = add i64 %0, 1
  store i64 %inc, i64* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 12), align 16, !tbaa !135
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy2(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType, i32 %threadnumber) #3 {
entry:
  %idxprom = zext i32 %threadnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !135
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !135
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy3(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType, i32 %threadnumber, %struct.sdmprofile__Allocated_Stack_item* nocapture readnone %ptr) #3 {
entry:
  %idxprom = zext i32 %threadnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !135
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !135
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_GVonly(i8* readnone %AtAddress, i8 zeroext %AccessType, i32 %thdnumber) #3 {
entry:
  %__begin = alloca %"struct.std::_Fwd_list_iterator", align 8
  %__end = alloca %"struct.std::_Fwd_list_iterator", align 8
  %idxprom = zext i32 %thdnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !135
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !135
  %1 = load i8** @GV_AddrRangeHead, align 8, !tbaa !46
  %cmp = icmp ule i8* %1, %AtAddress
  %2 = load i8** @GV_AddrRangeTail, align 8
  %cmp1 = icmp ugt i8* %2, %AtAddress
  %or.cond = and i1 %cmp, %cmp1
  br i1 %or.cond, label %if.then, label %return

if.then:                                          ; preds = %entry
  %SearchWithinAddressRange = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 14
  %3 = load i64* %SearchWithinAddressRange, align 8, !tbaa !136
  %inc4 = add i64 %3, 1
  store i64 %inc4, i64* %SearchWithinAddressRange, align 8, !tbaa !136
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
  %4 = load %struct.GVMeta** %ptr, align 8, !tbaa !77
  %address = getelementptr inbounds %struct.GVMeta* %4, i64 0, i32 3
  %5 = load i8** %address, align 8, !tbaa !57
  %cmp8 = icmp ugt i8* %5, %AtAddress
  br i1 %cmp8, label %if.else37, label %land.lhs.true9

land.lhs.true9:                                   ; preds = %while.body
  %upperbound = getelementptr inbounds %struct.GVMeta* %4, i64 0, i32 7
  %6 = load i8** %upperbound, align 8, !tbaa !83
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
  %7 = load i64* %r, align 8, !tbaa !100
  %inc14 = add i64 %7, 1
  store i64 %inc14, i64* %r, align 8, !tbaa !100
  br label %sw.epilog

sw.bb15:                                          ; preds = %if.then12
  %w = getelementptr inbounds %struct.GVMeta* %.lcssa154, i64 0, i32 2
  %8 = load i64* %w, align 8, !tbaa !101
  %inc17 = add i64 %8, 1
  store i64 %inc17, i64* %w, align 8, !tbaa !101
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb15, %sw.bb, %if.then12
  %Cache_Hits = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 16
  %9 = load i64* %Cache_Hits, align 8, !tbaa !137
  %inc20 = add i64 %9, 1
  store i64 %inc20, i64* %Cache_Hits, align 8, !tbaa !137
  %10 = load %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !76
  %cmp24 = icmp eq %struct.GVCache_Item* %I.0139.lcssa, %10
  br i1 %cmp24, label %return, label %if.else

if.else:                                          ; preds = %sw.epilog
  %next = getelementptr inbounds %struct.GVCache_Item* %I.0139.lcssa, i64 0, i32 1
  %11 = load %struct.GVCache_Item** %next, align 8, !tbaa !79
  %next26 = getelementptr inbounds %struct.GVCache_Item* %previous.0138.lcssa, i64 0, i32 1
  store %struct.GVCache_Item* %11, %struct.GVCache_Item** %next26, align 8, !tbaa !79
  store %struct.GVCache_Item* %I.0139.lcssa, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !76
  store %struct.GVCache_Item* %10, %struct.GVCache_Item** %next, align 8, !tbaa !79
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
  %12 = load %struct.GVMeta** %call44, align 8, !tbaa !46
  %address45 = getelementptr inbounds %struct.GVMeta* %12, i64 0, i32 3
  %13 = load i8** %address45, align 8, !tbaa !57
  %cmp46 = icmp ugt i8* %13, %AtAddress
  br i1 %cmp46, label %for.inc, label %land.lhs.true47

land.lhs.true47:                                  ; preds = %for.body
  %upperbound48 = getelementptr inbounds %struct.GVMeta* %12, i64 0, i32 7
  %14 = load i8** %upperbound48, align 8, !tbaa !83
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
  %15 = load i64* %r53, align 8, !tbaa !100
  %inc54 = add i64 %15, 1
  store i64 %inc54, i64* %r53, align 8, !tbaa !100
  br label %sw.epilog59

sw.bb55:                                          ; preds = %if.then50
  %w56 = getelementptr inbounds %struct.GVMeta* %.lcssa, i64 0, i32 2
  %16 = load i64* %w56, align 8, !tbaa !101
  %inc57 = add i64 %16, 1
  store i64 %inc57, i64* %w56, align 8, !tbaa !101
  br label %sw.epilog59

sw.epilog59:                                      ; preds = %sw.bb55, %sw.bb52, %if.then50
  %Cache_Miss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 15
  %17 = load i64* %Cache_Miss, align 8, !tbaa !138
  %inc68 = add i64 %17, 1
  store i64 %inc68, i64* %Cache_Miss, align 8, !tbaa !138
  %18 = load %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !76
  br label %while.cond75

for.inc:                                          ; preds = %land.lhs.true47, %for.body
  %call61 = call dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %call42 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call42, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %while.end
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %19 = load i64* %SearchMiss, align 8, !tbaa !139
  %inc64 = add i64 %19, 1
  store i64 %inc64, i64* %SearchMiss, align 8, !tbaa !139
  br label %return

while.cond75:                                     ; preds = %while.cond75, %sw.epilog59
  %previous70.0 = phi %struct.GVCache_Item* [ undef, %sw.epilog59 ], [ %I71.0, %while.cond75 ]
  %I71.0 = phi %struct.GVCache_Item* [ %18, %sw.epilog59 ], [ %20, %while.cond75 ]
  %next76 = getelementptr inbounds %struct.GVCache_Item* %I71.0, i64 0, i32 1
  %20 = load %struct.GVCache_Item** %next76, align 8, !tbaa !79
  %cmp77 = icmp eq %struct.GVCache_Item* %20, null
  br i1 %cmp77, label %while.end80, label %while.cond75

while.end80:                                      ; preds = %while.cond75
  %next76.lcssa = phi %struct.GVCache_Item** [ %next76, %while.cond75 ]
  %I71.0.lcssa = phi %struct.GVCache_Item* [ %I71.0, %while.cond75 ]
  %previous70.0.lcssa = phi %struct.GVCache_Item* [ %previous70.0, %while.cond75 ]
  %next81 = getelementptr inbounds %struct.GVCache_Item* %previous70.0.lcssa, i64 0, i32 1
  store %struct.GVCache_Item* null, %struct.GVCache_Item** %next81, align 8, !tbaa !79
  store %struct.GVCache_Item* %I71.0.lcssa, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !76
  store %struct.GVCache_Item* %18, %struct.GVCache_Item** %next76.lcssa, align 8, !tbaa !79
  %ptr95 = getelementptr inbounds %struct.GVCache_Item* %I71.0.lcssa, i64 0, i32 0
  store %struct.GVMeta* %.lcssa, %struct.GVMeta** %ptr95, align 8, !tbaa !77
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
  %0 = load i64* %Search, align 8, !tbaa !135
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !135
  %1 = load i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !46
  %cmp = icmp ugt i8* %1, %AtAddress
  %2 = load i8** @sdmprofile__HP_addressRangeTo, align 8
  %cmp1 = icmp ult i8* %2, %AtAddress
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %if.end96, label %if.then

if.then:                                          ; preds = %entry
  %SearchWithinAddressRange = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 14
  %3 = load i64* %SearchWithinAddressRange, align 8, !tbaa !136
  %inc4 = add i64 %3, 1
  store i64 %inc4, i64* %SearchWithinAddressRange, align 8, !tbaa !136
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
  %4 = load %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !73
  %ptr8 = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 0
  %5 = load i8** %ptr8, align 8, !tbaa !52
  store i8* %5, i8** @cache_addr, align 8, !tbaa !46
  %6 = load %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !73
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %6, i64 0, i32 1
  %7 = load i8** %upperbound, align 8, !tbaa !119
  store i8* %7, i8** @cache_upperbound, align 8, !tbaa !46
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
  %8 = load %struct.HeapAllocationMeta** %ptr.lcssa, align 8, !tbaa !73
  %heapindex = getelementptr inbounds %struct.HeapAllocationMeta* %8, i64 0, i32 3
  %9 = load i32* %heapindex, align 4, !tbaa !121
  %idxprom15 = zext i32 %9 to i64
  %r = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom15, i32 1
  %10 = load i64* %r, align 8, !tbaa !140
  %inc17 = add i64 %10, 1
  store i64 %inc17, i64* %r, align 8, !tbaa !140
  br label %sw.epilog

sw.bb18:                                          ; preds = %if.then13
  %11 = load %struct.HeapAllocationMeta** %ptr.lcssa, align 8, !tbaa !73
  %heapindex20 = getelementptr inbounds %struct.HeapAllocationMeta* %11, i64 0, i32 3
  %12 = load i32* %heapindex20, align 4, !tbaa !121
  %idxprom21 = zext i32 %12 to i64
  %w = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom21, i32 2
  %13 = load i64* %w, align 16, !tbaa !141
  %inc23 = add i64 %13, 1
  store i64 %inc23, i64* %w, align 16, !tbaa !141
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb18, %sw.bb, %if.then13
  %Cache_Hits = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 16
  %14 = load i64* %Cache_Hits, align 8, !tbaa !137
  %inc26 = add i64 %14, 1
  store i64 %inc26, i64* %Cache_Hits, align 8, !tbaa !137
  %cmp30 = icmp eq %struct.Cache2_Item* %I.0182.lcssa, %I.0179
  br i1 %cmp30, label %return, label %if.else

if.else:                                          ; preds = %sw.epilog
  %next = getelementptr inbounds %struct.Cache2_Item* %I.0182.lcssa, i64 0, i32 1
  %15 = load %struct.Cache2_Item** %next, align 8, !tbaa !75
  %next32 = getelementptr inbounds %struct.Cache2_Item* %previous.0181.lcssa, i64 0, i32 1
  store %struct.Cache2_Item* %15, %struct.Cache2_Item** %next32, align 8, !tbaa !75
  store %struct.Cache2_Item* %I.0182.lcssa, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !72
  store %struct.Cache2_Item* %I.0179, %struct.Cache2_Item** %next, align 8, !tbaa !75
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
  %16 = load %struct.HeapAllocationMeta** %call50, align 8, !tbaa !46
  %ptr51 = getelementptr inbounds %struct.HeapAllocationMeta* %16, i64 0, i32 0
  %17 = load i8** %ptr51, align 8, !tbaa !52
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
  %18 = load i32* %heapindex56, align 4, !tbaa !121
  %idxprom57 = zext i32 %18 to i64
  %r59 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom57, i32 1
  %19 = load i64* %r59, align 8, !tbaa !140
  %inc60 = add i64 %19, 1
  store i64 %inc60, i64* %r59, align 8, !tbaa !140
  br label %return_2

sw.bb61:                                          ; preds = %if.then53
  %heapindex62 = getelementptr inbounds %struct.HeapAllocationMeta* %.lcssa, i64 0, i32 3
  %20 = load i32* %heapindex62, align 4, !tbaa !121
  %idxprom63 = zext i32 %20 to i64
  %w65 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom63, i32 2
  %21 = load i64* %w65, align 16, !tbaa !141
  %inc66 = add i64 %21, 1
  store i64 %inc66, i64* %w65, align 16, !tbaa !141
  br label %return_2

if.else69:                                        ; preds = %for.body
  %cmp71 = icmp ugt i8* %17, %AtAddress
  br i1 %cmp71, label %for.inc, label %if.else73

if.else73:                                        ; preds = %if.else69
  %upperbound74 = getelementptr inbounds %struct.HeapAllocationMeta* %16, i64 0, i32 1
  %22 = load i8** %upperbound74, align 8, !tbaa !119
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
  %23 = load i32* %heapindex79, align 4, !tbaa !121
  %idxprom80 = zext i32 %23 to i64
  %r82 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom80, i32 1
  %24 = load i64* %r82, align 8, !tbaa !140
  %inc83 = add i64 %24, 1
  store i64 %inc83, i64* %r82, align 8, !tbaa !140
  br label %return_2

sw.bb84:                                          ; preds = %if.then76
  %heapindex85 = getelementptr inbounds %struct.HeapAllocationMeta* %.lcssa202, i64 0, i32 3
  %25 = load i32* %heapindex85, align 4, !tbaa !121
  %idxprom86 = zext i32 %25 to i64
  %w88 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom86, i32 2
  %26 = load i64* %w88, align 16, !tbaa !141
  %inc89 = add i64 %26, 1
  store i64 %inc89, i64* %w88, align 16, !tbaa !141
  br label %return_2

for.inc:                                          ; preds = %if.else73, %if.else69
  %call95 = call dereferenceable(8) %"struct.std::_List_iterator"* @_ZNSt14_List_iteratorIP18HeapAllocationMetaEppEv(%"struct.std::_List_iterator"* %__begin)
  %call48 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__begin, %"struct.std::_List_iterator"* dereferenceable(8) %__end)
  br i1 %call48, label %for.body, label %if.end96.loopexit

if.end96.loopexit:                                ; preds = %for.inc
  br label %if.end96

if.end96:                                         ; preds = %if.end96.loopexit, %while.end, %entry
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %27 = load i64* %SearchMiss, align 8, !tbaa !139
  %inc99 = add i64 %27, 1
  store i64 %inc99, i64* %SearchMiss, align 8, !tbaa !139
  br label %return

return_2:                                         ; preds = %sw.bb84, %sw.bb78, %if.then76, %sw.bb61, %sw.bb55, %if.then53
  %call50201 = phi %struct.HeapAllocationMeta** [ %call50.lcssa199, %sw.bb78 ], [ %call50.lcssa199, %sw.bb84 ], [ %call50.lcssa199, %if.then76 ], [ %call50.lcssa, %sw.bb55 ], [ %call50.lcssa, %sw.bb61 ], [ %call50.lcssa, %if.then53 ]
  %loopptr.0 = load %struct.HeapAllocationMeta** %call50201, align 8
  %Cache_Miss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 15
  %28 = load i64* %Cache_Miss, align 8, !tbaa !138
  %inc102 = add i64 %28, 1
  store i64 %inc102, i64* %Cache_Miss, align 8, !tbaa !138
  %29 = load %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !72
  br label %while.cond109

while.cond109:                                    ; preds = %while.cond109, %return_2
  %previous104.0 = phi %struct.Cache2_Item* [ undef, %return_2 ], [ %I105.0, %while.cond109 ]
  %I105.0 = phi %struct.Cache2_Item* [ %29, %return_2 ], [ %30, %while.cond109 ]
  %next110 = getelementptr inbounds %struct.Cache2_Item* %I105.0, i64 0, i32 1
  %30 = load %struct.Cache2_Item** %next110, align 8, !tbaa !75
  %cmp111 = icmp eq %struct.Cache2_Item* %30, null
  br i1 %cmp111, label %while.end114, label %while.cond109

while.end114:                                     ; preds = %while.cond109
  %next110.lcssa = phi %struct.Cache2_Item** [ %next110, %while.cond109 ]
  %I105.0.lcssa = phi %struct.Cache2_Item* [ %I105.0, %while.cond109 ]
  %previous104.0.lcssa = phi %struct.Cache2_Item* [ %previous104.0, %while.cond109 ]
  %next115 = getelementptr inbounds %struct.Cache2_Item* %previous104.0.lcssa, i64 0, i32 1
  store %struct.Cache2_Item* null, %struct.Cache2_Item** %next115, align 8, !tbaa !75
  store %struct.Cache2_Item* %I105.0.lcssa, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !72
  store %struct.Cache2_Item* %29, %struct.Cache2_Item** %next110.lcssa, align 8, !tbaa !75
  %ptr129 = getelementptr inbounds %struct.Cache2_Item* %I105.0.lcssa, i64 0, i32 0
  store %struct.HeapAllocationMeta* %loopptr.0, %struct.HeapAllocationMeta** %ptr129, align 8, !tbaa !73
  br label %return

return:                                           ; preds = %while.end114, %if.end96, %if.else, %sw.epilog
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_STonly(i8* readnone %AtAddress, i8 zeroext %AccessType, i32 %thdnumber, %struct.sdmprofile__Allocated_Stack_item* %ptr) #3 {
entry:
  %idxprom = zext i32 %thdnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !135
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !135
  %Stack_allocations_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 4
  %1 = load %struct.sdmprofile__Allocated_Stack_item** %Stack_allocations_head, align 8, !tbaa !80
  %loopptr.065 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %ptr, i64 -1
  %cmp66 = icmp ult %struct.sdmprofile__Allocated_Stack_item* %loopptr.065, %1
  br i1 %cmp66, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.cond.backedge, %while.body.preheader
  %2 = phi %struct.sdmprofile__Allocated_Stack_item* [ %loopptr.068, %while.cond.backedge ], [ %ptr, %while.body.preheader ]
  %loopptr.068 = phi %struct.sdmprofile__Allocated_Stack_item* [ %loopptr.0, %while.cond.backedge ], [ %loopptr.065, %while.body.preheader ]
  %ptr3 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %2, i64 -1, i32 0
  %3 = load i8** %ptr3, align 8, !tbaa !59
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
  %4 = load i64* %stackindex, align 8, !tbaa !142
  %r = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %4, i32 1
  %5 = load i64* %r, align 8, !tbaa !109
  %inc6 = add i64 %5, 1
  store i64 %inc6, i64* %r, align 8, !tbaa !109
  br label %return_

sw.bb7:                                           ; preds = %if.then
  %stackindex8 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %.lcssa, i64 -1, i32 1
  %6 = load i64* %stackindex8, align 8, !tbaa !142
  %w = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %6, i32 2
  %7 = load i64* %w, align 8, !tbaa !110
  %inc10 = add i64 %7, 1
  store i64 %inc10, i64* %w, align 8, !tbaa !110
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
  %8 = load i8** %upperbound, align 8, !tbaa !61
  %9 = load i8** @sdmprofile__zeropointer, align 8, !tbaa !46
  %cmp15 = icmp eq i8* %8, %9
  br i1 %cmp15, label %if.then16, label %if.end

if.then16:                                        ; preds = %if.else14
  %10 = ptrtoint i8* %3 to i64
  %stackindex18 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %2, i64 -1, i32 1
  %11 = load i64* %stackindex18, align 8, !tbaa !142
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %11, i32 3
  %12 = load i32* %size, align 8, !tbaa !89
  %conv20 = zext i32 %12 to i64
  %add = add i64 %conv20, %10
  %13 = inttoptr i64 %add to i8*
  store i8* %13, i8** %upperbound, align 8, !tbaa !61
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
  %15 = load i64* %stackindex27, align 8, !tbaa !142
  %r29 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %15, i32 1
  %16 = load i64* %r29, align 8, !tbaa !109
  %inc30 = add i64 %16, 1
  store i64 %inc30, i64* %r29, align 8, !tbaa !109
  br label %return_

sw.bb31:                                          ; preds = %if.then24
  %stackindex32 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %.lcssa73, i64 -1, i32 1
  %17 = load i64* %stackindex32, align 8, !tbaa !142
  %w34 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %17, i32 2
  %18 = load i64* %w34, align 8, !tbaa !110
  %inc35 = add i64 %18, 1
  store i64 %inc35, i64* %w34, align 8, !tbaa !110
  br label %return_

while.end.loopexit:                               ; preds = %while.cond.backedge
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %19 = load i64* %SearchMiss, align 8, !tbaa !139
  %inc44 = add i64 %19, 1
  store i64 %inc44, i64* %SearchMiss, align 8, !tbaa !139
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
  %0 = load i32* @sdmprofile__profileAction, align 4, !tbaa !50
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
  %3 = load %struct.GVMeta** %call7, align 8, !tbaa !46
  %index = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 0
  %4 = load i64* %index, align 8, !tbaa !55
  %r = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 1
  %5 = load i64* %r, align 8, !tbaa !100
  %w = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 2
  %6 = load i64* %w, align 8, !tbaa !101
  %size = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 4
  %7 = load i32* %size, align 4, !tbaa !58
  %VarName = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 5
  %8 = load i8** %VarName, align 8, !tbaa !81
  %DataTypeString = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 6
  %9 = load i8** %DataTypeString, align 8, !tbaa !82
  %call8 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call, i8* getelementptr inbounds ([23 x i8]* @.str5, i64 0, i64 0), i64 %4, i64 %5, i64 %6, i32 %7, i8* %8, i8* %9) #2
  %call9 = call dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %call6 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call6, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %if.then
  %10 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE.1* %call)
  %.pr = load i32* @sdmprofile__profileAction, align 4, !tbaa !50
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  %11 = phi i32 [ %0, %entry ], [ %.pr, %for.end ]
  switch i32 %11, label %if.end34 [
    i32 4, label %if.then14
    i32 2, label %if.then14
  ]

if.then14:                                        ; preds = %if.end, %if.end
  %12 = call i64 @fwrite(i8* getelementptr inbounds ([124 x i8]* @.str7, i64 0, i64 0), i64 123, i64 1, %struct._IO_FILE.1* %call)
  %13 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !111
  %cmp1784 = icmp eq i64 %13, 0
  br i1 %cmp1784, label %for.end32, label %for.body18.preheader

for.body18.preheader:                             ; preds = %if.then14
  br label %for.body18

for.body18:                                       ; preds = %for.body18, %for.body18.preheader
  %ix.085 = phi i64 [ %inc, %for.body18 ], [ 0, %for.body18.preheader ]
  %index19 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 0
  %14 = load i64* %index19, align 8, !tbaa !87
  %r21 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 1
  %15 = load i64* %r21, align 8, !tbaa !109
  %w23 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 2
  %16 = load i64* %w23, align 8, !tbaa !110
  %size25 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 3
  %17 = load i32* %size25, align 8, !tbaa !89
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 4
  %18 = load i8** %EstimatedName, align 8, !tbaa !90
  %DataTypeString28 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 5
  %19 = load i8** %DataTypeString28, align 8, !tbaa !91
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 6
  %20 = load i8** %FunctionName, align 8, !tbaa !92
  %call30 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call, i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i64 %14, i64 %15, i64 %16, i32 %17, i8* %18, i8* %19, i8* %20) #2
  %inc = add i64 %ix.085, 1
  %21 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !111
  %cmp17 = icmp ult i64 %inc, %21
  br i1 %cmp17, label %for.body18, label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.body18
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %if.then14
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE.1* %call)
  %.pre = load i32* @sdmprofile__profileAction, align 4, !tbaa !50
  br label %if.end34

if.end34:                                         ; preds = %for.end32, %if.end
  %23 = phi i32 [ %11, %if.end ], [ %.pre, %for.end32 ]
  switch i32 %23, label %if.end55 [
    i32 4, label %if.then38
    i32 1, label %if.then38
  ]

if.then38:                                        ; preds = %if.end34, %if.end34
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([171 x i8]* @.str9, i64 0, i64 0), i64 170, i64 1, %struct._IO_FILE.1* %call)
  %25 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !111
  %cmp4282 = icmp eq i64 %25, 0
  br i1 %cmp4282, label %for.end53, label %for.body43.preheader

for.body43.preheader:                             ; preds = %if.then38
  br label %for.body43

for.body43:                                       ; preds = %for.body43, %for.body43.preheader
  %ix40.083 = phi i64 [ %inc52, %for.body43 ], [ 0, %for.body43.preheader ]
  %arrayidx44 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083
  store %struct.HPMeta* %arrayidx44, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !46
  %index45 = getelementptr inbounds %struct.HPMeta* %arrayidx44, i64 0, i32 0
  %26 = load i32* %index45, align 16, !tbaa !93
  %r46 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 1
  %27 = load i64* %r46, align 8, !tbaa !140
  %w47 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 2
  %28 = load i64* %w47, align 16, !tbaa !141
  %EstimatedName48 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 3
  %29 = load i8** %EstimatedName48, align 8, !tbaa !95
  %EstimatedDataTypeString = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 4
  %30 = load i8** %EstimatedDataTypeString, align 16, !tbaa !96
  %FunctionName49 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 5
  %31 = load i8** %FunctionName49, align 8, !tbaa !97
  %linenumber = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 6
  %32 = load i64* %linenumber, align 16, !tbaa !98
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 7
  %33 = load i8** %SourceFile, align 8, !tbaa !99
  %hitcount = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 8
  %34 = load i64* %hitcount, align 16, !tbaa !124
  %MinSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 10
  %35 = load i64* %MinSize, align 16, !tbaa !126
  %MaxSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 9
  %36 = load i64* %MaxSize, align 8, !tbaa !125
  %call50 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call, i8* getelementptr inbounds ([43 x i8]* @.str10, i64 0, i64 0), i32 %26, i64 %27, i64 %28, i32 0, i8* %29, i8* %30, i8* %31, i64 %32, i8* %33, i64 %34, i64 %35, i64 %36) #2
  %inc52 = add i64 %ix40.083, 1
  %37 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !111
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
  store double %call, double* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 3), align 8, !tbaa !71
  %call1 = tail call %struct._IO_FILE.1* @fopen(i8* getelementptr inbounds ([18 x i8]* @.str11, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0)) #2
  %0 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str12, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE.1* %call1)
  %1 = load i64* @sdmprofile__BBcount, align 8, !tbaa !111
  %cmp167 = icmp eq i64 %1, 0
  br i1 %cmp167, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %ix.0168 = phi i64 [ %inc, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds [5000 x i64]* @BBhits, i64 0, i64 %ix.0168
  %2 = load i64* %arrayidx, align 8, !tbaa !111
  %call3 = tail call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call1, i8* getelementptr inbounds ([9 x i8]* @.str13, i64 0, i64 0), i64 %ix.0168, i64 %2) #2
  %inc = add i64 %ix.0168, 1
  %3 = load i64* @sdmprofile__BBcount, align 8, !tbaa !111
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
  %5 = load %struct._IO_FILE.1** @stderr, align 8, !tbaa !46
  %fputs = call i32 @fputs(i8* %4, %struct._IO_FILE.1* %5) #17
  br label %cleanup

if.end:                                           ; preds = %for.end
  %6 = load i32* @sdmprofile__profileAction, align 4, !tbaa !50
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
  %8 = load %struct.GVMeta** %call16, align 8, !tbaa !46
  %DataTypeString = getelementptr inbounds %struct.GVMeta* %8, i64 0, i32 6
  %9 = load i8** %DataTypeString, align 8, !tbaa !82
  call void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* %typestring, i8* %9, %"class.std::allocator.6"* dereferenceable(1) %ref.tmp) #2
  %call17 = call i8* @_ZNSs5beginEv(%"class.std::basic_string"* %typestring) #2
  %call20 = call i8* @_ZNSs3endEv(%"class.std::basic_string"* %typestring) #2
  store i8 44, i8* %ref.tmp22, align 1, !tbaa !143
  store i8 59, i8* %ref.tmp23, align 1, !tbaa !143
  call void @_ZSt7replaceIN9__gnu_cxx17__normal_iteratorIPcSsEEcEvT_S4_RKT0_S7_(i8* %call17, i8* %call20, i8* dereferenceable(1) %ref.tmp22, i8* dereferenceable(1) %ref.tmp23)
  %inc26 = add nsw i32 %variable_count.0164, 1
  %10 = load %struct.GVMeta** %call16, align 8, !tbaa !46
  %r = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 1
  %11 = load i64* %r, align 8, !tbaa !100
  %w = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 2
  %12 = load i64* %w, align 8, !tbaa !101
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
  %13 = load i64* %linenumber, align 8, !tbaa !86
  %tobool = icmp eq i64 %13, 0
  br i1 %tobool, label %if.end44, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.then35
  %FileName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 8
  %14 = load i8** %FileName, align 8, !tbaa !84
  %call36 = call i32 @strcmp(i8* %14, i8* getelementptr inbounds ([2 x i8]* @.str17, i64 0, i64 0)) #18
  %tobool37 = icmp eq i32 %call36, 0
  br i1 %tobool37, label %if.end44, label %if.then38

if.then38:                                        ; preds = %land.lhs.true
  %VarName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 5
  %15 = load i8** %VarName, align 8, !tbaa !81
  %DirName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 9
  %16 = load i8** %DirName, align 8, !tbaa !85
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
  %.pr = load i32* @sdmprofile__profileAction, align 4, !tbaa !50
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
  %19 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !111
  %cmp58160 = icmp eq i64 %19, 0
  br i1 %cmp58160, label %for.end73, label %for.body59.preheader

for.body59.preheader:                             ; preds = %if.then54
  br label %for.body59

for.body59:                                       ; preds = %for.body59, %for.body59.preheader
  %ix56.0161 = phi i64 [ %inc72, %for.body59 ], [ 0, %for.body59.preheader ]
  %index = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 0
  %20 = load i64* %index, align 8, !tbaa !87
  %r62 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 1
  %21 = load i64* %r62, align 8, !tbaa !109
  %w64 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 2
  %22 = load i64* %w64, align 8, !tbaa !110
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 3
  %23 = load i32* %size, align 8, !tbaa !89
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 4
  %24 = load i8** %EstimatedName, align 8, !tbaa !90
  %DataTypeString68 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 5
  %25 = load i8** %DataTypeString68, align 8, !tbaa !91
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 6
  %26 = load i8** %FunctionName, align 8, !tbaa !92
  %call70 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call4, i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i64 %20, i64 %21, i64 %22, i32 %23, i8* %24, i8* %25, i8* %26) #2
  %inc72 = add i64 %ix56.0161, 1
  %27 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !111
  %cmp58 = icmp ult i64 %inc72, %27
  br i1 %cmp58, label %for.body59, label %for.end73.loopexit

for.end73.loopexit:                               ; preds = %for.body59
  br label %for.end73

for.end73:                                        ; preds = %for.end73.loopexit, %if.then54
  %28 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE.1* %call4)
  %.pre = load i32* @sdmprofile__profileAction, align 4, !tbaa !50
  br label %if.end75

if.end75:                                         ; preds = %for.end73, %if.end50
  %29 = phi i32 [ %17, %if.end50 ], [ %.pre, %for.end73 ]
  switch i32 %29, label %if.end112 [
    i32 4, label %for.cond81.preheader
    i32 1, label %for.cond81.preheader
  ]

for.cond81.preheader:                             ; preds = %if.end75, %if.end75
  %30 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !111
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
  store %struct.HPMeta* %arrayidx85, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !46
  %r86 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 1
  %32 = load i64* %r86, align 8, !tbaa !140
  %cmp99 = icmp eq i64 %32, 0
  br i1 %cmp99, label %if.end106, label %if.then100

if.then100:                                       ; preds = %for.body84
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 7
  %33 = load i8** %SourceFile, align 8, !tbaa !99
  %linenumber101 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 6
  %34 = load i64* %linenumber101, align 16, !tbaa !98
  %FunctionName102 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 5
  %35 = load i8** %FunctionName102, align 8, !tbaa !97
  %EstimatedName103 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 3
  %36 = load i8** %EstimatedName103, align 8, !tbaa !95
  %call104 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call4, i8* getelementptr inbounds ([14 x i8]* @.str22, i64 0, i64 0), i8* %33, i64 %34, i8* %35, i8* %36) #2
  %inc105 = add nsw i32 %nv_variable_count.3156, 1
  %.pre169 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !111
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
  %0 = load i8* %call2, align 1, !tbaa !143
  %1 = load i8* %__old_value, align 1, !tbaa !143
  %cmp = icmp eq i8 %0, %1
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %2 = load i8* %__new_value, align 1, !tbaa !143
  store i8 %2, i8* %call2, align 1, !tbaa !143
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
  store i8* %call, i8** %ref.tmp, align 8, !tbaa !46
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
  store i8* %add.ptr, i8** %ref.tmp, align 8, !tbaa !46
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
  %0 = load i32* @thdsCount, align 4, !tbaa !50
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
  %2 = load i64* %threadID, align 8, !tbaa !69
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
  %0 = load i8** %call, align 8, !tbaa !46
  %call1 = tail call dereferenceable(8) i8** @_ZNK9__gnu_cxx17__normal_iteratorIPcSsE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %__rhs)
  %1 = load i8** %call1, align 8, !tbaa !46
  %cmp = icmp ne i8* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(1) i8* @_ZNK9__gnu_cxx17__normal_iteratorIPcSsEdeEv(%"class.__gnu_cxx::__normal_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %_M_current, align 8, !tbaa !144
  ret i8* %0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden dereferenceable(8) %"class.__gnu_cxx::__normal_iterator"* @_ZN9__gnu_cxx17__normal_iteratorIPcSsEppEv(%"class.__gnu_cxx::__normal_iterator"* %this) #3 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %_M_current, align 8, !tbaa !144
  %incdec.ptr = getelementptr inbounds i8* %0, i64 1
  store i8* %incdec.ptr, i8** %_M_current, align 8, !tbaa !144
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
  %0 = load i8** %_M_p, align 8, !tbaa !146
  ret i8* %0
}

; Function Attrs: noinline nounwind readonly uwtable
define available_externally i64 @_ZNKSs4sizeEv(%"class.std::basic_string"* nocapture readonly %this) #4 align 2 {
entry:
  %call = tail call %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* @_ZNKSs6_M_repEv(%"class.std::basic_string"* %this)
  %_M_length = getelementptr inbounds %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* %call, i64 0, i32 0, i32 0
  %0 = load i64* %_M_length, align 8, !tbaa !149
  ret i64 %0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZN9__gnu_cxx17__normal_iteratorIPcSsEC2ERKS1_(%"class.__gnu_cxx::__normal_iterator"* nocapture %this, i8** nocapture readonly dereferenceable(8) %__i) unnamed_addr #3 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %__i, align 8, !tbaa !46
  store i8* %0, i8** %_M_current, align 8, !tbaa !144
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
  %0 = load i32* %_M_refcount, align 4, !tbaa !151
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
  store %"struct.std::__detail::_List_node_base"* %__x, %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !132
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
  %1 = load %struct.HeapAllocationMeta** %call, align 8, !tbaa !46
  store %struct.HeapAllocationMeta* %1, %struct.HeapAllocationMeta** %_M_data, align 8, !tbaa !152
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
  tail call void @_ZSt17__throw_bad_allocv() #19
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
  store %"struct.std::_Fwd_list_node_base"* %__n, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !106
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr %"struct.std::_Fwd_list_node_base"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE15_M_insert_afterIJRKS1_EEEPSt19_Fwd_list_node_baseSt24_Fwd_list_const_iteratorIS1_EDpOT_(%"struct.std::_Fwd_list_base"* %this, %"struct.std::_Fwd_list_node_base"* nocapture %__pos.coerce, %struct.GVMeta** dereferenceable(8) %__args) #3 align 2 {
entry:
  %call = tail call dereferenceable(8) %struct.GVMeta** @_ZSt7forwardIRKP6GVMetaEOT_RNSt16remove_referenceIS4_E4typeE(%struct.GVMeta** dereferenceable(8) %__args) #2
  %call2 = tail call %"struct.std::_Fwd_list_node"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_M_create_nodeIJRKS1_EEEPSt14_Fwd_list_nodeIS1_EDpOT_(%"struct.std::_Fwd_list_base"* %this, %struct.GVMeta** dereferenceable(8) %call)
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__pos.coerce, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !108
  %1 = getelementptr inbounds %"struct.std::_Fwd_list_node"* %call2, i64 0, i32 0
  %_M_next3 = getelementptr inbounds %"struct.std::_Fwd_list_node"* %call2, i64 0, i32 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* %0, %"struct.std::_Fwd_list_node_base"** %_M_next3, align 8, !tbaa !108
  store %"struct.std::_Fwd_list_node_base"* %1, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !108
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
  store %"struct.std::_Fwd_list_node_base"* %__n, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !154
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
  %0 = load %struct.GVMeta** %call, align 8, !tbaa !46
  store %struct.GVMeta* %0, %struct.GVMeta** %__p, align 8, !tbaa !46
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
  tail call void @_ZSt17__throw_bad_allocv() #19
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
  store %"struct.std::__detail::_List_node_base"* %_M_node, %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !128
  %_M_prev = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0, i32 1
  store %"struct.std::__detail::_List_node_base"* %_M_node, %"struct.std::__detail::_List_node_base"** %_M_prev, align 8, !tbaa !156
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr %"struct.std::_Fwd_list_node_base"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_M_erase_afterEPSt19_Fwd_list_node_baseS5_(%"struct.std::_Fwd_list_base"* readnone %this, %"struct.std::_Fwd_list_node_base"* nocapture %__pos, %"struct.std::_Fwd_list_node_base"* %__last) #3 align 2 {
entry:
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__pos, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !108
  %cmp12 = icmp eq %"struct.std::_Fwd_list_node_base"* %0, %__last
  br i1 %cmp12, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.preheader
  %__curr.0.in13 = phi %"struct.std::_Fwd_list_node_base"* [ %1, %while.body ], [ %0, %while.body.preheader ]
  %__curr.0 = bitcast %"struct.std::_Fwd_list_node_base"* %__curr.0.in13 to %"struct.std::_Fwd_list_node"*
  %_M_next2 = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__curr.0.in13, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_next2, align 8, !tbaa !108
  tail call void @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE11_M_put_nodeEPSt14_Fwd_list_nodeIS1_E(%"struct.std::_Fwd_list_base"* %this, %"struct.std::_Fwd_list_node"* %__curr.0)
  %cmp = icmp eq %"struct.std::_Fwd_list_node_base"* %1, %__last
  br i1 %cmp, label %while.end.loopexit, label %while.body

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  store %"struct.std::_Fwd_list_node_base"* %__last, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !108
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
  store %"struct.std::_Fwd_list_node_base"* null, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !108
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
  br i1 %cmp, label %if.end5, label %if.then, !prof !157

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
  %0 = load i32* %__mem, align 4, !tbaa !50
  %add = add nsw i32 %0, -1
  store i32 %add, i32* %__mem, align 4, !tbaa !50
  ret i32 %0
}

; Function Attrs: nounwind
declare extern_weak i32 @__pthread_key_create(i32*, void (i8*)*) #1

; Function Attrs: noinline nounwind uwtable
define linkonce_odr void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE8_M_clearEv(%"class.std::_List_base"* readonly %this) #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0
  %_M_next = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !128
  %cmp8 = icmp eq %"struct.std::__detail::_List_node_base"* %0, %_M_node
  br i1 %cmp8, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.preheader
  %__cur.0.in9 = phi %"struct.std::__detail::_List_node_base"* [ %1, %while.body ], [ %0, %while.body.preheader ]
  %__cur.0 = bitcast %"struct.std::__detail::_List_node_base"* %__cur.0.in9 to %"struct.std::_List_node"*
  %_M_next4 = getelementptr inbounds %"struct.std::__detail::_List_node_base"* %__cur.0.in9, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_next4, align 8, !tbaa !134
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

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #12

declare i32 @printf(i8*, ...) #13

; Function Attrs: noreturn nounwind
declare void @exit(i32) #14

declare i32 @strncmp(i8*, i8*, i64) #13

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #15

; Function Attrs: nounwind
declare void @srand(i32) #16

; Function Attrs: nounwind
declare i32 @rand() #16

; Function Attrs: nounwind
declare double @cos(double) #16

; Function Attrs: nounwind
declare double @sin(double) #16

; Function Attrs: nounwind uwtable
define i32 @IsPowerOfTwo_original(i32 %x) #11 {
  %x_st = alloca i32
  %thdnumber_st = alloca i32
  store i32 %x, i32* %x_st, align 4
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i32* %x_st
  %3 = call i32 @IsPowerOfTwo(i32 %2, i32 %1)
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @NumberOfBitsNeeded_original(i32 %PowerOfTwo) #11 {
  %PowerOfTwo_st = alloca i32
  %thdnumber_st = alloca i32
  store i32 %PowerOfTwo, i32* %PowerOfTwo_st, align 4
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i32* %PowerOfTwo_st
  %3 = call i32 @NumberOfBitsNeeded(i32 %2, i32 %1)
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ReverseBits_original(i32 %index, i32 %NumBits) #11 {
  %index_st = alloca i32
  %NumBits_st = alloca i32
  %thdnumber_st = alloca i32
  store i32 %index, i32* %index_st, align 4
  store i32 %NumBits, i32* %NumBits_st, align 4
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i32* %index_st
  %3 = load i32* %NumBits_st
  %4 = call i32 @ReverseBits(i32 %2, i32 %3, i32 %1)
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define double @Index_to_frequency_original(i32 %NumSamples, i32 %Index) #11 {
  %NumSamples_st = alloca i32
  %Index_st = alloca i32
  %thdnumber_st = alloca i32
  store i32 %NumSamples, i32* %NumSamples_st, align 4
  store i32 %Index, i32* %Index_st, align 4
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i32* %NumSamples_st
  %3 = load i32* %Index_st
  %4 = call double @Index_to_frequency(i32 %2, i32 %3, i32 %1)
  ret double %4
}

; Function Attrs: nounwind uwtable
define void @fft_float_original(i32 %NumSamples, i32 %InverseTransform, float* %RealIn, float* %ImagIn, float* %RealOut, float* %ImagOut) #11 {
  %NumSamples_st = alloca i32
  %InverseTransform_st = alloca i32
  %RealIn_st = alloca float*
  %ImagIn_st = alloca float*
  %RealOut_st = alloca float*
  %ImagOut_st = alloca float*
  %thdnumber_st = alloca i32
  store i32 %NumSamples, i32* %NumSamples_st, align 4
  store i32 %InverseTransform, i32* %InverseTransform_st, align 4
  store float* %RealIn, float** %RealIn_st, align 8
  store float* %ImagIn, float** %ImagIn_st, align 8
  store float* %RealOut, float** %RealOut_st, align 8
  store float* %ImagOut, float** %ImagOut_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i32* %NumSamples_st
  %3 = load i32* %InverseTransform_st
  %4 = load float** %RealIn_st
  %5 = load float** %ImagIn_st
  %6 = load float** %RealOut_st
  %7 = load float** %ImagOut_st
  call void @fft_float(i32 %2, i32 %3, float* %4, float* %5, float* %6, float* %7, i32 %1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @CheckPointer_original(i8* %p, i8* %name) #11 {
  %p_st = alloca i8*
  %name_st = alloca i8*
  %thdnumber_st = alloca i32
  store i8* %p, i8** %p_st, align 8
  store i8* %name, i8** %name_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i8** %p_st
  %3 = load i8** %name_st
  call void @CheckPointer(i8* %2, i8* %3, i32 %1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @CheckPointer(i8* %p, i8* %name, i32 %sdmprofile__threadnumber) #11 {
entry:
  %p.addr = alloca i8*, align 8
  %name.addr = alloca i8*, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_1, i64 1 seq_cst, !dbg !158
  call void @llvm.dbg.declare(metadata !{i8** %p.addr}, metadata !159), !dbg !158
  store i8* %name, i8** %name.addr, align 8
  call void @llvm.dbg.declare(metadata !{i8** %name.addr}, metadata !160), !dbg !161
  %1 = load i8** %p.addr, align 8, !dbg !162
  %cmp = icmp eq i8* %1, null, !dbg !162
  br i1 %cmp, label %if.then, label %if.end, !dbg !162

if.then:                                          ; preds = %entry
  %2 = atomicrmw add i64* @sdmprofile__BBcounter_2, i64 1 seq_cst, !dbg !164
  %3 = load %struct._IO_FILE.1** @stderr, align 8, !dbg !164
  %4 = load i8** %name.addr, align 8, !dbg !164
  %call = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %3, i8* getelementptr inbounds ([35 x i8]* @.str414, i32 0, i32 0), i8* %4), !dbg !164
  call void @exit(i32 1) #19, !dbg !166
  unreachable, !dbg !166

if.end:                                           ; preds = %entry
  %5 = atomicrmw add i64* @sdmprofile__BBcounter_3, i64 1 seq_cst, !dbg !167
  ret void, !dbg !167
}

; Function Attrs: nounwind uwtable
define double @Index_to_frequency(i32 %NumSamples, i32 %Index, i32 %sdmprofile__threadnumber) #11 {
entry:
  %retval = alloca double, align 8
  %NumSamples.addr = alloca i32, align 4
  %Index.addr = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32 %NumSamples, i32* %NumSamples.addr, align 4
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_4, i64 1 seq_cst, !dbg !168
  call void @llvm.dbg.declare(metadata !{i32* %NumSamples.addr}, metadata !169), !dbg !168
  store i32 %Index, i32* %Index.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %Index.addr}, metadata !170), !dbg !171
  %1 = load i32* %Index.addr, align 4, !dbg !172
  %2 = load i32* %NumSamples.addr, align 4, !dbg !172
  %cmp = icmp uge i32 %1, %2, !dbg !172
  br i1 %cmp, label %if.then, label %if.else, !dbg !172

if.then:                                          ; preds = %entry
  %3 = atomicrmw add i64* @sdmprofile__BBcounter_5, i64 1 seq_cst, !dbg !174
  store double 0.000000e+00, double* %retval, !dbg !174
  br label %return, !dbg !174

if.else:                                          ; preds = %entry
  %4 = atomicrmw add i64* @sdmprofile__BBcounter_6, i64 1 seq_cst, !dbg !175
  %5 = load i32* %Index.addr, align 4, !dbg !175
  %6 = load i32* %NumSamples.addr, align 4, !dbg !175
  %div = udiv i32 %6, 2, !dbg !175
  %cmp1 = icmp ule i32 %5, %div, !dbg !175
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !175

if.then2:                                         ; preds = %if.else
  %7 = atomicrmw add i64* @sdmprofile__BBcounter_7, i64 1 seq_cst, !dbg !177
  %8 = load i32* %Index.addr, align 4, !dbg !177
  %conv = uitofp i32 %8 to double, !dbg !177
  %9 = load i32* %NumSamples.addr, align 4, !dbg !177
  %conv3 = uitofp i32 %9 to double, !dbg !177
  %div4 = fdiv double %conv, %conv3, !dbg !177
  store double %div4, double* %retval, !dbg !177
  br label %return, !dbg !177

if.end:                                           ; preds = %if.else
  %10 = atomicrmw add i64* @sdmprofile__BBcounter_8, i64 1 seq_cst
  br label %if.end5

if.end5:                                          ; preds = %if.end
  %11 = atomicrmw add i64* @sdmprofile__BBcounter_9, i64 1 seq_cst, !dbg !178
  %12 = load i32* %NumSamples.addr, align 4, !dbg !178
  %13 = load i32* %Index.addr, align 4, !dbg !178
  %sub = sub i32 %12, %13, !dbg !178
  %conv6 = uitofp i32 %sub to double, !dbg !178
  %sub7 = fsub double -0.000000e+00, %conv6, !dbg !178
  %14 = load i32* %NumSamples.addr, align 4, !dbg !178
  %conv8 = uitofp i32 %14 to double, !dbg !178
  %div9 = fdiv double %sub7, %conv8, !dbg !178
  store double %div9, double* %retval, !dbg !178
  br label %return, !dbg !178

return:                                           ; preds = %if.end5, %if.then2, %if.then
  %15 = atomicrmw add i64* @sdmprofile__BBcounter_10, i64 1 seq_cst, !dbg !179
  %16 = load double* %retval, !dbg !179
  ret double %16, !dbg !179
}

; Function Attrs: nounwind uwtable
define i32 @IsPowerOfTwo(i32 %x, i32 %sdmprofile__threadnumber) #11 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_11, i64 1 seq_cst, !dbg !180
  call void @llvm.dbg.declare(metadata !{i32* %x.addr}, metadata !181), !dbg !180
  %1 = load i32* %x.addr, align 4, !dbg !182
  %cmp = icmp ult i32 %1, 2, !dbg !182
  br i1 %cmp, label %if.then, label %if.end, !dbg !182

if.then:                                          ; preds = %entry
  %2 = atomicrmw add i64* @sdmprofile__BBcounter_12, i64 1 seq_cst, !dbg !184
  store i32 0, i32* %retval, !dbg !184
  br label %return, !dbg !184

if.end:                                           ; preds = %entry
  %3 = atomicrmw add i64* @sdmprofile__BBcounter_13, i64 1 seq_cst, !dbg !185
  %4 = load i32* %x.addr, align 4, !dbg !185
  %5 = load i32* %x.addr, align 4, !dbg !185
  %sub = sub i32 %5, 1, !dbg !185
  %and = and i32 %4, %sub, !dbg !185
  %tobool = icmp ne i32 %and, 0, !dbg !185
  br i1 %tobool, label %if.then1, label %if.end2, !dbg !185

if.then1:                                         ; preds = %if.end
  %6 = atomicrmw add i64* @sdmprofile__BBcounter_14, i64 1 seq_cst, !dbg !187
  store i32 0, i32* %retval, !dbg !187
  br label %return, !dbg !187

if.end2:                                          ; preds = %if.end
  %7 = atomicrmw add i64* @sdmprofile__BBcounter_15, i64 1 seq_cst, !dbg !188
  store i32 1, i32* %retval, !dbg !188
  br label %return, !dbg !188

return:                                           ; preds = %if.end2, %if.then1, %if.then
  %8 = atomicrmw add i64* @sdmprofile__BBcounter_16, i64 1 seq_cst, !dbg !189
  %9 = load i32* %retval, !dbg !189
  ret i32 %9, !dbg !189
}

; Function Attrs: nounwind uwtable
define i32 @NumberOfBitsNeeded(i32 %PowerOfTwo, i32 %sdmprofile__threadnumber) #11 {
entry:
  %PowerOfTwo.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32 %PowerOfTwo, i32* %PowerOfTwo.addr, align 4
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_17, i64 1 seq_cst, !dbg !190
  call void @llvm.dbg.declare(metadata !{i32* %PowerOfTwo.addr}, metadata !191), !dbg !190
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !192), !dbg !193
  %1 = load i32* %PowerOfTwo.addr, align 4, !dbg !194
  %cmp = icmp ult i32 %1, 2, !dbg !194
  br i1 %cmp, label %if.then, label %if.end, !dbg !194

if.then:                                          ; preds = %entry
  %2 = atomicrmw add i64* @sdmprofile__BBcounter_18, i64 1 seq_cst, !dbg !196
  %3 = load %struct._IO_FILE.1** @stderr, align 8, !dbg !196
  %4 = load i32* %PowerOfTwo.addr, align 4, !dbg !196
  %call = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %3, i8* getelementptr inbounds ([73 x i8]* @.str913, i32 0, i32 0), i32 %4), !dbg !196
  call void @exit(i32 1) #19, !dbg !198
  unreachable, !dbg !198

if.end:                                           ; preds = %entry
  %5 = atomicrmw add i64* @sdmprofile__BBcounter_19, i64 1 seq_cst, !dbg !199
  store i32 0, i32* %i, align 4, !dbg !199
  br label %for.cond, !dbg !199

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = atomicrmw add i64* @sdmprofile__BBcounter_20, i64 1 seq_cst, !dbg !201
  %7 = load i32* %PowerOfTwo.addr, align 4, !dbg !201
  %8 = load i32* %i, align 4, !dbg !201
  %shl = shl i32 1, %8, !dbg !201
  %and = and i32 %7, %shl, !dbg !201
  %tobool = icmp ne i32 %and, 0, !dbg !201
  br i1 %tobool, label %if.then1, label %if.end2, !dbg !201

if.then1:                                         ; preds = %for.cond
  %9 = atomicrmw add i64* @sdmprofile__BBcounter_21, i64 1 seq_cst, !dbg !204
  %10 = load i32* %i, align 4, !dbg !204
  ret i32 %10, !dbg !204

if.end2:                                          ; preds = %for.cond
  %11 = atomicrmw add i64* @sdmprofile__BBcounter_22, i64 1 seq_cst, !dbg !205
  br label %for.inc, !dbg !205

for.inc:                                          ; preds = %if.end2
  %12 = atomicrmw add i64* @sdmprofile__BBcounter_23, i64 1 seq_cst, !dbg !206
  %13 = load i32* %i, align 4, !dbg !206
  %inc = add i32 %13, 1, !dbg !206
  store i32 %inc, i32* %i, align 4, !dbg !206
  br label %for.cond, !dbg !206
}

; Function Attrs: nounwind uwtable
define i32 @ReverseBits(i32 %index, i32 %NumBits, i32 %sdmprofile__threadnumber) #11 {
entry:
  %index.addr = alloca i32, align 4
  %NumBits.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %rev = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32 %index, i32* %index.addr, align 4
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_24, i64 1 seq_cst, !dbg !207
  call void @llvm.dbg.declare(metadata !{i32* %index.addr}, metadata !208), !dbg !207
  store i32 %NumBits, i32* %NumBits.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %NumBits.addr}, metadata !209), !dbg !210
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !211), !dbg !212
  call void @llvm.dbg.declare(metadata !{i32* %rev}, metadata !213), !dbg !214
  store i32 0, i32* %rev, align 4, !dbg !215
  store i32 0, i32* %i, align 4, !dbg !215
  br label %for.cond, !dbg !215

for.cond:                                         ; preds = %for.inc, %entry
  %1 = atomicrmw add i64* @sdmprofile__BBcounter_25, i64 1 seq_cst, !dbg !217
  %2 = load i32* %i, align 4, !dbg !217
  %3 = load i32* %NumBits.addr, align 4, !dbg !217
  %cmp = icmp ult i32 %2, %3, !dbg !217
  br i1 %cmp, label %for.body, label %for.end, !dbg !217

for.body:                                         ; preds = %for.cond
  %4 = atomicrmw add i64* @sdmprofile__BBcounter_26, i64 1 seq_cst, !dbg !220
  %5 = load i32* %rev, align 4, !dbg !220
  %shl = shl i32 %5, 1, !dbg !220
  %6 = load i32* %index.addr, align 4, !dbg !220
  %and = and i32 %6, 1, !dbg !220
  %or = or i32 %shl, %and, !dbg !220
  store i32 %or, i32* %rev, align 4, !dbg !220
  %7 = load i32* %index.addr, align 4, !dbg !222
  %shr = lshr i32 %7, 1, !dbg !222
  store i32 %shr, i32* %index.addr, align 4, !dbg !222
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %for.body
  %8 = atomicrmw add i64* @sdmprofile__BBcounter_27, i64 1 seq_cst, !dbg !224
  %9 = load i32* %i, align 4, !dbg !224
  %inc = add i32 %9, 1, !dbg !224
  store i32 %inc, i32* %i, align 4, !dbg !224
  br label %for.cond, !dbg !224

for.end:                                          ; preds = %for.cond
  %10 = atomicrmw add i64* @sdmprofile__BBcounter_28, i64 1 seq_cst, !dbg !225
  %11 = load i32* %rev, align 4, !dbg !225
  ret i32 %11, !dbg !225
}

; Function Attrs: nounwind uwtable
define void @fft_float(i32 %NumSamples, i32 %InverseTransform, float* %RealIn, float* %ImagIn, float* %RealOut, float* %ImagOut, i32 %sdmprofile__threadnumber) #11 {
entry:
  %NumSamples.addr = alloca i32, align 4
  %InverseTransform.addr = alloca i32, align 4
  %RealIn.addr = alloca float*, align 8
  %ImagIn.addr = alloca float*, align 8
  %RealOut.addr = alloca float*, align 8
  %ImagOut.addr = alloca float*, align 8
  %NumBits = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %n = alloca i32, align 4
  %BlockSize = alloca i32, align 4
  %BlockEnd = alloca i32, align 4
  %angle_numerator = alloca double, align 8
  %tr = alloca double, align 8
  %ti = alloca double, align 8
  %delta_angle = alloca double, align 8
  %sm2 = alloca double, align 8
  %sm1 = alloca double, align 8
  %cm2 = alloca double, align 8
  %cm1 = alloca double, align 8
  %w = alloca double, align 8
  %ar = alloca [3 x double], align 16
  %ai = alloca [3 x double], align 16
  %temp = alloca double, align 8
  %denom = alloca double, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32 %NumSamples, i32* %NumSamples.addr, align 4
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_59, i64 1 seq_cst, !dbg !226
  call void @llvm.dbg.declare(metadata !{i32* %NumSamples.addr}, metadata !227), !dbg !226
  store i32 %InverseTransform, i32* %InverseTransform.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %InverseTransform.addr}, metadata !228), !dbg !229
  store float* %RealIn, float** %RealIn.addr, align 8
  call void @llvm.dbg.declare(metadata !{float** %RealIn.addr}, metadata !230), !dbg !231
  store float* %ImagIn, float** %ImagIn.addr, align 8
  call void @llvm.dbg.declare(metadata !{float** %ImagIn.addr}, metadata !232), !dbg !233
  store float* %RealOut, float** %RealOut.addr, align 8
  call void @llvm.dbg.declare(metadata !{float** %RealOut.addr}, metadata !234), !dbg !235
  store float* %ImagOut, float** %ImagOut.addr, align 8
  call void @llvm.dbg.declare(metadata !{float** %ImagOut.addr}, metadata !236), !dbg !237
  call void @llvm.dbg.declare(metadata !{i32* %NumBits}, metadata !238), !dbg !239
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !240), !dbg !241
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !242), !dbg !243
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !244), !dbg !245
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !246), !dbg !247
  call void @llvm.dbg.declare(metadata !{i32* %BlockSize}, metadata !248), !dbg !249
  call void @llvm.dbg.declare(metadata !{i32* %BlockEnd}, metadata !250), !dbg !251
  call void @llvm.dbg.declare(metadata !{double* %angle_numerator}, metadata !252), !dbg !253
  store double 0x401921FB54442D18, double* %angle_numerator, align 8, !dbg !254
  call void @llvm.dbg.declare(metadata !{double* %tr}, metadata !255), !dbg !256
  call void @llvm.dbg.declare(metadata !{double* %ti}, metadata !257), !dbg !258
  %1 = load i32* %NumSamples.addr, align 4, !dbg !259
  %sdmprofile__LD4 = load i32* %sdmprofile__threadnumber_st, align 8
  %2 = call i32 @IsPowerOfTwo(i32 %1, i32 %sdmprofile__LD4), !dbg !259
  %tobool = icmp ne i32 %2, 0, !dbg !259
  br i1 %tobool, label %if.end, label %if.then, !dbg !259

if.then:                                          ; preds = %entry
  %3 = atomicrmw add i64* @sdmprofile__BBcounter_60, i64 1 seq_cst, !dbg !261
  %4 = load %struct._IO_FILE.1** @stderr, align 8, !dbg !261
  %5 = load i32* %NumSamples.addr, align 4, !dbg !261
  %call1 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %4, i8* getelementptr inbounds ([52 x i8]* @.str1014, i32 0, i32 0), i32 %5), !dbg !261
  call void @exit(i32 1) #19, !dbg !263
  unreachable, !dbg !263

if.end:                                           ; preds = %entry
  %6 = atomicrmw add i64* @sdmprofile__BBcounter_61, i64 1 seq_cst, !dbg !264
  %7 = load i32* %InverseTransform.addr, align 4, !dbg !264
  %tobool2 = icmp ne i32 %7, 0, !dbg !264
  br i1 %tobool2, label %if.then3, label %if.end4, !dbg !264

if.then3:                                         ; preds = %if.end
  %8 = atomicrmw add i64* @sdmprofile__BBcounter_62, i64 1 seq_cst, !dbg !266
  %9 = load double* %angle_numerator, align 8, !dbg !266
  %sub = fsub double -0.000000e+00, %9, !dbg !266
  store double %sub, double* %angle_numerator, align 8, !dbg !266
  br label %if.end4, !dbg !266

if.end4:                                          ; preds = %if.then3, %if.end
  %10 = atomicrmw add i64* @sdmprofile__BBcounter_63, i64 1 seq_cst, !dbg !267
  %11 = load float** %RealIn.addr, align 8, !dbg !267
  %12 = bitcast float* %11 to i8*, !dbg !267
  %sdmprofile__LD3 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @CheckPointer(i8* %12, i8* getelementptr inbounds ([7 x i8]* @.str111, i32 0, i32 0), i32 %sdmprofile__LD3), !dbg !267
  %13 = load float** %RealOut.addr, align 8, !dbg !268
  %14 = bitcast float* %13 to i8*, !dbg !268
  %sdmprofile__LD2 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @CheckPointer(i8* %14, i8* getelementptr inbounds ([8 x i8]* @.str212, i32 0, i32 0), i32 %sdmprofile__LD2), !dbg !268
  %15 = load float** %ImagOut.addr, align 8, !dbg !269
  %16 = bitcast float* %15 to i8*, !dbg !269
  %sdmprofile__LD1 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @CheckPointer(i8* %16, i8* getelementptr inbounds ([8 x i8]* @.str313, i32 0, i32 0), i32 %sdmprofile__LD1), !dbg !269
  %17 = load i32* %NumSamples.addr, align 4, !dbg !270
  %sdmprofile__LD5 = load i32* %sdmprofile__threadnumber_st, align 8
  %18 = call i32 @NumberOfBitsNeeded(i32 %17, i32 %sdmprofile__LD5), !dbg !270
  store i32 %18, i32* %NumBits, align 4, !dbg !270
  store i32 0, i32* %i, align 4, !dbg !271
  br label %for.cond, !dbg !271

for.cond:                                         ; preds = %for.inc, %if.end4
  %19 = atomicrmw add i64* @sdmprofile__BBcounter_64, i64 1 seq_cst, !dbg !273
  %20 = load i32* %i, align 4, !dbg !273
  %21 = load i32* %NumSamples.addr, align 4, !dbg !273
  %cmp = icmp ult i32 %20, %21, !dbg !273
  br i1 %cmp, label %for.body, label %for.end, !dbg !273

for.body:                                         ; preds = %for.cond
  %22 = atomicrmw add i64* @sdmprofile__BBcounter_65, i64 1 seq_cst, !dbg !276
  %23 = load i32* %i, align 4, !dbg !276
  %24 = load i32* %NumBits, align 4, !dbg !276
  %sdmprofile__LD6 = load i32* %sdmprofile__threadnumber_st, align 8
  %25 = call i32 @ReverseBits(i32 %23, i32 %24, i32 %sdmprofile__LD6), !dbg !276
  store i32 %25, i32* %j, align 4, !dbg !276
  %26 = load i32* %i, align 4, !dbg !278
  %idxprom = zext i32 %26 to i64, !dbg !278
  %27 = load float** %RealIn.addr, align 8, !dbg !278
  %arrayidx = getelementptr inbounds float* %27, i64 %idxprom, !dbg !278
  %28 = bitcast float* %arrayidx to i8*, !dbg !278
  %29 = load i32* %sdmprofile__threadnumber_st, !dbg !278
  call void @sdmprofile__SearchRoutine_HPonly(i8* %28, i8 2, i32 %29), !dbg !278
  %30 = load float* %arrayidx, align 4, !dbg !278
  %31 = load i32* %j, align 4, !dbg !278
  %idxprom7 = zext i32 %31 to i64, !dbg !278
  %32 = load float** %RealOut.addr, align 8, !dbg !278
  %arrayidx8 = getelementptr inbounds float* %32, i64 %idxprom7, !dbg !278
  %33 = bitcast float* %arrayidx8 to i8*, !dbg !278
  %34 = load i32* %sdmprofile__threadnumber_st, !dbg !278
  call void @sdmprofile__SearchRoutine_HPonly(i8* %33, i8 1, i32 %34), !dbg !278
  store float %30, float* %arrayidx8, align 4, !dbg !278
  %35 = load float** %ImagIn.addr, align 8, !dbg !279
  %cmp9 = icmp eq float* %35, null, !dbg !279
  br i1 %cmp9, label %cond.true, label %cond.false, !dbg !279

cond.true:                                        ; preds = %for.body
  %36 = atomicrmw add i64* @sdmprofile__BBcounter_66, i64 1 seq_cst, !dbg !280
  br label %cond.end, !dbg !280

cond.false:                                       ; preds = %for.body
  %37 = atomicrmw add i64* @sdmprofile__BBcounter_67, i64 1 seq_cst, !dbg !282
  %38 = load i32* %i, align 4, !dbg !282
  %idxprom10 = zext i32 %38 to i64, !dbg !282
  %39 = load float** %ImagIn.addr, align 8, !dbg !282
  %arrayidx11 = getelementptr inbounds float* %39, i64 %idxprom10, !dbg !282
  %40 = bitcast float* %arrayidx11 to i8*, !dbg !282
  %41 = load i32* %sdmprofile__threadnumber_st, !dbg !282
  call void @sdmprofile__SearchRoutine_HPonly(i8* %40, i8 2, i32 %41), !dbg !282
  %42 = load float* %arrayidx11, align 4, !dbg !282
  %conv = fpext float %42 to double, !dbg !282
  br label %cond.end, !dbg !282

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ 0.000000e+00, %cond.true ], [ %conv, %cond.false ], !dbg !279
  %43 = atomicrmw add i64* @sdmprofile__BBcounter_68, i64 1 seq_cst, !dbg !284
  %conv12 = fptrunc double %cond to float, !dbg !284
  %44 = load i32* %j, align 4, !dbg !284
  %idxprom13 = zext i32 %44 to i64, !dbg !284
  %45 = load float** %ImagOut.addr, align 8, !dbg !284
  %arrayidx14 = getelementptr inbounds float* %45, i64 %idxprom13, !dbg !284
  %46 = bitcast float* %arrayidx14 to i8*, !dbg !284
  %47 = load i32* %sdmprofile__threadnumber_st, !dbg !284
  call void @sdmprofile__SearchRoutine_HPonly(i8* %46, i8 1, i32 %47), !dbg !284
  store float %conv12, float* %arrayidx14, align 4, !dbg !284
  br label %for.inc, !dbg !287

for.inc:                                          ; preds = %cond.end
  %48 = atomicrmw add i64* @sdmprofile__BBcounter_69, i64 1 seq_cst, !dbg !288
  %49 = load i32* %i, align 4, !dbg !288
  %inc = add i32 %49, 1, !dbg !288
  store i32 %inc, i32* %i, align 4, !dbg !288
  br label %for.cond, !dbg !288

for.end:                                          ; preds = %for.cond
  %50 = atomicrmw add i64* @sdmprofile__BBcounter_70, i64 1 seq_cst, !dbg !289
  store i32 1, i32* %BlockEnd, align 4, !dbg !289
  store i32 2, i32* %BlockSize, align 4, !dbg !290
  br label %for.cond15, !dbg !290

for.cond15:                                       ; preds = %for.inc111, %for.end
  %51 = atomicrmw add i64* @sdmprofile__BBcounter_71, i64 1 seq_cst, !dbg !292
  %52 = load i32* %BlockSize, align 4, !dbg !292
  %53 = load i32* %NumSamples.addr, align 4, !dbg !292
  %cmp16 = icmp ule i32 %52, %53, !dbg !292
  br i1 %cmp16, label %for.body18, label %for.end112, !dbg !292

for.body18:                                       ; preds = %for.cond15
  call void @llvm.dbg.declare(metadata !{double* %delta_angle}, metadata !295), !dbg !297
  %54 = atomicrmw add i64* @sdmprofile__BBcounter_72, i64 1 seq_cst, !dbg !298
  %55 = load double* %angle_numerator, align 8, !dbg !298
  %56 = load i32* %BlockSize, align 4, !dbg !298
  %conv19 = uitofp i32 %56 to double, !dbg !298
  %div = fdiv double %55, %conv19, !dbg !298
  store double %div, double* %delta_angle, align 8, !dbg !298
  call void @llvm.dbg.declare(metadata !{double* %sm2}, metadata !299), !dbg !300
  %57 = load double* %delta_angle, align 8, !dbg !301
  %mul = fmul double -2.000000e+00, %57, !dbg !301
  %call20 = call double @sin(double %mul) #2, !dbg !301
  store double %call20, double* %sm2, align 8, !dbg !301
  call void @llvm.dbg.declare(metadata !{double* %sm1}, metadata !302), !dbg !303
  %58 = load double* %delta_angle, align 8, !dbg !304
  %sub21 = fsub double -0.000000e+00, %58, !dbg !304
  %call22 = call double @sin(double %sub21) #2, !dbg !304
  store double %call22, double* %sm1, align 8, !dbg !304
  call void @llvm.dbg.declare(metadata !{double* %cm2}, metadata !305), !dbg !306
  %59 = load double* %delta_angle, align 8, !dbg !307
  %mul23 = fmul double -2.000000e+00, %59, !dbg !307
  %call24 = call double @cos(double %mul23) #2, !dbg !307
  store double %call24, double* %cm2, align 8, !dbg !307
  call void @llvm.dbg.declare(metadata !{double* %cm1}, metadata !308), !dbg !309
  %60 = load double* %delta_angle, align 8, !dbg !310
  %sub25 = fsub double -0.000000e+00, %60, !dbg !310
  %call26 = call double @cos(double %sub25) #2, !dbg !310
  store double %call26, double* %cm1, align 8, !dbg !310
  call void @llvm.dbg.declare(metadata !{double* %w}, metadata !311), !dbg !312
  %61 = load double* %cm1, align 8, !dbg !313
  %mul27 = fmul double 2.000000e+00, %61, !dbg !313
  store double %mul27, double* %w, align 8, !dbg !313
  call void @llvm.dbg.declare(metadata !{[3 x double]* %ar}, metadata !314), !dbg !318
  call void @llvm.dbg.declare(metadata !{[3 x double]* %ai}, metadata !319), !dbg !320
  call void @llvm.dbg.declare(metadata !{double* %temp}, metadata !321), !dbg !322
  store i32 0, i32* %i, align 4, !dbg !323
  br label %for.cond28, !dbg !323

for.cond28:                                       ; preds = %for.inc108, %for.body18
  %62 = atomicrmw add i64* @sdmprofile__BBcounter_73, i64 1 seq_cst, !dbg !325
  %63 = load i32* %i, align 4, !dbg !325
  %64 = load i32* %NumSamples.addr, align 4, !dbg !325
  %cmp29 = icmp ult i32 %63, %64, !dbg !325
  br i1 %cmp29, label %for.body31, label %for.end110, !dbg !325

for.body31:                                       ; preds = %for.cond28
  %65 = atomicrmw add i64* @sdmprofile__BBcounter_74, i64 1 seq_cst, !dbg !328
  %66 = load double* %cm2, align 8, !dbg !328
  %arrayidx32 = getelementptr inbounds [3 x double]* %ar, i32 0, i64 2, !dbg !328
  store double %66, double* %arrayidx32, align 8, !dbg !328
  %67 = load double* %cm1, align 8, !dbg !330
  %arrayidx33 = getelementptr inbounds [3 x double]* %ar, i32 0, i64 1, !dbg !330
  store double %67, double* %arrayidx33, align 8, !dbg !330
  %68 = load double* %sm2, align 8, !dbg !331
  %arrayidx34 = getelementptr inbounds [3 x double]* %ai, i32 0, i64 2, !dbg !331
  store double %68, double* %arrayidx34, align 8, !dbg !331
  %69 = load double* %sm1, align 8, !dbg !332
  %arrayidx35 = getelementptr inbounds [3 x double]* %ai, i32 0, i64 1, !dbg !332
  store double %69, double* %arrayidx35, align 8, !dbg !332
  %70 = load i32* %i, align 4, !dbg !333
  store i32 %70, i32* %j, align 4, !dbg !333
  store i32 0, i32* %n, align 4, !dbg !333
  br label %for.cond36, !dbg !333

for.cond36:                                       ; preds = %for.inc104, %for.body31
  %71 = atomicrmw add i64* @sdmprofile__BBcounter_75, i64 1 seq_cst, !dbg !335
  %72 = load i32* %n, align 4, !dbg !335
  %73 = load i32* %BlockEnd, align 4, !dbg !335
  %cmp37 = icmp ult i32 %72, %73, !dbg !335
  br i1 %cmp37, label %for.body39, label %for.end107, !dbg !335

for.body39:                                       ; preds = %for.cond36
  %74 = atomicrmw add i64* @sdmprofile__BBcounter_76, i64 1 seq_cst, !dbg !338
  %75 = load double* %w, align 8, !dbg !338
  %arrayidx40 = getelementptr inbounds [3 x double]* %ar, i32 0, i64 1, !dbg !338
  %76 = load double* %arrayidx40, align 8, !dbg !338
  %mul41 = fmul double %75, %76, !dbg !338
  %arrayidx42 = getelementptr inbounds [3 x double]* %ar, i32 0, i64 2, !dbg !338
  %77 = load double* %arrayidx42, align 8, !dbg !338
  %sub43 = fsub double %mul41, %77, !dbg !338
  %arrayidx44 = getelementptr inbounds [3 x double]* %ar, i32 0, i64 0, !dbg !338
  store double %sub43, double* %arrayidx44, align 8, !dbg !338
  %arrayidx45 = getelementptr inbounds [3 x double]* %ar, i32 0, i64 1, !dbg !340
  %78 = load double* %arrayidx45, align 8, !dbg !340
  %arrayidx46 = getelementptr inbounds [3 x double]* %ar, i32 0, i64 2, !dbg !340
  store double %78, double* %arrayidx46, align 8, !dbg !340
  %arrayidx47 = getelementptr inbounds [3 x double]* %ar, i32 0, i64 0, !dbg !341
  %79 = load double* %arrayidx47, align 8, !dbg !341
  %arrayidx48 = getelementptr inbounds [3 x double]* %ar, i32 0, i64 1, !dbg !341
  store double %79, double* %arrayidx48, align 8, !dbg !341
  %80 = load double* %w, align 8, !dbg !342
  %arrayidx49 = getelementptr inbounds [3 x double]* %ai, i32 0, i64 1, !dbg !342
  %81 = load double* %arrayidx49, align 8, !dbg !342
  %mul50 = fmul double %80, %81, !dbg !342
  %arrayidx51 = getelementptr inbounds [3 x double]* %ai, i32 0, i64 2, !dbg !342
  %82 = load double* %arrayidx51, align 8, !dbg !342
  %sub52 = fsub double %mul50, %82, !dbg !342
  %arrayidx53 = getelementptr inbounds [3 x double]* %ai, i32 0, i64 0, !dbg !342
  store double %sub52, double* %arrayidx53, align 8, !dbg !342
  %arrayidx54 = getelementptr inbounds [3 x double]* %ai, i32 0, i64 1, !dbg !343
  %83 = load double* %arrayidx54, align 8, !dbg !343
  %arrayidx55 = getelementptr inbounds [3 x double]* %ai, i32 0, i64 2, !dbg !343
  store double %83, double* %arrayidx55, align 8, !dbg !343
  %arrayidx56 = getelementptr inbounds [3 x double]* %ai, i32 0, i64 0, !dbg !344
  %84 = load double* %arrayidx56, align 8, !dbg !344
  %arrayidx57 = getelementptr inbounds [3 x double]* %ai, i32 0, i64 1, !dbg !344
  store double %84, double* %arrayidx57, align 8, !dbg !344
  %85 = load i32* %j, align 4, !dbg !345
  %86 = load i32* %BlockEnd, align 4, !dbg !345
  %add = add i32 %85, %86, !dbg !345
  store i32 %add, i32* %k, align 4, !dbg !345
  %arrayidx58 = getelementptr inbounds [3 x double]* %ar, i32 0, i64 0, !dbg !346
  %87 = load double* %arrayidx58, align 8, !dbg !346
  %88 = load i32* %k, align 4, !dbg !346
  %idxprom59 = zext i32 %88 to i64, !dbg !346
  %89 = load float** %RealOut.addr, align 8, !dbg !346
  %arrayidx60 = getelementptr inbounds float* %89, i64 %idxprom59, !dbg !346
  %90 = bitcast float* %arrayidx60 to i8*, !dbg !346
  %91 = load i32* %sdmprofile__threadnumber_st, !dbg !346
  call void @sdmprofile__SearchRoutine_HPonly(i8* %90, i8 2, i32 %91), !dbg !346
  %92 = load float* %arrayidx60, align 4, !dbg !346
  %conv61 = fpext float %92 to double, !dbg !346
  %mul62 = fmul double %87, %conv61, !dbg !346
  %arrayidx63 = getelementptr inbounds [3 x double]* %ai, i32 0, i64 0, !dbg !346
  %93 = load double* %arrayidx63, align 8, !dbg !346
  %94 = load i32* %k, align 4, !dbg !346
  %idxprom64 = zext i32 %94 to i64, !dbg !346
  %95 = load float** %ImagOut.addr, align 8, !dbg !346
  %arrayidx65 = getelementptr inbounds float* %95, i64 %idxprom64, !dbg !346
  %96 = bitcast float* %arrayidx65 to i8*, !dbg !346
  %97 = load i32* %sdmprofile__threadnumber_st, !dbg !346
  call void @sdmprofile__SearchRoutine_HPonly(i8* %96, i8 2, i32 %97), !dbg !346
  %98 = load float* %arrayidx65, align 4, !dbg !346
  %conv66 = fpext float %98 to double, !dbg !346
  %mul67 = fmul double %93, %conv66, !dbg !346
  %sub68 = fsub double %mul62, %mul67, !dbg !346
  store double %sub68, double* %tr, align 8, !dbg !346
  %arrayidx69 = getelementptr inbounds [3 x double]* %ar, i32 0, i64 0, !dbg !347
  %99 = load double* %arrayidx69, align 8, !dbg !347
  %100 = load i32* %k, align 4, !dbg !347
  %idxprom70 = zext i32 %100 to i64, !dbg !347
  %101 = load float** %ImagOut.addr, align 8, !dbg !347
  %arrayidx71 = getelementptr inbounds float* %101, i64 %idxprom70, !dbg !347
  %102 = bitcast float* %arrayidx71 to i8*, !dbg !347
  %103 = load i32* %sdmprofile__threadnumber_st, !dbg !347
  call void @sdmprofile__SearchRoutine_HPonly(i8* %102, i8 2, i32 %103), !dbg !347
  %104 = load float* %arrayidx71, align 4, !dbg !347
  %conv72 = fpext float %104 to double, !dbg !347
  %mul73 = fmul double %99, %conv72, !dbg !347
  %arrayidx74 = getelementptr inbounds [3 x double]* %ai, i32 0, i64 0, !dbg !347
  %105 = load double* %arrayidx74, align 8, !dbg !347
  %106 = load i32* %k, align 4, !dbg !347
  %idxprom75 = zext i32 %106 to i64, !dbg !347
  %107 = load float** %RealOut.addr, align 8, !dbg !347
  %arrayidx76 = getelementptr inbounds float* %107, i64 %idxprom75, !dbg !347
  %108 = bitcast float* %arrayidx76 to i8*, !dbg !347
  %109 = load i32* %sdmprofile__threadnumber_st, !dbg !347
  call void @sdmprofile__SearchRoutine_HPonly(i8* %108, i8 2, i32 %109), !dbg !347
  %110 = load float* %arrayidx76, align 4, !dbg !347
  %conv77 = fpext float %110 to double, !dbg !347
  %mul78 = fmul double %105, %conv77, !dbg !347
  %add79 = fadd double %mul73, %mul78, !dbg !347
  store double %add79, double* %ti, align 8, !dbg !347
  %111 = load i32* %j, align 4, !dbg !348
  %idxprom80 = zext i32 %111 to i64, !dbg !348
  %112 = load float** %RealOut.addr, align 8, !dbg !348
  %arrayidx81 = getelementptr inbounds float* %112, i64 %idxprom80, !dbg !348
  %113 = bitcast float* %arrayidx81 to i8*, !dbg !348
  %114 = load i32* %sdmprofile__threadnumber_st, !dbg !348
  call void @sdmprofile__SearchRoutine_HPonly(i8* %113, i8 2, i32 %114), !dbg !348
  %115 = load float* %arrayidx81, align 4, !dbg !348
  %conv82 = fpext float %115 to double, !dbg !348
  %116 = load double* %tr, align 8, !dbg !348
  %sub83 = fsub double %conv82, %116, !dbg !348
  %conv84 = fptrunc double %sub83 to float, !dbg !348
  %117 = load i32* %k, align 4, !dbg !348
  %idxprom85 = zext i32 %117 to i64, !dbg !348
  %118 = load float** %RealOut.addr, align 8, !dbg !348
  %arrayidx86 = getelementptr inbounds float* %118, i64 %idxprom85, !dbg !348
  %119 = bitcast float* %arrayidx86 to i8*, !dbg !348
  %120 = load i32* %sdmprofile__threadnumber_st, !dbg !348
  call void @sdmprofile__SearchRoutine_HPonly(i8* %119, i8 1, i32 %120), !dbg !348
  store float %conv84, float* %arrayidx86, align 4, !dbg !348
  %121 = load i32* %j, align 4, !dbg !349
  %idxprom87 = zext i32 %121 to i64, !dbg !349
  %122 = load float** %ImagOut.addr, align 8, !dbg !349
  %arrayidx88 = getelementptr inbounds float* %122, i64 %idxprom87, !dbg !349
  %123 = bitcast float* %arrayidx88 to i8*, !dbg !349
  %124 = load i32* %sdmprofile__threadnumber_st, !dbg !349
  call void @sdmprofile__SearchRoutine_HPonly(i8* %123, i8 2, i32 %124), !dbg !349
  %125 = load float* %arrayidx88, align 4, !dbg !349
  %conv89 = fpext float %125 to double, !dbg !349
  %126 = load double* %ti, align 8, !dbg !349
  %sub90 = fsub double %conv89, %126, !dbg !349
  %conv91 = fptrunc double %sub90 to float, !dbg !349
  %127 = load i32* %k, align 4, !dbg !349
  %idxprom92 = zext i32 %127 to i64, !dbg !349
  %128 = load float** %ImagOut.addr, align 8, !dbg !349
  %arrayidx93 = getelementptr inbounds float* %128, i64 %idxprom92, !dbg !349
  %129 = bitcast float* %arrayidx93 to i8*, !dbg !349
  %130 = load i32* %sdmprofile__threadnumber_st, !dbg !349
  call void @sdmprofile__SearchRoutine_HPonly(i8* %129, i8 1, i32 %130), !dbg !349
  store float %conv91, float* %arrayidx93, align 4, !dbg !349
  %131 = load double* %tr, align 8, !dbg !350
  %132 = load i32* %j, align 4, !dbg !350
  %idxprom94 = zext i32 %132 to i64, !dbg !350
  %133 = load float** %RealOut.addr, align 8, !dbg !350
  %arrayidx95 = getelementptr inbounds float* %133, i64 %idxprom94, !dbg !350
  %134 = bitcast float* %arrayidx95 to i8*, !dbg !350
  %135 = load i32* %sdmprofile__threadnumber_st, !dbg !350
  call void @sdmprofile__SearchRoutine_HPonly(i8* %134, i8 2, i32 %135), !dbg !350
  %136 = load float* %arrayidx95, align 4, !dbg !350
  %conv96 = fpext float %136 to double, !dbg !350
  %add97 = fadd double %conv96, %131, !dbg !350
  %conv98 = fptrunc double %add97 to float, !dbg !350
  %137 = bitcast float* %arrayidx95 to i8*, !dbg !350
  %138 = load i32* %sdmprofile__threadnumber_st, !dbg !350
  call void @sdmprofile__SearchRoutine_HPonly(i8* %137, i8 1, i32 %138), !dbg !350
  store float %conv98, float* %arrayidx95, align 4, !dbg !350
  %139 = load double* %ti, align 8, !dbg !351
  %140 = load i32* %j, align 4, !dbg !351
  %idxprom99 = zext i32 %140 to i64, !dbg !351
  %141 = load float** %ImagOut.addr, align 8, !dbg !351
  %arrayidx100 = getelementptr inbounds float* %141, i64 %idxprom99, !dbg !351
  %142 = bitcast float* %arrayidx100 to i8*, !dbg !351
  %143 = load i32* %sdmprofile__threadnumber_st, !dbg !351
  call void @sdmprofile__SearchRoutine_HPonly(i8* %142, i8 2, i32 %143), !dbg !351
  %144 = load float* %arrayidx100, align 4, !dbg !351
  %conv101 = fpext float %144 to double, !dbg !351
  %add102 = fadd double %conv101, %139, !dbg !351
  %conv103 = fptrunc double %add102 to float, !dbg !351
  %145 = bitcast float* %arrayidx100 to i8*, !dbg !351
  %146 = load i32* %sdmprofile__threadnumber_st, !dbg !351
  call void @sdmprofile__SearchRoutine_HPonly(i8* %145, i8 1, i32 %146), !dbg !351
  store float %conv103, float* %arrayidx100, align 4, !dbg !351
  br label %for.inc104, !dbg !352

for.inc104:                                       ; preds = %for.body39
  %147 = atomicrmw add i64* @sdmprofile__BBcounter_77, i64 1 seq_cst, !dbg !353
  %148 = load i32* %j, align 4, !dbg !353
  %inc105 = add i32 %148, 1, !dbg !353
  store i32 %inc105, i32* %j, align 4, !dbg !353
  %149 = load i32* %n, align 4, !dbg !353
  %inc106 = add i32 %149, 1, !dbg !353
  store i32 %inc106, i32* %n, align 4, !dbg !353
  br label %for.cond36, !dbg !353

for.end107:                                       ; preds = %for.cond36
  %150 = atomicrmw add i64* @sdmprofile__BBcounter_78, i64 1 seq_cst, !dbg !354
  br label %for.inc108, !dbg !354

for.inc108:                                       ; preds = %for.end107
  %151 = atomicrmw add i64* @sdmprofile__BBcounter_79, i64 1 seq_cst, !dbg !355
  %152 = load i32* %BlockSize, align 4, !dbg !355
  %153 = load i32* %i, align 4, !dbg !355
  %add109 = add i32 %153, %152, !dbg !355
  store i32 %add109, i32* %i, align 4, !dbg !355
  br label %for.cond28, !dbg !355

for.end110:                                       ; preds = %for.cond28
  %154 = atomicrmw add i64* @sdmprofile__BBcounter_80, i64 1 seq_cst, !dbg !356
  %155 = load i32* %BlockSize, align 4, !dbg !356
  store i32 %155, i32* %BlockEnd, align 4, !dbg !356
  br label %for.inc111, !dbg !357

for.inc111:                                       ; preds = %for.end110
  %156 = atomicrmw add i64* @sdmprofile__BBcounter_81, i64 1 seq_cst, !dbg !358
  %157 = load i32* %BlockSize, align 4, !dbg !358
  %shl = shl i32 %157, 1, !dbg !358
  store i32 %shl, i32* %BlockSize, align 4, !dbg !358
  br label %for.cond15, !dbg !358

for.end112:                                       ; preds = %for.cond15
  %158 = atomicrmw add i64* @sdmprofile__BBcounter_82, i64 1 seq_cst, !dbg !359
  %159 = load i32* %InverseTransform.addr, align 4, !dbg !359
  %tobool113 = icmp ne i32 %159, 0, !dbg !359
  br i1 %tobool113, label %if.then114, label %if.end133, !dbg !359

if.then114:                                       ; preds = %for.end112
  call void @llvm.dbg.declare(metadata !{double* %denom}, metadata !361), !dbg !363
  %160 = atomicrmw add i64* @sdmprofile__BBcounter_83, i64 1 seq_cst, !dbg !364
  %161 = load i32* %NumSamples.addr, align 4, !dbg !364
  %conv115 = uitofp i32 %161 to double, !dbg !364
  store double %conv115, double* %denom, align 8, !dbg !364
  store i32 0, i32* %i, align 4, !dbg !365
  br label %for.cond116, !dbg !365

for.cond116:                                      ; preds = %for.inc130, %if.then114
  %162 = atomicrmw add i64* @sdmprofile__BBcounter_84, i64 1 seq_cst, !dbg !367
  %163 = load i32* %i, align 4, !dbg !367
  %164 = load i32* %NumSamples.addr, align 4, !dbg !367
  %cmp117 = icmp ult i32 %163, %164, !dbg !367
  br i1 %cmp117, label %for.body119, label %for.end132, !dbg !367

for.body119:                                      ; preds = %for.cond116
  %165 = atomicrmw add i64* @sdmprofile__BBcounter_85, i64 1 seq_cst, !dbg !370
  %166 = load double* %denom, align 8, !dbg !370
  %167 = load i32* %i, align 4, !dbg !370
  %idxprom120 = zext i32 %167 to i64, !dbg !370
  %168 = load float** %RealOut.addr, align 8, !dbg !370
  %arrayidx121 = getelementptr inbounds float* %168, i64 %idxprom120, !dbg !370
  %169 = bitcast float* %arrayidx121 to i8*, !dbg !370
  %170 = load i32* %sdmprofile__threadnumber_st, !dbg !370
  call void @sdmprofile__SearchRoutine_HPonly(i8* %169, i8 2, i32 %170), !dbg !370
  %171 = load float* %arrayidx121, align 4, !dbg !370
  %conv122 = fpext float %171 to double, !dbg !370
  %div123 = fdiv double %conv122, %166, !dbg !370
  %conv124 = fptrunc double %div123 to float, !dbg !370
  %172 = bitcast float* %arrayidx121 to i8*, !dbg !370
  %173 = load i32* %sdmprofile__threadnumber_st, !dbg !370
  call void @sdmprofile__SearchRoutine_HPonly(i8* %172, i8 1, i32 %173), !dbg !370
  store float %conv124, float* %arrayidx121, align 4, !dbg !370
  %174 = load double* %denom, align 8, !dbg !372
  %175 = load i32* %i, align 4, !dbg !372
  %idxprom125 = zext i32 %175 to i64, !dbg !372
  %176 = load float** %ImagOut.addr, align 8, !dbg !372
  %arrayidx126 = getelementptr inbounds float* %176, i64 %idxprom125, !dbg !372
  %177 = bitcast float* %arrayidx126 to i8*, !dbg !372
  %178 = load i32* %sdmprofile__threadnumber_st, !dbg !372
  call void @sdmprofile__SearchRoutine_HPonly(i8* %177, i8 2, i32 %178), !dbg !372
  %179 = load float* %arrayidx126, align 4, !dbg !372
  %conv127 = fpext float %179 to double, !dbg !372
  %div128 = fdiv double %conv127, %174, !dbg !372
  %conv129 = fptrunc double %div128 to float, !dbg !372
  %180 = bitcast float* %arrayidx126 to i8*, !dbg !372
  %181 = load i32* %sdmprofile__threadnumber_st, !dbg !372
  call void @sdmprofile__SearchRoutine_HPonly(i8* %180, i8 1, i32 %181), !dbg !372
  store float %conv129, float* %arrayidx126, align 4, !dbg !372
  br label %for.inc130, !dbg !373

for.inc130:                                       ; preds = %for.body119
  %182 = atomicrmw add i64* @sdmprofile__BBcounter_86, i64 1 seq_cst, !dbg !374
  %183 = load i32* %i, align 4, !dbg !374
  %inc131 = add i32 %183, 1, !dbg !374
  store i32 %inc131, i32* %i, align 4, !dbg !374
  br label %for.cond116, !dbg !374

for.end132:                                       ; preds = %for.cond116
  %184 = atomicrmw add i64* @sdmprofile__BBcounter_87, i64 1 seq_cst, !dbg !375
  br label %if.end133, !dbg !375

if.end133:                                        ; preds = %for.end132, %for.end112
  %185 = atomicrmw add i64* @sdmprofile__BBcounter_88, i64 1 seq_cst, !dbg !376
  ret void, !dbg !376
}

; Function Attrs: nounwind uwtable
define i32 @app__mainfunction__(i32 %argc, i8** %argv, i32 %sdmprofile__threadnumber) #11 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %MAXSIZE = alloca i32, align 4
  %MAXWAVES = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %RealIn = alloca float*, align 8
  %ImagIn = alloca float*, align 8
  %RealOut = alloca float*, align 8
  %ImagOut = alloca float*, align 8
  %coeff = alloca float*, align 8
  %amp = alloca float*, align 8
  %invfft = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_29, i64 1 seq_cst, !dbg !377
  call void @llvm.dbg.declare(metadata !{i32* %argc.addr}, metadata !378), !dbg !377
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %argv.addr}, metadata !379), !dbg !380
  call void @llvm.dbg.declare(metadata !{i32* %MAXSIZE}, metadata !381), !dbg !382
  call void @llvm.dbg.declare(metadata !{i32* %MAXWAVES}, metadata !383), !dbg !384
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !385), !dbg !386
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !387), !dbg !388
  call void @llvm.dbg.declare(metadata !{float** %RealIn}, metadata !389), !dbg !390
  call void @llvm.dbg.declare(metadata !{float** %ImagIn}, metadata !391), !dbg !392
  call void @llvm.dbg.declare(metadata !{float** %RealOut}, metadata !393), !dbg !394
  call void @llvm.dbg.declare(metadata !{float** %ImagOut}, metadata !395), !dbg !396
  call void @llvm.dbg.declare(metadata !{float** %coeff}, metadata !397), !dbg !398
  call void @llvm.dbg.declare(metadata !{float** %amp}, metadata !399), !dbg !400
  call void @llvm.dbg.declare(metadata !{i32* %invfft}, metadata !401), !dbg !402
  store i32 0, i32* %invfft, align 4, !dbg !403
  %1 = load i32* %argc.addr, align 4, !dbg !404
  %cmp = icmp slt i32 %1, 3, !dbg !404
  br i1 %cmp, label %if.then, label %if.else, !dbg !404

if.then:                                          ; preds = %entry
  %2 = atomicrmw add i64* @sdmprofile__BBcounter_30, i64 1 seq_cst, !dbg !406
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i32 0, i32 0)), !dbg !406
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str16, i32 0, i32 0)), !dbg !408
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str2, i32 0, i32 0)), !dbg !409
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str37, i32 0, i32 0)), !dbg !410
  call void @exit(i32 -1) #19, !dbg !411
  unreachable, !dbg !411

if.else:                                          ; preds = %entry
  %3 = atomicrmw add i64* @sdmprofile__BBcounter_31, i64 1 seq_cst, !dbg !412
  %4 = load i32* %argc.addr, align 4, !dbg !412
  %cmp4 = icmp eq i32 %4, 4, !dbg !412
  br i1 %cmp4, label %if.then5, label %if.end, !dbg !412

if.then5:                                         ; preds = %if.else
  %5 = atomicrmw add i64* @sdmprofile__BBcounter_32, i64 1 seq_cst, !dbg !414
  %6 = load i8*** %argv.addr, align 8, !dbg !414
  %arrayidx = getelementptr inbounds i8** %6, i64 3, !dbg !414
  %7 = bitcast i8** %arrayidx to i8*, !dbg !414
  %8 = load i32* %sdmprofile__threadnumber_st, !dbg !414
  call void @sdmprofile__SearchRoutine_HPonly(i8* %7, i8 2, i32 %8), !dbg !414
  %9 = load i8** %arrayidx, align 8, !dbg !414
  %call6 = call i32 @strncmp(i8* %9, i8* getelementptr inbounds ([3 x i8]* @.str48, i32 0, i32 0), i64 2), !dbg !414
  %tobool = icmp ne i32 %call6, 0, !dbg !414
  %lnot = xor i1 %tobool, true, !dbg !414
  %lnot.ext = zext i1 %lnot to i32, !dbg !414
  store i32 %lnot.ext, i32* %invfft, align 4, !dbg !414
  br label %if.end, !dbg !414

if.end:                                           ; preds = %if.then5, %if.else
  %10 = atomicrmw add i64* @sdmprofile__BBcounter_33, i64 1 seq_cst
  br label %if.end7

if.end7:                                          ; preds = %if.end
  %11 = atomicrmw add i64* @sdmprofile__BBcounter_34, i64 1 seq_cst, !dbg !415
  %12 = load i8*** %argv.addr, align 8, !dbg !415
  %arrayidx8 = getelementptr inbounds i8** %12, i64 2, !dbg !415
  %13 = bitcast i8** %arrayidx8 to i8*, !dbg !415
  %14 = load i32* %sdmprofile__threadnumber_st, !dbg !415
  call void @sdmprofile__SearchRoutine_HPonly(i8* %13, i8 2, i32 %14), !dbg !415
  %15 = load i8** %arrayidx8, align 8, !dbg !415
  %call9 = call i32 @atoi(i8* %15) #18, !dbg !415
  store i32 %call9, i32* %MAXSIZE, align 4, !dbg !415
  %16 = load i8*** %argv.addr, align 8, !dbg !416
  %arrayidx10 = getelementptr inbounds i8** %16, i64 1, !dbg !416
  %17 = bitcast i8** %arrayidx10 to i8*, !dbg !416
  %18 = load i32* %sdmprofile__threadnumber_st, !dbg !416
  call void @sdmprofile__SearchRoutine_HPonly(i8* %17, i8 2, i32 %18), !dbg !416
  %19 = load i8** %arrayidx10, align 8, !dbg !416
  %call11 = call i32 @atoi(i8* %19) #18, !dbg !416
  store i32 %call11, i32* %MAXWAVES, align 4, !dbg !416
  call void @srand(i32 1) #2, !dbg !417
  %20 = load i32* %MAXSIZE, align 4, !dbg !418
  %conv = zext i32 %20 to i64, !dbg !418
  %mul = mul i64 4, %conv, !dbg !418
  %call12 = call noalias i8* @malloc(i64 %mul) #2, !dbg !418
  %21 = load i32* %sdmprofile__threadnumber_st, !dbg !418
  %22 = call i8* @sdmprofile__malloc(i64 %mul, i32 1, i32 %21), !dbg !418
  %23 = bitcast i8* %22 to float*, !dbg !418
  store float* %23, float** %RealIn, align 8, !dbg !418
  %24 = load i32* %MAXSIZE, align 4, !dbg !419
  %conv13 = zext i32 %24 to i64, !dbg !419
  %mul14 = mul i64 4, %conv13, !dbg !419
  %call15 = call noalias i8* @malloc(i64 %mul14) #2, !dbg !419
  %25 = load i32* %sdmprofile__threadnumber_st, !dbg !419
  %26 = call i8* @sdmprofile__malloc(i64 %mul14, i32 2, i32 %25), !dbg !419
  %27 = bitcast i8* %26 to float*, !dbg !419
  store float* %27, float** %ImagIn, align 8, !dbg !419
  %28 = load i32* %MAXSIZE, align 4, !dbg !420
  %conv16 = zext i32 %28 to i64, !dbg !420
  %mul17 = mul i64 4, %conv16, !dbg !420
  %call18 = call noalias i8* @malloc(i64 %mul17) #2, !dbg !420
  %29 = load i32* %sdmprofile__threadnumber_st, !dbg !420
  %30 = call i8* @sdmprofile__malloc(i64 %mul17, i32 4, i32 %29), !dbg !420
  %31 = bitcast i8* %30 to float*, !dbg !420
  store float* %31, float** %RealOut, align 8, !dbg !420
  %32 = load i32* %MAXSIZE, align 4, !dbg !421
  %conv19 = zext i32 %32 to i64, !dbg !421
  %mul20 = mul i64 4, %conv19, !dbg !421
  %call21 = call noalias i8* @malloc(i64 %mul20) #2, !dbg !421
  %33 = load i32* %sdmprofile__threadnumber_st, !dbg !421
  %34 = call i8* @sdmprofile__malloc(i64 %mul20, i32 3, i32 %33), !dbg !421
  %35 = bitcast i8* %34 to float*, !dbg !421
  store float* %35, float** %ImagOut, align 8, !dbg !421
  %36 = load i32* %MAXWAVES, align 4, !dbg !422
  %conv22 = zext i32 %36 to i64, !dbg !422
  %mul23 = mul i64 4, %conv22, !dbg !422
  %call24 = call noalias i8* @malloc(i64 %mul23) #2, !dbg !422
  %37 = load i32* %sdmprofile__threadnumber_st, !dbg !422
  %38 = call i8* @sdmprofile__malloc(i64 %mul23, i32 5, i32 %37), !dbg !422
  %39 = bitcast i8* %38 to float*, !dbg !422
  store float* %39, float** %coeff, align 8, !dbg !422
  %40 = load i32* %MAXWAVES, align 4, !dbg !423
  %conv25 = zext i32 %40 to i64, !dbg !423
  %mul26 = mul i64 4, %conv25, !dbg !423
  %call27 = call noalias i8* @malloc(i64 %mul26) #2, !dbg !423
  %41 = load i32* %sdmprofile__threadnumber_st, !dbg !423
  %42 = call i8* @sdmprofile__malloc(i64 %mul26, i32 6, i32 %41), !dbg !423
  %43 = bitcast i8* %42 to float*, !dbg !423
  store float* %43, float** %amp, align 8, !dbg !423
  store i32 0, i32* %i, align 4, !dbg !424
  br label %for.cond, !dbg !424

for.cond:                                         ; preds = %for.inc, %if.end7
  %44 = atomicrmw add i64* @sdmprofile__BBcounter_35, i64 1 seq_cst, !dbg !426
  %45 = load i32* %i, align 4, !dbg !426
  %46 = load i32* %MAXWAVES, align 4, !dbg !426
  %cmp28 = icmp ult i32 %45, %46, !dbg !426
  br i1 %cmp28, label %for.body, label %for.end, !dbg !426

for.body:                                         ; preds = %for.cond
  %47 = atomicrmw add i64* @sdmprofile__BBcounter_36, i64 1 seq_cst, !dbg !429
  %call30 = call i32 @rand() #2, !dbg !429
  %rem = srem i32 %call30, 1000, !dbg !429
  %conv31 = sitofp i32 %rem to float, !dbg !429
  %48 = load i32* %i, align 4, !dbg !429
  %idxprom = zext i32 %48 to i64, !dbg !429
  %49 = load float** %coeff, align 8, !dbg !429
  %arrayidx32 = getelementptr inbounds float* %49, i64 %idxprom, !dbg !429
  %50 = bitcast float* %arrayidx32 to i8*, !dbg !429
  %51 = load i32* %sdmprofile__threadnumber_st, !dbg !429
  call void @sdmprofile__SearchRoutine_HPonly(i8* %50, i8 1, i32 %51), !dbg !429
  store float %conv31, float* %arrayidx32, align 4, !dbg !429
  %call33 = call i32 @rand() #2, !dbg !431
  %rem34 = srem i32 %call33, 1000, !dbg !431
  %conv35 = sitofp i32 %rem34 to float, !dbg !431
  %52 = load i32* %i, align 4, !dbg !431
  %idxprom36 = zext i32 %52 to i64, !dbg !431
  %53 = load float** %amp, align 8, !dbg !431
  %arrayidx37 = getelementptr inbounds float* %53, i64 %idxprom36, !dbg !431
  %54 = bitcast float* %arrayidx37 to i8*, !dbg !431
  %55 = load i32* %sdmprofile__threadnumber_st, !dbg !431
  call void @sdmprofile__SearchRoutine_HPonly(i8* %54, i8 1, i32 %55), !dbg !431
  store float %conv35, float* %arrayidx37, align 4, !dbg !431
  br label %for.inc, !dbg !432

for.inc:                                          ; preds = %for.body
  %56 = atomicrmw add i64* @sdmprofile__BBcounter_37, i64 1 seq_cst, !dbg !433
  %57 = load i32* %i, align 4, !dbg !433
  %inc = add i32 %57, 1, !dbg !433
  store i32 %inc, i32* %i, align 4, !dbg !433
  br label %for.cond, !dbg !433

for.end:                                          ; preds = %for.cond
  %58 = atomicrmw add i64* @sdmprofile__BBcounter_38, i64 1 seq_cst, !dbg !434
  store i32 0, i32* %i, align 4, !dbg !434
  br label %for.cond38, !dbg !434

for.cond38:                                       ; preds = %for.inc88, %for.end
  %59 = atomicrmw add i64* @sdmprofile__BBcounter_39, i64 1 seq_cst, !dbg !436
  %60 = load i32* %i, align 4, !dbg !436
  %61 = load i32* %MAXSIZE, align 4, !dbg !436
  %cmp39 = icmp ult i32 %60, %61, !dbg !436
  br i1 %cmp39, label %for.body41, label %for.end90, !dbg !436

for.body41:                                       ; preds = %for.cond38
  %62 = atomicrmw add i64* @sdmprofile__BBcounter_40, i64 1 seq_cst, !dbg !439
  %63 = load i32* %i, align 4, !dbg !439
  %idxprom42 = zext i32 %63 to i64, !dbg !439
  %64 = load float** %RealIn, align 8, !dbg !439
  %arrayidx43 = getelementptr inbounds float* %64, i64 %idxprom42, !dbg !439
  %65 = bitcast float* %arrayidx43 to i8*, !dbg !439
  %66 = load i32* %sdmprofile__threadnumber_st, !dbg !439
  call void @sdmprofile__SearchRoutine_HPonly(i8* %65, i8 1, i32 %66), !dbg !439
  store float 0.000000e+00, float* %arrayidx43, align 4, !dbg !439
  store i32 0, i32* %j, align 4, !dbg !441
  br label %for.cond44, !dbg !441

for.cond44:                                       ; preds = %for.inc85, %for.body41
  %67 = atomicrmw add i64* @sdmprofile__BBcounter_41, i64 1 seq_cst, !dbg !443
  %68 = load i32* %j, align 4, !dbg !443
  %69 = load i32* %MAXWAVES, align 4, !dbg !443
  %cmp45 = icmp ult i32 %68, %69, !dbg !443
  br i1 %cmp45, label %for.body47, label %for.end87, !dbg !443

for.body47:                                       ; preds = %for.cond44
  %70 = atomicrmw add i64* @sdmprofile__BBcounter_42, i64 1 seq_cst, !dbg !446
  %call48 = call i32 @rand() #2, !dbg !446
  %rem49 = srem i32 %call48, 2, !dbg !446
  %tobool50 = icmp ne i32 %rem49, 0, !dbg !446
  br i1 %tobool50, label %if.then51, label %if.else66, !dbg !446

if.then51:                                        ; preds = %for.body47
  %71 = atomicrmw add i64* @sdmprofile__BBcounter_43, i64 1 seq_cst, !dbg !449
  %72 = load i32* %j, align 4, !dbg !449
  %idxprom52 = zext i32 %72 to i64, !dbg !449
  %73 = load float** %coeff, align 8, !dbg !449
  %arrayidx53 = getelementptr inbounds float* %73, i64 %idxprom52, !dbg !449
  %74 = bitcast float* %arrayidx53 to i8*, !dbg !449
  %75 = load i32* %sdmprofile__threadnumber_st, !dbg !449
  call void @sdmprofile__SearchRoutine_HPonly(i8* %74, i8 2, i32 %75), !dbg !449
  %76 = load float* %arrayidx53, align 4, !dbg !449
  %conv54 = fpext float %76 to double, !dbg !449
  %77 = load i32* %j, align 4, !dbg !451
  %idxprom55 = zext i32 %77 to i64, !dbg !451
  %78 = load float** %amp, align 8, !dbg !451
  %arrayidx56 = getelementptr inbounds float* %78, i64 %idxprom55, !dbg !451
  %79 = bitcast float* %arrayidx56 to i8*, !dbg !451
  %80 = load i32* %sdmprofile__threadnumber_st, !dbg !451
  call void @sdmprofile__SearchRoutine_HPonly(i8* %79, i8 2, i32 %80), !dbg !451
  %81 = load float* %arrayidx56, align 4, !dbg !451
  %82 = load i32* %i, align 4, !dbg !451
  %conv57 = uitofp i32 %82 to float, !dbg !451
  %mul58 = fmul float %81, %conv57, !dbg !451
  %conv59 = fpext float %mul58 to double, !dbg !451
  %call60 = call double @cos(double %conv59) #2, !dbg !451
  %mul61 = fmul double %conv54, %call60, !dbg !451
  %83 = load i32* %i, align 4, !dbg !451
  %idxprom62 = zext i32 %83 to i64, !dbg !451
  %84 = load float** %RealIn, align 8, !dbg !451
  %arrayidx63 = getelementptr inbounds float* %84, i64 %idxprom62, !dbg !451
  %85 = bitcast float* %arrayidx63 to i8*, !dbg !451
  %86 = load i32* %sdmprofile__threadnumber_st, !dbg !451
  call void @sdmprofile__SearchRoutine_HPonly(i8* %85, i8 2, i32 %86), !dbg !451
  %87 = load float* %arrayidx63, align 4, !dbg !451
  %conv64 = fpext float %87 to double, !dbg !451
  %add = fadd double %conv64, %mul61, !dbg !451
  %conv65 = fptrunc double %add to float, !dbg !451
  %88 = bitcast float* %arrayidx63 to i8*, !dbg !451
  %89 = load i32* %sdmprofile__threadnumber_st, !dbg !451
  call void @sdmprofile__SearchRoutine_HPonly(i8* %88, i8 1, i32 %89), !dbg !451
  store float %conv65, float* %arrayidx63, align 4, !dbg !451
  br label %if.end82, !dbg !452

if.else66:                                        ; preds = %for.body47
  %90 = atomicrmw add i64* @sdmprofile__BBcounter_44, i64 1 seq_cst, !dbg !453
  %91 = load i32* %j, align 4, !dbg !453
  %idxprom67 = zext i32 %91 to i64, !dbg !453
  %92 = load float** %coeff, align 8, !dbg !453
  %arrayidx68 = getelementptr inbounds float* %92, i64 %idxprom67, !dbg !453
  %93 = bitcast float* %arrayidx68 to i8*, !dbg !453
  %94 = load i32* %sdmprofile__threadnumber_st, !dbg !453
  call void @sdmprofile__SearchRoutine_HPonly(i8* %93, i8 2, i32 %94), !dbg !453
  %95 = load float* %arrayidx68, align 4, !dbg !453
  %conv69 = fpext float %95 to double, !dbg !453
  %96 = load i32* %j, align 4, !dbg !455
  %idxprom70 = zext i32 %96 to i64, !dbg !455
  %97 = load float** %amp, align 8, !dbg !455
  %arrayidx71 = getelementptr inbounds float* %97, i64 %idxprom70, !dbg !455
  %98 = bitcast float* %arrayidx71 to i8*, !dbg !455
  %99 = load i32* %sdmprofile__threadnumber_st, !dbg !455
  call void @sdmprofile__SearchRoutine_HPonly(i8* %98, i8 2, i32 %99), !dbg !455
  %100 = load float* %arrayidx71, align 4, !dbg !455
  %101 = load i32* %i, align 4, !dbg !455
  %conv72 = uitofp i32 %101 to float, !dbg !455
  %mul73 = fmul float %100, %conv72, !dbg !455
  %conv74 = fpext float %mul73 to double, !dbg !455
  %call75 = call double @sin(double %conv74) #2, !dbg !455
  %mul76 = fmul double %conv69, %call75, !dbg !455
  %102 = load i32* %i, align 4, !dbg !455
  %idxprom77 = zext i32 %102 to i64, !dbg !455
  %103 = load float** %RealIn, align 8, !dbg !455
  %arrayidx78 = getelementptr inbounds float* %103, i64 %idxprom77, !dbg !455
  %104 = bitcast float* %arrayidx78 to i8*, !dbg !455
  %105 = load i32* %sdmprofile__threadnumber_st, !dbg !455
  call void @sdmprofile__SearchRoutine_HPonly(i8* %104, i8 2, i32 %105), !dbg !455
  %106 = load float* %arrayidx78, align 4, !dbg !455
  %conv79 = fpext float %106 to double, !dbg !455
  %add80 = fadd double %conv79, %mul76, !dbg !455
  %conv81 = fptrunc double %add80 to float, !dbg !455
  %107 = bitcast float* %arrayidx78 to i8*, !dbg !455
  %108 = load i32* %sdmprofile__threadnumber_st, !dbg !455
  call void @sdmprofile__SearchRoutine_HPonly(i8* %107, i8 1, i32 %108), !dbg !455
  store float %conv81, float* %arrayidx78, align 4, !dbg !455
  br label %if.end82

if.end82:                                         ; preds = %if.else66, %if.then51
  %109 = atomicrmw add i64* @sdmprofile__BBcounter_45, i64 1 seq_cst, !dbg !456
  %110 = load i32* %i, align 4, !dbg !456
  %idxprom83 = zext i32 %110 to i64, !dbg !456
  %111 = load float** %ImagIn, align 8, !dbg !456
  %arrayidx84 = getelementptr inbounds float* %111, i64 %idxprom83, !dbg !456
  %112 = bitcast float* %arrayidx84 to i8*, !dbg !456
  %113 = load i32* %sdmprofile__threadnumber_st, !dbg !456
  call void @sdmprofile__SearchRoutine_HPonly(i8* %112, i8 1, i32 %113), !dbg !456
  store float 0.000000e+00, float* %arrayidx84, align 4, !dbg !456
  br label %for.inc85, !dbg !457

for.inc85:                                        ; preds = %if.end82
  %114 = atomicrmw add i64* @sdmprofile__BBcounter_46, i64 1 seq_cst, !dbg !458
  %115 = load i32* %j, align 4, !dbg !458
  %inc86 = add i32 %115, 1, !dbg !458
  store i32 %inc86, i32* %j, align 4, !dbg !458
  br label %for.cond44, !dbg !458

for.end87:                                        ; preds = %for.cond44
  %116 = atomicrmw add i64* @sdmprofile__BBcounter_47, i64 1 seq_cst, !dbg !459
  br label %for.inc88, !dbg !459

for.inc88:                                        ; preds = %for.end87
  %117 = atomicrmw add i64* @sdmprofile__BBcounter_48, i64 1 seq_cst, !dbg !460
  %118 = load i32* %i, align 4, !dbg !460
  %inc89 = add i32 %118, 1, !dbg !460
  store i32 %inc89, i32* %i, align 4, !dbg !460
  br label %for.cond38, !dbg !460

for.end90:                                        ; preds = %for.cond38
  %119 = atomicrmw add i64* @sdmprofile__BBcounter_49, i64 1 seq_cst, !dbg !461
  %120 = load i32* %MAXSIZE, align 4, !dbg !461
  %121 = load i32* %invfft, align 4, !dbg !461
  %122 = load float** %RealIn, align 8, !dbg !461
  %123 = load float** %ImagIn, align 8, !dbg !461
  %124 = load float** %RealOut, align 8, !dbg !461
  %125 = load float** %ImagOut, align 8, !dbg !461
  %call91 = call i32 (i32, i32, float*, float*, float*, float*, ...)* bitcast (void (i32, i32, float*, float*, float*, float*)* @fft_float_original to i32 (i32, i32, float*, float*, float*, float*, ...)*)(i32 %120, i32 %121, float* %122, float* %123, float* %124, float* %125), !dbg !461
  %call92 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str59, i32 0, i32 0)), !dbg !462
  store i32 0, i32* %i, align 4, !dbg !463
  br label %for.cond93, !dbg !463

for.cond93:                                       ; preds = %for.inc101, %for.end90
  %126 = atomicrmw add i64* @sdmprofile__BBcounter_50, i64 1 seq_cst, !dbg !465
  %127 = load i32* %i, align 4, !dbg !465
  %128 = load i32* %MAXSIZE, align 4, !dbg !465
  %cmp94 = icmp ult i32 %127, %128, !dbg !465
  br i1 %cmp94, label %for.body96, label %for.end103, !dbg !465

for.body96:                                       ; preds = %for.cond93
  %129 = atomicrmw add i64* @sdmprofile__BBcounter_51, i64 1 seq_cst, !dbg !468
  %130 = load i32* %i, align 4, !dbg !468
  %idxprom97 = zext i32 %130 to i64, !dbg !468
  %131 = load float** %RealOut, align 8, !dbg !468
  %arrayidx98 = getelementptr inbounds float* %131, i64 %idxprom97, !dbg !468
  %132 = bitcast float* %arrayidx98 to i8*, !dbg !468
  %133 = load i32* %sdmprofile__threadnumber_st, !dbg !468
  call void @sdmprofile__SearchRoutine_HPonly(i8* %132, i8 2, i32 %133), !dbg !468
  %134 = load float* %arrayidx98, align 4, !dbg !468
  %conv99 = fpext float %134 to double, !dbg !468
  %call100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str610, i32 0, i32 0), double %conv99), !dbg !468
  br label %for.inc101, !dbg !468

for.inc101:                                       ; preds = %for.body96
  %135 = atomicrmw add i64* @sdmprofile__BBcounter_52, i64 1 seq_cst, !dbg !469
  %136 = load i32* %i, align 4, !dbg !469
  %inc102 = add i32 %136, 1, !dbg !469
  store i32 %inc102, i32* %i, align 4, !dbg !469
  br label %for.cond93, !dbg !469

for.end103:                                       ; preds = %for.cond93
  %137 = atomicrmw add i64* @sdmprofile__BBcounter_53, i64 1 seq_cst, !dbg !470
  %call104 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str711, i32 0, i32 0)), !dbg !470
  %call105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str812, i32 0, i32 0)), !dbg !471
  store i32 0, i32* %i, align 4, !dbg !472
  br label %for.cond106, !dbg !472

for.cond106:                                      ; preds = %for.inc114, %for.end103
  %138 = atomicrmw add i64* @sdmprofile__BBcounter_54, i64 1 seq_cst, !dbg !474
  %139 = load i32* %i, align 4, !dbg !474
  %140 = load i32* %MAXSIZE, align 4, !dbg !474
  %cmp107 = icmp ult i32 %139, %140, !dbg !474
  br i1 %cmp107, label %for.body109, label %for.end116, !dbg !474

for.body109:                                      ; preds = %for.cond106
  %141 = atomicrmw add i64* @sdmprofile__BBcounter_55, i64 1 seq_cst, !dbg !477
  %142 = load i32* %i, align 4, !dbg !477
  %idxprom110 = zext i32 %142 to i64, !dbg !477
  %143 = load float** %ImagOut, align 8, !dbg !477
  %arrayidx111 = getelementptr inbounds float* %143, i64 %idxprom110, !dbg !477
  %144 = bitcast float* %arrayidx111 to i8*, !dbg !477
  %145 = load i32* %sdmprofile__threadnumber_st, !dbg !477
  call void @sdmprofile__SearchRoutine_HPonly(i8* %144, i8 2, i32 %145), !dbg !477
  %146 = load float* %arrayidx111, align 4, !dbg !477
  %conv112 = fpext float %146 to double, !dbg !477
  %call113 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str610, i32 0, i32 0), double %conv112), !dbg !477
  br label %for.inc114, !dbg !477

for.inc114:                                       ; preds = %for.body109
  %147 = atomicrmw add i64* @sdmprofile__BBcounter_56, i64 1 seq_cst, !dbg !478
  %148 = load i32* %i, align 4, !dbg !478
  %inc115 = add i32 %148, 1, !dbg !478
  store i32 %inc115, i32* %i, align 4, !dbg !478
  br label %for.cond106, !dbg !478

for.end116:                                       ; preds = %for.cond106
  %149 = atomicrmw add i64* @sdmprofile__BBcounter_57, i64 1 seq_cst, !dbg !479
  %call117 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str711, i32 0, i32 0)), !dbg !479
  %150 = load float** %RealIn, align 8, !dbg !480
  %151 = bitcast float* %150 to i8*, !dbg !480
  %152 = load i32* %sdmprofile__threadnumber_st, !dbg !480
  call void @sdmprofile__free(i8* %151, i32 %152), !dbg !480
  %153 = load float** %ImagIn, align 8, !dbg !481
  %154 = bitcast float* %153 to i8*, !dbg !481
  %155 = load i32* %sdmprofile__threadnumber_st, !dbg !481
  call void @sdmprofile__free(i8* %154, i32 %155), !dbg !481
  %156 = load float** %RealOut, align 8, !dbg !482
  %157 = bitcast float* %156 to i8*, !dbg !482
  %158 = load i32* %sdmprofile__threadnumber_st, !dbg !482
  call void @sdmprofile__free(i8* %157, i32 %158), !dbg !482
  %159 = load float** %ImagOut, align 8, !dbg !483
  %160 = bitcast float* %159 to i8*, !dbg !483
  %161 = load i32* %sdmprofile__threadnumber_st, !dbg !483
  call void @sdmprofile__free(i8* %160, i32 %161), !dbg !483
  %162 = load float** %coeff, align 8, !dbg !484
  %163 = bitcast float* %162 to i8*, !dbg !484
  %164 = load i32* %sdmprofile__threadnumber_st, !dbg !484
  call void @sdmprofile__free(i8* %163, i32 %164), !dbg !484
  %165 = load float** %amp, align 8, !dbg !485
  %166 = bitcast float* %165 to i8*, !dbg !485
  %167 = load i32* %sdmprofile__threadnumber_st, !dbg !485
  call void @sdmprofile__free(i8* %166, i32 %167), !dbg !485
  call void @exit(i32 0) #19, !dbg !486
  unreachable, !dbg !486

return:                                           ; No predecessors!
  %168 = atomicrmw add i64* @sdmprofile__BBcounter_58, i64 1 seq_cst, !dbg !487
  %169 = load i32* %retval, !dbg !487
  ret i32 %169, !dbg !487
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #11 {
  %argc_ptr = alloca i32, align 4
  %argv_ptr = alloca i8**, align 8
  %rtn = alloca i32, align 4
  store i32 %argc, i32* %argc_ptr, align 4
  store i8** %argv, i8*** %argv_ptr, align 8
  store i32 1, i32* @sdmprofile__profileAction
  store i64 6, i64* @sdmprofile__heapallocationCount
  store i64 0, i64* @sdmprofile__stackallocationCount
  store i64 89, i64* @sdmprofile__BBcount
  store i32 0, i32* @sdmprofile__IncludeStackProfiling
  call void @sdmprofile__StartProfiling_Processes()
  call void @sdmprofile__Embed_metadata_HP(i32 1, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__HP_Name_1, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @sdmprofile__HP_Type_1, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @sdmprofile__HP_Fname_1, i32 0, i32 0), i64 32, i8* getelementptr inbounds ([7 x i8]* @sdmprofile__HP_SourceFile_1, i32 0, i32 0))
  call void @sdmprofile__Embed_metadata_HP(i32 2, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__HP_Name_2, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @sdmprofile__HP_Type_2, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @sdmprofile__HP_Fname_2, i32 0, i32 0), i64 33, i8* getelementptr inbounds ([7 x i8]* @sdmprofile__HP_SourceFile_2, i32 0, i32 0))
  call void @sdmprofile__Embed_metadata_HP(i32 3, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__HP_Name_3, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @sdmprofile__HP_Type_3, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @sdmprofile__HP_Fname_3, i32 0, i32 0), i64 35, i8* getelementptr inbounds ([7 x i8]* @sdmprofile__HP_SourceFile_3, i32 0, i32 0))
  call void @sdmprofile__Embed_metadata_HP(i32 4, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__HP_Name_4, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @sdmprofile__HP_Type_4, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @sdmprofile__HP_Fname_4, i32 0, i32 0), i64 34, i8* getelementptr inbounds ([7 x i8]* @sdmprofile__HP_SourceFile_4, i32 0, i32 0))
  call void @sdmprofile__Embed_metadata_HP(i32 5, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__HP_Name_5, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @sdmprofile__HP_Type_5, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @sdmprofile__HP_Fname_5, i32 0, i32 0), i64 36, i8* getelementptr inbounds ([7 x i8]* @sdmprofile__HP_SourceFile_5, i32 0, i32 0))
  call void @sdmprofile__Embed_metadata_HP(i32 6, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__HP_Name_6, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @sdmprofile__HP_Type_6, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @sdmprofile__HP_Fname_6, i32 0, i32 0), i64 37, i8* getelementptr inbounds ([7 x i8]* @sdmprofile__HP_SourceFile_6, i32 0, i32 0))
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
  %61 = load i64* @sdmprofile__BBcounter_57
  call void @sdmprofile__BBHit(i64 57, i64 %61)
  %62 = load i64* @sdmprofile__BBcounter_58
  call void @sdmprofile__BBHit(i64 58, i64 %62)
  %63 = load i64* @sdmprofile__BBcounter_59
  call void @sdmprofile__BBHit(i64 59, i64 %63)
  %64 = load i64* @sdmprofile__BBcounter_60
  call void @sdmprofile__BBHit(i64 60, i64 %64)
  %65 = load i64* @sdmprofile__BBcounter_61
  call void @sdmprofile__BBHit(i64 61, i64 %65)
  %66 = load i64* @sdmprofile__BBcounter_62
  call void @sdmprofile__BBHit(i64 62, i64 %66)
  %67 = load i64* @sdmprofile__BBcounter_63
  call void @sdmprofile__BBHit(i64 63, i64 %67)
  %68 = load i64* @sdmprofile__BBcounter_64
  call void @sdmprofile__BBHit(i64 64, i64 %68)
  %69 = load i64* @sdmprofile__BBcounter_65
  call void @sdmprofile__BBHit(i64 65, i64 %69)
  %70 = load i64* @sdmprofile__BBcounter_66
  call void @sdmprofile__BBHit(i64 66, i64 %70)
  %71 = load i64* @sdmprofile__BBcounter_67
  call void @sdmprofile__BBHit(i64 67, i64 %71)
  %72 = load i64* @sdmprofile__BBcounter_68
  call void @sdmprofile__BBHit(i64 68, i64 %72)
  %73 = load i64* @sdmprofile__BBcounter_69
  call void @sdmprofile__BBHit(i64 69, i64 %73)
  %74 = load i64* @sdmprofile__BBcounter_70
  call void @sdmprofile__BBHit(i64 70, i64 %74)
  %75 = load i64* @sdmprofile__BBcounter_71
  call void @sdmprofile__BBHit(i64 71, i64 %75)
  %76 = load i64* @sdmprofile__BBcounter_72
  call void @sdmprofile__BBHit(i64 72, i64 %76)
  %77 = load i64* @sdmprofile__BBcounter_73
  call void @sdmprofile__BBHit(i64 73, i64 %77)
  %78 = load i64* @sdmprofile__BBcounter_74
  call void @sdmprofile__BBHit(i64 74, i64 %78)
  %79 = load i64* @sdmprofile__BBcounter_75
  call void @sdmprofile__BBHit(i64 75, i64 %79)
  %80 = load i64* @sdmprofile__BBcounter_76
  call void @sdmprofile__BBHit(i64 76, i64 %80)
  %81 = load i64* @sdmprofile__BBcounter_77
  call void @sdmprofile__BBHit(i64 77, i64 %81)
  %82 = load i64* @sdmprofile__BBcounter_78
  call void @sdmprofile__BBHit(i64 78, i64 %82)
  %83 = load i64* @sdmprofile__BBcounter_79
  call void @sdmprofile__BBHit(i64 79, i64 %83)
  %84 = load i64* @sdmprofile__BBcounter_80
  call void @sdmprofile__BBHit(i64 80, i64 %84)
  %85 = load i64* @sdmprofile__BBcounter_81
  call void @sdmprofile__BBHit(i64 81, i64 %85)
  %86 = load i64* @sdmprofile__BBcounter_82
  call void @sdmprofile__BBHit(i64 82, i64 %86)
  %87 = load i64* @sdmprofile__BBcounter_83
  call void @sdmprofile__BBHit(i64 83, i64 %87)
  %88 = load i64* @sdmprofile__BBcounter_84
  call void @sdmprofile__BBHit(i64 84, i64 %88)
  %89 = load i64* @sdmprofile__BBcounter_85
  call void @sdmprofile__BBHit(i64 85, i64 %89)
  %90 = load i64* @sdmprofile__BBcounter_86
  call void @sdmprofile__BBHit(i64 86, i64 %90)
  %91 = load i64* @sdmprofile__BBcounter_87
  call void @sdmprofile__BBHit(i64 87, i64 %91)
  %92 = load i64* @sdmprofile__BBcounter_88
  call void @sdmprofile__BBHit(i64 88, i64 %92)
  call void @sdmprofile__EndProfiling_Processes()
  %93 = load i32* %rtn, align 4
  ret i32 %93
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
attributes #14 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #16 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #17 = { cold }
attributes #18 = { nounwind readonly }
attributes #19 = { noreturn nounwind }

!llvm.ident = !{!0, !0, !0, !0}
!llvm.dbg.cu = !{!1, !13, !31}
!llvm.module.flags = !{!44, !45}

!0 = metadata !{metadata !"clang version 3.5.1 (tags/RELEASE_351/final)"}
!1 = metadata !{i32 786449, metadata !2, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !4, metadata !3, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/mibench/FFT/main.c] [DW_LANG_C99]
!2 = metadata !{metadata !"main.c", metadata !"/home/sslee/work/mibench/FFT"}
!3 = metadata !{}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"main", metadata !"main", metadata !"", i32 5, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main_original, null, null, metadata !3, i32 5} ; [ DW_TAG_subprogram ] [line 5] [def] [main]
!6 = metadata !{i32 786473, metadata !2}          ; [ DW_TAG_file_type ] [/home/sslee/work/mibench/FFT/main.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!12 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = metadata !{i32 786449, metadata !14, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !15, metadata !3, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/mibench/FFT/fftmisc.c] [DW_LANG_C99]
!14 = metadata !{metadata !"fftmisc.c", metadata !"/home/sslee/work/mibench/FFT"}
!15 = metadata !{metadata !16, metadata !21, metadata !24, metadata !27}
!16 = metadata !{i32 786478, metadata !14, metadata !17, metadata !"IsPowerOfTwo", metadata !"IsPowerOfTwo", metadata !"", i32 35, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @IsPowerOfTwo_original, null, null, metadata !3, i32 36} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [IsPowerOfTwo]
!17 = metadata !{i32 786473, metadata !14}        ; [ DW_TAG_file_type ] [/home/sslee/work/mibench/FFT/fftmisc.c]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !9, metadata !20}
!20 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!21 = metadata !{i32 786478, metadata !14, metadata !17, metadata !"NumberOfBitsNeeded", metadata !"NumberOfBitsNeeded", metadata !"", i32 47, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @NumberOfBitsNeeded_original, null, null, metadata !3, i32 48} ; [ DW_TAG_subprogram ] [line 47] [def] [scope 48] [NumberOfBitsNeeded]
!22 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{metadata !20, metadata !20}
!24 = metadata !{i32 786478, metadata !14, metadata !17, metadata !"ReverseBits", metadata !"ReverseBits", metadata !"", i32 70, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @ReverseBits_original, null, null, metadata !3, i32 71} ; [ DW_TAG_subprogram ] [line 70] [def] [scope 71] [ReverseBits]
!25 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{metadata !20, metadata !20, metadata !20}
!27 = metadata !{i32 786478, metadata !14, metadata !17, metadata !"Index_to_frequency", metadata !"Index_to_frequency", metadata !"", i32 84, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i32, i32)* @Index_to_frequency_original, null, null, metadata !3, i32 85} ; [ DW_TAG_subprogram ] [line 84] [def] [scope 85] [Index_to_frequency]
!28 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !29, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = metadata !{metadata !30, metadata !20, metadata !20}
!30 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!31 = metadata !{i32 786449, metadata !32, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !33, metadata !3, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/mibench/FFT/fourierf.c] [DW_LANG_C99]
!32 = metadata !{metadata !"fourierf.c", metadata !"/home/sslee/work/mibench/FFT"}
!33 = metadata !{metadata !34, metadata !40}
!34 = metadata !{i32 786478, metadata !32, metadata !35, metadata !"fft_float", metadata !"fft_float", metadata !"", i32 39, metadata !36, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32, float*, float*, float*, float*)* @fft_float_original, null, null, metadata !3, i32 46} ; [ DW_TAG_subprogram ] [line 39] [def] [scope 46] [fft_float]
!35 = metadata !{i32 786473, metadata !32}        ; [ DW_TAG_file_type ] [/home/sslee/work/mibench/FFT/fourierf.c]
!36 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !37, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!37 = metadata !{null, metadata !20, metadata !9, metadata !38, metadata !38, metadata !38, metadata !38}
!38 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !39} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!39 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!40 = metadata !{i32 786478, metadata !32, metadata !35, metadata !"CheckPointer", metadata !"CheckPointer", metadata !"", i32 29, metadata !41, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*, i8*)* @CheckPointer_original, null, null, metadata !3, i32 30} ; [ DW_TAG_subprogram ] [line 29] [local] [def] [scope 30] [CheckPointer]
!41 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !42, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = metadata !{null, metadata !43, metadata !11}
!43 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!44 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!45 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!46 = metadata !{metadata !47, metadata !47, i64 0}
!47 = metadata !{metadata !"any pointer", metadata !48, i64 0}
!48 = metadata !{metadata !"omnipotent char", metadata !49, i64 0}
!49 = metadata !{metadata !"Simple C/C++ TBAA"}
!50 = metadata !{metadata !51, metadata !51, i64 0}
!51 = metadata !{metadata !"int", metadata !48, i64 0}
!52 = metadata !{metadata !53, metadata !47, i64 0}
!53 = metadata !{metadata !"_ZTS18HeapAllocationMeta", metadata !47, i64 0, metadata !47, i64 8, metadata !54, i64 16, metadata !51, i64 24, metadata !54, i64 32}
!54 = metadata !{metadata !"long", metadata !48, i64 0}
!55 = metadata !{metadata !56, metadata !54, i64 0}
!56 = metadata !{metadata !"_ZTS6GVMeta", metadata !54, i64 0, metadata !54, i64 8, metadata !54, i64 16, metadata !47, i64 24, metadata !51, i64 32, metadata !47, i64 40, metadata !47, i64 48, metadata !47, i64 56, metadata !47, i64 64, metadata !47, i64 72, metadata !54, i64 80}
!57 = metadata !{metadata !56, metadata !47, i64 24}
!58 = metadata !{metadata !56, metadata !51, i64 32}
!59 = metadata !{metadata !60, metadata !47, i64 0}
!60 = metadata !{metadata !"_ZTS32sdmprofile__Allocated_Stack_item", metadata !47, i64 0, metadata !54, i64 8, metadata !47, i64 16}
!61 = metadata !{metadata !60, metadata !47, i64 16}
!62 = metadata !{metadata !62, metadata !63, metadata !64}
!63 = metadata !{metadata !"llvm.loop.vectorize.width", i32 1}
!64 = metadata !{metadata !"llvm.loop.interleave.count", i32 1}
!65 = metadata !{metadata !66, metadata !66, i64 0}
!66 = metadata !{metadata !"double", metadata !48, i64 0}
!67 = metadata !{metadata !68, metadata !51, i64 0}
!68 = metadata !{metadata !"_ZTS6Thread", metadata !51, i64 0, metadata !54, i64 8, metadata !66, i64 16, metadata !66, i64 24, metadata !47, i64 32, metadata !47, i64 40, metadata !54, i64 48, metadata !54, i64 56, metadata !54, i64 64, metadata !54, i64 72, metadata !54, i64 80, metadata !54, i64 88, metadata !54, i64 96, metadata !54, i64 104, metadata !54, i64 112, metadata !54, i64 120, metadata !54, i64 128, metadata !48, i64 136, metadata !48, i64 200, metadata !47, i64 264, metadata !47, i64 272}
!69 = metadata !{metadata !68, metadata !54, i64 8}
!70 = metadata !{metadata !68, metadata !66, i64 16}
!71 = metadata !{metadata !68, metadata !66, i64 24}
!72 = metadata !{metadata !68, metadata !47, i64 264}
!73 = metadata !{metadata !74, metadata !47, i64 0}
!74 = metadata !{metadata !"_ZTS11Cache2_Item", metadata !47, i64 0, metadata !47, i64 8}
!75 = metadata !{metadata !74, metadata !47, i64 8}
!76 = metadata !{metadata !68, metadata !47, i64 272}
!77 = metadata !{metadata !78, metadata !47, i64 0}
!78 = metadata !{metadata !"_ZTS12GVCache_Item", metadata !47, i64 0, metadata !47, i64 8}
!79 = metadata !{metadata !78, metadata !47, i64 8}
!80 = metadata !{metadata !68, metadata !47, i64 32}
!81 = metadata !{metadata !56, metadata !47, i64 40}
!82 = metadata !{metadata !56, metadata !47, i64 48}
!83 = metadata !{metadata !56, metadata !47, i64 56}
!84 = metadata !{metadata !56, metadata !47, i64 64}
!85 = metadata !{metadata !56, metadata !47, i64 72}
!86 = metadata !{metadata !56, metadata !54, i64 80}
!87 = metadata !{metadata !88, metadata !54, i64 0}
!88 = metadata !{metadata !"_ZTS23sdmprofile__struct_STrw", metadata !54, i64 0, metadata !54, i64 8, metadata !54, i64 16, metadata !51, i64 24, metadata !47, i64 32, metadata !47, i64 40, metadata !47, i64 48}
!89 = metadata !{metadata !88, metadata !51, i64 24}
!90 = metadata !{metadata !88, metadata !47, i64 32}
!91 = metadata !{metadata !88, metadata !47, i64 40}
!92 = metadata !{metadata !88, metadata !47, i64 48}
!93 = metadata !{metadata !94, metadata !51, i64 0}
!94 = metadata !{metadata !"_ZTS6HPMeta", metadata !51, i64 0, metadata !54, i64 8, metadata !54, i64 16, metadata !47, i64 24, metadata !47, i64 32, metadata !47, i64 40, metadata !54, i64 48, metadata !47, i64 56, metadata !54, i64 64, metadata !54, i64 72, metadata !54, i64 80, metadata !54, i64 88}
!95 = metadata !{metadata !94, metadata !47, i64 24}
!96 = metadata !{metadata !94, metadata !47, i64 32}
!97 = metadata !{metadata !94, metadata !47, i64 40}
!98 = metadata !{metadata !94, metadata !54, i64 48}
!99 = metadata !{metadata !94, metadata !47, i64 56}
!100 = metadata !{metadata !56, metadata !54, i64 8}
!101 = metadata !{metadata !56, metadata !54, i64 16}
!102 = metadata !{metadata !103, metadata !47, i64 0}
!103 = metadata !{metadata !"_ZTSSt14_Fwd_list_baseIP6GVMetaSaIS1_EE", metadata !104, i64 0}
!104 = metadata !{metadata !"_ZTSNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_Fwd_list_implE", metadata !105, i64 0}
!105 = metadata !{metadata !"_ZTSSt19_Fwd_list_node_base", metadata !47, i64 0}
!106 = metadata !{metadata !107, metadata !47, i64 0}
!107 = metadata !{metadata !"_ZTSSt18_Fwd_list_iteratorIP6GVMetaE", metadata !47, i64 0}
!108 = metadata !{metadata !105, metadata !47, i64 0}
!109 = metadata !{metadata !88, metadata !54, i64 8}
!110 = metadata !{metadata !88, metadata !54, i64 16}
!111 = metadata !{metadata !54, metadata !54, i64 0}
!112 = metadata !{metadata !113, metadata !54, i64 0}
!113 = metadata !{metadata !"_ZTS8timespec", metadata !54, i64 0, metadata !54, i64 8}
!114 = metadata !{metadata !113, metadata !54, i64 8}
!115 = metadata !{metadata !116, metadata !54, i64 0}
!116 = metadata !{metadata !"_ZTS7timeval", metadata !54, i64 0, metadata !54, i64 8}
!117 = metadata !{metadata !116, metadata !54, i64 8}
!118 = metadata !{metadata !68, metadata !54, i64 48}
!119 = metadata !{metadata !53, metadata !47, i64 8}
!120 = metadata !{metadata !53, metadata !54, i64 16}
!121 = metadata !{metadata !53, metadata !51, i64 24}
!122 = metadata !{metadata !68, metadata !54, i64 80}
!123 = metadata !{metadata !68, metadata !54, i64 64}
!124 = metadata !{metadata !94, metadata !54, i64 64}
!125 = metadata !{metadata !94, metadata !54, i64 72}
!126 = metadata !{metadata !94, metadata !54, i64 80}
!127 = metadata !{metadata !68, metadata !54, i64 56}
!128 = metadata !{metadata !129, metadata !47, i64 0}
!129 = metadata !{metadata !"_ZTSSt10_List_baseIP18HeapAllocationMetaSaIS1_EE", metadata !130, i64 0}
!130 = metadata !{metadata !"_ZTSNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE10_List_implE", metadata !131, i64 0}
!131 = metadata !{metadata !"_ZTSNSt8__detail15_List_node_baseE", metadata !47, i64 0, metadata !47, i64 8}
!132 = metadata !{metadata !133, metadata !47, i64 0}
!133 = metadata !{metadata !"_ZTSSt14_List_iteratorIP18HeapAllocationMetaE", metadata !47, i64 0}
!134 = metadata !{metadata !131, metadata !47, i64 0}
!135 = metadata !{metadata !68, metadata !54, i64 96}
!136 = metadata !{metadata !68, metadata !54, i64 112}
!137 = metadata !{metadata !68, metadata !54, i64 128}
!138 = metadata !{metadata !68, metadata !54, i64 120}
!139 = metadata !{metadata !68, metadata !54, i64 104}
!140 = metadata !{metadata !94, metadata !54, i64 8}
!141 = metadata !{metadata !94, metadata !54, i64 16}
!142 = metadata !{metadata !60, metadata !54, i64 8}
!143 = metadata !{metadata !48, metadata !48, i64 0}
!144 = metadata !{metadata !145, metadata !47, i64 0}
!145 = metadata !{metadata !"_ZTSN9__gnu_cxx17__normal_iteratorIPcSsEE", metadata !47, i64 0}
!146 = metadata !{metadata !147, metadata !47, i64 0}
!147 = metadata !{metadata !"_ZTSSs", metadata !148, i64 0}
!148 = metadata !{metadata !"_ZTSNSs12_Alloc_hiderE", metadata !47, i64 0}
!149 = metadata !{metadata !150, metadata !54, i64 0}
!150 = metadata !{metadata !"_ZTSNSs9_Rep_baseE", metadata !54, i64 0, metadata !54, i64 8, metadata !51, i64 16}
!151 = metadata !{metadata !150, metadata !51, i64 16}
!152 = metadata !{metadata !153, metadata !47, i64 16}
!153 = metadata !{metadata !"_ZTSSt10_List_nodeIP18HeapAllocationMetaE", metadata !47, i64 16}
!154 = metadata !{metadata !155, metadata !47, i64 0}
!155 = metadata !{metadata !"_ZTSSt24_Fwd_list_const_iteratorIP6GVMetaE", metadata !47, i64 0}
!156 = metadata !{metadata !129, metadata !47, i64 8}
!157 = metadata !{metadata !"branch_weights", i32 64, i32 4}
!158 = metadata !{i32 29, i32 34, metadata !40, null}
!159 = metadata !{i32 786689, metadata !40, metadata !"p", metadata !35, i32 16777245, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 29]
!160 = metadata !{i32 786689, metadata !40, metadata !"name", metadata !35, i32 33554461, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 29]
!161 = metadata !{i32 29, i32 43, metadata !40, null}
!162 = metadata !{i32 31, i32 10, metadata !163, null}
!163 = metadata !{i32 786443, metadata !32, metadata !40, i32 31, i32 10, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!164 = metadata !{i32 33, i32 9, metadata !165, null}
!165 = metadata !{i32 786443, metadata !32, metadata !163, i32 32, i32 5, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!166 = metadata !{i32 34, i32 9, metadata !165, null}
!167 = metadata !{i32 36, i32 1, metadata !40, null}
!168 = metadata !{i32 84, i32 38, metadata !27, null}
!169 = metadata !{i32 786689, metadata !27, metadata !"NumSamples", metadata !17, i32 16777300, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [NumSamples] [line 84]
!170 = metadata !{i32 786689, metadata !27, metadata !"Index", metadata !17, i32 33554516, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Index] [line 84]
!171 = metadata !{i32 84, i32 59, metadata !27, null}
!172 = metadata !{i32 86, i32 10, metadata !173, null}
!173 = metadata !{i32 786443, metadata !14, metadata !27, i32 86, i32 10, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fftmisc.c]
!174 = metadata !{i32 87, i32 9, metadata !173, null}
!175 = metadata !{i32 88, i32 15, metadata !176, null}
!176 = metadata !{i32 786443, metadata !14, metadata !173, i32 88, i32 15, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fftmisc.c]
!177 = metadata !{i32 89, i32 9, metadata !176, null}
!178 = metadata !{i32 91, i32 5, metadata !27, null}
!179 = metadata !{i32 92, i32 1, metadata !27, null}
!180 = metadata !{i32 35, i32 29, metadata !16, null}
!181 = metadata !{i32 786689, metadata !16, metadata !"x", metadata !17, i32 16777251, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 35]
!182 = metadata !{i32 37, i32 10, metadata !183, null}
!183 = metadata !{i32 786443, metadata !14, metadata !16, i32 37, i32 10, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fftmisc.c]
!184 = metadata !{i32 38, i32 9, metadata !183, null}
!185 = metadata !{i32 40, i32 10, metadata !186, null}
!186 = metadata !{i32 786443, metadata !14, metadata !16, i32 40, i32 10, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fftmisc.c]
!187 = metadata !{i32 41, i32 9, metadata !186, null}
!188 = metadata !{i32 43, i32 5, metadata !16, null}
!189 = metadata !{i32 44, i32 1, metadata !16, null}
!190 = metadata !{i32 47, i32 40, metadata !21, null}
!191 = metadata !{i32 786689, metadata !21, metadata !"PowerOfTwo", metadata !17, i32 16777263, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [PowerOfTwo] [line 47]
!192 = metadata !{i32 786688, metadata !21, metadata !"i", metadata !17, i32 49, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 49]
!193 = metadata !{i32 49, i32 14, metadata !21, null}
!194 = metadata !{i32 51, i32 10, metadata !195, null}
!195 = metadata !{i32 786443, metadata !14, metadata !21, i32 51, i32 10, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fftmisc.c]
!196 = metadata !{i32 53, i32 9, metadata !197, null}
!197 = metadata !{i32 786443, metadata !14, metadata !195, i32 52, i32 5, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fftmisc.c]
!198 = metadata !{i32 58, i32 9, metadata !197, null} ; [ DW_TAG_imported_module ]
!199 = metadata !{i32 61, i32 11, metadata !200, null}
!200 = metadata !{i32 786443, metadata !14, metadata !21, i32 61, i32 5, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fftmisc.c]
!201 = metadata !{i32 63, i32 14, metadata !202, null}
!202 = metadata !{i32 786443, metadata !14, metadata !203, i32 63, i32 14, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fftmisc.c]
!203 = metadata !{i32 786443, metadata !14, metadata !200, i32 62, i32 5, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fftmisc.c]
!204 = metadata !{i32 64, i32 13, metadata !202, null}
!205 = metadata !{i32 65, i32 5, metadata !203, null}
!206 = metadata !{i32 61, i32 18, metadata !200, null}
!207 = metadata !{i32 70, i32 33, metadata !24, null}
!208 = metadata !{i32 786689, metadata !24, metadata !"index", metadata !17, i32 16777286, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [index] [line 70]
!209 = metadata !{i32 786689, metadata !24, metadata !"NumBits", metadata !17, i32 33554502, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [NumBits] [line 70]
!210 = metadata !{i32 70, i32 49, metadata !24, null}
!211 = metadata !{i32 786688, metadata !24, metadata !"i", metadata !17, i32 72, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 72]
!212 = metadata !{i32 72, i32 14, metadata !24, null}
!213 = metadata !{i32 786688, metadata !24, metadata !"rev", metadata !17, i32 72, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rev] [line 72]
!214 = metadata !{i32 72, i32 17, metadata !24, null}
!215 = metadata !{i32 74, i32 11, metadata !216, null}
!216 = metadata !{i32 786443, metadata !14, metadata !24, i32 74, i32 5, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fftmisc.c]
!217 = metadata !{i32 74, i32 11, metadata !218, null}
!218 = metadata !{i32 786443, metadata !14, metadata !219, i32 74, i32 11, i32 2, i32 12} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fftmisc.c]
!219 = metadata !{i32 786443, metadata !14, metadata !216, i32 74, i32 11, i32 1, i32 11} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fftmisc.c]
!220 = metadata !{i32 76, i32 9, metadata !221, null}
!221 = metadata !{i32 786443, metadata !14, metadata !216, i32 75, i32 5, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fftmisc.c]
!222 = metadata !{i32 77, i32 9, metadata !221, null}
!223 = metadata !{i32 78, i32 5, metadata !221, null}
!224 = metadata !{i32 74, i32 33, metadata !216, null}
!225 = metadata !{i32 80, i32 5, metadata !24, null}
!226 = metadata !{i32 40, i32 15, metadata !34, null}
!227 = metadata !{i32 786689, metadata !34, metadata !"NumSamples", metadata !35, i32 16777256, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [NumSamples] [line 40]
!228 = metadata !{i32 786689, metadata !34, metadata !"InverseTransform", metadata !35, i32 33554473, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [InverseTransform] [line 41]
!229 = metadata !{i32 41, i32 15, metadata !34, null}
!230 = metadata !{i32 786689, metadata !34, metadata !"RealIn", metadata !35, i32 50331690, metadata !38, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [RealIn] [line 42]
!231 = metadata !{i32 42, i32 15, metadata !34, null}
!232 = metadata !{i32 786689, metadata !34, metadata !"ImagIn", metadata !35, i32 67108907, metadata !38, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ImagIn] [line 43]
!233 = metadata !{i32 43, i32 15, metadata !34, null}
!234 = metadata !{i32 786689, metadata !34, metadata !"RealOut", metadata !35, i32 83886124, metadata !38, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [RealOut] [line 44]
!235 = metadata !{i32 44, i32 15, metadata !34, null}
!236 = metadata !{i32 786689, metadata !34, metadata !"ImagOut", metadata !35, i32 100663341, metadata !38, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ImagOut] [line 45]
!237 = metadata !{i32 45, i32 15, metadata !34, null}
!238 = metadata !{i32 786688, metadata !34, metadata !"NumBits", metadata !35, i32 47, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [NumBits] [line 47]
!239 = metadata !{i32 47, i32 14, metadata !34, null}
!240 = metadata !{i32 786688, metadata !34, metadata !"i", metadata !35, i32 48, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 48]
!241 = metadata !{i32 48, i32 14, metadata !34, null}
!242 = metadata !{i32 786688, metadata !34, metadata !"j", metadata !35, i32 48, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 48]
!243 = metadata !{i32 48, i32 17, metadata !34, null}
!244 = metadata !{i32 786688, metadata !34, metadata !"k", metadata !35, i32 48, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 48]
!245 = metadata !{i32 48, i32 20, metadata !34, null}
!246 = metadata !{i32 786688, metadata !34, metadata !"n", metadata !35, i32 48, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 48]
!247 = metadata !{i32 48, i32 23, metadata !34, null}
!248 = metadata !{i32 786688, metadata !34, metadata !"BlockSize", metadata !35, i32 49, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [BlockSize] [line 49]
!249 = metadata !{i32 49, i32 14, metadata !34, null}
!250 = metadata !{i32 786688, metadata !34, metadata !"BlockEnd", metadata !35, i32 49, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [BlockEnd] [line 49]
!251 = metadata !{i32 49, i32 25, metadata !34, null}
!252 = metadata !{i32 786688, metadata !34, metadata !"angle_numerator", metadata !35, i32 51, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [angle_numerator] [line 51]
!253 = metadata !{i32 51, i32 12, metadata !34, null}
!254 = metadata !{i32 51, i32 5, metadata !34, null}
!255 = metadata !{i32 786688, metadata !34, metadata !"tr", metadata !35, i32 52, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tr] [line 52]
!256 = metadata !{i32 52, i32 12, metadata !34, null}
!257 = metadata !{i32 786688, metadata !34, metadata !"ti", metadata !35, i32 52, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ti] [line 52]
!258 = metadata !{i32 52, i32 16, metadata !34, null}
!259 = metadata !{i32 54, i32 11, metadata !260, null}
!260 = metadata !{i32 786443, metadata !32, metadata !34, i32 54, i32 10, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!261 = metadata !{i32 56, i32 9, metadata !262, null}
!262 = metadata !{i32 786443, metadata !32, metadata !260, i32 55, i32 5, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!263 = metadata !{i32 61, i32 9, metadata !262, null}
!264 = metadata !{i32 64, i32 10, metadata !265, null}
!265 = metadata !{i32 786443, metadata !32, metadata !34, i32 64, i32 10, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!266 = metadata !{i32 65, i32 9, metadata !265, null}
!267 = metadata !{i32 67, i32 5, metadata !34, null}
!268 = metadata !{i32 68, i32 5, metadata !34, null}
!269 = metadata !{i32 69, i32 5, metadata !34, null}
!270 = metadata !{i32 71, i32 15, metadata !34, null}
!271 = metadata !{i32 77, i32 11, metadata !272, null}
!272 = metadata !{i32 786443, metadata !32, metadata !34, i32 77, i32 5, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!273 = metadata !{i32 77, i32 11, metadata !274, null}
!274 = metadata !{i32 786443, metadata !32, metadata !275, i32 77, i32 11, i32 2, i32 22} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!275 = metadata !{i32 786443, metadata !32, metadata !272, i32 77, i32 11, i32 1, i32 17} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!276 = metadata !{i32 79, i32 13, metadata !277, null}
!277 = metadata !{i32 786443, metadata !32, metadata !272, i32 78, i32 5, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!278 = metadata !{i32 80, i32 9, metadata !277, null}
!279 = metadata !{i32 81, i32 9, metadata !277, null}
!280 = metadata !{i32 81, i32 9, metadata !281, null}
!281 = metadata !{i32 786443, metadata !32, metadata !277, i32 81, i32 9, i32 1, i32 18} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!282 = metadata !{i32 81, i32 9, metadata !283, null}
!283 = metadata !{i32 786443, metadata !32, metadata !277, i32 81, i32 9, i32 2, i32 19} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!284 = metadata !{i32 81, i32 9, metadata !285, null}
!285 = metadata !{i32 786443, metadata !32, metadata !286, i32 81, i32 9, i32 4, i32 21} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!286 = metadata !{i32 786443, metadata !32, metadata !277, i32 81, i32 9, i32 3, i32 20} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!287 = metadata !{i32 82, i32 5, metadata !277, null}
!288 = metadata !{i32 77, i32 32, metadata !272, null}
!289 = metadata !{i32 88, i32 5, metadata !34, null}
!290 = metadata !{i32 89, i32 11, metadata !291, null}
!291 = metadata !{i32 786443, metadata !32, metadata !34, i32 89, i32 5, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!292 = metadata !{i32 89, i32 11, metadata !293, null}
!293 = metadata !{i32 786443, metadata !32, metadata !294, i32 89, i32 11, i32 2, i32 28} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!294 = metadata !{i32 786443, metadata !32, metadata !291, i32 89, i32 11, i32 1, i32 23} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!295 = metadata !{i32 786688, metadata !296, metadata !"delta_angle", metadata !35, i32 91, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [delta_angle] [line 91]
!296 = metadata !{i32 786443, metadata !32, metadata !291, i32 90, i32 5, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!297 = metadata !{i32 91, i32 16, metadata !296, null}
!298 = metadata !{i32 91, i32 9, metadata !296, null}
!299 = metadata !{i32 786688, metadata !296, metadata !"sm2", metadata !35, i32 92, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sm2] [line 92]
!300 = metadata !{i32 92, i32 16, metadata !296, null}
!301 = metadata !{i32 92, i32 22, metadata !296, null}
!302 = metadata !{i32 786688, metadata !296, metadata !"sm1", metadata !35, i32 93, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sm1] [line 93]
!303 = metadata !{i32 93, i32 16, metadata !296, null}
!304 = metadata !{i32 93, i32 22, metadata !296, null}
!305 = metadata !{i32 786688, metadata !296, metadata !"cm2", metadata !35, i32 94, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cm2] [line 94]
!306 = metadata !{i32 94, i32 16, metadata !296, null}
!307 = metadata !{i32 94, i32 22, metadata !296, null}
!308 = metadata !{i32 786688, metadata !296, metadata !"cm1", metadata !35, i32 95, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cm1] [line 95]
!309 = metadata !{i32 95, i32 16, metadata !296, null}
!310 = metadata !{i32 95, i32 22, metadata !296, null}
!311 = metadata !{i32 786688, metadata !296, metadata !"w", metadata !35, i32 96, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 96]
!312 = metadata !{i32 96, i32 16, metadata !296, null}
!313 = metadata !{i32 96, i32 9, metadata !296, null}
!314 = metadata !{i32 786688, metadata !296, metadata !"ar", metadata !35, i32 97, metadata !315, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ar] [line 97]
!315 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !30, metadata !316, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from double]
!316 = metadata !{metadata !317}
!317 = metadata !{i32 786465, i64 0, i64 3}       ; [ DW_TAG_subrange_type ] [0, 2]
!318 = metadata !{i32 97, i32 16, metadata !296, null}
!319 = metadata !{i32 786688, metadata !296, metadata !"ai", metadata !35, i32 97, metadata !315, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ai] [line 97]
!320 = metadata !{i32 97, i32 23, metadata !296, null}
!321 = metadata !{i32 786688, metadata !296, metadata !"temp", metadata !35, i32 98, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 98]
!322 = metadata !{i32 98, i32 16, metadata !296, null}
!323 = metadata !{i32 100, i32 15, metadata !324, null}
!324 = metadata !{i32 786443, metadata !32, metadata !296, i32 100, i32 9, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!325 = metadata !{i32 100, i32 15, metadata !326, null}
!326 = metadata !{i32 786443, metadata !32, metadata !327, i32 100, i32 15, i32 2, i32 27} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!327 = metadata !{i32 786443, metadata !32, metadata !324, i32 100, i32 15, i32 1, i32 24} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!328 = metadata !{i32 102, i32 13, metadata !329, null}
!329 = metadata !{i32 786443, metadata !32, metadata !324, i32 101, i32 9, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!330 = metadata !{i32 103, i32 13, metadata !329, null}
!331 = metadata !{i32 105, i32 13, metadata !329, null}
!332 = metadata !{i32 106, i32 13, metadata !329, null}
!333 = metadata !{i32 108, i32 19, metadata !334, null}
!334 = metadata !{i32 786443, metadata !32, metadata !329, i32 108, i32 13, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!335 = metadata !{i32 108, i32 19, metadata !336, null}
!336 = metadata !{i32 786443, metadata !32, metadata !337, i32 108, i32 19, i32 2, i32 26} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!337 = metadata !{i32 786443, metadata !32, metadata !334, i32 108, i32 19, i32 1, i32 25} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!338 = metadata !{i32 110, i32 17, metadata !339, null}
!339 = metadata !{i32 786443, metadata !32, metadata !334, i32 109, i32 13, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!340 = metadata !{i32 111, i32 17, metadata !339, null}
!341 = metadata !{i32 112, i32 17, metadata !339, null}
!342 = metadata !{i32 114, i32 17, metadata !339, null}
!343 = metadata !{i32 115, i32 17, metadata !339, null}
!344 = metadata !{i32 116, i32 17, metadata !339, null}
!345 = metadata !{i32 118, i32 17, metadata !339, null}
!346 = metadata !{i32 119, i32 17, metadata !339, null}
!347 = metadata !{i32 120, i32 17, metadata !339, null}
!348 = metadata !{i32 122, i32 17, metadata !339, null}
!349 = metadata !{i32 123, i32 17, metadata !339, null}
!350 = metadata !{i32 125, i32 17, metadata !339, null}
!351 = metadata !{i32 126, i32 17, metadata !339, null}
!352 = metadata !{i32 127, i32 13, metadata !339, null}
!353 = metadata !{i32 108, i32 43, metadata !334, null}
!354 = metadata !{i32 128, i32 9, metadata !329, null}
!355 = metadata !{i32 100, i32 36, metadata !324, null}
!356 = metadata !{i32 130, i32 9, metadata !296, null}
!357 = metadata !{i32 131, i32 5, metadata !296, null}
!358 = metadata !{i32 89, i32 51, metadata !291, null}
!359 = metadata !{i32 137, i32 10, metadata !360, null}
!360 = metadata !{i32 786443, metadata !32, metadata !34, i32 137, i32 10, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!361 = metadata !{i32 786688, metadata !362, metadata !"denom", metadata !35, i32 139, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [denom] [line 139]
!362 = metadata !{i32 786443, metadata !32, metadata !360, i32 138, i32 5, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!363 = metadata !{i32 139, i32 16, metadata !362, null}
!364 = metadata !{i32 139, i32 9, metadata !362, null}
!365 = metadata !{i32 141, i32 15, metadata !366, null}
!366 = metadata !{i32 786443, metadata !32, metadata !362, i32 141, i32 9, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!367 = metadata !{i32 141, i32 15, metadata !368, null}
!368 = metadata !{i32 786443, metadata !32, metadata !369, i32 141, i32 15, i32 2, i32 30} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!369 = metadata !{i32 786443, metadata !32, metadata !366, i32 141, i32 15, i32 1, i32 29} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!370 = metadata !{i32 143, i32 13, metadata !371, null}
!371 = metadata !{i32 786443, metadata !32, metadata !366, i32 142, i32 9, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/fourierf.c]
!372 = metadata !{i32 144, i32 13, metadata !371, null}
!373 = metadata !{i32 145, i32 9, metadata !371, null}
!374 = metadata !{i32 141, i32 36, metadata !366, null}
!375 = metadata !{i32 146, i32 5, metadata !362, null}
!376 = metadata !{i32 147, i32 1, metadata !34, null}
!377 = metadata !{i32 5, i32 14, metadata !5, null}
!378 = metadata !{i32 786689, metadata !5, metadata !"argc", metadata !6, i32 16777221, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 5]
!379 = metadata !{i32 786689, metadata !5, metadata !"argv", metadata !6, i32 33554437, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 5]
!380 = metadata !{i32 5, i32 26, metadata !5, null}
!381 = metadata !{i32 786688, metadata !5, metadata !"MAXSIZE", metadata !6, i32 6, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [MAXSIZE] [line 6]
!382 = metadata !{i32 6, i32 11, metadata !5, null}
!383 = metadata !{i32 786688, metadata !5, metadata !"MAXWAVES", metadata !6, i32 7, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [MAXWAVES] [line 7]
!384 = metadata !{i32 7, i32 11, metadata !5, null}
!385 = metadata !{i32 786688, metadata !5, metadata !"i", metadata !6, i32 8, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 8]
!386 = metadata !{i32 8, i32 11, metadata !5, null} ; [ DW_TAG_imported_declaration ]
!387 = metadata !{i32 786688, metadata !5, metadata !"j", metadata !6, i32 8, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 8]
!388 = metadata !{i32 8, i32 13, metadata !5, null} ; [ DW_TAG_imported_declaration ]
!389 = metadata !{i32 786688, metadata !5, metadata !"RealIn", metadata !6, i32 9, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [RealIn] [line 9]
!390 = metadata !{i32 9, i32 9, metadata !5, null}
!391 = metadata !{i32 786688, metadata !5, metadata !"ImagIn", metadata !6, i32 10, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ImagIn] [line 10]
!392 = metadata !{i32 10, i32 9, metadata !5, null}
!393 = metadata !{i32 786688, metadata !5, metadata !"RealOut", metadata !6, i32 11, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [RealOut] [line 11]
!394 = metadata !{i32 11, i32 9, metadata !5, null}
!395 = metadata !{i32 786688, metadata !5, metadata !"ImagOut", metadata !6, i32 12, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ImagOut] [line 12]
!396 = metadata !{i32 12, i32 9, metadata !5, null}
!397 = metadata !{i32 786688, metadata !5, metadata !"coeff", metadata !6, i32 13, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [coeff] [line 13]
!398 = metadata !{i32 13, i32 9, metadata !5, null}
!399 = metadata !{i32 786688, metadata !5, metadata !"amp", metadata !6, i32 14, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [amp] [line 14]
!400 = metadata !{i32 14, i32 9, metadata !5, null}
!401 = metadata !{i32 786688, metadata !5, metadata !"invfft", metadata !6, i32 15, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [invfft] [line 15]
!402 = metadata !{i32 15, i32 6, metadata !5, null}
!403 = metadata !{i32 15, i32 2, metadata !5, null}
!404 = metadata !{i32 17, i32 6, metadata !405, null}
!405 = metadata !{i32 786443, metadata !2, metadata !5, i32 17, i32 6, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!406 = metadata !{i32 19, i32 3, metadata !407, null}
!407 = metadata !{i32 786443, metadata !2, metadata !405, i32 18, i32 2, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!408 = metadata !{i32 20, i32 3, metadata !407, null}
!409 = metadata !{i32 21, i32 3, metadata !407, null}
!410 = metadata !{i32 22, i32 3, metadata !407, null}
!411 = metadata !{i32 23, i32 3, metadata !407, null}
!412 = metadata !{i32 25, i32 11, metadata !413, null}
!413 = metadata !{i32 786443, metadata !2, metadata !405, i32 25, i32 11, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!414 = metadata !{i32 26, i32 13, metadata !413, null}
!415 = metadata !{i32 27, i32 10, metadata !5, null}
!416 = metadata !{i32 28, i32 11, metadata !5, null}
!417 = metadata !{i32 30, i32 2, metadata !5, null}
!418 = metadata !{i32 32, i32 17, metadata !5, null}
!419 = metadata !{i32 33, i32 17, metadata !5, null}
!420 = metadata !{i32 34, i32 18, metadata !5, null}
!421 = metadata !{i32 35, i32 18, metadata !5, null}
!422 = metadata !{i32 36, i32 16, metadata !5, null}
!423 = metadata !{i32 37, i32 14, metadata !5, null}
!424 = metadata !{i32 40, i32 6, metadata !425, null}
!425 = metadata !{i32 786443, metadata !2, metadata !5, i32 40, i32 2, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!426 = metadata !{i32 40, i32 6, metadata !427, null}
!427 = metadata !{i32 786443, metadata !2, metadata !428, i32 40, i32 6, i32 2, i32 15} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!428 = metadata !{i32 786443, metadata !2, metadata !425, i32 40, i32 6, i32 1, i32 14} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!429 = metadata !{i32 42, i32 14, metadata !430, null}
!430 = metadata !{i32 786443, metadata !2, metadata !425, i32 41, i32 2, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!431 = metadata !{i32 43, i32 12, metadata !430, null}
!432 = metadata !{i32 44, i32 2, metadata !430, null}
!433 = metadata !{i32 40, i32 21, metadata !425, null}
!434 = metadata !{i32 45, i32 6, metadata !435, null}
!435 = metadata !{i32 786443, metadata !2, metadata !5, i32 45, i32 2, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!436 = metadata !{i32 45, i32 6, metadata !437, null}
!437 = metadata !{i32 786443, metadata !2, metadata !438, i32 45, i32 6, i32 2, i32 19} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!438 = metadata !{i32 786443, metadata !2, metadata !435, i32 45, i32 6, i32 1, i32 16} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!439 = metadata !{i32 48, i32 3, metadata !440, null}
!440 = metadata !{i32 786443, metadata !2, metadata !435, i32 46, i32 2, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!441 = metadata !{i32 49, i32 7, metadata !442, null}
!442 = metadata !{i32 786443, metadata !2, metadata !440, i32 49, i32 3, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!443 = metadata !{i32 49, i32 7, metadata !444, null}
!444 = metadata !{i32 786443, metadata !2, metadata !445, i32 49, i32 7, i32 2, i32 18} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!445 = metadata !{i32 786443, metadata !2, metadata !442, i32 49, i32 7, i32 1, i32 17} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!446 = metadata !{i32 52, i32 8, metadata !447, null}
!447 = metadata !{i32 786443, metadata !2, metadata !448, i32 52, i32 8, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!448 = metadata !{i32 786443, metadata !2, metadata !442, i32 50, i32 3, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!449 = metadata !{i32 54, i32 6, metadata !450, null}
!450 = metadata !{i32 786443, metadata !2, metadata !447, i32 53, i32 4, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!451 = metadata !{i32 54, i32 26, metadata !450, null}
!452 = metadata !{i32 55, i32 4, metadata !450, null}
!453 = metadata !{i32 58, i32 5, metadata !454, null} ; [ DW_TAG_imported_module ]
!454 = metadata !{i32 786443, metadata !2, metadata !447, i32 57, i32 4, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!455 = metadata !{i32 58, i32 25, metadata !454, null} ; [ DW_TAG_imported_module ]
!456 = metadata !{i32 60, i32 5, metadata !448, null}
!457 = metadata !{i32 61, i32 3, metadata !448, null}
!458 = metadata !{i32 49, i32 22, metadata !442, null}
!459 = metadata !{i32 62, i32 2, metadata !440, null}
!460 = metadata !{i32 45, i32 20, metadata !435, null}
!461 = metadata !{i32 65, i32 2, metadata !5, null}
!462 = metadata !{i32 67, i32 2, metadata !5, null}
!463 = metadata !{i32 68, i32 7, metadata !464, null}
!464 = metadata !{i32 786443, metadata !2, metadata !5, i32 68, i32 2, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!465 = metadata !{i32 68, i32 7, metadata !466, null}
!466 = metadata !{i32 786443, metadata !2, metadata !467, i32 68, i32 7, i32 2, i32 21} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!467 = metadata !{i32 786443, metadata !2, metadata !464, i32 68, i32 7, i32 1, i32 20} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!468 = metadata !{i32 69, i32 4, metadata !464, null}
!469 = metadata !{i32 68, i32 21, metadata !464, null}
!470 = metadata !{i32 70, i32 2, metadata !5, null}
!471 = metadata !{i32 72, i32 1, metadata !5, null}
!472 = metadata !{i32 73, i32 7, metadata !473, null}
!473 = metadata !{i32 786443, metadata !2, metadata !5, i32 73, i32 2, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!474 = metadata !{i32 73, i32 7, metadata !475, null}
!475 = metadata !{i32 786443, metadata !2, metadata !476, i32 73, i32 7, i32 2, i32 23} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!476 = metadata !{i32 786443, metadata !2, metadata !473, i32 73, i32 7, i32 1, i32 22} ; [ DW_TAG_lexical_block ] [/home/sslee/work/mibench/FFT/main.c]
!477 = metadata !{i32 74, i32 4, metadata !473, null}
!478 = metadata !{i32 73, i32 21, metadata !473, null}
!479 = metadata !{i32 75, i32 4, metadata !5, null}
!480 = metadata !{i32 77, i32 2, metadata !5, null}
!481 = metadata !{i32 78, i32 2, metadata !5, null}
!482 = metadata !{i32 79, i32 2, metadata !5, null}
!483 = metadata !{i32 80, i32 2, metadata !5, null}
!484 = metadata !{i32 81, i32 2, metadata !5, null}
!485 = metadata !{i32 82, i32 2, metadata !5, null}
!486 = metadata !{i32 83, i32 2, metadata !5, null}
!487 = metadata !{i32 86, i32 1, metadata !5, null}
