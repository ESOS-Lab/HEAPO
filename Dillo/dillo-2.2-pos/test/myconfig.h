#ifndef __MY_CONFIG
#define __MY_CONFIG


#define __JCH_READ 0
#define __JCH_WRITE 1

//#define JCH_MODE __JCH_READ
#define JCH_MODE __JCH_WRITE

	#if (JCH_MODE == __JCH_WRITE)
		#undef JCH_READ
		#define JCH_WRITE
	#endif

	#if (JCH_MODE == __JCH_READ)
		#define JCH_READ
		#undef JCH_WRITE
	#endif

#endif
