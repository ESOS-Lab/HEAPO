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
%struct.bfile.2 = type { %struct._IO_FILE.1*, i8, i8, i8, i8 }
%union.anon.3 = type { i64 }

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
@bits = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@bits1 = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@main.pBitCntFunc = internal global [7 x i32 (i64)*] [i32 (i64)* @bit_count_original, i32 (i64)* @bitcount_original, i32 (i64)* @ntbl_bitcnt_original, i32 (i64)* @ntbl_bitcount_original, i32 (i64)* @BW_btbl_bitcount_original, i32 (i64)* @AR_btbl_bitcount_original, i32 (i64)* @bit_shifter_original], align 16
@main.text = internal global [7 x i8*] [i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8]* @.str16, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8]* @.str37, i32 0, i32 0), i8* getelementptr inbounds ([38 x i8]* @.str48, i32 0, i32 0), i8* getelementptr inbounds ([38 x i8]* @.str59, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8]* @.str610, i32 0, i32 0)], align 16
@.str1 = private unnamed_addr constant [29 x i8] c"Optimized 1 bit/loop counter\00", align 1
@.str16 = private unnamed_addr constant [26 x i8] c"Ratko's mystery algorithm\00", align 1
@.str2 = private unnamed_addr constant [31 x i8] c"Recursive bit count by nybbles\00", align 1
@.str37 = private unnamed_addr constant [35 x i8] c"Non-recursive bit count by nybbles\00", align 1
@.str48 = private unnamed_addr constant [38 x i8] c"Non-recursive bit count by bytes (BW)\00", align 1
@.str59 = private unnamed_addr constant [38 x i8] c"Non-recursive bit count by bytes (AR)\00", align 1
@.str610 = private unnamed_addr constant [21 x i8] c"Shift and count bits\00", align 1
@.str711 = private unnamed_addr constant [29 x i8] c"Usage: bitcnts <iterations>\0A\00", align 1
@.str812 = private unnamed_addr constant [33 x i8] c"Bit counter algorithm benchmark\0A\00", align 1
@.str913 = private unnamed_addr constant [36 x i8] c"%-38s> Time: %7.3f sec.; Bits: %ld\0A\00", align 1
@.str1014 = private unnamed_addr constant [13 x i8] c"\0ABest  > %s\0A\00", align 1
@.str1115 = private unnamed_addr constant [12 x i8] c"Worst > %s\0A\00", align 1
@.str1216 = private unnamed_addr constant [3 x i8] c"01\00", align 1
@sdmprofile__GV_Name_.str = private unnamed_addr constant [5 x i8] c".str\00"
@sdmprofile__GV_Type_.str = private unnamed_addr constant [11 x i8] c"[18 x i8]*\00"
@sdmprofile__GV_FileName_.str = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_.str = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_.str1 = private unnamed_addr constant [6 x i8] c".str1\00"
@sdmprofile__GV_Type_.str1 = private unnamed_addr constant [11 x i8] c"[29 x i8]*\00"
@sdmprofile__GV_FileName_.str1 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_.str1 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_.str10 = private unnamed_addr constant [7 x i8] c".str10\00"
@sdmprofile__GV_Type_.str10 = private unnamed_addr constant [11 x i8] c"[43 x i8]*\00"
@sdmprofile__GV_FileName_.str10 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_.str10 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_.str11 = private unnamed_addr constant [7 x i8] c".str11\00"
@sdmprofile__GV_Type_.str11 = private unnamed_addr constant [11 x i8] c"[18 x i8]*\00"
@sdmprofile__GV_FileName_.str11 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_.str11 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_.str12 = private unnamed_addr constant [7 x i8] c".str12\00"
@sdmprofile__GV_Type_.str12 = private unnamed_addr constant [11 x i8] c"[28 x i8]*\00"
@sdmprofile__GV_FileName_.str12 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_.str12 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_.str2 = private unnamed_addr constant [6 x i8] c".str2\00"
@sdmprofile__GV_Type_.str2 = private unnamed_addr constant [11 x i8] c"[31 x i8]*\00"
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
@sdmprofile__GV_Name_bits = private unnamed_addr constant [5 x i8] c"bits\00"
@sdmprofile__GV_Type_bits = private unnamed_addr constant [12 x i8] c"[256 x i8]*\00"
@sdmprofile__GV_FileName_bits = private unnamed_addr constant [11 x i8] c"bitcnt_3.c\00"
@sdmprofile__GV_FileDir_bits = private unnamed_addr constant [56 x i8] c"/home/sslee/work/regen/test/mibench/automotive/bitcount\00"
@sdmprofile__GV_Name_bits1 = private unnamed_addr constant [6 x i8] c"bits1\00"
@sdmprofile__GV_Type_bits1 = private unnamed_addr constant [12 x i8] c"[256 x i8]*\00"
@sdmprofile__GV_FileName_bits1 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_bits1 = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_main.pBitCntFunc = private unnamed_addr constant [17 x i8] c"main.pBitCntFunc\00"
@sdmprofile__GV_Type_main.pBitCntFunc = private unnamed_addr constant [18 x i8] c"[7 x i32 (i64)*]*\00"
@sdmprofile__GV_FileName_main.pBitCntFunc = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_main.pBitCntFunc = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_main.text = private unnamed_addr constant [10 x i8] c"main.text\00"
@sdmprofile__GV_Type_main.text = private unnamed_addr constant [11 x i8] c"[7 x i8*]*\00"
@sdmprofile__GV_FileName_main.text = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_main.text = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_Name_stderr = private unnamed_addr constant [7 x i8] c"stderr\00"
@sdmprofile__GV_Type_stderr = private unnamed_addr constant [21 x i8] c"%struct._IO_FILE.1**\00"
@sdmprofile__GV_FileName_stderr = private unnamed_addr constant [2 x i8] c"-\00"
@sdmprofile__GV_FileDir_stderr = private unnamed_addr constant [2 x i8] c"-\00"

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
  store %struct.HeapAllocationMeta* %0, %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !157
  %call1 = tail call i32 @_Z17RegisterNewThreadv()
  store i32 %call1, i32* @sdmprofile__MainthreadNumber, align 4, !tbaa !161
  %1 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !157
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %1, i64 0, i32 1
  %2 = bitcast i8** %upperbound to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 20, i32 8, i1 false)
  %3 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !157
  %ptr = getelementptr inbounds %struct.HeapAllocationMeta* %3, i64 0, i32 0
  store i8* null, i8** %ptr, align 8, !tbaa !163
  store i64 0, i64* getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 0), align 8, !tbaa !166
  store i8* null, i8** getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 3), align 8, !tbaa !168
  store i32 0, i32* getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 4), align 8, !tbaa !169
  call void @llvm.memset.p0i8.i64(i8* bitcast (i8** getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 5) to i8*), i8 0, i64 24, i32 8, i1 false)
  %4 = load i32* @sdmprofile__IncludeStackProfiling, align 4, !tbaa !161
  %tobool = icmp eq i32 %4, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call2 = tail call noalias i8* @malloc(i64 240000) #2
  %5 = bitcast i8* %call2 to %struct.sdmprofile__Allocated_Stack_item*
  store %struct.sdmprofile__Allocated_Stack_item* %5, %struct.sdmprofile__Allocated_Stack_item** @sdmprofile__MainthreadStack_allo, align 8, !tbaa !157
  %ptr.ind.end = getelementptr i8* %call2, i64 240000
  %6 = bitcast i8* %ptr.ind.end to %struct.sdmprofile__Allocated_Stack_item*
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %if.then
  %index = phi i64 [ 0, %if.then ], [ %index.next.1, %vector.body ]
  %gep.idx1315 = or i64 %index, 1
  %7 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index, i32 0
  %8 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315, i32 0
  store i8* null, i8** %7, align 8, !tbaa !170
  store i8* null, i8** %8, align 8, !tbaa !170
  %9 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index, i32 2
  %10 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315, i32 2
  store i8* null, i8** %9, align 8, !tbaa !172
  store i8* null, i8** %10, align 8, !tbaa !172
  %index.next = add i64 %index, 2
  %gep.idx1315.1 = or i64 %index.next, 1
  %11 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index.next, i32 0
  %12 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315.1, i32 0
  store i8* null, i8** %11, align 8, !tbaa !170
  store i8* null, i8** %12, align 8, !tbaa !170
  %13 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index.next, i32 2
  %14 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315.1, i32 2
  store i8* null, i8** %13, align 8, !tbaa !172
  store i8* null, i8** %14, align 8, !tbaa !172
  %index.next.1 = add i64 %index.next, 2
  %15 = icmp eq i64 %index.next.1, 10000
  br i1 %15, label %if.end.loopexit, label %vector.body, !llvm.loop !173

if.end.loopexit:                                  ; preds = %vector.body
  br label %if.end

if.end:                                           ; preds = %if.end.loopexit, %entry
  store double 0.000000e+00, double* @sdmprofile__AppEndTime, align 8, !tbaa !176
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind uwtable
define i32 @_Z17RegisterNewThreadv() #3 {
entry:
  %call = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %0 = load i32* @thdsCount, align 4, !tbaa !161
  %idxprom = sext i32 %0 to i64
  %threadnumber = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 0
  store i32 %0, i32* %threadnumber, align 8, !tbaa !178
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @thdsCount, align 4, !tbaa !161
  %call1 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %call2 = tail call i64 @pthread_self() #12
  %threadID = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 1
  store i64 %call2, i64* %threadID, align 8, !tbaa !180
  %call3 = tail call double @sdmprofile__getRealTime()
  %ThreadStartTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 2
  store double %call3, double* %ThreadStartTime, align 8, !tbaa !181
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double 0.000000e+00, double* %ThreadEndTime, align 8, !tbaa !182
  %Malloc_Calls = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 6
  %1 = bitcast i64* %Malloc_Calls to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 88, i32 8, i1 false)
  %2 = load i32* @sdmprofile__profileAction, align 4, !tbaa !161
  switch i32 %2, label %if.end [
    i32 4, label %if.then
    i32 1, label %if.then
  ]

if.then:                                          ; preds = %entry, %entry
  %call5 = tail call noalias i8* @malloc(i64 128) #2
  %3 = bitcast i8* %call5 to %struct.Cache2_Item*
  %Cache2_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 19
  store %struct.Cache2_Item* %3, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !183
  %4 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !157
  %ptr = bitcast i8* %call5 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !184
  %add.ptr8 = getelementptr inbounds i8* %call5, i64 16
  %5 = bitcast i8* %add.ptr8 to %struct.Cache2_Item*
  %next = getelementptr inbounds i8* %call5, i64 8
  %6 = bitcast i8* %next to %struct.Cache2_Item**
  store %struct.Cache2_Item* %5, %struct.Cache2_Item** %6, align 8, !tbaa !186
  %ptr.1 = getelementptr inbounds i8* %call5, i64 16
  %7 = bitcast i8* %ptr.1 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %7, align 8, !tbaa !184
  %add.ptr8.1 = getelementptr inbounds i8* %call5, i64 32
  %8 = bitcast i8* %add.ptr8.1 to %struct.Cache2_Item*
  %next.1 = getelementptr inbounds i8* %call5, i64 24
  %9 = bitcast i8* %next.1 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %8, %struct.Cache2_Item** %9, align 8, !tbaa !186
  %ptr.2 = getelementptr inbounds i8* %call5, i64 32
  %10 = bitcast i8* %ptr.2 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %10, align 8, !tbaa !184
  %add.ptr8.2 = getelementptr inbounds i8* %call5, i64 48
  %11 = bitcast i8* %add.ptr8.2 to %struct.Cache2_Item*
  %next.2 = getelementptr inbounds i8* %call5, i64 40
  %12 = bitcast i8* %next.2 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %11, %struct.Cache2_Item** %12, align 8, !tbaa !186
  %ptr.3 = getelementptr inbounds i8* %call5, i64 48
  %13 = bitcast i8* %ptr.3 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %13, align 8, !tbaa !184
  %add.ptr8.3 = getelementptr inbounds i8* %call5, i64 64
  %14 = bitcast i8* %add.ptr8.3 to %struct.Cache2_Item*
  %next.3 = getelementptr inbounds i8* %call5, i64 56
  %15 = bitcast i8* %next.3 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %14, %struct.Cache2_Item** %15, align 8, !tbaa !186
  %ptr.4 = getelementptr inbounds i8* %call5, i64 64
  %16 = bitcast i8* %ptr.4 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %16, align 8, !tbaa !184
  %add.ptr8.4 = getelementptr inbounds i8* %call5, i64 80
  %17 = bitcast i8* %add.ptr8.4 to %struct.Cache2_Item*
  %next.4 = getelementptr inbounds i8* %call5, i64 72
  %18 = bitcast i8* %next.4 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %17, %struct.Cache2_Item** %18, align 8, !tbaa !186
  %ptr.5 = getelementptr inbounds i8* %call5, i64 80
  %19 = bitcast i8* %ptr.5 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %19, align 8, !tbaa !184
  %add.ptr8.5 = getelementptr inbounds i8* %call5, i64 96
  %20 = bitcast i8* %add.ptr8.5 to %struct.Cache2_Item*
  %next.5 = getelementptr inbounds i8* %call5, i64 88
  %21 = bitcast i8* %next.5 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %20, %struct.Cache2_Item** %21, align 8, !tbaa !186
  %ptr.6 = getelementptr inbounds i8* %call5, i64 96
  %22 = bitcast i8* %ptr.6 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %22, align 8, !tbaa !184
  %add.ptr8.6 = getelementptr inbounds i8* %call5, i64 112
  %23 = bitcast i8* %add.ptr8.6 to %struct.Cache2_Item*
  %next.6 = getelementptr inbounds i8* %call5, i64 104
  %24 = bitcast i8* %next.6 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %23, %struct.Cache2_Item** %24, align 8, !tbaa !186
  %add.ptr10 = getelementptr inbounds i8* %call5, i64 112
  %ptr11 = bitcast i8* %add.ptr10 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %ptr11, align 8, !tbaa !184
  %next13 = getelementptr inbounds i8* %call5, i64 120
  %25 = bitcast i8* %next13 to %struct.Cache2_Item**
  store %struct.Cache2_Item* null, %struct.Cache2_Item** %25, align 8, !tbaa !186
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %.off = add i32 %2, -3
  %26 = icmp ult i32 %.off, 2
  br i1 %26, label %if.then17, label %if.end39

if.then17:                                        ; preds = %if.end
  %call19 = tail call noalias i8* @malloc(i64 128) #2
  %27 = bitcast i8* %call19 to %struct.GVCache_Item*
  %GVCache_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 20
  store %struct.GVCache_Item* %27, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !187
  %ptr27 = bitcast i8* %call19 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %ptr27, align 8, !tbaa !188
  %add.ptr30 = getelementptr inbounds i8* %call19, i64 16
  %28 = bitcast i8* %add.ptr30 to %struct.GVCache_Item*
  %next31 = getelementptr inbounds i8* %call19, i64 8
  %29 = bitcast i8* %next31 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %28, %struct.GVCache_Item** %29, align 8, !tbaa !190
  %ptr27.1 = getelementptr inbounds i8* %call19, i64 16
  %30 = bitcast i8* %ptr27.1 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %30, align 8, !tbaa !188
  %add.ptr30.1 = getelementptr inbounds i8* %call19, i64 32
  %31 = bitcast i8* %add.ptr30.1 to %struct.GVCache_Item*
  %next31.1 = getelementptr inbounds i8* %call19, i64 24
  %32 = bitcast i8* %next31.1 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %31, %struct.GVCache_Item** %32, align 8, !tbaa !190
  %ptr27.2 = getelementptr inbounds i8* %call19, i64 32
  %33 = bitcast i8* %ptr27.2 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %33, align 8, !tbaa !188
  %add.ptr30.2 = getelementptr inbounds i8* %call19, i64 48
  %34 = bitcast i8* %add.ptr30.2 to %struct.GVCache_Item*
  %next31.2 = getelementptr inbounds i8* %call19, i64 40
  %35 = bitcast i8* %next31.2 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %34, %struct.GVCache_Item** %35, align 8, !tbaa !190
  %ptr27.3 = getelementptr inbounds i8* %call19, i64 48
  %36 = bitcast i8* %ptr27.3 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %36, align 8, !tbaa !188
  %add.ptr30.3 = getelementptr inbounds i8* %call19, i64 64
  %37 = bitcast i8* %add.ptr30.3 to %struct.GVCache_Item*
  %next31.3 = getelementptr inbounds i8* %call19, i64 56
  %38 = bitcast i8* %next31.3 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %37, %struct.GVCache_Item** %38, align 8, !tbaa !190
  %ptr27.4 = getelementptr inbounds i8* %call19, i64 64
  %39 = bitcast i8* %ptr27.4 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %39, align 8, !tbaa !188
  %add.ptr30.4 = getelementptr inbounds i8* %call19, i64 80
  %40 = bitcast i8* %add.ptr30.4 to %struct.GVCache_Item*
  %next31.4 = getelementptr inbounds i8* %call19, i64 72
  %41 = bitcast i8* %next31.4 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %40, %struct.GVCache_Item** %41, align 8, !tbaa !190
  %ptr27.5 = getelementptr inbounds i8* %call19, i64 80
  %42 = bitcast i8* %ptr27.5 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %42, align 8, !tbaa !188
  %add.ptr30.5 = getelementptr inbounds i8* %call19, i64 96
  %43 = bitcast i8* %add.ptr30.5 to %struct.GVCache_Item*
  %next31.5 = getelementptr inbounds i8* %call19, i64 88
  %44 = bitcast i8* %next31.5 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %43, %struct.GVCache_Item** %44, align 8, !tbaa !190
  %ptr27.6 = getelementptr inbounds i8* %call19, i64 96
  %45 = bitcast i8* %ptr27.6 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %45, align 8, !tbaa !188
  %add.ptr30.6 = getelementptr inbounds i8* %call19, i64 112
  %46 = bitcast i8* %add.ptr30.6 to %struct.GVCache_Item*
  %next31.6 = getelementptr inbounds i8* %call19, i64 104
  %47 = bitcast i8* %next31.6 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %46, %struct.GVCache_Item** %47, align 8, !tbaa !190
  %add.ptr35 = getelementptr inbounds i8* %call19, i64 112
  %ptr36 = bitcast i8* %add.ptr35 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %ptr36, align 8, !tbaa !188
  %next38 = getelementptr inbounds i8* %call19, i64 120
  %48 = bitcast i8* %next38 to %struct.GVCache_Item**
  store %struct.GVCache_Item* null, %struct.GVCache_Item** %48, align 8, !tbaa !190
  br label %if.end39

if.end39:                                         ; preds = %if.then17, %if.end
  %49 = load i32* @sdmprofile__IncludeStackProfiling, align 4, !tbaa !161
  %tobool = icmp eq i32 %49, 0
  br i1 %tobool, label %if.end42, label %if.then40

if.then40:                                        ; preds = %if.end39
  %call41 = tail call noalias i8* @malloc(i64 240000) #2
  %50 = bitcast i8* %call41 to %struct.sdmprofile__Allocated_Stack_item*
  %Stack_allocations_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 4
  store %struct.sdmprofile__Allocated_Stack_item* %50, %struct.sdmprofile__Allocated_Stack_item** %Stack_allocations_head, align 8, !tbaa !191
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %if.end39
  %51 = load i32* %threadnumber, align 8, !tbaa !178
  ret i32 %51
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__Embed_metadata_GV(i64 %index__, i8* %AtAddress, i32 %size_, i8* %Name_string_ptr, i8* %DataType_string_ptr, i8* %FilenameStringptr_, i8* %FileDirStringptr_, i64 %linenumber__) #3 {
entry:
  %I = alloca %struct.GVMeta*, align 8
  %call = tail call noalias i8* @malloc(i64 88) #2
  %0 = bitcast i8* %call to %struct.GVMeta*
  store %struct.GVMeta* %0, %struct.GVMeta** %I, align 8, !tbaa !157
  %index = bitcast i8* %call to i64*
  store i64 %index__, i64* %index, align 8, !tbaa !166
  %address = getelementptr inbounds i8* %call, i64 24
  %1 = bitcast i8* %address to i8**
  store i8* %AtAddress, i8** %1, align 8, !tbaa !168
  %size = getelementptr inbounds i8* %call, i64 32
  %2 = bitcast i8* %size to i32*
  store i32 %size_, i32* %2, align 4, !tbaa !169
  %VarName = getelementptr inbounds i8* %call, i64 40
  %3 = bitcast i8* %VarName to i8**
  store i8* %Name_string_ptr, i8** %3, align 8, !tbaa !192
  %DataTypeString = getelementptr inbounds i8* %call, i64 48
  %4 = bitcast i8* %DataTypeString to i8**
  store i8* %DataType_string_ptr, i8** %4, align 8, !tbaa !193
  %5 = ptrtoint i8* %AtAddress to i64
  %conv = zext i32 %size_ to i64
  %add = add i64 %conv, %5
  %6 = inttoptr i64 %add to i8*
  %upperbound = getelementptr inbounds i8* %call, i64 56
  %7 = bitcast i8* %upperbound to i8**
  store i8* %6, i8** %7, align 8, !tbaa !194
  %r = getelementptr inbounds i8* %call, i64 8
  %FileName = getelementptr inbounds i8* %call, i64 64
  %8 = bitcast i8* %FileName to i8**
  call void @llvm.memset.p0i8.i64(i8* %r, i8 0, i64 16, i32 8, i1 false)
  store i8* %FilenameStringptr_, i8** %8, align 8, !tbaa !195
  %DirName = getelementptr inbounds i8* %call, i64 72
  %9 = bitcast i8* %DirName to i8**
  store i8* %FileDirStringptr_, i8** %9, align 8, !tbaa !196
  %linenumber = getelementptr inbounds i8* %call, i64 80
  %10 = bitcast i8* %linenumber to i64*
  store i64 %linenumber__, i64* %10, align 8, !tbaa !197
  call void @_ZNSt12forward_listIP6GVMetaSaIS1_EE10push_frontERKS1_(%"class.std::forward_list"* @GVMetalist, %struct.GVMeta** dereferenceable(8) %I)
  %11 = load i8** @GV_AddrRangeHead, align 8, !tbaa !157
  %cmp = icmp eq i8* %11, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i8* %AtAddress, i8** @GV_AddrRangeHead, align 8, !tbaa !157
  store i8* %6, i8** @GV_AddrRangeTail, align 8, !tbaa !157
  br label %if.end12

if.else:                                          ; preds = %entry
  %cmp3 = icmp ugt i8* %11, %AtAddress
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.else
  store i8* %AtAddress, i8** @GV_AddrRangeHead, align 8, !tbaa !157
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.else
  %12 = load i8** @GV_AddrRangeTail, align 8, !tbaa !157
  %cmp7 = icmp ult i8* %12, %6
  br i1 %cmp7, label %if.then8, label %if.end12

if.then8:                                         ; preds = %if.end
  store i8* %6, i8** @GV_AddrRangeTail, align 8, !tbaa !157
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
  store i64 %index__, i64* %index, align 8, !tbaa !198
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 3
  store i32 %size_, i32* %size, align 8, !tbaa !200
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 4
  store i8* %Estimated_Name_string_ptr, i8** %EstimatedName, align 8, !tbaa !201
  %DataTypeString = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 5
  store i8* %DataType_string_ptr, i8** %DataTypeString, align 8, !tbaa !202
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 6
  store i8* %FunctionName_string_ptr, i8** %FunctionName, align 8, !tbaa !203
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__Embed_metadata_HP(i32 %index__, i8* %Estimated_Name_string_ptr, i8* %DataType_string_ptr, i8* %FunctionName_string_ptr, i64 %linenumber__, i8* %SourceFile__) #3 {
entry:
  %idxprom = zext i32 %index__ to i64
  %index = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 0
  store i32 %index__, i32* %index, align 16, !tbaa !204
  %EstimatedName = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 3
  store i8* %Estimated_Name_string_ptr, i8** %EstimatedName, align 8, !tbaa !206
  %EstimatedDataTypeString = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 4
  store i8* %DataType_string_ptr, i8** %EstimatedDataTypeString, align 16, !tbaa !207
  %FunctionName = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 5
  store i8* %FunctionName_string_ptr, i8** %FunctionName, align 8, !tbaa !208
  %linenumber = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 6
  store i64 %linenumber__, i64* %linenumber, align 16, !tbaa !209
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 7
  store i8* %SourceFile__, i8** %SourceFile, align 8, !tbaa !210
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
  %0 = load %struct.GVMeta** %call4, align 8, !tbaa !157
  %index = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 0
  %1 = load i64* %index, align 8, !tbaa !166
  %cmp = icmp eq i64 %1, %index__
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %r = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 1
  %2 = load i64* %r, align 8, !tbaa !211
  %add = add i64 %2, %mul
  store i64 %add, i64* %r, align 8, !tbaa !211
  %w = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 2
  %3 = load i64* %w, align 8, !tbaa !212
  %add8 = add i64 %3, %mul7
  store i64 %add8, i64* %w, align 8, !tbaa !212
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
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !213
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
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !217
  %_M_node2 = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %__x, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_node2, align 8, !tbaa !217
  %cmp = icmp ne %"struct.std::_Fwd_list_node_base"* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(8) %struct.GVMeta** @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEdeEv(%"struct.std::_Fwd_list_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !217
  %1 = bitcast %"struct.std::_Fwd_list_node_base"* %0 to %"struct.std::_Fwd_list_node"*
  %call = tail call %struct.GVMeta** @_ZNSt14_Fwd_list_nodeIP6GVMetaE9_M_valptrEv(%"struct.std::_Fwd_list_node"* %1) #2
  ret %struct.GVMeta** %call
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %this) #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !217
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %0, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !219
  store %"struct.std::_Fwd_list_node_base"* %1, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !217
  ret %"struct.std::_Fwd_list_iterator"* %this
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__AddBBHitcount_ST(i64 %index__, i64 %BBhitcount, i32 %Rcount, i32 %Wcount) #3 {
entry:
  %r = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 1
  %0 = load i64* %r, align 8, !tbaa !220
  %conv = sext i32 %Rcount to i64
  %mul = mul i64 %conv, %BBhitcount
  %add = add i64 %0, %mul
  store i64 %add, i64* %r, align 8, !tbaa !220
  %w = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 2
  %1 = load i64* %w, align 8, !tbaa !221
  %conv4 = sext i32 %Wcount to i64
  %mul5 = mul i64 %conv4, %BBhitcount
  %add6 = add i64 %1, %mul5
  store i64 %add6, i64* %w, align 8, !tbaa !221
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
  store i64 %cc, i64* %arrayidx, align 8, !tbaa !222
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
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !182
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
  %0 = load i64* %tv_sec, align 8, !tbaa !223
  %conv = sitofp i64 %0 to double
  %tv_nsec = getelementptr inbounds %struct.timespec* %ts, i64 0, i32 1
  %1 = load i64* %tv_nsec, align 8, !tbaa !225
  %conv1 = sitofp i64 %1 to double
  %div = fdiv double %conv1, 1.000000e+09
  %add = fadd double %conv, %div
  br label %return

