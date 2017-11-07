#ifndef __LOUT_MISC_HH__
#define __LOUT_MISC_HH__

#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

// pos (Changhun Jung)
#include <pos-lib.h>
#include "../myconfig.h"

/**
 * \brief Miscellaneous stuff, which does not fit anywhere else.
 *
 * Actually, the other parts, beginning with ::object, depend on this.
 */
namespace lout {

namespace misc {

template <class T> inline T min (T a, T b) { return a < b ? a : b; }
template <class T> inline T max (T a, T b) { return a > b ? a : b; }

template <class T> inline T min (T a, T b, T c)
{
   return (min (a, min (b, c)));
}
template <class T> inline T max (T a, T b, T c)
{
   return (max (a, max (b, c)));
}

extern const char *prgName;

void init (int argc, char *argv[]);

inline void assertNotReached ()
{
   fprintf (stderr, "*** [%s] This should not happen! ***\n", prgName);
   abort ();
}

/**
 * \brief Instances of a sub class of this interface may be compared (less,
 *    greater).
 *
 * Used for sorting etc.
 */
class Comparable
{
public:
    virtual ~Comparable();

   /**
    * \brief Compare two objects c1 and c2.
    *
    * return a value < 0, when c1 is less than c2, a value > 0, when c1
    * is greater than c2, or 0, when c1 and c2 are equal.
    *
    * If also object::Object is implemented, and if c1.equals(c2),
    * c1.compareTo(c2) must be 0, but, unlike you may expect,
    * the reversed is not necessarily true. This method returns 0, if,
    * according to the rules for sorting, there is no difference, but there
    * may still be differences (not relevant for sorting), which "equals" will
    * care about.
    */
   virtual int compareTo(Comparable *other) = 0;

