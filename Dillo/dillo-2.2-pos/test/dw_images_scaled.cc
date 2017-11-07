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
#include "../dw/image.hh"

// POS (Changhun Jung)
#include <pos-lib.h>
#include "../myconfig.h"


using namespace dw;
using namespace dw::core;
using namespace dw::core::style;
using namespace dw::fltk;

static Layout *layout;
static Image *image;
static core::Imgbuf *imgbuf = NULL;
static int imgRow = 0;

static void imageInitTimeout (void *data)
{
   //imgbuf = layout->createImgbuf (Imgbuf::RGBA, 400, 200);
   imgbuf = layout->createImgbuf (Imgbuf::RGB, 400, 200);
   image->setBuffer (imgbuf);
}

/*
static void imageDrawTimeout (void *data)
{
   if (imgbuf) {
      for (int i = 0; i < 1; i++) {
         byte buf[4 * 400];
         for(int x = 0; x < 400; x++) {
            buf[4 * x + 0] = x * 255 / 399;
            buf[4 * x + 1] = (399 - x) * 255 / 399;
            buf[4 * x + 2] = imgRow * 255 / 199;
            buf[4 * x + 3] = (199 - imgRow) * 255 / 199;
         }

         imgbuf->copyRow (imgRow, buf);
         image->drawRow (imgRow);
         imgRow++;
      }
   }

   if(imgRow < 200)
      ::fltk::repeat_timeout (0.5, imageDrawTimeout, NULL);
}
*/

static void imageDrawTimeout (void *data)
{
   if (imgbuf) {
      for (int i = 0; i < 1; i++) {
         //byte buf[3 * 400];
         byte buf[3 * 400];		 
		 for(int y = 0; y < 200; y++)
		 {
	         for(int x = 0; x < 400; x++) {
	            buf[3 * x + 0] = x * 255 / 399;
	            buf[3 * x + 1] = (399 - x) * 255 / 399;
	            buf[3 * x + 2] = imgRow * 255 / 199;
	         }

	         imgbuf->copyRow (imgRow, buf);
	         //image->drawRow (imgRow);
	         imgRow++;
	     }
      }
		 
   }

   if(imgRow < 200)
      ::fltk::repeat_timeout (0.5, imageDrawTimeout, NULL);
}

int main(int argc, char **argv)
{

   // POS (Changhun Jung)
   //int ___mode;
   char __mode;
   FILE *fp_mode;

  
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
   //////////////////////////////////////////////////////

   
   
   // POS (Changhun Jung)
   if (___mode == 1)   	
	   printf("pos_create returns %d\n", pos_create(__POS_OBJ_NAME));	   
   else if (___mode == 2)   	
	   printf("pos_map returns %d\n", pos_map(__POS_OBJ_NAME));
   
   

   FltkPlatform *platform = new FltkPlatform ();
   layout = new Layout (platform);

   ::fltk::Window *window = new ::fltk::Window(410, 210, "Dw Scaled Image");
   window->begin();

   FltkViewport *viewport = new FltkViewport (0, 0, 410, 210);
   layout->attachView (viewport);

   StyleAttrs styleAttrs;
   styleAttrs.initValues ();
   styleAttrs.margin.setVal (5);
   styleAttrs.width = createPerLength (1.0);
   styleAttrs.height = createPerLength (1.0);

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

   Textblock *textblock;
   Textblock *_textblock;   


   if (___mode == 0) // POS (Changhun Jung)
	   textblock = new Textblock (false);
   
   // POS (Changhun Jung)
   else if (___mode == 1)
   {
	   _textblock = new Textblock (false);
	   textblock = (Textblock *)pos_malloc(__POS_OBJ_NAME, sizeof(Textblock));
	   memcpy(textblock, _textblock, sizeof(Textblock));	   
	   pos_set_prime_object(__POS_OBJ_NAME, textblock);
   }
   
   if (___mode == 2)
   {
	   textblock = (Textblock *)pos_get_prime_object(__POS_OBJ_NAME);
   }   
	
   if (___mode != 2)
   {
	   textblock->setStyle (widgetStyle);
   }

	   layout->setWidget (textblock);
	   //printf("================after setWidget===============\n");
	  //POS (Changhun Jung)
	  if(___mode == 2)
	  {
			((dw::Textblock*)textblock)->setChildLayout();
			//textblock->setPlatform (layout->getRefPlatform());
	  }	  
	   
	  //printf("================after set platform & Layout===============\n");
   

   widgetStyle->unref();

   styleAttrs.margin.setVal (0);
   styleAttrs.backgroundColor = NULL;

   Style *imageStyle = Style::create (layout, &styleAttrs);

   if (___mode == 0) // POS (Changhun Jung)
	   image = new dw::Image ("");
   
   // POS (Changhun Jung)
   else if(___mode == 1)
   {
	   Image *_image = new dw::Image ("");
	   image = (Image *)pos_malloc(__POS_OBJ_NAME, sizeof(Image));
	   memcpy(image, _image, sizeof(Image));
   }
   
   
   if (___mode != 2)
   {	   
	   textblock->addWidget (image, imageStyle);
	   textblock->addSpace (imageStyle);
   }   


   if (___mode != 2)
   {
	   imageInitTimeout (NULL);
	   imageDrawTimeout (NULL);
   }

   //((dw::fltk::FltkImgbuf *)imgbuf)->unref_copied(); // POS (Changhun Jung)
//   if (___mode != 2)	   
//	   imgbuf->copyBitsAll(); // POS (Changhun Jung)
	   //((dw::fltk::FltkImgbuf *)imgbuf)->copyBitsAll(); // POS (Changhun Jung)
   //printf("after unref_copied\n"); // POS (Changhun Jung)
   imageStyle->unref();

   textblock->flush ();

   window->resizable(viewport);
   window->show();
   //fltk::run();

//   ::fltk::add_timeout (2.0, imageInitTimeout, NULL);
//   ::fltk::add_timeout (0.1, imageDrawTimeout, NULL);
   //imageInitTimeout(NULL);
   //imageDrawTimeout(NULL);

/*
   for(int i=0;i<20;i++)
   	{
   		printf("i: %d\n",i);
		image->drawRow (i);
   	}
*/
   int errorCode = ::fltk::run();

   delete layout;

   return errorCode;
}