if.end:                                           ; preds = %entry
  %call2 = call i32 @gettimeofday(%struct.timeval* %tm, %struct.timezone* null) #2
  %tv_sec3 = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 0
  %2 = load i64* %tv_sec3, align 8, !tbaa !226
  %conv4 = sitofp i64 %2 to double
  %tv_usec = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 1
  %3 = load i64* %tv_usec, align 8, !tbaa !228
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
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !182
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template3(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %conv = zext i32 %call to i64
  %call4 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %conv, i32 3
  store double %call4, double* %ThreadEndTime, align 8, !tbaa !182
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template4(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %conv = zext i32 %call to i64
  %call4 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %conv, i32 3
  store double %call4, double* %ThreadEndTime, align 8, !tbaa !182
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template5(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %call2 = tail call double @sdmprofile__getRealTime()
  %idxprom = zext i32 %call to i64
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !182
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template6(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %idxprom = zext i32 %call to i64
  %call2 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !182
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define i8* @sdmprofile__malloc(i64 %size_, i32 %heap_index, i32 %thdnumber) #3 {
entry:
  %I = alloca %struct.HeapAllocationMeta*, align 8
  %call = tail call noalias i8* @malloc(i64 %size_) #2
  %idxprom = zext i32 %thdnumber to i64
  %Malloc_Calls = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 6
  %0 = load i64* %Malloc_Calls, align 8, !tbaa !229
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Malloc_Calls, align 8, !tbaa !229
  %call1 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %call2 = tail call noalias i8* @malloc(i64 40) #2
  %1 = bitcast i8* %call2 to %struct.HeapAllocationMeta*
  store %struct.HeapAllocationMeta* %1, %struct.HeapAllocationMeta** %I, align 8, !tbaa !157
  %ptr = bitcast i8* %call2 to i8**
  store i8* %call, i8** %ptr, align 8, !tbaa !163
  %2 = ptrtoint i8* %call to i64
  %add = add i64 %2, %size_
  %3 = inttoptr i64 %add to i8*
  %upperbound = getelementptr inbounds i8* %call2, i64 8
  %4 = bitcast i8* %upperbound to i8**
  store i8* %3, i8** %4, align 8, !tbaa !230
  %size = getelementptr inbounds i8* %call2, i64 16
  %5 = bitcast i8* %size to i64*
  store i64 %size_, i64* %5, align 8, !tbaa !231
  %heapindex = getelementptr inbounds i8* %call2, i64 24
  %6 = bitcast i8* %heapindex to i32*
  store i32 %heap_index, i32* %6, align 4, !tbaa !232
  call void @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE10push_frontERKS1_(%"class.std::list"* @HeapAllocationList, %struct.HeapAllocationMeta** dereferenceable(8) %I)
  %call3 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %Current_Heap_Allocation = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 10
  %7 = load i64* %Current_Heap_Allocation, align 8, !tbaa !233
  %inc6 = add i64 %7, 1
  store i64 %inc6, i64* %Current_Heap_Allocation, align 8, !tbaa !233
  %Peak_Heap_Allocation = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 8
  %8 = load i64* %Peak_Heap_Allocation, align 8, !tbaa !234
  %cmp = icmp ult i64 %8, %inc6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 %inc6, i64* %Peak_Heap_Allocation, align 8, !tbaa !234
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %idxprom18 = zext i32 %heap_index to i64
  %arrayidx19 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18
  store %struct.HPMeta* %arrayidx19, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !157
  %hitcount = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 8
  %9 = load i64* %hitcount, align 16, !tbaa !235
  %cmp20 = icmp eq i64 %9, 0
  %MaxSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 9
  br i1 %cmp20, label %if.then21, label %if.else

if.then21:                                        ; preds = %if.end
  store i64 %size_, i64* %MaxSize, align 8, !tbaa !236
  %MinSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 10
  store i64 %size_, i64* %MinSize, align 16, !tbaa !237
  br label %if.end32

if.else:                                          ; preds = %if.end
  %10 = load i64* %MaxSize, align 8, !tbaa !236
  %cmp23 = icmp ult i64 %10, %size_
  br i1 %cmp23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %if.else
  store i64 %size_, i64* %MaxSize, align 8, !tbaa !236
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %if.else
  %MinSize27 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 10
  %11 = load i64* %MinSize27, align 16, !tbaa !237
  %cmp28 = icmp ugt i64 %11, %size_
  br i1 %cmp28, label %if.then29, label %if.end32

if.then29:                                        ; preds = %if.end26
  store i64 %size_, i64* %MinSize27, align 16, !tbaa !237
  br label %if.end32

if.end32:                                         ; preds = %if.then29, %if.end26, %if.then21
  %hitcount33 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 8
  %inc34 = add i64 %9, 1
  store i64 %inc34, i64* %hitcount33, align 16, !tbaa !235
  %12 = load i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !157
  %cmp35 = icmp eq i8* %12, null
  br i1 %cmp35, label %if.then36, label %if.else38

if.then36:                                        ; preds = %if.end32
  store i8* %call, i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !157
  store i8* %3, i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !157
  br label %if.end47

if.else38:                                        ; preds = %if.end32
  %cmp39 = icmp ugt i8* %12, %call
  br i1 %cmp39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.else38
  store i8* %call, i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !157
  br label %if.end41

if.end41:                                         ; preds = %if.then40, %if.else38
  %13 = load i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !157
  %cmp43 = icmp ult i8* %13, %3
  br i1 %cmp43, label %if.then44, label %if.end47

if.then44:                                        ; preds = %if.end41
  store i8* %3, i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !157
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
  %0 = load i64* %Free_Calls, align 8, !tbaa !238
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Free_Calls, align 8, !tbaa !238
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
  %1 = load %struct.HeapAllocationMeta** %call5, align 8, !tbaa !157
  %ptr = getelementptr inbounds %struct.HeapAllocationMeta* %1, i64 0, i32 0
  %2 = load i8** %ptr, align 8, !tbaa !163
  %cmp = icmp eq i8* %2, %pointer
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %ptr.lcssa = phi i8** [ %ptr, %for.body ]
  %call5.lcssa = phi %struct.HeapAllocationMeta** [ %call5, %for.body ]
  store i8* null, i8** %ptr.lcssa, align 8, !tbaa !163
  %3 = load %struct.HeapAllocationMeta** %call5.lcssa, align 8, !tbaa !157
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %3, i64 0, i32 1
  store i8* null, i8** %upperbound, align 8, !tbaa !230
  %4 = load %struct.HeapAllocationMeta** %call5.lcssa, align 8, !tbaa !157
  %size = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 2
  store i64 0, i64* %size, align 8, !tbaa !231
  %heapindex = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 3
  store i32 0, i32* %heapindex, align 4, !tbaa !232
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
  %5 = load i64* %Current_Heap_Allocation, align 8, !tbaa !233
  %dec = add i64 %5, -1
  store i64 %dec, i64* %Current_Heap_Allocation, align 8, !tbaa !233
  call void @free(i8* %pointer) #2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden %"struct.std::__detail::_List_node_base"* @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE5beginEv(%"class.std::list"* nocapture readonly %this) #3 align 2 {
entry:
  %retval = alloca %"struct.std::_List_iterator", align 8
  %_M_next = getelementptr inbounds %"class.std::list"* %this, i64 0, i32 0, i32 0, i32 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !239
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
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !243
  %_M_node2 = getelementptr inbounds %"struct.std::_List_iterator"* %__x, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_node2, align 8, !tbaa !243
  %cmp = icmp ne %"struct.std::__detail::_List_node_base"* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(8) %struct.HeapAllocationMeta** @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEdeEv(%"struct.std::_List_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_List_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !243
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
  store %"struct.std::__detail::_List_node_base"* %call2, %"struct.std::__detail::_List_node_base"** %0, align 8, !tbaa !157
  %call420 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__first, %"struct.std::_List_iterator"* dereferenceable(8) %__last)
  br i1 %call420, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %entry
  %1 = getelementptr inbounds %"struct.std::_List_iterator"* %__next, i64 0, i32 0
  br label %while.body

while.body:                                       ; preds = %if.end13, %while.body.lr.ph
  %agg.tmp16.sroa.0.0.copyload23 = phi %"struct.std::__detail::_List_node_base"* [ %call2, %while.body.lr.ph ], [ %agg.tmp16.sroa.0.0.copyload22, %if.end13 ]
  %2 = phi %"struct.std::__detail::_List_node_base"* [ %call, %while.body.lr.ph ], [ %5, %if.end13 ]
  store %"struct.std::__detail::_List_node_base"* %2, %"struct.std::__detail::_List_node_base"** %1, align 8, !tbaa !157
  %call5 = call dereferenceable(8) %"struct.std::_List_iterator"* @_ZNSt14_List_iteratorIP18HeapAllocationMetaEppEv(%"struct.std::_List_iterator"* %__next)
  %call6 = call dereferenceable(8) %struct.HeapAllocationMeta** @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEdeEv(%"struct.std::_List_iterator"* %__first)
  %3 = load %struct.HeapAllocationMeta** %call6, align 8, !tbaa !157
  %4 = load %struct.HeapAllocationMeta** %__value, align 8, !tbaa !157
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
  store %"struct.std::__detail::_List_node_base"* %2, %"struct.std::__detail::_List_node_base"** %0, align 8, !tbaa !157
  br label %if.end13

if.end13:                                         ; preds = %if.else, %if.then11, %while.body
  %agg.tmp16.sroa.0.0.copyload22 = phi %"struct.std::__detail::_List_node_base"* [ %agg.tmp16.sroa.0.0.copyload23, %if.then11 ], [ %2, %if.else ], [ %agg.tmp16.sroa.0.0.copyload23, %while.body ]
  %5 = load %"struct.std::__detail::_List_node_base"** %1, align 8, !tbaa !157
  store %"struct.std::__detail::_List_node_base"* %5, %"struct.std::__detail::_List_node_base"** %coerce.dive, align 8, !tbaa !157
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
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !243
  %_M_next = getelementptr inbounds %"struct.std::__detail::_List_node_base"* %0, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !245
  store %"struct.std::__detail::_List_node_base"* %1, %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !243
  ret %"struct.std::_List_iterator"* %this
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy1(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType) #3 {
entry:
  %0 = load i64* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 12), align 16, !tbaa !246
  %inc = add i64 %0, 1
  store i64 %inc, i64* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 12), align 16, !tbaa !246
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy2(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType, i32 %threadnumber) #3 {
entry:
  %idxprom = zext i32 %threadnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !246
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !246
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy3(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType, i32 %threadnumber, %struct.sdmprofile__Allocated_Stack_item* nocapture readnone %ptr) #3 {
entry:
  %idxprom = zext i32 %threadnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !246
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !246
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_GVonly(i8* readnone %AtAddress, i8 zeroext %AccessType, i32 %thdnumber) #3 {
entry:
  %__begin = alloca %"struct.std::_Fwd_list_iterator", align 8
  %__end = alloca %"struct.std::_Fwd_list_iterator", align 8
  %idxprom = zext i32 %thdnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !246
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !246
  %1 = load i8** @GV_AddrRangeHead, align 8, !tbaa !157
  %cmp = icmp ule i8* %1, %AtAddress
  %2 = load i8** @GV_AddrRangeTail, align 8
  %cmp1 = icmp ugt i8* %2, %AtAddress
  %or.cond = and i1 %cmp, %cmp1
  br i1 %or.cond, label %if.then, label %return

if.then:                                          ; preds = %entry
  %SearchWithinAddressRange = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 14
  %3 = load i64* %SearchWithinAddressRange, align 8, !tbaa !247
  %inc4 = add i64 %3, 1
  store i64 %inc4, i64* %SearchWithinAddressRange, align 8, !tbaa !247
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
  %4 = load %struct.GVMeta** %ptr, align 8, !tbaa !188
  %address = getelementptr inbounds %struct.GVMeta* %4, i64 0, i32 3
  %5 = load i8** %address, align 8, !tbaa !168
  %cmp8 = icmp ugt i8* %5, %AtAddress
  br i1 %cmp8, label %if.else37, label %land.lhs.true9

land.lhs.true9:                                   ; preds = %while.body
  %upperbound = getelementptr inbounds %struct.GVMeta* %4, i64 0, i32 7
  %6 = load i8** %upperbound, align 8, !tbaa !194
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
  %7 = load i64* %r, align 8, !tbaa !211
  %inc14 = add i64 %7, 1
  store i64 %inc14, i64* %r, align 8, !tbaa !211
  br label %sw.epilog

sw.bb15:                                          ; preds = %if.then12
  %w = getelementptr inbounds %struct.GVMeta* %.lcssa154, i64 0, i32 2
  %8 = load i64* %w, align 8, !tbaa !212
  %inc17 = add i64 %8, 1
  store i64 %inc17, i64* %w, align 8, !tbaa !212
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb15, %sw.bb, %if.then12
  %Cache_Hits = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 16
  %9 = load i64* %Cache_Hits, align 8, !tbaa !248
  %inc20 = add i64 %9, 1
  store i64 %inc20, i64* %Cache_Hits, align 8, !tbaa !248
  %10 = load %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !187
  %cmp24 = icmp eq %struct.GVCache_Item* %I.0139.lcssa, %10
  br i1 %cmp24, label %return, label %if.else

if.else:                                          ; preds = %sw.epilog
  %next = getelementptr inbounds %struct.GVCache_Item* %I.0139.lcssa, i64 0, i32 1
  %11 = load %struct.GVCache_Item** %next, align 8, !tbaa !190
  %next26 = getelementptr inbounds %struct.GVCache_Item* %previous.0138.lcssa, i64 0, i32 1
  store %struct.GVCache_Item* %11, %struct.GVCache_Item** %next26, align 8, !tbaa !190
  store %struct.GVCache_Item* %I.0139.lcssa, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !187
  store %struct.GVCache_Item* %10, %struct.GVCache_Item** %next, align 8, !tbaa !190
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
  %12 = load %struct.GVMeta** %call44, align 8, !tbaa !157
  %address45 = getelementptr inbounds %struct.GVMeta* %12, i64 0, i32 3
  %13 = load i8** %address45, align 8, !tbaa !168
  %cmp46 = icmp ugt i8* %13, %AtAddress
  br i1 %cmp46, label %for.inc, label %land.lhs.true47

land.lhs.true47:                                  ; preds = %for.body
  %upperbound48 = getelementptr inbounds %struct.GVMeta* %12, i64 0, i32 7
  %14 = load i8** %upperbound48, align 8, !tbaa !194
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
  %15 = load i64* %r53, align 8, !tbaa !211
  %inc54 = add i64 %15, 1
  store i64 %inc54, i64* %r53, align 8, !tbaa !211
  br label %sw.epilog59

sw.bb55:                                          ; preds = %if.then50
  %w56 = getelementptr inbounds %struct.GVMeta* %.lcssa, i64 0, i32 2
  %16 = load i64* %w56, align 8, !tbaa !212
  %inc57 = add i64 %16, 1
  store i64 %inc57, i64* %w56, align 8, !tbaa !212
  br label %sw.epilog59

sw.epilog59:                                      ; preds = %sw.bb55, %sw.bb52, %if.then50
  %Cache_Miss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 15
  %17 = load i64* %Cache_Miss, align 8, !tbaa !249
  %inc68 = add i64 %17, 1
  store i64 %inc68, i64* %Cache_Miss, align 8, !tbaa !249
  %18 = load %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !187
  br label %while.cond75

for.inc:                                          ; preds = %land.lhs.true47, %for.body
  %call61 = call dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %call42 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call42, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %while.end
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %19 = load i64* %SearchMiss, align 8, !tbaa !250
  %inc64 = add i64 %19, 1
  store i64 %inc64, i64* %SearchMiss, align 8, !tbaa !250
  br label %return

while.cond75:                                     ; preds = %while.cond75, %sw.epilog59
  %previous70.0 = phi %struct.GVCache_Item* [ undef, %sw.epilog59 ], [ %I71.0, %while.cond75 ]
  %I71.0 = phi %struct.GVCache_Item* [ %18, %sw.epilog59 ], [ %20, %while.cond75 ]
  %next76 = getelementptr inbounds %struct.GVCache_Item* %I71.0, i64 0, i32 1
  %20 = load %struct.GVCache_Item** %next76, align 8, !tbaa !190
  %cmp77 = icmp eq %struct.GVCache_Item* %20, null
  br i1 %cmp77, label %while.end80, label %while.cond75

while.end80:                                      ; preds = %while.cond75
  %next76.lcssa = phi %struct.GVCache_Item** [ %next76, %while.cond75 ]
  %I71.0.lcssa = phi %struct.GVCache_Item* [ %I71.0, %while.cond75 ]
  %previous70.0.lcssa = phi %struct.GVCache_Item* [ %previous70.0, %while.cond75 ]
  %next81 = getelementptr inbounds %struct.GVCache_Item* %previous70.0.lcssa, i64 0, i32 1
  store %struct.GVCache_Item* null, %struct.GVCache_Item** %next81, align 8, !tbaa !190
  store %struct.GVCache_Item* %I71.0.lcssa, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !187
  store %struct.GVCache_Item* %18, %struct.GVCache_Item** %next76.lcssa, align 8, !tbaa !190
  %ptr95 = getelementptr inbounds %struct.GVCache_Item* %I71.0.lcssa, i64 0, i32 0
  store %struct.GVMeta* %.lcssa, %struct.GVMeta** %ptr95, align 8, !tbaa !188
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
  %0 = load i64* %Search, align 8, !tbaa !246
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !246
  %1 = load i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !157
  %cmp = icmp ugt i8* %1, %AtAddress
  %2 = load i8** @sdmprofile__HP_addressRangeTo, align 8
  %cmp1 = icmp ult i8* %2, %AtAddress
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %if.end96, label %if.then

if.then:                                          ; preds = %entry
  %SearchWithinAddressRange = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 14
  %3 = load i64* %SearchWithinAddressRange, align 8, !tbaa !247
  %inc4 = add i64 %3, 1
  store i64 %inc4, i64* %SearchWithinAddressRange, align 8, !tbaa !247
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
  %4 = load %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !184
  %ptr8 = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 0
  %5 = load i8** %ptr8, align 8, !tbaa !163
  store i8* %5, i8** @cache_addr, align 8, !tbaa !157
  %6 = load %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !184
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %6, i64 0, i32 1
  %7 = load i8** %upperbound, align 8, !tbaa !230
  store i8* %7, i8** @cache_upperbound, align 8, !tbaa !157
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
  %8 = load %struct.HeapAllocationMeta** %ptr.lcssa, align 8, !tbaa !184
  %heapindex = getelementptr inbounds %struct.HeapAllocationMeta* %8, i64 0, i32 3
  %9 = load i32* %heapindex, align 4, !tbaa !232
  %idxprom15 = zext i32 %9 to i64
  %r = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom15, i32 1
  %10 = load i64* %r, align 8, !tbaa !251
  %inc17 = add i64 %10, 1
  store i64 %inc17, i64* %r, align 8, !tbaa !251
  br label %sw.epilog

sw.bb18:                                          ; preds = %if.then13
  %11 = load %struct.HeapAllocationMeta** %ptr.lcssa, align 8, !tbaa !184
  %heapindex20 = getelementptr inbounds %struct.HeapAllocationMeta* %11, i64 0, i32 3
  %12 = load i32* %heapindex20, align 4, !tbaa !232
  %idxprom21 = zext i32 %12 to i64
  %w = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom21, i32 2
  %13 = load i64* %w, align 16, !tbaa !252
  %inc23 = add i64 %13, 1
  store i64 %inc23, i64* %w, align 16, !tbaa !252
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb18, %sw.bb, %if.then13
  %Cache_Hits = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 16
  %14 = load i64* %Cache_Hits, align 8, !tbaa !248
  %inc26 = add i64 %14, 1
  store i64 %inc26, i64* %Cache_Hits, align 8, !tbaa !248
  %cmp30 = icmp eq %struct.Cache2_Item* %I.0182.lcssa, %I.0179
  br i1 %cmp30, label %return, label %if.else

if.else:                                          ; preds = %sw.epilog
  %next = getelementptr inbounds %struct.Cache2_Item* %I.0182.lcssa, i64 0, i32 1
  %15 = load %struct.Cache2_Item** %next, align 8, !tbaa !186
  %next32 = getelementptr inbounds %struct.Cache2_Item* %previous.0181.lcssa, i64 0, i32 1
  store %struct.Cache2_Item* %15, %struct.Cache2_Item** %next32, align 8, !tbaa !186
  store %struct.Cache2_Item* %I.0182.lcssa, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !183
  store %struct.Cache2_Item* %I.0179, %struct.Cache2_Item** %next, align 8, !tbaa !186
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
  %16 = load %struct.HeapAllocationMeta** %call50, align 8, !tbaa !157
  %ptr51 = getelementptr inbounds %struct.HeapAllocationMeta* %16, i64 0, i32 0
  %17 = load i8** %ptr51, align 8, !tbaa !163
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
  %18 = load i32* %heapindex56, align 4, !tbaa !232
  %idxprom57 = zext i32 %18 to i64
  %r59 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom57, i32 1
  %19 = load i64* %r59, align 8, !tbaa !251
  %inc60 = add i64 %19, 1
  store i64 %inc60, i64* %r59, align 8, !tbaa !251
  br label %return_2

sw.bb61:                                          ; preds = %if.then53
  %heapindex62 = getelementptr inbounds %struct.HeapAllocationMeta* %.lcssa, i64 0, i32 3
  %20 = load i32* %heapindex62, align 4, !tbaa !232
  %idxprom63 = zext i32 %20 to i64
  %w65 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom63, i32 2
  %21 = load i64* %w65, align 16, !tbaa !252
  %inc66 = add i64 %21, 1
  store i64 %inc66, i64* %w65, align 16, !tbaa !252
  br label %return_2

if.else69:                                        ; preds = %for.body
  %cmp71 = icmp ugt i8* %17, %AtAddress
  br i1 %cmp71, label %for.inc, label %if.else73

if.else73:                                        ; preds = %if.else69
  %upperbound74 = getelementptr inbounds %struct.HeapAllocationMeta* %16, i64 0, i32 1
  %22 = load i8** %upperbound74, align 8, !tbaa !230
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
  %23 = load i32* %heapindex79, align 4, !tbaa !232
  %idxprom80 = zext i32 %23 to i64
  %r82 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom80, i32 1
  %24 = load i64* %r82, align 8, !tbaa !251
  %inc83 = add i64 %24, 1
  store i64 %inc83, i64* %r82, align 8, !tbaa !251
  br label %return_2

sw.bb84:                                          ; preds = %if.then76
  %heapindex85 = getelementptr inbounds %struct.HeapAllocationMeta* %.lcssa202, i64 0, i32 3
  %25 = load i32* %heapindex85, align 4, !tbaa !232
  %idxprom86 = zext i32 %25 to i64
  %w88 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom86, i32 2
  %26 = load i64* %w88, align 16, !tbaa !252
  %inc89 = add i64 %26, 1
  store i64 %inc89, i64* %w88, align 16, !tbaa !252
  br label %return_2

for.inc:                                          ; preds = %if.else73, %if.else69
  %call95 = call dereferenceable(8) %"struct.std::_List_iterator"* @_ZNSt14_List_iteratorIP18HeapAllocationMetaEppEv(%"struct.std::_List_iterator"* %__begin)
  %call48 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__begin, %"struct.std::_List_iterator"* dereferenceable(8) %__end)
  br i1 %call48, label %for.body, label %if.end96.loopexit

if.end96.loopexit:                                ; preds = %for.inc
  br label %if.end96

if.end96:                                         ; preds = %if.end96.loopexit, %while.end, %entry
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %27 = load i64* %SearchMiss, align 8, !tbaa !250
  %inc99 = add i64 %27, 1
  store i64 %inc99, i64* %SearchMiss, align 8, !tbaa !250
  br label %return

return_2:                                         ; preds = %sw.bb84, %sw.bb78, %if.then76, %sw.bb61, %sw.bb55, %if.then53
  %call50201 = phi %struct.HeapAllocationMeta** [ %call50.lcssa199, %sw.bb78 ], [ %call50.lcssa199, %sw.bb84 ], [ %call50.lcssa199, %if.then76 ], [ %call50.lcssa, %sw.bb55 ], [ %call50.lcssa, %sw.bb61 ], [ %call50.lcssa, %if.then53 ]
  %loopptr.0 = load %struct.HeapAllocationMeta** %call50201, align 8
  %Cache_Miss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 15
  %28 = load i64* %Cache_Miss, align 8, !tbaa !249
  %inc102 = add i64 %28, 1
  store i64 %inc102, i64* %Cache_Miss, align 8, !tbaa !249
  %29 = load %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !183
  br label %while.cond109

while.cond109:                                    ; preds = %while.cond109, %return_2
  %previous104.0 = phi %struct.Cache2_Item* [ undef, %return_2 ], [ %I105.0, %while.cond109 ]
  %I105.0 = phi %struct.Cache2_Item* [ %29, %return_2 ], [ %30, %while.cond109 ]
  %next110 = getelementptr inbounds %struct.Cache2_Item* %I105.0, i64 0, i32 1
  %30 = load %struct.Cache2_Item** %next110, align 8, !tbaa !186
  %cmp111 = icmp eq %struct.Cache2_Item* %30, null
  br i1 %cmp111, label %while.end114, label %while.cond109

while.end114:                                     ; preds = %while.cond109
  %next110.lcssa = phi %struct.Cache2_Item** [ %next110, %while.cond109 ]
  %I105.0.lcssa = phi %struct.Cache2_Item* [ %I105.0, %while.cond109 ]
  %previous104.0.lcssa = phi %struct.Cache2_Item* [ %previous104.0, %while.cond109 ]
  %next115 = getelementptr inbounds %struct.Cache2_Item* %previous104.0.lcssa, i64 0, i32 1
  store %struct.Cache2_Item* null, %struct.Cache2_Item** %next115, align 8, !tbaa !186
  store %struct.Cache2_Item* %I105.0.lcssa, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !183
  store %struct.Cache2_Item* %29, %struct.Cache2_Item** %next110.lcssa, align 8, !tbaa !186
  %ptr129 = getelementptr inbounds %struct.Cache2_Item* %I105.0.lcssa, i64 0, i32 0
  store %struct.HeapAllocationMeta* %loopptr.0, %struct.HeapAllocationMeta** %ptr129, align 8, !tbaa !184
  br label %return

return:                                           ; preds = %while.end114, %if.end96, %if.else, %sw.epilog
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_STonly(i8* readnone %AtAddress, i8 zeroext %AccessType, i32 %thdnumber, %struct.sdmprofile__Allocated_Stack_item* %ptr) #3 {
entry:
  %idxprom = zext i32 %thdnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !246
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !246
  %Stack_allocations_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 4
  %1 = load %struct.sdmprofile__Allocated_Stack_item** %Stack_allocations_head, align 8, !tbaa !191
  %loopptr.065 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %ptr, i64 -1
  %cmp66 = icmp ult %struct.sdmprofile__Allocated_Stack_item* %loopptr.065, %1
  br i1 %cmp66, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.cond.backedge, %while.body.preheader
  %2 = phi %struct.sdmprofile__Allocated_Stack_item* [ %loopptr.068, %while.cond.backedge ], [ %ptr, %while.body.preheader ]
  %loopptr.068 = phi %struct.sdmprofile__Allocated_Stack_item* [ %loopptr.0, %while.cond.backedge ], [ %loopptr.065, %while.body.preheader ]
  %ptr3 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %2, i64 -1, i32 0
  %3 = load i8** %ptr3, align 8, !tbaa !170
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
  %4 = load i64* %stackindex, align 8, !tbaa !253
  %r = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %4, i32 1
  %5 = load i64* %r, align 8, !tbaa !220
  %inc6 = add i64 %5, 1
  store i64 %inc6, i64* %r, align 8, !tbaa !220
  br label %return_

sw.bb7:                                           ; preds = %if.then
  %stackindex8 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %.lcssa, i64 -1, i32 1
  %6 = load i64* %stackindex8, align 8, !tbaa !253
  %w = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %6, i32 2
  %7 = load i64* %w, align 8, !tbaa !221
  %inc10 = add i64 %7, 1
  store i64 %inc10, i64* %w, align 8, !tbaa !221
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
  %8 = load i8** %upperbound, align 8, !tbaa !172
  %9 = load i8** @sdmprofile__zeropointer, align 8, !tbaa !157
  %cmp15 = icmp eq i8* %8, %9
  br i1 %cmp15, label %if.then16, label %if.end

if.then16:                                        ; preds = %if.else14
  %10 = ptrtoint i8* %3 to i64
  %stackindex18 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %2, i64 -1, i32 1
  %11 = load i64* %stackindex18, align 8, !tbaa !253
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %11, i32 3
  %12 = load i32* %size, align 8, !tbaa !200
  %conv20 = zext i32 %12 to i64
  %add = add i64 %conv20, %10
  %13 = inttoptr i64 %add to i8*
  store i8* %13, i8** %upperbound, align 8, !tbaa !172
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
  %15 = load i64* %stackindex27, align 8, !tbaa !253
  %r29 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %15, i32 1
  %16 = load i64* %r29, align 8, !tbaa !220
  %inc30 = add i64 %16, 1
  store i64 %inc30, i64* %r29, align 8, !tbaa !220
  br label %return_

sw.bb31:                                          ; preds = %if.then24
  %stackindex32 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %.lcssa73, i64 -1, i32 1
  %17 = load i64* %stackindex32, align 8, !tbaa !253
  %w34 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %17, i32 2
  %18 = load i64* %w34, align 8, !tbaa !221
  %inc35 = add i64 %18, 1
  store i64 %inc35, i64* %w34, align 8, !tbaa !221
  br label %return_

while.end.loopexit:                               ; preds = %while.cond.backedge
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %19 = load i64* %SearchMiss, align 8, !tbaa !250
  %inc44 = add i64 %19, 1
  store i64 %inc44, i64* %SearchMiss, align 8, !tbaa !250
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
  %0 = load i32* @sdmprofile__profileAction, align 4, !tbaa !161
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
  %3 = load %struct.GVMeta** %call7, align 8, !tbaa !157
  %index = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 0
  %4 = load i64* %index, align 8, !tbaa !166
  %r = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 1
  %5 = load i64* %r, align 8, !tbaa !211
  %w = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 2
  %6 = load i64* %w, align 8, !tbaa !212
  %size = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 4
  %7 = load i32* %size, align 4, !tbaa !169
  %VarName = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 5
  %8 = load i8** %VarName, align 8, !tbaa !192
  %DataTypeString = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 6
  %9 = load i8** %DataTypeString, align 8, !tbaa !193
  %call8 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call, i8* getelementptr inbounds ([23 x i8]* @.str5, i64 0, i64 0), i64 %4, i64 %5, i64 %6, i32 %7, i8* %8, i8* %9) #2
  %call9 = call dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %call6 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call6, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %if.then
  %10 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE.1* %call)
  %.pr = load i32* @sdmprofile__profileAction, align 4, !tbaa !161
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  %11 = phi i32 [ %0, %entry ], [ %.pr, %for.end ]
  switch i32 %11, label %if.end34 [
    i32 4, label %if.then14
    i32 2, label %if.then14
  ]

if.then14:                                        ; preds = %if.end, %if.end
  %12 = call i64 @fwrite(i8* getelementptr inbounds ([124 x i8]* @.str7, i64 0, i64 0), i64 123, i64 1, %struct._IO_FILE.1* %call)
  %13 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !222
  %cmp1784 = icmp eq i64 %13, 0
  br i1 %cmp1784, label %for.end32, label %for.body18.preheader

for.body18.preheader:                             ; preds = %if.then14
  br label %for.body18

for.body18:                                       ; preds = %for.body18, %for.body18.preheader
  %ix.085 = phi i64 [ %inc, %for.body18 ], [ 0, %for.body18.preheader ]
  %index19 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 0
  %14 = load i64* %index19, align 8, !tbaa !198
  %r21 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 1
  %15 = load i64* %r21, align 8, !tbaa !220
  %w23 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 2
  %16 = load i64* %w23, align 8, !tbaa !221
  %size25 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 3
  %17 = load i32* %size25, align 8, !tbaa !200
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 4
  %18 = load i8** %EstimatedName, align 8, !tbaa !201
  %DataTypeString28 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 5
  %19 = load i8** %DataTypeString28, align 8, !tbaa !202
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 6
  %20 = load i8** %FunctionName, align 8, !tbaa !203
  %call30 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call, i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i64 %14, i64 %15, i64 %16, i32 %17, i8* %18, i8* %19, i8* %20) #2
  %inc = add i64 %ix.085, 1
  %21 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !222
  %cmp17 = icmp ult i64 %inc, %21
  br i1 %cmp17, label %for.body18, label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.body18
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %if.then14
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE.1* %call)
  %.pre = load i32* @sdmprofile__profileAction, align 4, !tbaa !161
  br label %if.end34

if.end34:                                         ; preds = %for.end32, %if.end
  %23 = phi i32 [ %11, %if.end ], [ %.pre, %for.end32 ]
  switch i32 %23, label %if.end55 [
    i32 4, label %if.then38
    i32 1, label %if.then38
  ]

if.then38:                                        ; preds = %if.end34, %if.end34
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([171 x i8]* @.str9, i64 0, i64 0), i64 170, i64 1, %struct._IO_FILE.1* %call)
  %25 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !222
  %cmp4282 = icmp eq i64 %25, 0
  br i1 %cmp4282, label %for.end53, label %for.body43.preheader

for.body43.preheader:                             ; preds = %if.then38
  br label %for.body43

