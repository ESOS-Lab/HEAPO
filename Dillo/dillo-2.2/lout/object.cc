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



#include "object.hh"
#include <stdio.h>

namespace lout {

namespace object {

// ------------
//    Object
// ------------

/**
 * \brief The destructor is defined as virtual (but not abstract), so that
 *    destruction of Object's works properly.
 */
Object::~Object()
{
}

/**
 * \brief Returns, whether two objects are equal.
 *
 * The caller should ensure, that this and the object have the same class;
 * this makes casting of "other" safe. Typically, an implementation should
 * check this == other first, the caller can assume a fast implementation.
 */
bool Object::equals(Object *other)
{
   misc::assertNotReached ();
   return false;
}

/**
 * \brief Return a hash value for the object.
 */
int Object::hashValue()
{
   fprintf (stderr, "Object::hashValue() should be implemented.\n");
   return 0;
}

/**
 * \brief Return an exact copy of the object.
 */
Object *Object::clone()
{
   misc::assertNotReached ();
   return NULL;
}

/**
 * \brief Use object::Object::intoStringBuffer to return a textual
 *    representation of the object.
 *
 * The caller does not have to free the memory, object::Object is responsible
 * for this.
 */
const char *Object::toString()
{
   /** \todo garbage! */
   misc::StringBuffer sb;
   intoStringBuffer(&sb);
   char *s = strdup(sb.getChars());
   return s;
}

/**
 * \brief Store a textual representation of the object in a misc::StringBuffer.
 *
 * This is used by object::Object::toString.
 */
void Object::intoStringBuffer(misc::StringBuffer *sb)
{
   sb->append("<not further specified object>");
}

/**
 * \brief Return the number of bytes, this object totally uses.
 */
size_t Object::sizeOf()
{
   fprintf (stderr, "Object::sizeOf() should be implemented.\n");
   return sizeof(Object*);
}

// -------------
//    Pointer
// -------------

bool Pointer::equals(Object *other)
{
   return value == ((Pointer*)other)->value;
}

int Pointer::hashValue()
{
/* For some unknown reason, this doesn't compile on some 64bit platforms:
 *
 *  if (sizeof (int) == sizeof (void*))
 *     return (int)value;
 *  else
 *     return ((int*)value)[0] ^ ((int*)value)[1];
 */
#if SIZEOF_VOID_P == 4
   return (int)value;
#else
   return ((int*)value)[0] ^ ((int*)value)[1];
#endif
}

void Pointer::intoStringBuffer(misc::StringBuffer *sb)
{
   char buf[64];
   snprintf(buf, sizeof(buf), "0x%p", value);
   sb->append(buf);
}

// -------------
//    Integer
// -------------

bool Integer::equals(Object *other)
{
   return value == ((Integer*)other)->value;
}

int Integer::hashValue()
{
   return (int)value;
}

void Integer::intoStringBuffer(misc::StringBuffer *sb)
{
   char buf[64];
   sprintf(buf, "%d", value);
   sb->append(buf);
}

int Integer::compareTo(Comparable *other)
{
   return value - ((Integer*)other)->value;
}

// -----------------
//    ConstString
// -----------------

bool ConstString::equals(Object *other)
{
   ConstString *otherString = (ConstString*)other;
   return
      this == other ||
      (str == NULL && otherString->str == NULL) ||
      (str != NULL && otherString->str != NULL &&
       strcmp(str, otherString->str) == 0);
}

int ConstString::hashValue()
{
  return hashValue(str);
}


int ConstString::compareTo(Comparable *other)
{
   String *otherString = (String*)other;
   if (str && otherString->str)
      return strcmp(str, otherString->str);
   else if (str)
      return 1;
   else if (otherString->str)
      return -1;
   else
      return 0;
}


int ConstString::hashValue(const char *str)
{
   if (str) {
      int h = 0;
      for (int i = 0; str[i]; i++)
         h = (h * 256 + str[i]);
      return h;
   } else
      return 0;
}

void ConstString::intoStringBuffer(misc::StringBuffer *sb)
{
   sb->append(str);
}

// ------------
//    String
// ------------

String::String (const char *str): ConstString (str ? strdup(str) : NULL)
{
}

String::~String ()
{
  if (str)
    delete str;
}

// ------------
//    Pair
// ------------

PairBase::PairBase(Object *first, Object *second)
{
   this->first = first;
   this->second = second;
}

PairBase::~PairBase()
{
   if (first)
      delete first;
   if (second)
      delete second;
}

bool PairBase::equals(Object *other)
{
   PairBase *otherPair = (PairBase*)other;

   return
      // Identical?
      this == other || (
      (// Both first parts are NULL, ...
         (first == NULL && otherPair->first == NULL) ||
         // ... or both first parts are not NULL and equal
         (first != NULL && otherPair->first != NULL
          && first->equals (otherPair->first))) &&
      // Same with second part.
      ((second == NULL && otherPair->second == NULL) ||
       (second != NULL && otherPair->second != NULL
        && second->equals (otherPair->second))));
}

int PairBase::hashValue()
{
   int value = 0;

   if (first)
      value ^= first->hashValue();
   if (second)
      value ^= second->hashValue();

   return value;
}

void PairBase::intoStringBuffer(misc::StringBuffer *sb)
{
   sb->append("<pair: ");

   if (first)
      first->intoStringBuffer(sb);
   else
      sb->append("(nil)");

   sb->append(",");

   if (second)
      second->intoStringBuffer(sb);
   else
      sb->append("(nil)");

   sb->append(">");
}

size_t PairBase::sizeOf()
{
   size_t size = 0;

   if (first)
      size += first->sizeOf();
   if (second)
      size += second->sizeOf();

   return size;
}

} // namespace object

} // namespace lout
