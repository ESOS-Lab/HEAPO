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
%struct._QITEM.2 = type { i32, i32, i32, %struct._QITEM.2* }
%struct._NODE.3 = type { i32, i32 }
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
@.str23 = private unnamed_addr constant [59 x i8] c"[Heap Variable Summary] : ALL: %d, NVRAM:   %d fit nvram \0A\00", align 1
@_ZNSs4_Rep20_S_empty_rep_storageE = external global [0 x i64]
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_pFunctions.cpp, i8* null }]
@qHead = global %struct._QITEM.2* null, align 8
@g_qCount = global i32 0, align 4
@.str1 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@stdout = external global %struct._IO_FILE.1*
@.str16 = private unnamed_addr constant [16 x i8] c"Out of memory.\0A\00", align 1
@ch = common global i32 0, align 4
@rgnNodes = common global [100 x %struct._NODE.3] zeroinitializer, align 16
@.str2 = private unnamed_addr constant [54 x i8] c"Shortest path is 0 in cost. Just stay where you are.\0A\00", align 1
@iNode = common global i32 0, align 4
@iDist = common global i32 0, align 4
@iPrev = common global i32 0, align 4
@i = common global i32 0, align 4
@AdjMatrix = common global [100 x [100 x i32]] zeroinitializer, align 16
@iCost = common global i32 0, align 4
@.str37 = private unnamed_addr constant [30 x i8] c"Shortest path is %d in cost. \00", align 1
@.str48 = private unnamed_addr constant [10 x i8] c"Path is: \00", align 1
@.str59 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str610 = private unnamed_addr constant [28 x i8] c"Usage: dijkstra <filename>\0A\00", align 1
@.str711 = private unnamed_addr constant [41 x i8] c"Only supports matrix size is #define'd.\0A\00", align 1
@.str812 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str913 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@sdmprofile__GV_Name_.str = private unnamed_addr constant [5 x i8] c".str\00"
@sdmprofile__GV_Type_.str = private unnamed_addr constant [11 x i8] c"[18 x i8]*\00"
@sdmprofile__GV_FileName_.str = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_.str = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_.str1 = private unnamed_addr constant [6 x i8] c".str1\00"
@sdmprofile__GV_Type_.str1 = private unnamed_addr constant [10 x i8] c"[4 x i8]*\00"
@sdmprofile__GV_FileName_.str1 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_.str1 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_.str2 = private unnamed_addr constant [6 x i8] c".str2\00"
@sdmprofile__GV_Type_.str2 = private unnamed_addr constant [11 x i8] c"[54 x i8]*\00"
@sdmprofile__GV_FileName_.str2 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_.str2 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_.str3 = private unnamed_addr constant [6 x i8] c".str3\00"
@sdmprofile__GV_Type_.str3 = private unnamed_addr constant [10 x i8] c"[3 x i8]*\00"
@sdmprofile__GV_FileName_.str3 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_.str3 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_.str4 = private unnamed_addr constant [6 x i8] c".str4\00"
@sdmprofile__GV_Type_.str4 = private unnamed_addr constant [12 x i8] c"[100 x i8]*\00"
@sdmprofile__GV_FileName_.str4 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_.str4 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_.str5 = private unnamed_addr constant [6 x i8] c".str5\00"
@sdmprofile__GV_Type_.str5 = private unnamed_addr constant [11 x i8] c"[23 x i8]*\00"
@sdmprofile__GV_FileName_.str5 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_.str5 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_.str6 = private unnamed_addr constant [6 x i8] c".str6\00"
@sdmprofile__GV_Type_.str6 = private unnamed_addr constant [10 x i8] c"[4 x i8]*\00"
@sdmprofile__GV_FileName_.str6 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_.str6 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_.str7 = private unnamed_addr constant [6 x i8] c".str7\00"
@sdmprofile__GV_Type_.str7 = private unnamed_addr constant [12 x i8] c"[124 x i8]*\00"
@sdmprofile__GV_FileName_.str7 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_.str7 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_.str8 = private unnamed_addr constant [6 x i8] c".str8\00"
@sdmprofile__GV_Type_.str8 = private unnamed_addr constant [11 x i8] c"[26 x i8]*\00"
@sdmprofile__GV_FileName_.str8 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_.str8 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_.str9 = private unnamed_addr constant [6 x i8] c".str9\00"
@sdmprofile__GV_Type_.str9 = private unnamed_addr constant [12 x i8] c"[171 x i8]*\00"
@sdmprofile__GV_FileName_.str9 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_.str9 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_AdjMatrix = private unnamed_addr constant [10 x i8] c"AdjMatrix\00"
@sdmprofile__GV_Type_AdjMatrix = private unnamed_addr constant [21 x i8] c"[100 x [100 x i32]]*\00"
@sdmprofile__GV_FileName_AdjMatrix = private unnamed_addr constant [17 x i8] c"dijkstra_large.c\00"
@sdmprofile__GV_FileDir_AdjMatrix = private unnamed_addr constant [53 x i8] c"/home/sslee/work/regen/test/mibench/network/dijkstra\00"
@sdmprofile__GV_Name_ch = private unnamed_addr constant [3 x i8] c"ch\00"
@sdmprofile__GV_Type_ch = private unnamed_addr constant [5 x i8] c"i32*\00"
@sdmprofile__GV_FileName_ch = private unnamed_addr constant [17 x i8] c"dijkstra_large.c\00"
@sdmprofile__GV_FileDir_ch = private unnamed_addr constant [53 x i8] c"/home/sslee/work/regen/test/mibench/network/dijkstra\00"
@sdmprofile__GV_Name_g_qCount = private unnamed_addr constant [9 x i8] c"g_qCount\00"
@sdmprofile__GV_Type_g_qCount = private unnamed_addr constant [5 x i8] c"i32*\00"
@sdmprofile__GV_FileName_g_qCount = private unnamed_addr constant [17 x i8] c"dijkstra_large.c\00"
@sdmprofile__GV_FileDir_g_qCount = private unnamed_addr constant [53 x i8] c"/home/sslee/work/regen/test/mibench/network/dijkstra\00"
@sdmprofile__GV_Name_i = private unnamed_addr constant [2 x i8] c"i\00"
@sdmprofile__GV_Type_i = private unnamed_addr constant [5 x i8] c"i32*\00"
@sdmprofile__GV_FileName_i = private unnamed_addr constant [17 x i8] c"dijkstra_large.c\00"
@sdmprofile__GV_FileDir_i = private unnamed_addr constant [53 x i8] c"/home/sslee/work/regen/test/mibench/network/dijkstra\00"
@sdmprofile__GV_Name_iCost = private unnamed_addr constant [6 x i8] c"iCost\00"
@sdmprofile__GV_Type_iCost = private unnamed_addr constant [5 x i8] c"i32*\00"
@sdmprofile__GV_FileName_iCost = private unnamed_addr constant [17 x i8] c"dijkstra_large.c\00"
@sdmprofile__GV_FileDir_iCost = private unnamed_addr constant [53 x i8] c"/home/sslee/work/regen/test/mibench/network/dijkstra\00"
@sdmprofile__GV_Name_iDist = private unnamed_addr constant [6 x i8] c"iDist\00"
@sdmprofile__GV_Type_iDist = private unnamed_addr constant [5 x i8] c"i32*\00"
@sdmprofile__GV_FileName_iDist = private unnamed_addr constant [17 x i8] c"dijkstra_large.c\00"
@sdmprofile__GV_FileDir_iDist = private unnamed_addr constant [53 x i8] c"/home/sslee/work/regen/test/mibench/network/dijkstra\00"
@sdmprofile__GV_Name_iNode = private unnamed_addr constant [6 x i8] c"iNode\00"
@sdmprofile__GV_Type_iNode = private unnamed_addr constant [5 x i8] c"i32*\00"
@sdmprofile__GV_FileName_iNode = private unnamed_addr constant [17 x i8] c"dijkstra_large.c\00"
@sdmprofile__GV_FileDir_iNode = private unnamed_addr constant [53 x i8] c"/home/sslee/work/regen/test/mibench/network/dijkstra\00"
@sdmprofile__GV_Name_iPrev = private unnamed_addr constant [6 x i8] c"iPrev\00"
@sdmprofile__GV_Type_iPrev = private unnamed_addr constant [5 x i8] c"i32*\00"
@sdmprofile__GV_FileName_iPrev = private unnamed_addr constant [17 x i8] c"dijkstra_large.c\00"
@sdmprofile__GV_FileDir_iPrev = private unnamed_addr constant [53 x i8] c"/home/sslee/work/regen/test/mibench/network/dijkstra\00"
@sdmprofile__GV_Name_qHead = private unnamed_addr constant [6 x i8] c"qHead\00"
@sdmprofile__GV_Type_qHead = private unnamed_addr constant [19 x i8] c"%struct._QITEM.2**\00"
@sdmprofile__GV_FileName_qHead = private unnamed_addr constant [17 x i8] c"dijkstra_large.c\00"
@sdmprofile__GV_FileDir_qHead = private unnamed_addr constant [53 x i8] c"/home/sslee/work/regen/test/mibench/network/dijkstra\00"
@sdmprofile__GV_Name_rgnNodes = private unnamed_addr constant [9 x i8] c"rgnNodes\00"
@sdmprofile__GV_Type_rgnNodes = private unnamed_addr constant [25 x i8] c"[100 x %struct._NODE.3]*\00"
@sdmprofile__GV_FileName_rgnNodes = private unnamed_addr constant [17 x i8] c"dijkstra_large.c\00"
@sdmprofile__GV_FileDir_rgnNodes = private unnamed_addr constant [53 x i8] c"/home/sslee/work/regen/test/mibench/network/dijkstra\00"
@sdmprofile__GV_Name_stderr = private unnamed_addr constant [7 x i8] c"stderr\00"
@sdmprofile__GV_Type_stderr = private unnamed_addr constant [21 x i8] c"%struct._IO_FILE.1**\00"
@sdmprofile__GV_FileName_stderr = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_stderr = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_stdout = private unnamed_addr constant [7 x i8] c"stdout\00"
@sdmprofile__GV_Type_stdout = private unnamed_addr constant [21 x i8] c"%struct._IO_FILE.1**\00"
@sdmprofile__GV_FileName_stdout = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_stdout = private unnamed_addr constant [2 x i8] c"-\00"

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
  store %struct.HeapAllocationMeta* %0, %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !62
  %call1 = tail call i32 @_Z17RegisterNewThreadv()
  store i32 %call1, i32* @sdmprofile__MainthreadNumber, align 4, !tbaa !66
  %1 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !62
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %1, i64 0, i32 1
  %2 = bitcast i8** %upperbound to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 20, i32 8, i1 false)
  %3 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !62
  %ptr = getelementptr inbounds %struct.HeapAllocationMeta* %3, i64 0, i32 0
  store i8* null, i8** %ptr, align 8, !tbaa !68
  store i64 0, i64* getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 0), align 8, !tbaa !71
  store i8* null, i8** getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 3), align 8, !tbaa !73
  store i32 0, i32* getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 4), align 8, !tbaa !74
  call void @llvm.memset.p0i8.i64(i8* bitcast (i8** getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 5) to i8*), i8 0, i64 24, i32 8, i1 false)
  %4 = load i32* @sdmprofile__IncludeStackProfiling, align 4, !tbaa !66
  %tobool = icmp eq i32 %4, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call2 = tail call noalias i8* @malloc(i64 240000) #2
  %5 = bitcast i8* %call2 to %struct.sdmprofile__Allocated_Stack_item*
  store %struct.sdmprofile__Allocated_Stack_item* %5, %struct.sdmprofile__Allocated_Stack_item** @sdmprofile__MainthreadStack_allo, align 8, !tbaa !62
  %ptr.ind.end = getelementptr i8* %call2, i64 240000
  %6 = bitcast i8* %ptr.ind.end to %struct.sdmprofile__Allocated_Stack_item*
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %if.then
  %index = phi i64 [ 0, %if.then ], [ %index.next.1, %vector.body ]
  %gep.idx1315 = or i64 %index, 1
  %7 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index, i32 0
  %8 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315, i32 0
  store i8* null, i8** %7, align 8, !tbaa !75
  store i8* null, i8** %8, align 8, !tbaa !75
  %9 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index, i32 2
  %10 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315, i32 2
  store i8* null, i8** %9, align 8, !tbaa !77
  store i8* null, i8** %10, align 8, !tbaa !77
  %index.next = add i64 %index, 2
  %gep.idx1315.1 = or i64 %index.next, 1
  %11 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index.next, i32 0
  %12 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315.1, i32 0
  store i8* null, i8** %11, align 8, !tbaa !75
  store i8* null, i8** %12, align 8, !tbaa !75
  %13 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index.next, i32 2
  %14 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315.1, i32 2
  store i8* null, i8** %13, align 8, !tbaa !77
  store i8* null, i8** %14, align 8, !tbaa !77
  %index.next.1 = add i64 %index.next, 2
  %15 = icmp eq i64 %index.next.1, 10000
  br i1 %15, label %if.end.loopexit, label %vector.body, !llvm.loop !78

if.end.loopexit:                                  ; preds = %vector.body
  br label %if.end

if.end:                                           ; preds = %if.end.loopexit, %entry
  store double 0.000000e+00, double* @sdmprofile__AppEndTime, align 8, !tbaa !81
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind uwtable
define i32 @_Z17RegisterNewThreadv() #3 {
entry:
  %call = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %0 = load i32* @thdsCount, align 4, !tbaa !66
  %idxprom = sext i32 %0 to i64
  %threadnumber = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 0
  store i32 %0, i32* %threadnumber, align 8, !tbaa !83
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @thdsCount, align 4, !tbaa !66
  %call1 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %call2 = tail call i64 @pthread_self() #12
  %threadID = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 1
  store i64 %call2, i64* %threadID, align 8, !tbaa !85
  %call3 = tail call double @sdmprofile__getRealTime()
  %ThreadStartTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 2
  store double %call3, double* %ThreadStartTime, align 8, !tbaa !86
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double 0.000000e+00, double* %ThreadEndTime, align 8, !tbaa !87
  %Malloc_Calls = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 6
  %1 = bitcast i64* %Malloc_Calls to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 88, i32 8, i1 false)
  %2 = load i32* @sdmprofile__profileAction, align 4, !tbaa !66
  switch i32 %2, label %if.end [
    i32 4, label %if.then
    i32 1, label %if.then
  ]

if.then:                                          ; preds = %entry, %entry
  %call5 = tail call noalias i8* @malloc(i64 128) #2
  %3 = bitcast i8* %call5 to %struct.Cache2_Item*
  %Cache2_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 19
  store %struct.Cache2_Item* %3, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !88
  %4 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !62
  %ptr = bitcast i8* %call5 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !89
  %add.ptr8 = getelementptr inbounds i8* %call5, i64 16
  %5 = bitcast i8* %add.ptr8 to %struct.Cache2_Item*
  %next = getelementptr inbounds i8* %call5, i64 8
  %6 = bitcast i8* %next to %struct.Cache2_Item**
  store %struct.Cache2_Item* %5, %struct.Cache2_Item** %6, align 8, !tbaa !91
  %ptr.1 = getelementptr inbounds i8* %call5, i64 16
  %7 = bitcast i8* %ptr.1 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %7, align 8, !tbaa !89
  %add.ptr8.1 = getelementptr inbounds i8* %call5, i64 32
  %8 = bitcast i8* %add.ptr8.1 to %struct.Cache2_Item*
  %next.1 = getelementptr inbounds i8* %call5, i64 24
  %9 = bitcast i8* %next.1 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %8, %struct.Cache2_Item** %9, align 8, !tbaa !91
  %ptr.2 = getelementptr inbounds i8* %call5, i64 32
  %10 = bitcast i8* %ptr.2 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %10, align 8, !tbaa !89
  %add.ptr8.2 = getelementptr inbounds i8* %call5, i64 48
  %11 = bitcast i8* %add.ptr8.2 to %struct.Cache2_Item*
  %next.2 = getelementptr inbounds i8* %call5, i64 40
  %12 = bitcast i8* %next.2 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %11, %struct.Cache2_Item** %12, align 8, !tbaa !91
  %ptr.3 = getelementptr inbounds i8* %call5, i64 48
  %13 = bitcast i8* %ptr.3 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %13, align 8, !tbaa !89
  %add.ptr8.3 = getelementptr inbounds i8* %call5, i64 64
  %14 = bitcast i8* %add.ptr8.3 to %struct.Cache2_Item*
  %next.3 = getelementptr inbounds i8* %call5, i64 56
  %15 = bitcast i8* %next.3 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %14, %struct.Cache2_Item** %15, align 8, !tbaa !91
  %ptr.4 = getelementptr inbounds i8* %call5, i64 64
  %16 = bitcast i8* %ptr.4 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %16, align 8, !tbaa !89
  %add.ptr8.4 = getelementptr inbounds i8* %call5, i64 80
  %17 = bitcast i8* %add.ptr8.4 to %struct.Cache2_Item*
  %next.4 = getelementptr inbounds i8* %call5, i64 72
  %18 = bitcast i8* %next.4 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %17, %struct.Cache2_Item** %18, align 8, !tbaa !91
  %ptr.5 = getelementptr inbounds i8* %call5, i64 80
  %19 = bitcast i8* %ptr.5 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %19, align 8, !tbaa !89
  %add.ptr8.5 = getelementptr inbounds i8* %call5, i64 96
  %20 = bitcast i8* %add.ptr8.5 to %struct.Cache2_Item*
  %next.5 = getelementptr inbounds i8* %call5, i64 88
  %21 = bitcast i8* %next.5 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %20, %struct.Cache2_Item** %21, align 8, !tbaa !91
  %ptr.6 = getelementptr inbounds i8* %call5, i64 96
  %22 = bitcast i8* %ptr.6 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %22, align 8, !tbaa !89
  %add.ptr8.6 = getelementptr inbounds i8* %call5, i64 112
  %23 = bitcast i8* %add.ptr8.6 to %struct.Cache2_Item*
  %next.6 = getelementptr inbounds i8* %call5, i64 104
  %24 = bitcast i8* %next.6 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %23, %struct.Cache2_Item** %24, align 8, !tbaa !91
  %add.ptr10 = getelementptr inbounds i8* %call5, i64 112
  %ptr11 = bitcast i8* %add.ptr10 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %ptr11, align 8, !tbaa !89
  %next13 = getelementptr inbounds i8* %call5, i64 120
  %25 = bitcast i8* %next13 to %struct.Cache2_Item**
  store %struct.Cache2_Item* null, %struct.Cache2_Item** %25, align 8, !tbaa !91
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %.off = add i32 %2, -3
  %26 = icmp ult i32 %.off, 2
  br i1 %26, label %if.then17, label %if.end39

if.then17:                                        ; preds = %if.end
  %call19 = tail call noalias i8* @malloc(i64 128) #2
  %27 = bitcast i8* %call19 to %struct.GVCache_Item*
  %GVCache_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 20
  store %struct.GVCache_Item* %27, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !92
  %ptr27 = bitcast i8* %call19 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %ptr27, align 8, !tbaa !93
  %add.ptr30 = getelementptr inbounds i8* %call19, i64 16
  %28 = bitcast i8* %add.ptr30 to %struct.GVCache_Item*
  %next31 = getelementptr inbounds i8* %call19, i64 8
  %29 = bitcast i8* %next31 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %28, %struct.GVCache_Item** %29, align 8, !tbaa !95
  %ptr27.1 = getelementptr inbounds i8* %call19, i64 16
  %30 = bitcast i8* %ptr27.1 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %30, align 8, !tbaa !93
  %add.ptr30.1 = getelementptr inbounds i8* %call19, i64 32
  %31 = bitcast i8* %add.ptr30.1 to %struct.GVCache_Item*
  %next31.1 = getelementptr inbounds i8* %call19, i64 24
  %32 = bitcast i8* %next31.1 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %31, %struct.GVCache_Item** %32, align 8, !tbaa !95
  %ptr27.2 = getelementptr inbounds i8* %call19, i64 32
  %33 = bitcast i8* %ptr27.2 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %33, align 8, !tbaa !93
  %add.ptr30.2 = getelementptr inbounds i8* %call19, i64 48
  %34 = bitcast i8* %add.ptr30.2 to %struct.GVCache_Item*
  %next31.2 = getelementptr inbounds i8* %call19, i64 40
  %35 = bitcast i8* %next31.2 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %34, %struct.GVCache_Item** %35, align 8, !tbaa !95
  %ptr27.3 = getelementptr inbounds i8* %call19, i64 48
  %36 = bitcast i8* %ptr27.3 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %36, align 8, !tbaa !93
  %add.ptr30.3 = getelementptr inbounds i8* %call19, i64 64
  %37 = bitcast i8* %add.ptr30.3 to %struct.GVCache_Item*
  %next31.3 = getelementptr inbounds i8* %call19, i64 56
  %38 = bitcast i8* %next31.3 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %37, %struct.GVCache_Item** %38, align 8, !tbaa !95
  %ptr27.4 = getelementptr inbounds i8* %call19, i64 64
  %39 = bitcast i8* %ptr27.4 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %39, align 8, !tbaa !93
  %add.ptr30.4 = getelementptr inbounds i8* %call19, i64 80
  %40 = bitcast i8* %add.ptr30.4 to %struct.GVCache_Item*
  %next31.4 = getelementptr inbounds i8* %call19, i64 72
  %41 = bitcast i8* %next31.4 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %40, %struct.GVCache_Item** %41, align 8, !tbaa !95
  %ptr27.5 = getelementptr inbounds i8* %call19, i64 80
  %42 = bitcast i8* %ptr27.5 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %42, align 8, !tbaa !93
  %add.ptr30.5 = getelementptr inbounds i8* %call19, i64 96
  %43 = bitcast i8* %add.ptr30.5 to %struct.GVCache_Item*
  %next31.5 = getelementptr inbounds i8* %call19, i64 88
  %44 = bitcast i8* %next31.5 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %43, %struct.GVCache_Item** %44, align 8, !tbaa !95
  %ptr27.6 = getelementptr inbounds i8* %call19, i64 96
  %45 = bitcast i8* %ptr27.6 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %45, align 8, !tbaa !93
  %add.ptr30.6 = getelementptr inbounds i8* %call19, i64 112
  %46 = bitcast i8* %add.ptr30.6 to %struct.GVCache_Item*
  %next31.6 = getelementptr inbounds i8* %call19, i64 104
  %47 = bitcast i8* %next31.6 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %46, %struct.GVCache_Item** %47, align 8, !tbaa !95
  %add.ptr35 = getelementptr inbounds i8* %call19, i64 112
  %ptr36 = bitcast i8* %add.ptr35 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %ptr36, align 8, !tbaa !93
  %next38 = getelementptr inbounds i8* %call19, i64 120
  %48 = bitcast i8* %next38 to %struct.GVCache_Item**
  store %struct.GVCache_Item* null, %struct.GVCache_Item** %48, align 8, !tbaa !95
  br label %if.end39

if.end39:                                         ; preds = %if.then17, %if.end
  %49 = load i32* @sdmprofile__IncludeStackProfiling, align 4, !tbaa !66
  %tobool = icmp eq i32 %49, 0
  br i1 %tobool, label %if.end42, label %if.then40