for.body43:                                       ; preds = %for.body43, %for.body43.preheader
  %ix40.083 = phi i64 [ %inc52, %for.body43 ], [ 0, %for.body43.preheader ]
  %arrayidx44 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083
  store %struct.HPMeta* %arrayidx44, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !157
  %index45 = getelementptr inbounds %struct.HPMeta* %arrayidx44, i64 0, i32 0
  %26 = load i32* %index45, align 16, !tbaa !204
  %r46 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 1
  %27 = load i64* %r46, align 8, !tbaa !251
  %w47 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 2
  %28 = load i64* %w47, align 16, !tbaa !252
  %EstimatedName48 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 3
  %29 = load i8** %EstimatedName48, align 8, !tbaa !206
  %EstimatedDataTypeString = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 4
  %30 = load i8** %EstimatedDataTypeString, align 16, !tbaa !207
  %FunctionName49 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 5
  %31 = load i8** %FunctionName49, align 8, !tbaa !208
  %linenumber = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 6
  %32 = load i64* %linenumber, align 16, !tbaa !209
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 7
  %33 = load i8** %SourceFile, align 8, !tbaa !210
  %hitcount = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 8
  %34 = load i64* %hitcount, align 16, !tbaa !235
  %MinSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 10
  %35 = load i64* %MinSize, align 16, !tbaa !237
  %MaxSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 9
  %36 = load i64* %MaxSize, align 8, !tbaa !236
  %call50 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call, i8* getelementptr inbounds ([43 x i8]* @.str10, i64 0, i64 0), i32 %26, i64 %27, i64 %28, i32 0, i8* %29, i8* %30, i8* %31, i64 %32, i8* %33, i64 %34, i64 %35, i64 %36) #2
  %inc52 = add i64 %ix40.083, 1
  %37 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !222
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
  store double %call, double* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 3), align 8, !tbaa !182
  %call1 = tail call %struct._IO_FILE.1* @fopen(i8* getelementptr inbounds ([18 x i8]* @.str11, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0)) #2
  %0 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str12, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE.1* %call1)
  %1 = load i64* @sdmprofile__BBcount, align 8, !tbaa !222
  %cmp167 = icmp eq i64 %1, 0
  br i1 %cmp167, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %ix.0168 = phi i64 [ %inc, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds [5000 x i64]* @BBhits, i64 0, i64 %ix.0168
  %2 = load i64* %arrayidx, align 8, !tbaa !222
  %call3 = tail call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call1, i8* getelementptr inbounds ([9 x i8]* @.str13, i64 0, i64 0), i64 %ix.0168, i64 %2) #2
  %inc = add i64 %ix.0168, 1
  %3 = load i64* @sdmprofile__BBcount, align 8, !tbaa !222
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
  %5 = load %struct._IO_FILE.1** @stderr, align 8, !tbaa !157
  %fputs = call i32 @fputs(i8* %4, %struct._IO_FILE.1* %5) #17
  br label %cleanup

if.end:                                           ; preds = %for.end
  %6 = load i32* @sdmprofile__profileAction, align 4, !tbaa !161
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
  %8 = load %struct.GVMeta** %call16, align 8, !tbaa !157
  %DataTypeString = getelementptr inbounds %struct.GVMeta* %8, i64 0, i32 6
  %9 = load i8** %DataTypeString, align 8, !tbaa !193
  call void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* %typestring, i8* %9, %"class.std::allocator.6"* dereferenceable(1) %ref.tmp) #2
  %call17 = call i8* @_ZNSs5beginEv(%"class.std::basic_string"* %typestring) #2
  %call20 = call i8* @_ZNSs3endEv(%"class.std::basic_string"* %typestring) #2
  store i8 44, i8* %ref.tmp22, align 1, !tbaa !254
  store i8 59, i8* %ref.tmp23, align 1, !tbaa !254
  call void @_ZSt7replaceIN9__gnu_cxx17__normal_iteratorIPcSsEEcEvT_S4_RKT0_S7_(i8* %call17, i8* %call20, i8* dereferenceable(1) %ref.tmp22, i8* dereferenceable(1) %ref.tmp23)
  %inc26 = add nsw i32 %variable_count.0164, 1
  %10 = load %struct.GVMeta** %call16, align 8, !tbaa !157
  %r = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 1
  %11 = load i64* %r, align 8, !tbaa !211
  %w = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 2
  %12 = load i64* %w, align 8, !tbaa !212
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
  %13 = load i64* %linenumber, align 8, !tbaa !197
  %tobool = icmp eq i64 %13, 0
  br i1 %tobool, label %if.end44, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.then35
  %FileName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 8
  %14 = load i8** %FileName, align 8, !tbaa !195
  %call36 = call i32 @strcmp(i8* %14, i8* getelementptr inbounds ([2 x i8]* @.str17, i64 0, i64 0)) #18
  %tobool37 = icmp eq i32 %call36, 0
  br i1 %tobool37, label %if.end44, label %if.then38

if.then38:                                        ; preds = %land.lhs.true
  %VarName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 5
  %15 = load i8** %VarName, align 8, !tbaa !192
  %DirName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 9
  %16 = load i8** %DirName, align 8, !tbaa !196
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
  %.pr = load i32* @sdmprofile__profileAction, align 4, !tbaa !161
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
  %19 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !222
  %cmp58160 = icmp eq i64 %19, 0
  br i1 %cmp58160, label %for.end73, label %for.body59.preheader

for.body59.preheader:                             ; preds = %if.then54
  br label %for.body59

for.body59:                                       ; preds = %for.body59, %for.body59.preheader
  %ix56.0161 = phi i64 [ %inc72, %for.body59 ], [ 0, %for.body59.preheader ]
  %index = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 0
  %20 = load i64* %index, align 8, !tbaa !198
  %r62 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 1
  %21 = load i64* %r62, align 8, !tbaa !220
  %w64 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 2
  %22 = load i64* %w64, align 8, !tbaa !221
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 3
  %23 = load i32* %size, align 8, !tbaa !200
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 4
  %24 = load i8** %EstimatedName, align 8, !tbaa !201
  %DataTypeString68 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 5
  %25 = load i8** %DataTypeString68, align 8, !tbaa !202
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 6
  %26 = load i8** %FunctionName, align 8, !tbaa !203
  %call70 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call4, i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i64 %20, i64 %21, i64 %22, i32 %23, i8* %24, i8* %25, i8* %26) #2
  %inc72 = add i64 %ix56.0161, 1
  %27 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !222
  %cmp58 = icmp ult i64 %inc72, %27
  br i1 %cmp58, label %for.body59, label %for.end73.loopexit

for.end73.loopexit:                               ; preds = %for.body59
  br label %for.end73

for.end73:                                        ; preds = %for.end73.loopexit, %if.then54
  %28 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE.1* %call4)
  %.pre = load i32* @sdmprofile__profileAction, align 4, !tbaa !161
  br label %if.end75

if.end75:                                         ; preds = %for.end73, %if.end50
  %29 = phi i32 [ %17, %if.end50 ], [ %.pre, %for.end73 ]
  switch i32 %29, label %if.end112 [
    i32 4, label %for.cond81.preheader
    i32 1, label %for.cond81.preheader
  ]

for.cond81.preheader:                             ; preds = %if.end75, %if.end75
  %30 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !222
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
  store %struct.HPMeta* %arrayidx85, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !157
  %r86 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 1
  %32 = load i64* %r86, align 8, !tbaa !251
  %cmp99 = icmp eq i64 %32, 0
  br i1 %cmp99, label %if.end106, label %if.then100

if.then100:                                       ; preds = %for.body84
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 7
  %33 = load i8** %SourceFile, align 8, !tbaa !210
  %linenumber101 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 6
  %34 = load i64* %linenumber101, align 16, !tbaa !209
  %FunctionName102 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 5
  %35 = load i8** %FunctionName102, align 8, !tbaa !208
  %EstimatedName103 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 3
  %36 = load i8** %EstimatedName103, align 8, !tbaa !206
  %call104 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call4, i8* getelementptr inbounds ([14 x i8]* @.str22, i64 0, i64 0), i8* %33, i64 %34, i8* %35, i8* %36) #2
  %inc105 = add nsw i32 %nv_variable_count.3156, 1
  %.pre169 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !222
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
  %0 = load i8* %call2, align 1, !tbaa !254
  %1 = load i8* %__old_value, align 1, !tbaa !254
  %cmp = icmp eq i8 %0, %1
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %2 = load i8* %__new_value, align 1, !tbaa !254
  store i8 %2, i8* %call2, align 1, !tbaa !254
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
  store i8* %call, i8** %ref.tmp, align 8, !tbaa !157
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
  store i8* %add.ptr, i8** %ref.tmp, align 8, !tbaa !157
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
  %0 = load i32* @thdsCount, align 4, !tbaa !161
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
  %2 = load i64* %threadID, align 8, !tbaa !180
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
  %0 = load i8** %call, align 8, !tbaa !157
  %call1 = tail call dereferenceable(8) i8** @_ZNK9__gnu_cxx17__normal_iteratorIPcSsE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %__rhs)
  %1 = load i8** %call1, align 8, !tbaa !157
  %cmp = icmp ne i8* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(1) i8* @_ZNK9__gnu_cxx17__normal_iteratorIPcSsEdeEv(%"class.__gnu_cxx::__normal_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %_M_current, align 8, !tbaa !255
  ret i8* %0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden dereferenceable(8) %"class.__gnu_cxx::__normal_iterator"* @_ZN9__gnu_cxx17__normal_iteratorIPcSsEppEv(%"class.__gnu_cxx::__normal_iterator"* %this) #3 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %_M_current, align 8, !tbaa !255
  %incdec.ptr = getelementptr inbounds i8* %0, i64 1
  store i8* %incdec.ptr, i8** %_M_current, align 8, !tbaa !255
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
  %0 = load i8** %_M_p, align 8, !tbaa !257
  ret i8* %0
}

; Function Attrs: noinline nounwind readonly uwtable
define available_externally i64 @_ZNKSs4sizeEv(%"class.std::basic_string"* nocapture readonly %this) #4 align 2 {
entry:
  %call = tail call %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* @_ZNKSs6_M_repEv(%"class.std::basic_string"* %this)
  %_M_length = getelementptr inbounds %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* %call, i64 0, i32 0, i32 0
  %0 = load i64* %_M_length, align 8, !tbaa !260
  ret i64 %0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZN9__gnu_cxx17__normal_iteratorIPcSsEC2ERKS1_(%"class.__gnu_cxx::__normal_iterator"* nocapture %this, i8** nocapture readonly dereferenceable(8) %__i) unnamed_addr #3 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %__i, align 8, !tbaa !157
  store i8* %0, i8** %_M_current, align 8, !tbaa !255
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
  %0 = load i32* %_M_refcount, align 4, !tbaa !262
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
  store %"struct.std::__detail::_List_node_base"* %__x, %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !243
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
  %1 = load %struct.HeapAllocationMeta** %call, align 8, !tbaa !157
  store %struct.HeapAllocationMeta* %1, %struct.HeapAllocationMeta** %_M_data, align 8, !tbaa !263
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
  store %"struct.std::_Fwd_list_node_base"* %__n, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !217
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr %"struct.std::_Fwd_list_node_base"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE15_M_insert_afterIJRKS1_EEEPSt19_Fwd_list_node_baseSt24_Fwd_list_const_iteratorIS1_EDpOT_(%"struct.std::_Fwd_list_base"* %this, %"struct.std::_Fwd_list_node_base"* nocapture %__pos.coerce, %struct.GVMeta** dereferenceable(8) %__args) #3 align 2 {
entry:
  %call = tail call dereferenceable(8) %struct.GVMeta** @_ZSt7forwardIRKP6GVMetaEOT_RNSt16remove_referenceIS4_E4typeE(%struct.GVMeta** dereferenceable(8) %__args) #2
  %call2 = tail call %"struct.std::_Fwd_list_node"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_M_create_nodeIJRKS1_EEEPSt14_Fwd_list_nodeIS1_EDpOT_(%"struct.std::_Fwd_list_base"* %this, %struct.GVMeta** dereferenceable(8) %call)
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__pos.coerce, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !219
  %1 = getelementptr inbounds %"struct.std::_Fwd_list_node"* %call2, i64 0, i32 0
  %_M_next3 = getelementptr inbounds %"struct.std::_Fwd_list_node"* %call2, i64 0, i32 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* %0, %"struct.std::_Fwd_list_node_base"** %_M_next3, align 8, !tbaa !219
  store %"struct.std::_Fwd_list_node_base"* %1, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !219
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
  store %"struct.std::_Fwd_list_node_base"* %__n, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !265
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
  %0 = load %struct.GVMeta** %call, align 8, !tbaa !157
  store %struct.GVMeta* %0, %struct.GVMeta** %__p, align 8, !tbaa !157
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
  store %"struct.std::__detail::_List_node_base"* %_M_node, %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !239
  %_M_prev = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0, i32 1
  store %"struct.std::__detail::_List_node_base"* %_M_node, %"struct.std::__detail::_List_node_base"** %_M_prev, align 8, !tbaa !267
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr %"struct.std::_Fwd_list_node_base"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_M_erase_afterEPSt19_Fwd_list_node_baseS5_(%"struct.std::_Fwd_list_base"* readnone %this, %"struct.std::_Fwd_list_node_base"* nocapture %__pos, %"struct.std::_Fwd_list_node_base"* %__last) #3 align 2 {
entry:
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__pos, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !219
  %cmp12 = icmp eq %"struct.std::_Fwd_list_node_base"* %0, %__last
  br i1 %cmp12, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.preheader
  %__curr.0.in13 = phi %"struct.std::_Fwd_list_node_base"* [ %1, %while.body ], [ %0, %while.body.preheader ]
  %__curr.0 = bitcast %"struct.std::_Fwd_list_node_base"* %__curr.0.in13 to %"struct.std::_Fwd_list_node"*
  %_M_next2 = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__curr.0.in13, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_next2, align 8, !tbaa !219
  tail call void @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE11_M_put_nodeEPSt14_Fwd_list_nodeIS1_E(%"struct.std::_Fwd_list_base"* %this, %"struct.std::_Fwd_list_node"* %__curr.0)
  %cmp = icmp eq %"struct.std::_Fwd_list_node_base"* %1, %__last
  br i1 %cmp, label %while.end.loopexit, label %while.body

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  store %"struct.std::_Fwd_list_node_base"* %__last, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !219
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
  store %"struct.std::_Fwd_list_node_base"* null, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !219
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
  br i1 %cmp, label %if.end5, label %if.then, !prof !268

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
  %0 = load i32* %__mem, align 4, !tbaa !161
  %add = add nsw i32 %0, -1
  store i32 %add, i32* %__mem, align 4, !tbaa !161
  ret i32 %0
}

; Function Attrs: nounwind
declare extern_weak i32 @__pthread_key_create(i32*, void (i8*)*) #1

; Function Attrs: noinline nounwind uwtable
define linkonce_odr void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE8_M_clearEv(%"class.std::_List_base"* readonly %this) #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0
  %_M_next = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !239
  %cmp8 = icmp eq %"struct.std::__detail::_List_node_base"* %0, %_M_node
  br i1 %cmp8, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.preheader
  %__cur.0.in9 = phi %"struct.std::__detail::_List_node_base"* [ %1, %while.body ], [ %0, %while.body.preheader ]
  %__cur.0 = bitcast %"struct.std::__detail::_List_node_base"* %__cur.0.in9 to %"struct.std::_List_node"*
  %_M_next4 = getelementptr inbounds %"struct.std::__detail::_List_node_base"* %__cur.0.in9, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_next4, align 8, !tbaa !245
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
define i32 @bit_count_original(i64 %x) #11 {
  %x_st = alloca i64
  %thdnumber_st = alloca i32
  store i64 %x, i64* %x_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i64* %x_st
  %3 = call i32 @bit_count(i64 %2, i32 %1)
  ret i32 %3
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #12

; Function Attrs: nounwind uwtable
define i32 @bitcount_original(i64 %i) #11 {
  %i_st = alloca i64
  %thdnumber_st = alloca i32
  store i64 %i, i64* %i_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i64* %i_st
  %3 = call i32 @bitcount(i64 %2, i32 %1)
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ntbl_bitcount_original(i64 %x) #11 {
  %x_st = alloca i64
  %thdnumber_st = alloca i32
  store i64 %x, i64* %x_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i64* %x_st
  %3 = call i32 @ntbl_bitcount(i64 %2, i32 %1)
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @BW_btbl_bitcount_original(i64 %x) #11 {
  %x_st = alloca i64
  %thdnumber_st = alloca i32
  store i64 %x, i64* %x_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i64* %x_st
  %3 = call i32 @BW_btbl_bitcount(i64 %2, i32 %1)
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @AR_btbl_bitcount_original(i64 %x) #11 {
  %x_st = alloca i64
  %thdnumber_st = alloca i32
  store i64 %x, i64* %x_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i64* %x_st
  %3 = call i32 @AR_btbl_bitcount(i64 %2, i32 %1)
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ntbl_bitcnt_original(i64 %x) #11 {
  %x_st = alloca i64
  %thdnumber_st = alloca i32
  store i64 %x, i64* %x_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i64* %x_st
  %3 = call i32 @ntbl_bitcnt(i64 %2, i32 %1)
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @btbl_bitcnt_original(i64 %x) #11 {
  %x_st = alloca i64
  %thdnumber_st = alloca i32
  store i64 %x, i64* %x_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i64* %x_st
  %3 = call i32 @btbl_bitcnt(i64 %2, i32 %1)
  ret i32 %3
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

; Function Attrs: noreturn nounwind
declare void @exit(i32) #13

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #14

declare i32 @puts(i8*) #15

; Function Attrs: nounwind
declare i64 @clock() #16

; Function Attrs: nounwind
declare i32 @rand() #16

declare i32 @printf(i8*, ...) #15

; Function Attrs: nounwind uwtable
define %struct.bfile.2* @bfopen_original(i8* %name, i8* %mode) #11 {
  %name_st = alloca i8*
  %mode_st = alloca i8*
  %thdnumber_st = alloca i32
  store i8* %name, i8** %name_st, align 8
  store i8* %mode, i8** %mode_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i8** %name_st
  %3 = load i8** %mode_st
  %4 = call %struct.bfile.2* @bfopen(i8* %2, i8* %3, i32 %1)
  ret %struct.bfile.2* %4
}

; Function Attrs: nounwind uwtable
define i32 @bfread_original(%struct.bfile.2* %bf) #11 {
  %bf_st = alloca %struct.bfile.2*
  %thdnumber_st = alloca i32
  store %struct.bfile.2* %bf, %struct.bfile.2** %bf_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load %struct.bfile.2** %bf_st
  %3 = call i32 @bfread(%struct.bfile.2* %2, i32 %1)
  ret i32 %3
}

declare i32 @fgetc(%struct._IO_FILE.1*) #15

; Function Attrs: nounwind uwtable
define void @bfwrite_original(i32 %bit, %struct.bfile.2* %bf) #11 {
  %bit_st = alloca i32
  %bf_st = alloca %struct.bfile.2*
  %thdnumber_st = alloca i32
  store i32 %bit, i32* %bit_st, align 4
  store %struct.bfile.2* %bf, %struct.bfile.2** %bf_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i32* %bit_st
  %3 = load %struct.bfile.2** %bf_st
  call void @bfwrite(i32 %2, %struct.bfile.2* %3, i32 %1)
  ret void
}

; Function Attrs: nounwind uwtable
define void @bfclose_original(%struct.bfile.2* %bf) #11 {
  %bf_st = alloca %struct.bfile.2*
  %thdnumber_st = alloca i32
  store %struct.bfile.2* %bf, %struct.bfile.2** %bf_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load %struct.bfile.2** %bf_st
  call void @bfclose(%struct.bfile.2* %2, i32 %1)
  ret void
}

; Function Attrs: nounwind uwtable
define void @bitstring_original(i8* %str, i64 %byze, i32 %biz, i32 %strwid) #11 {
  %str_st = alloca i8*
  %byze_st = alloca i64
  %biz_st = alloca i32
  %strwid_st = alloca i32
  %thdnumber_st = alloca i32
  store i8* %str, i8** %str_st, align 8
  store i64 %byze, i64* %byze_st, align 8
  store i32 %biz, i32* %biz_st, align 4
  store i32 %strwid, i32* %strwid_st, align 4
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i8** %str_st
  %3 = load i64* %byze_st
  %4 = load i32* %biz_st
  %5 = load i32* %strwid_st
  call void @bitstring(i8* %2, i64 %3, i32 %4, i32 %5, i32 %1)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @bstr_i_original(i8* %cptr) #11 {
  %cptr_st = alloca i8*
  %thdnumber_st = alloca i32
  store i8* %cptr, i8** %cptr_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i8** %cptr_st
  %3 = call i32 @bstr_i(i8* %2, i32 %1)
  ret i32 %3
}

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #14

; Function Attrs: nounwind uwtable
define internal i32 @bit_shifter_original(i64 %x) #11 {
  %x_st = alloca i64
  %thdnumber_st = alloca i32
  store i64 %x, i64* %x_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i64* %x_st
  %3 = call i32 @bit_shifter(i64 %2, i32 %1)
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @AR_btbl_bitcount(i64 %x, i32 %sdmprofile__threadnumber) #11 {
entry:
  %x.addr = alloca i64, align 8
  %Ptr = alloca i8*, align 8
  %Accu = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i64 %x, i64* %x.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_1, i64 1 seq_cst, !dbg !269
  call void @llvm.dbg.declare(metadata !{i64* %x.addr}, metadata !270), !dbg !269
  call void @llvm.dbg.declare(metadata !{i8** %Ptr}, metadata !271), !dbg !274
  %1 = bitcast i64* %x.addr to i8*, !dbg !275
  store i8* %1, i8** %Ptr, align 8, !dbg !275
  call void @llvm.dbg.declare(metadata !{i32* %Accu}, metadata !276), !dbg !277
  %2 = load i8** %Ptr, align 8, !dbg !278
  %incdec.ptr = getelementptr inbounds i8* %2, i32 1, !dbg !278
  store i8* %incdec.ptr, i8** %Ptr, align 8, !dbg !278
  %3 = load i32* %sdmprofile__threadnumber_st, !dbg !278
  call void @sdmprofile__SearchRoutine_GVonly(i8* %2, i8 2, i32 %3), !dbg !278
  %4 = load i8* %2, align 1, !dbg !278
  %idxprom = zext i8 %4 to i64, !dbg !278
  %arrayidx = getelementptr inbounds [256 x i8]* @bits, i32 0, i64 %idxprom, !dbg !278
  %5 = load i8* %arrayidx, align 1, !dbg !278
  %conv = sext i8 %5 to i32, !dbg !278
  store i32 %conv, i32* %Accu, align 4, !dbg !278
  %6 = load i8** %Ptr, align 8, !dbg !279
  %incdec.ptr1 = getelementptr inbounds i8* %6, i32 1, !dbg !279
  store i8* %incdec.ptr1, i8** %Ptr, align 8, !dbg !279
  %7 = load i32* %sdmprofile__threadnumber_st, !dbg !279
  call void @sdmprofile__SearchRoutine_GVonly(i8* %6, i8 2, i32 %7), !dbg !279
  %8 = load i8* %6, align 1, !dbg !279
  %idxprom2 = zext i8 %8 to i64, !dbg !279
  %arrayidx3 = getelementptr inbounds [256 x i8]* @bits, i32 0, i64 %idxprom2, !dbg !279
  %9 = load i8* %arrayidx3, align 1, !dbg !279
  %conv4 = sext i8 %9 to i32, !dbg !279
  %10 = load i32* %Accu, align 4, !dbg !279
  %add = add nsw i32 %10, %conv4, !dbg !279
  store i32 %add, i32* %Accu, align 4, !dbg !279
  %11 = load i8** %Ptr, align 8, !dbg !280
  %incdec.ptr5 = getelementptr inbounds i8* %11, i32 1, !dbg !280
  store i8* %incdec.ptr5, i8** %Ptr, align 8, !dbg !280
  %12 = load i32* %sdmprofile__threadnumber_st, !dbg !280
  call void @sdmprofile__SearchRoutine_GVonly(i8* %11, i8 2, i32 %12), !dbg !280
  %13 = load i8* %11, align 1, !dbg !280
  %idxprom6 = zext i8 %13 to i64, !dbg !280
  %arrayidx7 = getelementptr inbounds [256 x i8]* @bits, i32 0, i64 %idxprom6, !dbg !280
  %14 = load i8* %arrayidx7, align 1, !dbg !280
  %conv8 = sext i8 %14 to i32, !dbg !280
  %15 = load i32* %Accu, align 4, !dbg !280
  %add9 = add nsw i32 %15, %conv8, !dbg !280
  store i32 %add9, i32* %Accu, align 4, !dbg !280
  %16 = load i8** %Ptr, align 8, !dbg !281
  %17 = load i32* %sdmprofile__threadnumber_st, !dbg !281
  call void @sdmprofile__SearchRoutine_GVonly(i8* %16, i8 2, i32 %17), !dbg !281
  %18 = load i8* %16, align 1, !dbg !281
  %idxprom10 = zext i8 %18 to i64, !dbg !281
  %arrayidx11 = getelementptr inbounds [256 x i8]* @bits, i32 0, i64 %idxprom10, !dbg !281
  %19 = load i8* %arrayidx11, align 1, !dbg !281
  %conv12 = sext i8 %19 to i32, !dbg !281
  %20 = load i32* %Accu, align 4, !dbg !281
  %add13 = add nsw i32 %20, %conv12, !dbg !281
  store i32 %add13, i32* %Accu, align 4, !dbg !281
  %21 = load i32* %Accu, align 4, !dbg !282
  ret i32 %21, !dbg !282
}

; Function Attrs: nounwind uwtable
define i32 @BW_btbl_bitcount(i64 %x, i32 %sdmprofile__threadnumber) #11 {
entry:
  %x.addr = alloca i64, align 8
  %U = alloca %union.anon.3, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i64 %x, i64* %x.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_2, i64 1 seq_cst, !dbg !283
  call void @llvm.dbg.declare(metadata !{i64* %x.addr}, metadata !284), !dbg !283
  call void @llvm.dbg.declare(metadata !{%union.anon.3* %U}, metadata !285), !dbg !293
  %1 = load i64* %x.addr, align 8, !dbg !294
  %y = bitcast %union.anon.3* %U to i64*, !dbg !294
  %2 = bitcast i64* %y to i8*, !dbg !294
  %3 = load i32* %sdmprofile__threadnumber_st, !dbg !294
  call void @sdmprofile__SearchRoutine_GVonly(i8* %2, i8 1, i32 %3), !dbg !294
  store i64 %1, i64* %y, align 8, !dbg !294
  %ch = bitcast %union.anon.3* %U to [4 x i8]*, !dbg !295
  %arrayidx = getelementptr inbounds [4 x i8]* %ch, i32 0, i64 0, !dbg !295
  %4 = load i32* %sdmprofile__threadnumber_st, !dbg !295
  call void @sdmprofile__SearchRoutine_GVonly(i8* %arrayidx, i8 2, i32 %4), !dbg !295
  %5 = load i8* %arrayidx, align 1, !dbg !295
  %idxprom = zext i8 %5 to i64, !dbg !295
  %arrayidx1 = getelementptr inbounds [256 x i8]* @bits, i32 0, i64 %idxprom, !dbg !295
  %6 = load i8* %arrayidx1, align 1, !dbg !295
  %conv = sext i8 %6 to i32, !dbg !295
  %ch2 = bitcast %union.anon.3* %U to [4 x i8]*, !dbg !295
  %arrayidx3 = getelementptr inbounds [4 x i8]* %ch2, i32 0, i64 1, !dbg !295
  %7 = load i32* %sdmprofile__threadnumber_st, !dbg !295
  call void @sdmprofile__SearchRoutine_GVonly(i8* %arrayidx3, i8 2, i32 %7), !dbg !295
  %8 = load i8* %arrayidx3, align 1, !dbg !295
  %idxprom4 = zext i8 %8 to i64, !dbg !295
  %arrayidx5 = getelementptr inbounds [256 x i8]* @bits, i32 0, i64 %idxprom4, !dbg !295
  %9 = load i8* %arrayidx5, align 1, !dbg !295
  %conv6 = sext i8 %9 to i32, !dbg !295
  %add = add nsw i32 %conv, %conv6, !dbg !295
  %ch7 = bitcast %union.anon.3* %U to [4 x i8]*, !dbg !295
  %arrayidx8 = getelementptr inbounds [4 x i8]* %ch7, i32 0, i64 3, !dbg !295
  %10 = load i32* %sdmprofile__threadnumber_st, !dbg !295
  call void @sdmprofile__SearchRoutine_GVonly(i8* %arrayidx8, i8 2, i32 %10), !dbg !295
  %11 = load i8* %arrayidx8, align 1, !dbg !295
  %idxprom9 = zext i8 %11 to i64, !dbg !295
  %arrayidx10 = getelementptr inbounds [256 x i8]* @bits, i32 0, i64 %idxprom9, !dbg !295
  %12 = load i8* %arrayidx10, align 1, !dbg !295
  %conv11 = sext i8 %12 to i32, !dbg !295
  %add12 = add nsw i32 %add, %conv11, !dbg !295
  %ch13 = bitcast %union.anon.3* %U to [4 x i8]*, !dbg !295
  %arrayidx14 = getelementptr inbounds [4 x i8]* %ch13, i32 0, i64 2, !dbg !295
  %13 = load i32* %sdmprofile__threadnumber_st, !dbg !295
  call void @sdmprofile__SearchRoutine_GVonly(i8* %arrayidx14, i8 2, i32 %13), !dbg !295
  %14 = load i8* %arrayidx14, align 1, !dbg !295
  %idxprom15 = zext i8 %14 to i64, !dbg !295
  %arrayidx16 = getelementptr inbounds [256 x i8]* @bits, i32 0, i64 %idxprom15, !dbg !295
  %15 = load i8* %arrayidx16, align 1, !dbg !295
  %conv17 = sext i8 %15 to i32, !dbg !295
  %add18 = add nsw i32 %add12, %conv17, !dbg !295
  ret i32 %add18, !dbg !295
}

