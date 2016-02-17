Overview: 
	Failure-Safe Software Transactional Memory(F-STM)
This libraries gurantee transaction's acid(atomicity, consistency, isolation, durability) using software transactional memory(tinySTM).
This source codes are divided two platform(x86,arm), so you can choice whatever your platform.

Source Tree: 

	F-STM_Library 
	|_arm(for tuna board) 
	  |_REDO
	  |_UNDO
	  |_F-STM_STM_SOURCE(tinySTM source includes f-stm)  
	|
	|
	|_x86(desktop) 
	  |
	  |_F-STM_LIBRARY
	    |_KV_tiny(execution files for testing performance)
   	    |_Library(HEAPO libraries includes f-stm interfaces) 
	  | 
	  |_F-STM_STM_SOURCE(tinySTM source includes f-stm)