if.then40:                                        ; preds = %if.end39
  %call41 = tail call noalias i8* @malloc(i64 240000) #2
  %50 = bitcast i8* %call41 to %struct.sdmprofile__Allocated_Stack_item*
  %Stack_allocations_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 4
  store %struct.sdmprofile__Allocated_Stack_item* %50, %struct.sdmprofile__Allocated_Stack_item** %Stack_allocations_head, align 8, !tbaa !96
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %if.end39
  %51 = load i32* %threadnumber, align 8, !tbaa !83
  ret i32 %51
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__Embed_metadata_GV(i64 %index__, i8* %AtAddress, i32 %size_, i8* %Name_string_ptr, i8* %DataType_string_ptr, i8* %FilenameStringptr_, i8* %FileDirStringptr_, i64 %linenumber__) #3 {
entry:
  %I = alloca %struct.GVMeta*, align 8
  %call = tail call noalias i8* @malloc(i64 88) #2
  %0 = bitcast i8* %call to %struct.GVMeta*
  store %struct.GVMeta* %0, %struct.GVMeta** %I, align 8, !tbaa !62
  %index = bitcast i8* %call to i64*
  store i64 %index__, i64* %index, align 8, !tbaa !71
  %address = getelementptr inbounds i8* %call, i64 24
  %1 = bitcast i8* %address to i8**
  store i8* %AtAddress, i8** %1, align 8, !tbaa !73
  %size = getelementptr inbounds i8* %call, i64 32
  %2 = bitcast i8* %size to i32*
  store i32 %size_, i32* %2, align 4, !tbaa !74
  %VarName = getelementptr inbounds i8* %call, i64 40
  %3 = bitcast i8* %VarName to i8**
  store i8* %Name_string_ptr, i8** %3, align 8, !tbaa !97
  %DataTypeString = getelementptr inbounds i8* %call, i64 48
  %4 = bitcast i8* %DataTypeString to i8**
  store i8* %DataType_string_ptr, i8** %4, align 8, !tbaa !98
  %5 = ptrtoint i8* %AtAddress to i64
  %conv = zext i32 %size_ to i64
  %add = add i64 %conv, %5
  %6 = inttoptr i64 %add to i8*
  %upperbound = getelementptr inbounds i8* %call, i64 56
  %7 = bitcast i8* %upperbound to i8**
  store i8* %6, i8** %7, align 8, !tbaa !99
  %r = getelementptr inbounds i8* %call, i64 8
  %FileName = getelementptr inbounds i8* %call, i64 64
  %8 = bitcast i8* %FileName to i8**
  call void @llvm.memset.p0i8.i64(i8* %r, i8 0, i64 16, i32 8, i1 false)
  store i8* %FilenameStringptr_, i8** %8, align 8, !tbaa !100
  %DirName = getelementptr inbounds i8* %call, i64 72
  %9 = bitcast i8* %DirName to i8**
  store i8* %FileDirStringptr_, i8** %9, align 8, !tbaa !101
  %linenumber = getelementptr inbounds i8* %call, i64 80
  %10 = bitcast i8* %linenumber to i64*
  store i64 %linenumber__, i64* %10, align 8, !tbaa !102
  call void @_ZNSt12forward_listIP6GVMetaSaIS1_EE10push_frontERKS1_(%"class.std::forward_list"* @GVMetalist, %struct.GVMeta** dereferenceable(8) %I)
  %11 = load i8** @GV_AddrRangeHead, align 8, !tbaa !62
  %cmp = icmp eq i8* %11, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i8* %AtAddress, i8** @GV_AddrRangeHead, align 8, !tbaa !62
  store i8* %6, i8** @GV_AddrRangeTail, align 8, !tbaa !62
  br label %if.end12

if.else:                                          ; preds = %entry
  %cmp3 = icmp ugt i8* %11, %AtAddress
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.else
  store i8* %AtAddress, i8** @GV_AddrRangeHead, align 8, !tbaa !62
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.else
  %12 = load i8** @GV_AddrRangeTail, align 8, !tbaa !62
  %cmp7 = icmp ult i8* %12, %6
  br i1 %cmp7, label %if.then8, label %if.end12

if.then8:                                         ; preds = %if.end
  store i8* %6, i8** @GV_AddrRangeTail, align 8, !tbaa !62
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
  store i64 %index__, i64* %index, align 8, !tbaa !103
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 3
  store i32 %size_, i32* %size, align 8, !tbaa !105
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 4
  store i8* %Estimated_Name_string_ptr, i8** %EstimatedName, align 8, !tbaa !106
  %DataTypeString = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 5
  store i8* %DataType_string_ptr, i8** %DataTypeString, align 8, !tbaa !107
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 6
  store i8* %FunctionName_string_ptr, i8** %FunctionName, align 8, !tbaa !108
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__Embed_metadata_HP(i32 %index__, i8* %Estimated_Name_string_ptr, i8* %DataType_string_ptr, i8* %FunctionName_string_ptr, i64 %linenumber__, i8* %SourceFile__) #3 {
entry:
  %idxprom = zext i32 %index__ to i64
  %index = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 0
  store i32 %index__, i32* %index, align 16, !tbaa !109
  %EstimatedName = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 3
  store i8* %Estimated_Name_string_ptr, i8** %EstimatedName, align 8, !tbaa !111
  %EstimatedDataTypeString = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 4
  store i8* %DataType_string_ptr, i8** %EstimatedDataTypeString, align 16, !tbaa !112
  %FunctionName = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 5
  store i8* %FunctionName_string_ptr, i8** %FunctionName, align 8, !tbaa !113
  %linenumber = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 6
  store i64 %linenumber__, i64* %linenumber, align 16, !tbaa !114
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 7
  store i8* %SourceFile__, i8** %SourceFile, align 8, !tbaa !115
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
  %0 = load %struct.GVMeta** %call4, align 8, !tbaa !62
  %index = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 0
  %1 = load i64* %index, align 8, !tbaa !71
  %cmp = icmp eq i64 %1, %index__
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %r = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 1
  %2 = load i64* %r, align 8, !tbaa !116
  %add = add i64 %2, %mul
  store i64 %add, i64* %r, align 8, !tbaa !116
  %w = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 2
  %3 = load i64* %w, align 8, !tbaa !117
  %add8 = add i64 %3, %mul7
  store i64 %add8, i64* %w, align 8, !tbaa !117
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
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !118
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
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !122
  %_M_node2 = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %__x, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_node2, align 8, !tbaa !122
  %cmp = icmp ne %"struct.std::_Fwd_list_node_base"* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(8) %struct.GVMeta** @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEdeEv(%"struct.std::_Fwd_list_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !122
  %1 = bitcast %"struct.std::_Fwd_list_node_base"* %0 to %"struct.std::_Fwd_list_node"*
  %call = tail call %struct.GVMeta** @_ZNSt14_Fwd_list_nodeIP6GVMetaE9_M_valptrEv(%"struct.std::_Fwd_list_node"* %1) #2
  ret %struct.GVMeta** %call
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %this) #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !122
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %0, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !124
  store %"struct.std::_Fwd_list_node_base"* %1, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !122
  ret %"struct.std::_Fwd_list_iterator"* %this
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__AddBBHitcount_ST(i64 %index__, i64 %BBhitcount, i32 %Rcount, i32 %Wcount) #3 {
entry:
  %r = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 1
  %0 = load i64* %r, align 8, !tbaa !125
  %conv = sext i32 %Rcount to i64
  %mul = mul i64 %conv, %BBhitcount
  %add = add i64 %0, %mul
  store i64 %add, i64* %r, align 8, !tbaa !125
  %w = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 2
  %1 = load i64* %w, align 8, !tbaa !126
  %conv4 = sext i32 %Wcount to i64
  %mul5 = mul i64 %conv4, %BBhitcount
  %add6 = add i64 %1, %mul5
  store i64 %add6, i64* %w, align 8, !tbaa !126
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
  store i64 %cc, i64* %arrayidx, align 8, !tbaa !127
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
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !87
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
  %0 = load i64* %tv_sec, align 8, !tbaa !128
  %conv = sitofp i64 %0 to double
  %tv_nsec = getelementptr inbounds %struct.timespec* %ts, i64 0, i32 1
  %1 = load i64* %tv_nsec, align 8, !tbaa !130
  %conv1 = sitofp i64 %1 to double
  %div = fdiv double %conv1, 1.000000e+09
  %add = fadd double %conv, %div
  br label %return