; Function Attrs: nounwind uwtable
define void @bfclose(%struct.bfile.2* %bf, i32 %sdmprofile__threadnumber) #11 {
entry:
  %bf.addr = alloca %struct.bfile.2*, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store %struct.bfile.2* %bf, %struct.bfile.2** %bf.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_18, i64 1 seq_cst, !dbg !296
  call void @llvm.dbg.declare(metadata !{%struct.bfile.2** %bf.addr}, metadata !349), !dbg !296
  %1 = load %struct.bfile.2** %bf.addr, align 8, !dbg !350
  %file = getelementptr inbounds %struct.bfile.2* %1, i32 0, i32 0, !dbg !350
  %2 = bitcast %struct._IO_FILE.1** %file to i8*, !dbg !350
  %3 = load i32* %sdmprofile__threadnumber_st, !dbg !350
  call void @sdmprofile__SearchRoutine_GVonly(i8* %2, i8 2, i32 %3), !dbg !350
  %4 = load %struct._IO_FILE.1** %file, align 8, !dbg !350
  %call = call i32 @fclose(%struct._IO_FILE.1* %4), !dbg !350
  %5 = load %struct.bfile.2** %bf.addr, align 8, !dbg !351
  %6 = bitcast %struct.bfile.2* %5 to i8*, !dbg !351
  call void @free(i8* %6) #2, !dbg !351
  ret void, !dbg !352
}

; Function Attrs: nounwind uwtable
define %struct.bfile.2* @bfopen(i8* %name, i8* %mode, i32 %sdmprofile__threadnumber) #11 {
entry:
  %retval = alloca %struct.bfile.2*, align 8
  %name.addr = alloca i8*, align 8
  %mode.addr = alloca i8*, align 8
  %bf = alloca %struct.bfile.2*, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_19, i64 1 seq_cst, !dbg !353
  call void @llvm.dbg.declare(metadata !{i8** %name.addr}, metadata !406), !dbg !353
  store i8* %mode, i8** %mode.addr, align 8
  call void @llvm.dbg.declare(metadata !{i8** %mode.addr}, metadata !407), !dbg !408
  call void @llvm.dbg.declare(metadata !{%struct.bfile.2** %bf}, metadata !409), !dbg !410
  %call = call noalias i8* @malloc(i64 16) #2, !dbg !411
  %1 = bitcast i8* %call to %struct.bfile.2*, !dbg !411
  store %struct.bfile.2* %1, %struct.bfile.2** %bf, align 8, !dbg !411
  %2 = load %struct.bfile.2** %bf, align 8, !dbg !412
  %cmp = icmp eq %struct.bfile.2* null, %2, !dbg !412
  br i1 %cmp, label %if.then, label %if.end, !dbg !412

if.then:                                          ; preds = %entry
  %3 = atomicrmw add i64* @sdmprofile__BBcounter_20, i64 1 seq_cst, !dbg !414
  store %struct.bfile.2* null, %struct.bfile.2** %retval, !dbg !414
  br label %return, !dbg !414

if.end:                                           ; preds = %entry
  %4 = atomicrmw add i64* @sdmprofile__BBcounter_21, i64 1 seq_cst, !dbg !415
  %5 = load i8** %name.addr, align 8, !dbg !415
  %6 = load i8** %mode.addr, align 8, !dbg !415
  %call1 = call %struct._IO_FILE.1* @fopen(i8* %5, i8* %6), !dbg !415
  %7 = load %struct.bfile.2** %bf, align 8, !dbg !415
  %file = getelementptr inbounds %struct.bfile.2* %7, i32 0, i32 0, !dbg !415
  %8 = bitcast %struct._IO_FILE.1** %file to i8*, !dbg !415
  %9 = load i32* %sdmprofile__threadnumber_st, !dbg !415
  call void @sdmprofile__SearchRoutine_GVonly(i8* %8, i8 1, i32 %9), !dbg !415
  store %struct._IO_FILE.1* %call1, %struct._IO_FILE.1** %file, align 8, !dbg !415
  %10 = load %struct.bfile.2** %bf, align 8, !dbg !416
  %file2 = getelementptr inbounds %struct.bfile.2* %10, i32 0, i32 0, !dbg !416
  %11 = bitcast %struct._IO_FILE.1** %file2 to i8*, !dbg !416
  %12 = load i32* %sdmprofile__threadnumber_st, !dbg !416
  call void @sdmprofile__SearchRoutine_GVonly(i8* %11, i8 2, i32 %12), !dbg !416
  %13 = load %struct._IO_FILE.1** %file2, align 8, !dbg !416
  %cmp3 = icmp eq %struct._IO_FILE.1* null, %13, !dbg !416
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !416

if.then4:                                         ; preds = %if.end
  %14 = atomicrmw add i64* @sdmprofile__BBcounter_22, i64 1 seq_cst, !dbg !418
  %15 = load %struct.bfile.2** %bf, align 8, !dbg !418
  %16 = bitcast %struct.bfile.2* %15 to i8*, !dbg !418
  call void @free(i8* %16) #2, !dbg !418
  store %struct.bfile.2* null, %struct.bfile.2** %retval, !dbg !420
  br label %return, !dbg !420

if.end5:                                          ; preds = %if.end
  %17 = atomicrmw add i64* @sdmprofile__BBcounter_23, i64 1 seq_cst, !dbg !421
  %18 = load %struct.bfile.2** %bf, align 8, !dbg !421
  %rcnt = getelementptr inbounds %struct.bfile.2* %18, i32 0, i32 2, !dbg !421
  %19 = load i32* %sdmprofile__threadnumber_st, !dbg !421
  call void @sdmprofile__SearchRoutine_GVonly(i8* %rcnt, i8 1, i32 %19), !dbg !421
  store i8 0, i8* %rcnt, align 1, !dbg !421
  %20 = load %struct.bfile.2** %bf, align 8, !dbg !422
  %wcnt = getelementptr inbounds %struct.bfile.2* %20, i32 0, i32 4, !dbg !422
  %21 = load i32* %sdmprofile__threadnumber_st, !dbg !422
  call void @sdmprofile__SearchRoutine_GVonly(i8* %wcnt, i8 1, i32 %21), !dbg !422
  store i8 0, i8* %wcnt, align 1, !dbg !422
  %22 = load %struct.bfile.2** %bf, align 8, !dbg !423
  store %struct.bfile.2* %22, %struct.bfile.2** %retval, !dbg !423
  br label %return, !dbg !423

return:                                           ; preds = %if.end5, %if.then4, %if.then
  %23 = atomicrmw add i64* @sdmprofile__BBcounter_24, i64 1 seq_cst, !dbg !424
  %24 = load %struct.bfile.2** %retval, !dbg !424
  ret %struct.bfile.2* %24, !dbg !424
}

; Function Attrs: nounwind uwtable
define i32 @bfread(%struct.bfile.2* %bf, i32 %sdmprofile__threadnumber) #11 {
entry:
  %bf.addr = alloca %struct.bfile.2*, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store %struct.bfile.2* %bf, %struct.bfile.2** %bf.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_25, i64 1 seq_cst, !dbg !425
  call void @llvm.dbg.declare(metadata !{%struct.bfile.2** %bf.addr}, metadata !478), !dbg !425
  %1 = load %struct.bfile.2** %bf.addr, align 8, !dbg !479
  %rcnt = getelementptr inbounds %struct.bfile.2* %1, i32 0, i32 2, !dbg !479
  %2 = load i32* %sdmprofile__threadnumber_st, !dbg !479
  call void @sdmprofile__SearchRoutine_GVonly(i8* %rcnt, i8 2, i32 %2), !dbg !479
  %3 = load i8* %rcnt, align 1, !dbg !479
  %conv = sext i8 %3 to i32, !dbg !479
  %cmp = icmp eq i32 0, %conv, !dbg !479
  br i1 %cmp, label %if.then, label %if.end, !dbg !479

if.then:                                          ; preds = %entry
  %4 = atomicrmw add i64* @sdmprofile__BBcounter_26, i64 1 seq_cst, !dbg !481
  %5 = load %struct.bfile.2** %bf.addr, align 8, !dbg !481
  %file = getelementptr inbounds %struct.bfile.2* %5, i32 0, i32 0, !dbg !481
  %6 = bitcast %struct._IO_FILE.1** %file to i8*, !dbg !481
  %7 = load i32* %sdmprofile__threadnumber_st, !dbg !481
  call void @sdmprofile__SearchRoutine_GVonly(i8* %6, i8 2, i32 %7), !dbg !481
  %8 = load %struct._IO_FILE.1** %file, align 8, !dbg !481
  %call = call i32 @fgetc(%struct._IO_FILE.1* %8), !dbg !481
  %conv2 = trunc i32 %call to i8, !dbg !481
  %9 = load %struct.bfile.2** %bf.addr, align 8, !dbg !481
  %rbuf = getelementptr inbounds %struct.bfile.2* %9, i32 0, i32 1, !dbg !481
  %10 = load i32* %sdmprofile__threadnumber_st, !dbg !481
  call void @sdmprofile__SearchRoutine_GVonly(i8* %rbuf, i8 1, i32 %10), !dbg !481
  store i8 %conv2, i8* %rbuf, align 1, !dbg !481
  %11 = load %struct.bfile.2** %bf.addr, align 8, !dbg !483
  %rcnt3 = getelementptr inbounds %struct.bfile.2* %11, i32 0, i32 2, !dbg !483
  %12 = load i32* %sdmprofile__threadnumber_st, !dbg !483
  call void @sdmprofile__SearchRoutine_GVonly(i8* %rcnt3, i8 1, i32 %12), !dbg !483
  store i8 8, i8* %rcnt3, align 1, !dbg !483
  br label %if.end, !dbg !484

if.end:                                           ; preds = %if.then, %entry
  %13 = atomicrmw add i64* @sdmprofile__BBcounter_27, i64 1 seq_cst, !dbg !485
  %14 = load %struct.bfile.2** %bf.addr, align 8, !dbg !485
  %rcnt4 = getelementptr inbounds %struct.bfile.2* %14, i32 0, i32 2, !dbg !485
  %15 = load i32* %sdmprofile__threadnumber_st, !dbg !485
  call void @sdmprofile__SearchRoutine_GVonly(i8* %rcnt4, i8 2, i32 %15), !dbg !485
  %16 = load i8* %rcnt4, align 1, !dbg !485
  %dec = add i8 %16, -1, !dbg !485
  %17 = load i32* %sdmprofile__threadnumber_st, !dbg !485
  call void @sdmprofile__SearchRoutine_GVonly(i8* %rcnt4, i8 1, i32 %17), !dbg !485
  store i8 %dec, i8* %rcnt4, align 1, !dbg !485
  %18 = load %struct.bfile.2** %bf.addr, align 8, !dbg !486
  %rbuf5 = getelementptr inbounds %struct.bfile.2* %18, i32 0, i32 1, !dbg !486
  %19 = load i32* %sdmprofile__threadnumber_st, !dbg !486
  call void @sdmprofile__SearchRoutine_GVonly(i8* %rbuf5, i8 2, i32 %19), !dbg !486
  %20 = load i8* %rbuf5, align 1, !dbg !486
  %conv6 = sext i8 %20 to i32, !dbg !486
  %21 = load %struct.bfile.2** %bf.addr, align 8, !dbg !486
  %rcnt7 = getelementptr inbounds %struct.bfile.2* %21, i32 0, i32 2, !dbg !486
  %22 = load i32* %sdmprofile__threadnumber_st, !dbg !486
  call void @sdmprofile__SearchRoutine_GVonly(i8* %rcnt7, i8 2, i32 %22), !dbg !486
  %23 = load i8* %rcnt7, align 1, !dbg !486
  %conv8 = sext i8 %23 to i32, !dbg !486
  %shl = shl i32 1, %conv8, !dbg !486
  %and = and i32 %conv6, %shl, !dbg !486
  %cmp9 = icmp ne i32 %and, 0, !dbg !486
  %conv10 = zext i1 %cmp9 to i32, !dbg !486
  ret i32 %conv10, !dbg !486
}

; Function Attrs: nounwind uwtable
define void @bfwrite(i32 %bit, %struct.bfile.2* %bf, i32 %sdmprofile__threadnumber) #11 {
entry:
  %bit.addr = alloca i32, align 4
  %bf.addr = alloca %struct.bfile.2*, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32 %bit, i32* %bit.addr, align 4
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_28, i64 1 seq_cst, !dbg !487
  call void @llvm.dbg.declare(metadata !{i32* %bit.addr}, metadata !540), !dbg !487
  store %struct.bfile.2* %bf, %struct.bfile.2** %bf.addr, align 8
  call void @llvm.dbg.declare(metadata !{%struct.bfile.2** %bf.addr}, metadata !541), !dbg !542
  %1 = load %struct.bfile.2** %bf.addr, align 8, !dbg !543
  %wcnt = getelementptr inbounds %struct.bfile.2* %1, i32 0, i32 4, !dbg !543
  %2 = load i32* %sdmprofile__threadnumber_st, !dbg !543
  call void @sdmprofile__SearchRoutine_GVonly(i8* %wcnt, i8 2, i32 %2), !dbg !543
  %3 = load i8* %wcnt, align 1, !dbg !543
  %conv = sext i8 %3 to i32, !dbg !543
  %cmp = icmp eq i32 8, %conv, !dbg !543
  br i1 %cmp, label %if.then, label %if.end, !dbg !543

if.then:                                          ; preds = %entry
  %4 = atomicrmw add i64* @sdmprofile__BBcounter_29, i64 1 seq_cst, !dbg !545
  %5 = load %struct.bfile.2** %bf.addr, align 8, !dbg !545
  %wbuf = getelementptr inbounds %struct.bfile.2* %5, i32 0, i32 3, !dbg !545
  %6 = load i32* %sdmprofile__threadnumber_st, !dbg !545
  call void @sdmprofile__SearchRoutine_GVonly(i8* %wbuf, i8 2, i32 %6), !dbg !545
  %7 = load i8* %wbuf, align 1, !dbg !545
  %conv2 = sext i8 %7 to i32, !dbg !545
  %8 = load %struct.bfile.2** %bf.addr, align 8, !dbg !545
  %file = getelementptr inbounds %struct.bfile.2* %8, i32 0, i32 0, !dbg !545
  %9 = bitcast %struct._IO_FILE.1** %file to i8*, !dbg !545
  %10 = load i32* %sdmprofile__threadnumber_st, !dbg !545
  call void @sdmprofile__SearchRoutine_GVonly(i8* %9, i8 2, i32 %10), !dbg !545
  %11 = load %struct._IO_FILE.1** %file, align 8, !dbg !545
  %call = call i32 @fputc(i32 %conv2, %struct._IO_FILE.1* %11), !dbg !545
  %12 = load %struct.bfile.2** %bf.addr, align 8, !dbg !547
  %wcnt3 = getelementptr inbounds %struct.bfile.2* %12, i32 0, i32 4, !dbg !547
  %13 = load i32* %sdmprofile__threadnumber_st, !dbg !547
  call void @sdmprofile__SearchRoutine_GVonly(i8* %wcnt3, i8 1, i32 %13), !dbg !547
  store i8 0, i8* %wcnt3, align 1, !dbg !547
  br label %if.end, !dbg !548

if.end:                                           ; preds = %if.then, %entry
  %14 = atomicrmw add i64* @sdmprofile__BBcounter_30, i64 1 seq_cst, !dbg !549
  %15 = load %struct.bfile.2** %bf.addr, align 8, !dbg !549
  %wcnt4 = getelementptr inbounds %struct.bfile.2* %15, i32 0, i32 4, !dbg !549
  %16 = load i32* %sdmprofile__threadnumber_st, !dbg !549
  call void @sdmprofile__SearchRoutine_GVonly(i8* %wcnt4, i8 2, i32 %16), !dbg !549
  %17 = load i8* %wcnt4, align 1, !dbg !549
  %inc = add i8 %17, 1, !dbg !549
  %18 = load i32* %sdmprofile__threadnumber_st, !dbg !549
  call void @sdmprofile__SearchRoutine_GVonly(i8* %wcnt4, i8 1, i32 %18), !dbg !549
  store i8 %inc, i8* %wcnt4, align 1, !dbg !549
  %19 = load %struct.bfile.2** %bf.addr, align 8, !dbg !550
  %wbuf5 = getelementptr inbounds %struct.bfile.2* %19, i32 0, i32 3, !dbg !550
  %20 = load i32* %sdmprofile__threadnumber_st, !dbg !550
  call void @sdmprofile__SearchRoutine_GVonly(i8* %wbuf5, i8 2, i32 %20), !dbg !550
  %21 = load i8* %wbuf5, align 1, !dbg !550
  %conv6 = sext i8 %21 to i32, !dbg !550
  %shl = shl i32 %conv6, 1, !dbg !550
  %conv7 = trunc i32 %shl to i8, !dbg !550
  %22 = load i32* %sdmprofile__threadnumber_st, !dbg !550
  call void @sdmprofile__SearchRoutine_GVonly(i8* %wbuf5, i8 1, i32 %22), !dbg !550
  store i8 %conv7, i8* %wbuf5, align 1, !dbg !550
  %23 = load i32* %bit.addr, align 4, !dbg !551
  %and = and i32 %23, 1, !dbg !551
  %24 = load %struct.bfile.2** %bf.addr, align 8, !dbg !551
  %wbuf8 = getelementptr inbounds %struct.bfile.2* %24, i32 0, i32 3, !dbg !551
  %25 = load i32* %sdmprofile__threadnumber_st, !dbg !551
  call void @sdmprofile__SearchRoutine_GVonly(i8* %wbuf8, i8 2, i32 %25), !dbg !551
  %26 = load i8* %wbuf8, align 1, !dbg !551
  %conv9 = sext i8 %26 to i32, !dbg !551
  %or = or i32 %conv9, %and, !dbg !551
  %conv10 = trunc i32 %or to i8, !dbg !551
  %27 = load i32* %sdmprofile__threadnumber_st, !dbg !551
  call void @sdmprofile__SearchRoutine_GVonly(i8* %wbuf8, i8 1, i32 %27), !dbg !551
  store i8 %conv10, i8* %wbuf8, align 1, !dbg !551
  ret void, !dbg !552
}

; Function Attrs: nounwind uwtable
define i32 @bit_count(i64 %x, i32 %sdmprofile__threadnumber) #11 {
entry:
  %x.addr = alloca i64, align 8
  %n = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i64 %x, i64* %x.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_31, i64 1 seq_cst, !dbg !553
  call void @llvm.dbg.declare(metadata !{i64* %x.addr}, metadata !554), !dbg !553
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !555), !dbg !556
  store i32 0, i32* %n, align 4, !dbg !557
  %1 = load i64* %x.addr, align 8, !dbg !558
  %tobool = icmp ne i64 %1, 0, !dbg !558
  br i1 %tobool, label %if.then, label %if.end, !dbg !558

if.then:                                          ; preds = %entry
  %2 = atomicrmw add i64* @sdmprofile__BBcounter_32, i64 1 seq_cst, !dbg !560
  br label %do.body, !dbg !560

do.body:                                          ; preds = %do.cond, %if.then
  %3 = atomicrmw add i64* @sdmprofile__BBcounter_33, i64 1 seq_cst, !dbg !562
  %4 = load i32* %n, align 4, !dbg !562
  %inc = add nsw i32 %4, 1, !dbg !562
  store i32 %inc, i32* %n, align 4, !dbg !562
  br label %do.cond, !dbg !562

do.cond:                                          ; preds = %do.body
  %5 = atomicrmw add i64* @sdmprofile__BBcounter_34, i64 1 seq_cst, !dbg !564
  %6 = load i64* %x.addr, align 8, !dbg !564
  %7 = load i64* %x.addr, align 8, !dbg !564
  %sub = sub nsw i64 %7, 1, !dbg !564
  %and = and i64 %6, %sub, !dbg !564
  store i64 %and, i64* %x.addr, align 8, !dbg !564
  %cmp = icmp ne i64 0, %and, !dbg !564
  br i1 %cmp, label %do.body, label %do.end, !dbg !564

do.end:                                           ; preds = %do.cond
  %8 = atomicrmw add i64* @sdmprofile__BBcounter_35, i64 1 seq_cst, !dbg !566
  br label %if.end, !dbg !566

if.end:                                           ; preds = %do.end, %entry
  %9 = atomicrmw add i64* @sdmprofile__BBcounter_36, i64 1 seq_cst, !dbg !568
  %10 = load i32* %n, align 4, !dbg !568
  ret i32 %10, !dbg !568
}

; Function Attrs: nounwind uwtable
define internal i32 @bit_shifter(i64 %x, i32 %sdmprofile__threadnumber) #11 {
entry:
  %x.addr = alloca i64, align 8
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i64 %x, i64* %x.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_37, i64 1 seq_cst, !dbg !569
  call void @llvm.dbg.declare(metadata !{i64* %x.addr}, metadata !570), !dbg !569
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !571), !dbg !572
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !573), !dbg !574
  store i32 0, i32* %n, align 4, !dbg !575
  store i32 0, i32* %i, align 4, !dbg !575
  br label %for.cond, !dbg !575

for.cond:                                         ; preds = %for.inc, %entry
  %1 = atomicrmw add i64* @sdmprofile__BBcounter_38, i64 1 seq_cst, !dbg !577
  %2 = load i64* %x.addr, align 8, !dbg !577
  %tobool = icmp ne i64 %2, 0, !dbg !577
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !577

land.rhs:                                         ; preds = %for.cond
  %3 = atomicrmw add i64* @sdmprofile__BBcounter_39, i64 1 seq_cst, !dbg !580
  %4 = load i32* %i, align 4, !dbg !580
  %conv = sext i32 %4 to i64, !dbg !580
  %cmp = icmp ult i64 %conv, 64, !dbg !580
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %5 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ]
  %6 = atomicrmw add i64* @sdmprofile__BBcounter_40, i64 1 seq_cst, !dbg !582
  br i1 %5, label %for.body, label %for.end, !dbg !582

for.body:                                         ; preds = %land.end
  %7 = atomicrmw add i64* @sdmprofile__BBcounter_41, i64 1 seq_cst, !dbg !584
  %8 = load i64* %x.addr, align 8, !dbg !584
  %and = and i64 %8, 1, !dbg !584
  %conv2 = trunc i64 %and to i32, !dbg !584
  %9 = load i32* %n, align 4, !dbg !584
  %add = add nsw i32 %9, %conv2, !dbg !584
  store i32 %add, i32* %n, align 4, !dbg !584
  br label %for.inc, !dbg !584

for.inc:                                          ; preds = %for.body
  %10 = atomicrmw add i64* @sdmprofile__BBcounter_42, i64 1 seq_cst, !dbg !585
  %11 = load i32* %i, align 4, !dbg !585
  %inc = add nsw i32 %11, 1, !dbg !585
  store i32 %inc, i32* %i, align 4, !dbg !585
  %12 = load i64* %x.addr, align 8, !dbg !585
  %shr = ashr i64 %12, 1, !dbg !585
  store i64 %shr, i64* %x.addr, align 8, !dbg !585
  br label %for.cond, !dbg !585

for.end:                                          ; preds = %land.end
  %13 = atomicrmw add i64* @sdmprofile__BBcounter_43, i64 1 seq_cst, !dbg !586
  %14 = load i32* %n, align 4, !dbg !586
  ret i32 %14, !dbg !586
}

; Function Attrs: nounwind uwtable
define i32 @bitcount(i64 %i, i32 %sdmprofile__threadnumber) #11 {
entry:
  %i.addr = alloca i64, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i64 %i, i64* %i.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_44, i64 1 seq_cst, !dbg !587
  call void @llvm.dbg.declare(metadata !{i64* %i.addr}, metadata !588), !dbg !587
  %1 = load i64* %i.addr, align 8, !dbg !589
  %and = and i64 %1, 2863311530, !dbg !589
  %shr = ashr i64 %and, 1, !dbg !589
  %2 = load i64* %i.addr, align 8, !dbg !589
  %and1 = and i64 %2, 1431655765, !dbg !589
  %add = add nsw i64 %shr, %and1, !dbg !589
  store i64 %add, i64* %i.addr, align 8, !dbg !589
  %3 = load i64* %i.addr, align 8, !dbg !590
  %and2 = and i64 %3, 3435973836, !dbg !590
  %shr3 = ashr i64 %and2, 2, !dbg !590
  %4 = load i64* %i.addr, align 8, !dbg !590
  %and4 = and i64 %4, 858993459, !dbg !590
  %add5 = add nsw i64 %shr3, %and4, !dbg !590
  store i64 %add5, i64* %i.addr, align 8, !dbg !590
  %5 = load i64* %i.addr, align 8, !dbg !591
  %and6 = and i64 %5, 4042322160, !dbg !591
  %shr7 = ashr i64 %and6, 4, !dbg !591
  %6 = load i64* %i.addr, align 8, !dbg !591
  %and8 = and i64 %6, 252645135, !dbg !591
  %add9 = add nsw i64 %shr7, %and8, !dbg !591
  store i64 %add9, i64* %i.addr, align 8, !dbg !591
  %7 = load i64* %i.addr, align 8, !dbg !592
  %and10 = and i64 %7, 4278255360, !dbg !592
  %shr11 = ashr i64 %and10, 8, !dbg !592
  %8 = load i64* %i.addr, align 8, !dbg !592
  %and12 = and i64 %8, 16711935, !dbg !592
  %add13 = add nsw i64 %shr11, %and12, !dbg !592
  store i64 %add13, i64* %i.addr, align 8, !dbg !592
  %9 = load i64* %i.addr, align 8, !dbg !593
  %and14 = and i64 %9, 4294901760, !dbg !593
  %shr15 = ashr i64 %and14, 16, !dbg !593
  %10 = load i64* %i.addr, align 8, !dbg !593
  %and16 = and i64 %10, 65535, !dbg !593
  %add17 = add nsw i64 %shr15, %and16, !dbg !593
  store i64 %add17, i64* %i.addr, align 8, !dbg !593
  %11 = load i64* %i.addr, align 8, !dbg !594
  %conv = trunc i64 %11 to i32, !dbg !594
  ret i32 %conv, !dbg !594
}

; Function Attrs: nounwind uwtable
define void @bitstring(i8* %str, i64 %byze, i32 %biz, i32 %strwid, i32 %sdmprofile__threadnumber) #11 {
entry:
  %str.addr = alloca i8*, align 8
  %byze.addr = alloca i64, align 8
  %biz.addr = alloca i32, align 4
  %strwid.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i8* %str, i8** %str.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_45, i64 1 seq_cst, !dbg !595
  call void @llvm.dbg.declare(metadata !{i8** %str.addr}, metadata !596), !dbg !595
  store i64 %byze, i64* %byze.addr, align 8
  call void @llvm.dbg.declare(metadata !{i64* %byze.addr}, metadata !597), !dbg !598
  store i32 %biz, i32* %biz.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %biz.addr}, metadata !599), !dbg !600
  store i32 %strwid, i32* %strwid.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %strwid.addr}, metadata !601), !dbg !602
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !603), !dbg !604
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !605), !dbg !606
  %1 = load i32* %strwid.addr, align 4, !dbg !607
  %2 = load i32* %biz.addr, align 4, !dbg !607
  %3 = load i32* %biz.addr, align 4, !dbg !607
  %shr = ashr i32 %3, 2, !dbg !607
  %add = add nsw i32 %2, %shr, !dbg !607
  %4 = load i32* %biz.addr, align 4, !dbg !607
  %rem = srem i32 %4, 4, !dbg !607
  %tobool = icmp ne i32 %rem, 0, !dbg !607
  %cond = select i1 %tobool, i32 0, i32 1, !dbg !607
  %sub = sub nsw i32 %add, %cond, !dbg !607
  %sub1 = sub nsw i32 %1, %sub, !dbg !607
  store i32 %sub1, i32* %j, align 4, !dbg !607
  store i32 0, i32* %i, align 4, !dbg !608
  br label %for.cond, !dbg !608

for.cond:                                         ; preds = %for.inc, %entry
  %5 = atomicrmw add i64* @sdmprofile__BBcounter_46, i64 1 seq_cst, !dbg !610
  %6 = load i32* %i, align 4, !dbg !610
  %7 = load i32* %j, align 4, !dbg !610
  %cmp = icmp slt i32 %6, %7, !dbg !610
  br i1 %cmp, label %for.body, label %for.end, !dbg !610

for.body:                                         ; preds = %for.cond
  %8 = atomicrmw add i64* @sdmprofile__BBcounter_47, i64 1 seq_cst, !dbg !613
  %9 = load i8** %str.addr, align 8, !dbg !613
  %incdec.ptr = getelementptr inbounds i8* %9, i32 1, !dbg !613
  store i8* %incdec.ptr, i8** %str.addr, align 8, !dbg !613
  %10 = load i32* %sdmprofile__threadnumber_st, !dbg !613
  call void @sdmprofile__SearchRoutine_GVonly(i8* %9, i8 1, i32 %10), !dbg !613
  store i8 32, i8* %9, align 1, !dbg !613
  br label %for.inc, !dbg !613

for.inc:                                          ; preds = %for.body
  %11 = atomicrmw add i64* @sdmprofile__BBcounter_48, i64 1 seq_cst, !dbg !614
  %12 = load i32* %i, align 4, !dbg !614
  %inc = add nsw i32 %12, 1, !dbg !614
  store i32 %inc, i32* %i, align 4, !dbg !614
  br label %for.cond, !dbg !614

for.end:                                          ; preds = %for.cond
  %13 = atomicrmw add i64* @sdmprofile__BBcounter_49, i64 1 seq_cst, !dbg !615
  br label %while.cond, !dbg !615

while.cond:                                       ; preds = %if.end, %for.end
  %14 = atomicrmw add i64* @sdmprofile__BBcounter_50, i64 1 seq_cst, !dbg !616
  %15 = load i32* %biz.addr, align 4, !dbg !616
  %dec = add nsw i32 %15, -1, !dbg !616
  store i32 %dec, i32* %biz.addr, align 4, !dbg !616
  %cmp2 = icmp sge i32 %dec, 0, !dbg !616
  br i1 %cmp2, label %while.body, label %while.end, !dbg !616

while.body:                                       ; preds = %while.cond
  %16 = atomicrmw add i64* @sdmprofile__BBcounter_51, i64 1 seq_cst, !dbg !618
  %17 = load i64* %byze.addr, align 8, !dbg !618
  %18 = load i32* %biz.addr, align 4, !dbg !618
  %sh_prom = zext i32 %18 to i64, !dbg !618
  %shr3 = ashr i64 %17, %sh_prom, !dbg !618
  %and = and i64 %shr3, 1, !dbg !618
  %add4 = add nsw i64 %and, 48, !dbg !618
  %conv = trunc i64 %add4 to i8, !dbg !618
  %19 = load i8** %str.addr, align 8, !dbg !618
  %incdec.ptr5 = getelementptr inbounds i8* %19, i32 1, !dbg !618
  store i8* %incdec.ptr5, i8** %str.addr, align 8, !dbg !618
  %20 = load i32* %sdmprofile__threadnumber_st, !dbg !618
  call void @sdmprofile__SearchRoutine_GVonly(i8* %19, i8 1, i32 %20), !dbg !618
  store i8 %conv, i8* %19, align 1, !dbg !618
  %21 = load i32* %biz.addr, align 4, !dbg !620
  %rem6 = srem i32 %21, 4, !dbg !620
  %tobool7 = icmp ne i32 %rem6, 0, !dbg !620
  br i1 %tobool7, label %if.end, label %land.lhs.true, !dbg !620

