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
#include "../dw/table.hh"
#include "../dw/tablecell.hh"



//////////[POS] added by JCH/////////////////
#include "../dw/widget.hh"
#include <pos-lib.h>
#include "../myconfig.h"


using namespace dw;
using namespace dw::core;
using namespace dw::core::style;
using namespace dw::fltk;

int main(int argc, char **argv)
{


   char __mode;
   FILE *fp_mode;
   
   ////////////////[POS]modified by JCH/////////////////
   //-------------------------------------------------//
   //         |load config from file mode.txt|   	  //
   //         |pos_create or pos_map is done by this| //
   //-------------------------------------------------//
   
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

   ::fltk::Window *window = new ::fltk::Window(300, 300, "Dw Table");
   window->begin();

   FltkViewport *viewport = new FltkViewport (0, 0, 300, 300);
   layout->attachView (viewport);

   StyleAttrs styleAttrs;
   styleAttrs.initValues ();
   styleAttrs.margin.setVal (5);
   styleAttrs.padding.setVal (0);
   styleAttrs.borderWidth.setVal (1);
   styleAttrs.setBorderStyle (BORDER_OUTSET);
   styleAttrs.setBorderColor (Color::create (layout, 0xffffff));
   styleAttrs.color = Color::create (layout, 0x000000);
   styleAttrs.backgroundColor = Color::create (layout, 0xffffff);
   styleAttrs.hBorderSpacing = 5;
   styleAttrs.vBorderSpacing = 5;

   FontAttrs fontAttrs;
   fontAttrs.name = "Bitstream Charter";
   fontAttrs.size = 14;
   fontAttrs.weight = 400;
   fontAttrs.style = FONT_STYLE_NORMAL;
   fontAttrs.letterSpacing = 0;
   styleAttrs.font = Font::create (layout, &fontAttrs);

   Style *tableStyle = Style::create (layout, &styleAttrs);

   Table *table; 
   Table *_table; 
   dw::core::Widget *widget;
   Textblock *cell;
   Textblock *_cell;
if(___mode ==0)
   table = new Table (false);
else if (___mode == 1)
{
   _table = new Table (false);
   table = (Table *)pos_malloc(__POS_OBJ_NAME, sizeof(Table) );
   memcpy(table, _table, sizeof(Table) );
}

if(___mode != 2)   
   table->setStyle (tableStyle);

if(___mode == 2)
{
   widget =(dw::core::Widget *)pos_get_prime_object(__POS_OBJ_NAME);
   widget->printAll();
   table = (Table*)widget;
}  

   layout->setWidget (table);
   
if(___mode !=2)
{
   tableStyle->unref();

   styleAttrs.setBorderStyle (BORDER_INSET);
   styleAttrs.backgroundColor = NULL;
   styleAttrs.margin.setVal (0);
   styleAttrs.padding.setVal (5);

   Style *cellStyle = Style::create (layout, &styleAttrs);

   styleAttrs.borderWidth.setVal (0);
   styleAttrs.margin.setVal (0);
   styleAttrs.cursor = CURSOR_TEXT;
   styleAttrs.textAlignChar = '.';

   Style *wordStyle = Style::create (layout, &styleAttrs);

   for (int i = 0; i < 4; i++) {
      table->addRow (wordStyle);

      for (int j = 0; j < 4; j++) {
	  	 if(___mode ==0)
	         cell = new Textblock (false);
		 else if(___mode ==1)
		 {
			 _cell = new Textblock (false);
			 cell = (Textblock *)pos_malloc(__POS_OBJ_NAME, sizeof(Textblock) );
			 memcpy(cell, _cell, sizeof(Textblock) );
		 }
         cell->setStyle (cellStyle);
         table->addCell (cell, 1, 1);

         char buf[10];
         sprintf (buf, "cell %c", 'A' + 4 * i + j);

         cell->addText (buf, wordStyle);
         cell->flush ();
      }
   }

   wordStyle->unref();
   cellStyle->unref();
 
   widget = table;
   

}

   if(___mode == 1)
   		pos_set_prime_object(__POS_OBJ_NAME, widget);



   widget->printAll();
   window->resizable(viewport);
   window->show();
   int errorCode = ::fltk::run();

   delete layout;

   return errorCode;
}