if.end:                                           ; preds = %entry
  %call2 = call i32 @gettimeofday(%struct.timeval* %tm, %struct.timezone* null) #2
  %tv_sec3 = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 0
  %2 = load i64* %tv_sec3, align 8, !tbaa !131
  %conv4 = sitofp i64 %2 to double
  %tv_usec = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 1
  %3 = load i64* %tv_usec, align 8, !tbaa !133
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
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !87
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template3(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %conv = zext i32 %call to i64
  %call4 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %conv, i32 3
  store double %call4, double* %ThreadEndTime, align 8, !tbaa !87
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template4(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %conv = zext i32 %call to i64
  %call4 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %conv, i32 3
  store double %call4, double* %ThreadEndTime, align 8, !tbaa !87
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template5(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %call2 = tail call double @sdmprofile__getRealTime()
  %idxprom = zext i32 %call to i64
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !87
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template6(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %idxprom = zext i32 %call to i64
  %call2 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !87
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define i8* @sdmprofile__malloc(i64 %size_, i32 %heap_index, i32 %thdnumber) #3 {
entry:
  %I = alloca %struct.HeapAllocationMeta*, align 8
  %call = tail call noalias i8* @malloc(i64 %size_) #2
  %idxprom = zext i32 %thdnumber to i64
  %Malloc_Calls = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 6
  %0 = load i64* %Malloc_Calls, align 8, !tbaa !134
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Malloc_Calls, align 8, !tbaa !134
  %call1 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %call2 = tail call noalias i8* @malloc(i64 40) #2
  %1 = bitcast i8* %call2 to %struct.HeapAllocationMeta*
  store %struct.HeapAllocationMeta* %1, %struct.HeapAllocationMeta** %I, align 8, !tbaa !62
  %ptr = bitcast i8* %call2 to i8**
  store i8* %call, i8** %ptr, align 8, !tbaa !68
  %2 = ptrtoint i8* %call to i64
  %add = add i64 %2, %size_
  %3 = inttoptr i64 %add to i8*
  %upperbound = getelementptr inbounds i8* %call2, i64 8
  %4 = bitcast i8* %upperbound to i8**
  store i8* %3, i8** %4, align 8, !tbaa !135
  %size = getelementptr inbounds i8* %call2, i64 16
  %5 = bitcast i8* %size to i64*
  store i64 %size_, i64* %5, align 8, !tbaa !136
  %heapindex = getelementptr inbounds i8* %call2, i64 24
  %6 = bitcast i8* %heapindex to i32*
  store i32 %heap_index, i32* %6, align 4, !tbaa !137
  call void @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE10push_frontERKS1_(%"class.std::list"* @HeapAllocationList, %struct.HeapAllocationMeta** dereferenceable(8) %I)
  %call3 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %Current_Heap_Allocation = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 10
  %7 = load i64* %Current_Heap_Allocation, align 8, !tbaa !138
  %inc6 = add i64 %7, 1
  store i64 %inc6, i64* %Current_Heap_Allocation, align 8, !tbaa !138
  %Peak_Heap_Allocation = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 8
  %8 = load i64* %Peak_Heap_Allocation, align 8, !tbaa !139
  %cmp = icmp ult i64 %8, %inc6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 %inc6, i64* %Peak_Heap_Allocation, align 8, !tbaa !139
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %idxprom18 = zext i32 %heap_index to i64
  %arrayidx19 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18
  store %struct.HPMeta* %arrayidx19, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !62
  %hitcount = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 8
  %9 = load i64* %hitcount, align 16, !tbaa !140
  %cmp20 = icmp eq i64 %9, 0
  %MaxSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 9
  br i1 %cmp20, label %if.then21, label %if.else

if.then21:                                        ; preds = %if.end
  store i64 %size_, i64* %MaxSize, align 8, !tbaa !141
  %MinSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 10
  store i64 %size_, i64* %MinSize, align 16, !tbaa !142
  br label %if.end32

if.else:                                          ; preds = %if.end
  %10 = load i64* %MaxSize, align 8, !tbaa !141
  %cmp23 = icmp ult i64 %10, %size_
  br i1 %cmp23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %if.else
  store i64 %size_, i64* %MaxSize, align 8, !tbaa !141
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %if.else
  %MinSize27 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 10
  %11 = load i64* %MinSize27, align 16, !tbaa !142
  %cmp28 = icmp ugt i64 %11, %size_
  br i1 %cmp28, label %if.then29, label %if.end32

if.then29:                                        ; preds = %if.end26
  store i64 %size_, i64* %MinSize27, align 16, !tbaa !142
  br label %if.end32

if.end32:                                         ; preds = %if.then29, %if.end26, %if.then21
  %hitcount33 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 8
  %inc34 = add i64 %9, 1
  store i64 %inc34, i64* %hitcount33, align 16, !tbaa !140
  %12 = load i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !62
  %cmp35 = icmp eq i8* %12, null
  br i1 %cmp35, label %if.then36, label %if.else38

if.then36:                                        ; preds = %if.end32
  store i8* %call, i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !62
  store i8* %3, i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !62
  br label %if.end47

if.else38:                                        ; preds = %if.end32
  %cmp39 = icmp ugt i8* %12, %call
  br i1 %cmp39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.else38
  store i8* %call, i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !62
  br label %if.end41

if.end41:                                         ; preds = %if.then40, %if.else38
  %13 = load i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !62
  %cmp43 = icmp ult i8* %13, %3
  br i1 %cmp43, label %if.then44, label %if.end47

if.then44:                                        ; preds = %if.end41
  store i8* %3, i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !62
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
  %0 = load i64* %Free_Calls, align 8, !tbaa !143
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Free_Calls, align 8, !tbaa !143
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
  %1 = load %struct.HeapAllocationMeta** %call5, align 8, !tbaa !62
  %ptr = getelementptr inbounds %struct.HeapAllocationMeta* %1, i64 0, i32 0
  %2 = load i8** %ptr, align 8, !tbaa !68
  %cmp = icmp eq i8* %2, %pointer
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %ptr.lcssa = phi i8** [ %ptr, %for.body ]
  %call5.lcssa = phi %struct.HeapAllocationMeta** [ %call5, %for.body ]
  store i8* null, i8** %ptr.lcssa, align 8, !tbaa !68
  %3 = load %struct.HeapAllocationMeta** %call5.lcssa, align 8, !tbaa !62
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %3, i64 0, i32 1
  store i8* null, i8** %upperbound, align 8, !tbaa !135
  %4 = load %struct.HeapAllocationMeta** %call5.lcssa, align 8, !tbaa !62
  %size = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 2
  store i64 0, i64* %size, align 8, !tbaa !136
  %heapindex = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 3
  store i32 0, i32* %heapindex, align 4, !tbaa !137
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
  %5 = load i64* %Current_Heap_Allocation, align 8, !tbaa !138
  %dec = add i64 %5, -1
  store i64 %dec, i64* %Current_Heap_Allocation, align 8, !tbaa !138
  call void @free(i8* %pointer) #2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden %"struct.std::__detail::_List_node_base"* @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE5beginEv(%"class.std::list"* nocapture readonly %this) #3 align 2 {
entry:
  %retval = alloca %"struct.std::_List_iterator", align 8
  %_M_next = getelementptr inbounds %"class.std::list"* %this, i64 0, i32 0, i32 0, i32 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !144
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
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !148
  %_M_node2 = getelementptr inbounds %"struct.std::_List_iterator"* %__x, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_node2, align 8, !tbaa !148
  %cmp = icmp ne %"struct.std::__detail::_List_node_base"* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(8) %struct.HeapAllocationMeta** @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEdeEv(%"struct.std::_List_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_List_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !148
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
  store %"struct.std::__detail::_List_node_base"* %call2, %"struct.std::__detail::_List_node_base"** %0, align 8, !tbaa !62
  %call420 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__first, %"struct.std::_List_iterator"* dereferenceable(8) %__last)
  br i1 %call420, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %entry
  %1 = getelementptr inbounds %"struct.std::_List_iterator"* %__next, i64 0, i32 0
  br label %while.body

while.body:                                       ; preds = %if.end13, %while.body.lr.ph
  %agg.tmp16.sroa.0.0.copyload23 = phi %"struct.std::__detail::_List_node_base"* [ %call2, %while.body.lr.ph ], [ %agg.tmp16.sroa.0.0.copyload22, %if.end13 ]
  %2 = phi %"struct.std::__detail::_List_node_base"* [ %call, %while.body.lr.ph ], [ %5, %if.end13 ]
  store %"struct.std::__detail::_List_node_base"* %2, %"struct.std::__detail::_List_node_base"** %1, align 8, !tbaa !62
  %call5 = call dereferenceable(8) %"struct.std::_List_iterator"* @_ZNSt14_List_iteratorIP18HeapAllocationMetaEppEv(%"struct.std::_List_iterator"* %__next)
  %call6 = call dereferenceable(8) %struct.HeapAllocationMeta** @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEdeEv(%"struct.std::_List_iterator"* %__first)
  %3 = load %struct.HeapAllocationMeta** %call6, align 8, !tbaa !62
  %4 = load %struct.HeapAllocationMeta** %__value, align 8, !tbaa !62
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
  store %"struct.std::__detail::_List_node_base"* %2, %"struct.std::__detail::_List_node_base"** %0, align 8, !tbaa !62
  br label %if.end13

if.end13:                                         ; preds = %if.else, %if.then11, %while.body
  %agg.tmp16.sroa.0.0.copyload22 = phi %"struct.std::__detail::_List_node_base"* [ %agg.tmp16.sroa.0.0.copyload23, %if.then11 ], [ %2, %if.else ], [ %agg.tmp16.sroa.0.0.copyload23, %while.body ]
  %5 = load %"struct.std::__detail::_List_node_base"** %1, align 8, !tbaa !62
  store %"struct.std::__detail::_List_node_base"* %5, %"struct.std::__detail::_List_node_base"** %coerce.dive, align 8, !tbaa !62
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
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !148
  %_M_next = getelementptr inbounds %"struct.std::__detail::_List_node_base"* %0, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !150
  store %"struct.std::__detail::_List_node_base"* %1, %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !148
  ret %"struct.std::_List_iterator"* %this
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy1(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType) #3 {
entry:
  %0 = load i64* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 12), align 16, !tbaa !151
  %inc = add i64 %0, 1
  store i64 %inc, i64* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 12), align 16, !tbaa !151
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy2(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType, i32 %threadnumber) #3 {
entry:
  %idxprom = zext i32 %threadnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !151
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !151
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy3(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType, i32 %threadnumber, %struct.sdmprofile__Allocated_Stack_item* nocapture readnone %ptr) #3 {
entry:
  %idxprom = zext i32 %threadnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !151
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !151
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_GVonly(i8* readnone %AtAddress, i8 zeroext %AccessType, i32 %thdnumber) #3 {
entry:
  %__begin = alloca %"struct.std::_Fwd_list_iterator", align 8
  %__end = alloca %"struct.std::_Fwd_list_iterator", align 8
  %idxprom = zext i32 %thdnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !151
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !151
  %1 = load i8** @GV_AddrRangeHead, align 8, !tbaa !62
  %cmp = icmp ule i8* %1, %AtAddress
  %2 = load i8** @GV_AddrRangeTail, align 8
  %cmp1 = icmp ugt i8* %2, %AtAddress
  %or.cond = and i1 %cmp, %cmp1
  br i1 %or.cond, label %if.then, label %return

if.then:                                          ; preds = %entry
  %SearchWithinAddressRange = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 14
  %3 = load i64* %SearchWithinAddressRange, align 8, !tbaa !152
  %inc4 = add i64 %3, 1
  store i64 %inc4, i64* %SearchWithinAddressRange, align 8, !tbaa !152
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
  %4 = load %struct.GVMeta** %ptr, align 8, !tbaa !93
  %address = getelementptr inbounds %struct.GVMeta* %4, i64 0, i32 3
  %5 = load i8** %address, align 8, !tbaa !73
  %cmp8 = icmp ugt i8* %5, %AtAddress
  br i1 %cmp8, label %if.else37, label %land.lhs.true9

land.lhs.true9:                                   ; preds = %while.body
  %upperbound = getelementptr inbounds %struct.GVMeta* %4, i64 0, i32 7
  %6 = load i8** %upperbound, align 8, !tbaa !99
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
  %7 = load i64* %r, align 8, !tbaa !116
  %inc14 = add i64 %7, 1
  store i64 %inc14, i64* %r, align 8, !tbaa !116
  br label %sw.epilog

sw.bb15:                                          ; preds = %if.then12
  %w = getelementptr inbounds %struct.GVMeta* %.lcssa154, i64 0, i32 2
  %8 = load i64* %w, align 8, !tbaa !117
  %inc17 = add i64 %8, 1
  store i64 %inc17, i64* %w, align 8, !tbaa !117
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb15, %sw.bb, %if.then12
  %Cache_Hits = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 16
  %9 = load i64* %Cache_Hits, align 8, !tbaa !153
  %inc20 = add i64 %9, 1
  store i64 %inc20, i64* %Cache_Hits, align 8, !tbaa !153
  %10 = load %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !92
  %cmp24 = icmp eq %struct.GVCache_Item* %I.0139.lcssa, %10
  br i1 %cmp24, label %return, label %if.else

if.else:                                          ; preds = %sw.epilog
  %next = getelementptr inbounds %struct.GVCache_Item* %I.0139.lcssa, i64 0, i32 1
  %11 = load %struct.GVCache_Item** %next, align 8, !tbaa !95
  %next26 = getelementptr inbounds %struct.GVCache_Item* %previous.0138.lcssa, i64 0, i32 1
  store %struct.GVCache_Item* %11, %struct.GVCache_Item** %next26, align 8, !tbaa !95
  store %struct.GVCache_Item* %I.0139.lcssa, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !92
  store %struct.GVCache_Item* %10, %struct.GVCache_Item** %next, align 8, !tbaa !95
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
  %12 = load %struct.GVMeta** %call44, align 8, !tbaa !62
  %address45 = getelementptr inbounds %struct.GVMeta* %12, i64 0, i32 3
  %13 = load i8** %address45, align 8, !tbaa !73
  %cmp46 = icmp ugt i8* %13, %AtAddress
  br i1 %cmp46, label %for.inc, label %land.lhs.true47

land.lhs.true47:                                  ; preds = %for.body
  %upperbound48 = getelementptr inbounds %struct.GVMeta* %12, i64 0, i32 7
  %14 = load i8** %upperbound48, align 8, !tbaa !99
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
  %15 = load i64* %r53, align 8, !tbaa !116
  %inc54 = add i64 %15, 1
  store i64 %inc54, i64* %r53, align 8, !tbaa !116
  br label %sw.epilog59

sw.bb55:                                          ; preds = %if.then50
  %w56 = getelementptr inbounds %struct.GVMeta* %.lcssa, i64 0, i32 2
  %16 = load i64* %w56, align 8, !tbaa !117
  %inc57 = add i64 %16, 1
  store i64 %inc57, i64* %w56, align 8, !tbaa !117
  br label %sw.epilog59

sw.epilog59:                                      ; preds = %sw.bb55, %sw.bb52, %if.then50
  %Cache_Miss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 15
  %17 = load i64* %Cache_Miss, align 8, !tbaa !154
  %inc68 = add i64 %17, 1
  store i64 %inc68, i64* %Cache_Miss, align 8, !tbaa !154
  %18 = load %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !92
  br label %while.cond75

for.inc:                                          ; preds = %land.lhs.true47, %for.body
  %call61 = call dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %call42 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call42, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %while.end
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %19 = load i64* %SearchMiss, align 8, !tbaa !155
  %inc64 = add i64 %19, 1
  store i64 %inc64, i64* %SearchMiss, align 8, !tbaa !155
  br label %return

while.cond75:                                     ; preds = %while.cond75, %sw.epilog59
  %previous70.0 = phi %struct.GVCache_Item* [ undef, %sw.epilog59 ], [ %I71.0, %while.cond75 ]
  %I71.0 = phi %struct.GVCache_Item* [ %18, %sw.epilog59 ], [ %20, %while.cond75 ]
  %next76 = getelementptr inbounds %struct.GVCache_Item* %I71.0, i64 0, i32 1
  %20 = load %struct.GVCache_Item** %next76, align 8, !tbaa !95
  %cmp77 = icmp eq %struct.GVCache_Item* %20, null
  br i1 %cmp77, label %while.end80, label %while.cond75

while.end80:                                      ; preds = %while.cond75
  %next76.lcssa = phi %struct.GVCache_Item** [ %next76, %while.cond75 ]
  %I71.0.lcssa = phi %struct.GVCache_Item* [ %I71.0, %while.cond75 ]
  %previous70.0.lcssa = phi %struct.GVCache_Item* [ %previous70.0, %while.cond75 ]
  %next81 = getelementptr inbounds %struct.GVCache_Item* %previous70.0.lcssa, i64 0, i32 1
  store %struct.GVCache_Item* null, %struct.GVCache_Item** %next81, align 8, !tbaa !95
  store %struct.GVCache_Item* %I71.0.lcssa, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !92
  store %struct.GVCache_Item* %18, %struct.GVCache_Item** %next76.lcssa, align 8, !tbaa !95
  %ptr95 = getelementptr inbounds %struct.GVCache_Item* %I71.0.lcssa, i64 0, i32 0
  store %struct.GVMeta* %.lcssa, %struct.GVMeta** %ptr95, align 8, !tbaa !93
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
  %0 = load i64* %Search, align 8, !tbaa !151
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !151
  %1 = load i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !62
  %cmp = icmp ugt i8* %1, %AtAddress
  %2 = load i8** @sdmprofile__HP_addressRangeTo, align 8
  %cmp1 = icmp ult i8* %2, %AtAddress
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %if.end96, label %if.then

if.then:                                          ; preds = %entry
  %SearchWithinAddressRange = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 14
  %3 = load i64* %SearchWithinAddressRange, align 8, !tbaa !152
  %inc4 = add i64 %3, 1
  store i64 %inc4, i64* %SearchWithinAddressRange, align 8, !tbaa !152
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
  %4 = load %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !89
  %ptr8 = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 0
  %5 = load i8** %ptr8, align 8, !tbaa !68
  store i8* %5, i8** @cache_addr, align 8, !tbaa !62
  %6 = load %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !89
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %6, i64 0, i32 1
  %7 = load i8** %upperbound, align 8, !tbaa !135
  store i8* %7, i8** @cache_upperbound, align 8, !tbaa !62
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
  %8 = load %struct.HeapAllocationMeta** %ptr.lcssa, align 8, !tbaa !89
  %heapindex = getelementptr inbounds %struct.HeapAllocationMeta* %8, i64 0, i32 3
  %9 = load i32* %heapindex, align 4, !tbaa !137
  %idxprom15 = zext i32 %9 to i64
  %r = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom15, i32 1
  %10 = load i64* %r, align 8, !tbaa !156
  %inc17 = add i64 %10, 1
  store i64 %inc17, i64* %r, align 8, !tbaa !156
  br label %sw.epilog

sw.bb18:                                          ; preds = %if.then13
  %11 = load %struct.HeapAllocationMeta** %ptr.lcssa, align 8, !tbaa !89
  %heapindex20 = getelementptr inbounds %struct.HeapAllocationMeta* %11, i64 0, i32 3
  %12 = load i32* %heapindex20, align 4, !tbaa !137
  %idxprom21 = zext i32 %12 to i64
  %w = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom21, i32 2
  %13 = load i64* %w, align 16, !tbaa !157
  %inc23 = add i64 %13, 1
  store i64 %inc23, i64* %w, align 16, !tbaa !157
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb18, %sw.bb, %if.then13
  %Cache_Hits = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 16
  %14 = load i64* %Cache_Hits, align 8, !tbaa !153
  %inc26 = add i64 %14, 1
  store i64 %inc26, i64* %Cache_Hits, align 8, !tbaa !153
  %cmp30 = icmp eq %struct.Cache2_Item* %I.0182.lcssa, %I.0179
  br i1 %cmp30, label %return, label %if.else

if.else:                                          ; preds = %sw.epilog
  %next = getelementptr inbounds %struct.Cache2_Item* %I.0182.lcssa, i64 0, i32 1
  %15 = load %struct.Cache2_Item** %next, align 8, !tbaa !91
  %next32 = getelementptr inbounds %struct.Cache2_Item* %previous.0181.lcssa, i64 0, i32 1
  store %struct.Cache2_Item* %15, %struct.Cache2_Item** %next32, align 8, !tbaa !91
  store %struct.Cache2_Item* %I.0182.lcssa, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !88
  store %struct.Cache2_Item* %I.0179, %struct.Cache2_Item** %next, align 8, !tbaa !91
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
  %16 = load %struct.HeapAllocationMeta** %call50, align 8, !tbaa !62
  %ptr51 = getelementptr inbounds %struct.HeapAllocationMeta* %16, i64 0, i32 0
  %17 = load i8** %ptr51, align 8, !tbaa !68
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
  %18 = load i32* %heapindex56, align 4, !tbaa !137
  %idxprom57 = zext i32 %18 to i64
  %r59 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom57, i32 1
  %19 = load i64* %r59, align 8, !tbaa !156
  %inc60 = add i64 %19, 1
  store i64 %inc60, i64* %r59, align 8, !tbaa !156
  br label %return_2

sw.bb61:                                          ; preds = %if.then53
  %heapindex62 = getelementptr inbounds %struct.HeapAllocationMeta* %.lcssa, i64 0, i32 3
  %20 = load i32* %heapindex62, align 4, !tbaa !137
  %idxprom63 = zext i32 %20 to i64
  %w65 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom63, i32 2
  %21 = load i64* %w65, align 16, !tbaa !157
  %inc66 = add i64 %21, 1
  store i64 %inc66, i64* %w65, align 16, !tbaa !157
  br label %return_2

if.else69:                                        ; preds = %for.body
  %cmp71 = icmp ugt i8* %17, %AtAddress
  br i1 %cmp71, label %for.inc, label %if.else73

if.else73:                                        ; preds = %if.else69
  %upperbound74 = getelementptr inbounds %struct.HeapAllocationMeta* %16, i64 0, i32 1
  %22 = load i8** %upperbound74, align 8, !tbaa !135
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
  %23 = load i32* %heapindex79, align 4, !tbaa !137
  %idxprom80 = zext i32 %23 to i64
  %r82 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom80, i32 1
  %24 = load i64* %r82, align 8, !tbaa !156
  %inc83 = add i64 %24, 1
  store i64 %inc83, i64* %r82, align 8, !tbaa !156
  br label %return_2

sw.bb84:                                          ; preds = %if.then76
  %heapindex85 = getelementptr inbounds %struct.HeapAllocationMeta* %.lcssa202, i64 0, i32 3
  %25 = load i32* %heapindex85, align 4, !tbaa !137
  %idxprom86 = zext i32 %25 to i64
  %w88 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom86, i32 2
  %26 = load i64* %w88, align 16, !tbaa !157
  %inc89 = add i64 %26, 1
  store i64 %inc89, i64* %w88, align 16, !tbaa !157
  br label %return_2

for.inc:                                          ; preds = %if.else73, %if.else69
  %call95 = call dereferenceable(8) %"struct.std::_List_iterator"* @_ZNSt14_List_iteratorIP18HeapAllocationMetaEppEv(%"struct.std::_List_iterator"* %__begin)
  %call48 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__begin, %"struct.std::_List_iterator"* dereferenceable(8) %__end)
  br i1 %call48, label %for.body, label %if.end96.loopexit

if.end96.loopexit:                                ; preds = %for.inc
  br label %if.end96

if.end96:                                         ; preds = %if.end96.loopexit, %while.end, %entry
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %27 = load i64* %SearchMiss, align 8, !tbaa !155
  %inc99 = add i64 %27, 1
  store i64 %inc99, i64* %SearchMiss, align 8, !tbaa !155
  br label %return

return_2:                                         ; preds = %sw.bb84, %sw.bb78, %if.then76, %sw.bb61, %sw.bb55, %if.then53
  %call50201 = phi %struct.HeapAllocationMeta** [ %call50.lcssa199, %sw.bb78 ], [ %call50.lcssa199, %sw.bb84 ], [ %call50.lcssa199, %if.then76 ], [ %call50.lcssa, %sw.bb55 ], [ %call50.lcssa, %sw.bb61 ], [ %call50.lcssa, %if.then53 ]
  %loopptr.0 = load %struct.HeapAllocationMeta** %call50201, align 8
  %Cache_Miss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 15
  %28 = load i64* %Cache_Miss, align 8, !tbaa !154
  %inc102 = add i64 %28, 1
  store i64 %inc102, i64* %Cache_Miss, align 8, !tbaa !154
  %29 = load %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !88
  br label %while.cond109

while.cond109:                                    ; preds = %while.cond109, %return_2
  %previous104.0 = phi %struct.Cache2_Item* [ undef, %return_2 ], [ %I105.0, %while.cond109 ]
  %I105.0 = phi %struct.Cache2_Item* [ %29, %return_2 ], [ %30, %while.cond109 ]
  %next110 = getelementptr inbounds %struct.Cache2_Item* %I105.0, i64 0, i32 1
  %30 = load %struct.Cache2_Item** %next110, align 8, !tbaa !91
  %cmp111 = icmp eq %struct.Cache2_Item* %30, null
  br i1 %cmp111, label %while.end114, label %while.cond109

while.end114:                                     ; preds = %while.cond109
  %next110.lcssa = phi %struct.Cache2_Item** [ %next110, %while.cond109 ]
  %I105.0.lcssa = phi %struct.Cache2_Item* [ %I105.0, %while.cond109 ]
  %previous104.0.lcssa = phi %struct.Cache2_Item* [ %previous104.0, %while.cond109 ]
  %next115 = getelementptr inbounds %struct.Cache2_Item* %previous104.0.lcssa, i64 0, i32 1
  store %struct.Cache2_Item* null, %struct.Cache2_Item** %next115, align 8, !tbaa !91
  store %struct.Cache2_Item* %I105.0.lcssa, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !88
  store %struct.Cache2_Item* %29, %struct.Cache2_Item** %next110.lcssa, align 8, !tbaa !91
  %ptr129 = getelementptr inbounds %struct.Cache2_Item* %I105.0.lcssa, i64 0, i32 0
  store %struct.HeapAllocationMeta* %loopptr.0, %struct.HeapAllocationMeta** %ptr129, align 8, !tbaa !89
  br label %return

return:                                           ; preds = %while.end114, %if.end96, %if.else, %sw.epilog
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_STonly(i8* readnone %AtAddress, i8 zeroext %AccessType, i32 %thdnumber, %struct.sdmprofile__Allocated_Stack_item* %ptr) #3 {
entry:
  %idxprom = zext i32 %thdnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !151
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !151
  %Stack_allocations_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 4
  %1 = load %struct.sdmprofile__Allocated_Stack_item** %Stack_allocations_head, align 8, !tbaa !96
  %loopptr.065 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %ptr, i64 -1
  %cmp66 = icmp ult %struct.sdmprofile__Allocated_Stack_item* %loopptr.065, %1
  br i1 %cmp66, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.cond.backedge, %while.body.preheader
  %2 = phi %struct.sdmprofile__Allocated_Stack_item* [ %loopptr.068, %while.cond.backedge ], [ %ptr, %while.body.preheader ]
  %loopptr.068 = phi %struct.sdmprofile__Allocated_Stack_item* [ %loopptr.0, %while.cond.backedge ], [ %loopptr.065, %while.body.preheader ]
  %ptr3 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %2, i64 -1, i32 0
  %3 = load i8** %ptr3, align 8, !tbaa !75
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
  %4 = load i64* %stackindex, align 8, !tbaa !158
  %r = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %4, i32 1
  %5 = load i64* %r, align 8, !tbaa !125
  %inc6 = add i64 %5, 1
  store i64 %inc6, i64* %r, align 8, !tbaa !125
  br label %return_

sw.bb7:                                           ; preds = %if.then
  %stackindex8 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %.lcssa, i64 -1, i32 1
  %6 = load i64* %stackindex8, align 8, !tbaa !158
  %w = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %6, i32 2
  %7 = load i64* %w, align 8, !tbaa !126
  %inc10 = add i64 %7, 1
  store i64 %inc10, i64* %w, align 8, !tbaa !126
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
  %8 = load i8** %upperbound, align 8, !tbaa !77
  %9 = load i8** @sdmprofile__zeropointer, align 8, !tbaa !62
  %cmp15 = icmp eq i8* %8, %9
  br i1 %cmp15, label %if.then16, label %if.end

if.then16:                                        ; preds = %if.else14
  %10 = ptrtoint i8* %3 to i64
  %stackindex18 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %2, i64 -1, i32 1
  %11 = load i64* %stackindex18, align 8, !tbaa !158
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %11, i32 3
  %12 = load i32* %size, align 8, !tbaa !105
  %conv20 = zext i32 %12 to i64
  %add = add i64 %conv20, %10
  %13 = inttoptr i64 %add to i8*
  store i8* %13, i8** %upperbound, align 8, !tbaa !77
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
  %15 = load i64* %stackindex27, align 8, !tbaa !158
  %r29 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %15, i32 1
  %16 = load i64* %r29, align 8, !tbaa !125
  %inc30 = add i64 %16, 1
  store i64 %inc30, i64* %r29, align 8, !tbaa !125
  br label %return_

sw.bb31:                                          ; preds = %if.then24
  %stackindex32 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %.lcssa73, i64 -1, i32 1
  %17 = load i64* %stackindex32, align 8, !tbaa !158
  %w34 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %17, i32 2
  %18 = load i64* %w34, align 8, !tbaa !126
  %inc35 = add i64 %18, 1
  store i64 %inc35, i64* %w34, align 8, !tbaa !126
  br label %return_

while.end.loopexit:                               ; preds = %while.cond.backedge
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %19 = load i64* %SearchMiss, align 8, !tbaa !155
  %inc44 = add i64 %19, 1
  store i64 %inc44, i64* %SearchMiss, align 8, !tbaa !155
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
  %0 = load i32* @sdmprofile__profileAction, align 4, !tbaa !66
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
  %3 = load %struct.GVMeta** %call7, align 8, !tbaa !62
  %index = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 0
  %4 = load i64* %index, align 8, !tbaa !71
  %r = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 1
  %5 = load i64* %r, align 8, !tbaa !116
  %w = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 2
  %6 = load i64* %w, align 8, !tbaa !117
  %size = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 4
  %7 = load i32* %size, align 4, !tbaa !74
  %VarName = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 5
  %8 = load i8** %VarName, align 8, !tbaa !97
  %DataTypeString = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 6
  %9 = load i8** %DataTypeString, align 8, !tbaa !98
  %call8 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call, i8* getelementptr inbounds ([23 x i8]* @.str5, i64 0, i64 0), i64 %4, i64 %5, i64 %6, i32 %7, i8* %8, i8* %9) #2
  %call9 = call dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %call6 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call6, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %if.then
  %10 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE.1* %call)
  %.pr = load i32* @sdmprofile__profileAction, align 4, !tbaa !66
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  %11 = phi i32 [ %0, %entry ], [ %.pr, %for.end ]
  switch i32 %11, label %if.end34 [
    i32 4, label %if.then14
    i32 2, label %if.then14
  ]

if.then14:                                        ; preds = %if.end, %if.end
  %12 = call i64 @fwrite(i8* getelementptr inbounds ([124 x i8]* @.str7, i64 0, i64 0), i64 123, i64 1, %struct._IO_FILE.1* %call)
  %13 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !127
  %cmp1784 = icmp eq i64 %13, 0
  br i1 %cmp1784, label %for.end32, label %for.body18.preheader

for.body18.preheader:                             ; preds = %if.then14
  br label %for.body18

for.body18:                                       ; preds = %for.body18, %for.body18.preheader
  %ix.085 = phi i64 [ %inc, %for.body18 ], [ 0, %for.body18.preheader ]
  %index19 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 0
  %14 = load i64* %index19, align 8, !tbaa !103
  %r21 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 1
  %15 = load i64* %r21, align 8, !tbaa !125
  %w23 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 2
  %16 = load i64* %w23, align 8, !tbaa !126
  %size25 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 3
  %17 = load i32* %size25, align 8, !tbaa !105
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 4
  %18 = load i8** %EstimatedName, align 8, !tbaa !106
  %DataTypeString28 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 5
  %19 = load i8** %DataTypeString28, align 8, !tbaa !107
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 6
  %20 = load i8** %FunctionName, align 8, !tbaa !108
  %call30 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call, i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i64 %14, i64 %15, i64 %16, i32 %17, i8* %18, i8* %19, i8* %20) #2
  %inc = add i64 %ix.085, 1
  %21 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !127
  %cmp17 = icmp ult i64 %inc, %21
  br i1 %cmp17, label %for.body18, label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.body18
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %if.then14
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE.1* %call)
  %.pre = load i32* @sdmprofile__profileAction, align 4, !tbaa !66
  br label %if.end34

if.end34:                                         ; preds = %for.end32, %if.end
  %23 = phi i32 [ %11, %if.end ], [ %.pre, %for.end32 ]
  switch i32 %23, label %if.end55 [
    i32 4, label %if.then38
    i32 1, label %if.then38
  ]

if.then38:                                        ; preds = %if.end34, %if.end34
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([171 x i8]* @.str9, i64 0, i64 0), i64 170, i64 1, %struct._IO_FILE.1* %call)
  %25 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !127
  %cmp4282 = icmp eq i64 %25, 0
  br i1 %cmp4282, label %for.end53, label %for.body43.preheader

for.body43.preheader:                             ; preds = %if.then38
  br label %for.body43

for.body43:                                       ; preds = %for.body43, %for.body43.preheader
  %ix40.083 = phi i64 [ %inc52, %for.body43 ], [ 0, %for.body43.preheader ]
  %arrayidx44 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083
  store %struct.HPMeta* %arrayidx44, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !62
  %index45 = getelementptr inbounds %struct.HPMeta* %arrayidx44, i64 0, i32 0
  %26 = load i32* %index45, align 16, !tbaa !109
  %r46 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 1
  %27 = load i64* %r46, align 8, !tbaa !156
  %w47 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 2
  %28 = load i64* %w47, align 16, !tbaa !157
  %EstimatedName48 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 3
  %29 = load i8** %EstimatedName48, align 8, !tbaa !111
  %EstimatedDataTypeString = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 4
  %30 = load i8** %EstimatedDataTypeString, align 16, !tbaa !112
  %FunctionName49 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 5
  %31 = load i8** %FunctionName49, align 8, !tbaa !113
  %linenumber = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 6
  %32 = load i64* %linenumber, align 16, !tbaa !114
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 7
  %33 = load i8** %SourceFile, align 8, !tbaa !115
  %hitcount = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 8
  %34 = load i64* %hitcount, align 16, !tbaa !140
  %MinSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 10
  %35 = load i64* %MinSize, align 16, !tbaa !142
  %MaxSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 9
  %36 = load i64* %MaxSize, align 8, !tbaa !141
  %call50 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call, i8* getelementptr inbounds ([43 x i8]* @.str10, i64 0, i64 0), i32 %26, i64 %27, i64 %28, i32 0, i8* %29, i8* %30, i8* %31, i64 %32, i8* %33, i64 %34, i64 %35, i64 %36) #2
  %inc52 = add i64 %ix40.083, 1
  %37 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !127
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
  store double %call, double* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 3), align 8, !tbaa !87
  %call1 = tail call %struct._IO_FILE.1* @fopen(i8* getelementptr inbounds ([18 x i8]* @.str11, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0)) #2
  %0 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str12, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE.1* %call1)
  %1 = load i64* @sdmprofile__BBcount, align 8, !tbaa !127
  %cmp167 = icmp eq i64 %1, 0
  br i1 %cmp167, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %ix.0168 = phi i64 [ %inc, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds [5000 x i64]* @BBhits, i64 0, i64 %ix.0168
  %2 = load i64* %arrayidx, align 8, !tbaa !127
  %call3 = tail call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call1, i8* getelementptr inbounds ([9 x i8]* @.str13, i64 0, i64 0), i64 %ix.0168, i64 %2) #2
  %inc = add i64 %ix.0168, 1
  %3 = load i64* @sdmprofile__BBcount, align 8, !tbaa !127
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
  %5 = load %struct._IO_FILE.1** @stderr, align 8, !tbaa !62
  %fputs = call i32 @fputs(i8* %4, %struct._IO_FILE.1* %5) #15
  br label %cleanup

if.end:                                           ; preds = %for.end
  %6 = load i32* @sdmprofile__profileAction, align 4, !tbaa !66
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
  %8 = load %struct.GVMeta** %call16, align 8, !tbaa !62
  %DataTypeString = getelementptr inbounds %struct.GVMeta* %8, i64 0, i32 6
  %9 = load i8** %DataTypeString, align 8, !tbaa !98
  call void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* %typestring, i8* %9, %"class.std::allocator.6"* dereferenceable(1) %ref.tmp) #2
  %call17 = call i8* @_ZNSs5beginEv(%"class.std::basic_string"* %typestring) #2
  %call20 = call i8* @_ZNSs3endEv(%"class.std::basic_string"* %typestring) #2
  store i8 44, i8* %ref.tmp22, align 1, !tbaa !159
  store i8 59, i8* %ref.tmp23, align 1, !tbaa !159
  call void @_ZSt7replaceIN9__gnu_cxx17__normal_iteratorIPcSsEEcEvT_S4_RKT0_S7_(i8* %call17, i8* %call20, i8* dereferenceable(1) %ref.tmp22, i8* dereferenceable(1) %ref.tmp23)
  %inc26 = add nsw i32 %variable_count.0164, 1
  %10 = load %struct.GVMeta** %call16, align 8, !tbaa !62
  %r = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 1
  %11 = load i64* %r, align 8, !tbaa !116
  %w = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 2
  %12 = load i64* %w, align 8, !tbaa !117
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
  %13 = load i64* %linenumber, align 8, !tbaa !102
  %tobool = icmp eq i64 %13, 0
  br i1 %tobool, label %if.end44, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.then35
  %FileName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 8
  %14 = load i8** %FileName, align 8, !tbaa !100
  %call36 = call i32 @strcmp(i8* %14, i8* getelementptr inbounds ([2 x i8]* @.str17, i64 0, i64 0)) #16
  %tobool37 = icmp eq i32 %call36, 0
  br i1 %tobool37, label %if.end44, label %if.then38

if.then38:                                        ; preds = %land.lhs.true
  %VarName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 5
  %15 = load i8** %VarName, align 8, !tbaa !97
  %DirName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 9
  %16 = load i8** %DirName, align 8, !tbaa !101
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
  %.pr = load i32* @sdmprofile__profileAction, align 4, !tbaa !66
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
  %19 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !127
  %cmp58160 = icmp eq i64 %19, 0
  br i1 %cmp58160, label %for.end73, label %for.body59.preheader

for.body59.preheader:                             ; preds = %if.then54
  br label %for.body59