land.lhs.true:                                    ; preds = %while.body
  %22 = atomicrmw add i64* @sdmprofile__BBcounter_52, i64 1 seq_cst, !dbg !622
  %23 = load i32* %biz.addr, align 4, !dbg !622
  %tobool8 = icmp ne i32 %23, 0, !dbg !622
  br i1 %tobool8, label %if.then, label %if.end, !dbg !622

if.then:                                          ; preds = %land.lhs.true
  %24 = atomicrmw add i64* @sdmprofile__BBcounter_53, i64 1 seq_cst, !dbg !624
  %25 = load i8** %str.addr, align 8, !dbg !624
  %incdec.ptr9 = getelementptr inbounds i8* %25, i32 1, !dbg !624
  store i8* %incdec.ptr9, i8** %str.addr, align 8, !dbg !624
  %26 = load i32* %sdmprofile__threadnumber_st, !dbg !624
  call void @sdmprofile__SearchRoutine_GVonly(i8* %25, i8 1, i32 %26), !dbg !624
  store i8 32, i8* %25, align 1, !dbg !624
  br label %if.end, !dbg !624

if.end:                                           ; preds = %if.then, %land.lhs.true, %while.body
  %27 = atomicrmw add i64* @sdmprofile__BBcounter_54, i64 1 seq_cst, !dbg !625
  br label %while.cond, !dbg !625

while.end:                                        ; preds = %while.cond
  %28 = atomicrmw add i64* @sdmprofile__BBcounter_55, i64 1 seq_cst, !dbg !626
  %29 = load i8** %str.addr, align 8, !dbg !626
  %30 = load i32* %sdmprofile__threadnumber_st, !dbg !626
  call void @sdmprofile__SearchRoutine_GVonly(i8* %29, i8 1, i32 %30), !dbg !626
  store i8 0, i8* %29, align 1, !dbg !626
  ret void, !dbg !627
}

; Function Attrs: nounwind uwtable
define i32 @bstr_i(i8* %cptr, i32 %sdmprofile__threadnumber) #11 {
entry:
  %cptr.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i8* %cptr, i8** %cptr.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_56, i64 1 seq_cst, !dbg !628
  call void @llvm.dbg.declare(metadata !{i8** %cptr.addr}, metadata !629), !dbg !628
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !630), !dbg !631
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !632), !dbg !633
  store i32 0, i32* %j, align 4, !dbg !634
  br label %while.cond, !dbg !635

while.cond:                                       ; preds = %while.body, %entry
  %1 = atomicrmw add i64* @sdmprofile__BBcounter_57, i64 1 seq_cst, !dbg !636
  %2 = load i8** %cptr.addr, align 8, !dbg !636
  %tobool = icmp ne i8* %2, null, !dbg !636
  br i1 %tobool, label %land.lhs.true, label %land.end, !dbg !636

land.lhs.true:                                    ; preds = %while.cond
  %3 = atomicrmw add i64* @sdmprofile__BBcounter_58, i64 1 seq_cst, !dbg !638
  %4 = load i8** %cptr.addr, align 8, !dbg !638
  %5 = load i32* %sdmprofile__threadnumber_st, !dbg !638
  call void @sdmprofile__SearchRoutine_GVonly(i8* %4, i8 2, i32 %5), !dbg !638
  %6 = load i8* %4, align 1, !dbg !638
  %conv = sext i8 %6 to i32, !dbg !638
  %tobool1 = icmp ne i32 %conv, 0, !dbg !638
  br i1 %tobool1, label %land.rhs, label %land.end, !dbg !638

land.rhs:                                         ; preds = %land.lhs.true
  %7 = atomicrmw add i64* @sdmprofile__BBcounter_59, i64 1 seq_cst, !dbg !640
  %8 = load i8** %cptr.addr, align 8, !dbg !640
  %9 = load i32* %sdmprofile__threadnumber_st, !dbg !640
  call void @sdmprofile__SearchRoutine_GVonly(i8* %8, i8 2, i32 %9), !dbg !640
  %10 = load i8* %8, align 1, !dbg !640
  %conv2 = sext i8 %10 to i32, !dbg !640
  %call = call i8* @strchr(i8* getelementptr inbounds ([3 x i8]* @.str1216, i32 0, i32 0), i32 %conv2) #18, !dbg !640
  %tobool3 = icmp ne i8* %call, null, !dbg !640
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %while.cond
  %11 = phi i1 [ false, %land.lhs.true ], [ false, %while.cond ], [ %tobool3, %land.rhs ]
  %12 = atomicrmw add i64* @sdmprofile__BBcounter_60, i64 1 seq_cst, !dbg !642
  br i1 %11, label %while.body, label %while.end, !dbg !642

while.body:                                       ; preds = %land.end
  %13 = atomicrmw add i64* @sdmprofile__BBcounter_61, i64 1 seq_cst, !dbg !645
  %14 = load i8** %cptr.addr, align 8, !dbg !645
  %incdec.ptr = getelementptr inbounds i8* %14, i32 1, !dbg !645
  store i8* %incdec.ptr, i8** %cptr.addr, align 8, !dbg !645
  %15 = load i32* %sdmprofile__threadnumber_st, !dbg !645
  call void @sdmprofile__SearchRoutine_GVonly(i8* %14, i8 2, i32 %15), !dbg !645
  %16 = load i8* %14, align 1, !dbg !645
  %conv4 = sext i8 %16 to i32, !dbg !645
  %sub = sub nsw i32 %conv4, 48, !dbg !645
  store i32 %sub, i32* %i, align 4, !dbg !645
  %17 = load i32* %j, align 4, !dbg !647
  %shl = shl i32 %17, 1, !dbg !647
  store i32 %shl, i32* %j, align 4, !dbg !647
  %18 = load i32* %i, align 4, !dbg !648
  %and = and i32 %18, 1, !dbg !648
  %19 = load i32* %j, align 4, !dbg !648
  %or = or i32 %19, %and, !dbg !648
  store i32 %or, i32* %j, align 4, !dbg !648
  br label %while.cond, !dbg !649

while.end:                                        ; preds = %land.end
  %20 = atomicrmw add i64* @sdmprofile__BBcounter_62, i64 1 seq_cst, !dbg !650
  %21 = load i32* %j, align 4, !dbg !650
  ret i32 %21, !dbg !650
}

; Function Attrs: nounwind uwtable
define i32 @btbl_bitcnt(i64 %x, i32 %sdmprofile__threadnumber) #11 {
entry:
  %x.addr = alloca i64, align 8
  %cnt = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i64 %x, i64* %x.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_63, i64 1 seq_cst, !dbg !651
  call void @llvm.dbg.declare(metadata !{i64* %x.addr}, metadata !652), !dbg !651
  call void @llvm.dbg.declare(metadata !{i32* %cnt}, metadata !653), !dbg !654
  %1 = bitcast i64* %x.addr to i8*, !dbg !655
  %arrayidx = getelementptr inbounds i8* %1, i64 0, !dbg !655
  %2 = load i32* %sdmprofile__threadnumber_st, !dbg !655
  call void @sdmprofile__SearchRoutine_GVonly(i8* %arrayidx, i8 2, i32 %2), !dbg !655
  %3 = load i8* %arrayidx, align 1, !dbg !655
  %conv = sext i8 %3 to i32, !dbg !655
  %and = and i32 %conv, 255, !dbg !655
  %idxprom = sext i32 %and to i64, !dbg !655
  %arrayidx1 = getelementptr inbounds [256 x i8]* @bits1, i32 0, i64 %idxprom, !dbg !655
  %4 = load i8* %arrayidx1, align 1, !dbg !655
  %conv2 = sext i8 %4 to i32, !dbg !655
  store i32 %conv2, i32* %cnt, align 4, !dbg !655
  %5 = load i64* %x.addr, align 8, !dbg !656
  %shr = ashr i64 %5, 8, !dbg !656
  store i64 %shr, i64* %x.addr, align 8, !dbg !656
  %cmp = icmp ne i64 0, %shr, !dbg !656
  br i1 %cmp, label %if.then, label %if.end, !dbg !656

if.then:                                          ; preds = %entry
  %6 = atomicrmw add i64* @sdmprofile__BBcounter_64, i64 1 seq_cst, !dbg !658
  %7 = load i64* %x.addr, align 8, !dbg !658
  %sdmprofile__LD1 = load i32* %sdmprofile__threadnumber_st, align 8
  %8 = call i32 @btbl_bitcnt(i64 %7, i32 %sdmprofile__LD1), !dbg !658
  %9 = load i32* %cnt, align 4, !dbg !658
  %add = add nsw i32 %9, %8, !dbg !658
  store i32 %add, i32* %cnt, align 4, !dbg !658
  br label %if.end, !dbg !658

if.end:                                           ; preds = %if.then, %entry
  %10 = atomicrmw add i64* @sdmprofile__BBcounter_65, i64 1 seq_cst, !dbg !659
  %11 = load i32* %cnt, align 4, !dbg !659
  ret i32 %11, !dbg !659
}

; Function Attrs: nounwind uwtable
define i32 @app__mainfunction__(i32 %argc, i8** %argv, i32 %sdmprofile__threadnumber) #11 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %start = alloca i64, align 8
  %stop = alloca i64, align 8
  %ct = alloca double, align 8
  %cmin = alloca double, align 8
  %cmax = alloca double, align 8
  %i = alloca i32, align 4
  %cminix = alloca i32, align 4
  %cmaxix = alloca i32, align 4
  %j = alloca i64, align 8
  %n = alloca i64, align 8
  %seed = alloca i64, align 8
  %iterations = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_3, i64 1 seq_cst, !dbg !660
  call void @llvm.dbg.declare(metadata !{i32* %argc.addr}, metadata !661), !dbg !660
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %argv.addr}, metadata !662), !dbg !663
  call void @llvm.dbg.declare(metadata !{i64* %start}, metadata !664), !dbg !668
  call void @llvm.dbg.declare(metadata !{i64* %stop}, metadata !669), !dbg !670
  call void @llvm.dbg.declare(metadata !{double* %ct}, metadata !671), !dbg !673
  call void @llvm.dbg.declare(metadata !{double* %cmin}, metadata !674), !dbg !675
  store double 0x7FEFFFFFFFFFFFFF, double* %cmin, align 8, !dbg !676
  call void @llvm.dbg.declare(metadata !{double* %cmax}, metadata !677), !dbg !678
  store double 0.000000e+00, double* %cmax, align 8, !dbg !676
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !679), !dbg !680
  call void @llvm.dbg.declare(metadata !{i32* %cminix}, metadata !681), !dbg !682
  call void @llvm.dbg.declare(metadata !{i32* %cmaxix}, metadata !683), !dbg !684
  call void @llvm.dbg.declare(metadata !{i64* %j}, metadata !685), !dbg !686
  call void @llvm.dbg.declare(metadata !{i64* %n}, metadata !687), !dbg !688
  call void @llvm.dbg.declare(metadata !{i64* %seed}, metadata !689), !dbg !690
  call void @llvm.dbg.declare(metadata !{i32* %iterations}, metadata !691), !dbg !692
  %1 = load i32* %argc.addr, align 4, !dbg !693
  %cmp = icmp slt i32 %1, 2, !dbg !693
  br i1 %cmp, label %if.then, label %if.end, !dbg !693

if.then:                                          ; preds = %entry
  %2 = atomicrmw add i64* @sdmprofile__BBcounter_4, i64 1 seq_cst, !dbg !695
  %3 = load %struct._IO_FILE.1** @stderr, align 8, !dbg !695
  %call = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %3, i8* getelementptr inbounds ([29 x i8]* @.str711, i32 0, i32 0)), !dbg !695
  call void @exit(i32 -1) #19, !dbg !697
  unreachable, !dbg !697

if.end:                                           ; preds = %entry
  %4 = atomicrmw add i64* @sdmprofile__BBcounter_5, i64 1 seq_cst, !dbg !698
  %5 = load i8*** %argv.addr, align 8, !dbg !698
  %arrayidx = getelementptr inbounds i8** %5, i64 1, !dbg !698
  %6 = bitcast i8** %arrayidx to i8*, !dbg !698
  %7 = load i32* %sdmprofile__threadnumber_st, !dbg !698
  call void @sdmprofile__SearchRoutine_GVonly(i8* %6, i8 2, i32 %7), !dbg !698
  %8 = load i8** %arrayidx, align 8, !dbg !698
  %call1 = call i32 @atoi(i8* %8) #18, !dbg !698
  store i32 %call1, i32* %iterations, align 4, !dbg !698
  %call2 = call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @.str812, i32 0, i32 0)), !dbg !699
  store i32 0, i32* %i, align 4, !dbg !700
  br label %for.cond, !dbg !700

for.cond:                                         ; preds = %for.inc28, %if.end
  %9 = atomicrmw add i64* @sdmprofile__BBcounter_6, i64 1 seq_cst, !dbg !702
  %10 = load i32* %i, align 4, !dbg !702
  %cmp3 = icmp slt i32 %10, 7, !dbg !702
  br i1 %cmp3, label %for.body, label %for.end30, !dbg !702

for.body:                                         ; preds = %for.cond
  %11 = atomicrmw add i64* @sdmprofile__BBcounter_7, i64 1 seq_cst, !dbg !705
  %call4 = call i64 @clock() #2, !dbg !705
  store i64 %call4, i64* %start, align 8, !dbg !705
  store i64 0, i64* %n, align 8, !dbg !707
  store i64 0, i64* %j, align 8, !dbg !707
  %call5 = call i32 @rand() #2, !dbg !709
  %conv = sext i32 %call5 to i64, !dbg !709
  store i64 %conv, i64* %seed, align 8, !dbg !709
  br label %for.cond6, !dbg !709

for.cond6:                                        ; preds = %for.inc, %for.body
  %12 = atomicrmw add i64* @sdmprofile__BBcounter_8, i64 1 seq_cst, !dbg !710
  %13 = load i64* %j, align 8, !dbg !710
  %14 = load i32* %iterations, align 4, !dbg !710
  %conv7 = sext i32 %14 to i64, !dbg !710
  %cmp8 = icmp slt i64 %13, %conv7, !dbg !710
  br i1 %cmp8, label %for.body10, label %for.end, !dbg !710

for.body10:                                       ; preds = %for.cond6
  %15 = atomicrmw add i64* @sdmprofile__BBcounter_9, i64 1 seq_cst, !dbg !713
  %16 = load i32* %i, align 4, !dbg !713
  %idxprom = sext i32 %16 to i64, !dbg !713
  %arrayidx11 = getelementptr inbounds [7 x i32 (i64)*]* @main.pBitCntFunc, i32 0, i64 %idxprom, !dbg !713
  %17 = load i32 (i64)** %arrayidx11, align 8, !dbg !713
  %18 = load i64* %seed, align 8, !dbg !713
  %call12 = call i32 %17(i64 %18), !dbg !713
  %conv13 = sext i32 %call12 to i64, !dbg !713
  %19 = load i64* %n, align 8, !dbg !713
  %add = add nsw i64 %19, %conv13, !dbg !713
  store i64 %add, i64* %n, align 8, !dbg !713
  br label %for.inc, !dbg !713

for.inc:                                          ; preds = %for.body10
  %20 = atomicrmw add i64* @sdmprofile__BBcounter_10, i64 1 seq_cst, !dbg !714
  %21 = load i64* %j, align 8, !dbg !714
  %inc = add nsw i64 %21, 1, !dbg !714
  store i64 %inc, i64* %j, align 8, !dbg !714
  %22 = load i64* %seed, align 8, !dbg !714
  %add14 = add nsw i64 %22, 13, !dbg !714
  store i64 %add14, i64* %seed, align 8, !dbg !714
  br label %for.cond6, !dbg !714

for.end:                                          ; preds = %for.cond6
  %23 = atomicrmw add i64* @sdmprofile__BBcounter_11, i64 1 seq_cst, !dbg !715
  %call15 = call i64 @clock() #2, !dbg !715
  store i64 %call15, i64* %stop, align 8, !dbg !715
  %24 = load i64* %stop, align 8, !dbg !716
  %25 = load i64* %start, align 8, !dbg !716
  %sub = sub nsw i64 %24, %25, !dbg !716
  %conv16 = sitofp i64 %sub to double, !dbg !716
  %div = fdiv double %conv16, 1.000000e+06, !dbg !716
  store double %div, double* %ct, align 8, !dbg !716
  %26 = load double* %ct, align 8, !dbg !717
  %27 = load double* %cmin, align 8, !dbg !717
  %cmp17 = fcmp olt double %26, %27, !dbg !717
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !717

if.then19:                                        ; preds = %for.end
  %28 = atomicrmw add i64* @sdmprofile__BBcounter_12, i64 1 seq_cst, !dbg !719
  %29 = load double* %ct, align 8, !dbg !719
  store double %29, double* %cmin, align 8, !dbg !719
  %30 = load i32* %i, align 4, !dbg !721
  store i32 %30, i32* %cminix, align 4, !dbg !721
  br label %if.end20, !dbg !722

if.end20:                                         ; preds = %if.then19, %for.end
  %31 = atomicrmw add i64* @sdmprofile__BBcounter_13, i64 1 seq_cst, !dbg !723
  %32 = load double* %ct, align 8, !dbg !723
  %33 = load double* %cmax, align 8, !dbg !723
  %cmp21 = fcmp ogt double %32, %33, !dbg !723
  br i1 %cmp21, label %if.then23, label %if.end24, !dbg !723

if.then23:                                        ; preds = %if.end20
  %34 = atomicrmw add i64* @sdmprofile__BBcounter_14, i64 1 seq_cst, !dbg !725
  %35 = load double* %ct, align 8, !dbg !725
  store double %35, double* %cmax, align 8, !dbg !725
  %36 = load i32* %i, align 4, !dbg !727
  store i32 %36, i32* %cmaxix, align 4, !dbg !727
  br label %if.end24, !dbg !728

if.end24:                                         ; preds = %if.then23, %if.end20
  %37 = atomicrmw add i64* @sdmprofile__BBcounter_15, i64 1 seq_cst, !dbg !729
  %38 = load i32* %i, align 4, !dbg !729
  %idxprom25 = sext i32 %38 to i64, !dbg !729
  %arrayidx26 = getelementptr inbounds [7 x i8*]* @main.text, i32 0, i64 %idxprom25, !dbg !729
  %39 = load i8** %arrayidx26, align 8, !dbg !729
  %40 = load double* %ct, align 8, !dbg !729
  %41 = load i64* %n, align 8, !dbg !729
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str913, i32 0, i32 0), i8* %39, double %40, i64 %41), !dbg !729
  br label %for.inc28, !dbg !730

for.inc28:                                        ; preds = %if.end24
  %42 = atomicrmw add i64* @sdmprofile__BBcounter_16, i64 1 seq_cst, !dbg !731
  %43 = load i32* %i, align 4, !dbg !731
  %inc29 = add nsw i32 %43, 1, !dbg !731
  store i32 %inc29, i32* %i, align 4, !dbg !731
  br label %for.cond, !dbg !731

for.end30:                                        ; preds = %for.cond
  %44 = atomicrmw add i64* @sdmprofile__BBcounter_17, i64 1 seq_cst, !dbg !732
  %45 = load i32* %cminix, align 4, !dbg !732
  %idxprom31 = sext i32 %45 to i64, !dbg !732
  %arrayidx32 = getelementptr inbounds [7 x i8*]* @main.text, i32 0, i64 %idxprom31, !dbg !732
  %46 = load i8** %arrayidx32, align 8, !dbg !732
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str1014, i32 0, i32 0), i8* %46), !dbg !732
  %47 = load i32* %cmaxix, align 4, !dbg !733
  %idxprom34 = sext i32 %47 to i64, !dbg !733
  %arrayidx35 = getelementptr inbounds [7 x i8*]* @main.text, i32 0, i64 %idxprom34, !dbg !733
  %48 = load i8** %arrayidx35, align 8, !dbg !733
  %call36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1115, i32 0, i32 0), i8* %48), !dbg !733
  ret i32 0, !dbg !734
}

; Function Attrs: nounwind uwtable
define i32 @ntbl_bitcnt(i64 %x, i32 %sdmprofile__threadnumber) #11 {
entry:
  %x.addr = alloca i64, align 8
  %cnt = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i64 %x, i64* %x.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_66, i64 1 seq_cst, !dbg !735
  call void @llvm.dbg.declare(metadata !{i64* %x.addr}, metadata !736), !dbg !735
  call void @llvm.dbg.declare(metadata !{i32* %cnt}, metadata !737), !dbg !738
  %1 = load i64* %x.addr, align 8, !dbg !739
  %and = and i64 %1, 15, !dbg !739
  %conv = trunc i64 %and to i32, !dbg !739
  %idxprom = sext i32 %conv to i64, !dbg !739
  %arrayidx = getelementptr inbounds [256 x i8]* @bits1, i32 0, i64 %idxprom, !dbg !739
  %2 = load i8* %arrayidx, align 1, !dbg !739
  %conv1 = sext i8 %2 to i32, !dbg !739
  store i32 %conv1, i32* %cnt, align 4, !dbg !739
  %3 = load i64* %x.addr, align 8, !dbg !740
  %shr = ashr i64 %3, 4, !dbg !740
  store i64 %shr, i64* %x.addr, align 8, !dbg !740
  %cmp = icmp ne i64 0, %shr, !dbg !740
  br i1 %cmp, label %if.then, label %if.end, !dbg !740

if.then:                                          ; preds = %entry
  %4 = atomicrmw add i64* @sdmprofile__BBcounter_67, i64 1 seq_cst, !dbg !742
  %5 = load i64* %x.addr, align 8, !dbg !742
  %sdmprofile__LD2 = load i32* %sdmprofile__threadnumber_st, align 8
  %6 = call i32 @ntbl_bitcnt(i64 %5, i32 %sdmprofile__LD2), !dbg !742
  %7 = load i32* %cnt, align 4, !dbg !742
  %add = add nsw i32 %7, %6, !dbg !742
  store i32 %add, i32* %cnt, align 4, !dbg !742
  br label %if.end, !dbg !742

if.end:                                           ; preds = %if.then, %entry
  %8 = atomicrmw add i64* @sdmprofile__BBcounter_68, i64 1 seq_cst, !dbg !743
  %9 = load i32* %cnt, align 4, !dbg !743
  ret i32 %9, !dbg !743
}

