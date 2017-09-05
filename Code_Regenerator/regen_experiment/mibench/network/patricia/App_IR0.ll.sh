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
%struct.ptree.3 = type { i64, %struct.ptree_mask.2*, i8, i8, %struct.ptree.3*, %struct.ptree.3* }
%struct.ptree_mask.2 = type { i64, i8* }
%struct.in_addr.4 = type { i32 }
%struct.MyNode.5 = type { i32, double }

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
@sdmprofile__BBcounter_89 = global i64 0, align 8
@sdmprofile__BBcounter_90 = global i64 0, align 8
@sdmprofile__BBcounter_91 = global i64 0, align 8
@sdmprofile__BBcounter_92 = global i64 0, align 8
@sdmprofile__BBcounter_93 = global i64 0, align 8
@sdmprofile__BBcounter_94 = global i64 0, align 8
@sdmprofile__BBcounter_95 = global i64 0, align 8
@sdmprofile__BBcounter_96 = global i64 0, align 8
@sdmprofile__BBcounter_97 = global i64 0, align 8
@sdmprofile__BBcounter_98 = global i64 0, align 8
@sdmprofile__BBcounter_99 = global i64 0, align 8
@sdmprofile__BBcounter_100 = global i64 0, align 8
@sdmprofile__BBcounter_101 = global i64 0, align 8
@sdmprofile__BBcounter_102 = global i64 0, align 8
@sdmprofile__BBcounter_103 = global i64 0, align 8
@sdmprofile__BBcounter_104 = global i64 0, align 8
@sdmprofile__BBcounter_105 = global i64 0, align 8
@sdmprofile__BBcounter_106 = global i64 0, align 8
@sdmprofile__BBcounter_107 = global i64 0, align 8
@sdmprofile__BBcounter_108 = global i64 0, align 8
@sdmprofile__BBcounter_109 = global i64 0, align 8
@sdmprofile__BBcounter_110 = global i64 0, align 8
@sdmprofile__BBcounter_111 = global i64 0, align 8
@sdmprofile__BBcounter_112 = global i64 0, align 8
@sdmprofile__BBcounter_113 = global i64 0, align 8
@sdmprofile__BBcounter_114 = global i64 0, align 8
@sdmprofile__BBcounter_115 = global i64 0, align 8
@sdmprofile__BBcounter_116 = global i64 0, align 8
@sdmprofile__BBcounter_117 = global i64 0, align 8
@sdmprofile__BBcounter_118 = global i64 0, align 8
@sdmprofile__BBcounter_119 = global i64 0, align 8
@sdmprofile__BBcounter_120 = global i64 0, align 8
@sdmprofile__BBcounter_121 = global i64 0, align 8
@sdmprofile__BBcounter_122 = global i64 0, align 8
@sdmprofile__BBcounter_123 = global i64 0, align 8
@sdmprofile__BBcounter_124 = global i64 0, align 8
@sdmprofile__BBcounter_125 = global i64 0, align 8
@sdmprofile__BBcounter_126 = global i64 0, align 8
@sdmprofile__BBcounter_127 = global i64 0, align 8
@sdmprofile__BBcounter_128 = global i64 0, align 8
@sdmprofile__BBcounter_129 = global i64 0, align 8
@sdmprofile__BBcounter_130 = global i64 0, align 8
@sdmprofile__BBcounter_131 = global i64 0, align 8
@sdmprofile__BBcounter_132 = global i64 0, align 8
@sdmprofile__BBcounter_133 = global i64 0, align 8
@sdmprofile__BBcounter_134 = global i64 0, align 8
@sdmprofile__BBcounter_135 = global i64 0, align 8
@sdmprofile__BBcounter_136 = global i64 0, align 8
@sdmprofile__BBcounter_137 = global i64 0, align 8
@sdmprofile__BBcounter_138 = global i64 0, align 8
@sdmprofile__BBcounter_139 = global i64 0, align 8
@sdmprofile__BBcounter_140 = global i64 0, align 8
@sdmprofile__BBcounter_141 = global i64 0, align 8
@sdmprofile__BBcounter_142 = global i64 0, align 8
@sdmprofile__BBcounter_143 = global i64 0, align 8
@sdmprofile__BBcounter_144 = global i64 0, align 8
@sdmprofile__BBcounter_145 = global i64 0, align 8
@sdmprofile__BBcounter_146 = global i64 0, align 8
@sdmprofile__BBcounter_147 = global i64 0, align 8
@sdmprofile__BBcounter_148 = global i64 0, align 8
@sdmprofile__BBcounter_149 = global i64 0, align 8
@sdmprofile__BBcounter_150 = global i64 0, align 8
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
@.str1 = private unnamed_addr constant [24 x i8] c"Usage: %s <TCP stream>\0A\00", align 1
@.str16 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str2 = private unnamed_addr constant [31 x i8] c"File %s doesn't seem to exist\0A\00", align 1
@.str37 = private unnamed_addr constant [23 x i8] c"Allocating p-trie node\00", align 1
@.str48 = private unnamed_addr constant [28 x i8] c"Allocating p-trie mask data\00", align 1
@.str59 = private unnamed_addr constant [35 x i8] c"Allocating p-trie mask's node data\00", align 1
@.str610 = private unnamed_addr constant [6 x i8] c"%f %d\00", align 1
@.str711 = private unnamed_addr constant [10 x i8] c"%f %08x: \00", align 1
@.str812 = private unnamed_addr constant [8 x i8] c"Found.\0A\00", align 1
@.str913 = private unnamed_addr constant [22 x i8] c"Failed on pat_insert\0A\00", align 1
@sdmprofile__HP_Name_1 = private unnamed_addr constant [6 x i8] c"--,--\00"
@sdmprofile__HP_Type_1 = private unnamed_addr constant [17 x i8] c"%struct.ptree.3*\00"
@sdmprofile__HP_Fname_1 = private unnamed_addr constant [20 x i8] c"app__mainfunction__\00"
@sdmprofile__HP_SourceFile_1 = private unnamed_addr constant [16 x i8] c"patricia_test.c\00"
@sdmprofile__HP_Name_2 = private unnamed_addr constant [6 x i8] c"--,--\00"
@sdmprofile__HP_Type_2 = private unnamed_addr constant [22 x i8] c"%struct.ptree_mask.2*\00"
@sdmprofile__HP_Fname_2 = private unnamed_addr constant [20 x i8] c"app__mainfunction__\00"
@sdmprofile__HP_SourceFile_2 = private unnamed_addr constant [16 x i8] c"patricia_test.c\00"
@sdmprofile__HP_Name_3 = private unnamed_addr constant [6 x i8] c"--,--\00"
@sdmprofile__HP_Type_3 = private unnamed_addr constant [17 x i8] c"%struct.ptree.3*\00"
@sdmprofile__HP_Fname_3 = private unnamed_addr constant [20 x i8] c"app__mainfunction__\00"
@sdmprofile__HP_SourceFile_3 = private unnamed_addr constant [16 x i8] c"patricia_test.c\00"
@sdmprofile__HP_Name_4 = private unnamed_addr constant [6 x i8] c"--,--\00"
@sdmprofile__HP_Type_4 = private unnamed_addr constant [18 x i8] c"%struct.MyNode.5*\00"
@sdmprofile__HP_Fname_4 = private unnamed_addr constant [20 x i8] c"app__mainfunction__\00"
@sdmprofile__HP_SourceFile_4 = private unnamed_addr constant [16 x i8] c"patricia_test.c\00"
@sdmprofile__HP_Name_5 = private unnamed_addr constant [6 x i8] c"--,--\00"
@sdmprofile__HP_Type_5 = private unnamed_addr constant [22 x i8] c"%struct.ptree_mask.2*\00"
@sdmprofile__HP_Fname_5 = private unnamed_addr constant [20 x i8] c"app__mainfunction__\00"
@sdmprofile__HP_SourceFile_5 = private unnamed_addr constant [16 x i8] c"patricia_test.c\00"
@sdmprofile__HP_Name_6 = private unnamed_addr constant [6 x i8] c"--,--\00"
@sdmprofile__HP_Type_6 = private unnamed_addr constant [18 x i8] c"%struct.MyNode.5*\00"
@sdmprofile__HP_Fname_6 = private unnamed_addr constant [20 x i8] c"app__mainfunction__\00"
@sdmprofile__HP_SourceFile_6 = private unnamed_addr constant [16 x i8] c"patricia_test.c\00"
@sdmprofile__HP_Name_7 = private unnamed_addr constant [6 x i8] c"--,--\00"
@sdmprofile__HP_Type_7 = private unnamed_addr constant [22 x i8] c"%struct.ptree_mask.2*\00"
@sdmprofile__HP_Fname_7 = private unnamed_addr constant [11 x i8] c"pat_insert\00"
@sdmprofile__HP_SourceFile_7 = private unnamed_addr constant [11 x i8] c"patricia.c\00"
@sdmprofile__HP_Name_8 = private unnamed_addr constant [6 x i8] c"--,--\00"
@sdmprofile__HP_Type_8 = private unnamed_addr constant [22 x i8] c"%struct.ptree_mask.2*\00"
@sdmprofile__HP_Fname_8 = private unnamed_addr constant [11 x i8] c"pat_remove\00"
@sdmprofile__HP_SourceFile_8 = private unnamed_addr constant [11 x i8] c"patricia.c\00"

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
  store %struct.HeapAllocationMeta* %0, %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !52
  %call1 = tail call i32 @_Z17RegisterNewThreadv()
  store i32 %call1, i32* @sdmprofile__MainthreadNumber, align 4, !tbaa !56
  %1 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !52
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %1, i64 0, i32 1
  %2 = bitcast i8** %upperbound to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 20, i32 8, i1 false)
  %3 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !52
  %ptr = getelementptr inbounds %struct.HeapAllocationMeta* %3, i64 0, i32 0
  store i8* null, i8** %ptr, align 8, !tbaa !58
  store i64 0, i64* getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 0), align 8, !tbaa !61
  store i8* null, i8** getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 3), align 8, !tbaa !63
  store i32 0, i32* getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 4), align 8, !tbaa !64
  call void @llvm.memset.p0i8.i64(i8* bitcast (i8** getelementptr inbounds (%struct.GVMeta* @Empty_GV_Item, i64 0, i32 5) to i8*), i8 0, i64 24, i32 8, i1 false)
  %4 = load i32* @sdmprofile__IncludeStackProfiling, align 4, !tbaa !56
  %tobool = icmp eq i32 %4, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call2 = tail call noalias i8* @malloc(i64 240000) #2
  %5 = bitcast i8* %call2 to %struct.sdmprofile__Allocated_Stack_item*
  store %struct.sdmprofile__Allocated_Stack_item* %5, %struct.sdmprofile__Allocated_Stack_item** @sdmprofile__MainthreadStack_allo, align 8, !tbaa !52
  %ptr.ind.end = getelementptr i8* %call2, i64 240000
  %6 = bitcast i8* %ptr.ind.end to %struct.sdmprofile__Allocated_Stack_item*
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %if.then
  %index = phi i64 [ 0, %if.then ], [ %index.next.1, %vector.body ]
  %gep.idx1315 = or i64 %index, 1
  %7 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index, i32 0
  %8 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315, i32 0
  store i8* null, i8** %7, align 8, !tbaa !65
  store i8* null, i8** %8, align 8, !tbaa !65
  %9 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index, i32 2
  %10 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315, i32 2
  store i8* null, i8** %9, align 8, !tbaa !67
  store i8* null, i8** %10, align 8, !tbaa !67
  %index.next = add i64 %index, 2
  %gep.idx1315.1 = or i64 %index.next, 1
  %11 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index.next, i32 0
  %12 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315.1, i32 0
  store i8* null, i8** %11, align 8, !tbaa !65
  store i8* null, i8** %12, align 8, !tbaa !65
  %13 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %index.next, i32 2
  %14 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %5, i64 %gep.idx1315.1, i32 2
  store i8* null, i8** %13, align 8, !tbaa !67
  store i8* null, i8** %14, align 8, !tbaa !67
  %index.next.1 = add i64 %index.next, 2
  %15 = icmp eq i64 %index.next.1, 10000
  br i1 %15, label %if.end.loopexit, label %vector.body, !llvm.loop !68

if.end.loopexit:                                  ; preds = %vector.body
  br label %if.end

if.end:                                           ; preds = %if.end.loopexit, %entry
  store double 0.000000e+00, double* @sdmprofile__AppEndTime, align 8, !tbaa !71
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind uwtable
define i32 @_Z17RegisterNewThreadv() #3 {
entry:
  %call = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %0 = load i32* @thdsCount, align 4, !tbaa !56
  %idxprom = sext i32 %0 to i64
  %threadnumber = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 0
  store i32 %0, i32* %threadnumber, align 8, !tbaa !73
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @thdsCount, align 4, !tbaa !56
  %call1 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %call2 = tail call i64 @pthread_self() #12
  %threadID = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 1
  store i64 %call2, i64* %threadID, align 8, !tbaa !75
  %call3 = tail call double @sdmprofile__getRealTime()
  %ThreadStartTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 2
  store double %call3, double* %ThreadStartTime, align 8, !tbaa !76
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double 0.000000e+00, double* %ThreadEndTime, align 8, !tbaa !77
  %Malloc_Calls = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 6
  %1 = bitcast i64* %Malloc_Calls to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 88, i32 8, i1 false)
  %2 = load i32* @sdmprofile__profileAction, align 4, !tbaa !56
  switch i32 %2, label %if.end [
    i32 4, label %if.then
    i32 1, label %if.then
  ]

if.then:                                          ; preds = %entry, %entry
  %call5 = tail call noalias i8* @malloc(i64 128) #2
  %3 = bitcast i8* %call5 to %struct.Cache2_Item*
  %Cache2_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 19
  store %struct.Cache2_Item* %3, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !78
  %4 = load %struct.HeapAllocationMeta** @Empty_Item, align 8, !tbaa !52
  %ptr = bitcast i8* %call5 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !79
  %add.ptr8 = getelementptr inbounds i8* %call5, i64 16
  %5 = bitcast i8* %add.ptr8 to %struct.Cache2_Item*
  %next = getelementptr inbounds i8* %call5, i64 8
  %6 = bitcast i8* %next to %struct.Cache2_Item**
  store %struct.Cache2_Item* %5, %struct.Cache2_Item** %6, align 8, !tbaa !81
  %ptr.1 = getelementptr inbounds i8* %call5, i64 16
  %7 = bitcast i8* %ptr.1 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %7, align 8, !tbaa !79
  %add.ptr8.1 = getelementptr inbounds i8* %call5, i64 32
  %8 = bitcast i8* %add.ptr8.1 to %struct.Cache2_Item*
  %next.1 = getelementptr inbounds i8* %call5, i64 24
  %9 = bitcast i8* %next.1 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %8, %struct.Cache2_Item** %9, align 8, !tbaa !81
  %ptr.2 = getelementptr inbounds i8* %call5, i64 32
  %10 = bitcast i8* %ptr.2 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %10, align 8, !tbaa !79
  %add.ptr8.2 = getelementptr inbounds i8* %call5, i64 48
  %11 = bitcast i8* %add.ptr8.2 to %struct.Cache2_Item*
  %next.2 = getelementptr inbounds i8* %call5, i64 40
  %12 = bitcast i8* %next.2 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %11, %struct.Cache2_Item** %12, align 8, !tbaa !81
  %ptr.3 = getelementptr inbounds i8* %call5, i64 48
  %13 = bitcast i8* %ptr.3 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %13, align 8, !tbaa !79
  %add.ptr8.3 = getelementptr inbounds i8* %call5, i64 64
  %14 = bitcast i8* %add.ptr8.3 to %struct.Cache2_Item*
  %next.3 = getelementptr inbounds i8* %call5, i64 56
  %15 = bitcast i8* %next.3 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %14, %struct.Cache2_Item** %15, align 8, !tbaa !81
  %ptr.4 = getelementptr inbounds i8* %call5, i64 64
  %16 = bitcast i8* %ptr.4 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %16, align 8, !tbaa !79
  %add.ptr8.4 = getelementptr inbounds i8* %call5, i64 80
  %17 = bitcast i8* %add.ptr8.4 to %struct.Cache2_Item*
  %next.4 = getelementptr inbounds i8* %call5, i64 72
  %18 = bitcast i8* %next.4 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %17, %struct.Cache2_Item** %18, align 8, !tbaa !81
  %ptr.5 = getelementptr inbounds i8* %call5, i64 80
  %19 = bitcast i8* %ptr.5 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %19, align 8, !tbaa !79
  %add.ptr8.5 = getelementptr inbounds i8* %call5, i64 96
  %20 = bitcast i8* %add.ptr8.5 to %struct.Cache2_Item*
  %next.5 = getelementptr inbounds i8* %call5, i64 88
  %21 = bitcast i8* %next.5 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %20, %struct.Cache2_Item** %21, align 8, !tbaa !81
  %ptr.6 = getelementptr inbounds i8* %call5, i64 96
  %22 = bitcast i8* %ptr.6 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %22, align 8, !tbaa !79
  %add.ptr8.6 = getelementptr inbounds i8* %call5, i64 112
  %23 = bitcast i8* %add.ptr8.6 to %struct.Cache2_Item*
  %next.6 = getelementptr inbounds i8* %call5, i64 104
  %24 = bitcast i8* %next.6 to %struct.Cache2_Item**
  store %struct.Cache2_Item* %23, %struct.Cache2_Item** %24, align 8, !tbaa !81
  %add.ptr10 = getelementptr inbounds i8* %call5, i64 112
  %ptr11 = bitcast i8* %add.ptr10 to %struct.HeapAllocationMeta**
  store %struct.HeapAllocationMeta* %4, %struct.HeapAllocationMeta** %ptr11, align 8, !tbaa !79
  %next13 = getelementptr inbounds i8* %call5, i64 120
  %25 = bitcast i8* %next13 to %struct.Cache2_Item**
  store %struct.Cache2_Item* null, %struct.Cache2_Item** %25, align 8, !tbaa !81
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %.off = add i32 %2, -3
  %26 = icmp ult i32 %.off, 2
  br i1 %26, label %if.then17, label %if.end39

if.then17:                                        ; preds = %if.end
  %call19 = tail call noalias i8* @malloc(i64 128) #2
  %27 = bitcast i8* %call19 to %struct.GVCache_Item*
  %GVCache_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 20
  store %struct.GVCache_Item* %27, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !82
  %ptr27 = bitcast i8* %call19 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %ptr27, align 8, !tbaa !83
  %add.ptr30 = getelementptr inbounds i8* %call19, i64 16
  %28 = bitcast i8* %add.ptr30 to %struct.GVCache_Item*
  %next31 = getelementptr inbounds i8* %call19, i64 8
  %29 = bitcast i8* %next31 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %28, %struct.GVCache_Item** %29, align 8, !tbaa !85
  %ptr27.1 = getelementptr inbounds i8* %call19, i64 16
  %30 = bitcast i8* %ptr27.1 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %30, align 8, !tbaa !83
  %add.ptr30.1 = getelementptr inbounds i8* %call19, i64 32
  %31 = bitcast i8* %add.ptr30.1 to %struct.GVCache_Item*
  %next31.1 = getelementptr inbounds i8* %call19, i64 24
  %32 = bitcast i8* %next31.1 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %31, %struct.GVCache_Item** %32, align 8, !tbaa !85
  %ptr27.2 = getelementptr inbounds i8* %call19, i64 32
  %33 = bitcast i8* %ptr27.2 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %33, align 8, !tbaa !83
  %add.ptr30.2 = getelementptr inbounds i8* %call19, i64 48
  %34 = bitcast i8* %add.ptr30.2 to %struct.GVCache_Item*
  %next31.2 = getelementptr inbounds i8* %call19, i64 40
  %35 = bitcast i8* %next31.2 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %34, %struct.GVCache_Item** %35, align 8, !tbaa !85
  %ptr27.3 = getelementptr inbounds i8* %call19, i64 48
  %36 = bitcast i8* %ptr27.3 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %36, align 8, !tbaa !83
  %add.ptr30.3 = getelementptr inbounds i8* %call19, i64 64
  %37 = bitcast i8* %add.ptr30.3 to %struct.GVCache_Item*
  %next31.3 = getelementptr inbounds i8* %call19, i64 56
  %38 = bitcast i8* %next31.3 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %37, %struct.GVCache_Item** %38, align 8, !tbaa !85
  %ptr27.4 = getelementptr inbounds i8* %call19, i64 64
  %39 = bitcast i8* %ptr27.4 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %39, align 8, !tbaa !83
  %add.ptr30.4 = getelementptr inbounds i8* %call19, i64 80
  %40 = bitcast i8* %add.ptr30.4 to %struct.GVCache_Item*
  %next31.4 = getelementptr inbounds i8* %call19, i64 72
  %41 = bitcast i8* %next31.4 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %40, %struct.GVCache_Item** %41, align 8, !tbaa !85
  %ptr27.5 = getelementptr inbounds i8* %call19, i64 80
  %42 = bitcast i8* %ptr27.5 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %42, align 8, !tbaa !83
  %add.ptr30.5 = getelementptr inbounds i8* %call19, i64 96
  %43 = bitcast i8* %add.ptr30.5 to %struct.GVCache_Item*
  %next31.5 = getelementptr inbounds i8* %call19, i64 88
  %44 = bitcast i8* %next31.5 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %43, %struct.GVCache_Item** %44, align 8, !tbaa !85
  %ptr27.6 = getelementptr inbounds i8* %call19, i64 96
  %45 = bitcast i8* %ptr27.6 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %45, align 8, !tbaa !83
  %add.ptr30.6 = getelementptr inbounds i8* %call19, i64 112
  %46 = bitcast i8* %add.ptr30.6 to %struct.GVCache_Item*
  %next31.6 = getelementptr inbounds i8* %call19, i64 104
  %47 = bitcast i8* %next31.6 to %struct.GVCache_Item**
  store %struct.GVCache_Item* %46, %struct.GVCache_Item** %47, align 8, !tbaa !85
  %add.ptr35 = getelementptr inbounds i8* %call19, i64 112
  %ptr36 = bitcast i8* %add.ptr35 to %struct.GVMeta**
  store %struct.GVMeta* @Empty_GV_Item, %struct.GVMeta** %ptr36, align 8, !tbaa !83
  %next38 = getelementptr inbounds i8* %call19, i64 120
  %48 = bitcast i8* %next38 to %struct.GVCache_Item**
  store %struct.GVCache_Item* null, %struct.GVCache_Item** %48, align 8, !tbaa !85
  br label %if.end39

if.end39:                                         ; preds = %if.then17, %if.end
  %49 = load i32* @sdmprofile__IncludeStackProfiling, align 4, !tbaa !56
  %tobool = icmp eq i32 %49, 0
  br i1 %tobool, label %if.end42, label %if.then40

if.then40:                                        ; preds = %if.end39
  %call41 = tail call noalias i8* @malloc(i64 240000) #2
  %50 = bitcast i8* %call41 to %struct.sdmprofile__Allocated_Stack_item*
  %Stack_allocations_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 4
  store %struct.sdmprofile__Allocated_Stack_item* %50, %struct.sdmprofile__Allocated_Stack_item** %Stack_allocations_head, align 8, !tbaa !86
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %if.end39
  %51 = load i32* %threadnumber, align 8, !tbaa !73
  ret i32 %51
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__Embed_metadata_GV(i64 %index__, i8* %AtAddress, i32 %size_, i8* %Name_string_ptr, i8* %DataType_string_ptr, i8* %FilenameStringptr_, i8* %FileDirStringptr_, i64 %linenumber__) #3 {
entry:
  %I = alloca %struct.GVMeta*, align 8
  %call = tail call noalias i8* @malloc(i64 88) #2
  %0 = bitcast i8* %call to %struct.GVMeta*
  store %struct.GVMeta* %0, %struct.GVMeta** %I, align 8, !tbaa !52
  %index = bitcast i8* %call to i64*
  store i64 %index__, i64* %index, align 8, !tbaa !61
  %address = getelementptr inbounds i8* %call, i64 24
  %1 = bitcast i8* %address to i8**
  store i8* %AtAddress, i8** %1, align 8, !tbaa !63
  %size = getelementptr inbounds i8* %call, i64 32
  %2 = bitcast i8* %size to i32*
  store i32 %size_, i32* %2, align 4, !tbaa !64
  %VarName = getelementptr inbounds i8* %call, i64 40
  %3 = bitcast i8* %VarName to i8**
  store i8* %Name_string_ptr, i8** %3, align 8, !tbaa !87
  %DataTypeString = getelementptr inbounds i8* %call, i64 48
  %4 = bitcast i8* %DataTypeString to i8**
  store i8* %DataType_string_ptr, i8** %4, align 8, !tbaa !88
  %5 = ptrtoint i8* %AtAddress to i64
  %conv = zext i32 %size_ to i64
  %add = add i64 %conv, %5
  %6 = inttoptr i64 %add to i8*
  %upperbound = getelementptr inbounds i8* %call, i64 56
  %7 = bitcast i8* %upperbound to i8**
  store i8* %6, i8** %7, align 8, !tbaa !89
  %r = getelementptr inbounds i8* %call, i64 8
  %FileName = getelementptr inbounds i8* %call, i64 64
  %8 = bitcast i8* %FileName to i8**
  call void @llvm.memset.p0i8.i64(i8* %r, i8 0, i64 16, i32 8, i1 false)
  store i8* %FilenameStringptr_, i8** %8, align 8, !tbaa !90
  %DirName = getelementptr inbounds i8* %call, i64 72
  %9 = bitcast i8* %DirName to i8**
  store i8* %FileDirStringptr_, i8** %9, align 8, !tbaa !91
  %linenumber = getelementptr inbounds i8* %call, i64 80
  %10 = bitcast i8* %linenumber to i64*
  store i64 %linenumber__, i64* %10, align 8, !tbaa !92
  call void @_ZNSt12forward_listIP6GVMetaSaIS1_EE10push_frontERKS1_(%"class.std::forward_list"* @GVMetalist, %struct.GVMeta** dereferenceable(8) %I)
  %11 = load i8** @GV_AddrRangeHead, align 8, !tbaa !52
  %cmp = icmp eq i8* %11, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i8* %AtAddress, i8** @GV_AddrRangeHead, align 8, !tbaa !52
  store i8* %6, i8** @GV_AddrRangeTail, align 8, !tbaa !52
  br label %if.end12

if.else:                                          ; preds = %entry
  %cmp3 = icmp ugt i8* %11, %AtAddress
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.else
  store i8* %AtAddress, i8** @GV_AddrRangeHead, align 8, !tbaa !52
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.else
  %12 = load i8** @GV_AddrRangeTail, align 8, !tbaa !52
  %cmp7 = icmp ult i8* %12, %6
  br i1 %cmp7, label %if.then8, label %if.end12

if.then8:                                         ; preds = %if.end
  store i8* %6, i8** @GV_AddrRangeTail, align 8, !tbaa !52
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
  store i64 %index__, i64* %index, align 8, !tbaa !93
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 3
  store i32 %size_, i32* %size, align 8, !tbaa !95
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 4
  store i8* %Estimated_Name_string_ptr, i8** %EstimatedName, align 8, !tbaa !96
  %DataTypeString = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 5
  store i8* %DataType_string_ptr, i8** %DataTypeString, align 8, !tbaa !97
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 6
  store i8* %FunctionName_string_ptr, i8** %FunctionName, align 8, !tbaa !98
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__Embed_metadata_HP(i32 %index__, i8* %Estimated_Name_string_ptr, i8* %DataType_string_ptr, i8* %FunctionName_string_ptr, i64 %linenumber__, i8* %SourceFile__) #3 {
entry:
  %idxprom = zext i32 %index__ to i64
  %index = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 0
  store i32 %index__, i32* %index, align 16, !tbaa !99
  %EstimatedName = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 3
  store i8* %Estimated_Name_string_ptr, i8** %EstimatedName, align 8, !tbaa !101
  %EstimatedDataTypeString = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 4
  store i8* %DataType_string_ptr, i8** %EstimatedDataTypeString, align 16, !tbaa !102
  %FunctionName = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 5
  store i8* %FunctionName_string_ptr, i8** %FunctionName, align 8, !tbaa !103
  %linenumber = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 6
  store i64 %linenumber__, i64* %linenumber, align 16, !tbaa !104
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom, i32 7
  store i8* %SourceFile__, i8** %SourceFile, align 8, !tbaa !105
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
  %0 = load %struct.GVMeta** %call4, align 8, !tbaa !52
  %index = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 0
  %1 = load i64* %index, align 8, !tbaa !61
  %cmp = icmp eq i64 %1, %index__
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %r = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 1
  %2 = load i64* %r, align 8, !tbaa !106
  %add = add i64 %2, %mul
  store i64 %add, i64* %r, align 8, !tbaa !106
  %w = getelementptr inbounds %struct.GVMeta* %0, i64 0, i32 2
  %3 = load i64* %w, align 8, !tbaa !107
  %add8 = add i64 %3, %mul7
  store i64 %add8, i64* %w, align 8, !tbaa !107
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
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !108
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
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !112
  %_M_node2 = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %__x, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_node2, align 8, !tbaa !112
  %cmp = icmp ne %"struct.std::_Fwd_list_node_base"* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(8) %struct.GVMeta** @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEdeEv(%"struct.std::_Fwd_list_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !112
  %1 = bitcast %"struct.std::_Fwd_list_node_base"* %0 to %"struct.std::_Fwd_list_node"*
  %call = tail call %struct.GVMeta** @_ZNSt14_Fwd_list_nodeIP6GVMetaE9_M_valptrEv(%"struct.std::_Fwd_list_node"* %1) #2
  ret %struct.GVMeta** %call
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %this) #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_Fwd_list_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !112
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %0, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !114
  store %"struct.std::_Fwd_list_node_base"* %1, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !112
  ret %"struct.std::_Fwd_list_iterator"* %this
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__AddBBHitcount_ST(i64 %index__, i64 %BBhitcount, i32 %Rcount, i32 %Wcount) #3 {
entry:
  %r = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 1
  %0 = load i64* %r, align 8, !tbaa !115
  %conv = sext i32 %Rcount to i64
  %mul = mul i64 %conv, %BBhitcount
  %add = add i64 %0, %mul
  store i64 %add, i64* %r, align 8, !tbaa !115
  %w = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %index__, i32 2
  %1 = load i64* %w, align 8, !tbaa !116
  %conv4 = sext i32 %Wcount to i64
  %mul5 = mul i64 %conv4, %BBhitcount
  %add6 = add i64 %1, %mul5
  store i64 %add6, i64* %w, align 8, !tbaa !116
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
  store i64 %cc, i64* %arrayidx, align 8, !tbaa !117
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
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !77
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
  %0 = load i64* %tv_sec, align 8, !tbaa !118
  %conv = sitofp i64 %0 to double
  %tv_nsec = getelementptr inbounds %struct.timespec* %ts, i64 0, i32 1
  %1 = load i64* %tv_nsec, align 8, !tbaa !120
  %conv1 = sitofp i64 %1 to double
  %div = fdiv double %conv1, 1.000000e+09
  %add = fadd double %conv, %div
  br label %return

if.end:                                           ; preds = %entry
  %call2 = call i32 @gettimeofday(%struct.timeval* %tm, %struct.timezone* null) #2
  %tv_sec3 = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 0
  %2 = load i64* %tv_sec3, align 8, !tbaa !121
  %conv4 = sitofp i64 %2 to double
  %tv_usec = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 1
  %3 = load i64* %tv_usec, align 8, !tbaa !123
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
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !77
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template3(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %conv = zext i32 %call to i64
  %call4 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %conv, i32 3
  store double %call4, double* %ThreadEndTime, align 8, !tbaa !77
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template4(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %conv = zext i32 %call to i64
  %call4 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %conv, i32 3
  store double %call4, double* %ThreadEndTime, align 8, !tbaa !77
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template5(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %call2 = tail call double @sdmprofile__getRealTime()
  %idxprom = zext i32 %call to i64
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !77
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @sdmprofile__ptCallBack_template6(i8* nocapture readnone %arg1) #3 {
entry:
  %call = tail call i32 @_Z17RegisterNewThreadv()
  %idxprom = zext i32 %call to i64
  %call2 = tail call double @sdmprofile__getRealTime()
  %ThreadEndTime = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 3
  store double %call2, double* %ThreadEndTime, align 8, !tbaa !77
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define i8* @sdmprofile__malloc(i64 %size_, i32 %heap_index, i32 %thdnumber) #3 {
entry:
  %I = alloca %struct.HeapAllocationMeta*, align 8
  %call = tail call noalias i8* @malloc(i64 %size_) #2
  %idxprom = zext i32 %thdnumber to i64
  %Malloc_Calls = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 6
  %0 = load i64* %Malloc_Calls, align 8, !tbaa !124
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Malloc_Calls, align 8, !tbaa !124
  %call1 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %call2 = tail call noalias i8* @malloc(i64 40) #2
  %1 = bitcast i8* %call2 to %struct.HeapAllocationMeta*
  store %struct.HeapAllocationMeta* %1, %struct.HeapAllocationMeta** %I, align 8, !tbaa !52
  %ptr = bitcast i8* %call2 to i8**
  store i8* %call, i8** %ptr, align 8, !tbaa !58
  %2 = ptrtoint i8* %call to i64
  %add = add i64 %2, %size_
  %3 = inttoptr i64 %add to i8*
  %upperbound = getelementptr inbounds i8* %call2, i64 8
  %4 = bitcast i8* %upperbound to i8**
  store i8* %3, i8** %4, align 8, !tbaa !125
  %size = getelementptr inbounds i8* %call2, i64 16
  %5 = bitcast i8* %size to i64*
  store i64 %size_, i64* %5, align 8, !tbaa !126
  %heapindex = getelementptr inbounds i8* %call2, i64 24
  %6 = bitcast i8* %heapindex to i32*
  store i32 %heap_index, i32* %6, align 4, !tbaa !127
  call void @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE10push_frontERKS1_(%"class.std::list"* @HeapAllocationList, %struct.HeapAllocationMeta** dereferenceable(8) %I)
  %call3 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @_ZL10threadlock) #2
  %Current_Heap_Allocation = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 10
  %7 = load i64* %Current_Heap_Allocation, align 8, !tbaa !128
  %inc6 = add i64 %7, 1
  store i64 %inc6, i64* %Current_Heap_Allocation, align 8, !tbaa !128
  %Peak_Heap_Allocation = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 8
  %8 = load i64* %Peak_Heap_Allocation, align 8, !tbaa !129
  %cmp = icmp ult i64 %8, %inc6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 %inc6, i64* %Peak_Heap_Allocation, align 8, !tbaa !129
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %idxprom18 = zext i32 %heap_index to i64
  %arrayidx19 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18
  store %struct.HPMeta* %arrayidx19, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !52
  %hitcount = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 8
  %9 = load i64* %hitcount, align 16, !tbaa !130
  %cmp20 = icmp eq i64 %9, 0
  %MaxSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 9
  br i1 %cmp20, label %if.then21, label %if.else

if.then21:                                        ; preds = %if.end
  store i64 %size_, i64* %MaxSize, align 8, !tbaa !131
  %MinSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 10
  store i64 %size_, i64* %MinSize, align 16, !tbaa !132
  br label %if.end32

if.else:                                          ; preds = %if.end
  %10 = load i64* %MaxSize, align 8, !tbaa !131
  %cmp23 = icmp ult i64 %10, %size_
  br i1 %cmp23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %if.else
  store i64 %size_, i64* %MaxSize, align 8, !tbaa !131
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %if.else
  %MinSize27 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 10
  %11 = load i64* %MinSize27, align 16, !tbaa !132
  %cmp28 = icmp ugt i64 %11, %size_
  br i1 %cmp28, label %if.then29, label %if.end32

if.then29:                                        ; preds = %if.end26
  store i64 %size_, i64* %MinSize27, align 16, !tbaa !132
  br label %if.end32

if.end32:                                         ; preds = %if.then29, %if.end26, %if.then21
  %hitcount33 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom18, i32 8
  %inc34 = add i64 %9, 1
  store i64 %inc34, i64* %hitcount33, align 16, !tbaa !130
  %12 = load i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !52
  %cmp35 = icmp eq i8* %12, null
  br i1 %cmp35, label %if.then36, label %if.else38

if.then36:                                        ; preds = %if.end32
  store i8* %call, i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !52
  store i8* %3, i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !52
  br label %if.end47

if.else38:                                        ; preds = %if.end32
  %cmp39 = icmp ugt i8* %12, %call
  br i1 %cmp39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.else38
  store i8* %call, i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !52
  br label %if.end41

if.end41:                                         ; preds = %if.then40, %if.else38
  %13 = load i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !52
  %cmp43 = icmp ult i8* %13, %3
  br i1 %cmp43, label %if.then44, label %if.end47

if.then44:                                        ; preds = %if.end41
  store i8* %3, i8** @sdmprofile__HP_addressRangeTo, align 8, !tbaa !52
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
  %0 = load i64* %Free_Calls, align 8, !tbaa !133
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Free_Calls, align 8, !tbaa !133
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
  %1 = load %struct.HeapAllocationMeta** %call5, align 8, !tbaa !52
  %ptr = getelementptr inbounds %struct.HeapAllocationMeta* %1, i64 0, i32 0
  %2 = load i8** %ptr, align 8, !tbaa !58
  %cmp = icmp eq i8* %2, %pointer
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %ptr.lcssa = phi i8** [ %ptr, %for.body ]
  %call5.lcssa = phi %struct.HeapAllocationMeta** [ %call5, %for.body ]
  store i8* null, i8** %ptr.lcssa, align 8, !tbaa !58
  %3 = load %struct.HeapAllocationMeta** %call5.lcssa, align 8, !tbaa !52
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %3, i64 0, i32 1
  store i8* null, i8** %upperbound, align 8, !tbaa !125
  %4 = load %struct.HeapAllocationMeta** %call5.lcssa, align 8, !tbaa !52
  %size = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 2
  store i64 0, i64* %size, align 8, !tbaa !126
  %heapindex = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 3
  store i32 0, i32* %heapindex, align 4, !tbaa !127
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
  %5 = load i64* %Current_Heap_Allocation, align 8, !tbaa !128
  %dec = add i64 %5, -1
  store i64 %dec, i64* %Current_Heap_Allocation, align 8, !tbaa !128
  call void @free(i8* %pointer) #2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden %"struct.std::__detail::_List_node_base"* @_ZNSt4listIP18HeapAllocationMetaSaIS1_EE5beginEv(%"class.std::list"* nocapture readonly %this) #3 align 2 {
entry:
  %retval = alloca %"struct.std::_List_iterator", align 8
  %_M_next = getelementptr inbounds %"class.std::list"* %this, i64 0, i32 0, i32 0, i32 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !134
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
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !138
  %_M_node2 = getelementptr inbounds %"struct.std::_List_iterator"* %__x, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_node2, align 8, !tbaa !138
  %cmp = icmp ne %"struct.std::__detail::_List_node_base"* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(8) %struct.HeapAllocationMeta** @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEdeEv(%"struct.std::_List_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_node = getelementptr inbounds %"struct.std::_List_iterator"* %this, i64 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !138
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
  store %"struct.std::__detail::_List_node_base"* %call2, %"struct.std::__detail::_List_node_base"** %0, align 8, !tbaa !52
  %call420 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__first, %"struct.std::_List_iterator"* dereferenceable(8) %__last)
  br i1 %call420, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %entry
  %1 = getelementptr inbounds %"struct.std::_List_iterator"* %__next, i64 0, i32 0
  br label %while.body

while.body:                                       ; preds = %if.end13, %while.body.lr.ph
  %agg.tmp16.sroa.0.0.copyload23 = phi %"struct.std::__detail::_List_node_base"* [ %call2, %while.body.lr.ph ], [ %agg.tmp16.sroa.0.0.copyload22, %if.end13 ]
  %2 = phi %"struct.std::__detail::_List_node_base"* [ %call, %while.body.lr.ph ], [ %5, %if.end13 ]
  store %"struct.std::__detail::_List_node_base"* %2, %"struct.std::__detail::_List_node_base"** %1, align 8, !tbaa !52
  %call5 = call dereferenceable(8) %"struct.std::_List_iterator"* @_ZNSt14_List_iteratorIP18HeapAllocationMetaEppEv(%"struct.std::_List_iterator"* %__next)
  %call6 = call dereferenceable(8) %struct.HeapAllocationMeta** @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEdeEv(%"struct.std::_List_iterator"* %__first)
  %3 = load %struct.HeapAllocationMeta** %call6, align 8, !tbaa !52
  %4 = load %struct.HeapAllocationMeta** %__value, align 8, !tbaa !52
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
  store %"struct.std::__detail::_List_node_base"* %2, %"struct.std::__detail::_List_node_base"** %0, align 8, !tbaa !52
  br label %if.end13

if.end13:                                         ; preds = %if.else, %if.then11, %while.body
  %agg.tmp16.sroa.0.0.copyload22 = phi %"struct.std::__detail::_List_node_base"* [ %agg.tmp16.sroa.0.0.copyload23, %if.then11 ], [ %2, %if.else ], [ %agg.tmp16.sroa.0.0.copyload23, %while.body ]
  %5 = load %"struct.std::__detail::_List_node_base"** %1, align 8, !tbaa !52
  store %"struct.std::__detail::_List_node_base"* %5, %"struct.std::__detail::_List_node_base"** %coerce.dive, align 8, !tbaa !52
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
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !138
  %_M_next = getelementptr inbounds %"struct.std::__detail::_List_node_base"* %0, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !140
  store %"struct.std::__detail::_List_node_base"* %1, %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !138
  ret %"struct.std::_List_iterator"* %this
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy1(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType) #3 {
entry:
  %0 = load i64* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 12), align 16, !tbaa !141
  %inc = add i64 %0, 1
  store i64 %inc, i64* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 12), align 16, !tbaa !141
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy2(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType, i32 %threadnumber) #3 {
entry:
  %idxprom = zext i32 %threadnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !141
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !141
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_Dummy3(i8* nocapture readnone %AtAddress, i8 zeroext %AccessType, i32 %threadnumber, %struct.sdmprofile__Allocated_Stack_item* nocapture readnone %ptr) #3 {
entry:
  %idxprom = zext i32 %threadnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !141
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !141
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_GVonly(i8* readnone %AtAddress, i8 zeroext %AccessType, i32 %thdnumber) #3 {
entry:
  %__begin = alloca %"struct.std::_Fwd_list_iterator", align 8
  %__end = alloca %"struct.std::_Fwd_list_iterator", align 8
  %idxprom = zext i32 %thdnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !141
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !141
  %1 = load i8** @GV_AddrRangeHead, align 8, !tbaa !52
  %cmp = icmp ule i8* %1, %AtAddress
  %2 = load i8** @GV_AddrRangeTail, align 8
  %cmp1 = icmp ugt i8* %2, %AtAddress
  %or.cond = and i1 %cmp, %cmp1
  br i1 %or.cond, label %if.then, label %return

if.then:                                          ; preds = %entry
  %SearchWithinAddressRange = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 14
  %3 = load i64* %SearchWithinAddressRange, align 8, !tbaa !142
  %inc4 = add i64 %3, 1
  store i64 %inc4, i64* %SearchWithinAddressRange, align 8, !tbaa !142
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
  %4 = load %struct.GVMeta** %ptr, align 8, !tbaa !83
  %address = getelementptr inbounds %struct.GVMeta* %4, i64 0, i32 3
  %5 = load i8** %address, align 8, !tbaa !63
  %cmp8 = icmp ugt i8* %5, %AtAddress
  br i1 %cmp8, label %if.else37, label %land.lhs.true9

land.lhs.true9:                                   ; preds = %while.body
  %upperbound = getelementptr inbounds %struct.GVMeta* %4, i64 0, i32 7
  %6 = load i8** %upperbound, align 8, !tbaa !89
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
  %7 = load i64* %r, align 8, !tbaa !106
  %inc14 = add i64 %7, 1
  store i64 %inc14, i64* %r, align 8, !tbaa !106
  br label %sw.epilog

sw.bb15:                                          ; preds = %if.then12
  %w = getelementptr inbounds %struct.GVMeta* %.lcssa154, i64 0, i32 2
  %8 = load i64* %w, align 8, !tbaa !107
  %inc17 = add i64 %8, 1
  store i64 %inc17, i64* %w, align 8, !tbaa !107
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb15, %sw.bb, %if.then12
  %Cache_Hits = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 16
  %9 = load i64* %Cache_Hits, align 8, !tbaa !143
  %inc20 = add i64 %9, 1
  store i64 %inc20, i64* %Cache_Hits, align 8, !tbaa !143
  %10 = load %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !82
  %cmp24 = icmp eq %struct.GVCache_Item* %I.0139.lcssa, %10
  br i1 %cmp24, label %return, label %if.else

if.else:                                          ; preds = %sw.epilog
  %next = getelementptr inbounds %struct.GVCache_Item* %I.0139.lcssa, i64 0, i32 1
  %11 = load %struct.GVCache_Item** %next, align 8, !tbaa !85
  %next26 = getelementptr inbounds %struct.GVCache_Item* %previous.0138.lcssa, i64 0, i32 1
  store %struct.GVCache_Item* %11, %struct.GVCache_Item** %next26, align 8, !tbaa !85
  store %struct.GVCache_Item* %I.0139.lcssa, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !82
  store %struct.GVCache_Item* %10, %struct.GVCache_Item** %next, align 8, !tbaa !85
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
  %12 = load %struct.GVMeta** %call44, align 8, !tbaa !52
  %address45 = getelementptr inbounds %struct.GVMeta* %12, i64 0, i32 3
  %13 = load i8** %address45, align 8, !tbaa !63
  %cmp46 = icmp ugt i8* %13, %AtAddress
  br i1 %cmp46, label %for.inc, label %land.lhs.true47

land.lhs.true47:                                  ; preds = %for.body
  %upperbound48 = getelementptr inbounds %struct.GVMeta* %12, i64 0, i32 7
  %14 = load i8** %upperbound48, align 8, !tbaa !89
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
  %15 = load i64* %r53, align 8, !tbaa !106
  %inc54 = add i64 %15, 1
  store i64 %inc54, i64* %r53, align 8, !tbaa !106
  br label %sw.epilog59

sw.bb55:                                          ; preds = %if.then50
  %w56 = getelementptr inbounds %struct.GVMeta* %.lcssa, i64 0, i32 2
  %16 = load i64* %w56, align 8, !tbaa !107
  %inc57 = add i64 %16, 1
  store i64 %inc57, i64* %w56, align 8, !tbaa !107
  br label %sw.epilog59

sw.epilog59:                                      ; preds = %sw.bb55, %sw.bb52, %if.then50
  %Cache_Miss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 15
  %17 = load i64* %Cache_Miss, align 8, !tbaa !144
  %inc68 = add i64 %17, 1
  store i64 %inc68, i64* %Cache_Miss, align 8, !tbaa !144
  %18 = load %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !82
  br label %while.cond75

for.inc:                                          ; preds = %land.lhs.true47, %for.body
  %call61 = call dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %call42 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call42, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %while.end
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %19 = load i64* %SearchMiss, align 8, !tbaa !145
  %inc64 = add i64 %19, 1
  store i64 %inc64, i64* %SearchMiss, align 8, !tbaa !145
  br label %return

while.cond75:                                     ; preds = %while.cond75, %sw.epilog59
  %previous70.0 = phi %struct.GVCache_Item* [ undef, %sw.epilog59 ], [ %I71.0, %while.cond75 ]
  %I71.0 = phi %struct.GVCache_Item* [ %18, %sw.epilog59 ], [ %20, %while.cond75 ]
  %next76 = getelementptr inbounds %struct.GVCache_Item* %I71.0, i64 0, i32 1
  %20 = load %struct.GVCache_Item** %next76, align 8, !tbaa !85
  %cmp77 = icmp eq %struct.GVCache_Item* %20, null
  br i1 %cmp77, label %while.end80, label %while.cond75

while.end80:                                      ; preds = %while.cond75
  %next76.lcssa = phi %struct.GVCache_Item** [ %next76, %while.cond75 ]
  %I71.0.lcssa = phi %struct.GVCache_Item* [ %I71.0, %while.cond75 ]
  %previous70.0.lcssa = phi %struct.GVCache_Item* [ %previous70.0, %while.cond75 ]
  %next81 = getelementptr inbounds %struct.GVCache_Item* %previous70.0.lcssa, i64 0, i32 1
  store %struct.GVCache_Item* null, %struct.GVCache_Item** %next81, align 8, !tbaa !85
  store %struct.GVCache_Item* %I71.0.lcssa, %struct.GVCache_Item** %GVCache_head, align 8, !tbaa !82
  store %struct.GVCache_Item* %18, %struct.GVCache_Item** %next76.lcssa, align 8, !tbaa !85
  %ptr95 = getelementptr inbounds %struct.GVCache_Item* %I71.0.lcssa, i64 0, i32 0
  store %struct.GVMeta* %.lcssa, %struct.GVMeta** %ptr95, align 8, !tbaa !83
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
  %0 = load i64* %Search, align 8, !tbaa !141
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !141
  %1 = load i8** @sdmprofile__HP_addressRangeFrom, align 8, !tbaa !52
  %cmp = icmp ugt i8* %1, %AtAddress
  %2 = load i8** @sdmprofile__HP_addressRangeTo, align 8
  %cmp1 = icmp ult i8* %2, %AtAddress
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %if.end96, label %if.then

if.then:                                          ; preds = %entry
  %SearchWithinAddressRange = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 14
  %3 = load i64* %SearchWithinAddressRange, align 8, !tbaa !142
  %inc4 = add i64 %3, 1
  store i64 %inc4, i64* %SearchWithinAddressRange, align 8, !tbaa !142
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
  %4 = load %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !79
  %ptr8 = getelementptr inbounds %struct.HeapAllocationMeta* %4, i64 0, i32 0
  %5 = load i8** %ptr8, align 8, !tbaa !58
  store i8* %5, i8** @cache_addr, align 8, !tbaa !52
  %6 = load %struct.HeapAllocationMeta** %ptr, align 8, !tbaa !79
  %upperbound = getelementptr inbounds %struct.HeapAllocationMeta* %6, i64 0, i32 1
  %7 = load i8** %upperbound, align 8, !tbaa !125
  store i8* %7, i8** @cache_upperbound, align 8, !tbaa !52
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
  %8 = load %struct.HeapAllocationMeta** %ptr.lcssa, align 8, !tbaa !79
  %heapindex = getelementptr inbounds %struct.HeapAllocationMeta* %8, i64 0, i32 3
  %9 = load i32* %heapindex, align 4, !tbaa !127
  %idxprom15 = zext i32 %9 to i64
  %r = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom15, i32 1
  %10 = load i64* %r, align 8, !tbaa !146
  %inc17 = add i64 %10, 1
  store i64 %inc17, i64* %r, align 8, !tbaa !146
  br label %sw.epilog

sw.bb18:                                          ; preds = %if.then13
  %11 = load %struct.HeapAllocationMeta** %ptr.lcssa, align 8, !tbaa !79
  %heapindex20 = getelementptr inbounds %struct.HeapAllocationMeta* %11, i64 0, i32 3
  %12 = load i32* %heapindex20, align 4, !tbaa !127
  %idxprom21 = zext i32 %12 to i64
  %w = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom21, i32 2
  %13 = load i64* %w, align 16, !tbaa !147
  %inc23 = add i64 %13, 1
  store i64 %inc23, i64* %w, align 16, !tbaa !147
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb18, %sw.bb, %if.then13
  %Cache_Hits = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 16
  %14 = load i64* %Cache_Hits, align 8, !tbaa !143
  %inc26 = add i64 %14, 1
  store i64 %inc26, i64* %Cache_Hits, align 8, !tbaa !143
  %cmp30 = icmp eq %struct.Cache2_Item* %I.0182.lcssa, %I.0179
  br i1 %cmp30, label %return, label %if.else

if.else:                                          ; preds = %sw.epilog
  %next = getelementptr inbounds %struct.Cache2_Item* %I.0182.lcssa, i64 0, i32 1
  %15 = load %struct.Cache2_Item** %next, align 8, !tbaa !81
  %next32 = getelementptr inbounds %struct.Cache2_Item* %previous.0181.lcssa, i64 0, i32 1
  store %struct.Cache2_Item* %15, %struct.Cache2_Item** %next32, align 8, !tbaa !81
  store %struct.Cache2_Item* %I.0182.lcssa, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !78
  store %struct.Cache2_Item* %I.0179, %struct.Cache2_Item** %next, align 8, !tbaa !81
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
  %16 = load %struct.HeapAllocationMeta** %call50, align 8, !tbaa !52
  %ptr51 = getelementptr inbounds %struct.HeapAllocationMeta* %16, i64 0, i32 0
  %17 = load i8** %ptr51, align 8, !tbaa !58
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
  %18 = load i32* %heapindex56, align 4, !tbaa !127
  %idxprom57 = zext i32 %18 to i64
  %r59 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom57, i32 1
  %19 = load i64* %r59, align 8, !tbaa !146
  %inc60 = add i64 %19, 1
  store i64 %inc60, i64* %r59, align 8, !tbaa !146
  br label %return_2

sw.bb61:                                          ; preds = %if.then53
  %heapindex62 = getelementptr inbounds %struct.HeapAllocationMeta* %.lcssa, i64 0, i32 3
  %20 = load i32* %heapindex62, align 4, !tbaa !127
  %idxprom63 = zext i32 %20 to i64
  %w65 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom63, i32 2
  %21 = load i64* %w65, align 16, !tbaa !147
  %inc66 = add i64 %21, 1
  store i64 %inc66, i64* %w65, align 16, !tbaa !147
  br label %return_2

if.else69:                                        ; preds = %for.body
  %cmp71 = icmp ugt i8* %17, %AtAddress
  br i1 %cmp71, label %for.inc, label %if.else73

if.else73:                                        ; preds = %if.else69
  %upperbound74 = getelementptr inbounds %struct.HeapAllocationMeta* %16, i64 0, i32 1
  %22 = load i8** %upperbound74, align 8, !tbaa !125
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
  %23 = load i32* %heapindex79, align 4, !tbaa !127
  %idxprom80 = zext i32 %23 to i64
  %r82 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom80, i32 1
  %24 = load i64* %r82, align 8, !tbaa !146
  %inc83 = add i64 %24, 1
  store i64 %inc83, i64* %r82, align 8, !tbaa !146
  br label %return_2

sw.bb84:                                          ; preds = %if.then76
  %heapindex85 = getelementptr inbounds %struct.HeapAllocationMeta* %.lcssa202, i64 0, i32 3
  %25 = load i32* %heapindex85, align 4, !tbaa !127
  %idxprom86 = zext i32 %25 to i64
  %w88 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %idxprom86, i32 2
  %26 = load i64* %w88, align 16, !tbaa !147
  %inc89 = add i64 %26, 1
  store i64 %inc89, i64* %w88, align 16, !tbaa !147
  br label %return_2

for.inc:                                          ; preds = %if.else73, %if.else69
  %call95 = call dereferenceable(8) %"struct.std::_List_iterator"* @_ZNSt14_List_iteratorIP18HeapAllocationMetaEppEv(%"struct.std::_List_iterator"* %__begin)
  %call48 = call zeroext i1 @_ZNKSt14_List_iteratorIP18HeapAllocationMetaEneERKS2_(%"struct.std::_List_iterator"* %__begin, %"struct.std::_List_iterator"* dereferenceable(8) %__end)
  br i1 %call48, label %for.body, label %if.end96.loopexit

if.end96.loopexit:                                ; preds = %for.inc
  br label %if.end96

if.end96:                                         ; preds = %if.end96.loopexit, %while.end, %entry
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %27 = load i64* %SearchMiss, align 8, !tbaa !145
  %inc99 = add i64 %27, 1
  store i64 %inc99, i64* %SearchMiss, align 8, !tbaa !145
  br label %return

return_2:                                         ; preds = %sw.bb84, %sw.bb78, %if.then76, %sw.bb61, %sw.bb55, %if.then53
  %call50201 = phi %struct.HeapAllocationMeta** [ %call50.lcssa199, %sw.bb78 ], [ %call50.lcssa199, %sw.bb84 ], [ %call50.lcssa199, %if.then76 ], [ %call50.lcssa, %sw.bb55 ], [ %call50.lcssa, %sw.bb61 ], [ %call50.lcssa, %if.then53 ]
  %loopptr.0 = load %struct.HeapAllocationMeta** %call50201, align 8
  %Cache_Miss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 15
  %28 = load i64* %Cache_Miss, align 8, !tbaa !144
  %inc102 = add i64 %28, 1
  store i64 %inc102, i64* %Cache_Miss, align 8, !tbaa !144
  %29 = load %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !78
  br label %while.cond109

while.cond109:                                    ; preds = %while.cond109, %return_2
  %previous104.0 = phi %struct.Cache2_Item* [ undef, %return_2 ], [ %I105.0, %while.cond109 ]
  %I105.0 = phi %struct.Cache2_Item* [ %29, %return_2 ], [ %30, %while.cond109 ]
  %next110 = getelementptr inbounds %struct.Cache2_Item* %I105.0, i64 0, i32 1
  %30 = load %struct.Cache2_Item** %next110, align 8, !tbaa !81
  %cmp111 = icmp eq %struct.Cache2_Item* %30, null
  br i1 %cmp111, label %while.end114, label %while.cond109

while.end114:                                     ; preds = %while.cond109
  %next110.lcssa = phi %struct.Cache2_Item** [ %next110, %while.cond109 ]
  %I105.0.lcssa = phi %struct.Cache2_Item* [ %I105.0, %while.cond109 ]
  %previous104.0.lcssa = phi %struct.Cache2_Item* [ %previous104.0, %while.cond109 ]
  %next115 = getelementptr inbounds %struct.Cache2_Item* %previous104.0.lcssa, i64 0, i32 1
  store %struct.Cache2_Item* null, %struct.Cache2_Item** %next115, align 8, !tbaa !81
  store %struct.Cache2_Item* %I105.0.lcssa, %struct.Cache2_Item** %Cache2_head, align 8, !tbaa !78
  store %struct.Cache2_Item* %29, %struct.Cache2_Item** %next110.lcssa, align 8, !tbaa !81
  %ptr129 = getelementptr inbounds %struct.Cache2_Item* %I105.0.lcssa, i64 0, i32 0
  store %struct.HeapAllocationMeta* %loopptr.0, %struct.HeapAllocationMeta** %ptr129, align 8, !tbaa !79
  br label %return

return:                                           ; preds = %while.end114, %if.end96, %if.else, %sw.epilog
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @sdmprofile__SearchRoutine_STonly(i8* readnone %AtAddress, i8 zeroext %AccessType, i32 %thdnumber, %struct.sdmprofile__Allocated_Stack_item* %ptr) #3 {
entry:
  %idxprom = zext i32 %thdnumber to i64
  %Search = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 12
  %0 = load i64* %Search, align 8, !tbaa !141
  %inc = add i64 %0, 1
  store i64 %inc, i64* %Search, align 8, !tbaa !141
  %Stack_allocations_head = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 4
  %1 = load %struct.sdmprofile__Allocated_Stack_item** %Stack_allocations_head, align 8, !tbaa !86
  %loopptr.065 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %ptr, i64 -1
  %cmp66 = icmp ult %struct.sdmprofile__Allocated_Stack_item* %loopptr.065, %1
  br i1 %cmp66, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.cond.backedge, %while.body.preheader
  %2 = phi %struct.sdmprofile__Allocated_Stack_item* [ %loopptr.068, %while.cond.backedge ], [ %ptr, %while.body.preheader ]
  %loopptr.068 = phi %struct.sdmprofile__Allocated_Stack_item* [ %loopptr.0, %while.cond.backedge ], [ %loopptr.065, %while.body.preheader ]
  %ptr3 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %2, i64 -1, i32 0
  %3 = load i8** %ptr3, align 8, !tbaa !65
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
  %4 = load i64* %stackindex, align 8, !tbaa !148
  %r = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %4, i32 1
  %5 = load i64* %r, align 8, !tbaa !115
  %inc6 = add i64 %5, 1
  store i64 %inc6, i64* %r, align 8, !tbaa !115
  br label %return_

sw.bb7:                                           ; preds = %if.then
  %stackindex8 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %.lcssa, i64 -1, i32 1
  %6 = load i64* %stackindex8, align 8, !tbaa !148
  %w = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %6, i32 2
  %7 = load i64* %w, align 8, !tbaa !116
  %inc10 = add i64 %7, 1
  store i64 %inc10, i64* %w, align 8, !tbaa !116
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
  %8 = load i8** %upperbound, align 8, !tbaa !67
  %9 = load i8** @sdmprofile__zeropointer, align 8, !tbaa !52
  %cmp15 = icmp eq i8* %8, %9
  br i1 %cmp15, label %if.then16, label %if.end

if.then16:                                        ; preds = %if.else14
  %10 = ptrtoint i8* %3 to i64
  %stackindex18 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %2, i64 -1, i32 1
  %11 = load i64* %stackindex18, align 8, !tbaa !148
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %11, i32 3
  %12 = load i32* %size, align 8, !tbaa !95
  %conv20 = zext i32 %12 to i64
  %add = add i64 %conv20, %10
  %13 = inttoptr i64 %add to i8*
  store i8* %13, i8** %upperbound, align 8, !tbaa !67
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
  %15 = load i64* %stackindex27, align 8, !tbaa !148
  %r29 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %15, i32 1
  %16 = load i64* %r29, align 8, !tbaa !115
  %inc30 = add i64 %16, 1
  store i64 %inc30, i64* %r29, align 8, !tbaa !115
  br label %return_

sw.bb31:                                          ; preds = %if.then24
  %stackindex32 = getelementptr inbounds %struct.sdmprofile__Allocated_Stack_item* %.lcssa73, i64 -1, i32 1
  %17 = load i64* %stackindex32, align 8, !tbaa !148
  %w34 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %17, i32 2
  %18 = load i64* %w34, align 8, !tbaa !116
  %inc35 = add i64 %18, 1
  store i64 %inc35, i64* %w34, align 8, !tbaa !116
  br label %return_

while.end.loopexit:                               ; preds = %while.cond.backedge
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  %SearchMiss = getelementptr inbounds [100 x %struct.Thread]* @thds, i64 0, i64 %idxprom, i32 13
  %19 = load i64* %SearchMiss, align 8, !tbaa !145
  %inc44 = add i64 %19, 1
  store i64 %inc44, i64* %SearchMiss, align 8, !tbaa !145
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
  %0 = load i32* @sdmprofile__profileAction, align 4, !tbaa !56
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
  %3 = load %struct.GVMeta** %call7, align 8, !tbaa !52
  %index = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 0
  %4 = load i64* %index, align 8, !tbaa !61
  %r = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 1
  %5 = load i64* %r, align 8, !tbaa !106
  %w = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 2
  %6 = load i64* %w, align 8, !tbaa !107
  %size = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 4
  %7 = load i32* %size, align 4, !tbaa !64
  %VarName = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 5
  %8 = load i8** %VarName, align 8, !tbaa !87
  %DataTypeString = getelementptr inbounds %struct.GVMeta* %3, i64 0, i32 6
  %9 = load i8** %DataTypeString, align 8, !tbaa !88
  %call8 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call, i8* getelementptr inbounds ([23 x i8]* @.str5, i64 0, i64 0), i64 %4, i64 %5, i64 %6, i32 %7, i8* %8, i8* %9) #2
  %call9 = call dereferenceable(8) %"struct.std::_Fwd_list_iterator"* @_ZNSt18_Fwd_list_iteratorIP6GVMetaEppEv(%"struct.std::_Fwd_list_iterator"* %__begin)
  %call6 = call zeroext i1 @_ZNKSt18_Fwd_list_iteratorIP6GVMetaEneERKS2_(%"struct.std::_Fwd_list_iterator"* %__begin, %"struct.std::_Fwd_list_iterator"* dereferenceable(8) %__end)
  br i1 %call6, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %if.then
  %10 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE.1* %call)
  %.pr = load i32* @sdmprofile__profileAction, align 4, !tbaa !56
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  %11 = phi i32 [ %0, %entry ], [ %.pr, %for.end ]
  switch i32 %11, label %if.end34 [
    i32 4, label %if.then14
    i32 2, label %if.then14
  ]

if.then14:                                        ; preds = %if.end, %if.end
  %12 = call i64 @fwrite(i8* getelementptr inbounds ([124 x i8]* @.str7, i64 0, i64 0), i64 123, i64 1, %struct._IO_FILE.1* %call)
  %13 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !117
  %cmp1784 = icmp eq i64 %13, 0
  br i1 %cmp1784, label %for.end32, label %for.body18.preheader

for.body18.preheader:                             ; preds = %if.then14
  br label %for.body18

for.body18:                                       ; preds = %for.body18, %for.body18.preheader
  %ix.085 = phi i64 [ %inc, %for.body18 ], [ 0, %for.body18.preheader ]
  %index19 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 0
  %14 = load i64* %index19, align 8, !tbaa !93
  %r21 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 1
  %15 = load i64* %r21, align 8, !tbaa !115
  %w23 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 2
  %16 = load i64* %w23, align 8, !tbaa !116
  %size25 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 3
  %17 = load i32* %size25, align 8, !tbaa !95
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 4
  %18 = load i8** %EstimatedName, align 8, !tbaa !96
  %DataTypeString28 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 5
  %19 = load i8** %DataTypeString28, align 8, !tbaa !97
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix.085, i32 6
  %20 = load i8** %FunctionName, align 8, !tbaa !98
  %call30 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call, i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i64 %14, i64 %15, i64 %16, i32 %17, i8* %18, i8* %19, i8* %20) #2
  %inc = add i64 %ix.085, 1
  %21 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !117
  %cmp17 = icmp ult i64 %inc, %21
  br i1 %cmp17, label %for.body18, label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.body18
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %if.then14
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE.1* %call)
  %.pre = load i32* @sdmprofile__profileAction, align 4, !tbaa !56
  br label %if.end34

if.end34:                                         ; preds = %for.end32, %if.end
  %23 = phi i32 [ %11, %if.end ], [ %.pre, %for.end32 ]
  switch i32 %23, label %if.end55 [
    i32 4, label %if.then38
    i32 1, label %if.then38
  ]

if.then38:                                        ; preds = %if.end34, %if.end34
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([171 x i8]* @.str9, i64 0, i64 0), i64 170, i64 1, %struct._IO_FILE.1* %call)
  %25 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !117
  %cmp4282 = icmp eq i64 %25, 0
  br i1 %cmp4282, label %for.end53, label %for.body43.preheader

for.body43.preheader:                             ; preds = %if.then38
  br label %for.body43

for.body43:                                       ; preds = %for.body43, %for.body43.preheader
  %ix40.083 = phi i64 [ %inc52, %for.body43 ], [ 0, %for.body43.preheader ]
  %arrayidx44 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083
  store %struct.HPMeta* %arrayidx44, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !52
  %index45 = getelementptr inbounds %struct.HPMeta* %arrayidx44, i64 0, i32 0
  %26 = load i32* %index45, align 16, !tbaa !99
  %r46 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 1
  %27 = load i64* %r46, align 8, !tbaa !146
  %w47 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 2
  %28 = load i64* %w47, align 16, !tbaa !147
  %EstimatedName48 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 3
  %29 = load i8** %EstimatedName48, align 8, !tbaa !101
  %EstimatedDataTypeString = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 4
  %30 = load i8** %EstimatedDataTypeString, align 16, !tbaa !102
  %FunctionName49 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 5
  %31 = load i8** %FunctionName49, align 8, !tbaa !103
  %linenumber = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 6
  %32 = load i64* %linenumber, align 16, !tbaa !104
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 7
  %33 = load i8** %SourceFile, align 8, !tbaa !105
  %hitcount = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 8
  %34 = load i64* %hitcount, align 16, !tbaa !130
  %MinSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 10
  %35 = load i64* %MinSize, align 16, !tbaa !132
  %MaxSize = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix40.083, i32 9
  %36 = load i64* %MaxSize, align 8, !tbaa !131
  %call50 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call, i8* getelementptr inbounds ([43 x i8]* @.str10, i64 0, i64 0), i32 %26, i64 %27, i64 %28, i32 0, i8* %29, i8* %30, i8* %31, i64 %32, i8* %33, i64 %34, i64 %35, i64 %36) #2
  %inc52 = add i64 %ix40.083, 1
  %37 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !117
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
  store double %call, double* getelementptr inbounds ([100 x %struct.Thread]* @thds, i64 0, i64 0, i32 3), align 8, !tbaa !77
  %call1 = tail call %struct._IO_FILE.1* @fopen(i8* getelementptr inbounds ([18 x i8]* @.str11, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0)) #2
  %0 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str12, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE.1* %call1)
  %1 = load i64* @sdmprofile__BBcount, align 8, !tbaa !117
  %cmp167 = icmp eq i64 %1, 0
  br i1 %cmp167, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %ix.0168 = phi i64 [ %inc, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds [5000 x i64]* @BBhits, i64 0, i64 %ix.0168
  %2 = load i64* %arrayidx, align 8, !tbaa !117
  %call3 = tail call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call1, i8* getelementptr inbounds ([9 x i8]* @.str13, i64 0, i64 0), i64 %ix.0168, i64 %2) #2
  %inc = add i64 %ix.0168, 1
  %3 = load i64* @sdmprofile__BBcount, align 8, !tbaa !117
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
  %5 = load %struct._IO_FILE.1** @stderr, align 8, !tbaa !52
  %fputs = call i32 @fputs(i8* %4, %struct._IO_FILE.1* %5) #18
  br label %cleanup

if.end:                                           ; preds = %for.end
  %6 = load i32* @sdmprofile__profileAction, align 4, !tbaa !56
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
  %8 = load %struct.GVMeta** %call16, align 8, !tbaa !52
  %DataTypeString = getelementptr inbounds %struct.GVMeta* %8, i64 0, i32 6
  %9 = load i8** %DataTypeString, align 8, !tbaa !88
  call void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* %typestring, i8* %9, %"class.std::allocator.6"* dereferenceable(1) %ref.tmp) #2
  %call17 = call i8* @_ZNSs5beginEv(%"class.std::basic_string"* %typestring) #2
  %call20 = call i8* @_ZNSs3endEv(%"class.std::basic_string"* %typestring) #2
  store i8 44, i8* %ref.tmp22, align 1, !tbaa !149
  store i8 59, i8* %ref.tmp23, align 1, !tbaa !149
  call void @_ZSt7replaceIN9__gnu_cxx17__normal_iteratorIPcSsEEcEvT_S4_RKT0_S7_(i8* %call17, i8* %call20, i8* dereferenceable(1) %ref.tmp22, i8* dereferenceable(1) %ref.tmp23)
  %inc26 = add nsw i32 %variable_count.0164, 1
  %10 = load %struct.GVMeta** %call16, align 8, !tbaa !52
  %r = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 1
  %11 = load i64* %r, align 8, !tbaa !106
  %w = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 2
  %12 = load i64* %w, align 8, !tbaa !107
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
  %13 = load i64* %linenumber, align 8, !tbaa !92
  %tobool = icmp eq i64 %13, 0
  br i1 %tobool, label %if.end44, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.then35
  %FileName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 8
  %14 = load i8** %FileName, align 8, !tbaa !90
  %call36 = call i32 @strcmp(i8* %14, i8* getelementptr inbounds ([2 x i8]* @.str17, i64 0, i64 0)) #19
  %tobool37 = icmp eq i32 %call36, 0
  br i1 %tobool37, label %if.end44, label %if.then38

if.then38:                                        ; preds = %land.lhs.true
  %VarName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 5
  %15 = load i8** %VarName, align 8, !tbaa !87
  %DirName = getelementptr inbounds %struct.GVMeta* %10, i64 0, i32 9
  %16 = load i8** %DirName, align 8, !tbaa !91
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
  %.pr = load i32* @sdmprofile__profileAction, align 4, !tbaa !56
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
  %19 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !117
  %cmp58160 = icmp eq i64 %19, 0
  br i1 %cmp58160, label %for.end73, label %for.body59.preheader

for.body59.preheader:                             ; preds = %if.then54
  br label %for.body59

for.body59:                                       ; preds = %for.body59, %for.body59.preheader
  %ix56.0161 = phi i64 [ %inc72, %for.body59 ], [ 0, %for.body59.preheader ]
  %index = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 0
  %20 = load i64* %index, align 8, !tbaa !93
  %r62 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 1
  %21 = load i64* %r62, align 8, !tbaa !115
  %w64 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 2
  %22 = load i64* %w64, align 8, !tbaa !116
  %size = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 3
  %23 = load i32* %size, align 8, !tbaa !95
  %EstimatedName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 4
  %24 = load i8** %EstimatedName, align 8, !tbaa !96
  %DataTypeString68 = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 5
  %25 = load i8** %DataTypeString68, align 8, !tbaa !97
  %FunctionName = getelementptr inbounds [10000 x %struct.sdmprofile__struct_STrw]* @STMetaArray, i64 0, i64 %ix56.0161, i32 6
  %26 = load i8** %FunctionName, align 8, !tbaa !98
  %call70 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call4, i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i64 %20, i64 %21, i64 %22, i32 %23, i8* %24, i8* %25, i8* %26) #2
  %inc72 = add i64 %ix56.0161, 1
  %27 = load i64* @sdmprofile__stackallocationCount, align 8, !tbaa !117
  %cmp58 = icmp ult i64 %inc72, %27
  br i1 %cmp58, label %for.body59, label %for.end73.loopexit

for.end73.loopexit:                               ; preds = %for.body59
  br label %for.end73

for.end73:                                        ; preds = %for.end73.loopexit, %if.then54
  %28 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str6, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE.1* %call4)
  %.pre = load i32* @sdmprofile__profileAction, align 4, !tbaa !56
  br label %if.end75

if.end75:                                         ; preds = %for.end73, %if.end50
  %29 = phi i32 [ %17, %if.end50 ], [ %.pre, %for.end73 ]
  switch i32 %29, label %if.end112 [
    i32 4, label %for.cond81.preheader
    i32 1, label %for.cond81.preheader
  ]

for.cond81.preheader:                             ; preds = %if.end75, %if.end75
  %30 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !117
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
  store %struct.HPMeta* %arrayidx85, %struct.HPMeta** @HPMetaItem, align 8, !tbaa !52
  %r86 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 1
  %32 = load i64* %r86, align 8, !tbaa !146
  %cmp99 = icmp eq i64 %32, 0
  br i1 %cmp99, label %if.end106, label %if.then100

if.then100:                                       ; preds = %for.body84
  %SourceFile = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 7
  %33 = load i8** %SourceFile, align 8, !tbaa !105
  %linenumber101 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 6
  %34 = load i64* %linenumber101, align 16, !tbaa !104
  %FunctionName102 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 5
  %35 = load i8** %FunctionName102, align 8, !tbaa !103
  %EstimatedName103 = getelementptr inbounds [1000 x %struct.HPMeta]* @HPMetaArray, i64 0, i64 %ix80.0158, i32 3
  %36 = load i8** %EstimatedName103, align 8, !tbaa !101
  %call104 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %call4, i8* getelementptr inbounds ([14 x i8]* @.str22, i64 0, i64 0), i8* %33, i64 %34, i8* %35, i8* %36) #2
  %inc105 = add nsw i32 %nv_variable_count.3156, 1
  %.pre169 = load i64* @sdmprofile__heapallocationCount, align 8, !tbaa !117
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
  %0 = load i8* %call2, align 1, !tbaa !149
  %1 = load i8* %__old_value, align 1, !tbaa !149
  %cmp = icmp eq i8 %0, %1
  br i1 %cmp, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %2 = load i8* %__new_value, align 1, !tbaa !149
  store i8 %2, i8* %call2, align 1, !tbaa !149
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
  store i8* %call, i8** %ref.tmp, align 8, !tbaa !52
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
  store i8* %add.ptr, i8** %ref.tmp, align 8, !tbaa !52
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
  %0 = load i32* @thdsCount, align 4, !tbaa !56
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
  %2 = load i64* %threadID, align 8, !tbaa !75
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
  %0 = load i8** %call, align 8, !tbaa !52
  %call1 = tail call dereferenceable(8) i8** @_ZNK9__gnu_cxx17__normal_iteratorIPcSsE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %__rhs)
  %1 = load i8** %call1, align 8, !tbaa !52
  %cmp = icmp ne i8* %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind readonly uwtable
define linkonce_odr hidden dereferenceable(1) i8* @_ZNK9__gnu_cxx17__normal_iteratorIPcSsEdeEv(%"class.__gnu_cxx::__normal_iterator"* nocapture readonly %this) #4 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %_M_current, align 8, !tbaa !150
  ret i8* %0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden dereferenceable(8) %"class.__gnu_cxx::__normal_iterator"* @_ZN9__gnu_cxx17__normal_iteratorIPcSsEppEv(%"class.__gnu_cxx::__normal_iterator"* %this) #3 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %_M_current, align 8, !tbaa !150
  %incdec.ptr = getelementptr inbounds i8* %0, i64 1
  store i8* %incdec.ptr, i8** %_M_current, align 8, !tbaa !150
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
  %0 = load i8** %_M_p, align 8, !tbaa !152
  ret i8* %0
}

; Function Attrs: noinline nounwind readonly uwtable
define available_externally i64 @_ZNKSs4sizeEv(%"class.std::basic_string"* nocapture readonly %this) #4 align 2 {
entry:
  %call = tail call %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* @_ZNKSs6_M_repEv(%"class.std::basic_string"* %this)
  %_M_length = getelementptr inbounds %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* %call, i64 0, i32 0, i32 0
  %0 = load i64* %_M_length, align 8, !tbaa !155
  ret i64 %0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr hidden void @_ZN9__gnu_cxx17__normal_iteratorIPcSsEC2ERKS1_(%"class.__gnu_cxx::__normal_iterator"* nocapture %this, i8** nocapture readonly dereferenceable(8) %__i) unnamed_addr #3 align 2 {
entry:
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator"* %this, i64 0, i32 0
  %0 = load i8** %__i, align 8, !tbaa !52
  store i8* %0, i8** %_M_current, align 8, !tbaa !150
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
  %0 = load i32* %_M_refcount, align 4, !tbaa !157
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
  store %"struct.std::__detail::_List_node_base"* %__x, %"struct.std::__detail::_List_node_base"** %_M_node, align 8, !tbaa !138
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
  %1 = load %struct.HeapAllocationMeta** %call, align 8, !tbaa !52
  store %struct.HeapAllocationMeta* %1, %struct.HeapAllocationMeta** %_M_data, align 8, !tbaa !158
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
  tail call void @_ZSt17__throw_bad_allocv() #20
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
  store %"struct.std::_Fwd_list_node_base"* %__n, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !112
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr %"struct.std::_Fwd_list_node_base"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE15_M_insert_afterIJRKS1_EEEPSt19_Fwd_list_node_baseSt24_Fwd_list_const_iteratorIS1_EDpOT_(%"struct.std::_Fwd_list_base"* %this, %"struct.std::_Fwd_list_node_base"* nocapture %__pos.coerce, %struct.GVMeta** dereferenceable(8) %__args) #3 align 2 {
entry:
  %call = tail call dereferenceable(8) %struct.GVMeta** @_ZSt7forwardIRKP6GVMetaEOT_RNSt16remove_referenceIS4_E4typeE(%struct.GVMeta** dereferenceable(8) %__args) #2
  %call2 = tail call %"struct.std::_Fwd_list_node"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_M_create_nodeIJRKS1_EEEPSt14_Fwd_list_nodeIS1_EDpOT_(%"struct.std::_Fwd_list_base"* %this, %struct.GVMeta** dereferenceable(8) %call)
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__pos.coerce, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !114
  %1 = getelementptr inbounds %"struct.std::_Fwd_list_node"* %call2, i64 0, i32 0
  %_M_next3 = getelementptr inbounds %"struct.std::_Fwd_list_node"* %call2, i64 0, i32 0, i32 0
  store %"struct.std::_Fwd_list_node_base"* %0, %"struct.std::_Fwd_list_node_base"** %_M_next3, align 8, !tbaa !114
  store %"struct.std::_Fwd_list_node_base"* %1, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !114
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
  store %"struct.std::_Fwd_list_node_base"* %__n, %"struct.std::_Fwd_list_node_base"** %_M_node, align 8, !tbaa !160
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
  %0 = load %struct.GVMeta** %call, align 8, !tbaa !52
  store %struct.GVMeta* %0, %struct.GVMeta** %__p, align 8, !tbaa !52
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
  tail call void @_ZSt17__throw_bad_allocv() #20
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
  store %"struct.std::__detail::_List_node_base"* %_M_node, %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !134
  %_M_prev = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0, i32 1
  store %"struct.std::__detail::_List_node_base"* %_M_node, %"struct.std::__detail::_List_node_base"** %_M_prev, align 8, !tbaa !162
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr %"struct.std::_Fwd_list_node_base"* @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_M_erase_afterEPSt19_Fwd_list_node_baseS5_(%"struct.std::_Fwd_list_base"* readnone %this, %"struct.std::_Fwd_list_node_base"* nocapture %__pos, %"struct.std::_Fwd_list_node_base"* %__last) #3 align 2 {
entry:
  %_M_next = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__pos, i64 0, i32 0
  %0 = load %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !114
  %cmp12 = icmp eq %"struct.std::_Fwd_list_node_base"* %0, %__last
  br i1 %cmp12, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.preheader
  %__curr.0.in13 = phi %"struct.std::_Fwd_list_node_base"* [ %1, %while.body ], [ %0, %while.body.preheader ]
  %__curr.0 = bitcast %"struct.std::_Fwd_list_node_base"* %__curr.0.in13 to %"struct.std::_Fwd_list_node"*
  %_M_next2 = getelementptr inbounds %"struct.std::_Fwd_list_node_base"* %__curr.0.in13, i64 0, i32 0
  %1 = load %"struct.std::_Fwd_list_node_base"** %_M_next2, align 8, !tbaa !114
  tail call void @_ZNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE11_M_put_nodeEPSt14_Fwd_list_nodeIS1_E(%"struct.std::_Fwd_list_base"* %this, %"struct.std::_Fwd_list_node"* %__curr.0)
  %cmp = icmp eq %"struct.std::_Fwd_list_node_base"* %1, %__last
  br i1 %cmp, label %while.end.loopexit, label %while.body

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  store %"struct.std::_Fwd_list_node_base"* %__last, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !114
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
  store %"struct.std::_Fwd_list_node_base"* null, %"struct.std::_Fwd_list_node_base"** %_M_next, align 8, !tbaa !114
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
  br i1 %cmp, label %if.end5, label %if.then, !prof !163

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
  %0 = load i32* %__mem, align 4, !tbaa !56
  %add = add nsw i32 %0, -1
  store i32 %add, i32* %__mem, align 4, !tbaa !56
  ret i32 %0
}

; Function Attrs: nounwind
declare extern_weak i32 @__pthread_key_create(i32*, void (i8*)*) #1

; Function Attrs: noinline nounwind uwtable
define linkonce_odr void @_ZNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE8_M_clearEv(%"class.std::_List_base"* readonly %this) #3 align 2 {
entry:
  %_M_node = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0
  %_M_next = getelementptr inbounds %"class.std::_List_base"* %this, i64 0, i32 0, i32 0, i32 0
  %0 = load %"struct.std::__detail::_List_node_base"** %_M_next, align 8, !tbaa !134
  %cmp8 = icmp eq %"struct.std::__detail::_List_node_base"* %0, %_M_node
  br i1 %cmp8, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.preheader
  %__cur.0.in9 = phi %"struct.std::__detail::_List_node_base"* [ %1, %while.body ], [ %0, %while.body.preheader ]
  %__cur.0 = bitcast %"struct.std::__detail::_List_node_base"* %__cur.0.in9 to %"struct.std::_List_node"*
  %_M_next4 = getelementptr inbounds %"struct.std::__detail::_List_node_base"* %__cur.0.in9, i64 0, i32 0
  %1 = load %"struct.std::__detail::_List_node_base"** %_M_next4, align 8, !tbaa !140
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
define %struct.ptree.3* @pat_insert_original(%struct.ptree.3* %n, %struct.ptree.3* %head) #11 {
  %n_st = alloca %struct.ptree.3*
  %head_st = alloca %struct.ptree.3*
  %thdnumber_st = alloca i32
  store %struct.ptree.3* %n, %struct.ptree.3** %n_st, align 8
  store %struct.ptree.3* %head, %struct.ptree.3** %head_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load %struct.ptree.3** %n_st
  %3 = load %struct.ptree.3** %head_st
  %4 = call %struct.ptree.3* @pat_insert(%struct.ptree.3* %2, %struct.ptree.3* %3, i32 %1)
  ret %struct.ptree.3* %4
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #12

; Function Attrs: nounwind
declare void @bcopy(i8*, i8*, i64) #13

; Function Attrs: nounwind uwtable
define i32 @pat_remove_original(%struct.ptree.3* %n, %struct.ptree.3* %head) #11 {
  %n_st = alloca %struct.ptree.3*
  %head_st = alloca %struct.ptree.3*
  %thdnumber_st = alloca i32
  store %struct.ptree.3* %n, %struct.ptree.3** %n_st, align 8
  store %struct.ptree.3* %head, %struct.ptree.3** %head_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load %struct.ptree.3** %n_st
  %3 = load %struct.ptree.3** %head_st
  %4 = call i32 @pat_remove(%struct.ptree.3* %2, %struct.ptree.3* %3, i32 %1)
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define %struct.ptree.3* @pat_search_original(i64 %key, %struct.ptree.3* %head) #11 {
  %key_st = alloca i64
  %head_st = alloca %struct.ptree.3*
  %thdnumber_st = alloca i32
  store i64 %key, i64* %key_st, align 8
  store %struct.ptree.3* %head, %struct.ptree.3** %head_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i64* %key_st
  %3 = load %struct.ptree.3** %head_st
  %4 = call %struct.ptree.3* @pat_search(i64 %2, %struct.ptree.3* %3, i32 %1)
  ret %struct.ptree.3* %4
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

declare i32 @printf(i8*, ...) #14

; Function Attrs: noreturn nounwind
declare void @exit(i32) #15

declare void @perror(i8*) #14

declare i8* @fgets(i8*, i32, %struct._IO_FILE.1*) #14

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #13

; Function Attrs: nounwind readnone
declare i32 @htonl(i32) #16

; Function Attrs: inlinehint nounwind uwtable
define internal i64 @bit_original(i32 %i, i64 %key) #17 {
  %i_st = alloca i32
  %key_st = alloca i64
  %thdnumber_st = alloca i32
  store i32 %i, i32* %i_st, align 4
  store i64 %key, i64* %key_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load i32* %i_st
  %3 = load i64* %key_st
  %4 = call i64 @bit(i32 %2, i64 %3, i32 %1)
  ret i64 %4
}

; Function Attrs: nounwind uwtable
define internal %struct.ptree.3* @insertR_original(%struct.ptree.3* %h, %struct.ptree.3* %n, i32 %d, %struct.ptree.3* %p) #11 {
  %h_st = alloca %struct.ptree.3*
  %n_st = alloca %struct.ptree.3*
  %d_st = alloca i32
  %p_st = alloca %struct.ptree.3*
  %thdnumber_st = alloca i32
  store %struct.ptree.3* %h, %struct.ptree.3** %h_st, align 8
  store %struct.ptree.3* %n, %struct.ptree.3** %n_st, align 8
  store i32 %d, i32* %d_st, align 4
  store %struct.ptree.3* %p, %struct.ptree.3** %p_st, align 8
  %1 = call i32 @sdmprofile__FindThread()
  %2 = load %struct.ptree.3** %h_st
  %3 = load %struct.ptree.3** %n_st
  %4 = load i32* %d_st
  %5 = load %struct.ptree.3** %p_st
  %6 = call %struct.ptree.3* @insertR(%struct.ptree.3* %2, %struct.ptree.3* %3, i32 %4, %struct.ptree.3* %5, i32 %1)
  ret %struct.ptree.3* %6
}

; Function Attrs: inlinehint nounwind uwtable
define internal i64 @bit(i32 %i, i64 %key, i32 %sdmprofile__threadnumber) #17 {
entry:
  %i.addr = alloca i32, align 4
  %key.addr = alloca i64, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_27, i64 1 seq_cst, !dbg !164
  call void @llvm.dbg.declare(metadata !{i32* %i.addr}, metadata !165), !dbg !164
  store i64 %key, i64* %key.addr, align 8
  call void @llvm.dbg.declare(metadata !{i64* %key.addr}, metadata !166), !dbg !167
  %1 = load i64* %key.addr, align 8, !dbg !168
  %2 = load i32* %i.addr, align 4, !dbg !168
  %sub = sub nsw i32 31, %2, !dbg !168
  %shl = shl i32 1, %sub, !dbg !168
  %conv = sext i32 %shl to i64, !dbg !168
  %and = and i64 %1, %conv, !dbg !168
  ret i64 %and, !dbg !168
}

; Function Attrs: nounwind uwtable
define internal %struct.ptree.3* @insertR(%struct.ptree.3* %h, %struct.ptree.3* %n, i32 %d, %struct.ptree.3* %p, i32 %sdmprofile__threadnumber) #11 {
entry:
  %retval = alloca %struct.ptree.3*, align 8
  %h.addr = alloca %struct.ptree.3*, align 8
  %n.addr = alloca %struct.ptree.3*, align 8
  %d.addr = alloca i32, align 4
  %p.addr = alloca %struct.ptree.3*, align 8
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store %struct.ptree.3* %h, %struct.ptree.3** %h.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_28, i64 1 seq_cst, !dbg !169
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %h.addr}, metadata !187), !dbg !169
  store %struct.ptree.3* %n, %struct.ptree.3** %n.addr, align 8
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %n.addr}, metadata !188), !dbg !189
  store i32 %d, i32* %d.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %d.addr}, metadata !190), !dbg !191
  store %struct.ptree.3* %p, %struct.ptree.3** %p.addr, align 8
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %p.addr}, metadata !192), !dbg !193
  %1 = load %struct.ptree.3** %h.addr, align 8, !dbg !194
  %p_b = getelementptr inbounds %struct.ptree.3* %1, i32 0, i32 3, !dbg !194
  %2 = load i32* %sdmprofile__threadnumber_st, !dbg !194
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b, i8 2, i32 %2), !dbg !194
  %3 = load i8* %p_b, align 1, !dbg !194
  %conv = sext i8 %3 to i32, !dbg !194
  %4 = load i32* %d.addr, align 4, !dbg !194
  %cmp = icmp sge i32 %conv, %4, !dbg !194
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !194

lor.lhs.false:                                    ; preds = %entry
  %5 = atomicrmw add i64* @sdmprofile__BBcounter_29, i64 1 seq_cst, !dbg !196
  %6 = load %struct.ptree.3** %h.addr, align 8, !dbg !196
  %p_b2 = getelementptr inbounds %struct.ptree.3* %6, i32 0, i32 3, !dbg !196
  %7 = load i32* %sdmprofile__threadnumber_st, !dbg !196
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b2, i8 2, i32 %7), !dbg !196
  %8 = load i8* %p_b2, align 1, !dbg !196
  %conv3 = sext i8 %8 to i32, !dbg !196
  %9 = load %struct.ptree.3** %p.addr, align 8, !dbg !196
  %p_b4 = getelementptr inbounds %struct.ptree.3* %9, i32 0, i32 3, !dbg !196
  %10 = load i32* %sdmprofile__threadnumber_st, !dbg !196
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b4, i8 2, i32 %10), !dbg !196
  %11 = load i8* %p_b4, align 1, !dbg !196
  %conv5 = sext i8 %11 to i32, !dbg !196
  %cmp6 = icmp sle i32 %conv3, %conv5, !dbg !196
  br i1 %cmp6, label %if.then, label %if.end, !dbg !196

if.then:                                          ; preds = %lor.lhs.false, %entry
  %12 = atomicrmw add i64* @sdmprofile__BBcounter_30, i64 1 seq_cst, !dbg !198
  %13 = load i32* %d.addr, align 4, !dbg !198
  %conv8 = trunc i32 %13 to i8, !dbg !198
  %14 = load %struct.ptree.3** %n.addr, align 8, !dbg !198
  %p_b9 = getelementptr inbounds %struct.ptree.3* %14, i32 0, i32 3, !dbg !198
  %15 = load i32* %sdmprofile__threadnumber_st, !dbg !198
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b9, i8 1, i32 %15), !dbg !198
  store i8 %conv8, i8* %p_b9, align 1, !dbg !198
  %16 = load i32* %d.addr, align 4, !dbg !200
  %17 = load %struct.ptree.3** %n.addr, align 8, !dbg !200
  %p_key = getelementptr inbounds %struct.ptree.3* %17, i32 0, i32 0, !dbg !200
  %18 = bitcast i64* %p_key to i8*, !dbg !200
  %19 = load i32* %sdmprofile__threadnumber_st, !dbg !200
  call void @sdmprofile__SearchRoutine_HPonly(i8* %18, i8 2, i32 %19), !dbg !200
  %20 = load i64* %p_key, align 8, !dbg !200
  %sdmprofile__LD14 = load i32* %sdmprofile__threadnumber_st, align 8
  %21 = call i64 @bit(i32 %16, i64 %20, i32 %sdmprofile__LD14), !dbg !200
  %tobool = icmp ne i64 %21, 0, !dbg !200
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !200

cond.true:                                        ; preds = %if.then
  %22 = atomicrmw add i64* @sdmprofile__BBcounter_31, i64 1 seq_cst, !dbg !201
  %23 = load %struct.ptree.3** %h.addr, align 8, !dbg !201
  br label %cond.end, !dbg !201

cond.false:                                       ; preds = %if.then
  %24 = atomicrmw add i64* @sdmprofile__BBcounter_32, i64 1 seq_cst, !dbg !203
  %25 = load %struct.ptree.3** %n.addr, align 8, !dbg !203
  br label %cond.end, !dbg !203

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.ptree.3* [ %23, %cond.true ], [ %25, %cond.false ], !dbg !200
  %26 = atomicrmw add i64* @sdmprofile__BBcounter_33, i64 1 seq_cst, !dbg !205
  %27 = load %struct.ptree.3** %n.addr, align 8, !dbg !205
  %p_left = getelementptr inbounds %struct.ptree.3* %27, i32 0, i32 4, !dbg !205
  %28 = bitcast %struct.ptree.3** %p_left to i8*, !dbg !205
  %29 = load i32* %sdmprofile__threadnumber_st, !dbg !205
  call void @sdmprofile__SearchRoutine_HPonly(i8* %28, i8 1, i32 %29), !dbg !205
  store %struct.ptree.3* %cond, %struct.ptree.3** %p_left, align 8, !dbg !205
  %30 = load i32* %d.addr, align 4, !dbg !208
  %31 = load %struct.ptree.3** %n.addr, align 8, !dbg !208
  %p_key10 = getelementptr inbounds %struct.ptree.3* %31, i32 0, i32 0, !dbg !208
  %32 = bitcast i64* %p_key10 to i8*, !dbg !208
  %33 = load i32* %sdmprofile__threadnumber_st, !dbg !208
  call void @sdmprofile__SearchRoutine_HPonly(i8* %32, i8 2, i32 %33), !dbg !208
  %34 = load i64* %p_key10, align 8, !dbg !208
  %sdmprofile__LD13 = load i32* %sdmprofile__threadnumber_st, align 8
  %35 = call i64 @bit(i32 %30, i64 %34, i32 %sdmprofile__LD13), !dbg !208
  %tobool12 = icmp ne i64 %35, 0, !dbg !208
  br i1 %tobool12, label %cond.true13, label %cond.false14, !dbg !208

cond.true13:                                      ; preds = %cond.end
  %36 = atomicrmw add i64* @sdmprofile__BBcounter_34, i64 1 seq_cst, !dbg !209
  %37 = load %struct.ptree.3** %n.addr, align 8, !dbg !209
  br label %cond.end15, !dbg !209

cond.false14:                                     ; preds = %cond.end
  %38 = atomicrmw add i64* @sdmprofile__BBcounter_35, i64 1 seq_cst, !dbg !211
  %39 = load %struct.ptree.3** %h.addr, align 8, !dbg !211
  br label %cond.end15, !dbg !211

cond.end15:                                       ; preds = %cond.false14, %cond.true13
  %cond16 = phi %struct.ptree.3* [ %37, %cond.true13 ], [ %39, %cond.false14 ], !dbg !208
  %40 = atomicrmw add i64* @sdmprofile__BBcounter_36, i64 1 seq_cst, !dbg !213
  %41 = load %struct.ptree.3** %n.addr, align 8, !dbg !213
  %p_right = getelementptr inbounds %struct.ptree.3* %41, i32 0, i32 5, !dbg !213
  %42 = bitcast %struct.ptree.3** %p_right to i8*, !dbg !213
  %43 = load i32* %sdmprofile__threadnumber_st, !dbg !213
  call void @sdmprofile__SearchRoutine_HPonly(i8* %42, i8 1, i32 %43), !dbg !213
  store %struct.ptree.3* %cond16, %struct.ptree.3** %p_right, align 8, !dbg !213
  %44 = load %struct.ptree.3** %n.addr, align 8, !dbg !216
  store %struct.ptree.3* %44, %struct.ptree.3** %retval, !dbg !216
  br label %return, !dbg !216

if.end:                                           ; preds = %lor.lhs.false
  %45 = atomicrmw add i64* @sdmprofile__BBcounter_37, i64 1 seq_cst, !dbg !217
  %46 = load %struct.ptree.3** %h.addr, align 8, !dbg !217
  %p_b17 = getelementptr inbounds %struct.ptree.3* %46, i32 0, i32 3, !dbg !217
  %47 = load i32* %sdmprofile__threadnumber_st, !dbg !217
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b17, i8 2, i32 %47), !dbg !217
  %48 = load i8* %p_b17, align 1, !dbg !217
  %conv18 = sext i8 %48 to i32, !dbg !217
  %49 = load %struct.ptree.3** %n.addr, align 8, !dbg !217
  %p_key19 = getelementptr inbounds %struct.ptree.3* %49, i32 0, i32 0, !dbg !217
  %50 = bitcast i64* %p_key19 to i8*, !dbg !217
  %51 = load i32* %sdmprofile__threadnumber_st, !dbg !217
  call void @sdmprofile__SearchRoutine_HPonly(i8* %50, i8 2, i32 %51), !dbg !217
  %52 = load i64* %p_key19, align 8, !dbg !217
  %sdmprofile__LD12 = load i32* %sdmprofile__threadnumber_st, align 8
  %53 = call i64 @bit(i32 %conv18, i64 %52, i32 %sdmprofile__LD12), !dbg !217
  %tobool21 = icmp ne i64 %53, 0, !dbg !217
  br i1 %tobool21, label %if.then22, label %if.else, !dbg !217

if.then22:                                        ; preds = %if.end
  %54 = atomicrmw add i64* @sdmprofile__BBcounter_38, i64 1 seq_cst, !dbg !219
  %55 = load %struct.ptree.3** %h.addr, align 8, !dbg !219
  %p_right23 = getelementptr inbounds %struct.ptree.3* %55, i32 0, i32 5, !dbg !219
  %56 = bitcast %struct.ptree.3** %p_right23 to i8*, !dbg !219
  %57 = load i32* %sdmprofile__threadnumber_st, !dbg !219
  call void @sdmprofile__SearchRoutine_HPonly(i8* %56, i8 2, i32 %57), !dbg !219
  %58 = load %struct.ptree.3** %p_right23, align 8, !dbg !219
  %59 = load %struct.ptree.3** %n.addr, align 8, !dbg !219
  %60 = load i32* %d.addr, align 4, !dbg !219
  %61 = load %struct.ptree.3** %h.addr, align 8, !dbg !219
  %sdmprofile__LD18 = load i32* %sdmprofile__threadnumber_st, align 8
  %62 = call %struct.ptree.3* @insertR(%struct.ptree.3* %58, %struct.ptree.3* %59, i32 %60, %struct.ptree.3* %61, i32 %sdmprofile__LD18), !dbg !219
  %63 = load %struct.ptree.3** %h.addr, align 8, !dbg !219
  %p_right25 = getelementptr inbounds %struct.ptree.3* %63, i32 0, i32 5, !dbg !219
  %64 = bitcast %struct.ptree.3** %p_right25 to i8*, !dbg !219
  %65 = load i32* %sdmprofile__threadnumber_st, !dbg !219
  call void @sdmprofile__SearchRoutine_HPonly(i8* %64, i8 1, i32 %65), !dbg !219
  store %struct.ptree.3* %62, %struct.ptree.3** %p_right25, align 8, !dbg !219
  br label %if.end29, !dbg !219

if.else:                                          ; preds = %if.end
  %66 = atomicrmw add i64* @sdmprofile__BBcounter_39, i64 1 seq_cst, !dbg !220
  %67 = load %struct.ptree.3** %h.addr, align 8, !dbg !220
  %p_left26 = getelementptr inbounds %struct.ptree.3* %67, i32 0, i32 4, !dbg !220
  %68 = bitcast %struct.ptree.3** %p_left26 to i8*, !dbg !220
  %69 = load i32* %sdmprofile__threadnumber_st, !dbg !220
  call void @sdmprofile__SearchRoutine_HPonly(i8* %68, i8 2, i32 %69), !dbg !220
  %70 = load %struct.ptree.3** %p_left26, align 8, !dbg !220
  %71 = load %struct.ptree.3** %n.addr, align 8, !dbg !220
  %72 = load i32* %d.addr, align 4, !dbg !220
  %73 = load %struct.ptree.3** %h.addr, align 8, !dbg !220
  %sdmprofile__LD17 = load i32* %sdmprofile__threadnumber_st, align 8
  %74 = call %struct.ptree.3* @insertR(%struct.ptree.3* %70, %struct.ptree.3* %71, i32 %72, %struct.ptree.3* %73, i32 %sdmprofile__LD17), !dbg !220
  %75 = load %struct.ptree.3** %h.addr, align 8, !dbg !220
  %p_left28 = getelementptr inbounds %struct.ptree.3* %75, i32 0, i32 4, !dbg !220
  %76 = bitcast %struct.ptree.3** %p_left28 to i8*, !dbg !220
  %77 = load i32* %sdmprofile__threadnumber_st, !dbg !220
  call void @sdmprofile__SearchRoutine_HPonly(i8* %76, i8 1, i32 %77), !dbg !220
  store %struct.ptree.3* %74, %struct.ptree.3** %p_left28, align 8, !dbg !220
  br label %if.end29

if.end29:                                         ; preds = %if.else, %if.then22
  %78 = atomicrmw add i64* @sdmprofile__BBcounter_40, i64 1 seq_cst, !dbg !221
  %79 = load %struct.ptree.3** %h.addr, align 8, !dbg !221
  store %struct.ptree.3* %79, %struct.ptree.3** %retval, !dbg !221
  br label %return, !dbg !221

return:                                           ; preds = %if.end29, %cond.end15
  %80 = atomicrmw add i64* @sdmprofile__BBcounter_41, i64 1 seq_cst, !dbg !222
  %81 = load %struct.ptree.3** %retval, !dbg !222
  ret %struct.ptree.3* %81, !dbg !222
}

; Function Attrs: nounwind uwtable
define i32 @app__mainfunction__(i32 %argc, i8** %argv, i32 %sdmprofile__threadnumber) #11 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %phead = alloca %struct.ptree.3*, align 8
  %p = alloca %struct.ptree.3*, align 8
  %pfind = alloca %struct.ptree.3*, align 8
  %pm = alloca %struct.ptree_mask.2*, align 8
  %fp = alloca %struct._IO_FILE.1*, align 8
  %line = alloca [128 x i8], align 16
  %addr_str = alloca [16 x i8], align 16
  %addr = alloca %struct.in_addr.4, align 4
  %mask = alloca i64, align 8
  %time = alloca float, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_1, i64 1 seq_cst, !dbg !223
  call void @llvm.dbg.declare(metadata !{i32* %argc.addr}, metadata !224), !dbg !223
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %argv.addr}, metadata !225), !dbg !226
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %phead}, metadata !227), !dbg !242
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %p}, metadata !243), !dbg !244
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %pfind}, metadata !245), !dbg !246
  call void @llvm.dbg.declare(metadata !{%struct.ptree_mask.2** %pm}, metadata !247), !dbg !248
  call void @llvm.dbg.declare(metadata !{%struct._IO_FILE.1** %fp}, metadata !249), !dbg !308
  call void @llvm.dbg.declare(metadata !{[128 x i8]* %line}, metadata !309), !dbg !313
  call void @llvm.dbg.declare(metadata !{[16 x i8]* %addr_str}, metadata !314), !dbg !318
  call void @llvm.dbg.declare(metadata !{%struct.in_addr.4* %addr}, metadata !319), !dbg !328
  call void @llvm.dbg.declare(metadata !{i64* %mask}, metadata !329), !dbg !330
  store i64 4294967295, i64* %mask, align 8, !dbg !331
  call void @llvm.dbg.declare(metadata !{float* %time}, metadata !332), !dbg !334
  %1 = load i32* %argc.addr, align 4, !dbg !335
  %cmp = icmp slt i32 %1, 2, !dbg !335
  br i1 %cmp, label %if.then, label %if.end, !dbg !335

if.then:                                          ; preds = %entry
  %2 = atomicrmw add i64* @sdmprofile__BBcounter_2, i64 1 seq_cst, !dbg !337
  %3 = load i8*** %argv.addr, align 8, !dbg !337
  %arrayidx = getelementptr inbounds i8** %3, i64 0, !dbg !337
  %4 = bitcast i8** %arrayidx to i8*, !dbg !337
  %5 = load i32* %sdmprofile__threadnumber_st, !dbg !337
  call void @sdmprofile__SearchRoutine_HPonly(i8* %4, i8 2, i32 %5), !dbg !337
  %6 = load i8** %arrayidx, align 8, !dbg !337
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str1, i32 0, i32 0), i8* %6), !dbg !337
  call void @exit(i32 -1) #20, !dbg !339
  unreachable, !dbg !339

if.end:                                           ; preds = %entry
  %7 = atomicrmw add i64* @sdmprofile__BBcounter_3, i64 1 seq_cst, !dbg !340
  %8 = load i8*** %argv.addr, align 8, !dbg !340
  %arrayidx1 = getelementptr inbounds i8** %8, i64 1, !dbg !340
  %9 = bitcast i8** %arrayidx1 to i8*, !dbg !340
  %10 = load i32* %sdmprofile__threadnumber_st, !dbg !340
  call void @sdmprofile__SearchRoutine_HPonly(i8* %9, i8 2, i32 %10), !dbg !340
  %11 = load i8** %arrayidx1, align 8, !dbg !340
  %call2 = call %struct._IO_FILE.1* @fopen(i8* %11, i8* getelementptr inbounds ([2 x i8]* @.str16, i32 0, i32 0)), !dbg !340
  store %struct._IO_FILE.1* %call2, %struct._IO_FILE.1** %fp, align 8, !dbg !340
  %cmp3 = icmp eq %struct._IO_FILE.1* %call2, null, !dbg !340
  br i1 %cmp3, label %if.then4, label %if.end7, !dbg !340

if.then4:                                         ; preds = %if.end
  %12 = atomicrmw add i64* @sdmprofile__BBcounter_4, i64 1 seq_cst, !dbg !342
  %13 = load i8*** %argv.addr, align 8, !dbg !342
  %arrayidx5 = getelementptr inbounds i8** %13, i64 1, !dbg !342
  %14 = bitcast i8** %arrayidx5 to i8*, !dbg !342
  %15 = load i32* %sdmprofile__threadnumber_st, !dbg !342
  call void @sdmprofile__SearchRoutine_HPonly(i8* %14, i8 2, i32 %15), !dbg !342
  %16 = load i8** %arrayidx5, align 8, !dbg !342
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str2, i32 0, i32 0), i8* %16), !dbg !342
  call void @exit(i32 0) #20, !dbg !344
  unreachable, !dbg !344

if.end7:                                          ; preds = %if.end
  %17 = atomicrmw add i64* @sdmprofile__BBcounter_5, i64 1 seq_cst, !dbg !345
  %call8 = call noalias i8* @malloc(i64 40) #2, !dbg !345
  %18 = load i32* %sdmprofile__threadnumber_st, !dbg !345
  %19 = call i8* @sdmprofile__malloc(i64 40, i32 1, i32 %18), !dbg !345
  %20 = bitcast i8* %19 to %struct.ptree.3*, !dbg !345
  store %struct.ptree.3* %20, %struct.ptree.3** %phead, align 8, !dbg !345
  %21 = load %struct.ptree.3** %phead, align 8, !dbg !346
  %tobool = icmp ne %struct.ptree.3* %21, null, !dbg !346
  br i1 %tobool, label %if.end10, label %if.then9, !dbg !346

if.then9:                                         ; preds = %if.end7
  %22 = atomicrmw add i64* @sdmprofile__BBcounter_6, i64 1 seq_cst, !dbg !348
  call void @perror(i8* getelementptr inbounds ([23 x i8]* @.str37, i32 0, i32 0)), !dbg !348
  call void @exit(i32 0) #20, !dbg !350
  unreachable, !dbg !350

if.end10:                                         ; preds = %if.end7
  %23 = atomicrmw add i64* @sdmprofile__BBcounter_7, i64 1 seq_cst, !dbg !351
  %24 = load %struct.ptree.3** %phead, align 8, !dbg !351
  %25 = bitcast %struct.ptree.3* %24 to i8*, !dbg !351
  call void @llvm.memset.p0i8.i64(i8* %25, i8 0, i64 40, i32 8, i1 false), !dbg !351
  %call11 = call noalias i8* @malloc(i64 16) #2, !dbg !352
  %26 = load i32* %sdmprofile__threadnumber_st, !dbg !352
  %27 = call i8* @sdmprofile__malloc(i64 16, i32 2, i32 %26), !dbg !352
  %28 = bitcast i8* %27 to %struct.ptree_mask.2*, !dbg !352
  %29 = load %struct.ptree.3** %phead, align 8, !dbg !352
  %p_m = getelementptr inbounds %struct.ptree.3* %29, i32 0, i32 1, !dbg !352
  %30 = bitcast %struct.ptree_mask.2** %p_m to i8*, !dbg !352
  %31 = load i32* %sdmprofile__threadnumber_st, !dbg !352
  call void @sdmprofile__SearchRoutine_HPonly(i8* %30, i8 1, i32 %31), !dbg !352
  store %struct.ptree_mask.2* %28, %struct.ptree_mask.2** %p_m, align 8, !dbg !352
  %32 = load %struct.ptree.3** %phead, align 8, !dbg !353
  %p_m12 = getelementptr inbounds %struct.ptree.3* %32, i32 0, i32 1, !dbg !353
  %33 = bitcast %struct.ptree_mask.2** %p_m12 to i8*, !dbg !353
  %34 = load i32* %sdmprofile__threadnumber_st, !dbg !353
  call void @sdmprofile__SearchRoutine_HPonly(i8* %33, i8 2, i32 %34), !dbg !353
  %35 = load %struct.ptree_mask.2** %p_m12, align 8, !dbg !353
  %tobool13 = icmp ne %struct.ptree_mask.2* %35, null, !dbg !353
  br i1 %tobool13, label %if.end15, label %if.then14, !dbg !353

if.then14:                                        ; preds = %if.end10
  %36 = atomicrmw add i64* @sdmprofile__BBcounter_8, i64 1 seq_cst, !dbg !355
  call void @perror(i8* getelementptr inbounds ([28 x i8]* @.str48, i32 0, i32 0)), !dbg !355
  call void @exit(i32 0) #20, !dbg !357
  unreachable, !dbg !357

if.end15:                                         ; preds = %if.end10
  %37 = atomicrmw add i64* @sdmprofile__BBcounter_9, i64 1 seq_cst, !dbg !358
  %38 = load %struct.ptree.3** %phead, align 8, !dbg !358
  %p_m16 = getelementptr inbounds %struct.ptree.3* %38, i32 0, i32 1, !dbg !358
  %39 = bitcast %struct.ptree_mask.2** %p_m16 to i8*, !dbg !358
  %40 = load i32* %sdmprofile__threadnumber_st, !dbg !358
  call void @sdmprofile__SearchRoutine_HPonly(i8* %39, i8 2, i32 %40), !dbg !358
  %41 = load %struct.ptree_mask.2** %p_m16, align 8, !dbg !358
  %42 = bitcast %struct.ptree_mask.2* %41 to i8*, !dbg !358
  call void @llvm.memset.p0i8.i64(i8* %42, i8 0, i64 16, i32 8, i1 false), !dbg !358
  %43 = load %struct.ptree.3** %phead, align 8, !dbg !359
  %p_m17 = getelementptr inbounds %struct.ptree.3* %43, i32 0, i32 1, !dbg !359
  %44 = bitcast %struct.ptree_mask.2** %p_m17 to i8*, !dbg !359
  %45 = load i32* %sdmprofile__threadnumber_st, !dbg !359
  call void @sdmprofile__SearchRoutine_HPonly(i8* %44, i8 2, i32 %45), !dbg !359
  %46 = load %struct.ptree_mask.2** %p_m17, align 8, !dbg !359
  store %struct.ptree_mask.2* %46, %struct.ptree_mask.2** %pm, align 8, !dbg !359
  %call18 = call noalias i8* @malloc(i64 16) #2, !dbg !360
  %47 = load i32* %sdmprofile__threadnumber_st, !dbg !360
  %48 = call i8* @sdmprofile__malloc(i64 16, i32 4, i32 %47), !dbg !360
  %49 = bitcast i8* %48 to %struct.MyNode.5*, !dbg !360
  %50 = bitcast %struct.MyNode.5* %49 to i8*, !dbg !360
  %51 = load %struct.ptree_mask.2** %pm, align 8, !dbg !360
  %pm_data = getelementptr inbounds %struct.ptree_mask.2* %51, i32 0, i32 1, !dbg !360
  %52 = bitcast i8** %pm_data to i8*, !dbg !360
  %53 = load i32* %sdmprofile__threadnumber_st, !dbg !360
  call void @sdmprofile__SearchRoutine_HPonly(i8* %52, i8 1, i32 %53), !dbg !360
  store i8* %50, i8** %pm_data, align 8, !dbg !360
  %54 = load %struct.ptree_mask.2** %pm, align 8, !dbg !361
  %pm_data19 = getelementptr inbounds %struct.ptree_mask.2* %54, i32 0, i32 1, !dbg !361
  %55 = bitcast i8** %pm_data19 to i8*, !dbg !361
  %56 = load i32* %sdmprofile__threadnumber_st, !dbg !361
  call void @sdmprofile__SearchRoutine_HPonly(i8* %55, i8 2, i32 %56), !dbg !361
  %57 = load i8** %pm_data19, align 8, !dbg !361
  %tobool20 = icmp ne i8* %57, null, !dbg !361
  br i1 %tobool20, label %if.end22, label %if.then21, !dbg !361

if.then21:                                        ; preds = %if.end15
  %58 = atomicrmw add i64* @sdmprofile__BBcounter_10, i64 1 seq_cst, !dbg !363
  call void @perror(i8* getelementptr inbounds ([35 x i8]* @.str59, i32 0, i32 0)), !dbg !363
  call void @exit(i32 0) #20, !dbg !365
  unreachable, !dbg !365

if.end22:                                         ; preds = %if.end15
  %59 = atomicrmw add i64* @sdmprofile__BBcounter_11, i64 1 seq_cst, !dbg !366
  %60 = load %struct.ptree_mask.2** %pm, align 8, !dbg !366
  %pm_data23 = getelementptr inbounds %struct.ptree_mask.2* %60, i32 0, i32 1, !dbg !366
  %61 = bitcast i8** %pm_data23 to i8*, !dbg !366
  %62 = load i32* %sdmprofile__threadnumber_st, !dbg !366
  call void @sdmprofile__SearchRoutine_HPonly(i8* %61, i8 2, i32 %62), !dbg !366
  %63 = load i8** %pm_data23, align 8, !dbg !366
  call void @llvm.memset.p0i8.i64(i8* %63, i8 0, i64 1, i32 1, i1 false), !dbg !366
  %64 = load %struct.ptree.3** %phead, align 8, !dbg !367
  %p_mlen = getelementptr inbounds %struct.ptree.3* %64, i32 0, i32 2, !dbg !367
  %65 = load i32* %sdmprofile__threadnumber_st, !dbg !367
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_mlen, i8 1, i32 %65), !dbg !367
  store i8 1, i8* %p_mlen, align 1, !dbg !367
  %66 = load %struct.ptree.3** %phead, align 8, !dbg !368
  %67 = load %struct.ptree.3** %phead, align 8, !dbg !368
  %p_right = getelementptr inbounds %struct.ptree.3* %67, i32 0, i32 5, !dbg !368
  %68 = bitcast %struct.ptree.3** %p_right to i8*, !dbg !368
  %69 = load i32* %sdmprofile__threadnumber_st, !dbg !368
  call void @sdmprofile__SearchRoutine_HPonly(i8* %68, i8 1, i32 %69), !dbg !368
  store %struct.ptree.3* %66, %struct.ptree.3** %p_right, align 8, !dbg !368
  %70 = load %struct.ptree.3** %phead, align 8, !dbg !368
  %p_left = getelementptr inbounds %struct.ptree.3* %70, i32 0, i32 4, !dbg !368
  %71 = bitcast %struct.ptree.3** %p_left to i8*, !dbg !368
  %72 = load i32* %sdmprofile__threadnumber_st, !dbg !368
  call void @sdmprofile__SearchRoutine_HPonly(i8* %71, i8 1, i32 %72), !dbg !368
  store %struct.ptree.3* %66, %struct.ptree.3** %p_left, align 8, !dbg !368
  br label %while.cond, !dbg !369

while.cond:                                       ; preds = %if.end69, %if.end22
  %73 = atomicrmw add i64* @sdmprofile__BBcounter_12, i64 1 seq_cst, !dbg !370
  %arraydecay = getelementptr inbounds [128 x i8]* %line, i32 0, i32 0, !dbg !370
  %74 = load %struct._IO_FILE.1** %fp, align 8, !dbg !370
  %call24 = call i8* @fgets(i8* %arraydecay, i32 128, %struct._IO_FILE.1* %74), !dbg !370
  %tobool25 = icmp ne i8* %call24, null, !dbg !370
  br i1 %tobool25, label %while.body, label %while.end, !dbg !370

while.body:                                       ; preds = %while.cond
  %75 = atomicrmw add i64* @sdmprofile__BBcounter_13, i64 1 seq_cst, !dbg !372
  %arraydecay26 = getelementptr inbounds [128 x i8]* %line, i32 0, i32 0, !dbg !372
  %76 = bitcast %struct.in_addr.4* %addr to i32*, !dbg !372
  %call27 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %arraydecay26, i8* getelementptr inbounds ([6 x i8]* @.str610, i32 0, i32 0), float* %time, i32* %76) #2, !dbg !372
  %call28 = call noalias i8* @malloc(i64 40) #2, !dbg !374
  %77 = load i32* %sdmprofile__threadnumber_st, !dbg !374
  %78 = call i8* @sdmprofile__malloc(i64 40, i32 3, i32 %77), !dbg !374
  %79 = bitcast i8* %78 to %struct.ptree.3*, !dbg !374
  store %struct.ptree.3* %79, %struct.ptree.3** %p, align 8, !dbg !374
  %80 = load %struct.ptree.3** %p, align 8, !dbg !375
  %tobool29 = icmp ne %struct.ptree.3* %80, null, !dbg !375
  br i1 %tobool29, label %if.end31, label %if.then30, !dbg !375

if.then30:                                        ; preds = %while.body
  %81 = atomicrmw add i64* @sdmprofile__BBcounter_14, i64 1 seq_cst, !dbg !377
  call void @perror(i8* getelementptr inbounds ([23 x i8]* @.str37, i32 0, i32 0)), !dbg !377
  call void @exit(i32 0) #20, !dbg !379
  unreachable, !dbg !379

if.end31:                                         ; preds = %while.body
  %82 = atomicrmw add i64* @sdmprofile__BBcounter_15, i64 1 seq_cst, !dbg !380
  %83 = load %struct.ptree.3** %p, align 8, !dbg !380
  %84 = bitcast %struct.ptree.3* %83 to i8*, !dbg !380
  call void @llvm.memset.p0i8.i64(i8* %84, i8 0, i64 40, i32 8, i1 false), !dbg !380
  %call32 = call noalias i8* @malloc(i64 16) #2, !dbg !381
  %85 = load i32* %sdmprofile__threadnumber_st, !dbg !381
  %86 = call i8* @sdmprofile__malloc(i64 16, i32 5, i32 %85), !dbg !381
  %87 = bitcast i8* %86 to %struct.ptree_mask.2*, !dbg !381
  %88 = load %struct.ptree.3** %p, align 8, !dbg !381
  %p_m33 = getelementptr inbounds %struct.ptree.3* %88, i32 0, i32 1, !dbg !381
  %89 = bitcast %struct.ptree_mask.2** %p_m33 to i8*, !dbg !381
  %90 = load i32* %sdmprofile__threadnumber_st, !dbg !381
  call void @sdmprofile__SearchRoutine_HPonly(i8* %89, i8 1, i32 %90), !dbg !381
  store %struct.ptree_mask.2* %87, %struct.ptree_mask.2** %p_m33, align 8, !dbg !381
  %91 = load %struct.ptree.3** %p, align 8, !dbg !382
  %p_m34 = getelementptr inbounds %struct.ptree.3* %91, i32 0, i32 1, !dbg !382
  %92 = bitcast %struct.ptree_mask.2** %p_m34 to i8*, !dbg !382
  %93 = load i32* %sdmprofile__threadnumber_st, !dbg !382
  call void @sdmprofile__SearchRoutine_HPonly(i8* %92, i8 2, i32 %93), !dbg !382
  %94 = load %struct.ptree_mask.2** %p_m34, align 8, !dbg !382
  %tobool35 = icmp ne %struct.ptree_mask.2* %94, null, !dbg !382
  br i1 %tobool35, label %if.end37, label %if.then36, !dbg !382

if.then36:                                        ; preds = %if.end31
  %95 = atomicrmw add i64* @sdmprofile__BBcounter_16, i64 1 seq_cst, !dbg !384
  call void @perror(i8* getelementptr inbounds ([28 x i8]* @.str48, i32 0, i32 0)), !dbg !384
  call void @exit(i32 0) #20, !dbg !386
  unreachable, !dbg !386

if.end37:                                         ; preds = %if.end31
  %96 = atomicrmw add i64* @sdmprofile__BBcounter_17, i64 1 seq_cst, !dbg !387
  %97 = load %struct.ptree.3** %p, align 8, !dbg !387
  %p_m38 = getelementptr inbounds %struct.ptree.3* %97, i32 0, i32 1, !dbg !387
  %98 = bitcast %struct.ptree_mask.2** %p_m38 to i8*, !dbg !387
  %99 = load i32* %sdmprofile__threadnumber_st, !dbg !387
  call void @sdmprofile__SearchRoutine_HPonly(i8* %98, i8 2, i32 %99), !dbg !387
  %100 = load %struct.ptree_mask.2** %p_m38, align 8, !dbg !387
  %101 = bitcast %struct.ptree_mask.2* %100 to i8*, !dbg !387
  call void @llvm.memset.p0i8.i64(i8* %101, i8 0, i64 16, i32 8, i1 false), !dbg !387
  %102 = load %struct.ptree.3** %p, align 8, !dbg !388
  %p_m39 = getelementptr inbounds %struct.ptree.3* %102, i32 0, i32 1, !dbg !388
  %103 = bitcast %struct.ptree_mask.2** %p_m39 to i8*, !dbg !388
  %104 = load i32* %sdmprofile__threadnumber_st, !dbg !388
  call void @sdmprofile__SearchRoutine_HPonly(i8* %103, i8 2, i32 %104), !dbg !388
  %105 = load %struct.ptree_mask.2** %p_m39, align 8, !dbg !388
  store %struct.ptree_mask.2* %105, %struct.ptree_mask.2** %pm, align 8, !dbg !388
  %call40 = call noalias i8* @malloc(i64 16) #2, !dbg !389
  %106 = load i32* %sdmprofile__threadnumber_st, !dbg !389
  %107 = call i8* @sdmprofile__malloc(i64 16, i32 6, i32 %106), !dbg !389
  %108 = bitcast i8* %107 to %struct.MyNode.5*, !dbg !389
  %109 = bitcast %struct.MyNode.5* %108 to i8*, !dbg !389
  %110 = load %struct.ptree_mask.2** %pm, align 8, !dbg !389
  %pm_data41 = getelementptr inbounds %struct.ptree_mask.2* %110, i32 0, i32 1, !dbg !389
  %111 = bitcast i8** %pm_data41 to i8*, !dbg !389
  %112 = load i32* %sdmprofile__threadnumber_st, !dbg !389
  call void @sdmprofile__SearchRoutine_HPonly(i8* %111, i8 1, i32 %112), !dbg !389
  store i8* %109, i8** %pm_data41, align 8, !dbg !389
  %113 = load %struct.ptree_mask.2** %pm, align 8, !dbg !390
  %pm_data42 = getelementptr inbounds %struct.ptree_mask.2* %113, i32 0, i32 1, !dbg !390
  %114 = bitcast i8** %pm_data42 to i8*, !dbg !390
  %115 = load i32* %sdmprofile__threadnumber_st, !dbg !390
  call void @sdmprofile__SearchRoutine_HPonly(i8* %114, i8 2, i32 %115), !dbg !390
  %116 = load i8** %pm_data42, align 8, !dbg !390
  %tobool43 = icmp ne i8* %116, null, !dbg !390
  br i1 %tobool43, label %if.end45, label %if.then44, !dbg !390

if.then44:                                        ; preds = %if.end37
  %117 = atomicrmw add i64* @sdmprofile__BBcounter_18, i64 1 seq_cst, !dbg !392
  call void @perror(i8* getelementptr inbounds ([35 x i8]* @.str59, i32 0, i32 0)), !dbg !392
  call void @exit(i32 0) #20, !dbg !394
  unreachable, !dbg !394

if.end45:                                         ; preds = %if.end37
  %118 = atomicrmw add i64* @sdmprofile__BBcounter_19, i64 1 seq_cst, !dbg !395
  %119 = load %struct.ptree_mask.2** %pm, align 8, !dbg !395
  %pm_data46 = getelementptr inbounds %struct.ptree_mask.2* %119, i32 0, i32 1, !dbg !395
  %120 = bitcast i8** %pm_data46 to i8*, !dbg !395
  %121 = load i32* %sdmprofile__threadnumber_st, !dbg !395
  call void @sdmprofile__SearchRoutine_HPonly(i8* %120, i8 2, i32 %121), !dbg !395
  %122 = load i8** %pm_data46, align 8, !dbg !395
  call void @llvm.memset.p0i8.i64(i8* %122, i8 0, i64 1, i32 1, i1 false), !dbg !395
  %s_addr = getelementptr inbounds %struct.in_addr.4* %addr, i32 0, i32 0, !dbg !396
  %123 = load i32* %s_addr, align 4, !dbg !396
  %conv = zext i32 %123 to i64, !dbg !396
  %124 = load %struct.ptree.3** %p, align 8, !dbg !396
  %p_key = getelementptr inbounds %struct.ptree.3* %124, i32 0, i32 0, !dbg !396
  %125 = bitcast i64* %p_key to i8*, !dbg !396
  %126 = load i32* %sdmprofile__threadnumber_st, !dbg !396
  call void @sdmprofile__SearchRoutine_HPonly(i8* %125, i8 1, i32 %126), !dbg !396
  store i64 %conv, i64* %p_key, align 8, !dbg !396
  %127 = load i64* %mask, align 8, !dbg !397
  %conv47 = trunc i64 %127 to i32, !dbg !397
  %call48 = call i32 @htonl(i32 %conv47) #12, !dbg !397
  %conv49 = zext i32 %call48 to i64, !dbg !397
  %128 = load %struct.ptree.3** %p, align 8, !dbg !397
  %p_m50 = getelementptr inbounds %struct.ptree.3* %128, i32 0, i32 1, !dbg !397
  %129 = bitcast %struct.ptree_mask.2** %p_m50 to i8*, !dbg !397
  %130 = load i32* %sdmprofile__threadnumber_st, !dbg !397
  call void @sdmprofile__SearchRoutine_HPonly(i8* %129, i8 2, i32 %130), !dbg !397
  %131 = load %struct.ptree_mask.2** %p_m50, align 8, !dbg !397
  %pm_mask = getelementptr inbounds %struct.ptree_mask.2* %131, i32 0, i32 0, !dbg !397
  %132 = bitcast i64* %pm_mask to i8*, !dbg !397
  %133 = load i32* %sdmprofile__threadnumber_st, !dbg !397
  call void @sdmprofile__SearchRoutine_HPonly(i8* %132, i8 1, i32 %133), !dbg !397
  store i64 %conv49, i64* %pm_mask, align 8, !dbg !397
  %s_addr51 = getelementptr inbounds %struct.in_addr.4* %addr, i32 0, i32 0, !dbg !398
  %134 = load i32* %s_addr51, align 4, !dbg !398
  %conv52 = zext i32 %134 to i64, !dbg !398
  %135 = load %struct.ptree.3** %phead, align 8, !dbg !398
  %sdmprofile__LD20 = load i32* %sdmprofile__threadnumber_st, align 8
  %136 = call %struct.ptree.3* @pat_search(i64 %conv52, %struct.ptree.3* %135, i32 %sdmprofile__LD20), !dbg !398
  store %struct.ptree.3* %136, %struct.ptree.3** %pfind, align 8, !dbg !398
  %137 = load %struct.ptree.3** %pfind, align 8, !dbg !399
  %p_key54 = getelementptr inbounds %struct.ptree.3* %137, i32 0, i32 0, !dbg !399
  %138 = bitcast i64* %p_key54 to i8*, !dbg !399
  %139 = load i32* %sdmprofile__threadnumber_st, !dbg !399
  call void @sdmprofile__SearchRoutine_HPonly(i8* %138, i8 2, i32 %139), !dbg !399
  %140 = load i64* %p_key54, align 8, !dbg !399
  %s_addr55 = getelementptr inbounds %struct.in_addr.4* %addr, i32 0, i32 0, !dbg !399
  %141 = load i32* %s_addr55, align 4, !dbg !399
  %conv56 = zext i32 %141 to i64, !dbg !399
  %cmp57 = icmp eq i64 %140, %conv56, !dbg !399
  br i1 %cmp57, label %if.then59, label %if.else, !dbg !399

if.then59:                                        ; preds = %if.end45
  %142 = atomicrmw add i64* @sdmprofile__BBcounter_20, i64 1 seq_cst, !dbg !401
  %143 = load float* %time, align 4, !dbg !401
  %conv60 = fpext float %143 to double, !dbg !401
  %s_addr61 = getelementptr inbounds %struct.in_addr.4* %addr, i32 0, i32 0, !dbg !401
  %144 = load i32* %s_addr61, align 4, !dbg !401
  %call62 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str711, i32 0, i32 0), double %conv60, i32 %144), !dbg !401
  %call63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str812, i32 0, i32 0)), !dbg !403
  br label %if.end65, !dbg !404

if.else:                                          ; preds = %if.end45
  %145 = atomicrmw add i64* @sdmprofile__BBcounter_21, i64 1 seq_cst, !dbg !405
  %146 = load %struct.ptree.3** %p, align 8, !dbg !405
  %147 = load %struct.ptree.3** %phead, align 8, !dbg !405
  %sdmprofile__LD19 = load i32* %sdmprofile__threadnumber_st, align 8
  %148 = call %struct.ptree.3* @pat_insert(%struct.ptree.3* %146, %struct.ptree.3* %147, i32 %sdmprofile__LD19), !dbg !405
  store %struct.ptree.3* %148, %struct.ptree.3** %p, align 8, !dbg !405
  br label %if.end65

if.end65:                                         ; preds = %if.else, %if.then59
  %149 = atomicrmw add i64* @sdmprofile__BBcounter_22, i64 1 seq_cst, !dbg !407
  %150 = load %struct.ptree.3** %p, align 8, !dbg !407
  %tobool66 = icmp ne %struct.ptree.3* %150, null, !dbg !407
  br i1 %tobool66, label %if.end69, label %if.then67, !dbg !407

if.then67:                                        ; preds = %if.end65
  %151 = atomicrmw add i64* @sdmprofile__BBcounter_23, i64 1 seq_cst, !dbg !409
  %152 = load %struct._IO_FILE.1** @stderr, align 8, !dbg !409
  %call68 = call i32 (%struct._IO_FILE.1*, i8*, ...)* @fprintf(%struct._IO_FILE.1* %152, i8* getelementptr inbounds ([22 x i8]* @.str913, i32 0, i32 0)), !dbg !409
  call void @exit(i32 0) #20, !dbg !411
  unreachable, !dbg !411

if.end69:                                         ; preds = %if.end65
  %153 = atomicrmw add i64* @sdmprofile__BBcounter_24, i64 1 seq_cst, !dbg !412
  br label %while.cond, !dbg !412

while.end:                                        ; preds = %while.cond
  %154 = atomicrmw add i64* @sdmprofile__BBcounter_25, i64 1 seq_cst, !dbg !413
  call void @exit(i32 1) #20, !dbg !413
  unreachable, !dbg !413

return:                                           ; No predecessors!
  %155 = atomicrmw add i64* @sdmprofile__BBcounter_26, i64 1 seq_cst, !dbg !414
  %156 = load i32* %retval, !dbg !414
  ret i32 %156, !dbg !414
}

; Function Attrs: nounwind uwtable
define %struct.ptree.3* @pat_insert(%struct.ptree.3* %n, %struct.ptree.3* %head, i32 %sdmprofile__threadnumber) #11 {
entry:
  %retval = alloca %struct.ptree.3*, align 8
  %n.addr = alloca %struct.ptree.3*, align 8
  %head.addr = alloca %struct.ptree.3*, align 8
  %t = alloca %struct.ptree.3*, align 8
  %buf = alloca %struct.ptree_mask.2*, align 8
  %pm = alloca %struct.ptree_mask.2*, align 8
  %i = alloca i32, align 4
  %copied = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store %struct.ptree.3* %n, %struct.ptree.3** %n.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_42, i64 1 seq_cst, !dbg !415
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %n.addr}, metadata !433), !dbg !415
  store %struct.ptree.3* %head, %struct.ptree.3** %head.addr, align 8
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %head.addr}, metadata !434), !dbg !435
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %t}, metadata !436), !dbg !437
  call void @llvm.dbg.declare(metadata !{%struct.ptree_mask.2** %buf}, metadata !438), !dbg !439
  call void @llvm.dbg.declare(metadata !{%struct.ptree_mask.2** %pm}, metadata !440), !dbg !441
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !442), !dbg !443
  call void @llvm.dbg.declare(metadata !{i32* %copied}, metadata !444), !dbg !445
  %1 = load %struct.ptree.3** %head.addr, align 8, !dbg !446
  %tobool = icmp ne %struct.ptree.3* %1, null, !dbg !446
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !446

lor.lhs.false:                                    ; preds = %entry
  %2 = atomicrmw add i64* @sdmprofile__BBcounter_43, i64 1 seq_cst, !dbg !448
  %3 = load %struct.ptree.3** %n.addr, align 8, !dbg !448
  %tobool1 = icmp ne %struct.ptree.3* %3, null, !dbg !448
  br i1 %tobool1, label %lor.lhs.false2, label %if.then, !dbg !448

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %4 = atomicrmw add i64* @sdmprofile__BBcounter_44, i64 1 seq_cst, !dbg !450
  %5 = load %struct.ptree.3** %n.addr, align 8, !dbg !450
  %p_m = getelementptr inbounds %struct.ptree.3* %5, i32 0, i32 1, !dbg !450
  %6 = bitcast %struct.ptree_mask.2** %p_m to i8*, !dbg !450
  %7 = load i32* %sdmprofile__threadnumber_st, !dbg !450
  call void @sdmprofile__SearchRoutine_HPonly(i8* %6, i8 2, i32 %7), !dbg !450
  %8 = load %struct.ptree_mask.2** %p_m, align 8, !dbg !450
  %tobool3 = icmp ne %struct.ptree_mask.2* %8, null, !dbg !450
  br i1 %tobool3, label %if.end, label %if.then, !dbg !450

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  %9 = atomicrmw add i64* @sdmprofile__BBcounter_45, i64 1 seq_cst, !dbg !452
  store %struct.ptree.3* null, %struct.ptree.3** %retval, !dbg !452
  br label %return, !dbg !452

if.end:                                           ; preds = %lor.lhs.false2
  %10 = atomicrmw add i64* @sdmprofile__BBcounter_46, i64 1 seq_cst, !dbg !453
  %11 = load %struct.ptree.3** %n.addr, align 8, !dbg !453
  %p_m4 = getelementptr inbounds %struct.ptree.3* %11, i32 0, i32 1, !dbg !453
  %12 = bitcast %struct.ptree_mask.2** %p_m4 to i8*, !dbg !453
  %13 = load i32* %sdmprofile__threadnumber_st, !dbg !453
  call void @sdmprofile__SearchRoutine_HPonly(i8* %12, i8 2, i32 %13), !dbg !453
  %14 = load %struct.ptree_mask.2** %p_m4, align 8, !dbg !453
  %pm_mask = getelementptr inbounds %struct.ptree_mask.2* %14, i32 0, i32 0, !dbg !453
  %15 = bitcast i64* %pm_mask to i8*, !dbg !453
  %16 = load i32* %sdmprofile__threadnumber_st, !dbg !453
  call void @sdmprofile__SearchRoutine_HPonly(i8* %15, i8 2, i32 %16), !dbg !453
  %17 = load i64* %pm_mask, align 8, !dbg !453
  %18 = load %struct.ptree.3** %n.addr, align 8, !dbg !453
  %p_key = getelementptr inbounds %struct.ptree.3* %18, i32 0, i32 0, !dbg !453
  %19 = bitcast i64* %p_key to i8*, !dbg !453
  %20 = load i32* %sdmprofile__threadnumber_st, !dbg !453
  call void @sdmprofile__SearchRoutine_HPonly(i8* %19, i8 2, i32 %20), !dbg !453
  %21 = load i64* %p_key, align 8, !dbg !453
  %and = and i64 %21, %17, !dbg !453
  %22 = bitcast i64* %p_key to i8*, !dbg !453
  %23 = load i32* %sdmprofile__threadnumber_st, !dbg !453
  call void @sdmprofile__SearchRoutine_HPonly(i8* %22, i8 1, i32 %23), !dbg !453
  store i64 %and, i64* %p_key, align 8, !dbg !453
  %24 = load %struct.ptree.3** %head.addr, align 8, !dbg !454
  store %struct.ptree.3* %24, %struct.ptree.3** %t, align 8, !dbg !454
  br label %do.body, !dbg !455

do.body:                                          ; preds = %do.cond, %if.end
  %25 = atomicrmw add i64* @sdmprofile__BBcounter_47, i64 1 seq_cst, !dbg !456
  %26 = load %struct.ptree.3** %t, align 8, !dbg !456
  %p_b = getelementptr inbounds %struct.ptree.3* %26, i32 0, i32 3, !dbg !456
  %27 = load i32* %sdmprofile__threadnumber_st, !dbg !456
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b, i8 2, i32 %27), !dbg !456
  %28 = load i8* %p_b, align 1, !dbg !456
  %conv = sext i8 %28 to i32, !dbg !456
  store i32 %conv, i32* %i, align 4, !dbg !456
  %29 = load %struct.ptree.3** %t, align 8, !dbg !458
  %p_b5 = getelementptr inbounds %struct.ptree.3* %29, i32 0, i32 3, !dbg !458
  %30 = load i32* %sdmprofile__threadnumber_st, !dbg !458
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b5, i8 2, i32 %30), !dbg !458
  %31 = load i8* %p_b5, align 1, !dbg !458
  %conv6 = sext i8 %31 to i32, !dbg !458
  %32 = load %struct.ptree.3** %n.addr, align 8, !dbg !458
  %p_key7 = getelementptr inbounds %struct.ptree.3* %32, i32 0, i32 0, !dbg !458
  %33 = bitcast i64* %p_key7 to i8*, !dbg !458
  %34 = load i32* %sdmprofile__threadnumber_st, !dbg !458
  call void @sdmprofile__SearchRoutine_HPonly(i8* %33, i8 2, i32 %34), !dbg !458
  %35 = load i64* %p_key7, align 8, !dbg !458
  %sdmprofile__LD11 = load i32* %sdmprofile__threadnumber_st, align 8
  %36 = call i64 @bit(i32 %conv6, i64 %35, i32 %sdmprofile__LD11), !dbg !458
  %tobool8 = icmp ne i64 %36, 0, !dbg !458
  br i1 %tobool8, label %cond.true, label %cond.false, !dbg !458

cond.true:                                        ; preds = %do.body
  %37 = atomicrmw add i64* @sdmprofile__BBcounter_48, i64 1 seq_cst, !dbg !459
  %38 = load %struct.ptree.3** %t, align 8, !dbg !459
  %p_right = getelementptr inbounds %struct.ptree.3* %38, i32 0, i32 5, !dbg !459
  %39 = bitcast %struct.ptree.3** %p_right to i8*, !dbg !459
  %40 = load i32* %sdmprofile__threadnumber_st, !dbg !459
  call void @sdmprofile__SearchRoutine_HPonly(i8* %39, i8 2, i32 %40), !dbg !459
  %41 = load %struct.ptree.3** %p_right, align 8, !dbg !459
  br label %cond.end, !dbg !459

cond.false:                                       ; preds = %do.body
  %42 = atomicrmw add i64* @sdmprofile__BBcounter_49, i64 1 seq_cst, !dbg !461
  %43 = load %struct.ptree.3** %t, align 8, !dbg !461
  %p_left = getelementptr inbounds %struct.ptree.3* %43, i32 0, i32 4, !dbg !461
  %44 = bitcast %struct.ptree.3** %p_left to i8*, !dbg !461
  %45 = load i32* %sdmprofile__threadnumber_st, !dbg !461
  call void @sdmprofile__SearchRoutine_HPonly(i8* %44, i8 2, i32 %45), !dbg !461
  %46 = load %struct.ptree.3** %p_left, align 8, !dbg !461
  br label %cond.end, !dbg !461

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.ptree.3* [ %41, %cond.true ], [ %46, %cond.false ], !dbg !458
  %47 = atomicrmw add i64* @sdmprofile__BBcounter_50, i64 1 seq_cst, !dbg !463
  store %struct.ptree.3* %cond, %struct.ptree.3** %t, align 8, !dbg !463
  br label %do.cond, !dbg !466

do.cond:                                          ; preds = %cond.end
  %48 = atomicrmw add i64* @sdmprofile__BBcounter_51, i64 1 seq_cst, !dbg !467
  %49 = load i32* %i, align 4, !dbg !467
  %50 = load %struct.ptree.3** %t, align 8, !dbg !467
  %p_b9 = getelementptr inbounds %struct.ptree.3* %50, i32 0, i32 3, !dbg !467
  %51 = load i32* %sdmprofile__threadnumber_st, !dbg !467
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b9, i8 2, i32 %51), !dbg !467
  %52 = load i8* %p_b9, align 1, !dbg !467
  %conv10 = sext i8 %52 to i32, !dbg !467
  %cmp = icmp slt i32 %49, %conv10, !dbg !467
  br i1 %cmp, label %do.body, label %do.end, !dbg !467

do.end:                                           ; preds = %do.cond
  %53 = atomicrmw add i64* @sdmprofile__BBcounter_52, i64 1 seq_cst, !dbg !469
  %54 = load %struct.ptree.3** %n.addr, align 8, !dbg !469
  %p_key12 = getelementptr inbounds %struct.ptree.3* %54, i32 0, i32 0, !dbg !469
  %55 = bitcast i64* %p_key12 to i8*, !dbg !469
  %56 = load i32* %sdmprofile__threadnumber_st, !dbg !469
  call void @sdmprofile__SearchRoutine_HPonly(i8* %55, i8 2, i32 %56), !dbg !469
  %57 = load i64* %p_key12, align 8, !dbg !469
  %58 = load %struct.ptree.3** %t, align 8, !dbg !469
  %p_key13 = getelementptr inbounds %struct.ptree.3* %58, i32 0, i32 0, !dbg !469
  %59 = bitcast i64* %p_key13 to i8*, !dbg !469
  %60 = load i32* %sdmprofile__threadnumber_st, !dbg !469
  call void @sdmprofile__SearchRoutine_HPonly(i8* %59, i8 2, i32 %60), !dbg !469
  %61 = load i64* %p_key13, align 8, !dbg !469
  %cmp14 = icmp eq i64 %57, %61, !dbg !469
  br i1 %cmp14, label %if.then16, label %if.end70, !dbg !469

if.then16:                                        ; preds = %do.end
  %62 = atomicrmw add i64* @sdmprofile__BBcounter_53, i64 1 seq_cst, !dbg !471
  store i32 0, i32* %i, align 4, !dbg !471
  br label %for.cond, !dbg !471

for.cond:                                         ; preds = %for.inc, %if.then16
  %63 = atomicrmw add i64* @sdmprofile__BBcounter_54, i64 1 seq_cst, !dbg !474
  %64 = load i32* %i, align 4, !dbg !474
  %65 = load %struct.ptree.3** %t, align 8, !dbg !474
  %p_mlen = getelementptr inbounds %struct.ptree.3* %65, i32 0, i32 2, !dbg !474
  %66 = load i32* %sdmprofile__threadnumber_st, !dbg !474
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_mlen, i8 2, i32 %66), !dbg !474
  %67 = load i8* %p_mlen, align 1, !dbg !474
  %conv17 = zext i8 %67 to i32, !dbg !474
  %cmp18 = icmp slt i32 %64, %conv17, !dbg !474
  br i1 %cmp18, label %for.body, label %for.end, !dbg !474

for.body:                                         ; preds = %for.cond
  %68 = atomicrmw add i64* @sdmprofile__BBcounter_55, i64 1 seq_cst, !dbg !477
  %69 = load %struct.ptree.3** %n.addr, align 8, !dbg !477
  %p_m20 = getelementptr inbounds %struct.ptree.3* %69, i32 0, i32 1, !dbg !477
  %70 = bitcast %struct.ptree_mask.2** %p_m20 to i8*, !dbg !477
  %71 = load i32* %sdmprofile__threadnumber_st, !dbg !477
  call void @sdmprofile__SearchRoutine_HPonly(i8* %70, i8 2, i32 %71), !dbg !477
  %72 = load %struct.ptree_mask.2** %p_m20, align 8, !dbg !477
  %pm_mask21 = getelementptr inbounds %struct.ptree_mask.2* %72, i32 0, i32 0, !dbg !477
  %73 = bitcast i64* %pm_mask21 to i8*, !dbg !477
  %74 = load i32* %sdmprofile__threadnumber_st, !dbg !477
  call void @sdmprofile__SearchRoutine_HPonly(i8* %73, i8 2, i32 %74), !dbg !477
  %75 = load i64* %pm_mask21, align 8, !dbg !477
  %76 = load i32* %i, align 4, !dbg !477
  %idxprom = sext i32 %76 to i64, !dbg !477
  %77 = load %struct.ptree.3** %t, align 8, !dbg !477
  %p_m22 = getelementptr inbounds %struct.ptree.3* %77, i32 0, i32 1, !dbg !477
  %78 = bitcast %struct.ptree_mask.2** %p_m22 to i8*, !dbg !477
  %79 = load i32* %sdmprofile__threadnumber_st, !dbg !477
  call void @sdmprofile__SearchRoutine_HPonly(i8* %78, i8 2, i32 %79), !dbg !477
  %80 = load %struct.ptree_mask.2** %p_m22, align 8, !dbg !477
  %arrayidx = getelementptr inbounds %struct.ptree_mask.2* %80, i64 %idxprom, !dbg !477
  %pm_mask23 = getelementptr inbounds %struct.ptree_mask.2* %arrayidx, i32 0, i32 0, !dbg !477
  %81 = bitcast i64* %pm_mask23 to i8*, !dbg !477
  %82 = load i32* %sdmprofile__threadnumber_st, !dbg !477
  call void @sdmprofile__SearchRoutine_HPonly(i8* %81, i8 2, i32 %82), !dbg !477
  %83 = load i64* %pm_mask23, align 8, !dbg !477
  %cmp24 = icmp eq i64 %75, %83, !dbg !477
  br i1 %cmp24, label %if.then26, label %if.end33, !dbg !477

if.then26:                                        ; preds = %for.body
  %84 = atomicrmw add i64* @sdmprofile__BBcounter_56, i64 1 seq_cst, !dbg !480
  %85 = load %struct.ptree.3** %n.addr, align 8, !dbg !480
  %p_m27 = getelementptr inbounds %struct.ptree.3* %85, i32 0, i32 1, !dbg !480
  %86 = bitcast %struct.ptree_mask.2** %p_m27 to i8*, !dbg !480
  %87 = load i32* %sdmprofile__threadnumber_st, !dbg !480
  call void @sdmprofile__SearchRoutine_HPonly(i8* %86, i8 2, i32 %87), !dbg !480
  %88 = load %struct.ptree_mask.2** %p_m27, align 8, !dbg !480
  %pm_data = getelementptr inbounds %struct.ptree_mask.2* %88, i32 0, i32 1, !dbg !480
  %89 = bitcast i8** %pm_data to i8*, !dbg !480
  %90 = load i32* %sdmprofile__threadnumber_st, !dbg !480
  call void @sdmprofile__SearchRoutine_HPonly(i8* %89, i8 2, i32 %90), !dbg !480
  %91 = load i8** %pm_data, align 8, !dbg !480
  %92 = load i32* %i, align 4, !dbg !480
  %idxprom28 = sext i32 %92 to i64, !dbg !480
  %93 = load %struct.ptree.3** %t, align 8, !dbg !480
  %p_m29 = getelementptr inbounds %struct.ptree.3* %93, i32 0, i32 1, !dbg !480
  %94 = bitcast %struct.ptree_mask.2** %p_m29 to i8*, !dbg !480
  %95 = load i32* %sdmprofile__threadnumber_st, !dbg !480
  call void @sdmprofile__SearchRoutine_HPonly(i8* %94, i8 2, i32 %95), !dbg !480
  %96 = load %struct.ptree_mask.2** %p_m29, align 8, !dbg !480
  %arrayidx30 = getelementptr inbounds %struct.ptree_mask.2* %96, i64 %idxprom28, !dbg !480
  %pm_data31 = getelementptr inbounds %struct.ptree_mask.2* %arrayidx30, i32 0, i32 1, !dbg !480
  %97 = bitcast i8** %pm_data31 to i8*, !dbg !480
  %98 = load i32* %sdmprofile__threadnumber_st, !dbg !480
  call void @sdmprofile__SearchRoutine_HPonly(i8* %97, i8 1, i32 %98), !dbg !480
  store i8* %91, i8** %pm_data31, align 8, !dbg !480
  %99 = load %struct.ptree.3** %n.addr, align 8, !dbg !482
  %p_m32 = getelementptr inbounds %struct.ptree.3* %99, i32 0, i32 1, !dbg !482
  %100 = bitcast %struct.ptree_mask.2** %p_m32 to i8*, !dbg !482
  %101 = load i32* %sdmprofile__threadnumber_st, !dbg !482
  call void @sdmprofile__SearchRoutine_HPonly(i8* %100, i8 2, i32 %101), !dbg !482
  %102 = load %struct.ptree_mask.2** %p_m32, align 8, !dbg !482
  %103 = bitcast %struct.ptree_mask.2* %102 to i8*, !dbg !482
  %104 = load i32* %sdmprofile__threadnumber_st, !dbg !482
  call void @sdmprofile__free(i8* %103, i32 %104), !dbg !482
  %105 = load %struct.ptree.3** %n.addr, align 8, !dbg !483
  %106 = bitcast %struct.ptree.3* %105 to i8*, !dbg !483
  %107 = load i32* %sdmprofile__threadnumber_st, !dbg !483
  call void @sdmprofile__free(i8* %106, i32 %107), !dbg !483
  store %struct.ptree.3* null, %struct.ptree.3** %n.addr, align 8, !dbg !484
  %108 = load %struct.ptree.3** %t, align 8, !dbg !485
  store %struct.ptree.3* %108, %struct.ptree.3** %retval, !dbg !485
  br label %return, !dbg !485

if.end33:                                         ; preds = %for.body
  %109 = atomicrmw add i64* @sdmprofile__BBcounter_57, i64 1 seq_cst, !dbg !486
  br label %for.inc, !dbg !486

for.inc:                                          ; preds = %if.end33
  %110 = atomicrmw add i64* @sdmprofile__BBcounter_58, i64 1 seq_cst, !dbg !487
  %111 = load i32* %i, align 4, !dbg !487
  %inc = add nsw i32 %111, 1, !dbg !487
  store i32 %inc, i32* %i, align 4, !dbg !487
  br label %for.cond, !dbg !487

for.end:                                          ; preds = %for.cond
  %112 = atomicrmw add i64* @sdmprofile__BBcounter_59, i64 1 seq_cst, !dbg !488
  %113 = load %struct.ptree.3** %t, align 8, !dbg !488
  %p_mlen34 = getelementptr inbounds %struct.ptree.3* %113, i32 0, i32 2, !dbg !488
  %114 = load i32* %sdmprofile__threadnumber_st, !dbg !488
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_mlen34, i8 2, i32 %114), !dbg !488
  %115 = load i8* %p_mlen34, align 1, !dbg !488
  %conv35 = zext i8 %115 to i32, !dbg !488
  %add = add nsw i32 %conv35, 1, !dbg !488
  %conv36 = sext i32 %add to i64, !dbg !488
  %mul = mul i64 16, %conv36, !dbg !488
  %call37 = call noalias i8* @malloc(i64 %mul) #2, !dbg !488
  %116 = load i32* %sdmprofile__threadnumber_st, !dbg !488
  %117 = call i8* @sdmprofile__malloc(i64 %mul, i32 7, i32 %116), !dbg !488
  %118 = bitcast i8* %117 to %struct.ptree_mask.2*, !dbg !488
  store %struct.ptree_mask.2* %118, %struct.ptree_mask.2** %buf, align 8, !dbg !488
  store i32 0, i32* %copied, align 4, !dbg !489
  store i32 0, i32* %i, align 4, !dbg !490
  %119 = load %struct.ptree_mask.2** %buf, align 8, !dbg !490
  store %struct.ptree_mask.2* %119, %struct.ptree_mask.2** %pm, align 8, !dbg !490
  br label %for.cond38, !dbg !490

for.cond38:                                       ; preds = %for.inc59, %for.end
  %120 = atomicrmw add i64* @sdmprofile__BBcounter_60, i64 1 seq_cst, !dbg !492
  %121 = load i32* %i, align 4, !dbg !492
  %122 = load %struct.ptree.3** %t, align 8, !dbg !492
  %p_mlen39 = getelementptr inbounds %struct.ptree.3* %122, i32 0, i32 2, !dbg !492
  %123 = load i32* %sdmprofile__threadnumber_st, !dbg !492
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_mlen39, i8 2, i32 %123), !dbg !492
  %124 = load i8* %p_mlen39, align 1, !dbg !492
  %conv40 = zext i8 %124 to i32, !dbg !492
  %cmp41 = icmp slt i32 %121, %conv40, !dbg !492
  br i1 %cmp41, label %for.body43, label %for.end60, !dbg !492

for.body43:                                       ; preds = %for.cond38
  %125 = atomicrmw add i64* @sdmprofile__BBcounter_61, i64 1 seq_cst, !dbg !495
  %126 = load %struct.ptree.3** %n.addr, align 8, !dbg !495
  %p_m44 = getelementptr inbounds %struct.ptree.3* %126, i32 0, i32 1, !dbg !495
  %127 = bitcast %struct.ptree_mask.2** %p_m44 to i8*, !dbg !495
  %128 = load i32* %sdmprofile__threadnumber_st, !dbg !495
  call void @sdmprofile__SearchRoutine_HPonly(i8* %127, i8 2, i32 %128), !dbg !495
  %129 = load %struct.ptree_mask.2** %p_m44, align 8, !dbg !495
  %pm_mask45 = getelementptr inbounds %struct.ptree_mask.2* %129, i32 0, i32 0, !dbg !495
  %130 = bitcast i64* %pm_mask45 to i8*, !dbg !495
  %131 = load i32* %sdmprofile__threadnumber_st, !dbg !495
  call void @sdmprofile__SearchRoutine_HPonly(i8* %130, i8 2, i32 %131), !dbg !495
  %132 = load i64* %pm_mask45, align 8, !dbg !495
  %133 = load i32* %i, align 4, !dbg !495
  %idxprom46 = sext i32 %133 to i64, !dbg !495
  %134 = load %struct.ptree.3** %t, align 8, !dbg !495
  %p_m47 = getelementptr inbounds %struct.ptree.3* %134, i32 0, i32 1, !dbg !495
  %135 = bitcast %struct.ptree_mask.2** %p_m47 to i8*, !dbg !495
  %136 = load i32* %sdmprofile__threadnumber_st, !dbg !495
  call void @sdmprofile__SearchRoutine_HPonly(i8* %135, i8 2, i32 %136), !dbg !495
  %137 = load %struct.ptree_mask.2** %p_m47, align 8, !dbg !495
  %arrayidx48 = getelementptr inbounds %struct.ptree_mask.2* %137, i64 %idxprom46, !dbg !495
  %pm_mask49 = getelementptr inbounds %struct.ptree_mask.2* %arrayidx48, i32 0, i32 0, !dbg !495
  %138 = bitcast i64* %pm_mask49 to i8*, !dbg !495
  %139 = load i32* %sdmprofile__threadnumber_st, !dbg !495
  call void @sdmprofile__SearchRoutine_HPonly(i8* %138, i8 2, i32 %139), !dbg !495
  %140 = load i64* %pm_mask49, align 8, !dbg !495
  %cmp50 = icmp ugt i64 %132, %140, !dbg !495
  br i1 %cmp50, label %if.then52, label %if.else, !dbg !495

if.then52:                                        ; preds = %for.body43
  %141 = atomicrmw add i64* @sdmprofile__BBcounter_62, i64 1 seq_cst, !dbg !498
  %142 = load %struct.ptree.3** %t, align 8, !dbg !498
  %p_m53 = getelementptr inbounds %struct.ptree.3* %142, i32 0, i32 1, !dbg !498
  %143 = bitcast %struct.ptree_mask.2** %p_m53 to i8*, !dbg !498
  %144 = load i32* %sdmprofile__threadnumber_st, !dbg !498
  call void @sdmprofile__SearchRoutine_HPonly(i8* %143, i8 2, i32 %144), !dbg !498
  %145 = load %struct.ptree_mask.2** %p_m53, align 8, !dbg !498
  %146 = load i32* %i, align 4, !dbg !498
  %idx.ext = sext i32 %146 to i64, !dbg !498
  %add.ptr = getelementptr inbounds %struct.ptree_mask.2* %145, i64 %idx.ext, !dbg !498
  %147 = bitcast %struct.ptree_mask.2* %add.ptr to i8*, !dbg !498
  %148 = load %struct.ptree_mask.2** %pm, align 8, !dbg !498
  %149 = bitcast %struct.ptree_mask.2* %148 to i8*, !dbg !498
  call void @bcopy(i8* %147, i8* %149, i64 16) #2, !dbg !498
  %150 = load i32* %i, align 4, !dbg !500
  %inc54 = add nsw i32 %150, 1, !dbg !500
  store i32 %inc54, i32* %i, align 4, !dbg !500
  br label %if.end58, !dbg !501

if.else:                                          ; preds = %for.body43
  %151 = atomicrmw add i64* @sdmprofile__BBcounter_63, i64 1 seq_cst, !dbg !502
  %152 = load %struct.ptree.3** %n.addr, align 8, !dbg !502
  %p_m55 = getelementptr inbounds %struct.ptree.3* %152, i32 0, i32 1, !dbg !502
  %153 = bitcast %struct.ptree_mask.2** %p_m55 to i8*, !dbg !502
  %154 = load i32* %sdmprofile__threadnumber_st, !dbg !502
  call void @sdmprofile__SearchRoutine_HPonly(i8* %153, i8 2, i32 %154), !dbg !502
  %155 = load %struct.ptree_mask.2** %p_m55, align 8, !dbg !502
  %156 = bitcast %struct.ptree_mask.2* %155 to i8*, !dbg !502
  %157 = load %struct.ptree_mask.2** %pm, align 8, !dbg !502
  %158 = bitcast %struct.ptree_mask.2* %157 to i8*, !dbg !502
  call void @bcopy(i8* %156, i8* %158, i64 16) #2, !dbg !502
  %159 = load %struct.ptree.3** %n.addr, align 8, !dbg !504
  %p_m56 = getelementptr inbounds %struct.ptree.3* %159, i32 0, i32 1, !dbg !504
  %160 = bitcast %struct.ptree_mask.2** %p_m56 to i8*, !dbg !504
  %161 = load i32* %sdmprofile__threadnumber_st, !dbg !504
  call void @sdmprofile__SearchRoutine_HPonly(i8* %160, i8 2, i32 %161), !dbg !504
  %162 = load %struct.ptree_mask.2** %p_m56, align 8, !dbg !504
  %pm_mask57 = getelementptr inbounds %struct.ptree_mask.2* %162, i32 0, i32 0, !dbg !504
  %163 = bitcast i64* %pm_mask57 to i8*, !dbg !504
  %164 = load i32* %sdmprofile__threadnumber_st, !dbg !504
  call void @sdmprofile__SearchRoutine_HPonly(i8* %163, i8 1, i32 %164), !dbg !504
  store i64 4294967295, i64* %pm_mask57, align 8, !dbg !504
  store i32 1, i32* %copied, align 4, !dbg !505
  br label %if.end58

if.end58:                                         ; preds = %if.else, %if.then52
  %165 = atomicrmw add i64* @sdmprofile__BBcounter_64, i64 1 seq_cst, !dbg !506
  br label %for.inc59, !dbg !506

for.inc59:                                        ; preds = %if.end58
  %166 = atomicrmw add i64* @sdmprofile__BBcounter_65, i64 1 seq_cst, !dbg !507
  %167 = load %struct.ptree_mask.2** %pm, align 8, !dbg !507
  %incdec.ptr = getelementptr inbounds %struct.ptree_mask.2* %167, i32 1, !dbg !507
  store %struct.ptree_mask.2* %incdec.ptr, %struct.ptree_mask.2** %pm, align 8, !dbg !507
  br label %for.cond38, !dbg !507

for.end60:                                        ; preds = %for.cond38
  %168 = atomicrmw add i64* @sdmprofile__BBcounter_66, i64 1 seq_cst, !dbg !508
  %169 = load i32* %copied, align 4, !dbg !508
  %tobool61 = icmp ne i32 %169, 0, !dbg !508
  br i1 %tobool61, label %if.end64, label %if.then62, !dbg !508

if.then62:                                        ; preds = %for.end60
  %170 = atomicrmw add i64* @sdmprofile__BBcounter_67, i64 1 seq_cst, !dbg !510
  %171 = load %struct.ptree.3** %n.addr, align 8, !dbg !510
  %p_m63 = getelementptr inbounds %struct.ptree.3* %171, i32 0, i32 1, !dbg !510
  %172 = bitcast %struct.ptree_mask.2** %p_m63 to i8*, !dbg !510
  %173 = load i32* %sdmprofile__threadnumber_st, !dbg !510
  call void @sdmprofile__SearchRoutine_HPonly(i8* %172, i8 2, i32 %173), !dbg !510
  %174 = load %struct.ptree_mask.2** %p_m63, align 8, !dbg !510
  %175 = bitcast %struct.ptree_mask.2* %174 to i8*, !dbg !510
  %176 = load %struct.ptree_mask.2** %pm, align 8, !dbg !510
  %177 = bitcast %struct.ptree_mask.2* %176 to i8*, !dbg !510
  call void @bcopy(i8* %175, i8* %177, i64 16) #2, !dbg !510
  br label %if.end64, !dbg !512

if.end64:                                         ; preds = %if.then62, %for.end60
  %178 = atomicrmw add i64* @sdmprofile__BBcounter_68, i64 1 seq_cst, !dbg !513
  %179 = load %struct.ptree.3** %n.addr, align 8, !dbg !513
  %p_m65 = getelementptr inbounds %struct.ptree.3* %179, i32 0, i32 1, !dbg !513
  %180 = bitcast %struct.ptree_mask.2** %p_m65 to i8*, !dbg !513
  %181 = load i32* %sdmprofile__threadnumber_st, !dbg !513
  call void @sdmprofile__SearchRoutine_HPonly(i8* %180, i8 2, i32 %181), !dbg !513
  %182 = load %struct.ptree_mask.2** %p_m65, align 8, !dbg !513
  %183 = bitcast %struct.ptree_mask.2* %182 to i8*, !dbg !513
  %184 = load i32* %sdmprofile__threadnumber_st, !dbg !513
  call void @sdmprofile__free(i8* %183, i32 %184), !dbg !513
  %185 = load %struct.ptree.3** %n.addr, align 8, !dbg !514
  %186 = bitcast %struct.ptree.3* %185 to i8*, !dbg !514
  %187 = load i32* %sdmprofile__threadnumber_st, !dbg !514
  call void @sdmprofile__free(i8* %186, i32 %187), !dbg !514
  store %struct.ptree.3* null, %struct.ptree.3** %n.addr, align 8, !dbg !515
  %188 = load %struct.ptree.3** %t, align 8, !dbg !516
  %p_mlen66 = getelementptr inbounds %struct.ptree.3* %188, i32 0, i32 2, !dbg !516
  %189 = load i32* %sdmprofile__threadnumber_st, !dbg !516
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_mlen66, i8 2, i32 %189), !dbg !516
  %190 = load i8* %p_mlen66, align 1, !dbg !516
  %inc67 = add i8 %190, 1, !dbg !516
  %191 = load i32* %sdmprofile__threadnumber_st, !dbg !516
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_mlen66, i8 1, i32 %191), !dbg !516
  store i8 %inc67, i8* %p_mlen66, align 1, !dbg !516
  %192 = load %struct.ptree.3** %t, align 8, !dbg !517
  %p_m68 = getelementptr inbounds %struct.ptree.3* %192, i32 0, i32 1, !dbg !517
  %193 = bitcast %struct.ptree_mask.2** %p_m68 to i8*, !dbg !517
  %194 = load i32* %sdmprofile__threadnumber_st, !dbg !517
  call void @sdmprofile__SearchRoutine_HPonly(i8* %193, i8 2, i32 %194), !dbg !517
  %195 = load %struct.ptree_mask.2** %p_m68, align 8, !dbg !517
  %196 = bitcast %struct.ptree_mask.2* %195 to i8*, !dbg !517
  %197 = load i32* %sdmprofile__threadnumber_st, !dbg !517
  call void @sdmprofile__free(i8* %196, i32 %197), !dbg !517
  %198 = load %struct.ptree_mask.2** %buf, align 8, !dbg !518
  %199 = load %struct.ptree.3** %t, align 8, !dbg !518
  %p_m69 = getelementptr inbounds %struct.ptree.3* %199, i32 0, i32 1, !dbg !518
  %200 = bitcast %struct.ptree_mask.2** %p_m69 to i8*, !dbg !518
  %201 = load i32* %sdmprofile__threadnumber_st, !dbg !518
  call void @sdmprofile__SearchRoutine_HPonly(i8* %200, i8 1, i32 %201), !dbg !518
  store %struct.ptree_mask.2* %198, %struct.ptree_mask.2** %p_m69, align 8, !dbg !518
  %202 = load %struct.ptree.3** %t, align 8, !dbg !519
  store %struct.ptree.3* %202, %struct.ptree.3** %retval, !dbg !519
  br label %return, !dbg !519

if.end70:                                         ; preds = %do.end
  %203 = atomicrmw add i64* @sdmprofile__BBcounter_69, i64 1 seq_cst, !dbg !520
  store i32 1, i32* %i, align 4, !dbg !520
  br label %for.cond71, !dbg !520

for.cond71:                                       ; preds = %for.inc81, %if.end70
  %204 = atomicrmw add i64* @sdmprofile__BBcounter_70, i64 1 seq_cst, !dbg !522
  %205 = load i32* %i, align 4, !dbg !522
  %cmp72 = icmp slt i32 %205, 32, !dbg !522
  br i1 %cmp72, label %land.rhs, label %land.end, !dbg !522

land.rhs:                                         ; preds = %for.cond71
  %206 = atomicrmw add i64* @sdmprofile__BBcounter_71, i64 1 seq_cst, !dbg !525
  %207 = load i32* %i, align 4, !dbg !525
  %208 = load %struct.ptree.3** %n.addr, align 8, !dbg !525
  %p_key74 = getelementptr inbounds %struct.ptree.3* %208, i32 0, i32 0, !dbg !525
  %209 = bitcast i64* %p_key74 to i8*, !dbg !525
  %210 = load i32* %sdmprofile__threadnumber_st, !dbg !525
  call void @sdmprofile__SearchRoutine_HPonly(i8* %209, i8 2, i32 %210), !dbg !525
  %211 = load i64* %p_key74, align 8, !dbg !525
  %sdmprofile__LD10 = load i32* %sdmprofile__threadnumber_st, align 8
  %212 = call i64 @bit(i32 %207, i64 %211, i32 %sdmprofile__LD10), !dbg !525
  %213 = load i32* %i, align 4, !dbg !527
  %214 = load %struct.ptree.3** %t, align 8, !dbg !527
  %p_key76 = getelementptr inbounds %struct.ptree.3* %214, i32 0, i32 0, !dbg !527
  %215 = bitcast i64* %p_key76 to i8*, !dbg !527
  %216 = load i32* %sdmprofile__threadnumber_st, !dbg !527
  call void @sdmprofile__SearchRoutine_HPonly(i8* %215, i8 2, i32 %216), !dbg !527
  %217 = load i64* %p_key76, align 8, !dbg !527
  %sdmprofile__LD9 = load i32* %sdmprofile__threadnumber_st, align 8
  %218 = call i64 @bit(i32 %213, i64 %217, i32 %sdmprofile__LD9), !dbg !527
  %cmp78 = icmp eq i64 %212, %218, !dbg !527
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond71
  %219 = phi i1 [ false, %for.cond71 ], [ %cmp78, %land.rhs ]
  %220 = atomicrmw add i64* @sdmprofile__BBcounter_72, i64 1 seq_cst, !dbg !528
  br i1 %219, label %for.body80, label %for.end83, !dbg !528

for.body80:                                       ; preds = %land.end
  %221 = atomicrmw add i64* @sdmprofile__BBcounter_73, i64 1 seq_cst, !dbg !530
  br label %for.inc81, !dbg !530

for.inc81:                                        ; preds = %for.body80
  %222 = atomicrmw add i64* @sdmprofile__BBcounter_74, i64 1 seq_cst, !dbg !532
  %223 = load i32* %i, align 4, !dbg !532
  %inc82 = add nsw i32 %223, 1, !dbg !532
  store i32 %inc82, i32* %i, align 4, !dbg !532
  br label %for.cond71, !dbg !532

for.end83:                                        ; preds = %land.end
  %224 = atomicrmw add i64* @sdmprofile__BBcounter_75, i64 1 seq_cst, !dbg !534
  %225 = load %struct.ptree.3** %head.addr, align 8, !dbg !534
  %p_b84 = getelementptr inbounds %struct.ptree.3* %225, i32 0, i32 3, !dbg !534
  %226 = load i32* %sdmprofile__threadnumber_st, !dbg !534
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b84, i8 2, i32 %226), !dbg !534
  %227 = load i8* %p_b84, align 1, !dbg !534
  %conv85 = sext i8 %227 to i32, !dbg !534
  %228 = load %struct.ptree.3** %n.addr, align 8, !dbg !534
  %p_key86 = getelementptr inbounds %struct.ptree.3* %228, i32 0, i32 0, !dbg !534
  %229 = bitcast i64* %p_key86 to i8*, !dbg !534
  %230 = load i32* %sdmprofile__threadnumber_st, !dbg !534
  call void @sdmprofile__SearchRoutine_HPonly(i8* %229, i8 2, i32 %230), !dbg !534
  %231 = load i64* %p_key86, align 8, !dbg !534
  %sdmprofile__LD8 = load i32* %sdmprofile__threadnumber_st, align 8
  %232 = call i64 @bit(i32 %conv85, i64 %231, i32 %sdmprofile__LD8), !dbg !534
  %tobool88 = icmp ne i64 %232, 0, !dbg !534
  br i1 %tobool88, label %if.then89, label %if.else93, !dbg !534

if.then89:                                        ; preds = %for.end83
  %233 = atomicrmw add i64* @sdmprofile__BBcounter_76, i64 1 seq_cst, !dbg !536
  %234 = load %struct.ptree.3** %head.addr, align 8, !dbg !536
  %p_right90 = getelementptr inbounds %struct.ptree.3* %234, i32 0, i32 5, !dbg !536
  %235 = bitcast %struct.ptree.3** %p_right90 to i8*, !dbg !536
  %236 = load i32* %sdmprofile__threadnumber_st, !dbg !536
  call void @sdmprofile__SearchRoutine_HPonly(i8* %235, i8 2, i32 %236), !dbg !536
  %237 = load %struct.ptree.3** %p_right90, align 8, !dbg !536
  %238 = load %struct.ptree.3** %n.addr, align 8, !dbg !536
  %239 = load i32* %i, align 4, !dbg !536
  %240 = load %struct.ptree.3** %head.addr, align 8, !dbg !536
  %sdmprofile__LD16 = load i32* %sdmprofile__threadnumber_st, align 8
  %241 = call %struct.ptree.3* @insertR(%struct.ptree.3* %237, %struct.ptree.3* %238, i32 %239, %struct.ptree.3* %240, i32 %sdmprofile__LD16), !dbg !536
  %242 = load %struct.ptree.3** %head.addr, align 8, !dbg !536
  %p_right92 = getelementptr inbounds %struct.ptree.3* %242, i32 0, i32 5, !dbg !536
  %243 = bitcast %struct.ptree.3** %p_right92 to i8*, !dbg !536
  %244 = load i32* %sdmprofile__threadnumber_st, !dbg !536
  call void @sdmprofile__SearchRoutine_HPonly(i8* %243, i8 1, i32 %244), !dbg !536
  store %struct.ptree.3* %241, %struct.ptree.3** %p_right92, align 8, !dbg !536
  br label %if.end97, !dbg !536

if.else93:                                        ; preds = %for.end83
  %245 = atomicrmw add i64* @sdmprofile__BBcounter_77, i64 1 seq_cst, !dbg !537
  %246 = load %struct.ptree.3** %head.addr, align 8, !dbg !537
  %p_left94 = getelementptr inbounds %struct.ptree.3* %246, i32 0, i32 4, !dbg !537
  %247 = bitcast %struct.ptree.3** %p_left94 to i8*, !dbg !537
  %248 = load i32* %sdmprofile__threadnumber_st, !dbg !537
  call void @sdmprofile__SearchRoutine_HPonly(i8* %247, i8 2, i32 %248), !dbg !537
  %249 = load %struct.ptree.3** %p_left94, align 8, !dbg !537
  %250 = load %struct.ptree.3** %n.addr, align 8, !dbg !537
  %251 = load i32* %i, align 4, !dbg !537
  %252 = load %struct.ptree.3** %head.addr, align 8, !dbg !537
  %sdmprofile__LD15 = load i32* %sdmprofile__threadnumber_st, align 8
  %253 = call %struct.ptree.3* @insertR(%struct.ptree.3* %249, %struct.ptree.3* %250, i32 %251, %struct.ptree.3* %252, i32 %sdmprofile__LD15), !dbg !537
  %254 = load %struct.ptree.3** %head.addr, align 8, !dbg !537
  %p_left96 = getelementptr inbounds %struct.ptree.3* %254, i32 0, i32 4, !dbg !537
  %255 = bitcast %struct.ptree.3** %p_left96 to i8*, !dbg !537
  %256 = load i32* %sdmprofile__threadnumber_st, !dbg !537
  call void @sdmprofile__SearchRoutine_HPonly(i8* %255, i8 1, i32 %256), !dbg !537
  store %struct.ptree.3* %253, %struct.ptree.3** %p_left96, align 8, !dbg !537
  br label %if.end97

if.end97:                                         ; preds = %if.else93, %if.then89
  %257 = atomicrmw add i64* @sdmprofile__BBcounter_78, i64 1 seq_cst, !dbg !538
  %258 = load %struct.ptree.3** %n.addr, align 8, !dbg !538
  store %struct.ptree.3* %258, %struct.ptree.3** %retval, !dbg !538
  br label %return, !dbg !538

return:                                           ; preds = %if.end97, %if.end64, %if.then26, %if.then
  %259 = atomicrmw add i64* @sdmprofile__BBcounter_79, i64 1 seq_cst, !dbg !539
  %260 = load %struct.ptree.3** %retval, !dbg !539
  ret %struct.ptree.3* %260, !dbg !539
}

; Function Attrs: nounwind uwtable
define i32 @pat_remove(%struct.ptree.3* %n, %struct.ptree.3* %head, i32 %sdmprofile__threadnumber) #11 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca %struct.ptree.3*, align 8
  %head.addr = alloca %struct.ptree.3*, align 8
  %p = alloca %struct.ptree.3*, align 8
  %g = alloca %struct.ptree.3*, align 8
  %pt = alloca %struct.ptree.3*, align 8
  %pp = alloca %struct.ptree.3*, align 8
  %t = alloca %struct.ptree.3*, align 8
  %buf = alloca %struct.ptree_mask.2*, align 8
  %pm = alloca %struct.ptree_mask.2*, align 8
  %i = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store %struct.ptree.3* %n, %struct.ptree.3** %n.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_80, i64 1 seq_cst, !dbg !540
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %n.addr}, metadata !558), !dbg !540
  store %struct.ptree.3* %head, %struct.ptree.3** %head.addr, align 8
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %head.addr}, metadata !559), !dbg !560
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %p}, metadata !561), !dbg !562
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %g}, metadata !563), !dbg !564
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %pt}, metadata !565), !dbg !566
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %pp}, metadata !567), !dbg !568
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %t}, metadata !569), !dbg !570
  call void @llvm.dbg.declare(metadata !{%struct.ptree_mask.2** %buf}, metadata !571), !dbg !572
  call void @llvm.dbg.declare(metadata !{%struct.ptree_mask.2** %pm}, metadata !573), !dbg !574
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !575), !dbg !576
  %1 = load %struct.ptree.3** %n.addr, align 8, !dbg !577
  %tobool = icmp ne %struct.ptree.3* %1, null, !dbg !577
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !577

lor.lhs.false:                                    ; preds = %entry
  %2 = atomicrmw add i64* @sdmprofile__BBcounter_81, i64 1 seq_cst, !dbg !579
  %3 = load %struct.ptree.3** %n.addr, align 8, !dbg !579
  %p_m = getelementptr inbounds %struct.ptree.3* %3, i32 0, i32 1, !dbg !579
  %4 = bitcast %struct.ptree_mask.2** %p_m to i8*, !dbg !579
  %5 = load i32* %sdmprofile__threadnumber_st, !dbg !579
  call void @sdmprofile__SearchRoutine_HPonly(i8* %4, i8 2, i32 %5), !dbg !579
  %6 = load %struct.ptree_mask.2** %p_m, align 8, !dbg !579
  %tobool1 = icmp ne %struct.ptree_mask.2* %6, null, !dbg !579
  br i1 %tobool1, label %lor.lhs.false2, label %if.then, !dbg !579

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %7 = atomicrmw add i64* @sdmprofile__BBcounter_82, i64 1 seq_cst, !dbg !581
  %8 = load %struct.ptree.3** %t, align 8, !dbg !581
  %tobool3 = icmp ne %struct.ptree.3* %8, null, !dbg !581
  br i1 %tobool3, label %if.end, label %if.then, !dbg !581

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  %9 = atomicrmw add i64* @sdmprofile__BBcounter_83, i64 1 seq_cst, !dbg !583
  store i32 0, i32* %retval, !dbg !583
  br label %return, !dbg !583

if.end:                                           ; preds = %lor.lhs.false2
  %10 = atomicrmw add i64* @sdmprofile__BBcounter_84, i64 1 seq_cst, !dbg !584
  %11 = load %struct.ptree.3** %head.addr, align 8, !dbg !584
  store %struct.ptree.3* %11, %struct.ptree.3** %t, align 8, !dbg !584
  store %struct.ptree.3* %11, %struct.ptree.3** %p, align 8, !dbg !584
  store %struct.ptree.3* %11, %struct.ptree.3** %g, align 8, !dbg !584
  br label %do.body, !dbg !585

do.body:                                          ; preds = %do.cond, %if.end
  %12 = atomicrmw add i64* @sdmprofile__BBcounter_85, i64 1 seq_cst, !dbg !586
  %13 = load %struct.ptree.3** %t, align 8, !dbg !586
  %p_b = getelementptr inbounds %struct.ptree.3* %13, i32 0, i32 3, !dbg !586
  %14 = load i32* %sdmprofile__threadnumber_st, !dbg !586
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b, i8 2, i32 %14), !dbg !586
  %15 = load i8* %p_b, align 1, !dbg !586
  %conv = sext i8 %15 to i32, !dbg !586
  store i32 %conv, i32* %i, align 4, !dbg !586
  %16 = load %struct.ptree.3** %p, align 8, !dbg !588
  store %struct.ptree.3* %16, %struct.ptree.3** %g, align 8, !dbg !588
  %17 = load %struct.ptree.3** %t, align 8, !dbg !589
  store %struct.ptree.3* %17, %struct.ptree.3** %p, align 8, !dbg !589
  %18 = load %struct.ptree.3** %t, align 8, !dbg !590
  %p_b4 = getelementptr inbounds %struct.ptree.3* %18, i32 0, i32 3, !dbg !590
  %19 = load i32* %sdmprofile__threadnumber_st, !dbg !590
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b4, i8 2, i32 %19), !dbg !590
  %20 = load i8* %p_b4, align 1, !dbg !590
  %conv5 = sext i8 %20 to i32, !dbg !590
  %21 = load %struct.ptree.3** %n.addr, align 8, !dbg !590
  %p_key = getelementptr inbounds %struct.ptree.3* %21, i32 0, i32 0, !dbg !590
  %22 = bitcast i64* %p_key to i8*, !dbg !590
  %23 = load i32* %sdmprofile__threadnumber_st, !dbg !590
  call void @sdmprofile__SearchRoutine_HPonly(i8* %22, i8 2, i32 %23), !dbg !590
  %24 = load i64* %p_key, align 8, !dbg !590
  %sdmprofile__LD7 = load i32* %sdmprofile__threadnumber_st, align 8
  %25 = call i64 @bit(i32 %conv5, i64 %24, i32 %sdmprofile__LD7), !dbg !590
  %tobool6 = icmp ne i64 %25, 0, !dbg !590
  br i1 %tobool6, label %cond.true, label %cond.false, !dbg !590

cond.true:                                        ; preds = %do.body
  %26 = atomicrmw add i64* @sdmprofile__BBcounter_86, i64 1 seq_cst, !dbg !591
  %27 = load %struct.ptree.3** %t, align 8, !dbg !591
  %p_right = getelementptr inbounds %struct.ptree.3* %27, i32 0, i32 5, !dbg !591
  %28 = bitcast %struct.ptree.3** %p_right to i8*, !dbg !591
  %29 = load i32* %sdmprofile__threadnumber_st, !dbg !591
  call void @sdmprofile__SearchRoutine_HPonly(i8* %28, i8 2, i32 %29), !dbg !591
  %30 = load %struct.ptree.3** %p_right, align 8, !dbg !591
  br label %cond.end, !dbg !591

cond.false:                                       ; preds = %do.body
  %31 = atomicrmw add i64* @sdmprofile__BBcounter_87, i64 1 seq_cst, !dbg !593
  %32 = load %struct.ptree.3** %t, align 8, !dbg !593
  %p_left = getelementptr inbounds %struct.ptree.3* %32, i32 0, i32 4, !dbg !593
  %33 = bitcast %struct.ptree.3** %p_left to i8*, !dbg !593
  %34 = load i32* %sdmprofile__threadnumber_st, !dbg !593
  call void @sdmprofile__SearchRoutine_HPonly(i8* %33, i8 2, i32 %34), !dbg !593
  %35 = load %struct.ptree.3** %p_left, align 8, !dbg !593
  br label %cond.end, !dbg !593

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.ptree.3* [ %30, %cond.true ], [ %35, %cond.false ], !dbg !590
  %36 = atomicrmw add i64* @sdmprofile__BBcounter_88, i64 1 seq_cst, !dbg !595
  store %struct.ptree.3* %cond, %struct.ptree.3** %t, align 8, !dbg !595
  br label %do.cond, !dbg !598

do.cond:                                          ; preds = %cond.end
  %37 = atomicrmw add i64* @sdmprofile__BBcounter_89, i64 1 seq_cst, !dbg !599
  %38 = load i32* %i, align 4, !dbg !599
  %39 = load %struct.ptree.3** %t, align 8, !dbg !599
  %p_b7 = getelementptr inbounds %struct.ptree.3* %39, i32 0, i32 3, !dbg !599
  %40 = load i32* %sdmprofile__threadnumber_st, !dbg !599
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b7, i8 2, i32 %40), !dbg !599
  %41 = load i8* %p_b7, align 1, !dbg !599
  %conv8 = sext i8 %41 to i32, !dbg !599
  %cmp = icmp slt i32 %38, %conv8, !dbg !599
  br i1 %cmp, label %do.body, label %do.end, !dbg !599

do.end:                                           ; preds = %do.cond
  %42 = atomicrmw add i64* @sdmprofile__BBcounter_90, i64 1 seq_cst, !dbg !601
  %43 = load %struct.ptree.3** %t, align 8, !dbg !601
  %p_key10 = getelementptr inbounds %struct.ptree.3* %43, i32 0, i32 0, !dbg !601
  %44 = bitcast i64* %p_key10 to i8*, !dbg !601
  %45 = load i32* %sdmprofile__threadnumber_st, !dbg !601
  call void @sdmprofile__SearchRoutine_HPonly(i8* %44, i8 2, i32 %45), !dbg !601
  %46 = load i64* %p_key10, align 8, !dbg !601
  %47 = load %struct.ptree.3** %n.addr, align 8, !dbg !601
  %p_key11 = getelementptr inbounds %struct.ptree.3* %47, i32 0, i32 0, !dbg !601
  %48 = bitcast i64* %p_key11 to i8*, !dbg !601
  %49 = load i32* %sdmprofile__threadnumber_st, !dbg !601
  call void @sdmprofile__SearchRoutine_HPonly(i8* %48, i8 2, i32 %49), !dbg !601
  %50 = load i64* %p_key11, align 8, !dbg !601
  %cmp12 = icmp ne i64 %46, %50, !dbg !601
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !601

if.then14:                                        ; preds = %do.end
  %51 = atomicrmw add i64* @sdmprofile__BBcounter_91, i64 1 seq_cst, !dbg !603
  store i32 0, i32* %retval, !dbg !603
  br label %return, !dbg !603

if.end15:                                         ; preds = %do.end
  %52 = atomicrmw add i64* @sdmprofile__BBcounter_92, i64 1 seq_cst, !dbg !604
  %53 = load %struct.ptree.3** %t, align 8, !dbg !604
  %p_mlen = getelementptr inbounds %struct.ptree.3* %53, i32 0, i32 2, !dbg !604
  %54 = load i32* %sdmprofile__threadnumber_st, !dbg !604
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_mlen, i8 2, i32 %54), !dbg !604
  %55 = load i8* %p_mlen, align 1, !dbg !604
  %conv16 = zext i8 %55 to i32, !dbg !604
  %cmp17 = icmp eq i32 %conv16, 1, !dbg !604
  br i1 %cmp17, label %if.then19, label %if.end111, !dbg !604

if.then19:                                        ; preds = %if.end15
  %56 = atomicrmw add i64* @sdmprofile__BBcounter_93, i64 1 seq_cst, !dbg !606
  %57 = load %struct.ptree.3** %t, align 8, !dbg !606
  %p_b20 = getelementptr inbounds %struct.ptree.3* %57, i32 0, i32 3, !dbg !606
  %58 = load i32* %sdmprofile__threadnumber_st, !dbg !606
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b20, i8 2, i32 %58), !dbg !606
  %59 = load i8* %p_b20, align 1, !dbg !606
  %conv21 = sext i8 %59 to i32, !dbg !606
  %cmp22 = icmp eq i32 %conv21, 0, !dbg !606
  br i1 %cmp22, label %if.then24, label %if.end25, !dbg !606

if.then24:                                        ; preds = %if.then19
  %60 = atomicrmw add i64* @sdmprofile__BBcounter_94, i64 1 seq_cst, !dbg !609
  store i32 0, i32* %retval, !dbg !609
  br label %return, !dbg !609

if.end25:                                         ; preds = %if.then19
  %61 = atomicrmw add i64* @sdmprofile__BBcounter_95, i64 1 seq_cst, !dbg !610
  %62 = load %struct.ptree.3** %t, align 8, !dbg !610
  %p_m26 = getelementptr inbounds %struct.ptree.3* %62, i32 0, i32 1, !dbg !610
  %63 = bitcast %struct.ptree_mask.2** %p_m26 to i8*, !dbg !610
  %64 = load i32* %sdmprofile__threadnumber_st, !dbg !610
  call void @sdmprofile__SearchRoutine_HPonly(i8* %63, i8 2, i32 %64), !dbg !610
  %65 = load %struct.ptree_mask.2** %p_m26, align 8, !dbg !610
  %pm_mask = getelementptr inbounds %struct.ptree_mask.2* %65, i32 0, i32 0, !dbg !610
  %66 = bitcast i64* %pm_mask to i8*, !dbg !610
  %67 = load i32* %sdmprofile__threadnumber_st, !dbg !610
  call void @sdmprofile__SearchRoutine_HPonly(i8* %66, i8 2, i32 %67), !dbg !610
  %68 = load i64* %pm_mask, align 8, !dbg !610
  %69 = load %struct.ptree.3** %n.addr, align 8, !dbg !610
  %p_m27 = getelementptr inbounds %struct.ptree.3* %69, i32 0, i32 1, !dbg !610
  %70 = bitcast %struct.ptree_mask.2** %p_m27 to i8*, !dbg !610
  %71 = load i32* %sdmprofile__threadnumber_st, !dbg !610
  call void @sdmprofile__SearchRoutine_HPonly(i8* %70, i8 2, i32 %71), !dbg !610
  %72 = load %struct.ptree_mask.2** %p_m27, align 8, !dbg !610
  %pm_mask28 = getelementptr inbounds %struct.ptree_mask.2* %72, i32 0, i32 0, !dbg !610
  %73 = bitcast i64* %pm_mask28 to i8*, !dbg !610
  %74 = load i32* %sdmprofile__threadnumber_st, !dbg !610
  call void @sdmprofile__SearchRoutine_HPonly(i8* %73, i8 2, i32 %74), !dbg !610
  %75 = load i64* %pm_mask28, align 8, !dbg !610
  %cmp29 = icmp ne i64 %68, %75, !dbg !610
  br i1 %cmp29, label %if.then31, label %if.end32, !dbg !610

if.then31:                                        ; preds = %if.end25
  %76 = atomicrmw add i64* @sdmprofile__BBcounter_96, i64 1 seq_cst, !dbg !612
  store i32 0, i32* %retval, !dbg !612
  br label %return, !dbg !612

if.end32:                                         ; preds = %if.end25
  %77 = atomicrmw add i64* @sdmprofile__BBcounter_97, i64 1 seq_cst, !dbg !613
  %78 = load %struct.ptree.3** %p, align 8, !dbg !613
  store %struct.ptree.3* %78, %struct.ptree.3** %pt, align 8, !dbg !613
  store %struct.ptree.3* %78, %struct.ptree.3** %pp, align 8, !dbg !613
  br label %do.body33, !dbg !614

do.body33:                                        ; preds = %do.cond47, %if.end32
  %79 = atomicrmw add i64* @sdmprofile__BBcounter_98, i64 1 seq_cst, !dbg !615
  %80 = load %struct.ptree.3** %pt, align 8, !dbg !615
  %p_b34 = getelementptr inbounds %struct.ptree.3* %80, i32 0, i32 3, !dbg !615
  %81 = load i32* %sdmprofile__threadnumber_st, !dbg !615
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b34, i8 2, i32 %81), !dbg !615
  %82 = load i8* %p_b34, align 1, !dbg !615
  %conv35 = sext i8 %82 to i32, !dbg !615
  store i32 %conv35, i32* %i, align 4, !dbg !615
  %83 = load %struct.ptree.3** %pt, align 8, !dbg !617
  store %struct.ptree.3* %83, %struct.ptree.3** %pp, align 8, !dbg !617
  %84 = load %struct.ptree.3** %pt, align 8, !dbg !618
  %p_b36 = getelementptr inbounds %struct.ptree.3* %84, i32 0, i32 3, !dbg !618
  %85 = load i32* %sdmprofile__threadnumber_st, !dbg !618
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b36, i8 2, i32 %85), !dbg !618
  %86 = load i8* %p_b36, align 1, !dbg !618
  %conv37 = sext i8 %86 to i32, !dbg !618
  %87 = load %struct.ptree.3** %p, align 8, !dbg !618
  %p_key38 = getelementptr inbounds %struct.ptree.3* %87, i32 0, i32 0, !dbg !618
  %88 = bitcast i64* %p_key38 to i8*, !dbg !618
  %89 = load i32* %sdmprofile__threadnumber_st, !dbg !618
  call void @sdmprofile__SearchRoutine_HPonly(i8* %88, i8 2, i32 %89), !dbg !618
  %90 = load i64* %p_key38, align 8, !dbg !618
  %sdmprofile__LD6 = load i32* %sdmprofile__threadnumber_st, align 8
  %91 = call i64 @bit(i32 %conv37, i64 %90, i32 %sdmprofile__LD6), !dbg !618
  %tobool40 = icmp ne i64 %91, 0, !dbg !618
  br i1 %tobool40, label %cond.true41, label %cond.false43, !dbg !618

cond.true41:                                      ; preds = %do.body33
  %92 = atomicrmw add i64* @sdmprofile__BBcounter_99, i64 1 seq_cst, !dbg !619
  %93 = load %struct.ptree.3** %pt, align 8, !dbg !619
  %p_right42 = getelementptr inbounds %struct.ptree.3* %93, i32 0, i32 5, !dbg !619
  %94 = bitcast %struct.ptree.3** %p_right42 to i8*, !dbg !619
  %95 = load i32* %sdmprofile__threadnumber_st, !dbg !619
  call void @sdmprofile__SearchRoutine_HPonly(i8* %94, i8 2, i32 %95), !dbg !619
  %96 = load %struct.ptree.3** %p_right42, align 8, !dbg !619
  br label %cond.end45, !dbg !619

cond.false43:                                     ; preds = %do.body33
  %97 = atomicrmw add i64* @sdmprofile__BBcounter_100, i64 1 seq_cst, !dbg !621
  %98 = load %struct.ptree.3** %pt, align 8, !dbg !621
  %p_left44 = getelementptr inbounds %struct.ptree.3* %98, i32 0, i32 4, !dbg !621
  %99 = bitcast %struct.ptree.3** %p_left44 to i8*, !dbg !621
  %100 = load i32* %sdmprofile__threadnumber_st, !dbg !621
  call void @sdmprofile__SearchRoutine_HPonly(i8* %99, i8 2, i32 %100), !dbg !621
  %101 = load %struct.ptree.3** %p_left44, align 8, !dbg !621
  br label %cond.end45, !dbg !621

cond.end45:                                       ; preds = %cond.false43, %cond.true41
  %cond46 = phi %struct.ptree.3* [ %96, %cond.true41 ], [ %101, %cond.false43 ], !dbg !618
  %102 = atomicrmw add i64* @sdmprofile__BBcounter_101, i64 1 seq_cst, !dbg !623
  store %struct.ptree.3* %cond46, %struct.ptree.3** %pt, align 8, !dbg !623
  br label %do.cond47, !dbg !626

do.cond47:                                        ; preds = %cond.end45
  %103 = atomicrmw add i64* @sdmprofile__BBcounter_102, i64 1 seq_cst, !dbg !627
  %104 = load i32* %i, align 4, !dbg !627
  %105 = load %struct.ptree.3** %pt, align 8, !dbg !627
  %p_b48 = getelementptr inbounds %struct.ptree.3* %105, i32 0, i32 3, !dbg !627
  %106 = load i32* %sdmprofile__threadnumber_st, !dbg !627
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b48, i8 2, i32 %106), !dbg !627
  %107 = load i8* %p_b48, align 1, !dbg !627
  %conv49 = sext i8 %107 to i32, !dbg !627
  %cmp50 = icmp slt i32 %104, %conv49, !dbg !627
  br i1 %cmp50, label %do.body33, label %do.end52, !dbg !627

do.end52:                                         ; preds = %do.cond47
  %108 = atomicrmw add i64* @sdmprofile__BBcounter_103, i64 1 seq_cst, !dbg !629
  %109 = load %struct.ptree.3** %pp, align 8, !dbg !629
  %p_b53 = getelementptr inbounds %struct.ptree.3* %109, i32 0, i32 3, !dbg !629
  %110 = load i32* %sdmprofile__threadnumber_st, !dbg !629
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b53, i8 2, i32 %110), !dbg !629
  %111 = load i8* %p_b53, align 1, !dbg !629
  %conv54 = sext i8 %111 to i32, !dbg !629
  %112 = load %struct.ptree.3** %p, align 8, !dbg !629
  %p_key55 = getelementptr inbounds %struct.ptree.3* %112, i32 0, i32 0, !dbg !629
  %113 = bitcast i64* %p_key55 to i8*, !dbg !629
  %114 = load i32* %sdmprofile__threadnumber_st, !dbg !629
  call void @sdmprofile__SearchRoutine_HPonly(i8* %113, i8 2, i32 %114), !dbg !629
  %115 = load i64* %p_key55, align 8, !dbg !629
  %sdmprofile__LD5 = load i32* %sdmprofile__threadnumber_st, align 8
  %116 = call i64 @bit(i32 %conv54, i64 %115, i32 %sdmprofile__LD5), !dbg !629
  %tobool57 = icmp ne i64 %116, 0, !dbg !629
  br i1 %tobool57, label %if.then58, label %if.else, !dbg !629

if.then58:                                        ; preds = %do.end52
  %117 = atomicrmw add i64* @sdmprofile__BBcounter_104, i64 1 seq_cst, !dbg !631
  %118 = load %struct.ptree.3** %t, align 8, !dbg !631
  %119 = load %struct.ptree.3** %pp, align 8, !dbg !631
  %p_right59 = getelementptr inbounds %struct.ptree.3* %119, i32 0, i32 5, !dbg !631
  %120 = bitcast %struct.ptree.3** %p_right59 to i8*, !dbg !631
  %121 = load i32* %sdmprofile__threadnumber_st, !dbg !631
  call void @sdmprofile__SearchRoutine_HPonly(i8* %120, i8 1, i32 %121), !dbg !631
  store %struct.ptree.3* %118, %struct.ptree.3** %p_right59, align 8, !dbg !631
  br label %if.end61, !dbg !631

if.else:                                          ; preds = %do.end52
  %122 = atomicrmw add i64* @sdmprofile__BBcounter_105, i64 1 seq_cst, !dbg !632
  %123 = load %struct.ptree.3** %t, align 8, !dbg !632
  %124 = load %struct.ptree.3** %pp, align 8, !dbg !632
  %p_left60 = getelementptr inbounds %struct.ptree.3* %124, i32 0, i32 4, !dbg !632
  %125 = bitcast %struct.ptree.3** %p_left60 to i8*, !dbg !632
  %126 = load i32* %sdmprofile__threadnumber_st, !dbg !632
  call void @sdmprofile__SearchRoutine_HPonly(i8* %125, i8 1, i32 %126), !dbg !632
  store %struct.ptree.3* %123, %struct.ptree.3** %p_left60, align 8, !dbg !632
  br label %if.end61

if.end61:                                         ; preds = %if.else, %if.then58
  %127 = atomicrmw add i64* @sdmprofile__BBcounter_106, i64 1 seq_cst, !dbg !633
  %128 = load %struct.ptree.3** %g, align 8, !dbg !633
  %p_b62 = getelementptr inbounds %struct.ptree.3* %128, i32 0, i32 3, !dbg !633
  %129 = load i32* %sdmprofile__threadnumber_st, !dbg !633
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b62, i8 2, i32 %129), !dbg !633
  %130 = load i8* %p_b62, align 1, !dbg !633
  %conv63 = sext i8 %130 to i32, !dbg !633
  %131 = load %struct.ptree.3** %n.addr, align 8, !dbg !633
  %p_key64 = getelementptr inbounds %struct.ptree.3* %131, i32 0, i32 0, !dbg !633
  %132 = bitcast i64* %p_key64 to i8*, !dbg !633
  %133 = load i32* %sdmprofile__threadnumber_st, !dbg !633
  call void @sdmprofile__SearchRoutine_HPonly(i8* %132, i8 2, i32 %133), !dbg !633
  %134 = load i64* %p_key64, align 8, !dbg !633
  %sdmprofile__LD4 = load i32* %sdmprofile__threadnumber_st, align 8
  %135 = call i64 @bit(i32 %conv63, i64 %134, i32 %sdmprofile__LD4), !dbg !633
  %tobool66 = icmp ne i64 %135, 0, !dbg !633
  br i1 %tobool66, label %if.then67, label %if.else80, !dbg !633

if.then67:                                        ; preds = %if.end61
  %136 = atomicrmw add i64* @sdmprofile__BBcounter_107, i64 1 seq_cst, !dbg !635
  %137 = load %struct.ptree.3** %p, align 8, !dbg !635
  %p_b68 = getelementptr inbounds %struct.ptree.3* %137, i32 0, i32 3, !dbg !635
  %138 = load i32* %sdmprofile__threadnumber_st, !dbg !635
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b68, i8 2, i32 %138), !dbg !635
  %139 = load i8* %p_b68, align 1, !dbg !635
  %conv69 = sext i8 %139 to i32, !dbg !635
  %140 = load %struct.ptree.3** %n.addr, align 8, !dbg !635
  %p_key70 = getelementptr inbounds %struct.ptree.3* %140, i32 0, i32 0, !dbg !635
  %141 = bitcast i64* %p_key70 to i8*, !dbg !635
  %142 = load i32* %sdmprofile__threadnumber_st, !dbg !635
  call void @sdmprofile__SearchRoutine_HPonly(i8* %141, i8 2, i32 %142), !dbg !635
  %143 = load i64* %p_key70, align 8, !dbg !635
  %sdmprofile__LD3 = load i32* %sdmprofile__threadnumber_st, align 8
  %144 = call i64 @bit(i32 %conv69, i64 %143, i32 %sdmprofile__LD3), !dbg !635
  %tobool72 = icmp ne i64 %144, 0, !dbg !635
  br i1 %tobool72, label %cond.true73, label %cond.false75, !dbg !635

cond.true73:                                      ; preds = %if.then67
  %145 = atomicrmw add i64* @sdmprofile__BBcounter_108, i64 1 seq_cst, !dbg !636
  %146 = load %struct.ptree.3** %p, align 8, !dbg !636
  %p_left74 = getelementptr inbounds %struct.ptree.3* %146, i32 0, i32 4, !dbg !636
  %147 = bitcast %struct.ptree.3** %p_left74 to i8*, !dbg !636
  %148 = load i32* %sdmprofile__threadnumber_st, !dbg !636
  call void @sdmprofile__SearchRoutine_HPonly(i8* %147, i8 2, i32 %148), !dbg !636
  %149 = load %struct.ptree.3** %p_left74, align 8, !dbg !636
  br label %cond.end77, !dbg !636

cond.false75:                                     ; preds = %if.then67
  %150 = atomicrmw add i64* @sdmprofile__BBcounter_109, i64 1 seq_cst, !dbg !638
  %151 = load %struct.ptree.3** %p, align 8, !dbg !638
  %p_right76 = getelementptr inbounds %struct.ptree.3* %151, i32 0, i32 5, !dbg !638
  %152 = bitcast %struct.ptree.3** %p_right76 to i8*, !dbg !638
  %153 = load i32* %sdmprofile__threadnumber_st, !dbg !638
  call void @sdmprofile__SearchRoutine_HPonly(i8* %152, i8 2, i32 %153), !dbg !638
  %154 = load %struct.ptree.3** %p_right76, align 8, !dbg !638
  br label %cond.end77, !dbg !638

cond.end77:                                       ; preds = %cond.false75, %cond.true73
  %cond78 = phi %struct.ptree.3* [ %149, %cond.true73 ], [ %154, %cond.false75 ], !dbg !635
  %155 = atomicrmw add i64* @sdmprofile__BBcounter_110, i64 1 seq_cst, !dbg !640
  %156 = load %struct.ptree.3** %g, align 8, !dbg !640
  %p_right79 = getelementptr inbounds %struct.ptree.3* %156, i32 0, i32 5, !dbg !640
  %157 = bitcast %struct.ptree.3** %p_right79 to i8*, !dbg !640
  %158 = load i32* %sdmprofile__threadnumber_st, !dbg !640
  call void @sdmprofile__SearchRoutine_HPonly(i8* %157, i8 1, i32 %158), !dbg !640
  store %struct.ptree.3* %cond78, %struct.ptree.3** %p_right79, align 8, !dbg !640
  br label %if.end93, !dbg !640

if.else80:                                        ; preds = %if.end61
  %159 = atomicrmw add i64* @sdmprofile__BBcounter_111, i64 1 seq_cst, !dbg !643
  %160 = load %struct.ptree.3** %p, align 8, !dbg !643
  %p_b81 = getelementptr inbounds %struct.ptree.3* %160, i32 0, i32 3, !dbg !643
  %161 = load i32* %sdmprofile__threadnumber_st, !dbg !643
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b81, i8 2, i32 %161), !dbg !643
  %162 = load i8* %p_b81, align 1, !dbg !643
  %conv82 = sext i8 %162 to i32, !dbg !643
  %163 = load %struct.ptree.3** %n.addr, align 8, !dbg !643
  %p_key83 = getelementptr inbounds %struct.ptree.3* %163, i32 0, i32 0, !dbg !643
  %164 = bitcast i64* %p_key83 to i8*, !dbg !643
  %165 = load i32* %sdmprofile__threadnumber_st, !dbg !643
  call void @sdmprofile__SearchRoutine_HPonly(i8* %164, i8 2, i32 %165), !dbg !643
  %166 = load i64* %p_key83, align 8, !dbg !643
  %sdmprofile__LD2 = load i32* %sdmprofile__threadnumber_st, align 8
  %167 = call i64 @bit(i32 %conv82, i64 %166, i32 %sdmprofile__LD2), !dbg !643
  %tobool85 = icmp ne i64 %167, 0, !dbg !643
  br i1 %tobool85, label %cond.true86, label %cond.false88, !dbg !643

cond.true86:                                      ; preds = %if.else80
  %168 = atomicrmw add i64* @sdmprofile__BBcounter_112, i64 1 seq_cst, !dbg !644
  %169 = load %struct.ptree.3** %p, align 8, !dbg !644
  %p_left87 = getelementptr inbounds %struct.ptree.3* %169, i32 0, i32 4, !dbg !644
  %170 = bitcast %struct.ptree.3** %p_left87 to i8*, !dbg !644
  %171 = load i32* %sdmprofile__threadnumber_st, !dbg !644
  call void @sdmprofile__SearchRoutine_HPonly(i8* %170, i8 2, i32 %171), !dbg !644
  %172 = load %struct.ptree.3** %p_left87, align 8, !dbg !644
  br label %cond.end90, !dbg !644

cond.false88:                                     ; preds = %if.else80
  %173 = atomicrmw add i64* @sdmprofile__BBcounter_113, i64 1 seq_cst, !dbg !646
  %174 = load %struct.ptree.3** %p, align 8, !dbg !646
  %p_right89 = getelementptr inbounds %struct.ptree.3* %174, i32 0, i32 5, !dbg !646
  %175 = bitcast %struct.ptree.3** %p_right89 to i8*, !dbg !646
  %176 = load i32* %sdmprofile__threadnumber_st, !dbg !646
  call void @sdmprofile__SearchRoutine_HPonly(i8* %175, i8 2, i32 %176), !dbg !646
  %177 = load %struct.ptree.3** %p_right89, align 8, !dbg !646
  br label %cond.end90, !dbg !646

cond.end90:                                       ; preds = %cond.false88, %cond.true86
  %cond91 = phi %struct.ptree.3* [ %172, %cond.true86 ], [ %177, %cond.false88 ], !dbg !643
  %178 = atomicrmw add i64* @sdmprofile__BBcounter_114, i64 1 seq_cst, !dbg !648
  %179 = load %struct.ptree.3** %g, align 8, !dbg !648
  %p_left92 = getelementptr inbounds %struct.ptree.3* %179, i32 0, i32 4, !dbg !648
  %180 = bitcast %struct.ptree.3** %p_left92 to i8*, !dbg !648
  %181 = load i32* %sdmprofile__threadnumber_st, !dbg !648
  call void @sdmprofile__SearchRoutine_HPonly(i8* %180, i8 1, i32 %181), !dbg !648
  store %struct.ptree.3* %cond91, %struct.ptree.3** %p_left92, align 8, !dbg !648
  br label %if.end93

if.end93:                                         ; preds = %cond.end90, %cond.end77
  %182 = atomicrmw add i64* @sdmprofile__BBcounter_115, i64 1 seq_cst, !dbg !651
  %183 = load %struct.ptree.3** %t, align 8, !dbg !651
  %p_m94 = getelementptr inbounds %struct.ptree.3* %183, i32 0, i32 1, !dbg !651
  %184 = bitcast %struct.ptree_mask.2** %p_m94 to i8*, !dbg !651
  %185 = load i32* %sdmprofile__threadnumber_st, !dbg !651
  call void @sdmprofile__SearchRoutine_HPonly(i8* %184, i8 2, i32 %185), !dbg !651
  %186 = load %struct.ptree_mask.2** %p_m94, align 8, !dbg !651
  %pm_data = getelementptr inbounds %struct.ptree_mask.2* %186, i32 0, i32 1, !dbg !651
  %187 = bitcast i8** %pm_data to i8*, !dbg !651
  %188 = load i32* %sdmprofile__threadnumber_st, !dbg !651
  call void @sdmprofile__SearchRoutine_HPonly(i8* %187, i8 2, i32 %188), !dbg !651
  %189 = load i8** %pm_data, align 8, !dbg !651
  %tobool95 = icmp ne i8* %189, null, !dbg !651
  br i1 %tobool95, label %if.then96, label %if.end99, !dbg !651

if.then96:                                        ; preds = %if.end93
  %190 = atomicrmw add i64* @sdmprofile__BBcounter_116, i64 1 seq_cst, !dbg !653
  %191 = load %struct.ptree.3** %t, align 8, !dbg !653
  %p_m97 = getelementptr inbounds %struct.ptree.3* %191, i32 0, i32 1, !dbg !653
  %192 = bitcast %struct.ptree_mask.2** %p_m97 to i8*, !dbg !653
  %193 = load i32* %sdmprofile__threadnumber_st, !dbg !653
  call void @sdmprofile__SearchRoutine_HPonly(i8* %192, i8 2, i32 %193), !dbg !653
  %194 = load %struct.ptree_mask.2** %p_m97, align 8, !dbg !653
  %pm_data98 = getelementptr inbounds %struct.ptree_mask.2* %194, i32 0, i32 1, !dbg !653
  %195 = bitcast i8** %pm_data98 to i8*, !dbg !653
  %196 = load i32* %sdmprofile__threadnumber_st, !dbg !653
  call void @sdmprofile__SearchRoutine_HPonly(i8* %195, i8 2, i32 %196), !dbg !653
  %197 = load i8** %pm_data98, align 8, !dbg !653
  %198 = load i32* %sdmprofile__threadnumber_st, !dbg !653
  call void @sdmprofile__free(i8* %197, i32 %198), !dbg !653
  br label %if.end99, !dbg !653

if.end99:                                         ; preds = %if.then96, %if.end93
  %199 = atomicrmw add i64* @sdmprofile__BBcounter_117, i64 1 seq_cst, !dbg !654
  %200 = load %struct.ptree.3** %t, align 8, !dbg !654
  %p_m100 = getelementptr inbounds %struct.ptree.3* %200, i32 0, i32 1, !dbg !654
  %201 = bitcast %struct.ptree_mask.2** %p_m100 to i8*, !dbg !654
  %202 = load i32* %sdmprofile__threadnumber_st, !dbg !654
  call void @sdmprofile__SearchRoutine_HPonly(i8* %201, i8 2, i32 %202), !dbg !654
  %203 = load %struct.ptree_mask.2** %p_m100, align 8, !dbg !654
  %204 = bitcast %struct.ptree_mask.2* %203 to i8*, !dbg !654
  %205 = load i32* %sdmprofile__threadnumber_st, !dbg !654
  call void @sdmprofile__free(i8* %204, i32 %205), !dbg !654
  %206 = load %struct.ptree.3** %t, align 8, !dbg !655
  %207 = load %struct.ptree.3** %p, align 8, !dbg !655
  %cmp101 = icmp ne %struct.ptree.3* %206, %207, !dbg !655
  br i1 %cmp101, label %if.then103, label %if.end110, !dbg !655

if.then103:                                       ; preds = %if.end99
  %208 = atomicrmw add i64* @sdmprofile__BBcounter_118, i64 1 seq_cst, !dbg !657
  %209 = load %struct.ptree.3** %p, align 8, !dbg !657
  %p_key104 = getelementptr inbounds %struct.ptree.3* %209, i32 0, i32 0, !dbg !657
  %210 = bitcast i64* %p_key104 to i8*, !dbg !657
  %211 = load i32* %sdmprofile__threadnumber_st, !dbg !657
  call void @sdmprofile__SearchRoutine_HPonly(i8* %210, i8 2, i32 %211), !dbg !657
  %212 = load i64* %p_key104, align 8, !dbg !657
  %213 = load %struct.ptree.3** %t, align 8, !dbg !657
  %p_key105 = getelementptr inbounds %struct.ptree.3* %213, i32 0, i32 0, !dbg !657
  %214 = bitcast i64* %p_key105 to i8*, !dbg !657
  %215 = load i32* %sdmprofile__threadnumber_st, !dbg !657
  call void @sdmprofile__SearchRoutine_HPonly(i8* %214, i8 1, i32 %215), !dbg !657
  store i64 %212, i64* %p_key105, align 8, !dbg !657
  %216 = load %struct.ptree.3** %p, align 8, !dbg !659
  %p_m106 = getelementptr inbounds %struct.ptree.3* %216, i32 0, i32 1, !dbg !659
  %217 = bitcast %struct.ptree_mask.2** %p_m106 to i8*, !dbg !659
  %218 = load i32* %sdmprofile__threadnumber_st, !dbg !659
  call void @sdmprofile__SearchRoutine_HPonly(i8* %217, i8 2, i32 %218), !dbg !659
  %219 = load %struct.ptree_mask.2** %p_m106, align 8, !dbg !659
  %220 = load %struct.ptree.3** %t, align 8, !dbg !659
  %p_m107 = getelementptr inbounds %struct.ptree.3* %220, i32 0, i32 1, !dbg !659
  %221 = bitcast %struct.ptree_mask.2** %p_m107 to i8*, !dbg !659
  %222 = load i32* %sdmprofile__threadnumber_st, !dbg !659
  call void @sdmprofile__SearchRoutine_HPonly(i8* %221, i8 1, i32 %222), !dbg !659
  store %struct.ptree_mask.2* %219, %struct.ptree_mask.2** %p_m107, align 8, !dbg !659
  %223 = load %struct.ptree.3** %p, align 8, !dbg !660
  %p_mlen108 = getelementptr inbounds %struct.ptree.3* %223, i32 0, i32 2, !dbg !660
  %224 = load i32* %sdmprofile__threadnumber_st, !dbg !660
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_mlen108, i8 2, i32 %224), !dbg !660
  %225 = load i8* %p_mlen108, align 1, !dbg !660
  %226 = load %struct.ptree.3** %t, align 8, !dbg !660
  %p_mlen109 = getelementptr inbounds %struct.ptree.3* %226, i32 0, i32 2, !dbg !660
  %227 = load i32* %sdmprofile__threadnumber_st, !dbg !660
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_mlen109, i8 1, i32 %227), !dbg !660
  store i8 %225, i8* %p_mlen109, align 1, !dbg !660
  br label %if.end110, !dbg !661

if.end110:                                        ; preds = %if.then103, %if.end99
  %228 = atomicrmw add i64* @sdmprofile__BBcounter_119, i64 1 seq_cst, !dbg !662
  %229 = load %struct.ptree.3** %p, align 8, !dbg !662
  %230 = bitcast %struct.ptree.3* %229 to i8*, !dbg !662
  %231 = load i32* %sdmprofile__threadnumber_st, !dbg !662
  call void @sdmprofile__free(i8* %230, i32 %231), !dbg !662
  store i32 1, i32* %retval, !dbg !663
  br label %return, !dbg !663

if.end111:                                        ; preds = %if.end15
  %232 = atomicrmw add i64* @sdmprofile__BBcounter_120, i64 1 seq_cst, !dbg !664
  store i32 0, i32* %i, align 4, !dbg !664
  br label %for.cond, !dbg !664

for.cond:                                         ; preds = %for.inc, %if.end111
  %233 = atomicrmw add i64* @sdmprofile__BBcounter_121, i64 1 seq_cst, !dbg !666
  %234 = load i32* %i, align 4, !dbg !666
  %235 = load %struct.ptree.3** %t, align 8, !dbg !666
  %p_mlen112 = getelementptr inbounds %struct.ptree.3* %235, i32 0, i32 2, !dbg !666
  %236 = load i32* %sdmprofile__threadnumber_st, !dbg !666
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_mlen112, i8 2, i32 %236), !dbg !666
  %237 = load i8* %p_mlen112, align 1, !dbg !666
  %conv113 = zext i8 %237 to i32, !dbg !666
  %cmp114 = icmp slt i32 %234, %conv113, !dbg !666
  br i1 %cmp114, label %for.body, label %for.end, !dbg !666

for.body:                                         ; preds = %for.cond
  %238 = atomicrmw add i64* @sdmprofile__BBcounter_122, i64 1 seq_cst, !dbg !669
  %239 = load %struct.ptree.3** %n.addr, align 8, !dbg !669
  %p_m116 = getelementptr inbounds %struct.ptree.3* %239, i32 0, i32 1, !dbg !669
  %240 = bitcast %struct.ptree_mask.2** %p_m116 to i8*, !dbg !669
  %241 = load i32* %sdmprofile__threadnumber_st, !dbg !669
  call void @sdmprofile__SearchRoutine_HPonly(i8* %240, i8 2, i32 %241), !dbg !669
  %242 = load %struct.ptree_mask.2** %p_m116, align 8, !dbg !669
  %pm_mask117 = getelementptr inbounds %struct.ptree_mask.2* %242, i32 0, i32 0, !dbg !669
  %243 = bitcast i64* %pm_mask117 to i8*, !dbg !669
  %244 = load i32* %sdmprofile__threadnumber_st, !dbg !669
  call void @sdmprofile__SearchRoutine_HPonly(i8* %243, i8 2, i32 %244), !dbg !669
  %245 = load i64* %pm_mask117, align 8, !dbg !669
  %246 = load i32* %i, align 4, !dbg !669
  %idxprom = sext i32 %246 to i64, !dbg !669
  %247 = load %struct.ptree.3** %t, align 8, !dbg !669
  %p_m118 = getelementptr inbounds %struct.ptree.3* %247, i32 0, i32 1, !dbg !669
  %248 = bitcast %struct.ptree_mask.2** %p_m118 to i8*, !dbg !669
  %249 = load i32* %sdmprofile__threadnumber_st, !dbg !669
  call void @sdmprofile__SearchRoutine_HPonly(i8* %248, i8 2, i32 %249), !dbg !669
  %250 = load %struct.ptree_mask.2** %p_m118, align 8, !dbg !669
  %arrayidx = getelementptr inbounds %struct.ptree_mask.2* %250, i64 %idxprom, !dbg !669
  %pm_mask119 = getelementptr inbounds %struct.ptree_mask.2* %arrayidx, i32 0, i32 0, !dbg !669
  %251 = bitcast i64* %pm_mask119 to i8*, !dbg !669
  %252 = load i32* %sdmprofile__threadnumber_st, !dbg !669
  call void @sdmprofile__SearchRoutine_HPonly(i8* %251, i8 2, i32 %252), !dbg !669
  %253 = load i64* %pm_mask119, align 8, !dbg !669
  %cmp120 = icmp eq i64 %245, %253, !dbg !669
  br i1 %cmp120, label %if.then122, label %if.end123, !dbg !669

if.then122:                                       ; preds = %for.body
  %254 = atomicrmw add i64* @sdmprofile__BBcounter_123, i64 1 seq_cst, !dbg !671
  br label %for.end, !dbg !671

if.end123:                                        ; preds = %for.body
  %255 = atomicrmw add i64* @sdmprofile__BBcounter_124, i64 1 seq_cst, !dbg !672
  br label %for.inc, !dbg !672

for.inc:                                          ; preds = %if.end123
  %256 = atomicrmw add i64* @sdmprofile__BBcounter_125, i64 1 seq_cst, !dbg !674
  %257 = load i32* %i, align 4, !dbg !674
  %inc = add nsw i32 %257, 1, !dbg !674
  store i32 %inc, i32* %i, align 4, !dbg !674
  br label %for.cond, !dbg !674

for.end:                                          ; preds = %if.then122, %for.cond
  %258 = atomicrmw add i64* @sdmprofile__BBcounter_126, i64 1 seq_cst, !dbg !675
  %259 = load i32* %i, align 4, !dbg !675
  %260 = load %struct.ptree.3** %t, align 8, !dbg !675
  %p_mlen124 = getelementptr inbounds %struct.ptree.3* %260, i32 0, i32 2, !dbg !675
  %261 = load i32* %sdmprofile__threadnumber_st, !dbg !675
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_mlen124, i8 2, i32 %261), !dbg !675
  %262 = load i8* %p_mlen124, align 1, !dbg !675
  %conv125 = zext i8 %262 to i32, !dbg !675
  %cmp126 = icmp sge i32 %259, %conv125, !dbg !675
  br i1 %cmp126, label %if.then128, label %if.end129, !dbg !675

if.then128:                                       ; preds = %for.end
  %263 = atomicrmw add i64* @sdmprofile__BBcounter_127, i64 1 seq_cst, !dbg !677
  store i32 0, i32* %retval, !dbg !677
  br label %return, !dbg !677

if.end129:                                        ; preds = %for.end
  %264 = atomicrmw add i64* @sdmprofile__BBcounter_128, i64 1 seq_cst, !dbg !678
  %265 = load %struct.ptree.3** %t, align 8, !dbg !678
  %p_mlen130 = getelementptr inbounds %struct.ptree.3* %265, i32 0, i32 2, !dbg !678
  %266 = load i32* %sdmprofile__threadnumber_st, !dbg !678
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_mlen130, i8 2, i32 %266), !dbg !678
  %267 = load i8* %p_mlen130, align 1, !dbg !678
  %conv131 = zext i8 %267 to i32, !dbg !678
  %sub = sub nsw i32 %conv131, 1, !dbg !678
  %conv132 = sext i32 %sub to i64, !dbg !678
  %mul = mul i64 16, %conv132, !dbg !678
  %call133 = call noalias i8* @malloc(i64 %mul) #2, !dbg !678
  %268 = load i32* %sdmprofile__threadnumber_st, !dbg !678
  %269 = call i8* @sdmprofile__malloc(i64 %mul, i32 8, i32 %268), !dbg !678
  %270 = bitcast i8* %269 to %struct.ptree_mask.2*, !dbg !678
  store %struct.ptree_mask.2* %270, %struct.ptree_mask.2** %buf, align 8, !dbg !678
  store i32 0, i32* %i, align 4, !dbg !679
  %271 = load %struct.ptree_mask.2** %buf, align 8, !dbg !679
  store %struct.ptree_mask.2* %271, %struct.ptree_mask.2** %pm, align 8, !dbg !679
  br label %for.cond134, !dbg !679

for.cond134:                                      ; preds = %for.inc151, %if.end129
  %272 = atomicrmw add i64* @sdmprofile__BBcounter_129, i64 1 seq_cst, !dbg !681
  %273 = load i32* %i, align 4, !dbg !681
  %274 = load %struct.ptree.3** %t, align 8, !dbg !681
  %p_mlen135 = getelementptr inbounds %struct.ptree.3* %274, i32 0, i32 2, !dbg !681
  %275 = load i32* %sdmprofile__threadnumber_st, !dbg !681
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_mlen135, i8 2, i32 %275), !dbg !681
  %276 = load i8* %p_mlen135, align 1, !dbg !681
  %conv136 = zext i8 %276 to i32, !dbg !681
  %cmp137 = icmp slt i32 %273, %conv136, !dbg !681
  br i1 %cmp137, label %for.body139, label %for.end153, !dbg !681

for.body139:                                      ; preds = %for.cond134
  %277 = atomicrmw add i64* @sdmprofile__BBcounter_130, i64 1 seq_cst, !dbg !684
  %278 = load %struct.ptree.3** %n.addr, align 8, !dbg !684
  %p_m140 = getelementptr inbounds %struct.ptree.3* %278, i32 0, i32 1, !dbg !684
  %279 = bitcast %struct.ptree_mask.2** %p_m140 to i8*, !dbg !684
  %280 = load i32* %sdmprofile__threadnumber_st, !dbg !684
  call void @sdmprofile__SearchRoutine_HPonly(i8* %279, i8 2, i32 %280), !dbg !684
  %281 = load %struct.ptree_mask.2** %p_m140, align 8, !dbg !684
  %pm_mask141 = getelementptr inbounds %struct.ptree_mask.2* %281, i32 0, i32 0, !dbg !684
  %282 = bitcast i64* %pm_mask141 to i8*, !dbg !684
  %283 = load i32* %sdmprofile__threadnumber_st, !dbg !684
  call void @sdmprofile__SearchRoutine_HPonly(i8* %282, i8 2, i32 %283), !dbg !684
  %284 = load i64* %pm_mask141, align 8, !dbg !684
  %285 = load i32* %i, align 4, !dbg !684
  %idxprom142 = sext i32 %285 to i64, !dbg !684
  %286 = load %struct.ptree.3** %t, align 8, !dbg !684
  %p_m143 = getelementptr inbounds %struct.ptree.3* %286, i32 0, i32 1, !dbg !684
  %287 = bitcast %struct.ptree_mask.2** %p_m143 to i8*, !dbg !684
  %288 = load i32* %sdmprofile__threadnumber_st, !dbg !684
  call void @sdmprofile__SearchRoutine_HPonly(i8* %287, i8 2, i32 %288), !dbg !684
  %289 = load %struct.ptree_mask.2** %p_m143, align 8, !dbg !684
  %arrayidx144 = getelementptr inbounds %struct.ptree_mask.2* %289, i64 %idxprom142, !dbg !684
  %pm_mask145 = getelementptr inbounds %struct.ptree_mask.2* %arrayidx144, i32 0, i32 0, !dbg !684
  %290 = bitcast i64* %pm_mask145 to i8*, !dbg !684
  %291 = load i32* %sdmprofile__threadnumber_st, !dbg !684
  call void @sdmprofile__SearchRoutine_HPonly(i8* %290, i8 2, i32 %291), !dbg !684
  %292 = load i64* %pm_mask145, align 8, !dbg !684
  %cmp146 = icmp ne i64 %284, %292, !dbg !684
  br i1 %cmp146, label %if.then148, label %if.end150, !dbg !684

if.then148:                                       ; preds = %for.body139
  %293 = atomicrmw add i64* @sdmprofile__BBcounter_131, i64 1 seq_cst, !dbg !687
  %294 = load %struct.ptree.3** %t, align 8, !dbg !687
  %p_m149 = getelementptr inbounds %struct.ptree.3* %294, i32 0, i32 1, !dbg !687
  %295 = bitcast %struct.ptree_mask.2** %p_m149 to i8*, !dbg !687
  %296 = load i32* %sdmprofile__threadnumber_st, !dbg !687
  call void @sdmprofile__SearchRoutine_HPonly(i8* %295, i8 2, i32 %296), !dbg !687
  %297 = load %struct.ptree_mask.2** %p_m149, align 8, !dbg !687
  %298 = load i32* %i, align 4, !dbg !687
  %idx.ext = sext i32 %298 to i64, !dbg !687
  %add.ptr = getelementptr inbounds %struct.ptree_mask.2* %297, i64 %idx.ext, !dbg !687
  %299 = bitcast %struct.ptree_mask.2* %add.ptr to i8*, !dbg !687
  %300 = load %struct.ptree_mask.2** %pm, align 8, !dbg !687
  %incdec.ptr = getelementptr inbounds %struct.ptree_mask.2* %300, i32 1, !dbg !687
  store %struct.ptree_mask.2* %incdec.ptr, %struct.ptree_mask.2** %pm, align 8, !dbg !687
  %301 = bitcast %struct.ptree_mask.2* %300 to i8*, !dbg !687
  call void @bcopy(i8* %299, i8* %301, i64 16) #2, !dbg !687
  br label %if.end150, !dbg !689

if.end150:                                        ; preds = %if.then148, %for.body139
  %302 = atomicrmw add i64* @sdmprofile__BBcounter_132, i64 1 seq_cst, !dbg !690
  br label %for.inc151, !dbg !690

for.inc151:                                       ; preds = %if.end150
  %303 = atomicrmw add i64* @sdmprofile__BBcounter_133, i64 1 seq_cst, !dbg !691
  %304 = load i32* %i, align 4, !dbg !691
  %inc152 = add nsw i32 %304, 1, !dbg !691
  store i32 %inc152, i32* %i, align 4, !dbg !691
  br label %for.cond134, !dbg !691

for.end153:                                       ; preds = %for.cond134
  %305 = atomicrmw add i64* @sdmprofile__BBcounter_134, i64 1 seq_cst, !dbg !692
  %306 = load %struct.ptree.3** %t, align 8, !dbg !692
  %p_mlen154 = getelementptr inbounds %struct.ptree.3* %306, i32 0, i32 2, !dbg !692
  %307 = load i32* %sdmprofile__threadnumber_st, !dbg !692
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_mlen154, i8 2, i32 %307), !dbg !692
  %308 = load i8* %p_mlen154, align 1, !dbg !692
  %dec = add i8 %308, -1, !dbg !692
  %309 = load i32* %sdmprofile__threadnumber_st, !dbg !692
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_mlen154, i8 1, i32 %309), !dbg !692
  store i8 %dec, i8* %p_mlen154, align 1, !dbg !692
  %310 = load %struct.ptree.3** %t, align 8, !dbg !693
  %p_m155 = getelementptr inbounds %struct.ptree.3* %310, i32 0, i32 1, !dbg !693
  %311 = bitcast %struct.ptree_mask.2** %p_m155 to i8*, !dbg !693
  %312 = load i32* %sdmprofile__threadnumber_st, !dbg !693
  call void @sdmprofile__SearchRoutine_HPonly(i8* %311, i8 2, i32 %312), !dbg !693
  %313 = load %struct.ptree_mask.2** %p_m155, align 8, !dbg !693
  %314 = bitcast %struct.ptree_mask.2* %313 to i8*, !dbg !693
  %315 = load i32* %sdmprofile__threadnumber_st, !dbg !693
  call void @sdmprofile__free(i8* %314, i32 %315), !dbg !693
  %316 = load %struct.ptree_mask.2** %buf, align 8, !dbg !694
  %317 = load %struct.ptree.3** %t, align 8, !dbg !694
  %p_m156 = getelementptr inbounds %struct.ptree.3* %317, i32 0, i32 1, !dbg !694
  %318 = bitcast %struct.ptree_mask.2** %p_m156 to i8*, !dbg !694
  %319 = load i32* %sdmprofile__threadnumber_st, !dbg !694
  call void @sdmprofile__SearchRoutine_HPonly(i8* %318, i8 1, i32 %319), !dbg !694
  store %struct.ptree_mask.2* %316, %struct.ptree_mask.2** %p_m156, align 8, !dbg !694
  store i32 1, i32* %retval, !dbg !695
  br label %return, !dbg !695

return:                                           ; preds = %for.end153, %if.then128, %if.end110, %if.then31, %if.then24, %if.then14, %if.then
  %320 = atomicrmw add i64* @sdmprofile__BBcounter_135, i64 1 seq_cst, !dbg !696
  %321 = load i32* %retval, !dbg !696
  ret i32 %321, !dbg !696
}

; Function Attrs: nounwind uwtable
define %struct.ptree.3* @pat_search(i64 %key, %struct.ptree.3* %head, i32 %sdmprofile__threadnumber) #11 {
entry:
  %retval = alloca %struct.ptree.3*, align 8
  %key.addr = alloca i64, align 8
  %head.addr = alloca %struct.ptree.3*, align 8
  %p = alloca %struct.ptree.3*, align 8
  %t = alloca %struct.ptree.3*, align 8
  %i = alloca i32, align 4
  %sdmprofile__threadnumber_st = alloca i32, align 4
  store i64 %key, i64* %key.addr, align 8
  store i32 %sdmprofile__threadnumber, i32* %sdmprofile__threadnumber_st, align 4
  %0 = atomicrmw add i64* @sdmprofile__BBcounter_136, i64 1 seq_cst, !dbg !697
  call void @llvm.dbg.declare(metadata !{i64* %key.addr}, metadata !715), !dbg !697
  store %struct.ptree.3* %head, %struct.ptree.3** %head.addr, align 8
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %head.addr}, metadata !716), !dbg !717
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %p}, metadata !718), !dbg !719
  store %struct.ptree.3* null, %struct.ptree.3** %p, align 8, !dbg !720
  call void @llvm.dbg.declare(metadata !{%struct.ptree.3** %t}, metadata !721), !dbg !722
  %1 = load %struct.ptree.3** %head.addr, align 8, !dbg !720
  store %struct.ptree.3* %1, %struct.ptree.3** %t, align 8, !dbg !720
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !723), !dbg !724
  %2 = load %struct.ptree.3** %t, align 8, !dbg !725
  %tobool = icmp ne %struct.ptree.3* %2, null, !dbg !725
  br i1 %tobool, label %if.end, label %if.then, !dbg !725

if.then:                                          ; preds = %entry
  %3 = atomicrmw add i64* @sdmprofile__BBcounter_137, i64 1 seq_cst, !dbg !727
  store %struct.ptree.3* null, %struct.ptree.3** %retval, !dbg !727
  br label %return, !dbg !727

if.end:                                           ; preds = %entry
  %4 = atomicrmw add i64* @sdmprofile__BBcounter_138, i64 1 seq_cst, !dbg !728
  br label %do.body, !dbg !728

do.body:                                          ; preds = %do.cond, %if.end
  %5 = atomicrmw add i64* @sdmprofile__BBcounter_139, i64 1 seq_cst, !dbg !729
  %6 = load %struct.ptree.3** %t, align 8, !dbg !729
  %p_key = getelementptr inbounds %struct.ptree.3* %6, i32 0, i32 0, !dbg !729
  %7 = bitcast i64* %p_key to i8*, !dbg !729
  %8 = load i32* %sdmprofile__threadnumber_st, !dbg !729
  call void @sdmprofile__SearchRoutine_HPonly(i8* %7, i8 2, i32 %8), !dbg !729
  %9 = load i64* %p_key, align 8, !dbg !729
  %10 = load i64* %key.addr, align 8, !dbg !729
  %11 = load %struct.ptree.3** %t, align 8, !dbg !729
  %p_m = getelementptr inbounds %struct.ptree.3* %11, i32 0, i32 1, !dbg !729
  %12 = bitcast %struct.ptree_mask.2** %p_m to i8*, !dbg !729
  %13 = load i32* %sdmprofile__threadnumber_st, !dbg !729
  call void @sdmprofile__SearchRoutine_HPonly(i8* %12, i8 2, i32 %13), !dbg !729
  %14 = load %struct.ptree_mask.2** %p_m, align 8, !dbg !729
  %pm_mask = getelementptr inbounds %struct.ptree_mask.2* %14, i32 0, i32 0, !dbg !729
  %15 = bitcast i64* %pm_mask to i8*, !dbg !729
  %16 = load i32* %sdmprofile__threadnumber_st, !dbg !729
  call void @sdmprofile__SearchRoutine_HPonly(i8* %15, i8 2, i32 %16), !dbg !729
  %17 = load i64* %pm_mask, align 8, !dbg !729
  %and = and i64 %10, %17, !dbg !729
  %cmp = icmp eq i64 %9, %and, !dbg !729
  br i1 %cmp, label %if.then1, label %if.end2, !dbg !729

if.then1:                                         ; preds = %do.body
  %18 = atomicrmw add i64* @sdmprofile__BBcounter_140, i64 1 seq_cst, !dbg !732
  %19 = load %struct.ptree.3** %t, align 8, !dbg !732
  store %struct.ptree.3* %19, %struct.ptree.3** %p, align 8, !dbg !732
  br label %if.end2, !dbg !734

if.end2:                                          ; preds = %if.then1, %do.body
  %20 = atomicrmw add i64* @sdmprofile__BBcounter_141, i64 1 seq_cst, !dbg !735
  %21 = load %struct.ptree.3** %t, align 8, !dbg !735
  %p_b = getelementptr inbounds %struct.ptree.3* %21, i32 0, i32 3, !dbg !735
  %22 = load i32* %sdmprofile__threadnumber_st, !dbg !735
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b, i8 2, i32 %22), !dbg !735
  %23 = load i8* %p_b, align 1, !dbg !735
  %conv = sext i8 %23 to i32, !dbg !735
  store i32 %conv, i32* %i, align 4, !dbg !735
  %24 = load %struct.ptree.3** %t, align 8, !dbg !736
  %p_b3 = getelementptr inbounds %struct.ptree.3* %24, i32 0, i32 3, !dbg !736
  %25 = load i32* %sdmprofile__threadnumber_st, !dbg !736
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b3, i8 2, i32 %25), !dbg !736
  %26 = load i8* %p_b3, align 1, !dbg !736
  %conv4 = sext i8 %26 to i32, !dbg !736
  %27 = load i64* %key.addr, align 8, !dbg !736
  %sdmprofile__LD1 = load i32* %sdmprofile__threadnumber_st, align 8
  %28 = call i64 @bit(i32 %conv4, i64 %27, i32 %sdmprofile__LD1), !dbg !736
  %tobool5 = icmp ne i64 %28, 0, !dbg !736
  br i1 %tobool5, label %cond.true, label %cond.false, !dbg !736

cond.true:                                        ; preds = %if.end2
  %29 = atomicrmw add i64* @sdmprofile__BBcounter_142, i64 1 seq_cst, !dbg !737
  %30 = load %struct.ptree.3** %t, align 8, !dbg !737
  %p_right = getelementptr inbounds %struct.ptree.3* %30, i32 0, i32 5, !dbg !737
  %31 = bitcast %struct.ptree.3** %p_right to i8*, !dbg !737
  %32 = load i32* %sdmprofile__threadnumber_st, !dbg !737
  call void @sdmprofile__SearchRoutine_HPonly(i8* %31, i8 2, i32 %32), !dbg !737
  %33 = load %struct.ptree.3** %p_right, align 8, !dbg !737
  br label %cond.end, !dbg !737

cond.false:                                       ; preds = %if.end2
  %34 = atomicrmw add i64* @sdmprofile__BBcounter_143, i64 1 seq_cst, !dbg !739
  %35 = load %struct.ptree.3** %t, align 8, !dbg !739
  %p_left = getelementptr inbounds %struct.ptree.3* %35, i32 0, i32 4, !dbg !739
  %36 = bitcast %struct.ptree.3** %p_left to i8*, !dbg !739
  %37 = load i32* %sdmprofile__threadnumber_st, !dbg !739
  call void @sdmprofile__SearchRoutine_HPonly(i8* %36, i8 2, i32 %37), !dbg !739
  %38 = load %struct.ptree.3** %p_left, align 8, !dbg !739
  br label %cond.end, !dbg !739

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.ptree.3* [ %33, %cond.true ], [ %38, %cond.false ], !dbg !736
  %39 = atomicrmw add i64* @sdmprofile__BBcounter_144, i64 1 seq_cst, !dbg !741
  store %struct.ptree.3* %cond, %struct.ptree.3** %t, align 8, !dbg !741
  br label %do.cond, !dbg !744

do.cond:                                          ; preds = %cond.end
  %40 = atomicrmw add i64* @sdmprofile__BBcounter_145, i64 1 seq_cst, !dbg !745
  %41 = load i32* %i, align 4, !dbg !745
  %42 = load %struct.ptree.3** %t, align 8, !dbg !745
  %p_b6 = getelementptr inbounds %struct.ptree.3* %42, i32 0, i32 3, !dbg !745
  %43 = load i32* %sdmprofile__threadnumber_st, !dbg !745
  call void @sdmprofile__SearchRoutine_HPonly(i8* %p_b6, i8 2, i32 %43), !dbg !745
  %44 = load i8* %p_b6, align 1, !dbg !745
  %conv7 = sext i8 %44 to i32, !dbg !745
  %cmp8 = icmp slt i32 %41, %conv7, !dbg !745
  br i1 %cmp8, label %do.body, label %do.end, !dbg !745

do.end:                                           ; preds = %do.cond
  %45 = atomicrmw add i64* @sdmprofile__BBcounter_146, i64 1 seq_cst, !dbg !747
  %46 = load %struct.ptree.3** %t, align 8, !dbg !747
  %p_key10 = getelementptr inbounds %struct.ptree.3* %46, i32 0, i32 0, !dbg !747
  %47 = bitcast i64* %p_key10 to i8*, !dbg !747
  %48 = load i32* %sdmprofile__threadnumber_st, !dbg !747
  call void @sdmprofile__SearchRoutine_HPonly(i8* %47, i8 2, i32 %48), !dbg !747
  %49 = load i64* %p_key10, align 8, !dbg !747
  %50 = load i64* %key.addr, align 8, !dbg !747
  %51 = load %struct.ptree.3** %t, align 8, !dbg !747
  %p_m11 = getelementptr inbounds %struct.ptree.3* %51, i32 0, i32 1, !dbg !747
  %52 = bitcast %struct.ptree_mask.2** %p_m11 to i8*, !dbg !747
  %53 = load i32* %sdmprofile__threadnumber_st, !dbg !747
  call void @sdmprofile__SearchRoutine_HPonly(i8* %52, i8 2, i32 %53), !dbg !747
  %54 = load %struct.ptree_mask.2** %p_m11, align 8, !dbg !747
  %pm_mask12 = getelementptr inbounds %struct.ptree_mask.2* %54, i32 0, i32 0, !dbg !747
  %55 = bitcast i64* %pm_mask12 to i8*, !dbg !747
  %56 = load i32* %sdmprofile__threadnumber_st, !dbg !747
  call void @sdmprofile__SearchRoutine_HPonly(i8* %55, i8 2, i32 %56), !dbg !747
  %57 = load i64* %pm_mask12, align 8, !dbg !747
  %and13 = and i64 %50, %57, !dbg !747
  %cmp14 = icmp eq i64 %49, %and13, !dbg !747
  br i1 %cmp14, label %cond.true16, label %cond.false17, !dbg !747

cond.true16:                                      ; preds = %do.end
  %58 = atomicrmw add i64* @sdmprofile__BBcounter_147, i64 1 seq_cst, !dbg !748
  %59 = load %struct.ptree.3** %t, align 8, !dbg !748
  br label %cond.end18, !dbg !748

cond.false17:                                     ; preds = %do.end
  %60 = atomicrmw add i64* @sdmprofile__BBcounter_148, i64 1 seq_cst, !dbg !750
  %61 = load %struct.ptree.3** %p, align 8, !dbg !750
  br label %cond.end18, !dbg !750

cond.end18:                                       ; preds = %cond.false17, %cond.true16
  %cond19 = phi %struct.ptree.3* [ %59, %cond.true16 ], [ %61, %cond.false17 ], !dbg !747
  %62 = atomicrmw add i64* @sdmprofile__BBcounter_149, i64 1 seq_cst, !dbg !752
  store %struct.ptree.3* %cond19, %struct.ptree.3** %retval, !dbg !752
  br label %return, !dbg !752

return:                                           ; preds = %cond.end18, %if.then
  %63 = atomicrmw add i64* @sdmprofile__BBcounter_150, i64 1 seq_cst, !dbg !755
  %64 = load %struct.ptree.3** %retval, !dbg !755
  ret %struct.ptree.3* %64, !dbg !755
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #11 {
  %argc_ptr = alloca i32, align 4
  %argv_ptr = alloca i8**, align 8
  %rtn = alloca i32, align 4
  store i32 %argc, i32* %argc_ptr, align 4
  store i8** %argv, i8*** %argv_ptr, align 8
  store i32 1, i32* @sdmprofile__profileAction
  store i64 8, i64* @sdmprofile__heapallocationCount
  store i64 0, i64* @sdmprofile__stackallocationCount
  store i64 151, i64* @sdmprofile__BBcount
  store i32 0, i32* @sdmprofile__IncludeStackProfiling
  call void @sdmprofile__StartProfiling_Processes()
  call void @sdmprofile__Embed_metadata_HP(i32 1, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__HP_Name_1, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @sdmprofile__HP_Type_1, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @sdmprofile__HP_Fname_1, i32 0, i32 0), i64 94, i8* getelementptr inbounds ([16 x i8]* @sdmprofile__HP_SourceFile_1, i32 0, i32 0))
  call void @sdmprofile__Embed_metadata_HP(i32 2, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__HP_Name_2, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8]* @sdmprofile__HP_Type_2, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @sdmprofile__HP_Fname_2, i32 0, i32 0), i64 100, i8* getelementptr inbounds ([16 x i8]* @sdmprofile__HP_SourceFile_2, i32 0, i32 0))
  call void @sdmprofile__Embed_metadata_HP(i32 3, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__HP_Name_3, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @sdmprofile__HP_Type_3, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @sdmprofile__HP_Fname_3, i32 0, i32 0), i64 137, i8* getelementptr inbounds ([16 x i8]* @sdmprofile__HP_SourceFile_3, i32 0, i32 0))
  call void @sdmprofile__Embed_metadata_HP(i32 4, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__HP_Name_4, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @sdmprofile__HP_Type_4, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @sdmprofile__HP_Fname_4, i32 0, i32 0), i64 108, i8* getelementptr inbounds ([16 x i8]* @sdmprofile__HP_SourceFile_4, i32 0, i32 0))
  call void @sdmprofile__Embed_metadata_HP(i32 5, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__HP_Name_5, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8]* @sdmprofile__HP_Type_5, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @sdmprofile__HP_Fname_5, i32 0, i32 0), i64 147, i8* getelementptr inbounds ([16 x i8]* @sdmprofile__HP_SourceFile_5, i32 0, i32 0))
  call void @sdmprofile__Embed_metadata_HP(i32 6, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__HP_Name_6, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @sdmprofile__HP_Type_6, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @sdmprofile__HP_Fname_6, i32 0, i32 0), i64 160, i8* getelementptr inbounds ([16 x i8]* @sdmprofile__HP_SourceFile_6, i32 0, i32 0))
  call void @sdmprofile__Embed_metadata_HP(i32 7, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__HP_Name_7, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8]* @sdmprofile__HP_Type_7, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @sdmprofile__HP_Fname_7, i32 0, i32 0), i64 136, i8* getelementptr inbounds ([11 x i8]* @sdmprofile__HP_SourceFile_7, i32 0, i32 0))
  call void @sdmprofile__Embed_metadata_HP(i32 8, i8* getelementptr inbounds ([6 x i8]* @sdmprofile__HP_Name_8, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8]* @sdmprofile__HP_Type_8, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @sdmprofile__HP_Fname_8, i32 0, i32 0), i64 292, i8* getelementptr inbounds ([11 x i8]* @sdmprofile__HP_SourceFile_8, i32 0, i32 0))
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
  %93 = load i64* @sdmprofile__BBcounter_89
  call void @sdmprofile__BBHit(i64 89, i64 %93)
  %94 = load i64* @sdmprofile__BBcounter_90
  call void @sdmprofile__BBHit(i64 90, i64 %94)
  %95 = load i64* @sdmprofile__BBcounter_91
  call void @sdmprofile__BBHit(i64 91, i64 %95)
  %96 = load i64* @sdmprofile__BBcounter_92
  call void @sdmprofile__BBHit(i64 92, i64 %96)
  %97 = load i64* @sdmprofile__BBcounter_93
  call void @sdmprofile__BBHit(i64 93, i64 %97)
  %98 = load i64* @sdmprofile__BBcounter_94
  call void @sdmprofile__BBHit(i64 94, i64 %98)
  %99 = load i64* @sdmprofile__BBcounter_95
  call void @sdmprofile__BBHit(i64 95, i64 %99)
  %100 = load i64* @sdmprofile__BBcounter_96
  call void @sdmprofile__BBHit(i64 96, i64 %100)
  %101 = load i64* @sdmprofile__BBcounter_97
  call void @sdmprofile__BBHit(i64 97, i64 %101)
  %102 = load i64* @sdmprofile__BBcounter_98
  call void @sdmprofile__BBHit(i64 98, i64 %102)
  %103 = load i64* @sdmprofile__BBcounter_99
  call void @sdmprofile__BBHit(i64 99, i64 %103)
  %104 = load i64* @sdmprofile__BBcounter_100
  call void @sdmprofile__BBHit(i64 100, i64 %104)
  %105 = load i64* @sdmprofile__BBcounter_101
  call void @sdmprofile__BBHit(i64 101, i64 %105)
  %106 = load i64* @sdmprofile__BBcounter_102
  call void @sdmprofile__BBHit(i64 102, i64 %106)
  %107 = load i64* @sdmprofile__BBcounter_103
  call void @sdmprofile__BBHit(i64 103, i64 %107)
  %108 = load i64* @sdmprofile__BBcounter_104
  call void @sdmprofile__BBHit(i64 104, i64 %108)
  %109 = load i64* @sdmprofile__BBcounter_105
  call void @sdmprofile__BBHit(i64 105, i64 %109)
  %110 = load i64* @sdmprofile__BBcounter_106
  call void @sdmprofile__BBHit(i64 106, i64 %110)
  %111 = load i64* @sdmprofile__BBcounter_107
  call void @sdmprofile__BBHit(i64 107, i64 %111)
  %112 = load i64* @sdmprofile__BBcounter_108
  call void @sdmprofile__BBHit(i64 108, i64 %112)
  %113 = load i64* @sdmprofile__BBcounter_109
  call void @sdmprofile__BBHit(i64 109, i64 %113)
  %114 = load i64* @sdmprofile__BBcounter_110
  call void @sdmprofile__BBHit(i64 110, i64 %114)
  %115 = load i64* @sdmprofile__BBcounter_111
  call void @sdmprofile__BBHit(i64 111, i64 %115)
  %116 = load i64* @sdmprofile__BBcounter_112
  call void @sdmprofile__BBHit(i64 112, i64 %116)
  %117 = load i64* @sdmprofile__BBcounter_113
  call void @sdmprofile__BBHit(i64 113, i64 %117)
  %118 = load i64* @sdmprofile__BBcounter_114
  call void @sdmprofile__BBHit(i64 114, i64 %118)
  %119 = load i64* @sdmprofile__BBcounter_115
  call void @sdmprofile__BBHit(i64 115, i64 %119)
  %120 = load i64* @sdmprofile__BBcounter_116
  call void @sdmprofile__BBHit(i64 116, i64 %120)
  %121 = load i64* @sdmprofile__BBcounter_117
  call void @sdmprofile__BBHit(i64 117, i64 %121)
  %122 = load i64* @sdmprofile__BBcounter_118
  call void @sdmprofile__BBHit(i64 118, i64 %122)
  %123 = load i64* @sdmprofile__BBcounter_119
  call void @sdmprofile__BBHit(i64 119, i64 %123)
  %124 = load i64* @sdmprofile__BBcounter_120
  call void @sdmprofile__BBHit(i64 120, i64 %124)
  %125 = load i64* @sdmprofile__BBcounter_121
  call void @sdmprofile__BBHit(i64 121, i64 %125)
  %126 = load i64* @sdmprofile__BBcounter_122
  call void @sdmprofile__BBHit(i64 122, i64 %126)
  %127 = load i64* @sdmprofile__BBcounter_123
  call void @sdmprofile__BBHit(i64 123, i64 %127)
  %128 = load i64* @sdmprofile__BBcounter_124
  call void @sdmprofile__BBHit(i64 124, i64 %128)
  %129 = load i64* @sdmprofile__BBcounter_125
  call void @sdmprofile__BBHit(i64 125, i64 %129)
  %130 = load i64* @sdmprofile__BBcounter_126
  call void @sdmprofile__BBHit(i64 126, i64 %130)
  %131 = load i64* @sdmprofile__BBcounter_127
  call void @sdmprofile__BBHit(i64 127, i64 %131)
  %132 = load i64* @sdmprofile__BBcounter_128
  call void @sdmprofile__BBHit(i64 128, i64 %132)
  %133 = load i64* @sdmprofile__BBcounter_129
  call void @sdmprofile__BBHit(i64 129, i64 %133)
  %134 = load i64* @sdmprofile__BBcounter_130
  call void @sdmprofile__BBHit(i64 130, i64 %134)
  %135 = load i64* @sdmprofile__BBcounter_131
  call void @sdmprofile__BBHit(i64 131, i64 %135)
  %136 = load i64* @sdmprofile__BBcounter_132
  call void @sdmprofile__BBHit(i64 132, i64 %136)
  %137 = load i64* @sdmprofile__BBcounter_133
  call void @sdmprofile__BBHit(i64 133, i64 %137)
  %138 = load i64* @sdmprofile__BBcounter_134
  call void @sdmprofile__BBHit(i64 134, i64 %138)
  %139 = load i64* @sdmprofile__BBcounter_135
  call void @sdmprofile__BBHit(i64 135, i64 %139)
  %140 = load i64* @sdmprofile__BBcounter_136
  call void @sdmprofile__BBHit(i64 136, i64 %140)
  %141 = load i64* @sdmprofile__BBcounter_137
  call void @sdmprofile__BBHit(i64 137, i64 %141)
  %142 = load i64* @sdmprofile__BBcounter_138
  call void @sdmprofile__BBHit(i64 138, i64 %142)
  %143 = load i64* @sdmprofile__BBcounter_139
  call void @sdmprofile__BBHit(i64 139, i64 %143)
  %144 = load i64* @sdmprofile__BBcounter_140
  call void @sdmprofile__BBHit(i64 140, i64 %144)
  %145 = load i64* @sdmprofile__BBcounter_141
  call void @sdmprofile__BBHit(i64 141, i64 %145)
  %146 = load i64* @sdmprofile__BBcounter_142
  call void @sdmprofile__BBHit(i64 142, i64 %146)
  %147 = load i64* @sdmprofile__BBcounter_143
  call void @sdmprofile__BBHit(i64 143, i64 %147)
  %148 = load i64* @sdmprofile__BBcounter_144
  call void @sdmprofile__BBHit(i64 144, i64 %148)
  %149 = load i64* @sdmprofile__BBcounter_145
  call void @sdmprofile__BBHit(i64 145, i64 %149)
  %150 = load i64* @sdmprofile__BBcounter_146
  call void @sdmprofile__BBHit(i64 146, i64 %150)
  %151 = load i64* @sdmprofile__BBcounter_147
  call void @sdmprofile__BBHit(i64 147, i64 %151)
  %152 = load i64* @sdmprofile__BBcounter_148
  call void @sdmprofile__BBHit(i64 148, i64 %152)
  %153 = load i64* @sdmprofile__BBcounter_149
  call void @sdmprofile__BBHit(i64 149, i64 %153)
  %154 = load i64* @sdmprofile__BBcounter_150
  call void @sdmprofile__BBHit(i64 150, i64 %154)
  call void @sdmprofile__EndProfiling_Processes()
  %155 = load i32* %rtn, align 4
  ret i32 %155
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
attributes #13 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #16 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #17 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #18 = { cold }
attributes #19 = { nounwind readonly }
attributes #20 = { noreturn nounwind }

!llvm.ident = !{!0, !0, !0}
!llvm.dbg.cu = !{!1, !41}
!llvm.module.flags = !{!50, !51}

!0 = metadata !{metadata !"clang version 3.5.1 (tags/RELEASE_351/final)"}
!1 = metadata !{i32 786449, metadata !2, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !4, metadata !3, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c] [DW_LANG_C99]
!2 = metadata !{metadata !"patricia.c", metadata !"/home/sslee/work/regen/test/mibench/network/patricia"}
!3 = metadata !{}
!4 = metadata !{metadata !5, metadata !28, metadata !32, metadata !35, metadata !38}
!5 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"pat_insert", metadata !"pat_insert", metadata !"", i32 92, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.ptree.3* (%struct.ptree.3*, %struct.ptree.3*)* @pat_insert_original, null, null, metadata !3, i32 93} ; [ DW_TAG_subprogram ] [line 92] [def] [scope 93] [pat_insert]
!6 = metadata !{i32 786473, metadata !2}          ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !9}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ptree]
!10 = metadata !{i32 786451, metadata !11, null, metadata !"ptree", i32 43, i64 320, i64 64, i32 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [ptree] [line 43, size 320, align 64, offset 0] [def] [from ]
!11 = metadata !{metadata !"./patricia.h", metadata !"/home/sslee/work/regen/test/mibench/network/patricia"}
!12 = metadata !{metadata !13, metadata !15, metadata !22, metadata !24, metadata !26, metadata !27}
!13 = metadata !{i32 786445, metadata !11, metadata !10, metadata !"p_key", i32 44, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [p_key] [line 44, size 64, align 64, offset 0] [from long unsigned int]
!14 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!15 = metadata !{i32 786445, metadata !11, metadata !10, metadata !"p_m", i32 45, i64 64, i64 64, i64 64, i32 0, metadata !16} ; [ DW_TAG_member ] [p_m] [line 45, size 64, align 64, offset 64] [from ]
!16 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ptree_mask]
!17 = metadata !{i32 786451, metadata !11, null, metadata !"ptree_mask", i32 34, i64 128, i64 64, i32 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [ptree_mask] [line 34, size 128, align 64, offset 0] [def] [from ]
!18 = metadata !{metadata !19, metadata !20}
!19 = metadata !{i32 786445, metadata !11, metadata !17, metadata !"pm_mask", i32 35, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [pm_mask] [line 35, size 64, align 64, offset 0] [from long unsigned int]
!20 = metadata !{i32 786445, metadata !11, metadata !17, metadata !"pm_data", i32 36, i64 64, i64 64, i64 64, i32 0, metadata !21} ; [ DW_TAG_member ] [pm_data] [line 36, size 64, align 64, offset 64] [from ]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!22 = metadata !{i32 786445, metadata !11, metadata !10, metadata !"p_mlen", i32 46, i64 8, i64 8, i64 128, i32 0, metadata !23} ; [ DW_TAG_member ] [p_mlen] [line 46, size 8, align 8, offset 128] [from unsigned char]
!23 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!24 = metadata !{i32 786445, metadata !11, metadata !10, metadata !"p_b", i32 47, i64 8, i64 8, i64 136, i32 0, metadata !25} ; [ DW_TAG_member ] [p_b] [line 47, size 8, align 8, offset 136] [from char]
!25 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!26 = metadata !{i32 786445, metadata !11, metadata !10, metadata !"p_left", i32 48, i64 64, i64 64, i64 192, i32 0, metadata !9} ; [ DW_TAG_member ] [p_left] [line 48, size 64, align 64, offset 192] [from ]
!27 = metadata !{i32 786445, metadata !11, metadata !10, metadata !"p_right", i32 49, i64 64, i64 64, i64 256, i32 0, metadata !9} ; [ DW_TAG_member ] [p_right] [line 49, size 64, align 64, offset 256] [from ]
!28 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"pat_remove", metadata !"pat_remove", metadata !"", i32 193, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.ptree.3*, %struct.ptree.3*)* @pat_remove_original, null, null, metadata !3, i32 194} ; [ DW_TAG_subprogram ] [line 193] [def] [scope 194] [pat_remove]
!29 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{metadata !31, metadata !9, metadata !9}
!31 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!32 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"pat_search", metadata !"pat_search", metadata !"", i32 315, metadata !33, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.ptree.3* (i64, %struct.ptree.3*)* @pat_search_original, null, null, metadata !3, i32 316} ; [ DW_TAG_subprogram ] [line 315] [def] [scope 316] [pat_search]
!33 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !34, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!34 = metadata !{metadata !9, metadata !14, metadata !9}
!35 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"insertR", metadata !"insertR", metadata !"", i32 66, metadata !36, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.ptree.3* (%struct.ptree.3*, %struct.ptree.3*, i32, %struct.ptree.3*)* @insertR_original, null, null, metadata !3, i32 67} ; [ DW_TAG_subprogram ] [line 66] [local] [def] [scope 67] [insertR]
!36 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !37, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!37 = metadata !{metadata !9, metadata !9, metadata !9, metadata !31, metadata !9}
!38 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"bit", metadata !"bit", metadata !"", i32 36, metadata !39, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i32, i64)* @bit_original, null, null, metadata !3, i32 37} ; [ DW_TAG_subprogram ] [line 36] [local] [def] [scope 37] [bit]
!39 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !40, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{metadata !14, metadata !31, metadata !14}
!41 = metadata !{i32 786449, metadata !42, i32 12, metadata !"clang version 3.5.1 (tags/RELEASE_351/final)", i1 false, metadata !"", i32 0, metadata !3, metadata !3, metadata !43, metadata !3, metadata !3, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c] [DW_LANG_C99]
!42 = metadata !{metadata !"patricia_test.c", metadata !"/home/sslee/work/regen/test/mibench/network/patricia"}
!43 = metadata !{metadata !44}
!44 = metadata !{i32 786478, metadata !42, metadata !45, metadata !"main", metadata !"main", metadata !"", i32 58, metadata !46, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main_original, null, null, metadata !3, i32 59} ; [ DW_TAG_subprogram ] [line 58] [def] [scope 59] [main]
!45 = metadata !{i32 786473, metadata !42}        ; [ DW_TAG_file_type ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!46 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = metadata !{metadata !31, metadata !31, metadata !48}
!48 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !49} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!49 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !25} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!50 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!51 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!52 = metadata !{metadata !53, metadata !53, i64 0}
!53 = metadata !{metadata !"any pointer", metadata !54, i64 0}
!54 = metadata !{metadata !"omnipotent char", metadata !55, i64 0}
!55 = metadata !{metadata !"Simple C/C++ TBAA"}
!56 = metadata !{metadata !57, metadata !57, i64 0}
!57 = metadata !{metadata !"int", metadata !54, i64 0}
!58 = metadata !{metadata !59, metadata !53, i64 0}
!59 = metadata !{metadata !"_ZTS18HeapAllocationMeta", metadata !53, i64 0, metadata !53, i64 8, metadata !60, i64 16, metadata !57, i64 24, metadata !60, i64 32}
!60 = metadata !{metadata !"long", metadata !54, i64 0}
!61 = metadata !{metadata !62, metadata !60, i64 0}
!62 = metadata !{metadata !"_ZTS6GVMeta", metadata !60, i64 0, metadata !60, i64 8, metadata !60, i64 16, metadata !53, i64 24, metadata !57, i64 32, metadata !53, i64 40, metadata !53, i64 48, metadata !53, i64 56, metadata !53, i64 64, metadata !53, i64 72, metadata !60, i64 80}
!63 = metadata !{metadata !62, metadata !53, i64 24}
!64 = metadata !{metadata !62, metadata !57, i64 32}
!65 = metadata !{metadata !66, metadata !53, i64 0}
!66 = metadata !{metadata !"_ZTS32sdmprofile__Allocated_Stack_item", metadata !53, i64 0, metadata !60, i64 8, metadata !53, i64 16}
!67 = metadata !{metadata !66, metadata !53, i64 16}
!68 = metadata !{metadata !68, metadata !69, metadata !70}
!69 = metadata !{metadata !"llvm.loop.vectorize.width", i32 1}
!70 = metadata !{metadata !"llvm.loop.interleave.count", i32 1}
!71 = metadata !{metadata !72, metadata !72, i64 0}
!72 = metadata !{metadata !"double", metadata !54, i64 0}
!73 = metadata !{metadata !74, metadata !57, i64 0}
!74 = metadata !{metadata !"_ZTS6Thread", metadata !57, i64 0, metadata !60, i64 8, metadata !72, i64 16, metadata !72, i64 24, metadata !53, i64 32, metadata !53, i64 40, metadata !60, i64 48, metadata !60, i64 56, metadata !60, i64 64, metadata !60, i64 72, metadata !60, i64 80, metadata !60, i64 88, metadata !60, i64 96, metadata !60, i64 104, metadata !60, i64 112, metadata !60, i64 120, metadata !60, i64 128, metadata !54, i64 136, metadata !54, i64 200, metadata !53, i64 264, metadata !53, i64 272}
!75 = metadata !{metadata !74, metadata !60, i64 8}
!76 = metadata !{metadata !74, metadata !72, i64 16}
!77 = metadata !{metadata !74, metadata !72, i64 24}
!78 = metadata !{metadata !74, metadata !53, i64 264}
!79 = metadata !{metadata !80, metadata !53, i64 0}
!80 = metadata !{metadata !"_ZTS11Cache2_Item", metadata !53, i64 0, metadata !53, i64 8}
!81 = metadata !{metadata !80, metadata !53, i64 8}
!82 = metadata !{metadata !74, metadata !53, i64 272}
!83 = metadata !{metadata !84, metadata !53, i64 0}
!84 = metadata !{metadata !"_ZTS12GVCache_Item", metadata !53, i64 0, metadata !53, i64 8}
!85 = metadata !{metadata !84, metadata !53, i64 8}
!86 = metadata !{metadata !74, metadata !53, i64 32}
!87 = metadata !{metadata !62, metadata !53, i64 40}
!88 = metadata !{metadata !62, metadata !53, i64 48}
!89 = metadata !{metadata !62, metadata !53, i64 56}
!90 = metadata !{metadata !62, metadata !53, i64 64}
!91 = metadata !{metadata !62, metadata !53, i64 72}
!92 = metadata !{metadata !62, metadata !60, i64 80}
!93 = metadata !{metadata !94, metadata !60, i64 0}
!94 = metadata !{metadata !"_ZTS23sdmprofile__struct_STrw", metadata !60, i64 0, metadata !60, i64 8, metadata !60, i64 16, metadata !57, i64 24, metadata !53, i64 32, metadata !53, i64 40, metadata !53, i64 48}
!95 = metadata !{metadata !94, metadata !57, i64 24}
!96 = metadata !{metadata !94, metadata !53, i64 32}
!97 = metadata !{metadata !94, metadata !53, i64 40}
!98 = metadata !{metadata !94, metadata !53, i64 48}
!99 = metadata !{metadata !100, metadata !57, i64 0}
!100 = metadata !{metadata !"_ZTS6HPMeta", metadata !57, i64 0, metadata !60, i64 8, metadata !60, i64 16, metadata !53, i64 24, metadata !53, i64 32, metadata !53, i64 40, metadata !60, i64 48, metadata !53, i64 56, metadata !60, i64 64, metadata !60, i64 72, metadata !60, i64 80, metadata !60, i64 88}
!101 = metadata !{metadata !100, metadata !53, i64 24}
!102 = metadata !{metadata !100, metadata !53, i64 32}
!103 = metadata !{metadata !100, metadata !53, i64 40}
!104 = metadata !{metadata !100, metadata !60, i64 48}
!105 = metadata !{metadata !100, metadata !53, i64 56}
!106 = metadata !{metadata !62, metadata !60, i64 8}
!107 = metadata !{metadata !62, metadata !60, i64 16}
!108 = metadata !{metadata !109, metadata !53, i64 0}
!109 = metadata !{metadata !"_ZTSSt14_Fwd_list_baseIP6GVMetaSaIS1_EE", metadata !110, i64 0}
!110 = metadata !{metadata !"_ZTSNSt14_Fwd_list_baseIP6GVMetaSaIS1_EE14_Fwd_list_implE", metadata !111, i64 0}
!111 = metadata !{metadata !"_ZTSSt19_Fwd_list_node_base", metadata !53, i64 0}
!112 = metadata !{metadata !113, metadata !53, i64 0}
!113 = metadata !{metadata !"_ZTSSt18_Fwd_list_iteratorIP6GVMetaE", metadata !53, i64 0}
!114 = metadata !{metadata !111, metadata !53, i64 0}
!115 = metadata !{metadata !94, metadata !60, i64 8}
!116 = metadata !{metadata !94, metadata !60, i64 16}
!117 = metadata !{metadata !60, metadata !60, i64 0}
!118 = metadata !{metadata !119, metadata !60, i64 0}
!119 = metadata !{metadata !"_ZTS8timespec", metadata !60, i64 0, metadata !60, i64 8}
!120 = metadata !{metadata !119, metadata !60, i64 8}
!121 = metadata !{metadata !122, metadata !60, i64 0}
!122 = metadata !{metadata !"_ZTS7timeval", metadata !60, i64 0, metadata !60, i64 8}
!123 = metadata !{metadata !122, metadata !60, i64 8}
!124 = metadata !{metadata !74, metadata !60, i64 48}
!125 = metadata !{metadata !59, metadata !53, i64 8}
!126 = metadata !{metadata !59, metadata !60, i64 16}
!127 = metadata !{metadata !59, metadata !57, i64 24}
!128 = metadata !{metadata !74, metadata !60, i64 80}
!129 = metadata !{metadata !74, metadata !60, i64 64}
!130 = metadata !{metadata !100, metadata !60, i64 64}
!131 = metadata !{metadata !100, metadata !60, i64 72}
!132 = metadata !{metadata !100, metadata !60, i64 80}
!133 = metadata !{metadata !74, metadata !60, i64 56}
!134 = metadata !{metadata !135, metadata !53, i64 0}
!135 = metadata !{metadata !"_ZTSSt10_List_baseIP18HeapAllocationMetaSaIS1_EE", metadata !136, i64 0}
!136 = metadata !{metadata !"_ZTSNSt10_List_baseIP18HeapAllocationMetaSaIS1_EE10_List_implE", metadata !137, i64 0}
!137 = metadata !{metadata !"_ZTSNSt8__detail15_List_node_baseE", metadata !53, i64 0, metadata !53, i64 8}
!138 = metadata !{metadata !139, metadata !53, i64 0}
!139 = metadata !{metadata !"_ZTSSt14_List_iteratorIP18HeapAllocationMetaE", metadata !53, i64 0}
!140 = metadata !{metadata !137, metadata !53, i64 0}
!141 = metadata !{metadata !74, metadata !60, i64 96}
!142 = metadata !{metadata !74, metadata !60, i64 112}
!143 = metadata !{metadata !74, metadata !60, i64 128}
!144 = metadata !{metadata !74, metadata !60, i64 120}
!145 = metadata !{metadata !74, metadata !60, i64 104}
!146 = metadata !{metadata !100, metadata !60, i64 8}
!147 = metadata !{metadata !100, metadata !60, i64 16}
!148 = metadata !{metadata !66, metadata !60, i64 8}
!149 = metadata !{metadata !54, metadata !54, i64 0}
!150 = metadata !{metadata !151, metadata !53, i64 0}
!151 = metadata !{metadata !"_ZTSN9__gnu_cxx17__normal_iteratorIPcSsEE", metadata !53, i64 0}
!152 = metadata !{metadata !153, metadata !53, i64 0}
!153 = metadata !{metadata !"_ZTSSs", metadata !154, i64 0}
!154 = metadata !{metadata !"_ZTSNSs12_Alloc_hiderE", metadata !53, i64 0}
!155 = metadata !{metadata !156, metadata !60, i64 0}
!156 = metadata !{metadata !"_ZTSNSs9_Rep_baseE", metadata !60, i64 0, metadata !60, i64 8, metadata !57, i64 16}
!157 = metadata !{metadata !156, metadata !57, i64 16}
!158 = metadata !{metadata !159, metadata !53, i64 16}
!159 = metadata !{metadata !"_ZTSSt10_List_nodeIP18HeapAllocationMetaE", metadata !53, i64 16}
!160 = metadata !{metadata !161, metadata !53, i64 0}
!161 = metadata !{metadata !"_ZTSSt24_Fwd_list_const_iteratorIP6GVMetaE", metadata !53, i64 0}
!162 = metadata !{metadata !135, metadata !53, i64 8}
!163 = metadata !{metadata !"branch_weights", i32 64, i32 4}
!164 = metadata !{i32 36, i32 9, metadata !38, null}
!165 = metadata !{i32 786689, metadata !38, metadata !"i", metadata !6, i32 16777252, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 36]
!166 = metadata !{i32 786689, metadata !38, metadata !"key", metadata !6, i32 33554468, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [key] [line 36]
!167 = metadata !{i32 36, i32 26, metadata !38, null}
!168 = metadata !{i32 38, i32 2, metadata !38, null}
!169 = metadata !{i32 66, i32 23, metadata !170, null}
!170 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"insertR", metadata !"insertR", metadata !"", i32 66, metadata !171, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.ptree.3* (%struct.ptree.3*, %struct.ptree.3*, i32, %struct.ptree.3*)* @insertR_original, null, null, metadata !3, i32 67} ; [ DW_TAG_subprogram ] [line 66] [local] [def] [scope 67] [insertR]
!171 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !172, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!172 = metadata !{metadata !173, metadata !173, metadata !173, metadata !31, metadata !173}
!173 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !174} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ptree]
!174 = metadata !{i32 786451, metadata !11, null, metadata !"ptree", i32 43, i64 320, i64 64, i32 0, i32 0, null, metadata !175, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [ptree] [line 43, size 320, align 64, offset 0] [def] [from ]
!175 = metadata !{metadata !176, metadata !177, metadata !183, metadata !184, metadata !185, metadata !186}
!176 = metadata !{i32 786445, metadata !11, metadata !174, metadata !"p_key", i32 44, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [p_key] [line 44, size 64, align 64, offset 0] [from long unsigned int]
!177 = metadata !{i32 786445, metadata !11, metadata !174, metadata !"p_m", i32 45, i64 64, i64 64, i64 64, i32 0, metadata !178} ; [ DW_TAG_member ] [p_m] [line 45, size 64, align 64, offset 64] [from ]
!178 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !179} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ptree_mask]
!179 = metadata !{i32 786451, metadata !11, null, metadata !"ptree_mask", i32 34, i64 128, i64 64, i32 0, i32 0, null, metadata !180, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [ptree_mask] [line 34, size 128, align 64, offset 0] [def] [from ]
!180 = metadata !{metadata !181, metadata !182}
!181 = metadata !{i32 786445, metadata !11, metadata !179, metadata !"pm_mask", i32 35, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [pm_mask] [line 35, size 64, align 64, offset 0] [from long unsigned int]
!182 = metadata !{i32 786445, metadata !11, metadata !179, metadata !"pm_data", i32 36, i64 64, i64 64, i64 64, i32 0, metadata !21} ; [ DW_TAG_member ] [pm_data] [line 36, size 64, align 64, offset 64] [from ]
!183 = metadata !{i32 786445, metadata !11, metadata !174, metadata !"p_mlen", i32 46, i64 8, i64 8, i64 128, i32 0, metadata !23} ; [ DW_TAG_member ] [p_mlen] [line 46, size 8, align 8, offset 128] [from unsigned char]
!184 = metadata !{i32 786445, metadata !11, metadata !174, metadata !"p_b", i32 47, i64 8, i64 8, i64 136, i32 0, metadata !25} ; [ DW_TAG_member ] [p_b] [line 47, size 8, align 8, offset 136] [from char]
!185 = metadata !{i32 786445, metadata !11, metadata !174, metadata !"p_left", i32 48, i64 64, i64 64, i64 192, i32 0, metadata !173} ; [ DW_TAG_member ] [p_left] [line 48, size 64, align 64, offset 192] [from ]
!186 = metadata !{i32 786445, metadata !11, metadata !174, metadata !"p_right", i32 49, i64 64, i64 64, i64 256, i32 0, metadata !173} ; [ DW_TAG_member ] [p_right] [line 49, size 64, align 64, offset 256] [from ]
!187 = metadata !{i32 786689, metadata !170, metadata !"h", metadata !6, i32 16777282, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [h] [line 66]
!188 = metadata !{i32 786689, metadata !170, metadata !"n", metadata !6, i32 33554498, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 66]
!189 = metadata !{i32 66, i32 40, metadata !170, null}
!190 = metadata !{i32 786689, metadata !170, metadata !"d", metadata !6, i32 50331714, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d] [line 66]
!191 = metadata !{i32 66, i32 47, metadata !170, null}
!192 = metadata !{i32 786689, metadata !170, metadata !"p", metadata !6, i32 67108930, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 66]
!193 = metadata !{i32 66, i32 64, metadata !170, null}
!194 = metadata !{i32 68, i32 6, metadata !195, null}
!195 = metadata !{i32 786443, metadata !2, metadata !170, i32 68, i32 6, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!196 = metadata !{i32 68, i32 6, metadata !197, null}
!197 = metadata !{i32 786443, metadata !2, metadata !195, i32 68, i32 6, i32 1, i32 61} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!198 = metadata !{i32 69, i32 3, metadata !199, null}
!199 = metadata !{i32 786443, metadata !2, metadata !195, i32 68, i32 43, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!200 = metadata !{i32 70, i32 15, metadata !199, null}
!201 = metadata !{i32 70, i32 15, metadata !202, null}
!202 = metadata !{i32 786443, metadata !2, metadata !199, i32 70, i32 15, i32 1, i32 62} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!203 = metadata !{i32 70, i32 15, metadata !204, null}
!204 = metadata !{i32 786443, metadata !2, metadata !199, i32 70, i32 15, i32 2, i32 63} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!205 = metadata !{i32 70, i32 15, metadata !206, null}
!206 = metadata !{i32 786443, metadata !2, metadata !207, i32 70, i32 15, i32 4, i32 65} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!207 = metadata !{i32 786443, metadata !2, metadata !199, i32 70, i32 15, i32 3, i32 64} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!208 = metadata !{i32 71, i32 16, metadata !199, null}
!209 = metadata !{i32 71, i32 16, metadata !210, null}
!210 = metadata !{i32 786443, metadata !2, metadata !199, i32 71, i32 16, i32 1, i32 66} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!211 = metadata !{i32 71, i32 16, metadata !212, null}
!212 = metadata !{i32 786443, metadata !2, metadata !199, i32 71, i32 16, i32 2, i32 67} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!213 = metadata !{i32 71, i32 16, metadata !214, null}
!214 = metadata !{i32 786443, metadata !2, metadata !215, i32 71, i32 16, i32 4, i32 69} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!215 = metadata !{i32 786443, metadata !2, metadata !199, i32 71, i32 16, i32 3, i32 68} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!216 = metadata !{i32 72, i32 3, metadata !199, null}
!217 = metadata !{i32 75, i32 6, metadata !218, null}
!218 = metadata !{i32 786443, metadata !2, metadata !170, i32 75, i32 6, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!219 = metadata !{i32 76, i32 16, metadata !218, null}
!220 = metadata !{i32 78, i32 15, metadata !218, null}
!221 = metadata !{i32 79, i32 2, metadata !170, null}
!222 = metadata !{i32 80, i32 1, metadata !170, null}
!223 = metadata !{i32 58, i32 10, metadata !44, null} ; [ DW_TAG_imported_module ]
!224 = metadata !{i32 786689, metadata !44, metadata !"argc", metadata !45, i32 16777274, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 58]
!225 = metadata !{i32 786689, metadata !44, metadata !"argv", metadata !45, i32 33554490, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 58]
!226 = metadata !{i32 58, i32 23, metadata !44, null} ; [ DW_TAG_imported_module ]
!227 = metadata !{i32 786688, metadata !44, metadata !"phead", metadata !45, i32 60, metadata !228, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [phead] [line 60]
!228 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !229} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ptree]
!229 = metadata !{i32 786451, metadata !11, null, metadata !"ptree", i32 43, i64 320, i64 64, i32 0, i32 0, null, metadata !230, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [ptree] [line 43, size 320, align 64, offset 0] [def] [from ]
!230 = metadata !{metadata !231, metadata !232, metadata !238, metadata !239, metadata !240, metadata !241}
!231 = metadata !{i32 786445, metadata !11, metadata !229, metadata !"p_key", i32 44, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [p_key] [line 44, size 64, align 64, offset 0] [from long unsigned int]
!232 = metadata !{i32 786445, metadata !11, metadata !229, metadata !"p_m", i32 45, i64 64, i64 64, i64 64, i32 0, metadata !233} ; [ DW_TAG_member ] [p_m] [line 45, size 64, align 64, offset 64] [from ]
!233 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !234} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ptree_mask]
!234 = metadata !{i32 786451, metadata !11, null, metadata !"ptree_mask", i32 34, i64 128, i64 64, i32 0, i32 0, null, metadata !235, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [ptree_mask] [line 34, size 128, align 64, offset 0] [def] [from ]
!235 = metadata !{metadata !236, metadata !237}
!236 = metadata !{i32 786445, metadata !11, metadata !234, metadata !"pm_mask", i32 35, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [pm_mask] [line 35, size 64, align 64, offset 0] [from long unsigned int]
!237 = metadata !{i32 786445, metadata !11, metadata !234, metadata !"pm_data", i32 36, i64 64, i64 64, i64 64, i32 0, metadata !21} ; [ DW_TAG_member ] [pm_data] [line 36, size 64, align 64, offset 64] [from ]
!238 = metadata !{i32 786445, metadata !11, metadata !229, metadata !"p_mlen", i32 46, i64 8, i64 8, i64 128, i32 0, metadata !23} ; [ DW_TAG_member ] [p_mlen] [line 46, size 8, align 8, offset 128] [from unsigned char]
!239 = metadata !{i32 786445, metadata !11, metadata !229, metadata !"p_b", i32 47, i64 8, i64 8, i64 136, i32 0, metadata !25} ; [ DW_TAG_member ] [p_b] [line 47, size 8, align 8, offset 136] [from char]
!240 = metadata !{i32 786445, metadata !11, metadata !229, metadata !"p_left", i32 48, i64 64, i64 64, i64 192, i32 0, metadata !228} ; [ DW_TAG_member ] [p_left] [line 48, size 64, align 64, offset 192] [from ]
!241 = metadata !{i32 786445, metadata !11, metadata !229, metadata !"p_right", i32 49, i64 64, i64 64, i64 256, i32 0, metadata !228} ; [ DW_TAG_member ] [p_right] [line 49, size 64, align 64, offset 256] [from ]
!242 = metadata !{i32 60, i32 16, metadata !44, null}
!243 = metadata !{i32 786688, metadata !44, metadata !"p", metadata !45, i32 61, metadata !228, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 61]
!244 = metadata !{i32 61, i32 16, metadata !44, null}
!245 = metadata !{i32 786688, metadata !44, metadata !"pfind", metadata !45, i32 61, metadata !228, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pfind] [line 61]
!246 = metadata !{i32 61, i32 19, metadata !44, null}
!247 = metadata !{i32 786688, metadata !44, metadata !"pm", metadata !45, i32 62, metadata !233, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pm] [line 62]
!248 = metadata !{i32 62, i32 21, metadata !44, null}
!249 = metadata !{i32 786688, metadata !44, metadata !"fp", metadata !45, i32 63, metadata !250, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fp] [line 63]
!250 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !251} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!251 = metadata !{i32 786454, metadata !252, null, metadata !"FILE", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !253} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!252 = metadata !{metadata !"/usr/include/stdio.h", metadata !"/home/sslee/work/regen/test/mibench/network/patricia"}
!253 = metadata !{i32 786451, metadata !254, null, metadata !"_IO_FILE", i32 245, i64 1728, i64 64, i32 0, i32 0, null, metadata !255, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!254 = metadata !{metadata !"/usr/include/libio.h", metadata !"/home/sslee/work/regen/test/mibench/network/patricia"}
!255 = metadata !{metadata !256, metadata !257, metadata !258, metadata !259, metadata !260, metadata !261, metadata !262, metadata !263, metadata !264, metadata !265, metadata !266, metadata !267, metadata !268, metadata !276, metadata !277, metadata !278, metadata !279, metadata !283, metadata !285, metadata !287, metadata !291, metadata !294, metadata !296, metadata !297, metadata !298, metadata !299, metadata !300, metadata !303, metadata !304}
!256 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_flags", i32 246, i64 32, i64 32, i64 0, i32 0, metadata !31} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!257 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_IO_read_ptr", i32 251, i64 64, i64 64, i64 64, i32 0, metadata !49} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!258 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_IO_read_end", i32 252, i64 64, i64 64, i64 128, i32 0, metadata !49} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!259 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_IO_read_base", i32 253, i64 64, i64 64, i64 192, i32 0, metadata !49} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!260 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_IO_write_base", i32 254, i64 64, i64 64, i64 256, i32 0, metadata !49} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!261 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_IO_write_ptr", i32 255, i64 64, i64 64, i64 320, i32 0, metadata !49} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!262 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_IO_write_end", i32 256, i64 64, i64 64, i64 384, i32 0, metadata !49} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!263 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_IO_buf_base", i32 257, i64 64, i64 64, i64 448, i32 0, metadata !49} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!264 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_IO_buf_end", i32 258, i64 64, i64 64, i64 512, i32 0, metadata !49} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!265 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_IO_save_base", i32 260, i64 64, i64 64, i64 576, i32 0, metadata !49} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!266 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_IO_backup_base", i32 261, i64 64, i64 64, i64 640, i32 0, metadata !49} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!267 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_IO_save_end", i32 262, i64 64, i64 64, i64 704, i32 0, metadata !49} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!268 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_markers", i32 264, i64 64, i64 64, i64 768, i32 0, metadata !269} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!269 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !270} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!270 = metadata !{i32 786451, metadata !254, null, metadata !"_IO_marker", i32 160, i64 192, i64 64, i32 0, i32 0, null, metadata !271, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [def] [from ]
!271 = metadata !{metadata !272, metadata !273, metadata !275}
!272 = metadata !{i32 786445, metadata !254, metadata !270, metadata !"_next", i32 161, i64 64, i64 64, i64 0, i32 0, metadata !269} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!273 = metadata !{i32 786445, metadata !254, metadata !270, metadata !"_sbuf", i32 162, i64 64, i64 64, i64 64, i32 0, metadata !274} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!274 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !253} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!275 = metadata !{i32 786445, metadata !254, metadata !270, metadata !"_pos", i32 166, i64 32, i64 32, i64 128, i32 0, metadata !31} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!276 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_chain", i32 266, i64 64, i64 64, i64 832, i32 0, metadata !274} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!277 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_fileno", i32 268, i64 32, i64 32, i64 896, i32 0, metadata !31} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!278 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_flags2", i32 272, i64 32, i64 32, i64 928, i32 0, metadata !31} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!279 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_old_offset", i32 274, i64 64, i64 64, i64 960, i32 0, metadata !280} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!280 = metadata !{i32 786454, metadata !281, null, metadata !"__off_t", i32 131, i64 0, i64 0, i64 0, i32 0, metadata !282} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!281 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/sslee/work/regen/test/mibench/network/patricia"}
!282 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!283 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_cur_column", i32 278, i64 16, i64 16, i64 1024, i32 0, metadata !284} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!284 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!285 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_vtable_offset", i32 279, i64 8, i64 8, i64 1040, i32 0, metadata !286} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!286 = metadata !{i32 786468, null, null, metadata !"signed char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!287 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_shortbuf", i32 280, i64 8, i64 8, i64 1048, i32 0, metadata !288} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!288 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8, i64 8, i32 0, i32 0, metadata !25, metadata !289, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!289 = metadata !{metadata !290}
!290 = metadata !{i32 786465, i64 0, i64 1}       ; [ DW_TAG_subrange_type ] [0, 0]
!291 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_lock", i32 284, i64 64, i64 64, i64 1088, i32 0, metadata !292} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!292 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !293} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_lock_t]
!293 = metadata !{i32 786454, metadata !254, null, metadata !"_IO_lock_t", i32 154, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_typedef ] [_IO_lock_t] [line 154, size 0, align 0, offset 0] [from ]
!294 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_offset", i32 293, i64 64, i64 64, i64 1152, i32 0, metadata !295} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!295 = metadata !{i32 786454, metadata !281, null, metadata !"__off64_t", i32 132, i64 0, i64 0, i64 0, i32 0, metadata !282} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!296 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"__pad1", i32 302, i64 64, i64 64, i64 1216, i32 0, metadata !21} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!297 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"__pad2", i32 303, i64 64, i64 64, i64 1280, i32 0, metadata !21} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!298 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"__pad3", i32 304, i64 64, i64 64, i64 1344, i32 0, metadata !21} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!299 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"__pad4", i32 305, i64 64, i64 64, i64 1408, i32 0, metadata !21} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!300 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"__pad5", i32 306, i64 64, i64 64, i64 1472, i32 0, metadata !301} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!301 = metadata !{i32 786454, metadata !302, null, metadata !"size_t", i32 58, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_typedef ] [size_t] [line 58, size 0, align 0, offset 0] [from long unsigned int]
!302 = metadata !{metadata !"/usr/local/bin/../lib/clang/3.5.1/include/stddef.h", metadata !"/home/sslee/work/regen/test/mibench/network/patricia"}
!303 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_mode", i32 308, i64 32, i64 32, i64 1536, i32 0, metadata !31} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!304 = metadata !{i32 786445, metadata !254, metadata !253, metadata !"_unused2", i32 310, i64 160, i64 8, i64 1568, i32 0, metadata !305} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!305 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160, i64 8, i32 0, i32 0, metadata !25, metadata !306, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!306 = metadata !{metadata !307}
!307 = metadata !{i32 786465, i64 0, i64 20}      ; [ DW_TAG_subrange_type ] [0, 19]
!308 = metadata !{i32 63, i32 8, metadata !44, null}
!309 = metadata !{i32 786688, metadata !44, metadata !"line", metadata !45, i32 64, metadata !310, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [line] [line 64]
!310 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1024, i64 8, i32 0, i32 0, metadata !25, metadata !311, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024, align 8, offset 0] [from char]
!311 = metadata !{metadata !312}
!312 = metadata !{i32 786465, i64 0, i64 128}     ; [ DW_TAG_subrange_type ] [0, 127]
!313 = metadata !{i32 64, i32 7, metadata !44, null}
!314 = metadata !{i32 786688, metadata !44, metadata !"addr_str", metadata !45, i32 65, metadata !315, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [addr_str] [line 65]
!315 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 8, i32 0, i32 0, metadata !25, metadata !316, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 8, offset 0] [from char]
!316 = metadata !{metadata !317}
!317 = metadata !{i32 786465, i64 0, i64 16}      ; [ DW_TAG_subrange_type ] [0, 15]
!318 = metadata !{i32 65, i32 7, metadata !44, null}
!319 = metadata !{i32 786688, metadata !44, metadata !"addr", metadata !45, i32 66, metadata !320, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [addr] [line 66]
!320 = metadata !{i32 786451, metadata !321, null, metadata !"in_addr", i32 31, i64 32, i64 32, i32 0, i32 0, null, metadata !322, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [in_addr] [line 31, size 32, align 32, offset 0] [def] [from ]
!321 = metadata !{metadata !"/usr/include/netinet/in.h", metadata !"/home/sslee/work/regen/test/mibench/network/patricia"}
!322 = metadata !{metadata !323}
!323 = metadata !{i32 786445, metadata !321, metadata !320, metadata !"s_addr", i32 33, i64 32, i64 32, i64 0, i32 0, metadata !324} ; [ DW_TAG_member ] [s_addr] [line 33, size 32, align 32, offset 0] [from in_addr_t]
!324 = metadata !{i32 786454, metadata !321, null, metadata !"in_addr_t", i32 30, i64 0, i64 0, i64 0, i32 0, metadata !325} ; [ DW_TAG_typedef ] [in_addr_t] [line 30, size 0, align 0, offset 0] [from uint32_t]
!325 = metadata !{i32 786454, metadata !326, null, metadata !"uint32_t", i32 51, i64 0, i64 0, i64 0, i32 0, metadata !327} ; [ DW_TAG_typedef ] [uint32_t] [line 51, size 0, align 0, offset 0] [from unsigned int]
!326 = metadata !{metadata !"/usr/include/stdint.h", metadata !"/home/sslee/work/regen/test/mibench/network/patricia"}
!327 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!328 = metadata !{i32 66, i32 17, metadata !44, null}
!329 = metadata !{i32 786688, metadata !44, metadata !"mask", metadata !45, i32 67, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mask] [line 67]
!330 = metadata !{i32 67, i32 16, metadata !44, null}
!331 = metadata !{i32 67, i32 2, metadata !44, null}
!332 = metadata !{i32 786688, metadata !44, metadata !"time", metadata !45, i32 68, metadata !333, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [time] [line 68]
!333 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!334 = metadata !{i32 68, i32 8, metadata !44, null}
!335 = metadata !{i32 70, i32 6, metadata !336, null}
!336 = metadata !{i32 786443, metadata !42, metadata !44, i32 70, i32 6, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!337 = metadata !{i32 71, i32 3, metadata !338, null}
!338 = metadata !{i32 786443, metadata !42, metadata !336, i32 70, i32 14, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!339 = metadata !{i32 72, i32 3, metadata !338, null}
!340 = metadata !{i32 79, i32 12, metadata !341, null}
!341 = metadata !{i32 786443, metadata !42, metadata !44, i32 79, i32 6, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!342 = metadata !{i32 80, i32 3, metadata !343, null}
!343 = metadata !{i32 786443, metadata !42, metadata !341, i32 79, i32 42, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!344 = metadata !{i32 81, i32 3, metadata !343, null}
!345 = metadata !{i32 94, i32 26, metadata !44, null}
!346 = metadata !{i32 95, i32 6, metadata !347, null}
!347 = metadata !{i32 786443, metadata !42, metadata !44, i32 95, i32 6, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!348 = metadata !{i32 96, i32 3, metadata !349, null}
!349 = metadata !{i32 786443, metadata !42, metadata !347, i32 95, i32 14, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!350 = metadata !{i32 97, i32 3, metadata !349, null}
!351 = metadata !{i32 99, i32 2, metadata !44, null}
!352 = metadata !{i32 100, i32 36, metadata !44, null}
!353 = metadata !{i32 102, i32 6, metadata !354, null}
!354 = metadata !{i32 786443, metadata !42, metadata !44, i32 102, i32 6, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!355 = metadata !{i32 103, i32 3, metadata !356, null}
!356 = metadata !{i32 786443, metadata !42, metadata !354, i32 102, i32 19, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!357 = metadata !{i32 104, i32 3, metadata !356, null}
!358 = metadata !{i32 106, i32 2, metadata !44, null}
!359 = metadata !{i32 107, i32 2, metadata !44, null}
!360 = metadata !{i32 108, i32 33, metadata !44, null}
!361 = metadata !{i32 109, i32 6, metadata !362, null}
!362 = metadata !{i32 786443, metadata !42, metadata !44, i32 109, i32 6, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!363 = metadata !{i32 110, i32 3, metadata !364, null}
!364 = metadata !{i32 786443, metadata !42, metadata !362, i32 109, i32 20, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!365 = metadata !{i32 111, i32 3, metadata !364, null}
!366 = metadata !{i32 113, i32 2, metadata !44, null}
!367 = metadata !{i32 119, i32 2, metadata !44, null}
!368 = metadata !{i32 120, i32 2, metadata !44, null}
!369 = metadata !{i32 126, i32 2, metadata !44, null}
!370 = metadata !{i32 126, i32 9, metadata !371, null}
!371 = metadata !{i32 786443, metadata !42, metadata !44, i32 126, i32 9, i32 1, i32 22} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!372 = metadata !{i32 131, i32 3, metadata !373, null}
!373 = metadata !{i32 786443, metadata !42, metadata !44, i32 126, i32 31, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!374 = metadata !{i32 137, i32 23, metadata !373, null}
!375 = metadata !{i32 138, i32 7, metadata !376, null}
!376 = metadata !{i32 786443, metadata !42, metadata !373, i32 138, i32 7, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!377 = metadata !{i32 139, i32 4, metadata !378, null}
!378 = metadata !{i32 786443, metadata !42, metadata !376, i32 138, i32 11, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!379 = metadata !{i32 140, i32 4, metadata !378, null}
!380 = metadata !{i32 142, i32 3, metadata !373, null}
!381 = metadata !{i32 147, i32 33, metadata !373, null}
!382 = metadata !{i32 149, i32 7, metadata !383, null}
!383 = metadata !{i32 786443, metadata !42, metadata !373, i32 149, i32 7, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!384 = metadata !{i32 150, i32 4, metadata !385, null}
!385 = metadata !{i32 786443, metadata !42, metadata !383, i32 149, i32 16, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!386 = metadata !{i32 151, i32 4, metadata !385, null}
!387 = metadata !{i32 153, i32 3, metadata !373, null}
!388 = metadata !{i32 159, i32 3, metadata !373, null}
!389 = metadata !{i32 160, i32 34, metadata !373, null}
!390 = metadata !{i32 161, i32 7, metadata !391, null}
!391 = metadata !{i32 786443, metadata !42, metadata !373, i32 161, i32 7, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!392 = metadata !{i32 162, i32 4, metadata !393, null}
!393 = metadata !{i32 786443, metadata !42, metadata !391, i32 161, i32 21, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!394 = metadata !{i32 163, i32 4, metadata !393, null}
!395 = metadata !{i32 165, i32 3, metadata !373, null}
!396 = metadata !{i32 171, i32 3, metadata !373, null}
!397 = metadata !{i32 172, i32 21, metadata !373, null}
!398 = metadata !{i32 174, i32 9, metadata !373, null}
!399 = metadata !{i32 177, i32 6, metadata !400, null}
!400 = metadata !{i32 786443, metadata !42, metadata !373, i32 177, i32 6, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!401 = metadata !{i32 179, i32 4, metadata !402, null}
!402 = metadata !{i32 786443, metadata !42, metadata !400, i32 178, i32 3, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!403 = metadata !{i32 180, i32 4, metadata !402, null}
!404 = metadata !{i32 181, i32 3, metadata !402, null}
!405 = metadata !{i32 190, i32 8, metadata !406, null}
!406 = metadata !{i32 786443, metadata !42, metadata !400, i32 183, i32 3, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!407 = metadata !{i32 192, i32 7, metadata !408, null}
!408 = metadata !{i32 786443, metadata !42, metadata !373, i32 192, i32 7, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!409 = metadata !{i32 193, i32 4, metadata !410, null}
!410 = metadata !{i32 786443, metadata !42, metadata !408, i32 192, i32 11, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia_test.c]
!411 = metadata !{i32 194, i32 4, metadata !410, null}
!412 = metadata !{i32 196, i32 2, metadata !373, null}
!413 = metadata !{i32 198, i32 2, metadata !44, null}
!414 = metadata !{i32 199, i32 1, metadata !44, null}
!415 = metadata !{i32 92, i32 26, metadata !416, null}
!416 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"pat_insert", metadata !"pat_insert", metadata !"", i32 92, metadata !417, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.ptree.3* (%struct.ptree.3*, %struct.ptree.3*)* @pat_insert_original, null, null, metadata !3, i32 93} ; [ DW_TAG_subprogram ] [line 92] [def] [scope 93] [pat_insert]
!417 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !418, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!418 = metadata !{metadata !419, metadata !419, metadata !419}
!419 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !420} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ptree]
!420 = metadata !{i32 786451, metadata !11, null, metadata !"ptree", i32 43, i64 320, i64 64, i32 0, i32 0, null, metadata !421, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [ptree] [line 43, size 320, align 64, offset 0] [def] [from ]
!421 = metadata !{metadata !422, metadata !423, metadata !429, metadata !430, metadata !431, metadata !432}
!422 = metadata !{i32 786445, metadata !11, metadata !420, metadata !"p_key", i32 44, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [p_key] [line 44, size 64, align 64, offset 0] [from long unsigned int]
!423 = metadata !{i32 786445, metadata !11, metadata !420, metadata !"p_m", i32 45, i64 64, i64 64, i64 64, i32 0, metadata !424} ; [ DW_TAG_member ] [p_m] [line 45, size 64, align 64, offset 64] [from ]
!424 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !425} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ptree_mask]
!425 = metadata !{i32 786451, metadata !11, null, metadata !"ptree_mask", i32 34, i64 128, i64 64, i32 0, i32 0, null, metadata !426, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [ptree_mask] [line 34, size 128, align 64, offset 0] [def] [from ]
!426 = metadata !{metadata !427, metadata !428}
!427 = metadata !{i32 786445, metadata !11, metadata !425, metadata !"pm_mask", i32 35, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [pm_mask] [line 35, size 64, align 64, offset 0] [from long unsigned int]
!428 = metadata !{i32 786445, metadata !11, metadata !425, metadata !"pm_data", i32 36, i64 64, i64 64, i64 64, i32 0, metadata !21} ; [ DW_TAG_member ] [pm_data] [line 36, size 64, align 64, offset 64] [from ]
!429 = metadata !{i32 786445, metadata !11, metadata !420, metadata !"p_mlen", i32 46, i64 8, i64 8, i64 128, i32 0, metadata !23} ; [ DW_TAG_member ] [p_mlen] [line 46, size 8, align 8, offset 128] [from unsigned char]
!430 = metadata !{i32 786445, metadata !11, metadata !420, metadata !"p_b", i32 47, i64 8, i64 8, i64 136, i32 0, metadata !25} ; [ DW_TAG_member ] [p_b] [line 47, size 8, align 8, offset 136] [from char]
!431 = metadata !{i32 786445, metadata !11, metadata !420, metadata !"p_left", i32 48, i64 64, i64 64, i64 192, i32 0, metadata !419} ; [ DW_TAG_member ] [p_left] [line 48, size 64, align 64, offset 192] [from ]
!432 = metadata !{i32 786445, metadata !11, metadata !420, metadata !"p_right", i32 49, i64 64, i64 64, i64 256, i32 0, metadata !419} ; [ DW_TAG_member ] [p_right] [line 49, size 64, align 64, offset 256] [from ]
!433 = metadata !{i32 786689, metadata !416, metadata !"n", metadata !6, i32 16777308, metadata !419, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 92]
!434 = metadata !{i32 786689, metadata !416, metadata !"head", metadata !6, i32 33554524, metadata !419, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 92]
!435 = metadata !{i32 92, i32 43, metadata !416, null}
!436 = metadata !{i32 786688, metadata !416, metadata !"t", metadata !6, i32 94, metadata !419, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 94]
!437 = metadata !{i32 94, i32 16, metadata !416, null}
!438 = metadata !{i32 786688, metadata !416, metadata !"buf", metadata !6, i32 95, metadata !424, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buf] [line 95]
!439 = metadata !{i32 95, i32 21, metadata !416, null}
!440 = metadata !{i32 786688, metadata !416, metadata !"pm", metadata !6, i32 95, metadata !424, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pm] [line 95]
!441 = metadata !{i32 95, i32 27, metadata !416, null}
!442 = metadata !{i32 786688, metadata !416, metadata !"i", metadata !6, i32 96, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 96]
!443 = metadata !{i32 96, i32 6, metadata !416, null}
!444 = metadata !{i32 786688, metadata !416, metadata !"copied", metadata !6, i32 96, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [copied] [line 96]
!445 = metadata !{i32 96, i32 9, metadata !416, null}
!446 = metadata !{i32 98, i32 6, metadata !447, null}
!447 = metadata !{i32 786443, metadata !2, metadata !416, i32 98, i32 6, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!448 = metadata !{i32 98, i32 6, metadata !449, null}
!449 = metadata !{i32 786443, metadata !2, metadata !447, i32 98, i32 6, i32 1, i32 44} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!450 = metadata !{i32 98, i32 6, metadata !451, null}
!451 = metadata !{i32 786443, metadata !2, metadata !447, i32 98, i32 6, i32 2, i32 45} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!452 = metadata !{i32 99, i32 3, metadata !447, null}
!453 = metadata !{i32 104, i32 2, metadata !416, null}
!454 = metadata !{i32 109, i32 2, metadata !416, null}
!455 = metadata !{i32 110, i32 2, metadata !416, null}
!456 = metadata !{i32 111, i32 3, metadata !457, null}
!457 = metadata !{i32 786443, metadata !2, metadata !416, i32 110, i32 5, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!458 = metadata !{i32 112, i32 7, metadata !457, null}
!459 = metadata !{i32 112, i32 7, metadata !460, null}
!460 = metadata !{i32 786443, metadata !2, metadata !457, i32 112, i32 7, i32 1, i32 46} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!461 = metadata !{i32 112, i32 7, metadata !462, null}
!462 = metadata !{i32 786443, metadata !2, metadata !457, i32 112, i32 7, i32 2, i32 47} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!463 = metadata !{i32 112, i32 7, metadata !464, null}
!464 = metadata !{i32 786443, metadata !2, metadata !465, i32 112, i32 7, i32 4, i32 49} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!465 = metadata !{i32 786443, metadata !2, metadata !457, i32 112, i32 7, i32 3, i32 48} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!466 = metadata !{i32 113, i32 2, metadata !457, null}
!467 = metadata !{i32 113, i32 2, metadata !468, null}
!468 = metadata !{i32 786443, metadata !2, metadata !457, i32 113, i32 2, i32 1, i32 50} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!469 = metadata !{i32 118, i32 6, metadata !470, null}
!470 = metadata !{i32 786443, metadata !2, metadata !416, i32 118, i32 6, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!471 = metadata !{i32 123, i32 8, metadata !472, null}
!472 = metadata !{i32 786443, metadata !2, metadata !473, i32 123, i32 3, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!473 = metadata !{i32 786443, metadata !2, metadata !470, i32 118, i32 28, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!474 = metadata !{i32 123, i32 8, metadata !475, null}
!475 = metadata !{i32 786443, metadata !2, metadata !476, i32 123, i32 8, i32 2, i32 52} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!476 = metadata !{i32 786443, metadata !2, metadata !472, i32 123, i32 8, i32 1, i32 51} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!477 = metadata !{i32 124, i32 8, metadata !478, null}
!478 = metadata !{i32 786443, metadata !2, metadata !479, i32 124, i32 8, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!479 = metadata !{i32 786443, metadata !2, metadata !472, i32 123, i32 33, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!480 = metadata !{i32 125, i32 5, metadata !481, null}
!481 = metadata !{i32 786443, metadata !2, metadata !478, i32 124, i32 46, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!482 = metadata !{i32 126, i32 5, metadata !481, null}
!483 = metadata !{i32 127, i32 5, metadata !481, null}
!484 = metadata !{i32 128, i32 5, metadata !481, null}
!485 = metadata !{i32 129, i32 5, metadata !481, null}
!486 = metadata !{i32 131, i32 3, metadata !479, null}
!487 = metadata !{i32 123, i32 28, metadata !472, null}
!488 = metadata !{i32 136, i32 30, metadata !473, null}
!489 = metadata !{i32 143, i32 3, metadata !473, null}
!490 = metadata !{i32 144, i32 8, metadata !491, null}
!491 = metadata !{i32 786443, metadata !2, metadata !473, i32 144, i32 3, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!492 = metadata !{i32 144, i32 8, metadata !493, null}
!493 = metadata !{i32 786443, metadata !2, metadata !494, i32 144, i32 8, i32 2, i32 54} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!494 = metadata !{i32 786443, metadata !2, metadata !491, i32 144, i32 8, i32 1, i32 53} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!495 = metadata !{i32 145, i32 8, metadata !496, null}
!496 = metadata !{i32 786443, metadata !2, metadata !497, i32 145, i32 8, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!497 = metadata !{i32 786443, metadata !2, metadata !491, i32 144, i32 42, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!498 = metadata !{i32 146, i32 5, metadata !499, null}
!499 = metadata !{i32 786443, metadata !2, metadata !496, i32 145, i32 45, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!500 = metadata !{i32 147, i32 5, metadata !499, null}
!501 = metadata !{i32 148, i32 4, metadata !499, null}
!502 = metadata !{i32 150, i32 5, metadata !503, null}
!503 = metadata !{i32 786443, metadata !2, metadata !496, i32 149, i32 9, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!504 = metadata !{i32 151, i32 5, metadata !503, null}
!505 = metadata !{i32 152, i32 5, metadata !503, null}
!506 = metadata !{i32 154, i32 3, metadata !497, null}
!507 = metadata !{i32 144, i32 36, metadata !491, null}
!508 = metadata !{i32 155, i32 7, metadata !509, null}
!509 = metadata !{i32 786443, metadata !2, metadata !473, i32 155, i32 7, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!510 = metadata !{i32 156, i32 4, metadata !511, null}
!511 = metadata !{i32 786443, metadata !2, metadata !509, i32 155, i32 16, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!512 = metadata !{i32 157, i32 3, metadata !511, null}
!513 = metadata !{i32 158, i32 3, metadata !473, null}
!514 = metadata !{i32 159, i32 3, metadata !473, null}
!515 = metadata !{i32 160, i32 3, metadata !473, null}
!516 = metadata !{i32 161, i32 3, metadata !473, null}
!517 = metadata !{i32 166, i32 3, metadata !473, null}
!518 = metadata !{i32 167, i32 3, metadata !473, null}
!519 = metadata !{i32 169, i32 3, metadata !473, null}
!520 = metadata !{i32 175, i32 7, metadata !521, null}
!521 = metadata !{i32 786443, metadata !2, metadata !416, i32 175, i32 2, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!522 = metadata !{i32 175, i32 7, metadata !523, null}
!523 = metadata !{i32 786443, metadata !2, metadata !524, i32 175, i32 7, i32 6, i32 60} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!524 = metadata !{i32 786443, metadata !2, metadata !521, i32 175, i32 7, i32 1, i32 55} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!525 = metadata !{i32 175, i32 22, metadata !526, null}
!526 = metadata !{i32 786443, metadata !2, metadata !521, i32 175, i32 22, i32 2, i32 56} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!527 = metadata !{i32 175, i32 42, metadata !521, null}
!528 = metadata !{i32 175, i32 42, metadata !529, null}
!529 = metadata !{i32 786443, metadata !2, metadata !521, i32 175, i32 42, i32 3, i32 57} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!530 = metadata !{i32 175, i32 42, metadata !531, null}
!531 = metadata !{i32 786443, metadata !2, metadata !521, i32 175, i32 42, i32 4, i32 58} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!532 = metadata !{i32 175, i32 60, metadata !533, null}
!533 = metadata !{i32 786443, metadata !2, metadata !521, i32 175, i32 60, i32 5, i32 59} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!534 = metadata !{i32 180, i32 6, metadata !535, null}
!535 = metadata !{i32 786443, metadata !2, metadata !416, i32 180, i32 6, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!536 = metadata !{i32 181, i32 19, metadata !535, null}
!537 = metadata !{i32 183, i32 18, metadata !535, null}
!538 = metadata !{i32 185, i32 2, metadata !416, null}
!539 = metadata !{i32 186, i32 1, metadata !416, null}
!540 = metadata !{i32 193, i32 26, metadata !541, null}
!541 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"pat_remove", metadata !"pat_remove", metadata !"", i32 193, metadata !542, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.ptree.3*, %struct.ptree.3*)* @pat_remove_original, null, null, metadata !3, i32 194} ; [ DW_TAG_subprogram ] [line 193] [def] [scope 194] [pat_remove]
!542 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !543, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!543 = metadata !{metadata !31, metadata !544, metadata !544}
!544 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !545} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ptree]
!545 = metadata !{i32 786451, metadata !11, null, metadata !"ptree", i32 43, i64 320, i64 64, i32 0, i32 0, null, metadata !546, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [ptree] [line 43, size 320, align 64, offset 0] [def] [from ]
!546 = metadata !{metadata !547, metadata !548, metadata !554, metadata !555, metadata !556, metadata !557}
!547 = metadata !{i32 786445, metadata !11, metadata !545, metadata !"p_key", i32 44, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [p_key] [line 44, size 64, align 64, offset 0] [from long unsigned int]
!548 = metadata !{i32 786445, metadata !11, metadata !545, metadata !"p_m", i32 45, i64 64, i64 64, i64 64, i32 0, metadata !549} ; [ DW_TAG_member ] [p_m] [line 45, size 64, align 64, offset 64] [from ]
!549 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !550} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ptree_mask]
!550 = metadata !{i32 786451, metadata !11, null, metadata !"ptree_mask", i32 34, i64 128, i64 64, i32 0, i32 0, null, metadata !551, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [ptree_mask] [line 34, size 128, align 64, offset 0] [def] [from ]
!551 = metadata !{metadata !552, metadata !553}
!552 = metadata !{i32 786445, metadata !11, metadata !550, metadata !"pm_mask", i32 35, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [pm_mask] [line 35, size 64, align 64, offset 0] [from long unsigned int]
!553 = metadata !{i32 786445, metadata !11, metadata !550, metadata !"pm_data", i32 36, i64 64, i64 64, i64 64, i32 0, metadata !21} ; [ DW_TAG_member ] [pm_data] [line 36, size 64, align 64, offset 64] [from ]
!554 = metadata !{i32 786445, metadata !11, metadata !545, metadata !"p_mlen", i32 46, i64 8, i64 8, i64 128, i32 0, metadata !23} ; [ DW_TAG_member ] [p_mlen] [line 46, size 8, align 8, offset 128] [from unsigned char]
!555 = metadata !{i32 786445, metadata !11, metadata !545, metadata !"p_b", i32 47, i64 8, i64 8, i64 136, i32 0, metadata !25} ; [ DW_TAG_member ] [p_b] [line 47, size 8, align 8, offset 136] [from char]
!556 = metadata !{i32 786445, metadata !11, metadata !545, metadata !"p_left", i32 48, i64 64, i64 64, i64 192, i32 0, metadata !544} ; [ DW_TAG_member ] [p_left] [line 48, size 64, align 64, offset 192] [from ]
!557 = metadata !{i32 786445, metadata !11, metadata !545, metadata !"p_right", i32 49, i64 64, i64 64, i64 256, i32 0, metadata !544} ; [ DW_TAG_member ] [p_right] [line 49, size 64, align 64, offset 256] [from ]
!558 = metadata !{i32 786689, metadata !541, metadata !"n", metadata !6, i32 16777409, metadata !544, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 193]
!559 = metadata !{i32 786689, metadata !541, metadata !"head", metadata !6, i32 33554625, metadata !544, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 193]
!560 = metadata !{i32 193, i32 43, metadata !541, null}
!561 = metadata !{i32 786688, metadata !541, metadata !"p", metadata !6, i32 195, metadata !544, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 195]
!562 = metadata !{i32 195, i32 16, metadata !541, null}
!563 = metadata !{i32 786688, metadata !541, metadata !"g", metadata !6, i32 195, metadata !544, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [g] [line 195]
!564 = metadata !{i32 195, i32 20, metadata !541, null}
!565 = metadata !{i32 786688, metadata !541, metadata !"pt", metadata !6, i32 195, metadata !544, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pt] [line 195]
!566 = metadata !{i32 195, i32 24, metadata !541, null}
!567 = metadata !{i32 786688, metadata !541, metadata !"pp", metadata !6, i32 195, metadata !544, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pp] [line 195]
!568 = metadata !{i32 195, i32 29, metadata !541, null}
!569 = metadata !{i32 786688, metadata !541, metadata !"t", metadata !6, i32 195, metadata !544, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 195]
!570 = metadata !{i32 195, i32 34, metadata !541, null}
!571 = metadata !{i32 786688, metadata !541, metadata !"buf", metadata !6, i32 196, metadata !549, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buf] [line 196]
!572 = metadata !{i32 196, i32 21, metadata !541, null}
!573 = metadata !{i32 786688, metadata !541, metadata !"pm", metadata !6, i32 196, metadata !549, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pm] [line 196]
!574 = metadata !{i32 196, i32 27, metadata !541, null}
!575 = metadata !{i32 786688, metadata !541, metadata !"i", metadata !6, i32 197, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 197]
!576 = metadata !{i32 197, i32 6, metadata !541, null}
!577 = metadata !{i32 199, i32 6, metadata !578, null}
!578 = metadata !{i32 786443, metadata !2, metadata !541, i32 199, i32 6, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!579 = metadata !{i32 199, i32 6, metadata !580, null}
!580 = metadata !{i32 786443, metadata !2, metadata !578, i32 199, i32 6, i32 1, i32 70} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!581 = metadata !{i32 199, i32 6, metadata !582, null}
!582 = metadata !{i32 786443, metadata !2, metadata !578, i32 199, i32 6, i32 2, i32 71} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!583 = metadata !{i32 200, i32 3, metadata !578, null}
!584 = metadata !{i32 206, i32 2, metadata !541, null}
!585 = metadata !{i32 207, i32 2, metadata !541, null}
!586 = metadata !{i32 208, i32 3, metadata !587, null}
!587 = metadata !{i32 786443, metadata !2, metadata !541, i32 207, i32 5, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!588 = metadata !{i32 209, i32 3, metadata !587, null}
!589 = metadata !{i32 210, i32 3, metadata !587, null}
!590 = metadata !{i32 211, i32 7, metadata !587, null}
!591 = metadata !{i32 211, i32 7, metadata !592, null}
!592 = metadata !{i32 786443, metadata !2, metadata !587, i32 211, i32 7, i32 1, i32 72} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!593 = metadata !{i32 211, i32 7, metadata !594, null}
!594 = metadata !{i32 786443, metadata !2, metadata !587, i32 211, i32 7, i32 2, i32 73} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!595 = metadata !{i32 211, i32 7, metadata !596, null}
!596 = metadata !{i32 786443, metadata !2, metadata !597, i32 211, i32 7, i32 4, i32 75} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!597 = metadata !{i32 786443, metadata !2, metadata !587, i32 211, i32 7, i32 3, i32 74} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!598 = metadata !{i32 212, i32 2, metadata !587, null}
!599 = metadata !{i32 212, i32 2, metadata !600, null}
!600 = metadata !{i32 786443, metadata !2, metadata !587, i32 212, i32 2, i32 1, i32 76} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!601 = metadata !{i32 217, i32 6, metadata !602, null}
!602 = metadata !{i32 786443, metadata !2, metadata !541, i32 217, i32 6, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!603 = metadata !{i32 218, i32 3, metadata !602, null}
!604 = metadata !{i32 223, i32 6, metadata !605, null}
!605 = metadata !{i32 786443, metadata !2, metadata !541, i32 223, i32 6, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!606 = metadata !{i32 227, i32 7, metadata !607, null}
!607 = metadata !{i32 786443, metadata !2, metadata !608, i32 227, i32 7, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!608 = metadata !{i32 786443, metadata !2, metadata !605, i32 223, i32 22, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!609 = metadata !{i32 228, i32 4, metadata !607, null}
!610 = metadata !{i32 233, i32 7, metadata !611, null}
!611 = metadata !{i32 786443, metadata !2, metadata !608, i32 233, i32 7, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!612 = metadata !{i32 234, i32 4, metadata !611, null}
!613 = metadata !{i32 240, i32 3, metadata !608, null}
!614 = metadata !{i32 241, i32 3, metadata !608, null}
!615 = metadata !{i32 242, i32 4, metadata !616, null}
!616 = metadata !{i32 786443, metadata !2, metadata !608, i32 241, i32 6, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!617 = metadata !{i32 243, i32 4, metadata !616, null}
!618 = metadata !{i32 244, i32 9, metadata !616, null}
!619 = metadata !{i32 244, i32 9, metadata !620, null}
!620 = metadata !{i32 786443, metadata !2, metadata !616, i32 244, i32 9, i32 1, i32 77} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!621 = metadata !{i32 244, i32 9, metadata !622, null}
!622 = metadata !{i32 786443, metadata !2, metadata !616, i32 244, i32 9, i32 2, i32 78} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!623 = metadata !{i32 244, i32 9, metadata !624, null}
!624 = metadata !{i32 786443, metadata !2, metadata !625, i32 244, i32 9, i32 4, i32 80} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!625 = metadata !{i32 786443, metadata !2, metadata !616, i32 244, i32 9, i32 3, i32 79} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!626 = metadata !{i32 245, i32 3, metadata !616, null}
!627 = metadata !{i32 245, i32 3, metadata !628, null}
!628 = metadata !{i32 786443, metadata !2, metadata !616, i32 245, i32 3, i32 1, i32 81} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!629 = metadata !{i32 247, i32 7, metadata !630, null}
!630 = metadata !{i32 786443, metadata !2, metadata !608, i32 247, i32 7, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!631 = metadata !{i32 248, i32 4, metadata !630, null}
!632 = metadata !{i32 250, i32 4, metadata !630, null}
!633 = metadata !{i32 255, i32 7, metadata !634, null}
!634 = metadata !{i32 786443, metadata !2, metadata !608, i32 255, i32 7, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!635 = metadata !{i32 256, i32 17, metadata !634, null}
!636 = metadata !{i32 256, i32 17, metadata !637, null}
!637 = metadata !{i32 786443, metadata !2, metadata !634, i32 256, i32 17, i32 1, i32 82} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!638 = metadata !{i32 256, i32 17, metadata !639, null}
!639 = metadata !{i32 786443, metadata !2, metadata !634, i32 256, i32 17, i32 2, i32 83} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!640 = metadata !{i32 256, i32 17, metadata !641, null}
!641 = metadata !{i32 786443, metadata !2, metadata !642, i32 256, i32 17, i32 4, i32 85} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!642 = metadata !{i32 786443, metadata !2, metadata !634, i32 256, i32 17, i32 3, i32 84} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!643 = metadata !{i32 259, i32 16, metadata !634, null}
!644 = metadata !{i32 259, i32 16, metadata !645, null}
!645 = metadata !{i32 786443, metadata !2, metadata !634, i32 259, i32 16, i32 1, i32 86} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!646 = metadata !{i32 259, i32 16, metadata !647, null}
!647 = metadata !{i32 786443, metadata !2, metadata !634, i32 259, i32 16, i32 2, i32 87} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!648 = metadata !{i32 259, i32 16, metadata !649, null}
!649 = metadata !{i32 786443, metadata !2, metadata !650, i32 259, i32 16, i32 4, i32 89} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!650 = metadata !{i32 786443, metadata !2, metadata !634, i32 259, i32 16, i32 3, i32 88} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!651 = metadata !{i32 266, i32 7, metadata !652, null}
!652 = metadata !{i32 786443, metadata !2, metadata !608, i32 266, i32 7, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!653 = metadata !{i32 267, i32 4, metadata !652, null}
!654 = metadata !{i32 268, i32 3, metadata !608, null}
!655 = metadata !{i32 269, i32 7, metadata !656, null}
!656 = metadata !{i32 786443, metadata !2, metadata !608, i32 269, i32 7, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!657 = metadata !{i32 270, i32 4, metadata !658, null}
!658 = metadata !{i32 786443, metadata !2, metadata !656, i32 269, i32 15, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!659 = metadata !{i32 271, i32 4, metadata !658, null}
!660 = metadata !{i32 272, i32 4, metadata !658, null}
!661 = metadata !{i32 273, i32 3, metadata !658, null}
!662 = metadata !{i32 274, i32 3, metadata !608, null}
!663 = metadata !{i32 276, i32 3, metadata !608, null}
!664 = metadata !{i32 283, i32 7, metadata !665, null}
!665 = metadata !{i32 786443, metadata !2, metadata !541, i32 283, i32 2, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!666 = metadata !{i32 283, i32 7, metadata !667, null}
!667 = metadata !{i32 786443, metadata !2, metadata !668, i32 283, i32 7, i32 2, i32 92} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!668 = metadata !{i32 786443, metadata !2, metadata !665, i32 283, i32 7, i32 1, i32 90} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!669 = metadata !{i32 284, i32 7, metadata !670, null}
!670 = metadata !{i32 786443, metadata !2, metadata !665, i32 284, i32 7, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!671 = metadata !{i32 285, i32 4, metadata !670, null}
!672 = metadata !{i32 284, i32 36, metadata !673, null}
!673 = metadata !{i32 786443, metadata !2, metadata !670, i32 284, i32 36, i32 1, i32 91} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!674 = metadata !{i32 283, i32 27, metadata !665, null}
!675 = metadata !{i32 286, i32 6, metadata !676, null}
!676 = metadata !{i32 786443, metadata !2, metadata !541, i32 286, i32 6, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!677 = metadata !{i32 287, i32 3, metadata !676, null}
!678 = metadata !{i32 292, i32 29, metadata !541, null}
!679 = metadata !{i32 295, i32 7, metadata !680, null}
!680 = metadata !{i32 786443, metadata !2, metadata !541, i32 295, i32 2, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!681 = metadata !{i32 295, i32 7, metadata !682, null}
!682 = metadata !{i32 786443, metadata !2, metadata !683, i32 295, i32 7, i32 2, i32 94} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!683 = metadata !{i32 786443, metadata !2, metadata !680, i32 295, i32 7, i32 1, i32 93} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!684 = metadata !{i32 296, i32 7, metadata !685, null}
!685 = metadata !{i32 786443, metadata !2, metadata !686, i32 296, i32 7, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!686 = metadata !{i32 786443, metadata !2, metadata !680, i32 295, i32 40, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!687 = metadata !{i32 297, i32 4, metadata !688, null}
!688 = metadata !{i32 786443, metadata !2, metadata !685, i32 296, i32 45, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!689 = metadata !{i32 298, i32 3, metadata !688, null}
!690 = metadata !{i32 299, i32 2, metadata !686, null}
!691 = metadata !{i32 295, i32 35, metadata !680, null}
!692 = metadata !{i32 304, i32 2, metadata !541, null}
!693 = metadata !{i32 305, i32 2, metadata !541, null}
!694 = metadata !{i32 306, i32 2, metadata !541, null}
!695 = metadata !{i32 307, i32 2, metadata !541, null}
!696 = metadata !{i32 308, i32 1, metadata !541, null}
!697 = metadata !{i32 315, i32 26, metadata !698, null}
!698 = metadata !{i32 786478, metadata !2, metadata !6, metadata !"pat_search", metadata !"pat_search", metadata !"", i32 315, metadata !699, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.ptree.3* (i64, %struct.ptree.3*)* @pat_search_original, null, null, metadata !3, i32 316} ; [ DW_TAG_subprogram ] [line 315] [def] [scope 316] [pat_search]
!699 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !700, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!700 = metadata !{metadata !701, metadata !14, metadata !701}
!701 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !702} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ptree]
!702 = metadata !{i32 786451, metadata !11, null, metadata !"ptree", i32 43, i64 320, i64 64, i32 0, i32 0, null, metadata !703, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [ptree] [line 43, size 320, align 64, offset 0] [def] [from ]
!703 = metadata !{metadata !704, metadata !705, metadata !711, metadata !712, metadata !713, metadata !714}
!704 = metadata !{i32 786445, metadata !11, metadata !702, metadata !"p_key", i32 44, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [p_key] [line 44, size 64, align 64, offset 0] [from long unsigned int]
!705 = metadata !{i32 786445, metadata !11, metadata !702, metadata !"p_m", i32 45, i64 64, i64 64, i64 64, i32 0, metadata !706} ; [ DW_TAG_member ] [p_m] [line 45, size 64, align 64, offset 64] [from ]
!706 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !707} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ptree_mask]
!707 = metadata !{i32 786451, metadata !11, null, metadata !"ptree_mask", i32 34, i64 128, i64 64, i32 0, i32 0, null, metadata !708, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [ptree_mask] [line 34, size 128, align 64, offset 0] [def] [from ]
!708 = metadata !{metadata !709, metadata !710}
!709 = metadata !{i32 786445, metadata !11, metadata !707, metadata !"pm_mask", i32 35, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [pm_mask] [line 35, size 64, align 64, offset 0] [from long unsigned int]
!710 = metadata !{i32 786445, metadata !11, metadata !707, metadata !"pm_data", i32 36, i64 64, i64 64, i64 64, i32 0, metadata !21} ; [ DW_TAG_member ] [pm_data] [line 36, size 64, align 64, offset 64] [from ]
!711 = metadata !{i32 786445, metadata !11, metadata !702, metadata !"p_mlen", i32 46, i64 8, i64 8, i64 128, i32 0, metadata !23} ; [ DW_TAG_member ] [p_mlen] [line 46, size 8, align 8, offset 128] [from unsigned char]
!712 = metadata !{i32 786445, metadata !11, metadata !702, metadata !"p_b", i32 47, i64 8, i64 8, i64 136, i32 0, metadata !25} ; [ DW_TAG_member ] [p_b] [line 47, size 8, align 8, offset 136] [from char]
!713 = metadata !{i32 786445, metadata !11, metadata !702, metadata !"p_left", i32 48, i64 64, i64 64, i64 192, i32 0, metadata !701} ; [ DW_TAG_member ] [p_left] [line 48, size 64, align 64, offset 192] [from ]
!714 = metadata !{i32 786445, metadata !11, metadata !702, metadata !"p_right", i32 49, i64 64, i64 64, i64 256, i32 0, metadata !701} ; [ DW_TAG_member ] [p_right] [line 49, size 64, align 64, offset 256] [from ]
!715 = metadata !{i32 786689, metadata !698, metadata !"key", metadata !6, i32 16777531, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [key] [line 315]
!716 = metadata !{i32 786689, metadata !698, metadata !"head", metadata !6, i32 33554747, metadata !701, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [head] [line 315]
!717 = metadata !{i32 315, i32 45, metadata !698, null}
!718 = metadata !{i32 786688, metadata !698, metadata !"p", metadata !6, i32 317, metadata !701, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 317]
!719 = metadata !{i32 317, i32 16, metadata !698, null}
!720 = metadata !{i32 317, i32 2, metadata !698, null}
!721 = metadata !{i32 786688, metadata !698, metadata !"t", metadata !6, i32 317, metadata !701, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 317]
!722 = metadata !{i32 317, i32 24, metadata !698, null}
!723 = metadata !{i32 786688, metadata !698, metadata !"i", metadata !6, i32 318, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 318]
!724 = metadata !{i32 318, i32 6, metadata !698, null}
!725 = metadata !{i32 320, i32 6, metadata !726, null}
!726 = metadata !{i32 786443, metadata !2, metadata !698, i32 320, i32 6, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!727 = metadata !{i32 321, i32 3, metadata !726, null}
!728 = metadata !{i32 326, i32 2, metadata !698, null}
!729 = metadata !{i32 330, i32 7, metadata !730, null}
!730 = metadata !{i32 786443, metadata !2, metadata !731, i32 330, i32 7, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!731 = metadata !{i32 786443, metadata !2, metadata !698, i32 326, i32 5, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!732 = metadata !{i32 331, i32 4, metadata !733, null}
!733 = metadata !{i32 786443, metadata !2, metadata !730, i32 330, i32 44, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!734 = metadata !{i32 332, i32 3, metadata !733, null}
!735 = metadata !{i32 334, i32 3, metadata !731, null}
!736 = metadata !{i32 335, i32 7, metadata !731, null}
!737 = metadata !{i32 335, i32 7, metadata !738, null}
!738 = metadata !{i32 786443, metadata !2, metadata !731, i32 335, i32 7, i32 1, i32 95} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!739 = metadata !{i32 335, i32 7, metadata !740, null}
!740 = metadata !{i32 786443, metadata !2, metadata !731, i32 335, i32 7, i32 2, i32 96} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!741 = metadata !{i32 335, i32 7, metadata !742, null}
!742 = metadata !{i32 786443, metadata !2, metadata !743, i32 335, i32 7, i32 4, i32 98} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!743 = metadata !{i32 786443, metadata !2, metadata !731, i32 335, i32 7, i32 3, i32 97} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!744 = metadata !{i32 336, i32 2, metadata !731, null}
!745 = metadata !{i32 336, i32 2, metadata !746, null}
!746 = metadata !{i32 786443, metadata !2, metadata !731, i32 336, i32 2, i32 1, i32 99} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!747 = metadata !{i32 342, i32 2, metadata !698, null}
!748 = metadata !{i32 342, i32 2, metadata !749, null}
!749 = metadata !{i32 786443, metadata !2, metadata !698, i32 342, i32 2, i32 1, i32 100} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!750 = metadata !{i32 342, i32 2, metadata !751, null}
!751 = metadata !{i32 786443, metadata !2, metadata !698, i32 342, i32 2, i32 2, i32 101} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!752 = metadata !{i32 342, i32 2, metadata !753, null}
!753 = metadata !{i32 786443, metadata !2, metadata !754, i32 342, i32 2, i32 4, i32 103} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!754 = metadata !{i32 786443, metadata !2, metadata !698, i32 342, i32 2, i32 3, i32 102} ; [ DW_TAG_lexical_block ] [/home/sslee/work/regen/test/mibench/network/patricia/patricia.c]
!755 = metadata !{i32 343, i32 1, metadata !698, null}