for.body59:                                       ; preds = %for.body59, %for.body59.preheader
  %ix56.0161 = phi i64 [ %inc72, %for.body59 ], [ 0, %for.body59.preheader ]
  %index = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 0
  %20 = load i64* %index, align 8, !tbaa !103
  %r62 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 1
  %21 = load i64* %r62, align 8, !tbaa !125
  %w64 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 2
  %22 = load i64* %w64, align 8, !tbaa !126
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 3
  %23 = load i32* %size, align 8, !tbaa !105
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 4
  %24 = load i8** %EstimatedName, align 8, !tbaa !106
  %DataTypeString68 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 5
  %25 = load i8** %DataTypeString68, align 8, !tbaa !107
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 6
  %26 = load i8** %FunctionName, align 8, !tbaa !108
  %call70 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call4, i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i64 %20, i64 %21, i64 %22, i32 %23, i8* %24, i8* %25, i8* %26) #2
  %inc72 = add i64 %ix56.0161, 1
  %27 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !127
  %cmp58 = icmp ult i64 %inc72, %27
  br i1 %cmp58, label %for.body59, label %for.end73.loopexit

for.end73.loopexit:                               ; preds = %for.body59
  br label %for.end73

for.end73:                                        ; preds = %for.end73.loopexit, %if.then54
  %28 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE.1* %call4)
  %.pre = load i32* @sdmprofile__profileAction, align 4, !tbaa !66
  br label %if.end75

if.end75:                                         ; preds = %for.end73, %if.end50
  %29 = phi i32 [ %17, %if.end50 ], [ %.pre, %for.end73 ]
  switch i32 %29, label %if.end112 [
    i32 4, label %for.cond81.preheader
    i32 1, label %for.cond81.preheader
  ]

for.cond81.preheader:                             ; preds = %if.end75, %if.end75
  %30 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !127
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
  store %struct.HPMeta* %arrayidx85, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !62
  %r86 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 1
  %32 = load i64* %r86, align 8, !tbaa !156
  %cmp99 = icmp eq i64 %32, 0
  br i1 %cmp99, label %if.end106, label %if.then100

if.then100:                                       ; preds = %for.body84
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 7
  %33 = load i8** %SourceFile, align 8, !tbaa !115
  %linenumber101 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 6
  %34 = load i64* %linenumber101, align 16, !tbaa !114
  %FunctionName102 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 5
  %35 = load i8** %FunctionName102, align 8, !tbaa !113
  %EstimatedName103 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 3
  %36 = load i8** %EstimatedName103, align 8, !tbaa !111
  %call104 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call4, i8* getelementptr inbounds ([14 x i8]* @.str22, i64 0, i64 0), i8* %33, i64 %34, i8* %35, i8* %36) #2
  %inc105 = add nsw i32 %nv_variable_count.3156, 1
  %.pre169 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !127
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
  %call111 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call4, i8* getelementptr inbounds ([59 x i8]* @.str23, i64 0, i64 0), i32 %variable_count.2.lcssa, i32 %nv_variable_count.3.lcssa) #2
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
  %0 = load i8* %call2, align 1, !tbaa !159
  %1 = load i8* %__old_value, align 1, !tbaa !159
  %cmp = icmp eq i8 %0, %1
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %2 = load i8* %__new_value, align 1, !tbaa !159
  store i8 %2, i8* %call2, align 1, !tbaa !159
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
  store i8* %call, i8** %ref.tmp, align 8, !tbaa !62
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
  store i8* %add.ptr, i8** %ref.tmp, align 8, !tbaa !62
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
  %0 = load i32* @thdsCount, align 4, !tbaa !66
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
  %2 = load i64* %threadID, align 8, !tbaa !85
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
  %0 = load i8** %call, align 8, !tbaa !62
  %call1 = tail call dereferenceable(8) i8** @_ZNK9__gnu_cxx17__normal_iteratorIPcSsE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %__rhs)
  %1 = load i8** %call1, align 8, !tbaa !62
  %cmp = icmp ne i8* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(1) i8* @_ZNK9__gnu_cxx17__normal_iteratorIPcSsEdeEv(%"class.__gnu_cxx::__normal_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %_M_current, align 8, !tbaa !160
  ret i8* %0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden dereferenceable(8) %"class.__gnu_cxx::__normal_iterator"* @_ZN9__gnu_cxx17__normal_iteratorIPcSsEppEv(%"class.__gnu_cxx::__normal_iterator"* %this) #3 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %_M_current, align 8, !tbaa !160
  %incdec.ptr = getelementptr inbounds i8* %0, i64 1
  store i8* %incdec.ptr, i8** %_M_current, align 8, !tbaa !160
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
  %0 = load i8** %_M_p, align 8, !tbaa !162
  ret i8* %0
}

; Function Attrs: noinline nounwind readonly uwtable
define available_externally i64 @_ZNKSs4sizeEv(%"class.std::basic_string"* nocapture readonly %this) #4 align 2 {
entry:
  %call = tail call %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* @_ZNKSs6_M_repEv(%"class.std::basic_string"* %this)
  %_M_length = getelementptr inbounds %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* %call, i64 0, i32 0, i32 0
  %0 = load i64* %_M_length, align 8, !tbaa !165
  ret i64 %0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZN9__gnu_cxx17__normal_iteratorIPcSsEC2ERKS1_(%"class.__gnu_cxx::__normal_iterator"* nocapture %this, i8** nocapture readonly dereferenceable(8) %__i) unnamed_addr #3 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %__i, align 8, !tbaa !62
  store i8* %0, i8** %_M_current, align 8, !tbaa !160
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
  %0 = load i32* %_M_refcount, align 4, !tbaa !167
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
  store %"struct.std::__detail::_List_node_base"* %__x, %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !148
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
  %1 = load %struct.HeapAllocationMeta** %call, align 8, !tbaa !62
  store %struct.HeapAllocationMeta* %1, %struct.HeapAllocationMeta** %_M_data, align 8, !tbaa !168
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
  tail call void @_ZSt17__throw_bad_allocv() #17
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
  store %"struct.std::_Fwd_list_node_base"* %__n, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !122
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr %"struct.std::_Fwd_list_node_base"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE15_M_insert_afterIJRKS1_EEEPSt19_Fwd_list_node_baseSt24_Fwd_list_const_iteratorIS1_EDpOT_(%"struct.std::_Fwd_list_base"* %this, %"struct.std::_Fwd_list_node_base"* nocapture %__pos.coerce, %struct.GVMeta** dereferenceable(8) %__args) #3 align 2 {
entry:
  %call = tail call dereferenceable(8) %struct.GVMeta** @_ZSt7forwardIRKP6GVMetaEOT_RNSt16remove_referenceIS4_E4typeE(%struct.GVMeta** dereferenceable(8) %__args) #2
  %call2 = tail call %"struct.std::_Fwd_list_node"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_M_create_nodeIJRKS1_EEEPSt14_Fwd_list_nodeIS1_EDpOT_(%"struct.std::_Fwd_list_base"* %this, %struct.GVMeta** dereferenceable(8) %call)
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__pos.coerce, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !124
  %1 = getelementptr inbounds %"struct.std::_Fwd_list_node"* %call2, i64 0, i32 0
  %_M_next3 = getelementptr inbounds %"struct.std::_Fwd_list_node"* %call2, i64 0, i32 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* %0, %"struct.std::_Fwd_list_node_base"** %_M_next3, align 8, !tbaa !124
  store %"struct.std::_Fwd_list_node_base"* %1, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !124
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
  store %"struct.std::_Fwd_list_node_base"* %__n, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !170
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
  %0 = load %struct.GVMeta** %call, align 8, !tbaa !62
  store %struct.GVMeta* %0, %struct.GVMeta** %__p, align 8, !tbaa !62
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
  tail call void @_ZSt17__throw_bad_allocv() #17
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
  store %"struct.std::__detail::_List_node_base"* %_M_node, %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !144
  %_M_prev = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0, i32 1
  store %"struct.std::__detail::_List_node_base"* %_M_node, %"struct.std::__detail::_List_node_base"** %_M_prev, align 8, !tbaa !172
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr %"struct.std::_Fwd_list_node_base"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_M_erase_afterEPSt19_Fwd_list_node_baseS5_(%"struct.std::_Fwd_list_base"* readnone %this, %"struct.std::_Fwd_list_node_base"* nocapture %__pos, %"struct.std::_Fwd_list_node_base"* %__last) #3 align 2 {
entry:
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__pos, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !124
  %cmp12 = icmp eq %"struct.std::_Fwd_list_node_base"* %0, %__last
  br i1 %cmp12, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.preheader
  %__curr.0.in13 = phi %"struct.std::_Fwd_list_node_base"* [ %1, %while.body ], [ %0, %while.body.preheader ]
  %__curr.0 = bitcast %"struct.std::_Fwd_list_node_base"* %__curr.0.in13 to %"struct.std::_Fwd_list_node"*
  %_M_next2 = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__curr.0.in13, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_next2, align 8, !tbaa !124
  tail call void @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE11_M_put_nodeEPSt14_Fwd_list_nodeIS1_E(%"struct.std::_Fwd_list_base"* %this, %"struct.std::_Fwd_list_node"* %__curr.0)
  %cmp = icmp eq %"struct.std::_Fwd_list_node_base"* %1, %__last
  br i1 %cmp, label %while.end.loopexit, label %while.body

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  store %"struct.std::_Fwd_list_node_base"* %__last, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !124
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
  store %"struct.std::_Fwd_list_node_base"* null, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !124
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
  br i1 %cmp, label %if.end5, label %if.then, !prof !173

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
  %0 = load i32* %__mem, align 4, !tbaa !66
  %add = add nsw i32 %0, -1
  store i32 %add, i32* %__mem, align 4, !tbaa !66
  ret i32 %0
}

; Function Attrs: nounwind
declare extern_weak i32 @__pthread_key_create(i32*, void (i8*)*) #1

; Function Attrs: noinline nounwind uwtable
define linkonce_odr void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE8_M_clearEv(%"class.std::_List_base"* readonly %this) #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0
  %_M_next = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !144
  %cmp8 = icmp eq %"struct.std::__detail::_List_node_base"* %0, %_M_node
  br i1 %cmp8, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.preheader
  %__cur.0.in9 = phi %"struct.std::__detail::_List_node_base"* [ %1, %while.body ], [ %0, %while.body.preheader ]
  %__cur.0 = bitcast %"struct.std::__detail::_List_node_base"* %__cur.0.in9 to %"struct.std::_List_node"*
  %_M_next4 = getelementptr inbounds %"struct.std::__detail::_List_node_base"* %__cur.0.in9, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_next4, align 8, !tbaa !150
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
define void @print_path_original(%struct._NODE.3* %rgnNodes, i32 %chNode) #11 {
  %rgnNodes_st = alloca %struct._NODE.3*
  %chNode_st = alloca i32
  %thdnumber_st = alloca i32
  store %struct._NODE.3* %rgnNodes, %struct._NODE.3** %rgnNodes_st, align 8
  store i32 %chNode, i32* %chNode_st, align 4
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load %struct._NODE.3** %rgnNodes_st
  %3 = load i32* %chNode_st
  call void @print_path(%struct._NODE.3* %2, i32 %3, i32 %1)
  ret void
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #12

declare i32 @printf(i8*, ...) #13

declare i32 @fflush(%struct._IO_FILE.1*) #13

; Function Attrs: nounwind uwtable
define void @enqueue_original(i32 %iNode, i32 %iDist, i32 %iPrev) #11 {
  %iNode_st = alloca i32
  %iDist_st = alloca i32
  %iPrev_st = alloca i32
  %thdnumber_st = alloca i32
  store i32 %iNode, i32* %iNode_st, align 4
  store i32 %iDist, i32* %iDist_st, align 4
  store i32 %iPrev, i32* %iPrev_st, align 4
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i32* %iNode_st
  %3 = load i32* %iDist_st
  %4 = load i32* %iPrev_st
  call void @enqueue(i32 %2, i32 %3, i32 %4, i32 %1)
  ret void
}

; Function Attrs: noreturn
declare void @exit(i32) #14

; Function Attrs: nounwind uwtable
define void @dequeue_original(i32* %piNode, i32* %piDist, i32* %piPrev) #11 {
  %piNode_st = alloca i32*
  %piDist_st = alloca i32*
  %piPrev_st = alloca i32*
  %thdnumber_st = alloca i32
  store i32* %piNode, i32** %piNode_st, align 8
  store i32* %piDist, i32** %piDist_st, align 8
  store i32* %piPrev, i32** %piPrev_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i32** %piNode_st
  %3 = load i32** %piDist_st
  %4 = load i32** %piPrev_st
  call void @dequeue(i32* %2, i32* %3, i32* %4, i32 %1)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @qcount_original() #11 {
  %thdnumber_st = alloca i32
  %1 = call i32 @sdmprofile__FindThread()
  %2 = call i32 @qcount(i32 %1)
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define i32 @dijkstra_original(i32 %chStart, i32 %chEnd) #11 {
  %chStart_st = alloca i32
  %chEnd_st = alloca i32
  %thdnumber_st = alloca i32
  store i32 %chStart, i32* %chStart_st, align 4
  store i32 %chEnd, i32* %chEnd_st, align 4
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i32* %chStart_st
  %3 = load i32* %chEnd_st
  %4 = call i32 @dijkstra(i32 %2, i32 %3, i32 %1)
  ret i32 %4
}

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

declare i32 @__isoc99_fscanf(%struct._IO_FILE.1*, i8*, ...) #13

; Function Attrs: nounwind uwtable
define void @dequeue(i32* %piNode, i32* %piDist, i32* %piPrev, i32 %sdmprofile__threadnumber) #11 {
entry:
  %piNode.addr = alloca i32*, align 8
  %piDist.addr = alloca i32*, align 8
  %piPrev.addr = alloca i32*, align 8
  %qKill = alloca %struct._QITEM.2*, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32* %piNode, i32** %piNode.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_17, i64 1 seq_cst, !dbg !174
  call void @llvm.dbg.declare(metadata !{i32** %piNode.addr}, metadata !175), !dbg !174
  store i32* %piDist, i32** %piDist.addr, align 8
  call void @llvm.dbg.declare(metadata !{i32** %piDist.addr}, metadata !176), !dbg !177
  store i32* %piPrev, i32** %piPrev.addr, align 8
  call void @llvm.dbg.declare(metadata !{i32** %piPrev.addr}, metadata !178), !dbg !179
  call void @llvm.dbg.declare(metadata !{%struct._QITEM.2** %qKill}, metadata !180), !dbg !190
  %1 = load %struct._QITEM.2** @qHead, align 8, !dbg !191
  store %struct._QITEM.2* %1, %struct._QITEM.2** %qKill, align 8, !dbg !191
  %2 = load %struct._QITEM.2** @qHead, align 8, !dbg !192
  %tobool = icmp ne %struct._QITEM.2* %2, null, !dbg !192
  br i1 %tobool, label %if.then, label %if.end, !dbg !192

if.then:                                          ; preds = %entry
  %3 = atomicrmw add i64* @sdmprofile__BBcounter_18, i64 1 seq_cst, !dbg !194
  %4 = load %struct._QITEM.2** @qHead, align 8, !dbg !194
  %iNode = getelementptr inbounds %struct._QITEM.2* %4, i32 0, i32 0, !dbg !194
  %5 = bitcast i32* %iNode to i8*, !dbg !194
  %6 = load i32* %sdmprofile__threadnumber_st, !dbg !194
  call void @sdmprofile__SearchRoutine_GVonly(i8* %5, i8 2, i32 %6), !dbg !194
  %7 = load i32* %iNode, align 4, !dbg !194
  %8 = load i32** %piNode.addr, align 8, !dbg !194
  %9 = bitcast i32* %8 to i8*, !dbg !194
  %10 = load i32* %sdmprofile__threadnumber_st, !dbg !194
  call void @sdmprofile__SearchRoutine_GVonly(i8* %9, i8 1, i32 %10), !dbg !194
  store i32 %7, i32* %8, align 4, !dbg !194
  %11 = load %struct._QITEM.2** @qHead, align 8, !dbg !196
  %iDist = getelementptr inbounds %struct._QITEM.2* %11, i32 0, i32 1, !dbg !196
  %12 = bitcast i32* %iDist to i8*, !dbg !196
  %13 = load i32* %sdmprofile__threadnumber_st, !dbg !196
  call void @sdmprofile__SearchRoutine_GVonly(i8* %12, i8 2, i32 %13), !dbg !196
  %14 = load i32* %iDist, align 4, !dbg !196
  %15 = load i32** %piDist.addr, align 8, !dbg !196
  %16 = bitcast i32* %15 to i8*, !dbg !196
  %17 = load i32* %sdmprofile__threadnumber_st, !dbg !196
  call void @sdmprofile__SearchRoutine_GVonly(i8* %16, i8 1, i32 %17), !dbg !196
  store i32 %14, i32* %15, align 4, !dbg !196
  %18 = load %struct._QITEM.2** @qHead, align 8, !dbg !197
  %iPrev = getelementptr inbounds %struct._QITEM.2* %18, i32 0, i32 2, !dbg !197
  %19 = bitcast i32* %iPrev to i8*, !dbg !197
  %20 = load i32* %sdmprofile__threadnumber_st, !dbg !197
  call void @sdmprofile__SearchRoutine_GVonly(i8* %19, i8 2, i32 %20), !dbg !197
  %21 = load i32* %iPrev, align 4, !dbg !197
  %22 = load i32** %piPrev.addr, align 8, !dbg !197
  %23 = bitcast i32* %22 to i8*, !dbg !197
  %24 = load i32* %sdmprofile__threadnumber_st, !dbg !197
  call void @sdmprofile__SearchRoutine_GVonly(i8* %23, i8 1, i32 %24), !dbg !197
  store i32 %21, i32* %22, align 4, !dbg !197
  %25 = load %struct._QITEM.2** @qHead, align 8, !dbg !198
  %qNext = getelementptr inbounds %struct._QITEM.2* %25, i32 0, i32 3, !dbg !198
  %26 = bitcast %struct._QITEM.2** %qNext to i8*, !dbg !198
  %27 = load i32* %sdmprofile__threadnumber_st, !dbg !198
  call void @sdmprofile__SearchRoutine_GVonly(i8* %26, i8 2, i32 %27), !dbg !198
  %28 = load %struct._QITEM.2** %qNext, align 8, !dbg !198
  store %struct._QITEM.2* %28, %struct._QITEM.2** @qHead, align 8, !dbg !198
  %29 = load %struct._QITEM.2** %qKill, align 8, !dbg !199
  %call = call i32 (%struct._QITEM.2*, ...)* bitcast (void (i8*)* @free to i32 (%struct._QITEM.2*, ...)*)(%struct._QITEM.2* %29), !dbg !199
  %30 = load i32* @g_qCount, align 4, !dbg !200
  %dec = add nsw i32 %30, -1, !dbg !200
  store i32 %dec, i32* @g_qCount, align 4, !dbg !200
  br label %if.end, !dbg !201

if.end:                                           ; preds = %if.then, %entry
  %31 = atomicrmw add i64* @sdmprofile__BBcounter_19, i64 1 seq_cst, !dbg !202
  ret void, !dbg !202
}

; Function Attrs: nounwind uwtable
define i32 @dijkstra(i32 %chStart, i32 %chEnd, i32 %sdmprofile__threadnumber) #11 {
entry:
  %retval = alloca i32, align 4
  %chStart.addr = alloca i32, align 4
  %chEnd.addr = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32 %chStart, i32* %chStart.addr, align 4
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_20, i64 1 seq_cst, !dbg !203
  call void @llvm.dbg.declare(metadata !{i32* %chStart.addr}, metadata !204), !dbg !203
  store i32 %chEnd, i32* %chEnd.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %chEnd.addr}, metadata !205), !dbg !206
  store i32 0, i32* @ch, align 4, !dbg !207
  br label %for.cond, !dbg !207

for.cond:                                         ; preds = %for.inc, %entry
  %1 = atomicrmw add i64* @sdmprofile__BBcounter_21, i64 1 seq_cst, !dbg !209
  %2 = load i32* @ch, align 4, !dbg !209
  %cmp = icmp slt i32 %2, 100, !dbg !209
  br i1 %cmp, label %for.body, label %for.end, !dbg !209

for.body:                                         ; preds = %for.cond
  %3 = atomicrmw add i64* @sdmprofile__BBcounter_22, i64 1 seq_cst, !dbg !212
  %4 = load i32* @ch, align 4, !dbg !212
  %idxprom = sext i32 %4 to i64, !dbg !212
  %arrayidx = getelementptr inbounds [100 x %struct._NODE.3]* @rgnNodes, i32 0, i64 %idxprom, !dbg !212
  %iDist = getelementptr inbounds %struct._NODE.3* %arrayidx, i32 0, i32 0, !dbg !212
  %5 = bitcast i32* %iDist to i8*, !dbg !212
  %6 = load i32* %sdmprofile__threadnumber_st, !dbg !212
  call void @sdmprofile__SearchRoutine_GVonly(i8* %5, i8 1, i32 %6), !dbg !212
  store i32 9999, i32* %iDist, align 4, !dbg !212
  %7 = load i32* @ch, align 4, !dbg !214
  %idxprom1 = sext i32 %7 to i64, !dbg !214
  %arrayidx2 = getelementptr inbounds [100 x %struct._NODE.3]* @rgnNodes, i32 0, i64 %idxprom1, !dbg !214
  %iPrev = getelementptr inbounds %struct._NODE.3* %arrayidx2, i32 0, i32 1, !dbg !214
  %8 = bitcast i32* %iPrev to i8*, !dbg !214
  %9 = load i32* %sdmprofile__threadnumber_st, !dbg !214
  call void @sdmprofile__SearchRoutine_GVonly(i8* %8, i8 1, i32 %9), !dbg !214
  store i32 9999, i32* %iPrev, align 4, !dbg !214
  br label %for.inc, !dbg !215

for.inc:                                          ; preds = %for.body
  %10 = atomicrmw add i64* @sdmprofile__BBcounter_23, i64 1 seq_cst, !dbg !216
  %11 = load i32* @ch, align 4, !dbg !216
  %inc = add nsw i32 %11, 1, !dbg !216
  store i32 %inc, i32* @ch, align 4, !dbg !216
  br label %for.cond, !dbg !216

for.end:                                          ; preds = %for.cond
  %12 = atomicrmw add i64* @sdmprofile__BBcounter_24, i64 1 seq_cst, !dbg !217
  %13 = load i32* %chStart.addr, align 4, !dbg !217
  %14 = load i32* %chEnd.addr, align 4, !dbg !217
  %cmp3 = icmp eq i32 %13, %14, !dbg !217
  br i1 %cmp3, label %if.then, label %if.else, !dbg !217

if.then:                                          ; preds = %for.end
  %15 = atomicrmw add i64* @sdmprofile__BBcounter_25, i64 1 seq_cst, !dbg !219
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0)), !dbg !219
  br label %if.end48, !dbg !221