   static int compareFun(const void *p1, const void *p2);
};

/**
 * \brief Simple (simpler than container::untyped::Vector and
 *    container::typed::Vector) template based vector.
 */
template <class T> class SimpleVector
{
private:

   T *array;
   int num, numAlloc;
   
   bool IsPos;// pos (Changhun Jung)

   inline void resize ()
   {

      /* This algorithm was tunned for memory&speed with this huge page:
       *   http://downloads.mysql.com/docs/refman-6.0-en.html.tar.gz
       */
       
      // pos (Changhun Jung)      
	  int tmp;
	  T *old_array;
	  #if (DEBUG == 1)
	  	printf("In resize\n");
	  #endif
	  
      if (array == NULL) {	  	 
         this->numAlloc = 1;

   		// pos (Changhun Jung)	   		   	
	   	//if(___mode == 0)
	   	if(___mode ==1 && IsPos)		
	   	{
	   		 this->array = (T*) pos_malloc (__POS_OBJ_NAME,sizeof (T));					
			if(this ->array == NULL)
		   	{
		   		 printf(" pos_malloc error\n");	 
		   		 return;
		   	}				 


   		 	 
	   	}

		
		   	
		else
		{	   	
			this->array = (T*) malloc (sizeof (T)); 
			if(this ->array == NULL)
		   	{
		   		 printf(" malloc error\n");	 
		   		 return;
		   	}				 

		}			
	  }
	   
	  if (this->numAlloc < this->num) {		  
		  tmp = numAlloc; // pos (Changhun Jung)
		  this->numAlloc = (this->num < 100) ?
		  this->num : this->num + this->num/10;
		  
		  // pos (Changhun Jung)
		  //if(___mode == 0)
		  if(___mode == 1 && IsPos)		  	
		  {  		    
			#if 0
				this->array =           
		  	(T*) pos_realloc(__POS_OBJ_NAME,this->array, (this->numAlloc * sizeof (T)));
			#endif
			
			#if 1		
				old_array = this->array;				 		
		   		this->array = (T*) pos_malloc (__POS_OBJ_NAME, (this->numAlloc * sizeof (T)) );										
				memcpy(this->array, old_array, (tmp * sizeof (T)));
				if(this ->array == NULL)
			   	{
			   		 printf(" pos_realloc error\n");	 
			   		 return;
			   	}						
			#endif				
				
		  }

		  
		  
		  else
		  {
				   #if 0
		           this->array =
		              (T*) realloc(this->array, (this->numAlloc * sizeof (T)));
				   #endif
				   #if 1
 					old_array = this->array;				 		
			   		this->array = (T*) malloc ((this->numAlloc * sizeof (T)) );										
					memcpy(this->array, old_array, (tmp * sizeof (T)));
					

					if(this ->array == NULL)
				   	{
				   		 printf(" realloc error\n");	 
				   		 return;
				   	}						
					//free(this->array);
				   #endif
		  }
	   
   	  }


	  // pos (Changhun Jung)
	  #if (DEBUG == 1)
	  	printf("resize -END-\n"); 
	  #endif
   }

public: // pos (Changhun Jung)
   inline SimpleVector (int initAlloc)
   {
      this->num = 0;
      this->numAlloc = initAlloc;
      this->array = NULL;

	  // pos (Changhun Jung)
	  this->IsPos = 0;
   }

   inline SimpleVector (const SimpleVector &o) {
      this->array = NULL;
      this->num = o.num;
      this->numAlloc = o.numAlloc;
	  
	  this-> IsPos = o.IsPos; // pos (Changhun Jung)
      resize ();
      memcpy (this->array, o.array, sizeof (T) * num);
   }
 
   inline ~SimpleVector ()
   {
#if 1    
    if(!IsPos) // pos (Changhun Jung)
    {
     if (this->array)
         free (this->array);
    }
#endif
   }

   /**
    * \brief Return the number of elements put into this vector.
    */
   inline int size() { return this->num; }

   inline T* getArray() { return array; }

   /**
    * \brief Increase the vector size by one.
    *
    * May be necessary before calling misc::SimpleVector::set.
    */
   inline void increase() { setSize(this->num + 1); }

   /**
    * \brief Set the size explicitely.
    *
    * May be necessary before calling misc::SimpleVector::set.
    */
   inline void setSize(int newSize) {
      assert (newSize >= 0);
	  //printf("setSize\n");
      this->num = newSize;
      this->resize ();
   }

   /**
    * \brief Set the size explicitely and initialize new values.
    *
    * May be necessary before calling misc::SimpleVector::set.
    */
   inline void setSize (int newSize, T t) {
      int oldSize = this->num;
	  //printf("setSize(d,d)\n");
      setSize (newSize);
      for (int i = oldSize; i < newSize; i++)
         set (i, t);
   }

   /**
    * \brief Return the reference of one element.
    *
    * \sa misc::SimpleVector::get
    */
   inline T* getRef (int i) {
      assert (i >= 0 && this->num - i > 0);
      return array + i;
   }

   /**
    * \brief Return the one element, explicitety.
    *
    * The element is copied, so for complex elements, you should rather used
    * misc::SimpleVector::getRef.
    */
   inline T get (int i) {
	  // POS (Changhun Jung)
	  //printf("get\n");
	  //if(i < 0)
	  //{		
		//intf("this->num: %d \n",this->num);
		//intf("break here\n");
		//anf("%d",&i);
	  //}
	  //#if (DEBUG == 1)
	  	//printf(" i: %d\n",i);
	  //#endif
	  
	  
      assert (i >= 0 && this->num - i > 0); 
      
      return this->array[i];
   }

   /**
    * \brief Store an object in the vector.
    *
    * Unlike in container::untyped::Vector and container::typed::Vector,
    * you have to care about the size, so a call to
    * misc::SimpleVector::increase or misc::SimpleVector::setSize may
    * be necessary before.
    */
   inline void set (int i, T t) {
      assert (i >= 0 && this->num - i > 0);
      this->array[i] = t;
   }

   // pos (Changhun Jung)   
   inline void _print(){
    printf("  address of array :0x%lX\n",(unsigned long)this->array);
    if(this->array == NULL){
		printf("array is NULL\n");
    }	
	printf("num: %d\nnumAlloc: %d\n",this->num,this->numAlloc);
   }
   
   // pos (Changhun Jung)
   inline void set_IsPos(bool IsPos)
   {
		this->IsPos = IsPos;
   }
  
};


/**
 * \brief A class for fast concatenation of a large number of strings.
 */
class StringBuffer
{
private:
   struct Node
   {
      char *data;
      Node *next;
   };

