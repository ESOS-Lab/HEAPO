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

#include <pos-lib.h>
#include "../myconfig.h"

int main(int argc, char **argv)
{

#ifdef __CREATE
   printf("pos_create returns %d\n", pos_create(__POS_OBJ_NAME)); //added by POS [JCH]
#endif

   dw::fltk::FltkPlatform *platform = new dw::fltk::FltkPlatform ();
   dw::core::Layout *layout = new dw::core::Layout (platform);

   fltk::Window *window = new fltk::Window(200, 300, "Dw Example");
   window->begin();

   dw::fltk::FltkViewport *viewport =
      new dw::fltk::FltkViewport (0, 0, 200, 300);
   layout->attachView (viewport);


#ifndef __MAP

   #ifdef __CREATE
   dw::core::style::StyleAttrs *_styleAttrs = new dw::core::style::StyleAttrs();
   dw::core::style::StyleAttrs *styleAttrs = (dw::core::style::StyleAttrs*)pos_malloc(__POS_OBJ_NAME, sizeof(dw::core::style::StyleAttrs));
   memcpy(styleAttrs, _styleAttrs,sizeof(dw::core::style::StyleAttrs));
   
   dw::core::style::FontAttrs *_fontAttrs = new dw::core::style::FontAttrs();
   dw::core::style::FontAttrs *fontAttrs = (dw::core::style::FontAttrs*)pos_malloc(__POS_OBJ_NAME,sizeof(dw::core::style::FontAttrs));
   memcpy(fontAttrs, _fontAttrs,sizeof(dw::core::style::FontAttrs));  
   #endif

   #ifndef __CREATE
   dw::core::style::StyleAttrs *styleAttrs = new dw::core::style::StyleAttrs();
   
   dw::core::style::FontAttrs *fontAttrs = new dw::core::style::FontAttrs();
   #endif
   
   styleAttrs->initValues ();
   styleAttrs->margin.setVal (5);
   
   fontAttrs->name = "Bitstream Charter";
   fontAttrs->size = 14;
   fontAttrs->weight = 400;
   fontAttrs->style = dw::core::style::FONT_STYLE_NORMAL;
   fontAttrs->letterSpacing = 0;
   
   
   styleAttrs->font = dw::core::style::Font::create (layout, fontAttrs);

   styleAttrs->color =
      dw::core::style::Color::create (layout, 0x000000);
   styleAttrs->backgroundColor =
      dw::core::style::Color::create (layout, 0xffffff);

   dw::core::style::Style *widgetStyle =
      dw::core::style::Style::create (layout, styleAttrs);
   

#endif

//////////////////modified by JCH////////////////////////////////////////
   //dw::Textblock *_textblock = new dw::Textblock (false);
   dw::Textblock *_textblock;
   dw::Textblock *textblock;
#ifndef __POS_MODE
   textblock = new dw::Textblock (false);
   printf("new textblock\n");
#endif
////////////////////////modified by POS JCH///////////////////////////////////
#ifdef __POS_MODE
printf("in POS_MODE\n");
 #ifdef __CREATE
   _textblock = new dw::Textblock (false);
   //printf("pos_create returns %d\n", pos_create(__POS_OBJ_NAME));
   textblock = (dw::Textblock*)pos_malloc(__POS_OBJ_NAME,sizeof(dw::Textblock));

	 printf("address of textblock: 0x%lX\n", (unsigned long)textblock);


   
   memcpy(textblock,_textblock,sizeof(dw::Textblock));
   delete _textblock;
   pos_set_prime_object(__POS_OBJ_NAME,textblock);
   
 #endif

 #ifdef __MAP
   if(pos_map(__POS_OBJ_NAME) == 0)
   {
	printf("pos_map error in dw-example\n");
	return 0;
   }
   
     
   textblock = (dw::Textblock*)pos_get_prime_object(__POS_OBJ_NAME);
   printf("address of textblock: 0x%lX\n", (unsigned long)textblock);   
   //p = &(((dw::core::Widget)textblock)->setWidth);   
   //printf("&(widget->setWidget) : %p\n",p);
   //textblock->printAddress();
   printf("widget->parentRef: 0x%lX\n",(unsigned long)&(((dw::core::Widget*)textblock)->parentRef));
 #endif
#endif

   
#ifndef __MAP
//printf("before setStyle\n");
   textblock->setStyle (widgetStyle);
#endif

/*
#ifdef __MAP
//printf("before setStyle\n");
   textblock->setStyle (textblock->getStyle());
#endif
*/
#ifdef __MAP



textblock->printWord(0);

#endif


printf("before setWidget\n");
printf("address of textblock: %X\n",textblock);
   int brk;
   printf("break before setWidget\n");
   scanf("%d",&brk);
   layout->setWidget (textblock);
printf("after setWidget\n");

#ifndef __MAP
   widgetStyle->unref();

   styleAttrs->margin.setVal (0);
   styleAttrs->backgroundColor = NULL;

   dw::core::style::Style *wordStyle =
      dw::core::style::Style::create (layout, styleAttrs);

#endif

/*
#ifdef __MAP
	styleTable->put (wordStyle, wordStyle);
#endif
*/

#ifndef __MAP
   //for(int i = 1; i <= 10; i++) {
   for(int i = 1; i <= 1; i++) {
      char buf[4];
      sprintf(buf, "%d.", i);

      const char *words[] = { "This", "is", "the", buf, "paragraph.",
                              "Here", "comes", "some", "more", "text",
                              "to", "demonstrate", "word", "wrapping.",
                              NULL };

      //for(int j = 0; words[j]; j++) {
      for(int j = 0; j < 1 ; j++) {
	 //printf("before addText\n");
         textblock->addText(words[j], wordStyle);
	 //printf("after addText\n");
         //textblock->addSpace(wordStyle);
      }

      //textblock->addParbreak(10, wordStyle);
   }
   wordStyle->unref();
 


#endif

printf("before flush\n");
   //textblock->printWord(0);
   textblock->flush ();

   //window->resizable(viewport);
printf("before show\n");
   window->show();
   int errorCode = fltk::run();


   //delete layout;

#ifdef __POS_MODE
   //printf("&textblock: 0x%lX \n",(unsigned long)textblock);
   //printf("widget->parentRef: %d\n",((dw::core::Widget*)textblock)->parentRef);
   //printf("widget->parentRef: 0x%lX\n",(unsigned long)&(((dw::core::Widget*)textblock)->parentRef));
   //printf("widget->: %d\n",((dw::core::Widget*)textblock)->parentRef);
   //textblock->printAddress();
   pos_unmap(__POS_OBJ_NAME);
#endif

   return errorCode;
}