if.else:                                          ; preds = %for.end
  %16 = atomicrmw add i64* @sdmprofile__BBcounter_26, i64 1 seq_cst, !dbg !222
  %17 = load i32* %chStart.addr, align 4, !dbg !222
  %idxprom4 = sext i32 %17 to i64, !dbg !222
  %arrayidx5 = getelementptr inbounds [100 x %struct._NODE.3]* @rgnNodes, i32 0, i64 %idxprom4, !dbg !222
  %iDist6 = getelementptr inbounds %struct._NODE.3* %arrayidx5, i32 0, i32 0, !dbg !222
  %18 = bitcast i32* %iDist6 to i8*, !dbg !222
  %19 = load i32* %sdmprofile__threadnumber_st, !dbg !222
  call void @sdmprofile__SearchRoutine_GVonly(i8* %18, i8 1, i32 %19), !dbg !222
  store i32 0, i32* %iDist6, align 4, !dbg !222
  %20 = load i32* %chStart.addr, align 4, !dbg !224
  %idxprom7 = sext i32 %20 to i64, !dbg !224
  %arrayidx8 = getelementptr inbounds [100 x %struct._NODE.3]* @rgnNodes, i32 0, i64 %idxprom7, !dbg !224
  %iPrev9 = getelementptr inbounds %struct._NODE.3* %arrayidx8, i32 0, i32 1, !dbg !224
  %21 = bitcast i32* %iPrev9 to i8*, !dbg !224
  %22 = load i32* %sdmprofile__threadnumber_st, !dbg !224
  call void @sdmprofile__SearchRoutine_GVonly(i8* %21, i8 1, i32 %22), !dbg !224
  store i32 9999, i32* %iPrev9, align 4, !dbg !224
  %23 = load i32* %chStart.addr, align 4, !dbg !225
  %sdmprofile__LD4 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @enqueue(i32 %23, i32 0, i32 9999, i32 %sdmprofile__LD4), !dbg !225
  br label %while.cond, !dbg !226

while.cond:                                       ; preds = %for.end41, %if.else
  %24 = atomicrmw add i64* @sdmprofile__BBcounter_27, i64 1 seq_cst
  %sdmprofile__LD7 = load i32* %sdmprofile__threadnumber_st, align 8
  %25 = call i32 @qcount(i32 %sdmprofile__LD7), !dbg !227
  %cmp11 = icmp sgt i32 %25, 0, !dbg !227
  br i1 %cmp11, label %while.body, label %while.end, !dbg !227

while.body:                                       ; preds = %while.cond
  %26 = atomicrmw add i64* @sdmprofile__BBcounter_28, i64 1 seq_cst
  %sdmprofile__LD1 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @dequeue(i32* @iNode, i32* @iDist, i32* @iPrev, i32 %sdmprofile__LD1), !dbg !229
  store i32 0, i32* @i, align 4, !dbg !231
  br label %for.cond12, !dbg !231

for.cond12:                                       ; preds = %for.inc39, %while.body
  %27 = atomicrmw add i64* @sdmprofile__BBcounter_29, i64 1 seq_cst, !dbg !233
  %28 = load i32* @i, align 4, !dbg !233
  %cmp13 = icmp slt i32 %28, 100, !dbg !233
  br i1 %cmp13, label %for.body14, label %for.end41, !dbg !233

for.body14:                                       ; preds = %for.cond12
  %29 = atomicrmw add i64* @sdmprofile__BBcounter_30, i64 1 seq_cst, !dbg !236
  %30 = load i32* @i, align 4, !dbg !236
  %idxprom15 = sext i32 %30 to i64, !dbg !236
  %31 = load i32* @iNode, align 4, !dbg !236
  %idxprom16 = sext i32 %31 to i64, !dbg !236
  %arrayidx17 = getelementptr inbounds [100 x [100 x i32]]* @AdjMatrix, i32 0, i64 %idxprom16, !dbg !236
  %arrayidx18 = getelementptr inbounds [100 x i32]* %arrayidx17, i32 0, i64 %idxprom15, !dbg !236
  %32 = bitcast i32* %arrayidx18 to i8*, !dbg !236
  %33 = load i32* %sdmprofile__threadnumber_st, !dbg !236
  call void @sdmprofile__SearchRoutine_GVonly(i8* %32, i8 2, i32 %33), !dbg !236
  %34 = load i32* %arrayidx18, align 4, !dbg !236
  store i32 %34, i32* @iCost, align 4, !dbg !236
  %cmp19 = icmp ne i32 %34, 9999, !dbg !236
  br i1 %cmp19, label %if.then20, label %if.end38, !dbg !236

if.then20:                                        ; preds = %for.body14
  %35 = atomicrmw add i64* @sdmprofile__BBcounter_31, i64 1 seq_cst, !dbg !239
  %36 = load i32* @i, align 4, !dbg !239
  %idxprom21 = sext i32 %36 to i64, !dbg !239
  %arrayidx22 = getelementptr inbounds [100 x %struct._NODE.3]* @rgnNodes, i32 0, i64 %idxprom21, !dbg !239
  %iDist23 = getelementptr inbounds %struct._NODE.3* %arrayidx22, i32 0, i32 0, !dbg !239
  %37 = bitcast i32* %iDist23 to i8*, !dbg !239
  %38 = load i32* %sdmprofile__threadnumber_st, !dbg !239
  call void @sdmprofile__SearchRoutine_GVonly(i8* %37, i8 2, i32 %38), !dbg !239
  %39 = load i32* %iDist23, align 4, !dbg !239
  %cmp24 = icmp eq i32 9999, %39, !dbg !239
  br i1 %cmp24, label %if.then29, label %lor.lhs.false, !dbg !239

lor.lhs.false:                                    ; preds = %if.then20
  %40 = atomicrmw add i64* @sdmprofile__BBcounter_32, i64 1 seq_cst, !dbg !242
  %41 = load i32* @i, align 4, !dbg !242
  %idxprom25 = sext i32 %41 to i64, !dbg !242
  %arrayidx26 = getelementptr inbounds [100 x %struct._NODE.3]* @rgnNodes, i32 0, i64 %idxprom25, !dbg !242
  %iDist27 = getelementptr inbounds %struct._NODE.3* %arrayidx26, i32 0, i32 0, !dbg !242
  %42 = bitcast i32* %iDist27 to i8*, !dbg !242
  %43 = load i32* %sdmprofile__threadnumber_st, !dbg !242
  call void @sdmprofile__SearchRoutine_GVonly(i8* %42, i8 2, i32 %43), !dbg !242
  %44 = load i32* %iDist27, align 4, !dbg !242
  %45 = load i32* @iCost, align 4, !dbg !242
  %46 = load i32* @iDist, align 4, !dbg !242
  %add = add nsw i32 %45, %46, !dbg !242
  %cmp28 = icmp sgt i32 %44, %add, !dbg !242
  br i1 %cmp28, label %if.then29, label %if.end, !dbg !242

if.then29:                                        ; preds = %lor.lhs.false, %if.then20
  %47 = atomicrmw add i64* @sdmprofile__BBcounter_33, i64 1 seq_cst, !dbg !244
  %48 = load i32* @iDist, align 4, !dbg !244
  %49 = load i32* @iCost, align 4, !dbg !244
  %add30 = add nsw i32 %48, %49, !dbg !244
  %50 = load i32* @i, align 4, !dbg !244
  %idxprom31 = sext i32 %50 to i64, !dbg !244
  %arrayidx32 = getelementptr inbounds [100 x %struct._NODE.3]* @rgnNodes, i32 0, i64 %idxprom31, !dbg !244
  %iDist33 = getelementptr inbounds %struct._NODE.3* %arrayidx32, i32 0, i32 0, !dbg !244
  %51 = bitcast i32* %iDist33 to i8*, !dbg !244
  %52 = load i32* %sdmprofile__threadnumber_st, !dbg !244
  call void @sdmprofile__SearchRoutine_GVonly(i8* %51, i8 1, i32 %52), !dbg !244
  store i32 %add30, i32* %iDist33, align 4, !dbg !244
  %53 = load i32* @iNode, align 4, !dbg !246
  %54 = load i32* @i, align 4, !dbg !246
  %idxprom34 = sext i32 %54 to i64, !dbg !246
  %arrayidx35 = getelementptr inbounds [100 x %struct._NODE.3]* @rgnNodes, i32 0, i64 %idxprom34, !dbg !246
  %iPrev36 = getelementptr inbounds %struct._NODE.3* %arrayidx35, i32 0, i32 1, !dbg !246
  %55 = bitcast i32* %iPrev36 to i8*, !dbg !246
  %56 = load i32* %sdmprofile__threadnumber_st, !dbg !246
  call void @sdmprofile__SearchRoutine_GVonly(i8* %55, i8 1, i32 %56), !dbg !246
  store i32 %53, i32* %iPrev36, align 4, !dbg !246
  %57 = load i32* @i, align 4, !dbg !247
  %58 = load i32* @iDist, align 4, !dbg !247
  %59 = load i32* @iCost, align 4, !dbg !247
  %add37 = add nsw i32 %58, %59, !dbg !247
  %60 = load i32* @iNode, align 4, !dbg !247
  %sdmprofile__LD3 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @enqueue(i32 %57, i32 %add37, i32 %60, i32 %sdmprofile__LD3), !dbg !247
  br label %if.end, !dbg !248

if.end:                                           ; preds = %if.then29, %lor.lhs.false
  %61 = atomicrmw add i64* @sdmprofile__BBcounter_34, i64 1 seq_cst, !dbg !249
  br label %if.end38, !dbg !249

if.end38:                                         ; preds = %if.end, %for.body14
  %62 = atomicrmw add i64* @sdmprofile__BBcounter_35, i64 1 seq_cst, !dbg !250
  br label %for.inc39, !dbg !250

for.inc39:                                        ; preds = %if.end38
  %63 = atomicrmw add i64* @sdmprofile__BBcounter_36, i64 1 seq_cst, !dbg !251
  %64 = load i32* @i, align 4, !dbg !251
  %inc40 = add nsw i32 %64, 1, !dbg !251
  store i32 %inc40, i32* @i, align 4, !dbg !251
  br label %for.cond12, !dbg !251

for.end41:                                        ; preds = %for.cond12
  %65 = atomicrmw add i64* @sdmprofile__BBcounter_37, i64 1 seq_cst, !dbg !252
  br label %while.cond, !dbg !252

while.end:                                        ; preds = %while.cond
  %66 = atomicrmw add i64* @sdmprofile__BBcounter_38, i64 1 seq_cst, !dbg !253
  %67 = load i32* %chEnd.addr, align 4, !dbg !253
  %idxprom42 = sext i32 %67 to i64, !dbg !253
  %arrayidx43 = getelementptr inbounds [100 x %struct._NODE.3]* @rgnNodes, i32 0, i64 %idxprom42, !dbg !253
  %iDist44 = getelementptr inbounds %struct._NODE.3* %arrayidx43, i32 0, i32 0, !dbg !253
  %68 = bitcast i32* %iDist44 to i8*, !dbg !253
  %69 = load i32* %sdmprofile__threadnumber_st, !dbg !253
  call void @sdmprofile__SearchRoutine_GVonly(i8* %68, i8 2, i32 %69), !dbg !253
  %70 = load i32* %iDist44, align 4, !dbg !253
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str37, i32 0, i32 0), i32 %70), !dbg !253
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str48, i32 0, i32 0)), !dbg !254
  %71 = load i32* %chEnd.addr, align 4, !dbg !255
  %sdmprofile__LD6 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @print_path(%struct._NODE.3* getelementptr inbounds ([100 x %struct._NODE.3]* @rgnNodes, i32 0, i32 0), i32 %71, i32 %sdmprofile__LD6), !dbg !255
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str59, i32 0, i32 0)), !dbg !256
  br label %if.end48

if.end48:                                         ; preds = %while.end, %if.then
  %72 = atomicrmw add i64* @sdmprofile__BBcounter_39, i64 1 seq_cst, !dbg !257
  %73 = load i32* %retval, !dbg !257
  ret i32 %73, !dbg !257
}

; Function Attrs: nounwind uwtable
define void @enqueue(i32 %iNode, i32 %iDist, i32 %iPrev, i32 %sdmprofile__threadnumber) #11 {
entry:
  %iNode.addr = alloca i32, align 4
  %iDist.addr = alloca i32, align 4
  %iPrev.addr = alloca i32, align 4
  %qNew = alloca %struct._QITEM.2*, align 8
  %qLast = alloca %struct._QITEM.2*, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32 %iNode, i32* %iNode.addr, align 4
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_40, i64 1 seq_cst, !dbg !258
  call void @llvm.dbg.declare(metadata !{i32* %iNode.addr}, metadata !259), !dbg !258
  store i32 %iDist, i32* %iDist.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %iDist.addr}, metadata !260), !dbg !261
  store i32 %iPrev, i32* %iPrev.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %iPrev.addr}, metadata !262), !dbg !263
  call void @llvm.dbg.declare(metadata !{%struct._QITEM.2** %qNew}, metadata !264), !dbg !274
  %call = call i8* @malloc(i64 24), !dbg !275
  %1 = bitcast i8* %call to %struct._QITEM.2*, !dbg !275
  store %struct._QITEM.2* %1, %struct._QITEM.2** %qNew, align 8, !dbg !275
  call void @llvm.dbg.declare(metadata !{%struct._QITEM.2** %qLast}, metadata !276), !dbg !277
  %2 = load %struct._QITEM.2** @qHead, align 8, !dbg !278
  store %struct._QITEM.2* %2, %struct._QITEM.2** %qLast, align 8, !dbg !278
  %3 = load %struct._QITEM.2** %qNew, align 8, !dbg !279
  %tobool = icmp ne %struct._QITEM.2* %3, null, !dbg !279
  br i1 %tobool, label %if.end, label %if.then, !dbg !279

if.then:                                          ; preds = %entry
  %4 = atomicrmw add i64* @sdmprofile__BBcounter_41, i64 1 seq_cst, !dbg !281
  %5 = load %struct._IO_FILE.1** @stderr, align 8, !dbg !281
  %call1 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %5, i8* getelementptr inbounds ([16 x i8]* @.str16, i32 0, i32 0)), !dbg !281
  call void @exit(i32 1) #18, !dbg !283
  unreachable, !dbg !283

if.end:                                           ; preds = %entry
  %6 = atomicrmw add i64* @sdmprofile__BBcounter_42, i64 1 seq_cst, !dbg !284
  %7 = load i32* %iNode.addr, align 4, !dbg !284
  %8 = load %struct._QITEM.2** %qNew, align 8, !dbg !284
  %iNode2 = getelementptr inbounds %struct._QITEM.2* %8, i32 0, i32 0, !dbg !284
  %9 = bitcast i32* %iNode2 to i8*, !dbg !284
  %10 = load i32* %sdmprofile__threadnumber_st, !dbg !284
  call void @sdmprofile__SearchRoutine_GVonly(i8* %9, i8 1, i32 %10), !dbg !284
  store i32 %7, i32* %iNode2, align 4, !dbg !284
  %11 = load i32* %iDist.addr, align 4, !dbg !285
  %12 = load %struct._QITEM.2** %qNew, align 8, !dbg !285
  %iDist3 = getelementptr inbounds %struct._QITEM.2* %12, i32 0, i32 1, !dbg !285
  %13 = bitcast i32* %iDist3 to i8*, !dbg !285
  %14 = load i32* %sdmprofile__threadnumber_st, !dbg !285
  call void @sdmprofile__SearchRoutine_GVonly(i8* %13, i8 1, i32 %14), !dbg !285
  store i32 %11, i32* %iDist3, align 4, !dbg !285
  %15 = load i32* %iPrev.addr, align 4, !dbg !286
  %16 = load %struct._QITEM.2** %qNew, align 8, !dbg !286
  %iPrev4 = getelementptr inbounds %struct._QITEM.2* %16, i32 0, i32 2, !dbg !286
  %17 = bitcast i32* %iPrev4 to i8*, !dbg !286
  %18 = load i32* %sdmprofile__threadnumber_st, !dbg !286
  call void @sdmprofile__SearchRoutine_GVonly(i8* %17, i8 1, i32 %18), !dbg !286
  store i32 %15, i32* %iPrev4, align 4, !dbg !286
  %19 = load %struct._QITEM.2** %qNew, align 8, !dbg !287
  %qNext = getelementptr inbounds %struct._QITEM.2* %19, i32 0, i32 3, !dbg !287
  %20 = bitcast %struct._QITEM.2** %qNext to i8*, !dbg !287
  %21 = load i32* %sdmprofile__threadnumber_st, !dbg !287
  call void @sdmprofile__SearchRoutine_GVonly(i8* %20, i8 1, i32 %21), !dbg !287
  store %struct._QITEM.2* null, %struct._QITEM.2** %qNext, align 8, !dbg !287
  %22 = load %struct._QITEM.2** %qLast, align 8, !dbg !288
  %tobool5 = icmp ne %struct._QITEM.2* %22, null, !dbg !288
  br i1 %tobool5, label %if.else, label %if.then6, !dbg !288

if.then6:                                         ; preds = %if.end
  %23 = atomicrmw add i64* @sdmprofile__BBcounter_43, i64 1 seq_cst, !dbg !290
  %24 = load %struct._QITEM.2** %qNew, align 8, !dbg !290
  store %struct._QITEM.2* %24, %struct._QITEM.2** @qHead, align 8, !dbg !290
  br label %if.end11, !dbg !292

if.else:                                          ; preds = %if.end
  %25 = atomicrmw add i64* @sdmprofile__BBcounter_44, i64 1 seq_cst, !dbg !293
  br label %while.cond, !dbg !293

while.cond:                                       ; preds = %while.body, %if.else
  %26 = atomicrmw add i64* @sdmprofile__BBcounter_45, i64 1 seq_cst, !dbg !295
  %27 = load %struct._QITEM.2** %qLast, align 8, !dbg !295
  %qNext7 = getelementptr inbounds %struct._QITEM.2* %27, i32 0, i32 3, !dbg !295
  %28 = bitcast %struct._QITEM.2** %qNext7 to i8*, !dbg !295
  %29 = load i32* %sdmprofile__threadnumber_st, !dbg !295
  call void @sdmprofile__SearchRoutine_GVonly(i8* %28, i8 2, i32 %29), !dbg !295
  %30 = load %struct._QITEM.2** %qNext7, align 8, !dbg !295
  %tobool8 = icmp ne %struct._QITEM.2* %30, null, !dbg !295
  br i1 %tobool8, label %while.body, label %while.end, !dbg !295

while.body:                                       ; preds = %while.cond
  %31 = atomicrmw add i64* @sdmprofile__BBcounter_46, i64 1 seq_cst, !dbg !298
  %32 = load %struct._QITEM.2** %qLast, align 8, !dbg !298
  %qNext9 = getelementptr inbounds %struct._QITEM.2* %32, i32 0, i32 3, !dbg !298
  %33 = bitcast %struct._QITEM.2** %qNext9 to i8*, !dbg !298
  %34 = load i32* %sdmprofile__threadnumber_st, !dbg !298
  call void @sdmprofile__SearchRoutine_GVonly(i8* %33, i8 2, i32 %34), !dbg !298
  %35 = load %struct._QITEM.2** %qNext9, align 8, !dbg !298
  store %struct._QITEM.2* %35, %struct._QITEM.2** %qLast, align 8, !dbg !298
  br label %while.cond, !dbg !298

while.end:                                        ; preds = %while.cond
  %36 = atomicrmw add i64* @sdmprofile__BBcounter_47, i64 1 seq_cst, !dbg !300
  %37 = load %struct._QITEM.2** %qNew, align 8, !dbg !300
  %38 = load %struct._QITEM.2** %qLast, align 8, !dbg !300
  %qNext10 = getelementptr inbounds %struct._QITEM.2* %38, i32 0, i32 3, !dbg !300
  %39 = bitcast %struct._QITEM.2** %qNext10 to i8*, !dbg !300
  %40 = load i32* %sdmprofile__threadnumber_st, !dbg !300
  call void @sdmprofile__SearchRoutine_GVonly(i8* %39, i8 1, i32 %40), !dbg !300
  store %struct._QITEM.2* %37, %struct._QITEM.2** %qNext10, align 8, !dbg !300
  br label %if.end11

if.end11:                                         ; preds = %while.end, %if.then6
  %41 = atomicrmw add i64* @sdmprofile__BBcounter_48, i64 1 seq_cst, !dbg !301
  %42 = load i32* @g_qCount, align 4, !dbg !301
  %inc = add nsw i32 %42, 1, !dbg !301
  store i32 %inc, i32* @g_qCount, align 4, !dbg !301
  ret void, !dbg !302
}

; Function Attrs: nounwind uwtable
define i32 @app__mainfunction__(i32 %argc, i8** %argv, i32 %sdmprofile__threadnumber) #11 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %fp = alloca %struct._IO_FILE.1*, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_1, i64 1 seq_cst, !dbg !303
  call void @llvm.dbg.declare(metadata !{i32* %argc.addr}, metadata !304), !dbg !303
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %argv.addr}, metadata !305), !dbg !306
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !307), !dbg !308
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !309), !dbg !310
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !311), !dbg !312
  call void @llvm.dbg.declare(metadata !{%struct._IO_FILE.1** %fp}, metadata !313), !dbg !374
  %1 = load i32* %argc.addr, align 4, !dbg !375
  %cmp = icmp slt i32 %1, 2, !dbg !375
  br i1 %cmp, label %if.then, label %if.end, !dbg !375

if.then:                                          ; preds = %entry
  %2 = atomicrmw add i64* @sdmprofile__BBcounter_2, i64 1 seq_cst, !dbg !377
  %3 = load %struct._IO_FILE.1** @stderr, align 8, !dbg !377
  %call = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %3, i8* getelementptr inbounds ([28 x i8]* @.str610, i32 0, i32 0)), !dbg !377
  %4 = load %struct._IO_FILE.1** @stderr, align 8, !dbg !379
  %call1 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %4, i8* getelementptr inbounds ([41 x i8]* @.str711, i32 0, i32 0)), !dbg !379
  br label %if.end, !dbg !380

if.end:                                           ; preds = %if.then, %entry
  %5 = atomicrmw add i64* @sdmprofile__BBcounter_3, i64 1 seq_cst, !dbg !381
  %6 = load i8*** %argv.addr, align 8, !dbg !381
  %arrayidx = getelementptr inbounds i8** %6, i64 1, !dbg !381
  %7 = bitcast i8** %arrayidx to i8*, !dbg !381
  %8 = load i32* %sdmprofile__threadnumber_st, !dbg !381
  call void @sdmprofile__SearchRoutine_GVonly(i8* %7, i8 2, i32 %8), !dbg !381
  %9 = load i8** %arrayidx, align 8, !dbg !381
  %call2 = call %struct._IO_FILE.1* @fopen(i8* %9, i8* getelementptr inbounds ([2 x i8]* @.str812, i32 0, i32 0)), !dbg !381
  store %struct._IO_FILE.1* %call2, %struct._IO_FILE.1** %fp, align 8, !dbg !381
  store i32 0, i32* %i, align 4, !dbg !382
  br label %for.cond, !dbg !382

for.cond:                                         ; preds = %for.inc11, %if.end
  %10 = atomicrmw add i64* @sdmprofile__BBcounter_4, i64 1 seq_cst, !dbg !384
  %11 = load i32* %i, align 4, !dbg !384
  %cmp3 = icmp slt i32 %11, 100, !dbg !384
  br i1 %cmp3, label %for.body, label %for.end13, !dbg !384

for.body:                                         ; preds = %for.cond
  %12 = atomicrmw add i64* @sdmprofile__BBcounter_5, i64 1 seq_cst, !dbg !387
  store i32 0, i32* %j, align 4, !dbg !387
  br label %for.cond4, !dbg !387

for.cond4:                                        ; preds = %for.inc, %for.body
  %13 = atomicrmw add i64* @sdmprofile__BBcounter_6, i64 1 seq_cst, !dbg !390
  %14 = load i32* %j, align 4, !dbg !390
  %cmp5 = icmp slt i32 %14, 100, !dbg !390
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !390