   Node *firstNode, *lastNode;
   int numChars;
   char *str;
   bool strValid;

public:
   StringBuffer();
   ~StringBuffer();

   /**
    * \brief Append a NUL-terminated string to the buffer, with copying.
    *
    * A copy is kept in the buffer, so the caller does not have to care
    * about memory management.
    */
   inline void append(const char *str) { appendNoCopy(strdup(str)); }
   void appendNoCopy(char *str);
   const char *getChars();
   void clear ();
};


/**
 * \brief A bit set, which automatically reallocates when needed.
 */
class BitSet
{
private:
   unsigned char *bits;
   int numBytes;

   inline int bytesForBits(int bits) { return bits == 0 ? 1 : (bits + 7) / 8; }

public:
   int IsPos;	
   BitSet(int initBits);
   inline BitSet(int initBits, int IsPos)
   {
	   //printf("Bitset2\n"); // POS (Changhun Jung)
	   this->IsPos = 1; // POS (Changhun Jung)
	   numBytes = bytesForBits(initBits);
	   //bits = (unsigned char*)pos_malloc(__POS_OBJ_NAME, numBytes * sizeof(unsigned char));	   
	   bits = (unsigned char*)malloc(numBytes * sizeof(unsigned char));	   
	   clear();
	   //printf("Bitset2 -END- \n"); // POS (Changhun Jung)     	   

   }
   ~BitSet();
   void intoStringBuffer(misc::StringBuffer *sb);
   bool get(int i);
   void set(int i, bool val);
   void clear();
   // POS (Changhun Jung)
   inline void copyBitsImpl()
   {
		unsigned char *_bits = (unsigned char *)pos_malloc(__POS_OBJ_NAME, numBytes * sizeof(unsigned char));
		memcpy(_bits, bits, numBytes * sizeof(unsigned char));
		bits = _bits;
   }
};

/**
 * \brief A simple allocator optimized to handle many small chunks of memory.
 * The chunks can not be free'd individually. Instead the whole zone must be
 * free'd with zoneFree().
 */
class ZoneAllocator
{
private:
   size_t poolSize, poolLimit, freeIdx;
   SimpleVector <char*> *pools;
   SimpleVector <char*> *bulk;

public:
   ZoneAllocator (size_t poolSize) {
      this->poolSize = poolSize;
      this->poolLimit = poolSize / 4;
      this->freeIdx = poolSize;
      this->pools = new SimpleVector <char*> (1);
      this->bulk = new SimpleVector <char*> (1);
   };

   ~ZoneAllocator () {
      zoneFree ();
      delete pools;
      delete bulk;
   }

   inline void * zoneAlloc (size_t t) {
      void *ret;

      if (t > poolLimit) {
         bulk->increase ();
         bulk->set (bulk->size () - 1, (char*) malloc (t));
		 printf("zoneAlloc\n"); // POS (Changhun Jung)
         return bulk->get (bulk->size () - 1);
      }

      if (t > poolSize - freeIdx) {
         pools->increase ();
         pools->set (pools->size () - 1, (char*) malloc (poolSize));
         freeIdx = 0;
      }

      ret = pools->get (pools->size () - 1) + freeIdx;
      freeIdx += t;
      return ret;
   }

   inline void zoneFree () {
      for (int i = 0; i < pools->size (); i++)
      {
         printf("zoneFree\n"); // POS (Changhun Jung)
         free (pools->get (i));
      }
	  //printf("zonefree\n");
      pools->setSize (0);
      for (int i = 0; i < bulk->size (); i++)
         free (bulk->get (i));
      bulk->setSize (0);
      freeIdx = poolSize;
   }

   inline const char *strndup (const char *str, size_t t) {
      char *new_str = (char *) zoneAlloc (t + 1);
      memcpy (new_str, str, t);
      new_str[t] = '\0';
      return new_str;
   }

   inline const char *strdup (const char *str) {
      return strndup (str, strlen (str));
   }
};

} // namespace misc

} // namespace lout

#endif // __LOUT_MISC_HH__
