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


#include "../lout/msg.h"
#include "fltkcore.hh"

#include <fltk/draw.h>
#include <fltk/run.h>
#include <fltk/events.h>
#include <fltk/Monitor.h>
#include <fltk/InvisibleBox.h>
#include <fltk/Tooltip.h>
#include <fltk/utf.h>
#include <stdio.h>

// POS (Changhun Jung)
#include <pos-lib.h>
#include "../myconfig.h"

int __sum;
int ___mode;
int __IsPos;
char __POS_OBJ_NAME[100];

/* count widget */
int _sum;
int __textblock;
int __table;
int __list;
int __hr;
int __embed;

int __image;
int __ComplexButton;
int __EntryResource;
int __LabelButton;
int __CheckedButton;
int __textarea;
int __select;
int __RadioButton;

namespace dw {
namespace fltk {

using namespace ::fltk;
using namespace lout;

/**
 * \todo Distinction between italics and oblique would be nice.
 */

//#ifndef __CREATE
container::typed::HashTable <dw::core::style::FontAttrs,
                             FltkFont> *FltkFont::fontsTable =
   new container::typed::HashTable <dw::core::style::FontAttrs,
                                    FltkFont> (false, false);
//#endif
/*
if(mode ==1)
{
container::typed::HashTable <dw::core::style::FontAttrs,
                             FltkFont> *FltkFont::_fontsTable =
   new container::typed::HashTable <dw::core::style::FontAttrs,
                                    FltkFont> (false, false);
container::typed::HashTable <dw::core::style::FontAttrs,
                             FltkFont> *FltkFont::fontsTable =
   (container::typed:HashTable <dw::core:;style::FontAttrs,FltkFont> *)pos_malloc(sizeof(container::typed:HashTable <dw::core:;style::FontAttrs,FltkFont>)); 
memcpy (fontsTable, _fontsTable);
}
*/
FltkFont::FltkFont (core::style::FontAttrs *attrs)
{
   copyAttrs (attrs);

   int fa = 0;
   if (weight >= 500)
      fa |= BOLD;
   if (style != core::style::FONT_STYLE_NORMAL)
      fa  |= ITALIC;

   
   ::fltk::Font *_font;   
   //if(___mode == 0)// POS (Changhun Jung)
	   font = ::fltk::font(name, fa);
// POS (Changhun Jung)   
#if 0   
   else if (___mode == 1)
   {
      printf("before set font\n");
      _font = ::fltk::font(name, fa);
	  printf("sizeof font =%d\n",sizeof(::fltk::Font));
	  font = (::fltk::Font *)pos_malloc(__POS_OBJ_NAME, sizeof(::fltk::Font));
	  //font = (::fltk::Font *)pos_malloc(__POS_OBJ_NAME, 100);
	  printf("asdlkfj\n");
	  memcpy(font, _font, sizeof(::fltk::Font));
	  font->name_ = (char *)pos_malloc(__POS_OBJ_NAME, strlen(_font->name_)+1);
	  memcpy(font->name_, _font->_name, strlen(_font->name_)+1);
	  //memcpy(font, _font, 100);
	  printf("after set font\n");
   }
#endif


   if (font == NULL) {
      /*
       * If using xft, fltk::HELVETICA just means sans, fltk::COURIER
       * means mono, and fltk::TIMES means serif.
       */
      font = HELVETICA->plus (fa);
   }

   //setfont(font, size);
   spaceWidth = misc::max(0, (int)getwidth(" ") + letterSpacing);
   int xw, xh;
   measure("x", xw, xh);
   xHeight = xh;
   ascent = (int)getascent();
   descent = (int)getdescent();

   /**
    * \bug The code above does not seem to work, so this workaround.
    */
   xHeight = ascent * 3 / 5;
}


FltkFont::~FltkFont ()
{
   if(___mode ==0)// POS (Changhun Jung)
   	fontsTable->remove (this);
}


bool
FltkPlatform::fontExists (const char *name)
{
   return ::fltk::font(name) != NULL;
}


FltkFont*
FltkFont::create (core::style::FontAttrs *attrs)
{
   // POS (Changhun Jung)
   #if (DEBUG == 1)
	   printf("In FltkFont::create\n");
   #endif
   FltkFont *_font;

   
   FltkFont *font = fontsTable->get (attrs);
   



   
   if (font == NULL) {
#if 1   	
      // POS (Changhun Jung)
      if(___mode != 0)
      {
            _font = new FltkFont(attrs);
			font = (FltkFont*)pos_malloc(__POS_OBJ_NAME,sizeof(FltkFont));

			if (font == NULL)
			{
				printf("pos malloc error!!\n");
			}

            memcpy(font, _font,sizeof(FltkFont) );
			delete _font;

      }
	  
      else
            font = new FltkFont (attrs);
#endif
#if 0
      printf("before new \n");
      font = new FltkFont (attrs);
      printf("after new \n");
#endif	  
      fontsTable->put (font, font);
   }
   
   // POS (Changhun Jung)
   #if (DEBUG == 1)
	   printf("In FltkFont::create -END- \n");
   #endif

   
   return font;
}

container::typed::HashTable <dw::core::style::ColorAttrs,
                             FltkColor>
   *FltkColor::colorsTable =
      new container::typed::HashTable <dw::core::style::ColorAttrs,
                                       FltkColor> (false, false);

FltkColor::FltkColor (int color): Color (color)
{
   this->color = color;

   /*
    * fltk/setcolor.cxx:
    * "A Color of zero (fltk::NO_COLOR) will draw black but is
    * ambiguous. It is returned as an error value or to indicate portions
    * of a Style that should be inherited, and it is also used as the
    * default label color for everything so that changing color zero can
    * be used by the -fg switch. You should use fltk::BLACK (56) to get
    * black."
    *
    * i.e., zero only works sometimes.
    */

   if (!(colors[SHADING_NORMAL] = shadeColor (color, SHADING_NORMAL) << 8))
      colors[SHADING_NORMAL] = ::fltk::BLACK;
   if (!(colors[SHADING_INVERSE] = shadeColor (color, SHADING_INVERSE) << 8))
      colors[SHADING_INVERSE] = ::fltk::BLACK;
   if (!(colors[SHADING_DARK] = shadeColor (color, SHADING_DARK) << 8))
      colors[SHADING_DARK] = ::fltk::BLACK;
   if (!(colors[SHADING_LIGHT] = shadeColor (color, SHADING_LIGHT) << 8))
      colors[SHADING_LIGHT] = ::fltk::BLACK;
}


FltkColor::~FltkColor ()
{
   if(___mode == 0)// POS (Changhun Jung)
	   colorsTable->remove (this);
}



FltkColor * FltkColor::create (int col)
{
   ColorAttrs attrs(col);
   FltkColor *color = colorsTable->get (&attrs);
   FltkColor *_color;// POS (Changhun Jung)

   // POS (Changhun Jung)
   #if (DEBUG == 1)
	   printf("In FltkColor::create\n"); 
   #endif

   if (color == NULL) {
#if 1      	
   	// POS (Changhun Jung)
 	if(___mode != 0)
 	{
 	      _color = new FltkColor (col);
 	      color = (FltkColor*)pos_malloc(__POS_OBJ_NAME,sizeof(FltkColor));
 	      memcpy(color,_color,sizeof(FltkColor));
		  delete _color;
 	}

	
 	else// POS (Changhun Jung)
 	      color = new FltkColor (col);
#endif
#if 0
   color = new FltkColor (col);
#endif
   colorsTable->put (color, color);
   }
   // POS (Changhun Jung)
   #if (DEBUG == 1)
	   printf("In FltkColor::create\n"); 
   #endif

   return color;
}

::fltk::Widget *FltkTooltip::widget = NULL;

FltkTooltip::FltkTooltip (const char *text) : Tooltip(text)
{
   /* ::fltk::Tooltip really, really wants a Widget */
   if (!widget)
      widget = new ::fltk::InvisibleBox(1, 1, 0, 0, NULL);
   shown = false;

   if (!text || !strpbrk(text, "&@")) {
      escaped_str = NULL;
   } else {
      /*
       * WORKAROUND: ::fltk::Tooltip::tooltip_timeout() makes instance_
       * if necessary, and immediately uses it. This means that we can't
       * get our hands on it to set RAW_LABEL until after it has been shown
       * once. So let's escape the special characters ourselves.
       */
      const char *src = text;
      char *dest = escaped_str = (char *) malloc(strlen(text) * 2 + 1);

      while (*src) {
         if (*src == '&' || *src == '@')
            *dest++ = *src;
         *dest++ = *src++;
      }
      *dest = '\0';
   }
}

FltkTooltip::~FltkTooltip ()
{
   if (shown)
      ::fltk::Tooltip::exit();
   if (escaped_str)
      free(escaped_str);
}

FltkTooltip *FltkTooltip::create (const char *text)
{
   return new FltkTooltip(text);
}

void FltkTooltip::onEnter()
{
   Rectangle rect;
   widget->get_absolute_rect(&rect);
   ::fltk::Tooltip::enter(widget, rect, escaped_str ? escaped_str : str);
   shown = true;
}

void FltkTooltip::onLeave()
{
   ::fltk::Tooltip::exit();
   shown = false;
}

void FltkTooltip::onMotion()
{
}

void FltkView::addFltkWidget (::fltk::Widget *widget,
                              core::Allocation *allocation)
{
}

void FltkView::removeFltkWidget (::fltk::Widget *widget)
{
}

void FltkView::allocateFltkWidget (::fltk::Widget *widget,
                                   core::Allocation *allocation)
{
}

void FltkView::drawFltkWidget (::fltk::Widget *widget, core::Rectangle *area)
{
}




core::ui::LabelButtonResource *
FltkPlatform::FltkResourceFactory::createLabelButtonResource (const char
                                                              *label)
{	

   ui::FltkLabelButtonResource * buttonResource;	
   
   // POS (Changhun Jung)
   ui::FltkLabelButtonResource * _buttonResource;	

   
   if(___mode == 0)// POS (Changhun Jung)
	   return new ui::FltkLabelButtonResource (platform, label);
   // POS (Changhun Jung)
   else if (___mode == 1)
   {
		_buttonResource = new ui::FltkLabelButtonResource (platform, label);
		buttonResource = (ui::FltkLabelButtonResource * )pos_malloc(__POS_OBJ_NAME,sizeof(ui::FltkLabelButtonResource));
		memcpy(buttonResource, _buttonResource, sizeof(ui::FltkLabelButtonResource));
	    platform->attachResource (buttonResource);		
		return buttonResource;
   }
}

core::ui::ComplexButtonResource *
FltkPlatform::FltkResourceFactory::createComplexButtonResource (core::Widget
                                                                *widget,
                                                                bool relief)
{
   core::ui::ComplexButtonResource *_complecButton;// POS (Changhun Jung)
   core::ui::ComplexButtonResource *complecButton;
   
   
   if (___mode == 0) // POS (Changhun Jung)   	
	   return new ui::FltkComplexButtonResource (platform, widget, relief);

   // POS (Changhun Jung)
   else if(___mode == 1)
   {
        __IsPos = 1;
		_complecButton = new ui::FltkComplexButtonResource (platform, widget, relief);
		complecButton = (ui::FltkComplexButtonResource *)pos_malloc(__POS_OBJ_NAME,sizeof(ui::FltkComplexButtonResource));
		memcpy (complecButton, _complecButton, sizeof(ui::FltkComplexButtonResource));
		
		//printf("platform->resources->size =%d\n", platform->getResources()->size());

		complecButton->init (widget);
		__IsPos = 0;
		return complecButton;
   }
}

core::ui::ListResource *
FltkPlatform::FltkResourceFactory::createListResource (core::ui
                                                       ::ListResource
                                                       ::SelectionMode
                                                       selectionMode, int rows)
{
   core::ui::ListResource * list;
   core::ui::ListResource * _list;// POS (Changhun Jung)
   
   
   if(___mode == 0)// POS (Changhun Jung)
	   return new ui::FltkListResource (platform, selectionMode, rows);

   // POS (Changhun Jung)
   else if(___mode == 1)
   {
		_list = new ui::FltkListResource (platform, selectionMode, rows);
		list = (core::ui::ListResource *)pos_malloc(__POS_OBJ_NAME,sizeof(core::ui::ListResource));
		memcpy(list, _list , sizeof(core::ui::ListResource));
		return list;
   }
}

core::ui::OptionMenuResource *
FltkPlatform::FltkResourceFactory::createOptionMenuResource ()
{
   core::ui::OptionMenuResource *optMenu;
   core::ui::OptionMenuResource *_optMenu; // POS (Changhun Jung)

   
   if(___mode == 0)// POS (Changhun Jung)
	   return new ui::FltkOptionMenuResource (platform);

   // POS (Changhun Jung)
   else if(___mode == 1)
   {
		_optMenu = new ui::FltkOptionMenuResource (platform);
		optMenu = (ui::FltkOptionMenuResource *)pos_malloc(__POS_OBJ_NAME,sizeof(ui::FltkOptionMenuResource));
		memcpy (optMenu, _optMenu, sizeof(ui::FltkOptionMenuResource) );
		platform->attachResource ((ui::FltkOptionMenuResource *)optMenu );
		return optMenu;
   }


	  
}

core::ui::EntryResource *
FltkPlatform::FltkResourceFactory::createEntryResource (int maxLength,
                                                        bool password,
                                                        const char *label)
{
   core::ui::EntryResource *entry;
   core::ui::EntryResource *_entry;// POS (Changhun Jung)
   

   if(___mode == 0)// POS (Changhun Jung)
	   return new ui::FltkEntryResource (platform, maxLength, password, label);

   // POS (Changhun Jung)
   else if(___mode == 1)
   {
		__IsPos = 1;
		_entry = new ui::FltkEntryResource (platform, maxLength, password, label);
		entry = (ui::FltkEntryResource *)pos_malloc(__POS_OBJ_NAME, sizeof(ui::FltkEntryResource) );
		memcpy( entry, _entry, sizeof(ui::FltkEntryResource) );
		platform->attachResource ((ui::FltkEntryResource *)entry);
		__IsPos = 0;
		return entry;
   }	
    
}

core::ui::MultiLineTextResource *
FltkPlatform::FltkResourceFactory::createMultiLineTextResource (int cols,
                                                                int rows)
{

   core::ui::MultiLineTextResource *multiLine;
   core::ui::MultiLineTextResource *_multiLine;// POS (Changhun Jung)
   
   
   if(___mode == 0)// POS (Changhun Jung)
	   return new ui::FltkMultiLineTextResource (platform, cols, rows);

   // POS (Changhun Jung)
   else if(___mode == 1)
   {
		__IsPos = 1;
		_multiLine = new ui::FltkMultiLineTextResource (platform, cols, rows);
		multiLine = (ui::FltkMultiLineTextResource *)pos_malloc(__POS_OBJ_NAME,sizeof(ui::FltkMultiLineTextResource) );
		memcpy (multiLine, _multiLine, sizeof(ui::FltkMultiLineTextResource) );
		platform->attachResource ( (ui::FltkMultiLineTextResource *)multiLine);	
		__IsPos = 0;
		return multiLine;
   }
}

core::ui::CheckButtonResource *
FltkPlatform::FltkResourceFactory::createCheckButtonResource (bool activated)
{
   core::ui::CheckButtonResource *checkButton;   
   core::ui::CheckButtonResource *_checkButton;// POS (Changhun Jung)
   
   
   if(___mode == 0)// POS (Changhun Jung)
	  return new ui::FltkCheckButtonResource (platform, activated);

   // POS (Changhun Jung)
   else if(___mode == 1)
   {
		_checkButton = new ui::FltkCheckButtonResource (platform, activated);
		checkButton = (ui::FltkCheckButtonResource *)pos_malloc(__POS_OBJ_NAME, sizeof(ui::FltkCheckButtonResource) );
		memcpy (checkButton, _checkButton, sizeof(ui::FltkCheckButtonResource) );
		platform->attachResource( (ui::FltkCheckButtonResource *) checkButton);
			
		return checkButton;
   }
}

core::ui::RadioButtonResource
*FltkPlatform::FltkResourceFactory::createRadioButtonResource
(core::ui::RadioButtonResource *groupedWith, bool activated)
{
   core::ui::RadioButtonResource* radioButton;
   core::ui::RadioButtonResource* _radioButton;// POS (Changhun Jung)

   
   if(___mode == 0)// POS (Changhun Jung)
	   return
      new ui::FltkRadioButtonResource (platform,
                                       (ui::FltkRadioButtonResource*)
                                       groupedWith,
                                       activated);
   // POS (Changhun Jung)
   else if(___mode == 1)
   {
		_radioButton = new ui::FltkRadioButtonResource (platform,
                                       (ui::FltkRadioButtonResource*)
                                       groupedWith,
                                       activated);
		radioButton = (ui::FltkRadioButtonResource *)pos_malloc(__POS_OBJ_NAME,sizeof(ui::FltkRadioButtonResource) );
		memcpy (radioButton, _radioButton, sizeof(ui::FltkRadioButtonResource) );
		return radioButton;
   }
   platform->attachResource( (ui::FltkRadioButtonResource *) radioButton);
   
}

// ----------------------------------------------------------------------

FltkPlatform::FltkPlatform ()
{

   // POS (Changhun Jung)
   lout::container::typed::List <IdleFunc> *_idleQueue;
   lout::container::typed::List <ui::FltkResource> *_resources;

   
   layout = NULL;
   //if(___mode ==0)// POS (Changhun Jung)
	   idleQueue = new container::typed::List <IdleFunc> (true);
#if 0   
   // POS (Changhun Jung)
   else if(___mode == 1)
   {
		_idleQueue = new container::typed::List <IdleFunc> (true);
		if(__mode2 == 1)
			idleQueue = (lout::container::typed::List <IdleFunc> *)pos_malloc(__POS_OBJ_NAME,sizeof(lout::container::typed::List <IdleFunc>) );
		else if(__mode2 == 0)
			idleQueue = (lout::container::typed::List <IdleFunc> *)malloc(sizeof(lout::container::typed::List <IdleFunc>) );			
		memcpy(idleQueue, _idleQueue, sizeof(lout::container::typed::List <IdleFunc>) );
   }
#endif

   idleFuncRunning = false;
   idleFuncId = 0;

   view = NULL;
   //if(___mode ==0)// POS (Changhun Jung)
	   resources = new container::typed::List <ui::FltkResource> (false);
#if 0
   // POS (Changhun Jung)
   else if(___mode ==1)
   {
	   _resources = new container::typed::List <ui::FltkResource> (false);
	   if(__mode2 == 1)
		   resources = (lout::container::typed::List <ui::FltkResource> *)pos_malloc(__POS_OBJ_NAME, sizeof(lout::container::typed::List <ui::FltkResource>) );
	   else if(__mode2 == 0)
		   resources = (lout::container::typed::List <ui::FltkResource> *)malloc(sizeof(lout::container::typed::List <ui::FltkResource>) );	   	
	   	
	   memcpy (resources, _resources, sizeof( lout::container::typed::List <ui::FltkResource>) );
   }
#endif
   resourceFactory.setPlatform (this);
}

FltkPlatform::~FltkPlatform ()
{	
	if(___mode == 0)// POS (Changhun Jung)
	{
	   if (idleFuncRunning)
	      remove_idle (generalStaticIdle, (void*)this);
	   delete idleQueue;
	   delete resources;
	}  
}

void FltkPlatform::setLayout (core::Layout *layout)
{
   this->layout = layout;
}


void FltkPlatform::attachView (core::View *view)
{

   this->view = (FltkView*)view;

   for (container::typed::Iterator <ui::FltkResource> it =
           resources->iterator (); it.hasNext (); ) {
      ui::FltkResource *resource = it.getNext ();
      resource->attachView (this->view);	  
   }
}


void FltkPlatform::detachView  (core::View *view)
{
   if (this->view != view)
      MSG_ERR("FltkPlatform::detachView: this->view: %p view: %p\n",
              this->view, view);

   for (container::typed::Iterator <ui::FltkResource> it =
           resources->iterator (); it.hasNext (); ) {
      ui::FltkResource *resource = it.getNext ();
      resource->detachView ((FltkView*)view);
   }
   this->view = NULL;
}


int FltkPlatform::textWidth (core::style::Font *font, const char *text,
                             int len)
{
   int width;
   FltkFont *ff = (FltkFont*) font;
   setfont (ff->font, ff->size);
   width = (int) getwidth (text, len);

   if (font->letterSpacing) {
      int curr = 0, next = 0;

      while (next < len) {
         next = nextGlyph(text, curr);
         width += font->letterSpacing;
         curr = next;
      }
   }
   return width;
}

int FltkPlatform::nextGlyph (const char *text, int idx)
{
   return utf8fwd (&text[idx + 1], text, &text[strlen (text)]) - text;
}

int FltkPlatform::prevGlyph (const char *text, int idx)
{
   return utf8back (&text[idx - 1], text, &text[strlen (text)]) - text;
}

float FltkPlatform::dpiX ()
{
   return ::fltk::Monitor::all ().dpi_x ();
}

float FltkPlatform::dpiY ()
{
   return ::fltk::Monitor::all ().dpi_y ();
}

void FltkPlatform::generalStaticIdle (void *data)
{
   ((FltkPlatform*)data)->generalIdle();
}

void FltkPlatform::generalIdle ()
{
   IdleFunc *idleFunc;
   #if (DEBUG == 1)
	   // POS (Changhun Jung)
	   printf("generalIdle\n");
   #endif
   if (!idleQueue->isEmpty ()) {
      /* Execute the first function in the list. */
      idleFunc = idleQueue->getFirst ();
      (layout->*(idleFunc->func)) ();

      /* Remove this function. */

      idleQueue->removeRef(idleFunc);
   }

   if (idleQueue->isEmpty()) {
      idleFuncRunning = false;
      remove_idle (generalStaticIdle, (void*)this);
   }
}

/**
 * \todo Incomplete comments.
 */
int FltkPlatform::addIdle (void (core::Layout::*func) ())
{
   /*
    * Since ... (todo) we have to wrap around fltk_add_idle. There is only one
    * idle function, the passed idle function is put into a queue.
    */
   if (!idleFuncRunning) {
      add_idle (generalStaticIdle, (void*)this);
      idleFuncRunning = true;
   }

   idleFuncId++;

   IdleFunc *idleFunc = new IdleFunc();
   idleFunc->id = idleFuncId;
   idleFunc->func = func;
   idleQueue->append (idleFunc);

   return idleFuncId;
}

void FltkPlatform::removeIdle (int idleId)
{
   bool found;
   container::typed::Iterator <IdleFunc> it;
   IdleFunc *idleFunc;

   for (found = false, it = idleQueue->iterator(); !found && it.hasNext(); ) {
      idleFunc = it.getNext();
      if (idleFunc->id == idleId) {
         idleQueue->removeRef (idleFunc);
         found = true;
      }
   }

   if (idleFuncRunning && idleQueue->isEmpty())
      remove_idle (generalStaticIdle, (void*)this);
}

core::style::Font *FltkPlatform::createFont (core::style::FontAttrs
                                             *attrs,
                                             bool tryEverything)
{
   return FltkFont::create (attrs);
}

core::style::Color *FltkPlatform::createColor (int color)
{
   return FltkColor::create (color);
}

core::style::Tooltip *FltkPlatform::createTooltip (const char *text)
{
   return FltkTooltip::create (text);
}

void FltkPlatform::copySelection(const char *text)
{
   fltk::copy(text, strlen(text), false);
}

core::Imgbuf *FltkPlatform::createImgbuf (core::Imgbuf::Type type,
                                          int width, int height)
{
   // POS (Changhun Jung)
   if (___mode == 0)
	   return new FltkImgbuf (type, width, height);
#if 1   
   else if (___mode == 1)
   {
	   FltkImgbuf *_fltkImgbuf = new FltkImgbuf (type, width, height);
	   FltkImgbuf *fltkImgbuf = (FltkImgbuf *)pos_malloc(__POS_OBJ_NAME, sizeof(FltkImgbuf));
	   memcpy(fltkImgbuf, _fltkImgbuf, sizeof(FltkImgbuf));
	   fltkImgbuf->init(type, width, height, NULL);
	   return fltkImgbuf;	   
   }
#endif
}

core::ui::ResourceFactory *FltkPlatform::getResourceFactory ()
{
   return &resourceFactory;
}


void FltkPlatform::attachResource (ui::FltkResource *resource)
{
   // POS (Changhun Jung)   
   //printf(" &platform: 0x%lX\n",this);
   //printf(" &resource: 0x%lX\n",resource);

   
   resources->append (resource);
   //printf("after append\n");
   resource->attachView (view);
   //printf("after resource\n");   
}

void FltkPlatform::detachResource (ui::FltkResource *resource)
{
   resources->removeRef (resource);
}

} // namespace fltk
} // namespace dw
