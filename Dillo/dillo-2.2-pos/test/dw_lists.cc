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



#include <fltk/Window.h>
#include <fltk/run.h>

#include "../dw/core.hh"
#include "../dw/fltkcore.hh"
#include "../dw/fltkviewport.hh"
#include "../dw/textblock.hh"
#include "../dw/listitem.hh"

//POS[JCH]
#include <pos-lib.h>
#include <../myconfig.h>

using namespace dw;
using namespace dw::core;
using namespace dw::core::style;
using namespace dw::fltk;

int main(int argc, char **argv)
{

   ////////////////[POS]modified by JCH/////////////////
   //-------------------------------------------------//
   //         |load config from file mode.txt|   	  //
   //         |pos_create or pos_map is done by this| //
   //-------------------------------------------------//
   FILE* fp_mode;
   char __mode;
   fp_mode = fopen("../mode.txt","r+");
   //fp_mode= fopen("/root/work/dillo-last/mode.txt","r+");
   fscanf(fp_mode,"%c",&__mode);
   ___mode = __mode + 0 -'0';
   printf("mode: %d\n",___mode);

   fscanf(fp_mode,"%s",__POS_OBJ_NAME);
   printf("object_name: %s\n",__POS_OBJ_NAME);

   if(___mode ==1)
   {
		printf("pos_create returns %d\n", pos_create(__POS_OBJ_NAME) );		
   }
   else if(___mode == 2)
   	{
		printf("pos_map returns %d\n",pos_map(__POS_OBJ_NAME) );
   	}

   fclose(fp_mode);   
   /////////// end of load from file/////////////////


   
   FltkPlatform *platform = new FltkPlatform ();
   Layout *layout = new Layout (platform);

   ::fltk::Window *window = new ::fltk::Window(200, 300, "Dw Lists");
   window->begin();

   FltkViewport *viewport = new FltkViewport (0, 0, 200, 300);
   layout->attachView (viewport);


   StyleAttrs styleAttrs;
   styleAttrs.initValues ();
   styleAttrs.margin.setVal (5);

   FontAttrs fontAttrs;
   fontAttrs.name = "Bitstream Charter";
   fontAttrs.size = 14;
   fontAttrs.weight = 400;
   fontAttrs.style = FONT_STYLE_NORMAL;
   fontAttrs.letterSpacing = 0;
   styleAttrs.font = Font::create (layout, &fontAttrs);

   styleAttrs.color = Color::create (layout, 0x000000);
   styleAttrs.backgroundColor = Color::create (layout, 0xffffff);

   Style *widgetStyle = Style::create (layout, &styleAttrs);
 

   //POS[JCH]
   Textblock *textblock;
   Textblock *_textblock;   

   if(___mode == 0)
	   textblock = new Textblock (false);
   else if(___mode ==1)
   {
	   _textblock = new Textblock (false);
	   textblock = (Textblock*) pos_malloc(__POS_OBJ_NAME, sizeof(Textblock) );
	   memcpy(textblock, _textblock, sizeof(Textblock) );
	   pos_set_prime_object(__POS_OBJ_NAME, textblock);	   
   }

   if(___mode ==2)
   		textblock = (Textblock *)pos_get_prime_object(__POS_OBJ_NAME);
   if(___mode ==0 || ___mode == 1)  
   {
     	   textblock->setStyle (widgetStyle);
   }
 
   layout->setWidget (textblock);

printf("after layout->setWidget\n");

   widgetStyle->unref();
printf("after unref\n");

   styleAttrs.margin.setVal (0);
   styleAttrs.backgroundColor = NULL;
   styleAttrs.cursor = CURSOR_TEXT;

   Style *wordStyle = Style::create (layout, &styleAttrs);

   styleAttrs.margin.setVal (5);
   styleAttrs.padding.setVal (5);
   styleAttrs.backgroundColor = Color::create (layout, 0xffff40);
   styleAttrs.setBorderColor (Color::create (layout, 0x000000));
   styleAttrs.setBorderStyle (BORDER_SOLID);
   styleAttrs.borderWidth.setVal (1);

   Style *itemStyle = Style::create (layout, &styleAttrs);

   const char *wordsPar[] = {
      "This", "is", "a", "normal", "paragraph.", "And",
      "some", "list", "items", "follow:", NULL };
   const char *wordsItem[] = {
      "This", "is", "a", "list", "item.", "Here",
      "comes", "some", "more", "text", "to",
      "demonstrate", "word", "wrapping.", NULL };

if(___mode != 2)
{
   for(int i = 0; wordsPar[i]; i++) {
      if(i != 0)
         textblock->addSpace (wordStyle);
      textblock->addText (wordsPar[i], wordStyle);
   }
   textblock->addParbreak (5, wordStyle);
}

   ListItem *refItem = NULL;

   ListItem *listItem;
   ListItem *_listItem;	  

if(___mode !=2)
{
   //for(int i = 1; i <= 100; i++) {
   for(int i = 1; i <= 3; i++) {
   	  if(___mode ==0)
	      listItem = new ListItem (refItem, false);
	  else if(___mode ==1)
	  {
	      _listItem = new ListItem (refItem, false);
		  listItem = (ListItem *)pos_malloc(__POS_OBJ_NAME, sizeof(ListItem) );
		  memcpy(listItem, _listItem, sizeof(ListItem) );
	  }
      refItem = listItem;

      textblock->addWidget (listItem, itemStyle);
      //textblock->addParbreak (2, wordStyle);

      char buf[16];
      sprintf (buf, "%d.", i);
      listItem->initWithText (buf, wordStyle);

      for(int j = 0; wordsItem[j]; j++) {
         if(j != 0)
            listItem->addSpace (wordStyle);
         listItem->addText (wordsItem[j], wordStyle);
      }

      listItem->flush ();
   }

   wordStyle->unref();

   textblock->flush ();
}

   textblock->printAll();
   
   window->resizable(viewport);
   window->show();
   int errorCode = ::fltk::run();

   delete layout;

   return errorCode;
}
