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
#include <stdio.h>
#include "../dw/widget.hh"
#include "../dw/table.hh"
#include "../dw/tablecell.hh"

//char __POS_OBJ_NAME[100];

int main(int argc, char **argv)
{

   FILE* fp_mode;
   char __mode;
   

   ////////////////[POS]modified by JCH/////////////////
   //-------------------------------------------------//
   //         |load config from file mode.txt|   	  //
   //-------------------------------------------------//
   fp_mode= fopen("/root/work/dillo-last2/mode.txt","r+");

   fscanf(fp_mode,"%c",&__mode);
   ___mode = __mode + 0 - '0';
   //___mode = *argv[2] + 0 -'0';
   printf("mode: %d \n",___mode);

   fscanf(fp_mode,"%s",__POS_OBJ_NAME);	
   printf("__POS_OBJ_NAME: %s\n",__POS_OBJ_NAME);  

   fclose(fp_mode);
/*
   if(___mode == 1)
   {
		printf("pos_create returns %d \n", pos_create(__POS_OBJ_NAME));		
   }
   else if(___mode == 2)
   {
		printf("pos_map returns %d \n", pos_map(__POS_OBJ_NAME));		
   }   		
*/
   /////////// end of load from file/////////////////

 /*  
   
   if(argc != 2)
   {
	printf ("input one argument (for ___mode)\n");
	printf("nothing: 0\n");
	printf("create: 1\n");
	printf("map: 2\n");
	return 0;
   }
   
   sscanf(argv[1],"%d",&___mode);

*/


if(___mode == 1)
   printf("pos_create returns %d\n", pos_create(__POS_OBJ_NAME)); //added by POS [JCH]


   dw::fltk::FltkPlatform *platform = new dw::fltk::FltkPlatform ();
   dw::core::Layout *layout = new dw::core::Layout (platform);

   fltk::Window *window = new fltk::Window(200, 300, "Dw Example");
   window->begin();

   dw::fltk::FltkViewport *viewport =
      new dw::fltk::FltkViewport (0, 0, 200, 300);
   layout->attachView (viewport);



   dw::core::style::StyleAttrs *_styleAttrs;
   dw::core::style::StyleAttrs *styleAttrs;
 
   
    dw::core::style::FontAttrs *_fontAttrs;
   	dw::core::style::FontAttrs *fontAttrs;

	dw::core::style::Style *widgetStyle;
    dw::core::style::Style *wordStyle;

if(___mode ==0 || ___mode ==1)
{

////////////////////[POS] modified by JCH ////////////////////////////////
//----------------------------------------------------------------------//
//              |even if we do not save Attrs, it works|				//
//----------------------------------------------------------------------//

/*
 * I think there's no need to save Attrs
 */
 
/*
   if(___mode == 0)
   {
  	 _styleAttrs = new dw::core::style::StyleAttrs();
  	 styleAttrs = (dw::core::style::StyleAttrs*)pos_malloc(__POS_OBJ_NAME, sizeof(dw::core::style::StyleAttrs));
   	memcpy(styleAttrs, _styleAttrs,sizeof(dw::core::style::StyleAttrs));
   
  	 _fontAttrs = new dw::core::style::FontAttrs();
   	fontAttrs = (dw::core::style::FontAttrs*)pos_malloc(__POS_OBJ_NAME,sizeof(dw::core::style::FontAttrs));
   	memcpy(fontAttrs, _fontAttrs,sizeof(dw::core::style::FontAttrs));  
   }
*/

//   if(___mode == 1)
//   {
   	 styleAttrs = new dw::core::style::StyleAttrs();
   
  	 fontAttrs = new dw::core::style::FontAttrs();
//   }
   
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

   widgetStyle =
      dw::core::style::Style::create (layout, styleAttrs);
   
}

//////////////////modified by JCH////////////////////////////////////////
   //dw::Textblock *_textblock = new dw::Textblock (false);
   dw::Textblock *_textblock;
   dw::Textblock *textblock;
   
if(___mode ==0)
{
   textblock = new dw::Textblock (false);
   printf("new textblock\n");
}
////////////////////////modified by POS JCH///////////////////////////////////
else if (___mode ==1 || ___mode == 2)
{
printf("in POS_MODE\n");
 if(___mode ==1)
 {
   _textblock = new dw::Textblock (false);
   //printf("pos_create returns %d\n", pos_create(__POS_OBJ_NAME));
   textblock = (dw::Textblock*)pos_malloc(__POS_OBJ_NAME,sizeof(dw::Textblock));

	 //printf("address of textblock: 0x%lX\n", (unsigned long)textblock);


   
   memcpy(textblock,_textblock,sizeof(dw::Textblock));
   delete _textblock;
   pos_set_prime_object(__POS_OBJ_NAME,textblock);
 }

 if(___mode == 2)
 {
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
   //printf("widget->parentRef: 0x%lX\n",(unsigned long)&(((dw::core::Widget*)textblock)->parentRef));
 }
}

   
if(___mode !=2)
   textblock->setStyle (widgetStyle);


/*
#ifdef __MAP
//printf("before setStyle\n");
   textblock->setStyle (textblock->getStyle());
#endif
*/
printf("before printWord\n");
if(___mode == 2)
	textblock->printWord(0);

////////////////////////[POS] added by JCH//////////////////////////
/*
 * checking address of style
 */
/*
printf("\n-------------- address of style--------------\n"); 
printf("&style: 0x%lX\n", (unsigned long)textblock->getStyle());
printf("&style->font: 0x%lX\n", (unsigned long)textblock->getStyle()->font);
printf("style->font->weight: %d\n", textblock->getStyle()->font->weight);
printf("&style->color: 0x%lX\n", (unsigned long)textblock->getStyle()->color);
printf("&style->bgColor: 0x%lX\n", (unsigned long)textblock->getStyle()->backgroundColor);
printf("\n");
*/


//printf("before setWidget\n");
//printf("address of textblock: %X\n",textblock);
int brk;
//printf("break before setWidget\n");
//scanf("%d",&brk);

layout->setWidget (textblock);
//printf("after setWidget\n");

if(___mode !=2)
{
   widgetStyle->unref();

   styleAttrs->margin.setVal (0);
   styleAttrs->backgroundColor = NULL;

   wordStyle =
      dw::core::style::Style::create (layout, styleAttrs);
}

/*
#ifdef __MAP
	styleTable->put (wordStyle, wordStyle);
#endif
*/

if(___mode !=2)
{
   //for(int i = 1; i <= 10; i++) {
   for(int i = 1; i <= 1; i++) {
      char buf[4];
      sprintf(buf, "%d.", i);

      const char *words[] = { "This", "is", "the", buf, "paragraph.",
                              "Here", "comes", "some", "more", "text",
                              "to", "demonstrate", "word", "wrapping.",
                              NULL };

      for(int j = 0; words[j]; j++) {
      //for(int j = 0; j < 1 ; j++) {
	 //printf("before addText\n");
         textblock->addText(words[j], wordStyle);
	 //printf("after addText\n");
         textblock->addSpace(wordStyle);
      }

      //textblock->addParbreak(10, wordStyle);
   }
   wordStyle->unref();
 }

//textblock->printAll(0);//[POS]added by JCH
dw::core::Widget *widget = textblock;
widget->printAll();
printf("before flush\n");
   //textblock->printWord(0);
   //textblock->flush ();

   //window->resizable(viewport);
printf("before show\n");
   window->show();
printf("before run\n"); 
   int errorCode = fltk::run();


   //delete layout;

if(___mode == 1|| ___mode ==2)
{
   //printf("&textblock: 0x%lX \n",(unsigned long)textblock);
   //printf("widget->parentRef: %d\n",((dw::core::Widget*)textblock)->parentRef);
   //printf("widget->parentRef: 0x%lX\n",(unsigned long)&(((dw::core::Widget*)textblock)->parentRef));
   //printf("widget->: %d\n",((dw::core::Widget*)textblock)->parentRef);
   //textblock->printAddress();
   pos_unmap(__POS_OBJ_NAME);
}

   return errorCode;
}