for.body6:                                        ; preds = %for.cond4
  %15 = atomicrmw add i64* @sdmprofile__BBcounter_7, i64 1 seq_cst, !dbg !393
  %16 = load %struct._IO_FILE.1** %fp, align 8, !dbg !393
  %call7 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE.1* %16, i8* getelementptr inbounds ([3 x i8]* @.str913, i32 0, i32 0), i32* %k), !dbg !393
  %17 = load i32* %k, align 4, !dbg !395
  %18 = load i32* %j, align 4, !dbg !395
  %idxprom = sext i32 %18 to i64, !dbg !395
  %19 = load i32* %i, align 4, !dbg !395
  %idxprom8 = sext i32 %19 to i64, !dbg !395
  %arrayidx9 = getelementptr inbounds [100 x [100 x i32]]* @AdjMatrix, i32 0, i64 %idxprom8, !dbg !395
  %arrayidx10 = getelementptr inbounds [100 x i32]* %arrayidx9, i32 0, i64 %idxprom, !dbg !395
  %20 = bitcast i32* %arrayidx10 to i8*, !dbg !395
  %21 = load i32* %sdmprofile__threadnumber_st, !dbg !395
  call void @sdmprofile__SearchRoutine_GVonly(i8* %20, i8 1, i32 %21), !dbg !395
  store i32 %17, i32* %arrayidx10, align 4, !dbg !395
  br label %for.inc, !dbg !396

for.inc:                                          ; preds = %for.body6
  %22 = atomicrmw add i64* @sdmprofile__BBcounter_8, i64 1 seq_cst, !dbg !397
  %23 = load i32* %j, align 4, !dbg !397
  %inc = add nsw i32 %23, 1, !dbg !397
  store i32 %inc, i32* %j, align 4, !dbg !397
  br label %for.cond4, !dbg !397

for.end:                                          ; preds = %for.cond4
  %24 = atomicrmw add i64* @sdmprofile__BBcounter_9, i64 1 seq_cst, !dbg !398
  br label %for.inc11, !dbg !398

for.inc11:                                        ; preds = %for.end
  %25 = atomicrmw add i64* @sdmprofile__BBcounter_10, i64 1 seq_cst, !dbg !399
  %26 = load i32* %i, align 4, !dbg !399
  %inc12 = add nsw i32 %26, 1, !dbg !399
  store i32 %inc12, i32* %i, align 4, !dbg !399
  br label %for.cond, !dbg !399

for.end13:                                        ; preds = %for.cond
  %27 = atomicrmw add i64* @sdmprofile__BBcounter_11, i64 1 seq_cst, !dbg !400
  store i32 0, i32* %i, align 4, !dbg !400
  store i32 50, i32* %j, align 4, !dbg !400
  br label %for.cond14, !dbg !400

for.cond14:                                       ; preds = %for.inc18, %for.end13
  %28 = atomicrmw add i64* @sdmprofile__BBcounter_12, i64 1 seq_cst, !dbg !402
  %29 = load i32* %i, align 4, !dbg !402
  %cmp15 = icmp slt i32 %29, 100, !dbg !402
  br i1 %cmp15, label %for.body16, label %for.end21, !dbg !402

for.body16:                                       ; preds = %for.cond14
  %30 = atomicrmw add i64* @sdmprofile__BBcounter_13, i64 1 seq_cst, !dbg !405
  %31 = load i32* %j, align 4, !dbg !405
  %rem = srem i32 %31, 100, !dbg !405
  store i32 %rem, i32* %j, align 4, !dbg !405
  %32 = load i32* %i, align 4, !dbg !407
  %33 = load i32* %j, align 4, !dbg !407
  %sdmprofile__LD2 = load i32* %sdmprofile__threadnumber_st, align 8
  %34 = call i32 @dijkstra(i32 %32, i32 %33, i32 %sdmprofile__LD2), !dbg !407
  br label %for.inc18, !dbg !408

for.inc18:                                        ; preds = %for.body16
  %35 = atomicrmw add i64* @sdmprofile__BBcounter_14, i64 1 seq_cst, !dbg !409
  %36 = load i32* %i, align 4, !dbg !409
  %inc19 = add nsw i32 %36, 1, !dbg !409
  store i32 %inc19, i32* %i, align 4, !dbg !409
  %37 = load i32* %j, align 4, !dbg !409
  %inc20 = add nsw i32 %37, 1, !dbg !409
  store i32 %inc20, i32* %j, align 4, !dbg !409
  br label %for.cond14, !dbg !409

for.end21:                                        ; preds = %for.cond14
  %38 = atomicrmw add i64* @sdmprofile__BBcounter_15, i64 1 seq_cst, !dbg !410
  call void @exit(i32 0) #18, !dbg !410
  unreachable, !dbg !410

return:                                           ; No predecessors!
  %39 = atomicrmw add i64* @sdmprofile__BBcounter_16, i64 1 seq_cst, !dbg !411
  %40 = load i32* %retval, !dbg !411
  ret i32 %40, !dbg !411
}

; Function Attrs: nounwind uwtable
define void @print_path(%struct._NODE.3* %rgnNodes, i32 %chNode, i32 %sdmprofile__threadnumber) #11 {
entry:
  %rgnNodes.addr = alloca %struct._NODE.3*, align 8
  %chNode.addr = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store %struct._NODE.3* %rgnNodes, %struct._NODE.3** %rgnNodes.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_49, i64 1 seq_cst, !dbg !412
  call void @llvm.dbg.declare(metadata !{%struct._NODE.3** %rgnNodes.addr}, metadata !422), !dbg !412
  store i32 %chNode, i32* %chNode.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %chNode.addr}, metadata !423), !dbg !424
  %1 = load i32* %chNode.addr, align 4, !dbg !425
  %idxprom = sext i32 %1 to i64, !dbg !425
  %2 = load %struct._NODE.3** %rgnNodes.addr, align 8, !dbg !425
  %arrayidx = getelementptr inbounds %struct._NODE.3* %2, i64 %idxprom, !dbg !425
  %iPrev = getelementptr inbounds %struct._NODE.3* %arrayidx, i32 0, i32 1, !dbg !425
  %3 = bitcast i32* %iPrev to i8*, !dbg !425
  %4 = load i32* %sdmprofile__threadnumber_st, !dbg !425
  call void @sdmprofile__SearchRoutine_GVonly(i8* %3, i8 2, i32 %4), !dbg !425
  %5 = load i32* %iPrev, align 4, !dbg !425
  %cmp = icmp ne i32 %5, 9999, !dbg !425
  br i1 %cmp, label %if.then, label %if.end, !dbg !425

if.then:                                          ; preds = %entry
  %6 = atomicrmw add i64* @sdmprofile__BBcounter_50, i64 1 seq_cst, !dbg !427
  %7 = load %struct._NODE.3** %rgnNodes.addr, align 8, !dbg !427
  %8 = load i32* %chNode.addr, align 4, !dbg !427
  %idxprom1 = sext i32 %8 to i64, !dbg !427
  %9 = load %struct._NODE.3** %rgnNodes.addr, align 8, !dbg !427
  %arrayidx2 = getelementptr inbounds %struct._NODE.3* %9, i64 %idxprom1, !dbg !427
  %iPrev3 = getelementptr inbounds %struct._NODE.3* %arrayidx2, i32 0, i32 1, !dbg !427
  %10 = bitcast i32* %iPrev3 to i8*, !dbg !427
  %11 = load i32* %sdmprofile__threadnumber_st, !dbg !427
  call void @sdmprofile__SearchRoutine_GVonly(i8* %10, i8 2, i32 %11), !dbg !427
  %12 = load i32* %iPrev3, align 4, !dbg !427
  %sdmprofile__LD5 = load i32* %sdmprofile__threadnumber_st, align 8
  call void @print_path(%struct._NODE.3* %7, i32 %12, i32 %sdmprofile__LD5), !dbg !427
  br label %if.end, !dbg !429

if.end:                                           ; preds = %if.then, %entry
  %13 = atomicrmw add i64* @sdmprofile__BBcounter_51, i64 1 seq_cst, !dbg !430
  %14 = load i32* %chNode.addr, align 4, !dbg !430
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %14), !dbg !430
  %15 = load %struct._IO_FILE.1** @stdout, align 8, !dbg !431
  %call4 = call i32 @fflush(%struct._IO_FILE.1* %15), !dbg !431
  ret void, !dbg !432
}

; Function Attrs: nounwind uwtable
define i32 @qcount(i32 %sdmprofile__threadnumber) #11 {
entry:
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_52, i64 1 seq_cst, !dbg !433
  %1 = load i32* @g_qCount, align 4, !dbg !433
  ret i32 %1, !dbg !433
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #11 {
  %argc_ptr = alloca i32, align 4
  %argv_ptr = alloca i8**, align 8
  %rtn = alloca i32, align 4
  store i32 %argc, i32* %argc_ptr, align 4
  store i8** %argv, i8*** %argv_ptr, align 8
  store i32 3, i32* @sdmprofile__profileAction
  store i64 0, i64* @sdmprofile__heapallocationCount
  store i64 0, i64* @sdmprofile__stackallocationCount
  store i64 53, i64* @sdmprofile__BBcount
  store i32 0, i32* @sdmprofile__IncludeStackProfiling
  call void @sdmprofile__StartProfiling_Processes()
  call void @sdmprofile__Embed_metadata_GV(i64 1, i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([5 x i8]* @sdmprofile__GV_Name_.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @sdmprofile__GV_Type_.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 2, i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str1, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @sdmprofile__GV_Type_.str1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str1, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 3, i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str2, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @sdmprofile__GV_Type_.str2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str2, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 4, i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str3, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @sdmprofile__GV_Type_.str3, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str3, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str3, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 5, i8* getelementptr inbounds ([100 x i8]* @.str4, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str4, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @sdmprofile__GV_Type_.str4, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str4, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str4, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 6, i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str5, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @sdmprofile__GV_Type_.str5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str5, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 7, i8* getelementptr inbounds ([4 x i8]* @.str6, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str6, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @sdmprofile__GV_Type_.str6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str6, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 8, i8* getelementptr inbounds ([124 x i8]* @.str7, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str7, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @sdmprofile__GV_Type_.str7, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str7, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str7, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 9, i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str8, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @sdmprofile__GV_Type_.str8, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str8, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str8, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 10, i8* getelementptr inbounds ([171 x i8]* @.str9, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str9, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @sdmprofile__GV_Type_.str9, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str9, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str9, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 11, i8* bitcast ([100 x [100 x i32]]* @AdjMatrix to i8*), i32 8, i8* getelementptr inbounds ([10 x i8]* @sdmprofile__GV_Name_AdjMatrix, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8]* @sdmprofile__GV_Type_AdjMatrix, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @sdmprofile__GV_FileName_AdjMatrix, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8]* @sdmprofile__GV_FileDir_AdjMatrix, i32 0, i32 0), i64 27)
  call void @sdmprofile__Embed_metadata_GV(i64 12, i8* bitcast (i32* @ch to i8*), i32 8, i8* getelementptr inbounds ([3 x i8]* @sdmprofile__GV_Name_ch, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @sdmprofile__GV_Type_ch, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @sdmprofile__GV_FileName_ch, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8]* @sdmprofile__GV_FileDir_ch, i32 0, i32 0), i64 31)
  call void @sdmprofile__Embed_metadata_GV(i64 13, i8* bitcast (i32* @g_qCount to i8*), i32 8, i8* getelementptr inbounds ([9 x i8]* @sdmprofile__GV_Name_g_qCount, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @sdmprofile__GV_Type_g_qCount, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @sdmprofile__GV_FileName_g_qCount, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8]* @sdmprofile__GV_FileDir_g_qCount, i32 0, i32 0), i64 29)
  call void @sdmprofile__Embed_metadata_GV(i64 14, i8* bitcast (i32* @i to i8*), i32 8, i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_Name_i, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @sdmprofile__GV_Type_i, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @sdmprofile__GV_FileName_i, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8]* @sdmprofile__GV_FileDir_i, i32 0, i32 0), i64 33)
  call void @sdmprofile__Embed_metadata_GV(i64 15, i8* bitcast (i32* @iCost to i8*), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_iCost, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @sdmprofile__GV_Type_iCost, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @sdmprofile__GV_FileName_iCost, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8]* @sdmprofile__GV_FileDir_iCost, i32 0, i32 0), i64 33)
  call void @sdmprofile__Embed_metadata_GV(i64 16, i8* bitcast (i32* @iDist to i8*), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_iDist, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @sdmprofile__GV_Type_iDist, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @sdmprofile__GV_FileName_iDist, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8]* @sdmprofile__GV_FileDir_iDist, i32 0, i32 0), i64 33)
  call void @sdmprofile__Embed_metadata_GV(i64 17, i8* bitcast (i32* @iNode to i8*), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_iNode, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @sdmprofile__GV_Type_iNode, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @sdmprofile__GV_FileName_iNode, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8]* @sdmprofile__GV_FileDir_iNode, i32 0, i32 0), i64 32)
  call void @sdmprofile__Embed_metadata_GV(i64 18, i8* bitcast (i32* @iPrev to i8*), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_iPrev, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @sdmprofile__GV_Type_iPrev, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @sdmprofile__GV_FileName_iPrev, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8]* @sdmprofile__GV_FileDir_iPrev, i32 0, i32 0), i64 32)
  call void @sdmprofile__Embed_metadata_GV(i64 19, i8* bitcast (%struct._QITEM.2** @qHead to i8*), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_qHead, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8]* @sdmprofile__GV_Type_qHead, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @sdmprofile__GV_FileName_qHead, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8]* @sdmprofile__GV_FileDir_qHead, i32 0, i32 0), i64 22)
  call void @sdmprofile__Embed_metadata_GV(i64 20, i8* bitcast ([100 x %struct._NODE.3]* @rgnNodes to i8*), i32 8, i8* getelementptr inbounds ([9 x i8]* @sdmprofile__GV_Name_rgnNodes, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8]* @sdmprofile__GV_Type_rgnNodes, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @sdmprofile__GV_FileName_rgnNodes, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8]* @sdmprofile__GV_FileDir_rgnNodes, i32 0, i32 0), i64 30)
  call void @sdmprofile__Embed_metadata_GV(i64 21, i8* bitcast (%struct._IO_FILE.1** @stderr to i8*), i32 8, i8* getelementptr inbounds ([7 x i8]* @sdmprofile__GV_Name_stderr, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8]* @sdmprofile__GV_Type_stderr, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_stderr, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_stderr, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 22, i8* bitcast (%struct._IO_FILE.1** @stdout to i8*), i32 8, i8* getelementptr inbounds ([7 x i8]* @sdmprofile__GV_Name_stdout, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8]* @sdmprofile__GV_Type_stdout, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_stdout, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_stdout, i32 0, i32 0), i64 0)
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
  %7 = load i64* @sdmprofile__BBcounter_2
  call void @sdmprofile__AddBBHitcount_GV(i64 21, i64 %7, i32 2, i32 0)
  %8 = load i64* @sdmprofile__BBcounter_3
  call void @sdmprofile__BBHit(i64 3, i64 %8)
  %9 = load i64* @sdmprofile__BBcounter_4
  call void @sdmprofile__BBHit(i64 4, i64 %9)
  %10 = load i64* @sdmprofile__BBcounter_5
  call void @sdmprofile__BBHit(i64 5, i64 %10)
  %11 = load i64* @sdmprofile__BBcounter_6
  call void @sdmprofile__BBHit(i64 6, i64 %11)
  %12 = load i64* @sdmprofile__BBcounter_7
  call void @sdmprofile__BBHit(i64 7, i64 %12)
  %13 = load i64* @sdmprofile__BBcounter_8
  call void @sdmprofile__BBHit(i64 8, i64 %13)
  %14 = load i64* @sdmprofile__BBcounter_9
  call void @sdmprofile__BBHit(i64 9, i64 %14)
  %15 = load i64* @sdmprofile__BBcounter_10
  call void @sdmprofile__BBHit(i64 10, i64 %15)
  %16 = load i64* @sdmprofile__BBcounter_11
  call void @sdmprofile__BBHit(i64 11, i64 %16)
  %17 = load i64* @sdmprofile__BBcounter_12
  call void @sdmprofile__BBHit(i64 12, i64 %17)
  %18 = load i64* @sdmprofile__BBcounter_13
  call void @sdmprofile__BBHit(i64 13, i64 %18)
  %19 = load i64* @sdmprofile__BBcounter_14
  call void @sdmprofile__BBHit(i64 14, i64 %19)
  %20 = load i64* @sdmprofile__BBcounter_15
  call void @sdmprofile__BBHit(i64 15, i64 %20)
  %21 = load i64* @sdmprofile__BBcounter_16
  call void @sdmprofile__BBHit(i64 16, i64 %21)
  %22 = load i64* @sdmprofile__BBcounter_17
  call void @sdmprofile__BBHit(i64 17, i64 %22)
  %23 = load i64* @sdmprofile__BBcounter_17
  call void @sdmprofile__AddBBHitcount_GV(i64 19, i64 %23, i32 2, i32 0)
  %24 = load i64* @sdmprofile__BBcounter_18
  call void @sdmprofile__BBHit(i64 18, i64 %24)
  %25 = load i64* @sdmprofile__BBcounter_18
  call void @sdmprofile__AddBBHitcount_GV(i64 19, i64 %25, i32 4, i32 1)
  %26 = load i64* @sdmprofile__BBcounter_18
  call void @sdmprofile__AddBBHitcount_GV(i64 13, i64 %26, i32 1, i32 1)
  %27 = load i64* @sdmprofile__BBcounter_19
  call void @sdmprofile__BBHit(i64 19, i64 %27)
  %28 = load i64* @sdmprofile__BBcounter_20
  call void @sdmprofile__BBHit(i64 20, i64 %28)
  %29 = load i64* @sdmprofile__BBcounter_20
  call void @sdmprofile__AddBBHitcount_GV(i64 12, i64 %29, i32 0, i32 1)
  %30 = load i64* @sdmprofile__BBcounter_21
  call void @sdmprofile__BBHit(i64 21, i64 %30)
  %31 = load i64* @sdmprofile__BBcounter_21
  call void @sdmprofile__AddBBHitcount_GV(i64 12, i64 %31, i32 1, i32 0)
  %32 = load i64* @sdmprofile__BBcounter_22
  call void @sdmprofile__BBHit(i64 22, i64 %32)
  %33 = load i64* @sdmprofile__BBcounter_22
  call void @sdmprofile__AddBBHitcount_GV(i64 12, i64 %33, i32 2, i32 0)
  %34 = load i64* @sdmprofile__BBcounter_23
  call void @sdmprofile__BBHit(i64 23, i64 %34)
  %35 = load i64* @sdmprofile__BBcounter_23
  call void @sdmprofile__AddBBHitcount_GV(i64 12, i64 %35, i32 1, i32 1)
  %36 = load i64* @sdmprofile__BBcounter_24
  call void @sdmprofile__BBHit(i64 24, i64 %36)
  %37 = load i64* @sdmprofile__BBcounter_25
  call void @sdmprofile__BBHit(i64 25, i64 %37)
  %38 = load i64* @sdmprofile__BBcounter_26
  call void @sdmprofile__BBHit(i64 26, i64 %38)
  %39 = load i64* @sdmprofile__BBcounter_27
  call void @sdmprofile__BBHit(i64 27, i64 %39)
  %40 = load i64* @sdmprofile__BBcounter_28
  call void @sdmprofile__BBHit(i64 28, i64 %40)
  %41 = load i64* @sdmprofile__BBcounter_28
  call void @sdmprofile__AddBBHitcount_GV(i64 14, i64 %41, i32 0, i32 1)
  %42 = load i64* @sdmprofile__BBcounter_29
  call void @sdmprofile__BBHit(i64 29, i64 %42)
  %43 = load i64* @sdmprofile__BBcounter_29
  call void @sdmprofile__AddBBHitcount_GV(i64 14, i64 %43, i32 1, i32 0)
  %44 = load i64* @sdmprofile__BBcounter_30
  call void @sdmprofile__BBHit(i64 30, i64 %44)
  %45 = load i64* @sdmprofile__BBcounter_30
  call void @sdmprofile__AddBBHitcount_GV(i64 17, i64 %45, i32 1, i32 0)
  %46 = load i64* @sdmprofile__BBcounter_30
  call void @sdmprofile__AddBBHitcount_GV(i64 14, i64 %46, i32 1, i32 0)
  %47 = load i64* @sdmprofile__BBcounter_30
  call void @sdmprofile__AddBBHitcount_GV(i64 15, i64 %47, i32 0, i32 1)
  %48 = load i64* @sdmprofile__BBcounter_31
  call void @sdmprofile__BBHit(i64 31, i64 %48)
  %49 = load i64* @sdmprofile__BBcounter_31
  call void @sdmprofile__AddBBHitcount_GV(i64 14, i64 %49, i32 1, i32 0)
  %50 = load i64* @sdmprofile__BBcounter_32
  call void @sdmprofile__BBHit(i64 32, i64 %50)
  %51 = load i64* @sdmprofile__BBcounter_32
  call void @sdmprofile__AddBBHitcount_GV(i64 16, i64 %51, i32 1, i32 0)
  %52 = load i64* @sdmprofile__BBcounter_32
  call void @sdmprofile__AddBBHitcount_GV(i64 14, i64 %52, i32 1, i32 0)
  %53 = load i64* @sdmprofile__BBcounter_32
  call void @sdmprofile__AddBBHitcount_GV(i64 15, i64 %53, i32 1, i32 0)
  %54 = load i64* @sdmprofile__BBcounter_33
  call void @sdmprofile__BBHit(i64 33, i64 %54)
  %55 = load i64* @sdmprofile__BBcounter_33
  call void @sdmprofile__AddBBHitcount_GV(i64 17, i64 %55, i32 2, i32 0)
  %56 = load i64* @sdmprofile__BBcounter_33
  call void @sdmprofile__AddBBHitcount_GV(i64 16, i64 %56, i32 2, i32 0)
  %57 = load i64* @sdmprofile__BBcounter_33
  call void @sdmprofile__AddBBHitcount_GV(i64 14, i64 %57, i32 3, i32 0)
  %58 = load i64* @sdmprofile__BBcounter_33
  call void @sdmprofile__AddBBHitcount_GV(i64 15, i64 %58, i32 2, i32 0)
  %59 = load i64* @sdmprofile__BBcounter_34
  call void @sdmprofile__BBHit(i64 34, i64 %59)
  %60 = load i64* @sdmprofile__BBcounter_35
  call void @sdmprofile__BBHit(i64 35, i64 %60)
  %61 = load i64* @sdmprofile__BBcounter_36
  call void @sdmprofile__BBHit(i64 36, i64 %61)
  %62 = load i64* @sdmprofile__BBcounter_36
  call void @sdmprofile__AddBBHitcount_GV(i64 14, i64 %62, i32 1, i32 1)
  %63 = load i64* @sdmprofile__BBcounter_37
  call void @sdmprofile__BBHit(i64 37, i64 %63)
  %64 = load i64* @sdmprofile__BBcounter_38
  call void @sdmprofile__BBHit(i64 38, i64 %64)
  %65 = load i64* @sdmprofile__BBcounter_39
  call void @sdmprofile__BBHit(i64 39, i64 %65)
  %66 = load i64* @sdmprofile__BBcounter_40
  call void @sdmprofile__BBHit(i64 40, i64 %66)
  %67 = load i64* @sdmprofile__BBcounter_40
  call void @sdmprofile__AddBBHitcount_GV(i64 19, i64 %67, i32 1, i32 0)
  %68 = load i64* @sdmprofile__BBcounter_41
  call void @sdmprofile__BBHit(i64 41, i64 %68)
  %69 = load i64* @sdmprofile__BBcounter_41
  call void @sdmprofile__AddBBHitcount_GV(i64 21, i64 %69, i32 1, i32 0)
  %70 = load i64* @sdmprofile__BBcounter_42
  call void @sdmprofile__BBHit(i64 42, i64 %70)
  %71 = load i64* @sdmprofile__BBcounter_43
  call void @sdmprofile__BBHit(i64 43, i64 %71)
  %72 = load i64* @sdmprofile__BBcounter_43
  call void @sdmprofile__AddBBHitcount_GV(i64 19, i64 %72, i32 0, i32 1)
  %73 = load i64* @sdmprofile__BBcounter_44
  call void @sdmprofile__BBHit(i64 44, i64 %73)
  %74 = load i64* @sdmprofile__BBcounter_45
  call void @sdmprofile__BBHit(i64 45, i64 %74)
  %75 = load i64* @sdmprofile__BBcounter_46
  call void @sdmprofile__BBHit(i64 46, i64 %75)
  %76 = load i64* @sdmprofile__BBcounter_47
  call void @sdmprofile__BBHit(i64 47, i64 %76)
  %77 = load i64* @sdmprofile__BBcounter_48
  call void @sdmprofile__BBHit(i64 48, i64 %77)
  %78 = load i64* @sdmprofile__BBcounter_48
  call void @sdmprofile__AddBBHitcount_GV(i64 13, i64 %78, i32 1, i32 1)
  %79 = load i64* @sdmprofile__BBcounter_49
  call void @sdmprofile__BBHit(i64 49, i64 %79)
  %80 = load i64* @sdmprofile__BBcounter_50
  call void @sdmprofile__BBHit(i64 50, i64 %80)
  %81 = load i64* @sdmprofile__BBcounter_51
  call void @sdmprofile__BBHit(i64 51, i64 %81)
  %82 = load i64* @sdmprofile__BBcounter_51
  call void @sdmprofile__AddBBHitcount_GV(i64 22, i64 %82, i32 1, i32 0)
  %83 = load i64* @sdmprofile__BBcounter_52
  call void @sdmprofile__BBHit(i64 52, i64 %83)
  %84 = load i64* @sdmprofile__BBcounter_52
  call void @sdmprofile__AddBBHitcount_GV(i64 13, i64 %84, i32 1, i32 0)
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
attributes #14 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { cold }
attributes #16 = { nounwind readonly }
attributes #17 = { noreturn nounwind }
attributes #18 = { noreturn }

