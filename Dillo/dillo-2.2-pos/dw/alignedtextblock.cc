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



#include "alignedtextblock.hh"
#include <stdio.h>



// POS (Changhun Jung)
#include <pos-lib.h>
#include <../myconfig.h>


namespace dw {

AlignedTextblock::List::List ()
{
   // POS (Changhun Jung)
   lout::misc::SimpleVector <AlignedTextblock*> *_textblocks;
   lout::misc::SimpleVector <int> *_values;
   
   if(___mode == 0)// POS (Changhun Jung)
   {
	   textblocks = new lout::misc::SimpleVector <AlignedTextblock*> (4);
	   values = new lout::misc::SimpleVector <int> (4);
   }


   // POS (Changhun Jung)
   else if(___mode == 1)
   {    
	   _textblocks = new lout::misc::SimpleVector <AlignedTextblock*> (4);
	   _values = new lout::misc::SimpleVector <int> (4);

	   textblocks = (lout::misc::SimpleVector <AlignedTextblock*> *)pos_malloc(__POS_OBJ_NAME, sizeof(lout::misc::SimpleVector <AlignedTextblock*>) );
	   values = (lout::misc::SimpleVector <int> *)pos_malloc(__POS_OBJ_NAME,sizeof(lout::misc::SimpleVector <int>) );
	   
	   memcpy(textblocks, _textblocks, sizeof(lout::misc::SimpleVector <AlignedTextblock*>) );
	   memcpy(values, _values, sizeof(lout::misc::SimpleVector <int>) );	
	   
	   textblocks->set_IsPos(1);
	   values->set_IsPos(1);
   }
	

   
   maxValue = 0;
   refCount = 0;
}

AlignedTextblock::List::~List ()
{
   
   if(___mode ==0)// POS (Changhun Jung)
   {
	   delete textblocks;
	   delete values;
   }
}

int AlignedTextblock::List::add(AlignedTextblock *textblock)
{
   textblocks->increase ();
   values->increase ();
   textblocks->set (textblocks->size () - 1, textblock);
   refCount++;
   return textblocks->size () - 1;
}

void AlignedTextblock::List::unref(int pos)
{
   assert (textblocks->get (pos) != NULL);
   textblocks->set (pos, NULL);
   refCount--;

   if (refCount == 0)
      delete this;
}

int AlignedTextblock::CLASS_ID = -1;

AlignedTextblock::AlignedTextblock (bool limitTextWidth):
   Textblock (limitTextWidth)
{
   registerName ("dw::AlignedTextblock", &CLASS_ID);
}

void AlignedTextblock::setRefTextblock (AlignedTextblock *ref)
{

   
   List* _list;// POS (Changhun Jung)
   
   if (ref == NULL)
   {
   	  if( ___mode == 0)// POS (Changhun Jung)   	  	
	      list = new List();   	
	  
	  // POS (Changhun Jung)
	  else if(___mode ==1)
	  {
		  _list = new List();
		  list = (List *)pos_malloc(__POS_OBJ_NAME, sizeof(List) );		  
		  memcpy(list, _list, sizeof(List) );
	  }	  	  
   }

  
   else
      list = ref->list;

   listPos = list->add (this);
   updateValue ();
}

AlignedTextblock::~AlignedTextblock()
{

   if(___mode == 0)// POS (Changhun Jung)
	   list->unref (listPos);
   
}

void AlignedTextblock::updateValue ()
{
   if (list) {
      list->setValue (listPos, getValue ());

      if (list->getValue (listPos) > list->getMaxValue ()) {
         // New value greater than current maximum -> apply it to others.
         list->setMaxValue (list->getValue (listPos));

         for (int i = 0; i < list->size (); i++)
            if (list->getTextblock (i))
               list->getTextblock (i)->setMaxValue (list->getMaxValue (),
                                                    list->getValue (i));
      } else {
         /* No change, apply old max_value only to this page. */
         setMaxValue (list->getMaxValue (), list->getValue (listPos));
      }
   }
}

} // namespace dw
