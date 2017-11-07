/*
 * Dillo Widget
 *
 * Copyright 2005-2007 Sebastian Geerken <sgeerken@dillo.org>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */



#include "misc.hh"

#include <ctype.h>
#include <config.h>

// POS (Changhun Jung)
#include <pos-lib.h>
#include "../myconfig.h"


#define PRGNAME PACKAGE "/" VERSION

namespace lout {

namespace misc {

const char *prgName = PRGNAME;

void init (int argc, char *argv[])
{
   prgName = strdup (argv[0]);
}

// ----------------
//    Comparable
// ----------------

Comparable::~Comparable()
{
}

/**
 * \brief This static method may be used as compare function for qsort(3), for
 *    an array of Object* (Object*[] or Object**).
 */
int Comparable::compareFun(const void *p1, const void *p2)
{
   Comparable **c1 = (Comparable**)p1;
   Comparable **c2 = (Comparable**)p2;
   if (c1 && c2)
      return ((*c1)->compareTo(*c2));
   else if (c1)
      return 1;
   else if (c2)
      return -1;
   else
      return 0;
}


// ------------------
//    StringBuffer
// ------------------


StringBuffer::StringBuffer()
{
   firstNode = lastNode = NULL;
   numChars = 0;
   str = NULL;
   strValid = false;
}

StringBuffer::~StringBuffer()
{
   clear ();
   if (str)
      delete[] str;
}

/**
 * \brief Append a NUL-terminated string to the buffer, without copying.
 *
 * No copy is made, so this method should only be used in cases, where
 * the string would otherwise be freed again. (This method may then
 * save some CPU cycles.)
 */
void StringBuffer::appendNoCopy(char *str)
{
   Node *node = new Node();
   node->data = str;
   node->next = NULL;

   if (firstNode == NULL) {
      firstNode = node;
      lastNode = node;
   } else {
      lastNode->next = node;
      lastNode = node;
   }

   numChars += strlen(str);
   strValid = false;
}

/**
 * \brief Return a NUL-terminated strings containing all appended strings.
 *
 * The caller does not have to free the string, this is done in
 * misc::StringBuffer::~StringBuffer.
 */
const char *StringBuffer::getChars()
{
   if (strValid)
      return str;

   if (str)
      delete[] str;
   str = new char[numChars + 1];
   char *p = str;

   for (Node *node = firstNode; node; node = node->next) {
      int l = strlen(node->data);
      memcpy(p, node->data, l * sizeof(char));
      p += l;
   }

   *p = 0;
   strValid = true;
   return str;
}

/**
 * \brief Remove all strings appended to the string buffer.
 */
void StringBuffer::clear ()
{
   Node *node, *nextNode;
   for (node = firstNode; node; node = nextNode) {
      nextNode = node->next;
      delete node->data;
      delete node;
   }
   firstNode = lastNode = NULL;
   numChars = 0;
   strValid = false;
}


// ------------
//    BitSet
// ------------

BitSet::BitSet(int initBits)
{
	//printf("Bitset 1\n"); // POS (Changhun Jung)
   IsPos = 0;
   numBytes = bytesForBits(initBits);
   bits = (unsigned char*)malloc(numBytes * sizeof(unsigned char));
   clear();
	//printf("Bitset 1 -END- \n"); // POS (Changhun Jung)   
}

BitSet::~BitSet()
{
  //if (___mode == 0)
  	free(bits);
  //else if (___mode == 1)
  //pos_free(__POS_OBJ_NAME, bits);
  
}

void BitSet::intoStringBuffer(misc::StringBuffer *sb)
{
   sb->append("[");
   for (int i = 0; i < numBytes; i++)
      sb->append(get(i) ? "1" : "0");
   sb->append("]");
}

bool BitSet::get(int i)
{
   if (8 * i >= numBytes)
      return false;
   else
      return bits[i / 8] & (1 << (i % 8));
}

void BitSet::set(int i, bool val)
{
	// POS (Changhun Jung)
	#if (DEBUG == 1)
		printf("BitSet::set\n"); 
	#endif

	
   if (8 * i >= numBytes) {
      int newNumBytes = numBytes;
      while (8 * i >= newNumBytes)
         newNumBytes *= 2;
#if 0	  
	  // POS (Changhun Jung)
	  if ((___mode == 1) && (this->IsPos == 1))
	  {
		  printf("BitSet::set pos realloc\n");	  
#if 0		  
	      bits =
	         (unsigned char*)pos_realloc(__POS_OBJ_NAME, bits, newNumBytes * sizeof(unsigned char));
#endif
#if 0		  
		  unsigned char *_bits = (unsigned char*)pos_malloc(__POS_OBJ_NAME, newNumBytes * sizeof(unsigned char));
		  memcpy(_bits, bits, newNumBytes * sizeof(unsigned char));
		  pos_free(__POS_OBJ_NAME, bits);
		  bits = _bits;
#endif		  

#if 1		  
		  unsigned char *_bits = (unsigned char*)malloc(newNumBytes * sizeof(unsigned char));
		  memcpy(_bits, bits, newNumBytes * sizeof(unsigned char));
		  bits = _bits;
#endif		  

		  printf("pos realloc -END-\n");	  
	  }
#endif	  
	  //else 
	  //{
		  //printf("BitSet::set realloc\n");	  
		  bits =
	         (unsigned char*)realloc(bits, newNumBytes * sizeof(unsigned char));
		  //printf("BitSet::set realloc -END-\n");
	  //}

	  
      memset(bits + numBytes, 0, newNumBytes - numBytes);
      numBytes = newNumBytes;
   }

   if (val)
      bits[i / 8] |= (1 << (i % 8));
   else
      bits[i / 8] &= ~(1 << (i % 8));
   #if (DEBUG == 1)
	printf("BitSet::set -END-\n"); // POS (Changhun Jung)
   #endif
}

void BitSet::clear()
{
   memset(bits, 0, numBytes);
}

} // namespace misc

} // namespace lout