; Function Attrs: nounwind uwtable
define i32 @ntbl_bitcount(i64 %x, i32 %sdmprofile__threadnumber) #11 {
entry:
  %x.addr = alloca i64, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i64 %x, i64* %x.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_69, i64 1 seq_cst, !dbg !744
  call void @llvm.dbg.declare(metadata !{i64* %x.addr}, metadata !745), !dbg !744
  %1 = load i64* %x.addr, align 8, !dbg !746
  %and = and i64 %1, 15, !dbg !746
  %conv = trunc i64 %and to i32, !dbg !746
  %idxprom = sext i32 %conv to i64, !dbg !746
  %arrayidx = getelementptr inbounds [256 x i8]* @bits, i32 0, i64 %idxprom, !dbg !746
  %2 = load i8* %arrayidx, align 1, !dbg !746
  %conv1 = sext i8 %2 to i32, !dbg !746
  %3 = load i64* %x.addr, align 8, !dbg !746
  %and2 = and i64 %3, 240, !dbg !746
  %shr = lshr i64 %and2, 4, !dbg !746
  %conv3 = trunc i64 %shr to i32, !dbg !746
  %idxprom4 = sext i32 %conv3 to i64, !dbg !746
  %arrayidx5 = getelementptr inbounds [256 x i8]* @bits, i32 0, i64 %idxprom4, !dbg !746
  %4 = load i8* %arrayidx5, align 1, !dbg !746
  %conv6 = sext i8 %4 to i32, !dbg !746
  %add = add nsw i32 %conv1, %conv6, !dbg !746
  %5 = load i64* %x.addr, align 8, !dbg !746
  %and7 = and i64 %5, 3840, !dbg !746
  %shr8 = lshr i64 %and7, 8, !dbg !746
  %conv9 = trunc i64 %shr8 to i32, !dbg !746
  %idxprom10 = sext i32 %conv9 to i64, !dbg !746
  %arrayidx11 = getelementptr inbounds [256 x i8]* @bits, i32 0, i64 %idxprom10, !dbg !746
  %6 = load i8* %arrayidx11, align 1, !dbg !746
  %conv12 = sext i8 %6 to i32, !dbg !746
  %add13 = add nsw i32 %add, %conv12, !dbg !746
  %7 = load i64* %x.addr, align 8, !dbg !746
  %and14 = and i64 %7, 61440, !dbg !746
  %shr15 = lshr i64 %and14, 12, !dbg !746
  %conv16 = trunc i64 %shr15 to i32, !dbg !746
  %idxprom17 = sext i32 %conv16 to i64, !dbg !746
  %arrayidx18 = getelementptr inbounds [256 x i8]* @bits, i32 0, i64 %idxprom17, !dbg !746
  %8 = load i8* %arrayidx18, align 1, !dbg !746
  %conv19 = sext i8 %8 to i32, !dbg !746
  %add20 = add nsw i32 %add13, %conv19, !dbg !746
  %9 = load i64* %x.addr, align 8, !dbg !746
  %and21 = and i64 %9, 983040, !dbg !746
  %shr22 = lshr i64 %and21, 16, !dbg !746
  %conv23 = trunc i64 %shr22 to i32, !dbg !746
  %idxprom24 = sext i32 %conv23 to i64, !dbg !746
  %arrayidx25 = getelementptr inbounds [256 x i8]* @bits, i32 0, i64 %idxprom24, !dbg !746
  %10 = load i8* %arrayidx25, align 1, !dbg !746
  %conv26 = sext i8 %10 to i32, !dbg !746
  %add27 = add nsw i32 %add20, %conv26, !dbg !746
  %11 = load i64* %x.addr, align 8, !dbg !746
  %and28 = and i64 %11, 15728640, !dbg !746
  %shr29 = lshr i64 %and28, 20, !dbg !746
  %conv30 = trunc i64 %shr29 to i32, !dbg !746
  %idxprom31 = sext i32 %conv30 to i64, !dbg !746
  %arrayidx32 = getelementptr inbounds [256 x i8]* @bits, i32 0, i64 %idxprom31, !dbg !746
  %12 = load i8* %arrayidx32, align 1, !dbg !746
  %conv33 = sext i8 %12 to i32, !dbg !746
  %add34 = add nsw i32 %add27, %conv33, !dbg !746
  %13 = load i64* %x.addr, align 8, !dbg !746
  %and35 = and i64 %13, 251658240, !dbg !746
  %shr36 = lshr i64 %and35, 24, !dbg !746
  %conv37 = trunc i64 %shr36 to i32, !dbg !746
  %idxprom38 = sext i32 %conv37 to i64, !dbg !746
  %arrayidx39 = getelementptr inbounds [256 x i8]* @bits, i32 0, i64 %idxprom38, !dbg !746
  %14 = load i8* %arrayidx39, align 1, !dbg !746
  %conv40 = sext i8 %14 to i32, !dbg !746
  %add41 = add nsw i32 %add34, %conv40, !dbg !746
  %15 = load i64* %x.addr, align 8, !dbg !746
  %and42 = and i64 %15, 4026531840, !dbg !746
  %shr43 = lshr i64 %and42, 28, !dbg !746
  %conv44 = trunc i64 %shr43 to i32, !dbg !746
  %idxprom45 = sext i32 %conv44 to i64, !dbg !746
  %arrayidx46 = getelementptr inbounds [256 x i8]* @bits, i32 0, i64 %idxprom45, !dbg !746
  %16 = load i8* %arrayidx46, align 1, !dbg !746
  %conv47 = sext i8 %16 to i32, !dbg !746
  %add48 = add nsw i32 %add41, %conv47, !dbg !746
  ret i32 %add48, !dbg !746
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
  store i64 70, i64* @sdmprofile__BBcount
  store i32 0, i32* @sdmprofile__IncludeStackProfiling
  call void @sdmprofile__StartProfiling_Processes()
  call void @sdmprofile__Embed_metadata_GV(i64 1, i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([5 x i8]* @sdmprofile__GV_Name_.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @sdmprofile__GV_Type_.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 2, i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str1, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @sdmprofile__GV_Type_.str1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str1, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 3, i8* getelementptr inbounds ([43 x i8]* @.str10, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([7 x i8]* @sdmprofile__GV_Name_.str10, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @sdmprofile__GV_Type_.str10, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str10, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str10, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 4, i8* getelementptr inbounds ([18 x i8]* @.str11, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([7 x i8]* @sdmprofile__GV_Name_.str11, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @sdmprofile__GV_Type_.str11, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str11, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str11, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 5, i8* getelementptr inbounds ([28 x i8]* @.str12, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([7 x i8]* @sdmprofile__GV_Name_.str12, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @sdmprofile__GV_Type_.str12, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str12, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str12, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 6, i8* getelementptr inbounds ([31 x i8]* @.str2, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str2, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @sdmprofile__GV_Type_.str2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str2, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 7, i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str3, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @sdmprofile__GV_Type_.str3, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str3, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str3, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 8, i8* getelementptr inbounds ([100 x i8]* @.str4, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str4, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @sdmprofile__GV_Type_.str4, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str4, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str4, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 9, i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str5, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @sdmprofile__GV_Type_.str5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str5, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 10, i8* getelementptr inbounds ([4 x i8]* @.str6, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str6, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @sdmprofile__GV_Type_.str6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str6, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 11, i8* getelementptr inbounds ([124 x i8]* @.str7, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str7, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @sdmprofile__GV_Type_.str7, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str7, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str7, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 12, i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str8, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @sdmprofile__GV_Type_.str8, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str8, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str8, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 13, i8* getelementptr inbounds ([171 x i8]* @.str9, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_.str9, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @sdmprofile__GV_Type_.str9, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_.str9, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_.str9, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 14, i8* getelementptr inbounds ([256 x i8]* @bits, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([5 x i8]* @sdmprofile__GV_Name_bits, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @sdmprofile__GV_Type_bits, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @sdmprofile__GV_FileName_bits, i32 0, i32 0), i8* getelementptr inbounds ([56 x i8]* @sdmprofile__GV_FileDir_bits, i32 0, i32 0), i64 15)
  call void @sdmprofile__Embed_metadata_GV(i64 15, i8* getelementptr inbounds ([256 x i8]* @bits1, i32 0, i32 0), i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__GV_Name_bits1, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @sdmprofile__GV_Type_bits1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_bits1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_bits1, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 16, i8* bitcast ([7 x i32 (i64)*]* @main.pBitCntFunc to i8*), i32 8, i8* getelementptr inbounds ([17 x i8]* @sdmprofile__GV_Name_main.pBitCntFunc, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @sdmprofile__GV_Type_main.pBitCntFunc, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_main.pBitCntFunc, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_main.pBitCntFunc, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 17, i8* bitcast ([7 x i8*]* @main.text to i8*), i32 8, i8* getelementptr inbounds ([10 x i8]* @sdmprofile__GV_Name_main.text, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @sdmprofile__GV_Type_main.text, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_main.text, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_main.text, i32 0, i32 0), i64 0)
  call void @sdmprofile__Embed_metadata_GV(i64 18, i8* bitcast (%struct._IO_FILE.1** @stderr to i8*), i32 8, i8* getelementptr inbounds ([7 x i8]* @sdmprofile__GV_Name_stderr, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8]* @sdmprofile__GV_Type_stderr, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileName_stderr, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @sdmprofile__GV_FileDir_stderr, i32 0, i32 0), i64 0)
  %1 = load i32* %argc_ptr, align 4
  %2 = load i8*** %argv_ptr, align 8
  %3 = load i32* @sdmprofile__MainthreadNumber, align 4
  %4 = call i32 @app__mainfunction__(i32 %1, i8** %2, i32 %3)
  store i32 %4, i32* %rtn, align 4
  call void @sdmprofile__PrintResultBeforeAddingBBcount()
  %5 = load i64* @sdmprofile__BBcounter_1
  call void @sdmprofile__BBHit(i64 1, i64 %5)
  %6 = load i64* @sdmprofile__BBcounter_1
  call void @sdmprofile__AddBBHitcount_GV(i64 14, i64 %6, i32 4, i32 0)
  %7 = load i64* @sdmprofile__BBcounter_2
  call void @sdmprofile__BBHit(i64 2, i64 %7)
  %8 = load i64* @sdmprofile__BBcounter_2
  call void @sdmprofile__AddBBHitcount_GV(i64 14, i64 %8, i32 4, i32 0)
  %9 = load i64* @sdmprofile__BBcounter_3
  call void @sdmprofile__BBHit(i64 3, i64 %9)
  %10 = load i64* @sdmprofile__BBcounter_4
  call void @sdmprofile__BBHit(i64 4, i64 %10)
  %11 = load i64* @sdmprofile__BBcounter_4
  call void @sdmprofile__AddBBHitcount_GV(i64 18, i64 %11, i32 1, i32 0)
  %12 = load i64* @sdmprofile__BBcounter_5
  call void @sdmprofile__BBHit(i64 5, i64 %12)
  %13 = load i64* @sdmprofile__BBcounter_6
  call void @sdmprofile__BBHit(i64 6, i64 %13)
  %14 = load i64* @sdmprofile__BBcounter_7
  call void @sdmprofile__BBHit(i64 7, i64 %14)
  %15 = load i64* @sdmprofile__BBcounter_8
  call void @sdmprofile__BBHit(i64 8, i64 %15)
  %16 = load i64* @sdmprofile__BBcounter_9
  call void @sdmprofile__BBHit(i64 9, i64 %16)
  %17 = load i64* @sdmprofile__BBcounter_9
  call void @sdmprofile__AddBBHitcount_GV(i64 16, i64 %17, i32 1, i32 0)
  %18 = load i64* @sdmprofile__BBcounter_10
  call void @sdmprofile__BBHit(i64 10, i64 %18)
  %19 = load i64* @sdmprofile__BBcounter_11
  call void @sdmprofile__BBHit(i64 11, i64 %19)
  %20 = load i64* @sdmprofile__BBcounter_12
  call void @sdmprofile__BBHit(i64 12, i64 %20)
  %21 = load i64* @sdmprofile__BBcounter_13
  call void @sdmprofile__BBHit(i64 13, i64 %21)
  %22 = load i64* @sdmprofile__BBcounter_14
  call void @sdmprofile__BBHit(i64 14, i64 %22)
  %23 = load i64* @sdmprofile__BBcounter_15
  call void @sdmprofile__BBHit(i64 15, i64 %23)
  %24 = load i64* @sdmprofile__BBcounter_15
  call void @sdmprofile__AddBBHitcount_GV(i64 17, i64 %24, i32 1, i32 0)
  %25 = load i64* @sdmprofile__BBcounter_16
  call void @sdmprofile__BBHit(i64 16, i64 %25)
  %26 = load i64* @sdmprofile__BBcounter_17
  call void @sdmprofile__BBHit(i64 17, i64 %26)
  %27 = load i64* @sdmprofile__BBcounter_17
  call void @sdmprofile__AddBBHitcount_GV(i64 17, i64 %27, i32 2, i32 0)
  %28 = load i64* @sdmprofile__BBcounter_18
  call void @sdmprofile__BBHit(i64 18, i64 %28)
  %29 = load i64* @sdmprofile__BBcounter_19
  call void @sdmprofile__BBHit(i64 19, i64 %29)
  %30 = load i64* @sdmprofile__BBcounter_20
  call void @sdmprofile__BBHit(i64 20, i64 %30)
  %31 = load i64* @sdmprofile__BBcounter_21
  call void @sdmprofile__BBHit(i64 21, i64 %31)
  %32 = load i64* @sdmprofile__BBcounter_22
  call void @sdmprofile__BBHit(i64 22, i64 %32)
  %33 = load i64* @sdmprofile__BBcounter_23
  call void @sdmprofile__BBHit(i64 23, i64 %33)
  %34 = load i64* @sdmprofile__BBcounter_24
  call void @sdmprofile__BBHit(i64 24, i64 %34)
  %35 = load i64* @sdmprofile__BBcounter_25
  call void @sdmprofile__BBHit(i64 25, i64 %35)
  %36 = load i64* @sdmprofile__BBcounter_26
  call void @sdmprofile__BBHit(i64 26, i64 %36)
  %37 = load i64* @sdmprofile__BBcounter_27
  call void @sdmprofile__BBHit(i64 27, i64 %37)
  %38 = load i64* @sdmprofile__BBcounter_28
  call void @sdmprofile__BBHit(i64 28, i64 %38)
  %39 = load i64* @sdmprofile__BBcounter_29
  call void @sdmprofile__BBHit(i64 29, i64 %39)
  %40 = load i64* @sdmprofile__BBcounter_30
  call void @sdmprofile__BBHit(i64 30, i64 %40)
  %41 = load i64* @sdmprofile__BBcounter_31
  call void @sdmprofile__BBHit(i64 31, i64 %41)
  %42 = load i64* @sdmprofile__BBcounter_32
  call void @sdmprofile__BBHit(i64 32, i64 %42)
  %43 = load i64* @sdmprofile__BBcounter_33
  call void @sdmprofile__BBHit(i64 33, i64 %43)
  %44 = load i64* @sdmprofile__BBcounter_34
  call void @sdmprofile__BBHit(i64 34, i64 %44)
  %45 = load i64* @sdmprofile__BBcounter_35
  call void @sdmprofile__BBHit(i64 35, i64 %45)
  %46 = load i64* @sdmprofile__BBcounter_36
  call void @sdmprofile__BBHit(i64 36, i64 %46)
  %47 = load i64* @sdmprofile__BBcounter_37
  call void @sdmprofile__BBHit(i64 37, i64 %47)
  %48 = load i64* @sdmprofile__BBcounter_38
  call void @sdmprofile__BBHit(i64 38, i64 %48)
  %49 = load i64* @sdmprofile__BBcounter_39
  call void @sdmprofile__BBHit(i64 39, i64 %49)
  %50 = load i64* @sdmprofile__BBcounter_40
  call void @sdmprofile__BBHit(i64 40, i64 %50)
  %51 = load i64* @sdmprofile__BBcounter_41
  call void @sdmprofile__BBHit(i64 41, i64 %51)
  %52 = load i64* @sdmprofile__BBcounter_42
  call void @sdmprofile__BBHit(i64 42, i64 %52)
  %53 = load i64* @sdmprofile__BBcounter_43
  call void @sdmprofile__BBHit(i64 43, i64 %53)
  %54 = load i64* @sdmprofile__BBcounter_44
  call void @sdmprofile__BBHit(i64 44, i64 %54)
  %55 = load i64* @sdmprofile__BBcounter_45
  call void @sdmprofile__BBHit(i64 45, i64 %55)
  %56 = load i64* @sdmprofile__BBcounter_46
  call void @sdmprofile__BBHit(i64 46, i64 %56)
  %57 = load i64* @sdmprofile__BBcounter_47
  call void @sdmprofile__BBHit(i64 47, i64 %57)
  %58 = load i64* @sdmprofile__BBcounter_48
  call void @sdmprofile__BBHit(i64 48, i64 %58)
  %59 = load i64* @sdmprofile__BBcounter_49
  call void @sdmprofile__BBHit(i64 49, i64 %59)
  %60 = load i64* @sdmprofile__BBcounter_50
  call void @sdmprofile__BBHit(i64 50, i64 %60)
  %61 = load i64* @sdmprofile__BBcounter_51
  call void @sdmprofile__BBHit(i64 51, i64 %61)
  %62 = load i64* @sdmprofile__BBcounter_52
  call void @sdmprofile__BBHit(i64 52, i64 %62)
  %63 = load i64* @sdmprofile__BBcounter_53
  call void @sdmprofile__BBHit(i64 53, i64 %63)
  %64 = load i64* @sdmprofile__BBcounter_54
  call void @sdmprofile__BBHit(i64 54, i64 %64)
  %65 = load i64* @sdmprofile__BBcounter_55
  call void @sdmprofile__BBHit(i64 55, i64 %65)
  %66 = load i64* @sdmprofile__BBcounter_56
  call void @sdmprofile__BBHit(i64 56, i64 %66)
  %67 = load i64* @sdmprofile__BBcounter_57
  call void @sdmprofile__BBHit(i64 57, i64 %67)
  %68 = load i64* @sdmprofile__BBcounter_58
  call void @sdmprofile__BBHit(i64 58, i64 %68)
  %69 = load i64* @sdmprofile__BBcounter_59
  call void @sdmprofile__BBHit(i64 59, i64 %69)
  %70 = load i64* @sdmprofile__BBcounter_60
  call void @sdmprofile__BBHit(i64 60, i64 %70)
  %71 = load i64* @sdmprofile__BBcounter_61
  call void @sdmprofile__BBHit(i64 61, i64 %71)
  %72 = load i64* @sdmprofile__BBcounter_62
  call void @sdmprofile__BBHit(i64 62, i64 %72)
  %73 = load i64* @sdmprofile__BBcounter_63
  call void @sdmprofile__BBHit(i64 63, i64 %73)
  %74 = load i64* @sdmprofile__BBcounter_63
  call void @sdmprofile__AddBBHitcount_GV(i64 15, i64 %74, i32 1, i32 0)
  %75 = load i64* @sdmprofile__BBcounter_64
  call void @sdmprofile__BBHit(i64 64, i64 %75)
  %76 = load i64* @sdmprofile__BBcounter_65
  call void @sdmprofile__BBHit(i64 65, i64 %76)
  %77 = load i64* @sdmprofile__BBcounter_66
  call void @sdmprofile__BBHit(i64 66, i64 %77)
  %78 = load i64* @sdmprofile__BBcounter_66
  call void @sdmprofile__AddBBHitcount_GV(i64 15, i64 %78, i32 1, i32 0)
  %79 = load i64* @sdmprofile__BBcounter_67
  call void @sdmprofile__BBHit(i64 67, i64 %79)
  %80 = load i64* @sdmprofile__BBcounter_68
  call void @sdmprofile__BBHit(i64 68, i64 %80)
  %81 = load i64* @sdmprofile__BBcounter_69
  call void @sdmprofile__BBHit(i64 69, i64 %81)
  %82 = load i64* @sdmprofile__BBcounter_69
  call void @sdmprofile__AddBBHitcount_GV(i64 14, i64 %82, i32 8, i32 0)
  call void @sdmprofile__EndProfiling_Processes()
  %83 = load i32* %rtn, align 4
  ret i32 %83
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
attributes #13 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #16 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #17 = { cold }
attributes #18 = { nounwind readonly }
attributes #19 = { noreturn nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.dbg.cu = !{!1, !11, !16, !29, !37, !55, !140, !147}
!llvm.module.flags = !{!155, !156}

!0 = metadata !{metadata !"clang version 3.5.1 (tags/RELEASE_351/final)"}
!1 = metadata !{i32 786449, metadata !2, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !4, metadata !3, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnt_1.c] [DW_LANG_C99]
!2 = metadata !{metadata !"bitcnt_1.c", metadata !"/home/sslee/work/regen/test/mibench/automotive/bitcount"}
!3 = metadata !{}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"bit_count", metadata !"bit_count", metadata !"", i32 9, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i64)* @bit_count_original, null, null, metadata !3, i32 10} ; [ DW_TAG_subprogram ] [line 9] [def] [scope 10] [bit_count]
!6 = metadata !{i32 786473, metadata !2}          ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnt_1.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!11 = metadata !{i32 786449, metadata !12, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !13, metadata !3, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnt_2.c] [DW_LANG_C99]
!12 = metadata !{metadata !"bitcnt_2.c", metadata !"/home/sslee/work/regen/test/mibench/automotive/bitcount"}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 786478, metadata !12, metadata !15, metadata !"bitcount", metadata !"bitcount", metadata !"", i32 9, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i64)* @bitcount_original, null, null, metadata !3, i32 10} ; [ DW_TAG_subprogram ] [line 9] [def] [scope 10] [bitcount]
!15 = metadata !{i32 786473, metadata !12}        ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnt_2.c]
!16 = metadata !{i32 786449, metadata !17, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !18, metadata !23, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnt_3.c] [DW_LANG_C99]
!17 = metadata !{metadata !"bitcnt_3.c", metadata !"/home/sslee/work/regen/test/mibench/automotive/bitcount"}
!18 = metadata !{metadata !19, metadata !21, metadata !22}
!19 = metadata !{i32 786478, metadata !17, metadata !20, metadata !"ntbl_bitcount", metadata !"ntbl_bitcount", metadata !"", i32 42, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i64)* @ntbl_bitcount_original, null, null, metadata !3, i32 43} ; [ DW_TAG_subprogram ] [line 42] [def] [scope 43] [ntbl_bitcount]
!20 = metadata !{i32 786473, metadata !17}        ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnt_3.c]
!21 = metadata !{i32 786478, metadata !17, metadata !20, metadata !"BW_btbl_bitcount", metadata !"BW_btbl_bitcount", metadata !"", i32 61, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i64)* @BW_btbl_bitcount_original, null, null, metadata !3, i32 62} ; [ DW_TAG_subprogram ] [line 61] [def] [scope 62] [BW_btbl_bitcount]
!22 = metadata !{i32 786478, metadata !17, metadata !20, metadata !"AR_btbl_bitcount", metadata !"AR_btbl_bitcount", metadata !"", i32 81, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i64)* @AR_btbl_bitcount_original, null, null, metadata !3, i32 82} ; [ DW_TAG_subprogram ] [line 81] [def] [scope 82] [AR_btbl_bitcount]
!23 = metadata !{metadata !24}
!24 = metadata !{i32 786484, i32 0, null, metadata !"bits", metadata !"bits", metadata !"", metadata !20, i32 15, metadata !25, i32 1, i32 1, [256 x i8]* @bits, null} ; [ DW_TAG_variable ] [bits] [line 15] [local] [def]
!25 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !26, metadata !27, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!26 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!27 = metadata !{metadata !28}
!28 = metadata !{i32 786465, i64 0, i64 256}      ; [ DW_TAG_subrange_type ] [0, 255]
!29 = metadata !{i32 786449, metadata !30, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !31, metadata !35, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnt_4.c] [DW_LANG_C99]
!30 = metadata !{metadata !"bitcnt_4.c", metadata !"/home/sslee/work/regen/test/mibench/automotive/bitcount"}
!31 = metadata !{metadata !32, metadata !34}
!32 = metadata !{i32 786478, metadata !30, metadata !33, metadata !"ntbl_bitcnt", metadata !"ntbl_bitcnt", metadata !"", i32 38, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i64)* @ntbl_bitcnt_original, null, null, metadata !3, i32 39} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [ntbl_bitcnt]
!33 = metadata !{i32 786473, metadata !30}        ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnt_4.c]
!34 = metadata !{i32 786478, metadata !30, metadata !33, metadata !"btbl_bitcnt", metadata !"btbl_bitcnt", metadata !"", i32 52, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i64)* @btbl_bitcnt_original, null, null, metadata !3, i32 53} ; [ DW_TAG_subprogram ] [line 52] [def] [scope 53] [btbl_bitcnt]
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786484, i32 0, null, metadata !"bits", metadata !"bits", metadata !"", metadata !33, i32 11, metadata !25, i32 1, i32 1, [256 x i8]* @bits1, null} ; [ DW_TAG_variable ] [bits] [line 11] [local] [def]
!37 = metadata !{i32 786449, metadata !38, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !39, metadata !47, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c] [DW_LANG_C99]
!38 = metadata !{metadata !"bitcnts.c", metadata !"/home/sslee/work/regen/test/mibench/automotive/bitcount"}
!39 = metadata !{metadata !40, metadata !46}
!40 = metadata !{i32 786478, metadata !38, metadata !41, metadata !"main", metadata !"main", metadata !"", i32 21, metadata !42, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main_original, null, null, metadata !3, i32 22} ; [ DW_TAG_subprogram ] [line 21] [def] [scope 22] [main]
!41 = metadata !{i32 786473, metadata !38}        ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!42 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !43, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = metadata !{metadata !9, metadata !9, metadata !44}
!44 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !45} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!45 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !26} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!46 = metadata !{i32 786478, metadata !38, metadata !41, metadata !"bit_shifter", metadata !"bit_shifter", metadata !"", i32 80, metadata !7, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i64)* @bit_shifter_original, null, null, metadata !3, i32 81} ; [ DW_TAG_subprogram ] [line 80] [local] [def] [scope 81] [bit_shifter]
!47 = metadata !{metadata !48, metadata !53}
!48 = metadata !{i32 786484, i32 0, metadata !40, metadata !"pBitCntFunc", metadata !"pBitCntFunc", metadata !"", metadata !41, i32 28, metadata !49, i32 1, i32 1, [7 x i32 (i64)*]* @main.pBitCntFunc, null} ; [ DW_TAG_variable ] [pBitCntFunc] [line 28] [local] [def]
!49 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 448, i64 64, i32 0, i32 0, metadata !50, metadata !51, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 448, align 64, offset 0] [from ]
!50 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!51 = metadata !{metadata !52}
!52 = metadata !{i32 786465, i64 0, i64 7}        ; [ DW_TAG_subrange_type ] [0, 6]
!53 = metadata !{i32 786484, i32 0, metadata !40, metadata !"text", metadata !"text", metadata !"", metadata !41, i32 38, metadata !54, i32 1, i32 1, [7 x i8*]* @main.text, null} ; [ DW_TAG_variable ] [text] [line 38] [local] [def]
!54 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 448, i64 64, i32 0, i32 0, metadata !45, metadata !51, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 448, align 64, offset 0] [from ]
!55 = metadata !{i32 786449, metadata !56, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !57, metadata !3, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitfiles.c] [DW_LANG_C99]
!56 = metadata !{metadata !"bitfiles.c", metadata !"/home/sslee/work/regen/test/mibench/automotive/bitcount"}
!57 = metadata !{metadata !58, metadata !131, metadata !134, metadata !137}
!58 = metadata !{i32 786478, metadata !56, metadata !59, metadata !"bfopen", metadata !"bfopen", metadata !"", i32 12, metadata !60, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.bfile.2* (i8*, i8*)* @bfopen_original, null, null, metadata !3, i32 13} ; [ DW_TAG_subprogram ] [line 12] [def] [scope 13] [bfopen]
!59 = metadata !{i32 786473, metadata !56}        ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitfiles.c]
!60 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !61, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = metadata !{metadata !62, metadata !45, metadata !45}
!62 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !63} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from bfile]
!63 = metadata !{i32 786454, metadata !64, null, metadata !"bfile", i32 66, i64 0, i64 0, i64 0, i32 0, metadata !65} ; [ DW_TAG_typedef ] [bfile] [line 66, size 0, align 0, offset 0] [from ]
!64 = metadata !{metadata !"./bitops.h", metadata !"/home/sslee/work/regen/test/mibench/automotive/bitcount"}
!65 = metadata !{i32 786451, metadata !64, null, metadata !"", i32 60, i64 128, i64 64, i32 0, i32 0, null, metadata !66, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 60, size 128, align 64, offset 0] [def] [from ]
!66 = metadata !{metadata !67, metadata !127, metadata !128, metadata !129, metadata !130}
!67 = metadata !{i32 786445, metadata !64, metadata !65, metadata !"file", i32 61, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [file] [line 61, size 64, align 64, offset 0] [from ]
!68 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !69} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!69 = metadata !{i32 786454, metadata !70, null, metadata !"FILE", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!70 = metadata !{metadata !"/usr/include/stdio.h", metadata !"/home/sslee/work/regen/test/mibench/automotive/bitcount"}
!71 = metadata !{i32 786451, metadata !72, null, metadata !"_IO_FILE", i32 245, i64 1728, i64 64, i32 0, i32 0, null, metadata !73, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!72 = metadata !{metadata !"/usr/include/libio.h", metadata !"/home/sslee/work/regen/test/mibench/automotive/bitcount"}
!73 = metadata !{metadata !74, metadata !75, metadata !76, metadata !77, metadata !78, metadata !79, metadata !80, metadata !81, metadata !82, metadata !83, metadata !84, metadata !85, metadata !86, metadata !94, metadata !95, metadata !96, metadata !97, metadata !100, metadata !102, metadata !104, metadata !108, metadata !111, metadata !113, metadata !115, metadata !116, metadata !117, metadata !118, metadata !122, metadata !123}
!74 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_flags", i32 246, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!75 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_IO_read_ptr", i32 251, i64 64, i64 64, i64 64, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!76 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_IO_read_end", i32 252, i64 64, i64 64, i64 128, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!77 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_IO_read_base", i32 253, i64 64, i64 64, i64 192, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!78 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_IO_write_base", i32 254, i64 64, i64 64, i64 256, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!79 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_IO_write_ptr", i32 255, i64 64, i64 64, i64 320, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!80 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_IO_write_end", i32 256, i64 64, i64 64, i64 384, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!81 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_IO_buf_base", i32 257, i64 64, i64 64, i64 448, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!82 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_IO_buf_end", i32 258, i64 64, i64 64, i64 512, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!83 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_IO_save_base", i32 260, i64 64, i64 64, i64 576, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!84 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_IO_backup_base", i32 261, i64 64, i64 64, i64 640, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!85 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_IO_save_end", i32 262, i64 64, i64 64, i64 704, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!86 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_markers", i32 264, i64 64, i64 64, i64 768, i32 0, metadata !87} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!87 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !88} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!88 = metadata !{i32 786451, metadata !72, null, metadata !"_IO_marker", i32 160, i64 192, i64 64, i32 0, i32 0, null, metadata !89, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [def] [from ]
!89 = metadata !{metadata !90, metadata !91, metadata !93}
!90 = metadata !{i32 786445, metadata !72, metadata !88, metadata !"_next", i32 161, i64 64, i64 64, i64 0, i32 0, metadata !87} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!91 = metadata !{i32 786445, metadata !72, metadata !88, metadata !"_sbuf", i32 162, i64 64, i64 64, i64 64, i32 0, metadata !92} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!92 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !71} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!93 = metadata !{i32 786445, metadata !72, metadata !88, metadata !"_pos", i32 166, i64 32, i64 32, i64 128, i32 0, metadata !9} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!94 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_chain", i32 266, i64 64, i64 64, i64 832, i32 0, metadata !92} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!95 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_fileno", i32 268, i64 32, i64 32, i64 896, i32 0, metadata !9} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!96 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_flags2", i32 272, i64 32, i64 32, i64 928, i32 0, metadata !9} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!97 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_old_offset", i32 274, i64 64, i64 64, i64 960, i32 0, metadata !98} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!98 = metadata !{i32 786454, metadata !99, null, metadata !"__off_t", i32 131, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!99 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/sslee/work/regen/test/mibench/automotive/bitcount"}
!100 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_cur_column", i32 278, i64 16, i64 16, i64 1024, i32 0, metadata !101} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!101 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!102 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_vtable_offset", i32 279, i64 8, i64 8, i64 1040, i32 0, metadata !103} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!103 = metadata !{i32 786468, null, null, metadata !"signed char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!104 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_shortbuf", i32 280, i64 8, i64 8, i64 1048, i32 0, metadata !105} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!105 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8, i64 8, i32 0, i32 0, metadata !26, metadata !106, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!106 = metadata !{metadata !107}
!107 = metadata !{i32 786465, i64 0, i64 1}       ; [ DW_TAG_subrange_type ] [0, 0]
!108 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_lock", i32 284, i64 64, i64 64, i64 1088, i32 0, metadata !109} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!109 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !110} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_lock_t]
!110 = metadata !{i32 786454, metadata !72, null, metadata !"_IO_lock_t", i32 154, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_typedef ] [_IO_lock_t] [line 154, size 0, align 0, offset 0] [from ]
!111 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_offset", i32 293, i64 64, i64 64, i64 1152, i32 0, metadata !112} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!112 = metadata !{i32 786454, metadata !99, null, metadata !"__off64_t", i32 132, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!113 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"__pad1", i32 302, i64 64, i64 64, i64 1216, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!114 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!115 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"__pad2", i32 303, i64 64, i64 64, i64 1280, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!116 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"__pad3", i32 304, i64 64, i64 64, i64 1344, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!117 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"__pad4", i32 305, i64 64, i64 64, i64 1408, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!118 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"__pad5", i32 306, i64 64, i64 64, i64 1472, i32 0, metadata !119} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!119 = metadata !{i32 786454, metadata !120, null, metadata !"size_t", i32 58, i64 0, i64 0, i64 0, i32 0, metadata !121} ; [ DW_TAG_typedef ] [size_t] [line 58, size 0, align 0, offset 0] [from long unsigned int]
!120 = metadata !{metadata !"/usr/local/bin/../lib/clang/3.5.1/include/stddef.h", metadata !"/home/sslee/work/regen/test/mibench/automotive/bitcount"}
!121 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!122 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_mode", i32 308, i64 32, i64 32, i64 1536, i32 0, metadata !9} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!123 = metadata !{i32 786445, metadata !72, metadata !71, metadata !"_unused2", i32 310, i64 160, i64 8, i64 1568, i32 0, metadata !124} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!124 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160, i64 8, i32 0, i32 0, metadata !26, metadata !125, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!125 = metadata !{metadata !126}
!126 = metadata !{i32 786465, i64 0, i64 20}      ; [ DW_TAG_subrange_type ] [0, 19]
!127 = metadata !{i32 786445, metadata !64, metadata !65, metadata !"rbuf", i32 62, i64 8, i64 8, i64 64, i32 0, metadata !26} ; [ DW_TAG_member ] [rbuf] [line 62, size 8, align 8, offset 64] [from char]
!128 = metadata !{i32 786445, metadata !64, metadata !65, metadata !"rcnt", i32 63, i64 8, i64 8, i64 72, i32 0, metadata !26} ; [ DW_TAG_member ] [rcnt] [line 63, size 8, align 8, offset 72] [from char]
!129 = metadata !{i32 786445, metadata !64, metadata !65, metadata !"wbuf", i32 64, i64 8, i64 8, i64 80, i32 0, metadata !26} ; [ DW_TAG_member ] [wbuf] [line 64, size 8, align 8, offset 80] [from char]
!130 = metadata !{i32 786445, metadata !64, metadata !65, metadata !"wcnt", i32 65, i64 8, i64 8, i64 88, i32 0, metadata !26} ; [ DW_TAG_member ] [wcnt] [line 65, size 8, align 8, offset 88] [from char]
!131 = metadata !{i32 786478, metadata !56, metadata !59, metadata !"bfread", metadata !"bfread", metadata !"", i32 30, metadata !132, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.bfile.2*)* @bfread_original, null, null, metadata !3, i32 31} ; [ DW_TAG_subprogram ] [line 30] [def] [scope 31] [bfread]
!132 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !133, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!133 = metadata !{metadata !9, metadata !62}
!134 = metadata !{i32 786478, metadata !56, metadata !59, metadata !"bfwrite", metadata !"bfwrite", metadata !"", i32 41, metadata !135, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, %struct.bfile.2*)* @bfwrite_original, null, null, metadata !3, i32 42} ; [ DW_TAG_subprogram ] [line 41] [def] [scope 42] [bfwrite]
!135 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !136, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!136 = metadata !{null, metadata !9, metadata !62}
!137 = metadata !{i32 786478, metadata !56, metadata !59, metadata !"bfclose", metadata !"bfclose", metadata !"", i32 53, metadata !138, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.bfile.2*)* @bfclose_original, null, null, metadata !3, i32 54} ; [ DW_TAG_subprogram ] [line 53] [def] [scope 54] [bfclose]
!138 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !139, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!139 = metadata !{null, metadata !62}
!140 = metadata !{i32 786449, metadata !141, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !142, metadata !3, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitstrng.c] [DW_LANG_C99]
!141 = metadata !{metadata !"bitstrng.c", metadata !"/home/sslee/work/regen/test/mibench/automotive/bitcount"}
!142 = metadata !{metadata !143}
!143 = metadata !{i32 786478, metadata !141, metadata !144, metadata !"bitstring", metadata !"bitstring", metadata !"", i32 31, metadata !145, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*, i64, i32, i32)* @bitstring_original, null, null, metadata !3, i32 32} ; [ DW_TAG_subprogram ] [line 31] [def] [scope 32] [bitstring]
!144 = metadata !{i32 786473, metadata !141}      ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitstrng.c]
!145 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !146, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!146 = metadata !{null, metadata !45, metadata !10, metadata !9, metadata !9}
!147 = metadata !{i32 786449, metadata !148, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !149, metadata !3, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bstr_i.c] [DW_LANG_C99]
!148 = metadata !{metadata !"bstr_i.c", metadata !"/home/sslee/work/regen/test/mibench/automotive/bitcount"}
!149 = metadata !{metadata !150}
!150 = metadata !{i32 786478, metadata !148, metadata !151, metadata !"bstr_i", metadata !"bstr_i", metadata !"", i32 12, metadata !152, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*)* @bstr_i_original, null, null, metadata !3, i32 13} ; [ DW_TAG_subprogram ] [line 12] [def] [scope 13] [bstr_i]
!151 = metadata !{i32 786473, metadata !148}      ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bstr_i.c]
!152 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !153, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!153 = metadata !{metadata !154, metadata !45}
!154 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!155 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!156 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!157 = metadata !{metadata !158, metadata !158, i64 0}
!158 = metadata !{metadata !"any pointer", metadata !159, i64 0}
!159 = metadata !{metadata !"omnipotent char", metadata !160, i64 0}
!160 = metadata !{metadata !"Simple C/C++ TBAA"}
!161 = metadata !{metadata !162, metadata !162, i64 0}
!162 = metadata !{metadata !"int", metadata !159, i64 0}
!163 = metadata !{metadata !164, metadata !158, i64 0}
!164 = metadata !{metadata !"_ZTS18HeapAllocationMeta", metadata !158, i64 0, metadata !158, i64 8, metadata !165, i64 16, metadata !162, i64 24, metadata !165, i64 32}
!165 = metadata !{metadata !"long", metadata !159, i64 0}
!166 = metadata !{metadata !167, metadata !165, i64 0}
!167 = metadata !{metadata !"_ZTS6GVMeta", metadata !165, i64 0, metadata !165, i64 8, metadata !165, i64 16, metadata !158, i64 24, metadata !162, i64 32, metadata !158, i64 40, metadata !158, i64 48, metadata !158, i64 56, metadata !158, i64 64, metadata !158, i64 72, metadata !165, i64 80}
!168 = metadata !{metadata !167, metadata !158, i64 24}
!169 = metadata !{metadata !167, metadata !162, i64 32}
!170 = metadata !{metadata !171, metadata !158, i64 0}
!171 = metadata !{metadata !"_ZTS32sdmprofile__Allocated_Stack_item", metadata !158, i64 0, metadata !165, i64 8, metadata !158, i64 16}
!172 = metadata !{metadata !171, metadata !158, i64 16}
!173 = metadata !{metadata !173, metadata !174, metadata !175}
!174 = metadata !{metadata !"llvm.loop.vectorize.width", i32 1}
!175 = metadata !{metadata !"llvm.loop.interleave.count", i32 1}
!176 = metadata !{metadata !177, metadata !177, i64 0}
!177 = metadata !{metadata !"double", metadata !159, i64 0}
!178 = metadata !{metadata !179, metadata !162, i64 0}
!179 = metadata !{metadata !"_ZTS6Thread", metadata !162, i64 0, metadata !165, i64 8, metadata !177, i64 16, metadata !177, i64 24, metadata !158, i64 32, metadata !158, i64 40, metadata !165, i64 48, metadata !165, i64 56, metadata !165, i64 64, metadata !165, i64 72, metadata !165, i64 80, metadata !165, i64 88, metadata !165, i64 96, metadata !165, i64 104, metadata !165, i64 112, metadata !165, i64 120, metadata !165, i64 128, metadata !159, i64 136, metadata !159, i64 200, metadata !158, i64 264, metadata !158, i64 272}
!180 = metadata !{metadata !179, metadata !165, i64 8}
!181 = metadata !{metadata !179, metadata !177, i64 16}
!182 = metadata !{metadata !179, metadata !177, i64 24}
!183 = metadata !{metadata !179, metadata !158, i64 264}
!184 = metadata !{metadata !185, metadata !158, i64 0}
!185 = metadata !{metadata !"_ZTS11Cache2_Item", metadata !158, i64 0, metadata !158, i64 8}
!186 = metadata !{metadata !185, metadata !158, i64 8}
!187 = metadata !{metadata !179, metadata !158, i64 272}
!188 = metadata !{metadata !189, metadata !158, i64 0}
!189 = metadata !{metadata !"_ZTS12GVCache_Item", metadata !158, i64 0, metadata !158, i64 8}
!190 = metadata !{metadata !189, metadata !158, i64 8}
!191 = metadata !{metadata !179, metadata !158, i64 32}
!192 = metadata !{metadata !167, metadata !158, i64 40}
!193 = metadata !{metadata !167, metadata !158, i64 48}
!194 = metadata !{metadata !167, metadata !158, i64 56}
!195 = metadata !{metadata !167, metadata !158, i64 64}
!196 = metadata !{metadata !167, metadata !158, i64 72}
!197 = metadata !{metadata !167, metadata !165, i64 80}
!198 = metadata !{metadata !199, metadata !165, i64 0}
!199 = metadata !{metadata !"_ZTS23sdmprofile__struct_STrw", metadata !165, i64 0, metadata !165, i64 8, metadata !165, i64 16, metadata !162, i64 24, metadata !158, i64 32, metadata !158, i64 40, metadata !158, i64 48}
!200 = metadata !{metadata !199, metadata !162, i64 24}
!201 = metadata !{metadata !199, metadata !158, i64 32}
!202 = metadata !{metadata !199, metadata !158, i64 40}
!203 = metadata !{metadata !199, metadata !158, i64 48}
!204 = metadata !{metadata !205, metadata !162, i64 0}
!205 = metadata !{metadata !"_ZTS6HPMeta", metadata !162, i64 0, metadata !165, i64 8, metadata !165, i64 16, metadata !158, i64 24, metadata !158, i64 32, metadata !158, i64 40, metadata !165, i64 48, metadata !158, i64 56, metadata !165, i64 64, metadata !165, i64 72, metadata !165, i64 80, metadata !165, i64 88}
!206 = metadata !{metadata !205, metadata !158, i64 24}
!207 = metadata !{metadata !205, metadata !158, i64 32}
!208 = metadata !{metadata !205, metadata !158, i64 40}
!209 = metadata !{metadata !205, metadata !165, i64 48}
!210 = metadata !{metadata !205, metadata !158, i64 56}
!211 = metadata !{metadata !167, metadata !165, i64 8}
!212 = metadata !{metadata !167, metadata !165, i64 16}
!213 = metadata !{metadata !214, metadata !158, i64 0}
!214 = metadata !{metadata !"_ZTSSt14_Fwd_list_baseIP6GVMetaSaIS1_EE", metadata !215, i64 0}
!215 = metadata !{metadata !"_ZTSNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_Fwd_list_implE", metadata !216, i64 0}
!216 = metadata !{metadata !"_ZTSSt19_Fwd_list_node_base", metadata !158, i64 0}
!217 = metadata !{metadata !218, metadata !158, i64 0}
!218 = metadata !{metadata !"_ZTSSt18_Fwd_list_iteratorIP6GVMetaE", metadata !158, i64 0}
!219 = metadata !{metadata !216, metadata !158, i64 0}
!220 = metadata !{metadata !199, metadata !165, i64 8}
!221 = metadata !{metadata !199, metadata !165, i64 16}
!222 = metadata !{metadata !165, metadata !165, i64 0}
!223 = metadata !{metadata !224, metadata !165, i64 0}
!224 = metadata !{metadata !"_ZTS8timespec", metadata !165, i64 0, metadata !165, i64 8}
!225 = metadata !{metadata !224, metadata !165, i64 8}
!226 = metadata !{metadata !227, metadata !165, i64 0}
!227 = metadata !{metadata !"_ZTS7timeval", metadata !165, i64 0, metadata !165, i64 8}
!228 = metadata !{metadata !227, metadata !165, i64 8}
!229 = metadata !{metadata !179, metadata !165, i64 48}
!230 = metadata !{metadata !164, metadata !158, i64 8}
!231 = metadata !{metadata !164, metadata !165, i64 16}
!232 = metadata !{metadata !164, metadata !162, i64 24}
!233 = metadata !{metadata !179, metadata !165, i64 80}
!234 = metadata !{metadata !179, metadata !165, i64 64}
!235 = metadata !{metadata !205, metadata !165, i64 64}
!236 = metadata !{metadata !205, metadata !165, i64 72}
!237 = metadata !{metadata !205, metadata !165, i64 80}
!238 = metadata !{metadata !179, metadata !165, i64 56}
!239 = metadata !{metadata !240, metadata !158, i64 0}
!240 = metadata !{metadata !"_ZTSSt10_List_baseIP18HeapAllocationMetaSaIS1_EE", metadata !241, i64 0}
!241 = metadata !{metadata !"_ZTSNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE10_List_implE", metadata !242, i64 0}
!242 = metadata !{metadata !"_ZTSNSt8__detail15_List_node_baseE", metadata !158, i64 0, metadata !158, i64 8}
!243 = metadata !{metadata !244, metadata !158, i64 0}
!244 = metadata !{metadata !"_ZTSSt14_List_iteratorIP18HeapAllocationMetaE", metadata !158, i64 0}
!245 = metadata !{metadata !242, metadata !158, i64 0}
!246 = metadata !{metadata !179, metadata !165, i64 96}
!247 = metadata !{metadata !179, metadata !165, i64 112}
!248 = metadata !{metadata !179, metadata !165, i64 128}
!249 = metadata !{metadata !179, metadata !165, i64 120}
!250 = metadata !{metadata !179, metadata !165, i64 104}
!251 = metadata !{metadata !205, metadata !165, i64 8}
!252 = metadata !{metadata !205, metadata !165, i64 16}
!253 = metadata !{metadata !171, metadata !165, i64 8}
!254 = metadata !{metadata !159, metadata !159, i64 0}
!255 = metadata !{metadata !256, metadata !158, i64 0}
!256 = metadata !{metadata !"_ZTSN9__gnu_cxx17__normal_iteratorIPcSsEE", metadata !158, i64 0}
!257 = metadata !{metadata !258, metadata !158, i64 0}
!258 = metadata !{metadata !"_ZTSSs", metadata !259, i64 0}
!259 = metadata !{metadata !"_ZTSNSs12_Alloc_hiderE", metadata !158, i64 0}
!260 = metadata !{metadata !261, metadata !165, i64 0}
!261 = metadata !{metadata !"_ZTSNSs9_Rep_baseE", metadata !165, i64 0, metadata !165, i64 8, metadata !162, i64 16}
!262 = metadata !{metadata !261, metadata !162, i64 16}
!263 = metadata !{metadata !264, metadata !158, i64 16}
!264 = metadata !{metadata !"_ZTSSt10_List_nodeIP18HeapAllocationMetaE", metadata !158, i64 16}
!265 = metadata !{metadata !266, metadata !158, i64 0}
!266 = metadata !{metadata !"_ZTSSt24_Fwd_list_const_iteratorIP6GVMetaE", metadata !158, i64 0}
!267 = metadata !{metadata !240, metadata !158, i64 8}
!268 = metadata !{metadata !"branch_weights", i32 64, i32 4}
!269 = metadata !{i32 81, i32 37, metadata !22, null}
!270 = metadata !{i32 786689, metadata !22, metadata !"x", metadata !20, i32 16777297, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 81]
!271 = metadata !{i32 786688, metadata !22, metadata !"Ptr", metadata !20, i32 83, metadata !272, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Ptr] [line 83]
!272 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !273} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned char]
!273 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!274 = metadata !{i32 83, i32 23, metadata !22, null}
!275 = metadata !{i32 83, i32 7, metadata !22, null}
!276 = metadata !{i32 786688, metadata !22, metadata !"Accu", metadata !20, i32 84, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Accu] [line 84]
!277 = metadata !{i32 84, i32 11, metadata !22, null}
!278 = metadata !{i32 86, i32 7, metadata !22, null}
!279 = metadata !{i32 87, i32 7, metadata !22, null}
!280 = metadata !{i32 88, i32 7, metadata !22, null}
!281 = metadata !{i32 89, i32 7, metadata !22, null}
!282 = metadata !{i32 90, i32 7, metadata !22, null}
!283 = metadata !{i32 61, i32 37, metadata !21, null}
!284 = metadata !{i32 786689, metadata !21, metadata !"x", metadata !20, i32 16777277, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 61]
!285 = metadata !{i32 786688, metadata !21, metadata !"U", metadata !20, i32 67, metadata !286, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [U] [line 67]
!286 = metadata !{i32 786455, metadata !17, metadata !21, metadata !"", i32 63, i64 64, i64 64, i64 0, i32 0, null, metadata !287, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 63, size 64, align 64, offset 0] [def] [from ]
!287 = metadata !{metadata !288, metadata !292}
!288 = metadata !{i32 786445, metadata !17, metadata !286, metadata !"ch", i32 65, i64 32, i64 8, i64 0, i32 0, metadata !289} ; [ DW_TAG_member ] [ch] [line 65, size 32, align 8, offset 0] [from ]
!289 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 32, i64 8, i32 0, i32 0, metadata !273, metadata !290, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from unsigned char]
!290 = metadata !{metadata !291}
!291 = metadata !{i32 786465, i64 0, i64 4}       ; [ DW_TAG_subrange_type ] [0, 3]
!292 = metadata !{i32 786445, metadata !17, metadata !286, metadata !"y", i32 66, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_member ] [y] [line 66, size 64, align 64, offset 0] [from long int]
!293 = metadata !{i32 67, i32 9, metadata !21, null}
!294 = metadata !{i32 69, i32 7, metadata !21, null}
!295 = metadata !{i32 71, i32 7, metadata !21, null}
!296 = metadata !{i32 53, i32 21, metadata !297, null}
!297 = metadata !{i32 786478, metadata !56, metadata !59, metadata !"bfclose", metadata !"bfclose", metadata !"", i32 53, metadata !298, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.bfile.2*)* @bfclose_original, null, null, metadata !3, i32 54} ; [ DW_TAG_subprogram ] [line 53] [def] [scope 54] [bfclose]
!298 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !299, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!299 = metadata !{null, metadata !300}
!300 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !301} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from bfile]
!301 = metadata !{i32 786454, metadata !64, null, metadata !"bfile", i32 66, i64 0, i64 0, i64 0, i32 0, metadata !302} ; [ DW_TAG_typedef ] [bfile] [line 66, size 0, align 0, offset 0] [from ]
!302 = metadata !{i32 786451, metadata !64, null, metadata !"", i32 60, i64 128, i64 64, i32 0, i32 0, null, metadata !303, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 60, size 128, align 64, offset 0] [def] [from ]
!303 = metadata !{metadata !304, metadata !345, metadata !346, metadata !347, metadata !348}
!304 = metadata !{i32 786445, metadata !64, metadata !302, metadata !"file", i32 61, i64 64, i64 64, i64 0, i32 0, metadata !305} ; [ DW_TAG_member ] [file] [line 61, size 64, align 64, offset 0] [from ]
!305 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !306} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!306 = metadata !{i32 786454, metadata !70, null, metadata !"FILE", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !307} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!307 = metadata !{i32 786451, metadata !72, null, metadata !"_IO_FILE", i32 245, i64 1728, i64 64, i32 0, i32 0, null, metadata !308, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!308 = metadata !{metadata !309, metadata !310, metadata !311, metadata !312, metadata !313, metadata !314, metadata !315, metadata !316, metadata !317, metadata !318, metadata !319, metadata !320, metadata !321, metadata !329, metadata !330, metadata !331, metadata !332, metadata !333, metadata !334, metadata !335, metadata !336, metadata !337, metadata !338, metadata !339, metadata !340, metadata !341, metadata !342, metadata !343, metadata !344}
!309 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_flags", i32 246, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!310 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_IO_read_ptr", i32 251, i64 64, i64 64, i64 64, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!311 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_IO_read_end", i32 252, i64 64, i64 64, i64 128, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!312 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_IO_read_base", i32 253, i64 64, i64 64, i64 192, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!313 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_IO_write_base", i32 254, i64 64, i64 64, i64 256, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!314 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_IO_write_ptr", i32 255, i64 64, i64 64, i64 320, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!315 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_IO_write_end", i32 256, i64 64, i64 64, i64 384, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!316 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_IO_buf_base", i32 257, i64 64, i64 64, i64 448, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!317 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_IO_buf_end", i32 258, i64 64, i64 64, i64 512, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!318 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_IO_save_base", i32 260, i64 64, i64 64, i64 576, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!319 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_IO_backup_base", i32 261, i64 64, i64 64, i64 640, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!320 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_IO_save_end", i32 262, i64 64, i64 64, i64 704, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!321 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_markers", i32 264, i64 64, i64 64, i64 768, i32 0, metadata !322} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!322 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !323} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!323 = metadata !{i32 786451, metadata !72, null, metadata !"_IO_marker", i32 160, i64 192, i64 64, i32 0, i32 0, null, metadata !324, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [def] [from ]
!324 = metadata !{metadata !325, metadata !326, metadata !328}
!325 = metadata !{i32 786445, metadata !72, metadata !323, metadata !"_next", i32 161, i64 64, i64 64, i64 0, i32 0, metadata !322} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!326 = metadata !{i32 786445, metadata !72, metadata !323, metadata !"_sbuf", i32 162, i64 64, i64 64, i64 64, i32 0, metadata !327} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!327 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !307} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!328 = metadata !{i32 786445, metadata !72, metadata !323, metadata !"_pos", i32 166, i64 32, i64 32, i64 128, i32 0, metadata !9} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!329 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_chain", i32 266, i64 64, i64 64, i64 832, i32 0, metadata !327} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!330 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_fileno", i32 268, i64 32, i64 32, i64 896, i32 0, metadata !9} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!331 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_flags2", i32 272, i64 32, i64 32, i64 928, i32 0, metadata !9} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!332 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_old_offset", i32 274, i64 64, i64 64, i64 960, i32 0, metadata !98} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!333 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_cur_column", i32 278, i64 16, i64 16, i64 1024, i32 0, metadata !101} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!334 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_vtable_offset", i32 279, i64 8, i64 8, i64 1040, i32 0, metadata !103} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!335 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_shortbuf", i32 280, i64 8, i64 8, i64 1048, i32 0, metadata !105} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!336 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_lock", i32 284, i64 64, i64 64, i64 1088, i32 0, metadata !109} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!337 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_offset", i32 293, i64 64, i64 64, i64 1152, i32 0, metadata !112} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!338 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"__pad1", i32 302, i64 64, i64 64, i64 1216, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!339 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"__pad2", i32 303, i64 64, i64 64, i64 1280, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!340 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"__pad3", i32 304, i64 64, i64 64, i64 1344, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!341 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"__pad4", i32 305, i64 64, i64 64, i64 1408, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!342 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"__pad5", i32 306, i64 64, i64 64, i64 1472, i32 0, metadata !119} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!343 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_mode", i32 308, i64 32, i64 32, i64 1536, i32 0, metadata !9} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!344 = metadata !{i32 786445, metadata !72, metadata !307, metadata !"_unused2", i32 310, i64 160, i64 8, i64 1568, i32 0, metadata !124} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!345 = metadata !{i32 786445, metadata !64, metadata !302, metadata !"rbuf", i32 62, i64 8, i64 8, i64 64, i32 0, metadata !26} ; [ DW_TAG_member ] [rbuf] [line 62, size 8, align 8, offset 64] [from char]
!346 = metadata !{i32 786445, metadata !64, metadata !302, metadata !"rcnt", i32 63, i64 8, i64 8, i64 72, i32 0, metadata !26} ; [ DW_TAG_member ] [rcnt] [line 63, size 8, align 8, offset 72] [from char]
!347 = metadata !{i32 786445, metadata !64, metadata !302, metadata !"wbuf", i32 64, i64 8, i64 8, i64 80, i32 0, metadata !26} ; [ DW_TAG_member ] [wbuf] [line 64, size 8, align 8, offset 80] [from char]
!348 = metadata !{i32 786445, metadata !64, metadata !302, metadata !"wcnt", i32 65, i64 8, i64 8, i64 88, i32 0, metadata !26} ; [ DW_TAG_member ] [wcnt] [line 65, size 8, align 8, offset 88] [from char]
!349 = metadata !{i32 786689, metadata !297, metadata !"bf", metadata !59, i32 16777269, metadata !300, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bf] [line 53]
!350 = metadata !{i32 55, i32 7, metadata !297, null}
!351 = metadata !{i32 56, i32 7, metadata !297, null}
!352 = metadata !{i32 57, i32 1, metadata !297, null}
!353 = metadata !{i32 12, i32 21, metadata !354, null}
!354 = metadata !{i32 786478, metadata !56, metadata !59, metadata !"bfopen", metadata !"bfopen", metadata !"", i32 12, metadata !355, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.bfile.2* (i8*, i8*)* @bfopen_original, null, null, metadata !3, i32 13} ; [ DW_TAG_subprogram ] [line 12] [def] [scope 13] [bfopen]
!355 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !356, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!356 = metadata !{metadata !357, metadata !45, metadata !45}
!357 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !358} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from bfile]
!358 = metadata !{i32 786454, metadata !64, null, metadata !"bfile", i32 66, i64 0, i64 0, i64 0, i32 0, metadata !359} ; [ DW_TAG_typedef ] [bfile] [line 66, size 0, align 0, offset 0] [from ]
!359 = metadata !{i32 786451, metadata !64, null, metadata !"", i32 60, i64 128, i64 64, i32 0, i32 0, null, metadata !360, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 60, size 128, align 64, offset 0] [def] [from ]
!360 = metadata !{metadata !361, metadata !402, metadata !403, metadata !404, metadata !405}
!361 = metadata !{i32 786445, metadata !64, metadata !359, metadata !"file", i32 61, i64 64, i64 64, i64 0, i32 0, metadata !362} ; [ DW_TAG_member ] [file] [line 61, size 64, align 64, offset 0] [from ]
!362 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !363} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!363 = metadata !{i32 786454, metadata !70, null, metadata !"FILE", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !364} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!364 = metadata !{i32 786451, metadata !72, null, metadata !"_IO_FILE", i32 245, i64 1728, i64 64, i32 0, i32 0, null, metadata !365, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!365 = metadata !{metadata !366, metadata !367, metadata !368, metadata !369, metadata !370, metadata !371, metadata !372, metadata !373, metadata !374, metadata !375, metadata !376, metadata !377, metadata !378, metadata !386, metadata !387, metadata !388, metadata !389, metadata !390, metadata !391, metadata !392, metadata !393, metadata !394, metadata !395, metadata !396, metadata !397, metadata !398, metadata !399, metadata !400, metadata !401}
!366 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_flags", i32 246, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!367 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_IO_read_ptr", i32 251, i64 64, i64 64, i64 64, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!368 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_IO_read_end", i32 252, i64 64, i64 64, i64 128, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!369 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_IO_read_base", i32 253, i64 64, i64 64, i64 192, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!370 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_IO_write_base", i32 254, i64 64, i64 64, i64 256, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!371 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_IO_write_ptr", i32 255, i64 64, i64 64, i64 320, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!372 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_IO_write_end", i32 256, i64 64, i64 64, i64 384, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!373 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_IO_buf_base", i32 257, i64 64, i64 64, i64 448, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!374 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_IO_buf_end", i32 258, i64 64, i64 64, i64 512, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!375 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_IO_save_base", i32 260, i64 64, i64 64, i64 576, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!376 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_IO_backup_base", i32 261, i64 64, i64 64, i64 640, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!377 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_IO_save_end", i32 262, i64 64, i64 64, i64 704, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!378 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_markers", i32 264, i64 64, i64 64, i64 768, i32 0, metadata !379} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!379 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !380} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!380 = metadata !{i32 786451, metadata !72, null, metadata !"_IO_marker", i32 160, i64 192, i64 64, i32 0, i32 0, null, metadata !381, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [def] [from ]
!381 = metadata !{metadata !382, metadata !383, metadata !385}
!382 = metadata !{i32 786445, metadata !72, metadata !380, metadata !"_next", i32 161, i64 64, i64 64, i64 0, i32 0, metadata !379} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!383 = metadata !{i32 786445, metadata !72, metadata !380, metadata !"_sbuf", i32 162, i64 64, i64 64, i64 64, i32 0, metadata !384} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!384 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !364} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!385 = metadata !{i32 786445, metadata !72, metadata !380, metadata !"_pos", i32 166, i64 32, i64 32, i64 128, i32 0, metadata !9} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!386 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_chain", i32 266, i64 64, i64 64, i64 832, i32 0, metadata !384} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!387 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_fileno", i32 268, i64 32, i64 32, i64 896, i32 0, metadata !9} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!388 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_flags2", i32 272, i64 32, i64 32, i64 928, i32 0, metadata !9} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!389 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_old_offset", i32 274, i64 64, i64 64, i64 960, i32 0, metadata !98} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!390 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_cur_column", i32 278, i64 16, i64 16, i64 1024, i32 0, metadata !101} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!391 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_vtable_offset", i32 279, i64 8, i64 8, i64 1040, i32 0, metadata !103} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!392 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_shortbuf", i32 280, i64 8, i64 8, i64 1048, i32 0, metadata !105} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!393 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_lock", i32 284, i64 64, i64 64, i64 1088, i32 0, metadata !109} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!394 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_offset", i32 293, i64 64, i64 64, i64 1152, i32 0, metadata !112} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!395 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"__pad1", i32 302, i64 64, i64 64, i64 1216, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!396 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"__pad2", i32 303, i64 64, i64 64, i64 1280, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!397 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"__pad3", i32 304, i64 64, i64 64, i64 1344, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!398 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"__pad4", i32 305, i64 64, i64 64, i64 1408, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!399 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"__pad5", i32 306, i64 64, i64 64, i64 1472, i32 0, metadata !119} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!400 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_mode", i32 308, i64 32, i64 32, i64 1536, i32 0, metadata !9} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!401 = metadata !{i32 786445, metadata !72, metadata !364, metadata !"_unused2", i32 310, i64 160, i64 8, i64 1568, i32 0, metadata !124} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!402 = metadata !{i32 786445, metadata !64, metadata !359, metadata !"rbuf", i32 62, i64 8, i64 8, i64 64, i32 0, metadata !26} ; [ DW_TAG_member ] [rbuf] [line 62, size 8, align 8, offset 64] [from char]
!403 = metadata !{i32 786445, metadata !64, metadata !359, metadata !"rcnt", i32 63, i64 8, i64 8, i64 72, i32 0, metadata !26} ; [ DW_TAG_member ] [rcnt] [line 63, size 8, align 8, offset 72] [from char]
!404 = metadata !{i32 786445, metadata !64, metadata !359, metadata !"wbuf", i32 64, i64 8, i64 8, i64 80, i32 0, metadata !26} ; [ DW_TAG_member ] [wbuf] [line 64, size 8, align 8, offset 80] [from char]
!405 = metadata !{i32 786445, metadata !64, metadata !359, metadata !"wcnt", i32 65, i64 8, i64 8, i64 88, i32 0, metadata !26} ; [ DW_TAG_member ] [wcnt] [line 65, size 8, align 8, offset 88] [from char]
!406 = metadata !{i32 786689, metadata !354, metadata !"name", metadata !59, i32 16777228, metadata !45, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 12]
!407 = metadata !{i32 786689, metadata !354, metadata !"mode", metadata !59, i32 33554444, metadata !45, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 12]
!408 = metadata !{i32 12, i32 33, metadata !354, null}
!409 = metadata !{i32 786688, metadata !354, metadata !"bf", metadata !59, i32 14, metadata !357, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bf] [line 14]
!410 = metadata !{i32 14, i32 15, metadata !354, null}
!411 = metadata !{i32 16, i32 12, metadata !354, null}
!412 = metadata !{i32 17, i32 11, metadata !413, null}
!413 = metadata !{i32 786443, metadata !56, metadata !354, i32 17, i32 11, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitfiles.c]
!414 = metadata !{i32 18, i32 13, metadata !413, null}
!415 = metadata !{i32 19, i32 18, metadata !354, null}
!416 = metadata !{i32 20, i32 11, metadata !417, null}
!417 = metadata !{i32 786443, metadata !56, metadata !354, i32 20, i32 11, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitfiles.c]
!418 = metadata !{i32 22, i32 13, metadata !419, null}
!419 = metadata !{i32 786443, metadata !56, metadata !417, i32 21, i32 7, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitfiles.c]
!420 = metadata !{i32 23, i32 13, metadata !419, null}
!421 = metadata !{i32 25, i32 7, metadata !354, null}
!422 = metadata !{i32 26, i32 7, metadata !354, null}
!423 = metadata !{i32 27, i32 7, metadata !354, null}
!424 = metadata !{i32 28, i32 1, metadata !354, null}
!425 = metadata !{i32 30, i32 19, metadata !426, null}
!426 = metadata !{i32 786478, metadata !56, metadata !59, metadata !"bfread", metadata !"bfread", metadata !"", i32 30, metadata !427, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.bfile.2*)* @bfread_original, null, null, metadata !3, i32 31} ; [ DW_TAG_subprogram ] [line 30] [def] [scope 31] [bfread]
!427 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !428, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!428 = metadata !{metadata !9, metadata !429}
!429 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !430} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from bfile]
!430 = metadata !{i32 786454, metadata !64, null, metadata !"bfile", i32 66, i64 0, i64 0, i64 0, i32 0, metadata !431} ; [ DW_TAG_typedef ] [bfile] [line 66, size 0, align 0, offset 0] [from ]
!431 = metadata !{i32 786451, metadata !64, null, metadata !"", i32 60, i64 128, i64 64, i32 0, i32 0, null, metadata !432, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 60, size 128, align 64, offset 0] [def] [from ]
!432 = metadata !{metadata !433, metadata !474, metadata !475, metadata !476, metadata !477}
!433 = metadata !{i32 786445, metadata !64, metadata !431, metadata !"file", i32 61, i64 64, i64 64, i64 0, i32 0, metadata !434} ; [ DW_TAG_member ] [file] [line 61, size 64, align 64, offset 0] [from ]
!434 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !435} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!435 = metadata !{i32 786454, metadata !70, null, metadata !"FILE", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !436} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!436 = metadata !{i32 786451, metadata !72, null, metadata !"_IO_FILE", i32 245, i64 1728, i64 64, i32 0, i32 0, null, metadata !437, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!437 = metadata !{metadata !438, metadata !439, metadata !440, metadata !441, metadata !442, metadata !443, metadata !444, metadata !445, metadata !446, metadata !447, metadata !448, metadata !449, metadata !450, metadata !458, metadata !459, metadata !460, metadata !461, metadata !462, metadata !463, metadata !464, metadata !465, metadata !466, metadata !467, metadata !468, metadata !469, metadata !470, metadata !471, metadata !472, metadata !473}
!438 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_flags", i32 246, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!439 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_IO_read_ptr", i32 251, i64 64, i64 64, i64 64, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!440 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_IO_read_end", i32 252, i64 64, i64 64, i64 128, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!441 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_IO_read_base", i32 253, i64 64, i64 64, i64 192, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!442 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_IO_write_base", i32 254, i64 64, i64 64, i64 256, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!443 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_IO_write_ptr", i32 255, i64 64, i64 64, i64 320, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!444 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_IO_write_end", i32 256, i64 64, i64 64, i64 384, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!445 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_IO_buf_base", i32 257, i64 64, i64 64, i64 448, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!446 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_IO_buf_end", i32 258, i64 64, i64 64, i64 512, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!447 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_IO_save_base", i32 260, i64 64, i64 64, i64 576, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!448 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_IO_backup_base", i32 261, i64 64, i64 64, i64 640, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!449 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_IO_save_end", i32 262, i64 64, i64 64, i64 704, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!450 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_markers", i32 264, i64 64, i64 64, i64 768, i32 0, metadata !451} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!451 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !452} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!452 = metadata !{i32 786451, metadata !72, null, metadata !"_IO_marker", i32 160, i64 192, i64 64, i32 0, i32 0, null, metadata !453, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [def] [from ]
!453 = metadata !{metadata !454, metadata !455, metadata !457}
!454 = metadata !{i32 786445, metadata !72, metadata !452, metadata !"_next", i32 161, i64 64, i64 64, i64 0, i32 0, metadata !451} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!455 = metadata !{i32 786445, metadata !72, metadata !452, metadata !"_sbuf", i32 162, i64 64, i64 64, i64 64, i32 0, metadata !456} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!456 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !436} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!457 = metadata !{i32 786445, metadata !72, metadata !452, metadata !"_pos", i32 166, i64 32, i64 32, i64 128, i32 0, metadata !9} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!458 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_chain", i32 266, i64 64, i64 64, i64 832, i32 0, metadata !456} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!459 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_fileno", i32 268, i64 32, i64 32, i64 896, i32 0, metadata !9} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!460 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_flags2", i32 272, i64 32, i64 32, i64 928, i32 0, metadata !9} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!461 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_old_offset", i32 274, i64 64, i64 64, i64 960, i32 0, metadata !98} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!462 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_cur_column", i32 278, i64 16, i64 16, i64 1024, i32 0, metadata !101} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!463 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_vtable_offset", i32 279, i64 8, i64 8, i64 1040, i32 0, metadata !103} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!464 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_shortbuf", i32 280, i64 8, i64 8, i64 1048, i32 0, metadata !105} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!465 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_lock", i32 284, i64 64, i64 64, i64 1088, i32 0, metadata !109} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!466 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_offset", i32 293, i64 64, i64 64, i64 1152, i32 0, metadata !112} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!467 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"__pad1", i32 302, i64 64, i64 64, i64 1216, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!468 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"__pad2", i32 303, i64 64, i64 64, i64 1280, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!469 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"__pad3", i32 304, i64 64, i64 64, i64 1344, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!470 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"__pad4", i32 305, i64 64, i64 64, i64 1408, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!471 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"__pad5", i32 306, i64 64, i64 64, i64 1472, i32 0, metadata !119} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!472 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_mode", i32 308, i64 32, i64 32, i64 1536, i32 0, metadata !9} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!473 = metadata !{i32 786445, metadata !72, metadata !436, metadata !"_unused2", i32 310, i64 160, i64 8, i64 1568, i32 0, metadata !124} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!474 = metadata !{i32 786445, metadata !64, metadata !431, metadata !"rbuf", i32 62, i64 8, i64 8, i64 64, i32 0, metadata !26} ; [ DW_TAG_member ] [rbuf] [line 62, size 8, align 8, offset 64] [from char]
!475 = metadata !{i32 786445, metadata !64, metadata !431, metadata !"rcnt", i32 63, i64 8, i64 8, i64 72, i32 0, metadata !26} ; [ DW_TAG_member ] [rcnt] [line 63, size 8, align 8, offset 72] [from char]
!476 = metadata !{i32 786445, metadata !64, metadata !431, metadata !"wbuf", i32 64, i64 8, i64 8, i64 80, i32 0, metadata !26} ; [ DW_TAG_member ] [wbuf] [line 64, size 8, align 8, offset 80] [from char]
!477 = metadata !{i32 786445, metadata !64, metadata !431, metadata !"wcnt", i32 65, i64 8, i64 8, i64 88, i32 0, metadata !26} ; [ DW_TAG_member ] [wcnt] [line 65, size 8, align 8, offset 88] [from char]
!478 = metadata !{i32 786689, metadata !426, metadata !"bf", metadata !59, i32 16777246, metadata !429, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bf] [line 30]
!479 = metadata !{i32 32, i32 11, metadata !480, null}
!480 = metadata !{i32 786443, metadata !56, metadata !426, i32 32, i32 11, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitfiles.c]
!481 = metadata !{i32 34, i32 30, metadata !482, null}
!482 = metadata !{i32 786443, metadata !56, metadata !480, i32 33, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitfiles.c]
!483 = metadata !{i32 35, i32 13, metadata !482, null}
!484 = metadata !{i32 36, i32 7, metadata !482, null}
!485 = metadata !{i32 37, i32 7, metadata !426, null}
!486 = metadata !{i32 38, i32 7, metadata !426, null}
!487 = metadata !{i32 41, i32 18, metadata !488, null}
!488 = metadata !{i32 786478, metadata !56, metadata !59, metadata !"bfwrite", metadata !"bfwrite", metadata !"", i32 41, metadata !489, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, %struct.bfile.2*)* @bfwrite_original, null, null, metadata !3, i32 42} ; [ DW_TAG_subprogram ] [line 41] [def] [scope 42] [bfwrite]
!489 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !490, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!490 = metadata !{null, metadata !9, metadata !491}
!491 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !492} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from bfile]
!492 = metadata !{i32 786454, metadata !64, null, metadata !"bfile", i32 66, i64 0, i64 0, i64 0, i32 0, metadata !493} ; [ DW_TAG_typedef ] [bfile] [line 66, size 0, align 0, offset 0] [from ]
!493 = metadata !{i32 786451, metadata !64, null, metadata !"", i32 60, i64 128, i64 64, i32 0, i32 0, null, metadata !494, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 60, size 128, align 64, offset 0] [def] [from ]
!494 = metadata !{metadata !495, metadata !536, metadata !537, metadata !538, metadata !539}
!495 = metadata !{i32 786445, metadata !64, metadata !493, metadata !"file", i32 61, i64 64, i64 64, i64 0, i32 0, metadata !496} ; [ DW_TAG_member ] [file] [line 61, size 64, align 64, offset 0] [from ]
!496 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !497} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!497 = metadata !{i32 786454, metadata !70, null, metadata !"FILE", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !498} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!498 = metadata !{i32 786451, metadata !72, null, metadata !"_IO_FILE", i32 245, i64 1728, i64 64, i32 0, i32 0, null, metadata !499, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!499 = metadata !{metadata !500, metadata !501, metadata !502, metadata !503, metadata !504, metadata !505, metadata !506, metadata !507, metadata !508, metadata !509, metadata !510, metadata !511, metadata !512, metadata !520, metadata !521, metadata !522, metadata !523, metadata !524, metadata !525, metadata !526, metadata !527, metadata !528, metadata !529, metadata !530, metadata !531, metadata !532, metadata !533, metadata !534, metadata !535}
!500 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_flags", i32 246, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!501 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_IO_read_ptr", i32 251, i64 64, i64 64, i64 64, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!502 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_IO_read_end", i32 252, i64 64, i64 64, i64 128, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!503 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_IO_read_base", i32 253, i64 64, i64 64, i64 192, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!504 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_IO_write_base", i32 254, i64 64, i64 64, i64 256, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!505 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_IO_write_ptr", i32 255, i64 64, i64 64, i64 320, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!506 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_IO_write_end", i32 256, i64 64, i64 64, i64 384, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!507 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_IO_buf_base", i32 257, i64 64, i64 64, i64 448, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!508 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_IO_buf_end", i32 258, i64 64, i64 64, i64 512, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!509 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_IO_save_base", i32 260, i64 64, i64 64, i64 576, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!510 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_IO_backup_base", i32 261, i64 64, i64 64, i64 640, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!511 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_IO_save_end", i32 262, i64 64, i64 64, i64 704, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!512 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_markers", i32 264, i64 64, i64 64, i64 768, i32 0, metadata !513} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!513 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !514} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!514 = metadata !{i32 786451, metadata !72, null, metadata !"_IO_marker", i32 160, i64 192, i64 64, i32 0, i32 0, null, metadata !515, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [def] [from ]
!515 = metadata !{metadata !516, metadata !517, metadata !519}
!516 = metadata !{i32 786445, metadata !72, metadata !514, metadata !"_next", i32 161, i64 64, i64 64, i64 0, i32 0, metadata !513} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!517 = metadata !{i32 786445, metadata !72, metadata !514, metadata !"_sbuf", i32 162, i64 64, i64 64, i64 64, i32 0, metadata !518} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!518 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !498} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!519 = metadata !{i32 786445, metadata !72, metadata !514, metadata !"_pos", i32 166, i64 32, i64 32, i64 128, i32 0, metadata !9} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!520 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_chain", i32 266, i64 64, i64 64, i64 832, i32 0, metadata !518} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!521 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_fileno", i32 268, i64 32, i64 32, i64 896, i32 0, metadata !9} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!522 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_flags2", i32 272, i64 32, i64 32, i64 928, i32 0, metadata !9} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!523 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_old_offset", i32 274, i64 64, i64 64, i64 960, i32 0, metadata !98} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!524 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_cur_column", i32 278, i64 16, i64 16, i64 1024, i32 0, metadata !101} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!525 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_vtable_offset", i32 279, i64 8, i64 8, i64 1040, i32 0, metadata !103} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!526 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_shortbuf", i32 280, i64 8, i64 8, i64 1048, i32 0, metadata !105} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!527 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_lock", i32 284, i64 64, i64 64, i64 1088, i32 0, metadata !109} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!528 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_offset", i32 293, i64 64, i64 64, i64 1152, i32 0, metadata !112} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!529 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"__pad1", i32 302, i64 64, i64 64, i64 1216, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!530 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"__pad2", i32 303, i64 64, i64 64, i64 1280, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!531 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"__pad3", i32 304, i64 64, i64 64, i64 1344, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!532 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"__pad4", i32 305, i64 64, i64 64, i64 1408, i32 0, metadata !114} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!533 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"__pad5", i32 306, i64 64, i64 64, i64 1472, i32 0, metadata !119} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!534 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_mode", i32 308, i64 32, i64 32, i64 1536, i32 0, metadata !9} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!535 = metadata !{i32 786445, metadata !72, metadata !498, metadata !"_unused2", i32 310, i64 160, i64 8, i64 1568, i32 0, metadata !124} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!536 = metadata !{i32 786445, metadata !64, metadata !493, metadata !"rbuf", i32 62, i64 8, i64 8, i64 64, i32 0, metadata !26} ; [ DW_TAG_member ] [rbuf] [line 62, size 8, align 8, offset 64] [from char]
!537 = metadata !{i32 786445, metadata !64, metadata !493, metadata !"rcnt", i32 63, i64 8, i64 8, i64 72, i32 0, metadata !26} ; [ DW_TAG_member ] [rcnt] [line 63, size 8, align 8, offset 72] [from char]
!538 = metadata !{i32 786445, metadata !64, metadata !493, metadata !"wbuf", i32 64, i64 8, i64 8, i64 80, i32 0, metadata !26} ; [ DW_TAG_member ] [wbuf] [line 64, size 8, align 8, offset 80] [from char]
!539 = metadata !{i32 786445, metadata !64, metadata !493, metadata !"wcnt", i32 65, i64 8, i64 8, i64 88, i32 0, metadata !26} ; [ DW_TAG_member ] [wcnt] [line 65, size 8, align 8, offset 88] [from char]
!540 = metadata !{i32 786689, metadata !488, metadata !"bit", metadata !59, i32 16777257, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bit] [line 41]
!541 = metadata !{i32 786689, metadata !488, metadata !"bf", metadata !59, i32 33554473, metadata !491, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bf] [line 41]
!542 = metadata !{i32 41, i32 30, metadata !488, null}
!543 = metadata !{i32 43, i32 11, metadata !544, null}
!544 = metadata !{i32 786443, metadata !56, metadata !488, i32 43, i32 11, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitfiles.c]
!545 = metadata !{i32 45, i32 13, metadata !546, null}
!546 = metadata !{i32 786443, metadata !56, metadata !544, i32 44, i32 7, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitfiles.c]
!547 = metadata !{i32 46, i32 13, metadata !546, null}
!548 = metadata !{i32 47, i32 7, metadata !546, null}
!549 = metadata !{i32 48, i32 7, metadata !488, null}
!550 = metadata !{i32 49, i32 7, metadata !488, null}
!551 = metadata !{i32 50, i32 7, metadata !488, null}
!552 = metadata !{i32 51, i32 1, metadata !488, null}
!553 = metadata !{i32 9, i32 26, metadata !5, null}
!554 = metadata !{i32 786689, metadata !5, metadata !"x", metadata !6, i32 16777225, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 9]
!555 = metadata !{i32 786688, metadata !5, metadata !"n", metadata !6, i32 11, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 11]
!556 = metadata !{i32 11, i32 13, metadata !5, null}
!557 = metadata !{i32 11, i32 9, metadata !5, null}
!558 = metadata !{i32 16, i32 13, metadata !559, null}
!559 = metadata !{i32 786443, metadata !2, metadata !5, i32 16, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnt_1.c]
!560 = metadata !{i32 16, i32 16, metadata !561, null}
!561 = metadata !{i32 786443, metadata !2, metadata !559, i32 16, i32 16, i32 1, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnt_1.c]
!562 = metadata !{i32 17, i32 15, metadata !563, null}
!563 = metadata !{i32 786443, metadata !2, metadata !559, i32 17, i32 15, i32 2, i32 3} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnt_1.c]
!564 = metadata !{i32 17, i32 15, metadata !565, null}
!565 = metadata !{i32 786443, metadata !2, metadata !559, i32 17, i32 15, i32 1, i32 2} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnt_1.c]
!566 = metadata !{i32 17, i32 15, metadata !567, null}
!567 = metadata !{i32 786443, metadata !2, metadata !559, i32 17, i32 15, i32 3, i32 4} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnt_1.c]
!568 = metadata !{i32 19, i32 9, metadata !5, null}
!569 = metadata !{i32 80, i32 39, metadata !46, null}
!570 = metadata !{i32 786689, metadata !46, metadata !"x", metadata !41, i32 16777296, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 80]
!571 = metadata !{i32 786688, metadata !46, metadata !"i", metadata !41, i32 82, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 82]
!572 = metadata !{i32 82, i32 7, metadata !46, null}
!573 = metadata !{i32 786688, metadata !46, metadata !"n", metadata !41, i32 82, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 82]
!574 = metadata !{i32 82, i32 10, metadata !46, null}
!575 = metadata !{i32 84, i32 8, metadata !576, null}
!576 = metadata !{i32 786443, metadata !38, metadata !46, i32 84, i32 3, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!577 = metadata !{i32 84, i32 8, metadata !578, null}
!578 = metadata !{i32 786443, metadata !38, metadata !579, i32 84, i32 8, i32 4, i32 17} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!579 = metadata !{i32 786443, metadata !38, metadata !576, i32 84, i32 8, i32 1, i32 14} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!580 = metadata !{i32 84, i32 8, metadata !581, null}
!581 = metadata !{i32 786443, metadata !38, metadata !576, i32 84, i32 8, i32 2, i32 15} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!582 = metadata !{i32 84, i32 8, metadata !583, null}
!583 = metadata !{i32 786443, metadata !38, metadata !576, i32 84, i32 8, i32 3, i32 16} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!584 = metadata !{i32 85, i32 5, metadata !576, null}
!585 = metadata !{i32 84, i32 57, metadata !576, null}
!586 = metadata !{i32 86, i32 3, metadata !46, null}
!587 = metadata !{i32 9, i32 25, metadata !14, null}
!588 = metadata !{i32 786689, metadata !14, metadata !"i", metadata !15, i32 16777225, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 9]
!589 = metadata !{i32 11, i32 7, metadata !14, null}
!590 = metadata !{i32 12, i32 7, metadata !14, null}
!591 = metadata !{i32 13, i32 7, metadata !14, null}
!592 = metadata !{i32 14, i32 7, metadata !14, null}
!593 = metadata !{i32 15, i32 7, metadata !14, null}
!594 = metadata !{i32 16, i32 7, metadata !14, null}
!595 = metadata !{i32 31, i32 22, metadata !143, null}
!596 = metadata !{i32 786689, metadata !143, metadata !"str", metadata !144, i32 16777247, metadata !45, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [str] [line 31]
!597 = metadata !{i32 786689, metadata !143, metadata !"byze", metadata !144, i32 33554463, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [byze] [line 31]
!598 = metadata !{i32 31, i32 32, metadata !143, null}
!599 = metadata !{i32 786689, metadata !143, metadata !"biz", metadata !144, i32 50331679, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [biz] [line 31]
!600 = metadata !{i32 31, i32 42, metadata !143, null}
!601 = metadata !{i32 786689, metadata !143, metadata !"strwid", metadata !144, i32 67108895, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [strwid] [line 31]
!602 = metadata !{i32 31, i32 51, metadata !143, null}
!603 = metadata !{i32 786688, metadata !143, metadata !"i", metadata !144, i32 33, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 33]
!604 = metadata !{i32 33, i32 11, metadata !143, null}
!605 = metadata !{i32 786688, metadata !143, metadata !"j", metadata !144, i32 33, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 33]
!606 = metadata !{i32 33, i32 14, metadata !143, null}
!607 = metadata !{i32 35, i32 7, metadata !143, null}
!608 = metadata !{i32 36, i32 12, metadata !609, null}
!609 = metadata !{i32 786443, metadata !141, metadata !143, i32 36, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitstrng.c]
!610 = metadata !{i32 36, i32 12, metadata !611, null}
!611 = metadata !{i32 786443, metadata !141, metadata !612, i32 36, i32 12, i32 2, i32 4} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitstrng.c]
!612 = metadata !{i32 786443, metadata !141, metadata !609, i32 36, i32 12, i32 1, i32 3} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitstrng.c]
!613 = metadata !{i32 37, i32 13, metadata !609, null}
!614 = metadata !{i32 36, i32 26, metadata !609, null}
!615 = metadata !{i32 38, i32 7, metadata !143, null}
!616 = metadata !{i32 38, i32 7, metadata !617, null}
!617 = metadata !{i32 786443, metadata !141, metadata !143, i32 38, i32 7, i32 1, i32 5} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitstrng.c]
!618 = metadata !{i32 40, i32 13, metadata !619, null}
!619 = metadata !{i32 786443, metadata !141, metadata !143, i32 39, i32 7, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitstrng.c]
!620 = metadata !{i32 41, i32 17, metadata !621, null}
!621 = metadata !{i32 786443, metadata !141, metadata !619, i32 41, i32 17, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitstrng.c]
!622 = metadata !{i32 41, i32 17, metadata !623, null}
!623 = metadata !{i32 786443, metadata !141, metadata !621, i32 41, i32 17, i32 1, i32 6} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitstrng.c]
!624 = metadata !{i32 42, i32 19, metadata !621, null}
!625 = metadata !{i32 43, i32 7, metadata !619, null}
!626 = metadata !{i32 44, i32 7, metadata !143, null}
!627 = metadata !{i32 45, i32 1, metadata !143, null}
!628 = metadata !{i32 12, i32 27, metadata !150, null}
!629 = metadata !{i32 786689, metadata !150, metadata !"cptr", metadata !151, i32 16777228, metadata !45, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cptr] [line 12]
!630 = metadata !{i32 786688, metadata !150, metadata !"i", metadata !151, i32 14, metadata !154, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 14]
!631 = metadata !{i32 14, i32 20, metadata !150, null}
!632 = metadata !{i32 786688, metadata !150, metadata !"j", metadata !151, i32 14, metadata !154, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 14]
!633 = metadata !{i32 14, i32 23, metadata !150, null}
!634 = metadata !{i32 14, i32 7, metadata !150, null}
!635 = metadata !{i32 16, i32 7, metadata !150, null}
!636 = metadata !{i32 16, i32 7, metadata !637, null}
!637 = metadata !{i32 786443, metadata !148, metadata !150, i32 16, i32 7, i32 1, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bstr_i.c]
!638 = metadata !{i32 16, i32 7, metadata !639, null}
!639 = metadata !{i32 786443, metadata !148, metadata !150, i32 16, i32 7, i32 2, i32 2} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bstr_i.c]
!640 = metadata !{i32 16, i32 31, metadata !641, null}
!641 = metadata !{i32 786443, metadata !148, metadata !150, i32 16, i32 31, i32 4, i32 4} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bstr_i.c]
!642 = metadata !{i32 16, i32 31, metadata !643, null}
!643 = metadata !{i32 786443, metadata !148, metadata !644, i32 16, i32 31, i32 5, i32 5} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bstr_i.c]
!644 = metadata !{i32 786443, metadata !148, metadata !150, i32 16, i32 31, i32 3, i32 3} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bstr_i.c]
!645 = metadata !{i32 18, i32 13, metadata !646, null}
!646 = metadata !{i32 786443, metadata !148, metadata !150, i32 17, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bstr_i.c]
!647 = metadata !{i32 19, i32 13, metadata !646, null}
!648 = metadata !{i32 20, i32 13, metadata !646, null}
!649 = metadata !{i32 21, i32 7, metadata !646, null}
!650 = metadata !{i32 22, i32 7, metadata !150, null}
!651 = metadata !{i32 52, i32 28, metadata !34, null}
!652 = metadata !{i32 786689, metadata !34, metadata !"x", metadata !33, i32 16777268, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 52]
!653 = metadata !{i32 786688, metadata !34, metadata !"cnt", metadata !33, i32 54, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cnt] [line 54]
!654 = metadata !{i32 54, i32 11, metadata !34, null}
!655 = metadata !{i32 54, i32 7, metadata !34, null}
!656 = metadata !{i32 56, i32 11, metadata !657, null}
!657 = metadata !{i32 786443, metadata !30, metadata !34, i32 56, i32 11, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnt_4.c]
!658 = metadata !{i32 57, i32 20, metadata !657, null}
!659 = metadata !{i32 58, i32 7, metadata !34, null} ; [ DW_TAG_imported_module ]
!660 = metadata !{i32 21, i32 14, metadata !40, null}
!661 = metadata !{i32 786689, metadata !40, metadata !"argc", metadata !41, i32 16777237, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 21]
!662 = metadata !{i32 786689, metadata !40, metadata !"argv", metadata !41, i32 33554453, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 21]
!663 = metadata !{i32 21, i32 26, metadata !40, null}
!664 = metadata !{i32 786688, metadata !40, metadata !"start", metadata !41, i32 23, metadata !665, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [start] [line 23]
!665 = metadata !{i32 786454, metadata !666, null, metadata !"clock_t", i32 59, i64 0, i64 0, i64 0, i32 0, metadata !667} ; [ DW_TAG_typedef ] [clock_t] [line 59, size 0, align 0, offset 0] [from __clock_t]
!666 = metadata !{metadata !"/usr/include/time.h", metadata !"/home/sslee/work/regen/test/mibench/automotive/bitcount"}
!667 = metadata !{i32 786454, metadata !99, null, metadata !"__clock_t", i32 135, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ] [__clock_t] [line 135, size 0, align 0, offset 0] [from long int]
!668 = metadata !{i32 23, i32 11, metadata !40, null}
!669 = metadata !{i32 786688, metadata !40, metadata !"stop", metadata !41, i32 23, metadata !665, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [stop] [line 23]
!670 = metadata !{i32 23, i32 18, metadata !40, null}
!671 = metadata !{i32 786688, metadata !40, metadata !"ct", metadata !41, i32 24, metadata !672, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ct] [line 24]
!672 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!673 = metadata !{i32 24, i32 10, metadata !40, null}
!674 = metadata !{i32 786688, metadata !40, metadata !"cmin", metadata !41, i32 24, metadata !672, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cmin] [line 24]
!675 = metadata !{i32 24, i32 14, metadata !40, null}
!676 = metadata !{i32 24, i32 3, metadata !40, null}
!677 = metadata !{i32 786688, metadata !40, metadata !"cmax", metadata !41, i32 24, metadata !672, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cmax] [line 24]
!678 = metadata !{i32 24, i32 30, metadata !40, null}
!679 = metadata !{i32 786688, metadata !40, metadata !"i", metadata !41, i32 25, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 25]
!680 = metadata !{i32 25, i32 7, metadata !40, null}
!681 = metadata !{i32 786688, metadata !40, metadata !"cminix", metadata !41, i32 25, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cminix] [line 25]
!682 = metadata !{i32 25, i32 10, metadata !40, null}
!683 = metadata !{i32 786688, metadata !40, metadata !"cmaxix", metadata !41, i32 25, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cmaxix] [line 25]
!684 = metadata !{i32 25, i32 18, metadata !40, null}
!685 = metadata !{i32 786688, metadata !40, metadata !"j", metadata !41, i32 26, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 26]
!686 = metadata !{i32 26, i32 8, metadata !40, null}
!687 = metadata !{i32 786688, metadata !40, metadata !"n", metadata !41, i32 26, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 26]
!688 = metadata !{i32 26, i32 11, metadata !40, null}
!689 = metadata !{i32 786688, metadata !40, metadata !"seed", metadata !41, i32 26, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [seed] [line 26]
!690 = metadata !{i32 26, i32 14, metadata !40, null}
!691 = metadata !{i32 786688, metadata !40, metadata !"iterations", metadata !41, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [iterations] [line 27]
!692 = metadata !{i32 27, i32 7, metadata !40, null}
!693 = metadata !{i32 48, i32 7, metadata !694, null}
!694 = metadata !{i32 786443, metadata !38, metadata !40, i32 48, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!695 = metadata !{i32 49, i32 5, metadata !696, null}
!696 = metadata !{i32 786443, metadata !38, metadata !694, i32 48, i32 15, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!697 = metadata !{i32 50, i32 5, metadata !696, null}
!698 = metadata !{i32 52, i32 14, metadata !40, null}
!699 = metadata !{i32 54, i32 3, metadata !40, null}
!700 = metadata !{i32 56, i32 8, metadata !701, null}
!701 = metadata !{i32 786443, metadata !38, metadata !40, i32 56, i32 3, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!702 = metadata !{i32 56, i32 8, metadata !703, null}
!703 = metadata !{i32 786443, metadata !38, metadata !704, i32 56, i32 8, i32 2, i32 13} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!704 = metadata !{i32 786443, metadata !38, metadata !701, i32 56, i32 8, i32 1, i32 10} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!705 = metadata !{i32 57, i32 13, metadata !706, null}
!706 = metadata !{i32 786443, metadata !38, metadata !701, i32 56, i32 31, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!707 = metadata !{i32 59, i32 10, metadata !708, null}
!708 = metadata !{i32 786443, metadata !38, metadata !706, i32 59, i32 5, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!709 = metadata !{i32 59, i32 28, metadata !708, null}
!710 = metadata !{i32 59, i32 28, metadata !711, null}
!711 = metadata !{i32 786443, metadata !38, metadata !712, i32 59, i32 28, i32 2, i32 12} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!712 = metadata !{i32 786443, metadata !38, metadata !708, i32 59, i32 28, i32 1, i32 11} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!713 = metadata !{i32 60, i32 8, metadata !708, null}
!714 = metadata !{i32 59, i32 52, metadata !708, null}
!715 = metadata !{i32 62, i32 12, metadata !706, null}
!716 = metadata !{i32 63, i32 5, metadata !706, null}
!717 = metadata !{i32 64, i32 9, metadata !718, null}
!718 = metadata !{i32 786443, metadata !38, metadata !706, i32 64, i32 9, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!719 = metadata !{i32 65, i32 3, metadata !720, null}
!720 = metadata !{i32 786443, metadata !38, metadata !718, i32 64, i32 20, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!721 = metadata !{i32 66, i32 3, metadata !720, null}
!722 = metadata !{i32 67, i32 5, metadata !720, null}
!723 = metadata !{i32 68, i32 9, metadata !724, null}
!724 = metadata !{i32 786443, metadata !38, metadata !706, i32 68, i32 9, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!725 = metadata !{i32 69, i32 3, metadata !726, null}
!726 = metadata !{i32 786443, metadata !38, metadata !724, i32 68, i32 20, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnts.c]
!727 = metadata !{i32 70, i32 3, metadata !726, null}
!728 = metadata !{i32 71, i32 5, metadata !726, null}
!729 = metadata !{i32 73, i32 5, metadata !706, null}
!730 = metadata !{i32 74, i32 3, metadata !706, null}
!731 = metadata !{i32 56, i32 26, metadata !701, null}
!732 = metadata !{i32 75, i32 3, metadata !40, null}
!733 = metadata !{i32 76, i32 3, metadata !40, null}
!734 = metadata !{i32 77, i32 3, metadata !40, null}
!735 = metadata !{i32 38, i32 28, metadata !32, null}
!736 = metadata !{i32 786689, metadata !32, metadata !"x", metadata !33, i32 16777254, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 38]
!737 = metadata !{i32 786688, metadata !32, metadata !"cnt", metadata !33, i32 40, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cnt] [line 40]
!738 = metadata !{i32 40, i32 11, metadata !32, null}
!739 = metadata !{i32 40, i32 7, metadata !32, null}
!740 = metadata !{i32 42, i32 11, metadata !741, null}
!741 = metadata !{i32 786443, metadata !30, metadata !32, i32 42, i32 11, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/automotive/bitcount/bitcnt_4.c]
!742 = metadata !{i32 43, i32 20, metadata !741, null}
!743 = metadata !{i32 45, i32 7, metadata !32, null}
!744 = metadata !{i32 42, i32 34, metadata !19, null}
!745 = metadata !{i32 786689, metadata !19, metadata !"x", metadata !20, i32 16777258, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 42]
!746 = metadata !{i32 44, i32 7, metadata !19, null}