!llvm.ident = !{!0, !0}
!llvm.dbg.cu = !{!1}
!llvm.module.flags = !{!60, !61}

!0 = metadata !{metadata !"clang version 3.5.1 (tags/RELEASE_351/final)"}
!1 = metadata !{i32 786449, metadata !2, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !4, metadata !35, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c] [DW_LANG_C99]
!2 = metadata !{metadata !"dijkstra_large.c", metadata !"/home/sslee/work/regen/test/mibench/network/dijkstra"}
!3 = metadata !{}
!4 = metadata !{metadata !5, metadata !16, metadata !19, metadata !23, metadata !26, metadata !29}
!5 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"print_path", metadata !"print_path", metadata !"", i32 36, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct._NODE.3*, i32)* @print_path_original, null, null, metadata !3, i32 37} ; [ DW_TAG_subprogram ] [line 36] [def] [scope 37] [print_path]
!6 = metadata !{i32 786473, metadata !2}          ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9, metadata !14}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from NODE]
!10 = metadata !{i32 786454, metadata !2, null, metadata !"NODE", i32 11, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ] [NODE] [line 11, size 0, align 0, offset 0] [from _NODE]
!11 = metadata !{i32 786451, metadata !2, null, metadata !"_NODE", i32 6, i64 64, i64 32, i32 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_NODE] [line 6, size 64, align 32, offset 0] [def] [from ]
!12 = metadata !{metadata !13, metadata !15}
!13 = metadata !{i32 786445, metadata !2, metadata !11, metadata !"iDist", i32 8, i64 32, i64 32, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [iDist] [line 8, size 32, align 32, offset 0] [from int]
!14 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!15 = metadata !{i32 786445, metadata !2, metadata !11, metadata !"iPrev", i32 9, i64 32, i64 32, i64 32, i32 0, metadata !14} ; [ DW_TAG_member ] [iPrev] [line 9, size 32, align 32, offset 32] [from int]
!16 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"enqueue", metadata !"enqueue", metadata !"", i32 47, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32, i32)* @enqueue_original, null, null, metadata !3, i32 48} ; [ DW_TAG_subprogram ] [line 47] [def] [scope 48] [enqueue]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null, metadata !14, metadata !14, metadata !14}
!19 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"dequeue", metadata !"dequeue", metadata !"", i32 76, metadata !20, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32*, i32*)* @dequeue_original, null, null, metadata !3, i32 77} ; [ DW_TAG_subprogram ] [line 76] [def] [scope 77] [dequeue]
!20 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !21, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = metadata !{null, metadata !22, metadata !22, metadata !22}
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!23 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"qcount", metadata !"qcount", metadata !"", i32 93, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @qcount_original, null, null, metadata !3, i32 94} ; [ DW_TAG_subprogram ] [line 93] [def] [scope 94] [qcount]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{metadata !14}
!26 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"dijkstra", metadata !"dijkstra", metadata !"", i32 98, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @dijkstra_original, null, null, metadata !3, i32 99} ; [ DW_TAG_subprogram ] [line 98] [def] [scope 99] [dijkstra]
!27 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = metadata !{metadata !14, metadata !14, metadata !14}
!29 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"main", metadata !"main", metadata !"", i32 145, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main_original, null, null, metadata !3, i32 145} ; [ DW_TAG_subprogram ] [line 145] [def] [main]
!30 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = metadata !{metadata !14, metadata !14, metadata !32}
!32 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !33} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!33 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !34} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!34 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!35 = metadata !{metadata !36, metadata !46, metadata !47, metadata !51, metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !59}
!36 = metadata !{i32 786484, i32 0, null, metadata !"qHead", metadata !"qHead", metadata !"", metadata !6, i32 22, metadata !37, i32 0, i32 1, %struct._QITEM.2** @qHead, null} ; [ DW_TAG_variable ] [qHead] [line 22] [def]
!37 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !38} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from QITEM]
!38 = metadata !{i32 786454, metadata !2, null, metadata !"QITEM", i32 20, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ] [QITEM] [line 20, size 0, align 0, offset 0] [from _QITEM]
!39 = metadata !{i32 786451, metadata !2, null, metadata !"_QITEM", i32 13, i64 192, i64 64, i32 0, i32 0, null, metadata !40, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_QITEM] [line 13, size 192, align 64, offset 0] [def] [from ]
!40 = metadata !{metadata !41, metadata !42, metadata !43, metadata !44}
!41 = metadata !{i32 786445, metadata !2, metadata !39, metadata !"iNode", i32 15, i64 32, i64 32, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [iNode] [line 15, size 32, align 32, offset 0] [from int]
!42 = metadata !{i32 786445, metadata !2, metadata !39, metadata !"iDist", i32 16, i64 32, i64 32, i64 32, i32 0, metadata !14} ; [ DW_TAG_member ] [iDist] [line 16, size 32, align 32, offset 32] [from int]
!43 = metadata !{i32 786445, metadata !2, metadata !39, metadata !"iPrev", i32 17, i64 32, i64 32, i64 64, i32 0, metadata !14} ; [ DW_TAG_member ] [iPrev] [line 17, size 32, align 32, offset 64] [from int]
!44 = metadata !{i32 786445, metadata !2, metadata !39, metadata !"qNext", i32 18, i64 64, i64 64, i64 128, i32 0, metadata !45} ; [ DW_TAG_member ] [qNext] [line 18, size 64, align 64, offset 128] [from ]
!45 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !39} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _QITEM]
!46 = metadata !{i32 786484, i32 0, null, metadata !"g_qCount", metadata !"g_qCount", metadata !"", metadata !6, i32 29, metadata !14, i32 0, i32 1, i32* @g_qCount, null} ; [ DW_TAG_variable ] [g_qCount] [line 29] [def]
!47 = metadata !{i32 786484, i32 0, null, metadata !"AdjMatrix", metadata !"AdjMatrix", metadata !"", metadata !6, i32 27, metadata !48, i32 0, i32 1, [100 x [100 x i32]]* @AdjMatrix, null} ; [ DW_TAG_variable ] [AdjMatrix] [line 27] [def]
!48 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 320000, i64 32, i32 0, i32 0, metadata !14, metadata !49, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 320000, align 32, offset 0] [from int]
!49 = metadata !{metadata !50, metadata !50}
!50 = metadata !{i32 786465, i64 0, i64 100}      ; [ DW_TAG_subrange_type ] [0, 99]
!51 = metadata !{i32 786484, i32 0, null, metadata !"rgnNodes", metadata !"rgnNodes", metadata !"", metadata !6, i32 30, metadata !52, i32 0, i32 1, [100 x %struct._NODE.3]* @rgnNodes, null} ; [ DW_TAG_variable ] [rgnNodes] [line 30] [def]
!52 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 6400, i64 32, i32 0, i32 0, metadata !10, metadata !53, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 6400, align 32, offset 0] [from NODE]
!53 = metadata !{metadata !50}
!54 = metadata !{i32 786484, i32 0, null, metadata !"ch", metadata !"ch", metadata !"", metadata !6, i32 31, metadata !14, i32 0, i32 1, i32* @ch, null} ; [ DW_TAG_variable ] [ch] [line 31] [def]
!55 = metadata !{i32 786484, i32 0, null, metadata !"iPrev", metadata !"iPrev", metadata !"", metadata !6, i32 32, metadata !14, i32 0, i32 1, i32* @iPrev, null} ; [ DW_TAG_variable ] [iPrev] [line 32] [def]
!56 = metadata !{i32 786484, i32 0, null, metadata !"iNode", metadata !"iNode", metadata !"", metadata !6, i32 32, metadata !14, i32 0, i32 1, i32* @iNode, null} ; [ DW_TAG_variable ] [iNode] [line 32] [def]
!57 = metadata !{i32 786484, i32 0, null, metadata !"i", metadata !"i", metadata !"", metadata !6, i32 33, metadata !14, i32 0, i32 1, i32* @i, null} ; [ DW_TAG_variable ] [i] [line 33] [def]
!58 = metadata !{i32 786484, i32 0, null, metadata !"iCost", metadata !"iCost", metadata !"", metadata !6, i32 33, metadata !14, i32 0, i32 1, i32* @iCost, null} ; [ DW_TAG_variable ] [iCost] [line 33] [def]
!59 = metadata !{i32 786484, i32 0, null, metadata !"iDist", metadata !"iDist", metadata !"", metadata !6, i32 33, metadata !14, i32 0, i32 1, i32* @iDist, null} ; [ DW_TAG_variable ] [iDist] [line 33] [def]
!60 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!61 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!62 = metadata !{metadata !63, metadata !63, i64 0}
!63 = metadata !{metadata !"any pointer", metadata !64, i64 0}
!64 = metadata !{metadata !"omnipotent char", metadata !65, i64 0}
!65 = metadata !{metadata !"Simple C/C++ TBAA"}
!66 = metadata !{metadata !67, metadata !67, i64 0}
!67 = metadata !{metadata !"int", metadata !64, i64 0}
!68 = metadata !{metadata !69, metadata !63, i64 0}
!69 = metadata !{metadata !"_ZTS18HeapAllocationMeta", metadata !63, i64 0, metadata !63, i64 8, metadata !70, i64 16, metadata !67, i64 24, metadata !70, i64 32}
!70 = metadata !{metadata !"long", metadata !64, i64 0}
!71 = metadata !{metadata !72, metadata !70, i64 0}
!72 = metadata !{metadata !"_ZTS6GVMeta", metadata !70, i64 0, metadata !70, i64 8, metadata !70, i64 16, metadata !63, i64 24, metadata !67, i64 32, metadata !63, i64 40, metadata !63, i64 48, metadata !63, i64 56, metadata !63, i64 64, metadata !63, i64 72, metadata !70, i64 80}
!73 = metadata !{metadata !72, metadata !63, i64 24}
!74 = metadata !{metadata !72, metadata !67, i64 32}
!75 = metadata !{metadata !76, metadata !63, i64 0}
!76 = metadata !{metadata !"_ZTS32sdmprofile__Allocated_Stack_item", metadata !63, i64 0, metadata !70, i64 8, metadata !63, i64 16}
!77 = metadata !{metadata !76, metadata !63, i64 16}
!78 = metadata !{metadata !78, metadata !79, metadata !80}
!79 = metadata !{metadata !"llvm.loop.vectorize.width", i32 1}
!80 = metadata !{metadata !"llvm.loop.interleave.count", i32 1}
!81 = metadata !{metadata !82, metadata !82, i64 0}
!82 = metadata !{metadata !"double", metadata !64, i64 0}
!83 = metadata !{metadata !84, metadata !67, i64 0}
!84 = metadata !{metadata !"_ZTS6Thread", metadata !67, i64 0, metadata !70, i64 8, metadata !82, i64 16, metadata !82, i64 24, metadata !63, i64 32, metadata !63, i64 40, metadata !70, i64 48, metadata !70, i64 56, metadata !70, i64 64, metadata !70, i64 72, metadata !70, i64 80, metadata !70, i64 88, metadata !70, i64 96, metadata !70, i64 104, metadata !70, i64 112, metadata !70, i64 120, metadata !70, i64 128, metadata !64, i64 136, metadata !64, i64 200, metadata !63, i64 264, metadata !63, i64 272}
!85 = metadata !{metadata !84, metadata !70, i64 8}
!86 = metadata !{metadata !84, metadata !82, i64 16}
!87 = metadata !{metadata !84, metadata !82, i64 24}
!88 = metadata !{metadata !84, metadata !63, i64 264}
!89 = metadata !{metadata !90, metadata !63, i64 0}
!90 = metadata !{metadata !"_ZTS11Cache2_Item", metadata !63, i64 0, metadata !63, i64 8}
!91 = metadata !{metadata !90, metadata !63, i64 8}
!92 = metadata !{metadata !84, metadata !63, i64 272}
!93 = metadata !{metadata !94, metadata !63, i64 0}
!94 = metadata !{metadata !"_ZTS12GVCache_Item", metadata !63, i64 0, metadata !63, i64 8}
!95 = metadata !{metadata !94, metadata !63, i64 8}
!96 = metadata !{metadata !84, metadata !63, i64 32}
!97 = metadata !{metadata !72, metadata !63, i64 40}
!98 = metadata !{metadata !72, metadata !63, i64 48}
!99 = metadata !{metadata !72, metadata !63, i64 56}
!100 = metadata !{metadata !72, metadata !63, i64 64}
!101 = metadata !{metadata !72, metadata !63, i64 72}
!102 = metadata !{metadata !72, metadata !70, i64 80}
!103 = metadata !{metadata !104, metadata !70, i64 0}
!104 = metadata !{metadata !"_ZTS23sdmprofile__struct_STrw", metadata !70, i64 0, metadata !70, i64 8, metadata !70, i64 16, metadata !67, i64 24, metadata !63, i64 32, metadata !63, i64 40, metadata !63, i64 48}
!105 = metadata !{metadata !104, metadata !67, i64 24}
!106 = metadata !{metadata !104, metadata !63, i64 32}
!107 = metadata !{metadata !104, metadata !63, i64 40}
!108 = metadata !{metadata !104, metadata !63, i64 48}
!109 = metadata !{metadata !110, metadata !67, i64 0}
!110 = metadata !{metadata !"_ZTS6HPMeta", metadata !67, i64 0, metadata !70, i64 8, metadata !70, i64 16, metadata !63, i64 24, metadata !63, i64 32, metadata !63, i64 40, metadata !70, i64 48, metadata !63, i64 56, metadata !70, i64 64, metadata !70, i64 72, metadata !70, i64 80, metadata !70, i64 88}
!111 = metadata !{metadata !110, metadata !63, i64 24}
!112 = metadata !{metadata !110, metadata !63, i64 32}
!113 = metadata !{metadata !110, metadata !63, i64 40}
!114 = metadata !{metadata !110, metadata !70, i64 48}
!115 = metadata !{metadata !110, metadata !63, i64 56}
!116 = metadata !{metadata !72, metadata !70, i64 8}
!117 = metadata !{metadata !72, metadata !70, i64 16}
!118 = metadata !{metadata !119, metadata !63, i64 0}
!119 = metadata !{metadata !"_ZTSSt14_Fwd_list_baseIP6GVMetaSaIS1_EE", metadata !120, i64 0}
!120 = metadata !{metadata !"_ZTSNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_Fwd_list_implE", metadata !121, i64 0}
!121 = metadata !{metadata !"_ZTSSt19_Fwd_list_node_base", metadata !63, i64 0}
!122 = metadata !{metadata !123, metadata !63, i64 0}
!123 = metadata !{metadata !"_ZTSSt18_Fwd_list_iteratorIP6GVMetaE", metadata !63, i64 0}
!124 = metadata !{metadata !121, metadata !63, i64 0}
!125 = metadata !{metadata !104, metadata !70, i64 8}
!126 = metadata !{metadata !104, metadata !70, i64 16}
!127 = metadata !{metadata !70, metadata !70, i64 0}
!128 = metadata !{metadata !129, metadata !70, i64 0}
!129 = metadata !{metadata !"_ZTS8timespec", metadata !70, i64 0, metadata !70, i64 8}
!130 = metadata !{metadata !129, metadata !70, i64 8}
!131 = metadata !{metadata !132, metadata !70, i64 0}
!132 = metadata !{metadata !"_ZTS7timeval", metadata !70, i64 0, metadata !70, i64 8}
!133 = metadata !{metadata !132, metadata !70, i64 8}
!134 = metadata !{metadata !84, metadata !70, i64 48}
!135 = metadata !{metadata !69, metadata !63, i64 8}
!136 = metadata !{metadata !69, metadata !70, i64 16}
!137 = metadata !{metadata !69, metadata !67, i64 24}
!138 = metadata !{metadata !84, metadata !70, i64 80}
!139 = metadata !{metadata !84, metadata !70, i64 64}
!140 = metadata !{metadata !110, metadata !70, i64 64}
!141 = metadata !{metadata !110, metadata !70, i64 72}
!142 = metadata !{metadata !110, metadata !70, i64 80}
!143 = metadata !{metadata !84, metadata !70, i64 56}
!144 = metadata !{metadata !145, metadata !63, i64 0}
!145 = metadata !{metadata !"_ZTSSt10_List_baseIP18HeapAllocationMetaSaIS1_EE", metadata !146, i64 0}
!146 = metadata !{metadata !"_ZTSNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE10_List_implE", metadata !147, i64 0}
!147 = metadata !{metadata !"_ZTSNSt8__detail15_List_node_baseE", metadata !63, i64 0, metadata !63, i64 8}
!148 = metadata !{metadata !149, metadata !63, i64 0}
!149 = metadata !{metadata !"_ZTSSt14_List_iteratorIP18HeapAllocationMetaE", metadata !63, i64 0}
!150 = metadata !{metadata !147, metadata !63, i64 0}
!151 = metadata !{metadata !84, metadata !70, i64 96}
!152 = metadata !{metadata !84, metadata !70, i64 112}
!153 = metadata !{metadata !84, metadata !70, i64 128}
!154 = metadata !{metadata !84, metadata !70, i64 120}
!155 = metadata !{metadata !84, metadata !70, i64 104}
!156 = metadata !{metadata !110, metadata !70, i64 8}
!157 = metadata !{metadata !110, metadata !70, i64 16}
!158 = metadata !{metadata !76, metadata !70, i64 8}
!159 = metadata !{metadata !64, metadata !64, i64 0}
!160 = metadata !{metadata !161, metadata !63, i64 0}
!161 = metadata !{metadata !"_ZTSN9__gnu_cxx17__normal_iteratorIPcSsEE", metadata !63, i64 0}
!162 = metadata !{metadata !163, metadata !63, i64 0}
!163 = metadata !{metadata !"_ZTSSs", metadata !164, i64 0}
!164 = metadata !{metadata !"_ZTSNSs12_Alloc_hiderE", metadata !63, i64 0}
!165 = metadata !{metadata !166, metadata !70, i64 0}
!166 = metadata !{metadata !"_ZTSNSs9_Rep_baseE", metadata !70, i64 0, metadata !70, i64 8, metadata !67, i64 16}
!167 = metadata !{metadata !166, metadata !67, i64 16}
!168 = metadata !{metadata !169, metadata !63, i64 16}
!169 = metadata !{metadata !"_ZTSSt10_List_nodeIP18HeapAllocationMetaE", metadata !63, i64 16}
!170 = metadata !{metadata !171, metadata !63, i64 0}
!171 = metadata !{metadata !"_ZTSSt24_Fwd_list_const_iteratorIP6GVMetaE", metadata !63, i64 0}
!172 = metadata !{metadata !145, metadata !63, i64 8}
!173 = metadata !{metadata !"branch_weights", i32 64, i32 4}
!174 = metadata !{i32 76, i32 20, metadata !19, null}
!175 = metadata !{i32 786689, metadata !19, metadata !"piNode", metadata !6, i32 16777292, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [piNode] [line 76]
!176 = metadata !{i32 786689, metadata !19, metadata !"piDist", metadata !6, i32 33554508, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [piDist] [line 76]
!177 = metadata !{i32 76, i32 33, metadata !19, null}
!178 = metadata !{i32 786689, metadata !19, metadata !"piPrev", metadata !6, i32 50331724, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [piPrev] [line 76]
!179 = metadata !{i32 76, i32 46, metadata !19, null}
!180 = metadata !{i32 786688, metadata !19, metadata !"qKill", metadata !6, i32 78, metadata !181, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [qKill] [line 78]
!181 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !182} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from QITEM]
!182 = metadata !{i32 786454, metadata !2, null, metadata !"QITEM", i32 20, i64 0, i64 0, i64 0, i32 0, metadata !183} ; [ DW_TAG_typedef ] [QITEM] [line 20, size 0, align 0, offset 0] [from _QITEM]
!183 = metadata !{i32 786451, metadata !2, null, metadata !"_QITEM", i32 13, i64 192, i64 64, i32 0, i32 0, null, metadata !184, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_QITEM] [line 13, size 192, align 64, offset 0] [def] [from ]
!184 = metadata !{metadata !185, metadata !186, metadata !187, metadata !188}
!185 = metadata !{i32 786445, metadata !2, metadata !183, metadata !"iNode", i32 15, i64 32, i64 32, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [iNode] [line 15, size 32, align 32, offset 0] [from int]
!186 = metadata !{i32 786445, metadata !2, metadata !183, metadata !"iDist", i32 16, i64 32, i64 32, i64 32, i32 0, metadata !14} ; [ DW_TAG_member ] [iDist] [line 16, size 32, align 32, offset 32] [from int]
!187 = metadata !{i32 786445, metadata !2, metadata !183, metadata !"iPrev", i32 17, i64 32, i64 32, i64 64, i32 0, metadata !14} ; [ DW_TAG_member ] [iPrev] [line 17, size 32, align 32, offset 64] [from int]
!188 = metadata !{i32 786445, metadata !2, metadata !183, metadata !"qNext", i32 18, i64 64, i64 64, i64 128, i32 0, metadata !189} ; [ DW_TAG_member ] [qNext] [line 18, size 64, align 64, offset 128] [from ]
!189 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !183} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _QITEM]
!190 = metadata !{i32 78, i32 10, metadata !19, null}
!191 = metadata !{i32 78, i32 3, metadata !19, null}
!192 = metadata !{i32 80, i32 7, metadata !193, null}
!193 = metadata !{i32 786443, metadata !2, metadata !19, i32 80, i32 7, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!194 = metadata !{i32 83, i32 7, metadata !195, null}
!195 = metadata !{i32 786443, metadata !2, metadata !193, i32 81, i32 5, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!196 = metadata !{i32 84, i32 7, metadata !195, null}
!197 = metadata !{i32 85, i32 7, metadata !195, null}
!198 = metadata !{i32 86, i32 7, metadata !195, null}
!199 = metadata !{i32 87, i32 7, metadata !195, null}
!200 = metadata !{i32 88, i32 7, metadata !195, null}
!201 = metadata !{i32 89, i32 5, metadata !195, null}
!202 = metadata !{i32 90, i32 1, metadata !19, null}
!203 = metadata !{i32 98, i32 18, metadata !26, null}
!204 = metadata !{i32 786689, metadata !26, metadata !"chStart", metadata !6, i32 16777314, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [chStart] [line 98]
!205 = metadata !{i32 786689, metadata !26, metadata !"chEnd", metadata !6, i32 33554530, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [chEnd] [line 98]
!206 = metadata !{i32 98, i32 31, metadata !26, null}
!207 = metadata !{i32 103, i32 8, metadata !208, null}
!208 = metadata !{i32 786443, metadata !2, metadata !26, i32 103, i32 3, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!209 = metadata !{i32 103, i32 8, metadata !210, null}
!210 = metadata !{i32 786443, metadata !2, metadata !211, i32 103, i32 8, i32 2, i32 33} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!211 = metadata !{i32 786443, metadata !2, metadata !208, i32 103, i32 8, i32 1, i32 32} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!212 = metadata !{i32 105, i32 7, metadata !213, null}
!213 = metadata !{i32 786443, metadata !2, metadata !208, i32 104, i32 5, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!214 = metadata !{i32 106, i32 7, metadata !213, null}
!215 = metadata !{i32 107, i32 5, metadata !213, null}
!216 = metadata !{i32 103, i32 32, metadata !208, null}
!217 = metadata !{i32 109, i32 7, metadata !218, null}
!218 = metadata !{i32 786443, metadata !2, metadata !26, i32 109, i32 7, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!219 = metadata !{i32 111, i32 7, metadata !220, null}
!220 = metadata !{i32 786443, metadata !2, metadata !218, i32 110, i32 5, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!221 = metadata !{i32 112, i32 5, metadata !220, null}
!222 = metadata !{i32 115, i32 7, metadata !223, null}
!223 = metadata !{i32 786443, metadata !2, metadata !218, i32 114, i32 5, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!224 = metadata !{i32 116, i32 7, metadata !223, null}
!225 = metadata !{i32 118, i32 7, metadata !223, null}
!226 = metadata !{i32 120, i32 6, metadata !223, null}
!227 = metadata !{i32 120, i32 13, metadata !228, null}
!228 = metadata !{i32 786443, metadata !2, metadata !223, i32 120, i32 13, i32 1, i32 34} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!229 = metadata !{i32 122, i32 4, metadata !230, null}
!230 = metadata !{i32 786443, metadata !2, metadata !223, i32 121, i32 2, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!231 = metadata !{i32 123, i32 9, metadata !232, null}
!232 = metadata !{i32 786443, metadata !2, metadata !230, i32 123, i32 4, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!233 = metadata !{i32 123, i32 9, metadata !234, null}
!234 = metadata !{i32 786443, metadata !2, metadata !235, i32 123, i32 9, i32 2, i32 37} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!235 = metadata !{i32 786443, metadata !2, metadata !232, i32 123, i32 9, i32 1, i32 35} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!236 = metadata !{i32 125, i32 12, metadata !237, null}
!237 = metadata !{i32 786443, metadata !2, metadata !238, i32 125, i32 12, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!238 = metadata !{i32 786443, metadata !2, metadata !232, i32 124, i32 6, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!239 = metadata !{i32 127, i32 9, metadata !240, null}
!240 = metadata !{i32 786443, metadata !2, metadata !241, i32 127, i32 9, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!241 = metadata !{i32 786443, metadata !2, metadata !237, i32 126, i32 3, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!242 = metadata !{i32 127, i32 9, metadata !243, null}
!243 = metadata !{i32 786443, metadata !2, metadata !240, i32 127, i32 9, i32 1, i32 36} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!244 = metadata !{i32 130, i32 9, metadata !245, null}
!245 = metadata !{i32 786443, metadata !2, metadata !240, i32 129, i32 7, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!246 = metadata !{i32 131, i32 9, metadata !245, null}
!247 = metadata !{i32 132, i32 9, metadata !245, null}
!248 = metadata !{i32 133, i32 7, metadata !245, null}
!249 = metadata !{i32 134, i32 3, metadata !241, null}
!250 = metadata !{i32 135, i32 6, metadata !238, null}
!251 = metadata !{i32 123, i32 31, metadata !232, null}
!252 = metadata !{i32 136, i32 2, metadata !230, null}
!253 = metadata !{i32 138, i32 7, metadata !223, null}
!254 = metadata !{i32 139, i32 7, metadata !223, null}
!255 = metadata !{i32 140, i32 7, metadata !223, null}
!256 = metadata !{i32 141, i32 7, metadata !223, null}
!257 = metadata !{i32 143, i32 1, metadata !26, null}
!258 = metadata !{i32 47, i32 19, metadata !16, null}
!259 = metadata !{i32 786689, metadata !16, metadata !"iNode", metadata !6, i32 16777263, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [iNode] [line 47]
!260 = metadata !{i32 786689, metadata !16, metadata !"iDist", metadata !6, i32 33554479, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [iDist] [line 47]
!261 = metadata !{i32 47, i32 30, metadata !16, null}
!262 = metadata !{i32 786689, metadata !16, metadata !"iPrev", metadata !6, i32 50331695, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [iPrev] [line 47]
!263 = metadata !{i32 47, i32 41, metadata !16, null}
!264 = metadata !{i32 786688, metadata !16, metadata !"qNew", metadata !6, i32 49, metadata !265, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [qNew] [line 49]
!265 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !266} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from QITEM]
!266 = metadata !{i32 786454, metadata !2, null, metadata !"QITEM", i32 20, i64 0, i64 0, i64 0, i32 0, metadata !267} ; [ DW_TAG_typedef ] [QITEM] [line 20, size 0, align 0, offset 0] [from _QITEM]
!267 = metadata !{i32 786451, metadata !2, null, metadata !"_QITEM", i32 13, i64 192, i64 64, i32 0, i32 0, null, metadata !268, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_QITEM] [line 13, size 192, align 64, offset 0] [def] [from ]
!268 = metadata !{metadata !269, metadata !270, metadata !271, metadata !272}
!269 = metadata !{i32 786445, metadata !2, metadata !267, metadata !"iNode", i32 15, i64 32, i64 32, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [iNode] [line 15, size 32, align 32, offset 0] [from int]
!270 = metadata !{i32 786445, metadata !2, metadata !267, metadata !"iDist", i32 16, i64 32, i64 32, i64 32, i32 0, metadata !14} ; [ DW_TAG_member ] [iDist] [line 16, size 32, align 32, offset 32] [from int]
!271 = metadata !{i32 786445, metadata !2, metadata !267, metadata !"iPrev", i32 17, i64 32, i64 32, i64 64, i32 0, metadata !14} ; [ DW_TAG_member ] [iPrev] [line 17, size 32, align 32, offset 64] [from int]
!272 = metadata !{i32 786445, metadata !2, metadata !267, metadata !"qNext", i32 18, i64 64, i64 64, i64 128, i32 0, metadata !273} ; [ DW_TAG_member ] [qNext] [line 18, size 64, align 64, offset 128] [from ]
!273 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !267} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _QITEM]
!274 = metadata !{i32 49, i32 10, metadata !16, null}
!275 = metadata !{i32 49, i32 27, metadata !16, null}
!276 = metadata !{i32 786688, metadata !16, metadata !"qLast", metadata !6, i32 50, metadata !265, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [qLast] [line 50]
!277 = metadata !{i32 50, i32 10, metadata !16, null}
!278 = metadata !{i32 50, i32 3, metadata !16, null}
!279 = metadata !{i32 52, i32 7, metadata !280, null}
!280 = metadata !{i32 786443, metadata !2, metadata !16, i32 52, i32 7, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!281 = metadata !{i32 54, i32 7, metadata !282, null}
!282 = metadata !{i32 786443, metadata !2, metadata !280, i32 53, i32 5, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!283 = metadata !{i32 55, i32 7, metadata !282, null}
!284 = metadata !{i32 57, i32 3, metadata !16, null}
!285 = metadata !{i32 58, i32 3, metadata !16, null} ; [ DW_TAG_imported_module ]
!286 = metadata !{i32 59, i32 3, metadata !16, null}
!287 = metadata !{i32 60, i32 3, metadata !16, null}
!288 = metadata !{i32 62, i32 7, metadata !289, null}
!289 = metadata !{i32 786443, metadata !2, metadata !16, i32 62, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!290 = metadata !{i32 64, i32 7, metadata !291, null}
!291 = metadata !{i32 786443, metadata !2, metadata !289, i32 63, i32 5, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!292 = metadata !{i32 65, i32 5, metadata !291, null}
!293 = metadata !{i32 68, i32 7, metadata !294, null}
!294 = metadata !{i32 786443, metadata !2, metadata !289, i32 67, i32 5, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!295 = metadata !{i32 68, i32 7, metadata !296, null}
!296 = metadata !{i32 786443, metadata !2, metadata !297, i32 68, i32 7, i32 3, i32 31} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!297 = metadata !{i32 786443, metadata !2, metadata !294, i32 68, i32 7, i32 1, i32 29} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!298 = metadata !{i32 68, i32 28, metadata !299, null}
!299 = metadata !{i32 786443, metadata !2, metadata !294, i32 68, i32 28, i32 2, i32 30} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!300 = metadata !{i32 69, i32 7, metadata !294, null}
!301 = metadata !{i32 71, i32 3, metadata !16, null}
!302 = metadata !{i32 73, i32 1, metadata !16, null}
!303 = metadata !{i32 145, i32 14, metadata !29, null}
!304 = metadata !{i32 786689, metadata !29, metadata !"argc", metadata !6, i32 16777361, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 145]
!305 = metadata !{i32 786689, metadata !29, metadata !"argv", metadata !6, i32 33554577, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 145]
!306 = metadata !{i32 145, i32 26, metadata !29, null}
!307 = metadata !{i32 786688, metadata !29, metadata !"i", metadata !6, i32 146, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 146]
!308 = metadata !{i32 146, i32 7, metadata !29, null}
!309 = metadata !{i32 786688, metadata !29, metadata !"j", metadata !6, i32 146, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 146]
!310 = metadata !{i32 146, i32 9, metadata !29, null}
!311 = metadata !{i32 786688, metadata !29, metadata !"k", metadata !6, i32 146, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 146]
!312 = metadata !{i32 146, i32 11, metadata !29, null}
!313 = metadata !{i32 786688, metadata !29, metadata !"fp", metadata !6, i32 147, metadata !314, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fp] [line 147]
!314 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !315} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!315 = metadata !{i32 786454, metadata !316, null, metadata !"FILE", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !317} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!316 = metadata !{metadata !"/usr/include/stdio.h", metadata !"/home/sslee/work/regen/test/mibench/network/dijkstra"}
!317 = metadata !{i32 786451, metadata !318, null, metadata !"_IO_FILE", i32 245, i64 1728, i64 64, i32 0, i32 0, null, metadata !319, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!318 = metadata !{metadata !"/usr/include/libio.h", metadata !"/home/sslee/work/regen/test/mibench/network/dijkstra"}
!319 = metadata !{metadata !320, metadata !321, metadata !322, metadata !323, metadata !324, metadata !325, metadata !326, metadata !327, metadata !328, metadata !329, metadata !330, metadata !331, metadata !332, metadata !340, metadata !341, metadata !342, metadata !343, metadata !347, metadata !349, metadata !351, metadata !355, metadata !358, metadata !360, metadata !362, metadata !363, metadata !364, metadata !365, metadata !369, metadata !370}
!320 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_flags", i32 246, i64 32, i64 32, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!321 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_IO_read_ptr", i32 251, i64 64, i64 64, i64 64, i32 0, metadata !33} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!322 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_IO_read_end", i32 252, i64 64, i64 64, i64 128, i32 0, metadata !33} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!323 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_IO_read_base", i32 253, i64 64, i64 64, i64 192, i32 0, metadata !33} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!324 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_IO_write_base", i32 254, i64 64, i64 64, i64 256, i32 0, metadata !33} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!325 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_IO_write_ptr", i32 255, i64 64, i64 64, i64 320, i32 0, metadata !33} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!326 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_IO_write_end", i32 256, i64 64, i64 64, i64 384, i32 0, metadata !33} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!327 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_IO_buf_base", i32 257, i64 64, i64 64, i64 448, i32 0, metadata !33} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!328 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_IO_buf_end", i32 258, i64 64, i64 64, i64 512, i32 0, metadata !33} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!329 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_IO_save_base", i32 260, i64 64, i64 64, i64 576, i32 0, metadata !33} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!330 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_IO_backup_base", i32 261, i64 64, i64 64, i64 640, i32 0, metadata !33} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!331 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_IO_save_end", i32 262, i64 64, i64 64, i64 704, i32 0, metadata !33} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!332 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_markers", i32 264, i64 64, i64 64, i64 768, i32 0, metadata !333} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!333 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !334} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!334 = metadata !{i32 786451, metadata !318, null, metadata !"_IO_marker", i32 160, i64 192, i64 64, i32 0, i32 0, null, metadata !335, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [def] [from ]
!335 = metadata !{metadata !336, metadata !337, metadata !339}
!336 = metadata !{i32 786445, metadata !318, metadata !334, metadata !"_next", i32 161, i64 64, i64 64, i64 0, i32 0, metadata !333} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!337 = metadata !{i32 786445, metadata !318, metadata !334, metadata !"_sbuf", i32 162, i64 64, i64 64, i64 64, i32 0, metadata !338} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!338 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !317} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!339 = metadata !{i32 786445, metadata !318, metadata !334, metadata !"_pos", i32 166, i64 32, i64 32, i64 128, i32 0, metadata !14} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!340 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_chain", i32 266, i64 64, i64 64, i64 832, i32 0, metadata !338} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!341 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_fileno", i32 268, i64 32, i64 32, i64 896, i32 0, metadata !14} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!342 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_flags2", i32 272, i64 32, i64 32, i64 928, i32 0, metadata !14} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!343 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_old_offset", i32 274, i64 64, i64 64, i64 960, i32 0, metadata !344} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!344 = metadata !{i32 786454, metadata !345, null, metadata !"__off_t", i32 131, i64 0, i64 0, i64 0, i32 0, metadata !346} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!345 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/sslee/work/regen/test/mibench/network/dijkstra"}
!346 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!347 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_cur_column", i32 278, i64 16, i64 16, i64 1024, i32 0, metadata !348} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!348 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!349 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_vtable_offset", i32 279, i64 8, i64 8, i64 1040, i32 0, metadata !350} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!350 = metadata !{i32 786468, null, null, metadata !"signed char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!351 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_shortbuf", i32 280, i64 8, i64 8, i64 1048, i32 0, metadata !352} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!352 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8, i64 8, i32 0, i32 0, metadata !34, metadata !353, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!353 = metadata !{metadata !354}
!354 = metadata !{i32 786465, i64 0, i64 1}       ; [ DW_TAG_subrange_type ] [0, 0]
!355 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_lock", i32 284, i64 64, i64 64, i64 1088, i32 0, metadata !356} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!356 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !357} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_lock_t]
!357 = metadata !{i32 786454, metadata !318, null, metadata !"_IO_lock_t", i32 154, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_typedef ] [_IO_lock_t] [line 154, size 0, align 0, offset 0] [from ]
!358 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_offset", i32 293, i64 64, i64 64, i64 1152, i32 0, metadata !359} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!359 = metadata !{i32 786454, metadata !345, null, metadata !"__off64_t", i32 132, i64 0, i64 0, i64 0, i32 0, metadata !346} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!360 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"__pad1", i32 302, i64 64, i64 64, i64 1216, i32 0, metadata !361} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!361 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!362 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"__pad2", i32 303, i64 64, i64 64, i64 1280, i32 0, metadata !361} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!363 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"__pad3", i32 304, i64 64, i64 64, i64 1344, i32 0, metadata !361} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!364 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"__pad4", i32 305, i64 64, i64 64, i64 1408, i32 0, metadata !361} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!365 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"__pad5", i32 306, i64 64, i64 64, i64 1472, i32 0, metadata !366} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!366 = metadata !{i32 786454, metadata !367, null, metadata !"size_t", i32 58, i64 0, i64 0, i64 0, i32 0, metadata !368} ; [ DW_TAG_typedef ] [size_t] [line 58, size 0, align 0, offset 0] [from long unsigned int]
!367 = metadata !{metadata !"/usr/local/bin/../lib/clang/3.5.1/include/stddef.h", metadata !"/home/sslee/work/regen/test/mibench/network/dijkstra"}
!368 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!369 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_mode", i32 308, i64 32, i64 32, i64 1536, i32 0, metadata !14} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!370 = metadata !{i32 786445, metadata !318, metadata !317, metadata !"_unused2", i32 310, i64 160, i64 8, i64 1568, i32 0, metadata !371} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!371 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160, i64 8, i32 0, i32 0, metadata !34, metadata !372, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!372 = metadata !{metadata !373}
!373 = metadata !{i32 786465, i64 0, i64 20}      ; [ DW_TAG_subrange_type ] [0, 19]
!374 = metadata !{i32 147, i32 9, metadata !29, null}
!375 = metadata !{i32 149, i32 7, metadata !376, null}
!376 = metadata !{i32 786443, metadata !2, metadata !29, i32 149, i32 7, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!377 = metadata !{i32 150, i32 5, metadata !378, null}
!378 = metadata !{i32 786443, metadata !2, metadata !376, i32 149, i32 15, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!379 = metadata !{i32 151, i32 5, metadata !378, null}
!380 = metadata !{i32 152, i32 3, metadata !378, null}
!381 = metadata !{i32 155, i32 8, metadata !29, null}
!382 = metadata !{i32 158, i32 8, metadata !383, null}
!383 = metadata !{i32 786443, metadata !2, metadata !29, i32 158, i32 3, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!384 = metadata !{i32 158, i32 8, metadata !385, null}
!385 = metadata !{i32 786443, metadata !2, metadata !386, i32 158, i32 8, i32 2, i32 41} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!386 = metadata !{i32 786443, metadata !2, metadata !383, i32 158, i32 8, i32 1, i32 38} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!387 = metadata !{i32 159, i32 10, metadata !388, null}
!388 = metadata !{i32 786443, metadata !2, metadata !389, i32 159, i32 5, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!389 = metadata !{i32 786443, metadata !2, metadata !383, i32 158, i32 29, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!390 = metadata !{i32 159, i32 10, metadata !391, null}
!391 = metadata !{i32 786443, metadata !2, metadata !392, i32 159, i32 10, i32 2, i32 40} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!392 = metadata !{i32 786443, metadata !2, metadata !388, i32 159, i32 10, i32 1, i32 39} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!393 = metadata !{i32 161, i32 7, metadata !394, null}
!394 = metadata !{i32 786443, metadata !2, metadata !388, i32 159, i32 31, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!395 = metadata !{i32 162, i32 4, metadata !394, null}
!396 = metadata !{i32 163, i32 5, metadata !394, null}
!397 = metadata !{i32 159, i32 26, metadata !388, null}
!398 = metadata !{i32 164, i32 3, metadata !389, null}
!399 = metadata !{i32 158, i32 24, metadata !383, null}
!400 = metadata !{i32 167, i32 8, metadata !401, null}
!401 = metadata !{i32 786443, metadata !2, metadata !29, i32 167, i32 3, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!402 = metadata !{i32 167, i32 8, metadata !403, null}
!403 = metadata !{i32 786443, metadata !2, metadata !404, i32 167, i32 8, i32 2, i32 43} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!404 = metadata !{i32 786443, metadata !2, metadata !401, i32 167, i32 8, i32 1, i32 42} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!405 = metadata !{i32 168, i32 4, metadata !406, null}
!406 = metadata !{i32 786443, metadata !2, metadata !401, i32 167, i32 41, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!407 = metadata !{i32 169, i32 7, metadata !406, null}
!408 = metadata !{i32 170, i32 3, metadata !406, null}
!409 = metadata !{i32 167, i32 32, metadata !401, null}
!410 = metadata !{i32 171, i32 3, metadata !29, null}
!411 = metadata !{i32 174, i32 1, metadata !29, null}
!412 = metadata !{i32 36, i32 24, metadata !413, null}
!413 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"print_path", metadata !"print_path", metadata !"", i32 36, metadata !414, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct._NODE.3*, i32)* @print_path_original, null, null, metadata !3, i32 37} ; [ DW_TAG_subprogram ] [line 36] [def] [scope 37] [print_path]
!414 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !415, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!415 = metadata !{null, metadata !416, metadata !14}
!416 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !417} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from NODE]
!417 = metadata !{i32 786454, metadata !2, null, metadata !"NODE", i32 11, i64 0, i64 0, i64 0, i32 0, metadata !418} ; [ DW_TAG_typedef ] [NODE] [line 11, size 0, align 0, offset 0] [from _NODE]
!418 = metadata !{i32 786451, metadata !2, null, metadata !"_NODE", i32 6, i64 64, i64 32, i32 0, i32 0, null, metadata !419, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_NODE] [line 6, size 64, align 32, offset 0] [def] [from ]
!419 = metadata !{metadata !420, metadata !421}
!420 = metadata !{i32 786445, metadata !2, metadata !418, metadata !"iDist", i32 8, i64 32, i64 32, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [iDist] [line 8, size 32, align 32, offset 0] [from int]
!421 = metadata !{i32 786445, metadata !2, metadata !418, metadata !"iPrev", i32 9, i64 32, i64 32, i64 32, i32 0, metadata !14} ; [ DW_TAG_member ] [iPrev] [line 9, size 32, align 32, offset 32] [from int]
!422 = metadata !{i32 786689, metadata !413, metadata !"rgnNodes", metadata !6, i32 16777252, metadata !416, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rgnNodes] [line 36]
!423 = metadata !{i32 786689, metadata !413, metadata !"chNode", metadata !6, i32 33554468, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [chNode] [line 36]
!424 = metadata !{i32 36, i32 38, metadata !413, null}
!425 = metadata !{i32 38, i32 7, metadata !426, null}
!426 = metadata !{i32 786443, metadata !2, metadata !413, i32 38, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!427 = metadata !{i32 40, i32 7, metadata !428, null}
!428 = metadata !{i32 786443, metadata !2, metadata !426, i32 39, i32 5, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/dijkstra/dijkstra_large.c]
!429 = metadata !{i32 41, i32 5, metadata !428, null}
!430 = metadata !{i32 42, i32 3, metadata !413, null}
!431 = metadata !{i32 43, i32 3, metadata !413, null}
!432 = metadata !{i32 44, i32 1, metadata !413, null}
!433 = metadata !{i32 95, i32 3, metadata !23, null}
