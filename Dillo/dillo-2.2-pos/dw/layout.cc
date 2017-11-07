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



#include "core.hh"

#include "../lout/msg.h"
#include "../lout/debug.hh"
#include "../lout/misc.hh"

// POS (Changhun Jung)
#include <pos-lib.h>
#include "../myconfig.h"
#include "dw/textblock.hh"
#include "widget.hh"
#include "platform.hh"


using namespace lout;
using namespace lout::container;
using namespace lout::object;

namespace dw {
namespace core {

void Layout::Receiver::canvasSizeChanged (int width, int ascent, int descent)
{
}

// ----------------------------------------------------------------------

bool Layout::Emitter::emitToReceiver (lout::signal::Receiver *receiver,
                                      int signalNo, int argc,
                                      lout::object::Object **argv)
{
   Receiver *layoutReceiver = (Receiver*)receiver;

   switch (signalNo) {
   case CANVAS_SIZE_CHANGED:
      layoutReceiver->canvasSizeChanged (((Integer*)argv[0])->getValue (),
                                         ((Integer*)argv[1])->getValue (),
                                         ((Integer*)argv[2])->getValue ());
      break;

   default:
      misc::assertNotReached ();
   }

   return false;
}

void Layout::Emitter::emitCanvasSizeChanged (int width,
                                             int ascent, int descent)
{
   Integer w (width), a (ascent), d (descent);
   Object *argv[3] = { &w, &a, &d };
   emitVoid (CANVAS_SIZE_CHANGED, 3, argv);
}

// ----------------------------------------------------------------------

bool Layout::LinkReceiver::enter (Widget *widget, int link, int img,
                                  int x, int y)
{
// POS (Changhun Jung)
#if (DEBUG == 1)
   printf(" Layout::LinkReceiver::enter  \n");
#endif

   return false;
}

bool Layout::LinkReceiver::press (Widget *widget, int link, int img,
                                  int x, int y, EventButton *event)
{
   return false;
}

bool Layout::LinkReceiver::release (Widget *widget, int link, int img,
                                    int x, int y, EventButton *event)
{
   return false;
}

bool Layout::LinkReceiver::click (Widget *widget, int link, int img,
                                    int x, int y, EventButton *event)
{
   return false;
}

// ----------------------------------------------------------------------

bool Layout::LinkEmitter::emitToReceiver (lout::signal::Receiver *receiver,
                                          int signalNo, int argc,
                                          lout::object::Object **argv)
{
   LinkReceiver *linkReceiver = (LinkReceiver*)receiver;

   switch (signalNo) {
   case ENTER:
      return linkReceiver->enter ((Widget*)argv[0],
                                  ((Integer*)argv[1])->getValue (),
                                  ((Integer*)argv[2])->getValue (),
                                  ((Integer*)argv[3])->getValue (),
                                  ((Integer*)argv[4])->getValue ());

   case PRESS:
      return linkReceiver->press ((Widget*)argv[0],
                                  ((Integer*)argv[1])->getValue (),
                                  ((Integer*)argv[2])->getValue (),
                                  ((Integer*)argv[3])->getValue (),
                                  ((Integer*)argv[4])->getValue (),
                                  (EventButton*)argv[5]);

   case RELEASE:
      return linkReceiver->release ((Widget*)argv[0],
                                    ((Integer*)argv[1])->getValue (),
                                    ((Integer*)argv[2])->getValue (),
                                    ((Integer*)argv[3])->getValue (),
                                    ((Integer*)argv[4])->getValue (),
                                    (EventButton*)argv[5]);

   case CLICK:
      return linkReceiver->click ((Widget*)argv[0],
                                  ((Integer*)argv[1])->getValue (),
                                  ((Integer*)argv[2])->getValue (),
                                  ((Integer*)argv[3])->getValue (),
                                  ((Integer*)argv[4])->getValue (),
                                  (EventButton*)argv[5]);

   default:
      misc::assertNotReached ();
   }
   return false;
}

bool Layout::LinkEmitter::emitEnter (Widget *widget, int link, int img,
                                     int x, int y)
{
   Integer ilink (link), iimg (img), ix (x), iy (y);
   Object *argv[5] = { widget, &ilink, &iimg, &ix, &iy };
   return emitBool (ENTER, 5, argv);
}

bool Layout::LinkEmitter::emitPress (Widget *widget, int link, int img,
                                     int x, int y, EventButton *event)
{
   Integer ilink (link), iimg (img), ix (x), iy (y);
   Object *argv[6] = { widget, &ilink, &iimg, &ix, &iy, event };
   return emitBool (PRESS, 6, argv);
}

bool Layout::LinkEmitter::emitRelease (Widget *widget, int link, int img,
                                       int x, int y, EventButton *event)
{
   Integer ilink (link), iimg (img), ix (x), iy (y);
   Object *argv[6] = { widget, &ilink, &iimg, &ix, &iy, event };
   return emitBool (RELEASE, 6, argv);
}

bool Layout::LinkEmitter::emitClick (Widget *widget, int link, int img,
                                     int x, int y, EventButton *event)
{
   Integer ilink (link), iimg (img), ix (x), iy (y);
   Object *argv[6] = { widget, &ilink, &iimg, &ix, &iy, event };
   return emitBool (CLICK, 6, argv);
}

// ---------------------------------------------------------------------

Layout::Anchor::~Anchor ()
{
   delete name;
}

// ---------------------------------------------------------------------

Layout::Layout (Platform *platform)
{
   this->platform = platform;
   view = NULL;
   topLevel = NULL;
   widgetAtPoint = NULL;

   DBG_OBJ_CREATE (this, "DwRenderLayout");

   bgColor = NULL;
   cursor = style::CURSOR_DEFAULT;

   canvasWidth = canvasAscent = canvasDescent = 0;

   usesViewport = false;
   scrollX = scrollY = 0;
   viewportWidth = viewportHeight = 0;
   hScrollbarThickness = vScrollbarThickness = 0;

   requestedAnchor = NULL;
   scrollIdleId = -1;
   scrollIdleNotInterrupted = false;

   anchorsTable =
      new container::typed::HashTable <object::String, Anchor> (true, true);

   resizeIdleId = -1;

   textZone = new misc::ZoneAllocator (16 * 1024);

   DBG_OBJ_ASSOC (&findtextState, this);
   DBG_OBJ_ASSOC (&selectionState, this);

   platform->setLayout (this);

   selectionState.setLayout(this);
}

Layout::~Layout ()
{	
	if(___mode == 0)// POS (Changhun Jung)
	{

	   if (scrollIdleId != -1)
	      platform->removeIdle (scrollIdleId);
	   if (resizeIdleId != -1)
	      platform->removeIdle (resizeIdleId);

	   if (topLevel)
	      delete topLevel;
	   delete platform;
	   delete view;
	   delete anchorsTable;
	   delete textZone;
	}  
}

void Layout::addWidget (Widget *widget)
{   
   /* // POS (Changhun Jung)
   if (topLevel) {
      MSG_WARN("widget already set\n");
      return;
   }
   */ // POS (Changhun Jung)

   // POS (Changhun Jung)
   #if (DEBUG == 1)
	   printf(" In Layout::addWidget\n");
   #endif

   
   topLevel = widget; 
   widget->layout = this;

   findtextState.setWidget (widget);
   canvasHeightGreater = false;   
   setSizeHints ();   
   updateBgColor (); // POS (Changhun Jung)      
   queueResize ();  

   #if (DEBUG == 1)
	   printf(" Layout::addWidget -END-\n");
   #endif
   
}

void Layout::removeWidget ()
{
   /**
    * \bug Some more attributes must be reset here.
    */
   topLevel = NULL;
   widgetAtPoint = NULL;
   canvasWidth = canvasAscent = canvasDescent = 0;
   scrollX = scrollY = 0;

   view->setCanvasSize (canvasWidth, canvasAscent, canvasDescent);
   if (view->usesViewport ())
      view->setViewportSize (viewportWidth, viewportHeight, 0, 0);
   view->queueDrawTotal ();

   setAnchor (NULL);
   updateAnchor ();

   emitter.emitCanvasSizeChanged (canvasWidth, canvasAscent, canvasDescent);

   findtextState.setWidget (NULL);
   selectionState.reset ();

   updateCursor ();
}

void Layout::setWidget (Widget *widget)
{


   
   // POS (Changhun Jung)
   #if (DEBUG == 1)
	   printf("in setWidget\n");
   #endif 


   #if 0 // POS (Changhun Jung)
   if (topLevel)
      delete topLevel;
   printf("after toplevel\n");
   #endif

   
   widgetAtPoint = NULL;
   textZone->zoneFree ();
   addWidget (widget);

   updateCursor ();
}

/**
 * \brief Attach a view to the layout.
 *
 * It will become a child of the layout,
 * and so it will be destroyed, when the layout will be destroyed.
 */
void Layout::attachView (View *view)
{
   // POS (Changhun Jung)
   #if (DEBUG == 1)
   	printf(" In Layout::attachView\n");
   #endif

   
   if (this->view)
      MSG_ERR("attachView: Multiple views for layout!\n");

   this->view = view;
   platform->attachView (view); 
   // POS (Changhun Jung)
   #if (DEBUG == 1)
   	printf(" after platform->attachView\n");
   #endif

   
   /*
    * The layout of the view is set later, first, we "project" the current
    * state of the layout into the new view. A view must handle this without
    * a layout. See also at the end of this function.
    */
   if (bgColor)
      view->setBgColor (bgColor);
   

   
   #if 1 // POS (Changhun Jung)
	   //printf("before layout-> setcursor\n"); // POS (Changhun Jung)
	   view->setCursor (cursor);   
	   //printf("after layout-> setcursor\n"); // POS (Changhun Jung)
	   view->setCanvasSize (canvasWidth, canvasAscent, canvasDescent);
	   //printf("after layout-> setCanfvasSize\n"); // POS (Changhun Jung)
   #endif


   if (view->usesViewport ()) {
      if (usesViewport) {
         view->scrollTo (scrollX, scrollY);
         view->setViewportSize (viewportWidth, viewportHeight,
                                hScrollbarThickness, vScrollbarThickness);
         hScrollbarThickness = misc::max (hScrollbarThickness,
                                          view->getHScrollbarThickness ());
         vScrollbarThickness = misc::max (vScrollbarThickness,
                                          view->getVScrollbarThickness ());
      }
      else {
         usesViewport = true;
         scrollX = scrollY = 0;
         viewportWidth = viewportHeight = 100; // random values
         hScrollbarThickness = view->getHScrollbarThickness ();
         vScrollbarThickness = view->getVScrollbarThickness ();
      }
   }

   /*
    * This is the last call within this function, so that it is safe for
    * the implementation of dw::core::View::setLayout, to call methods
    * of dw::core::Layout.
    */   
   view->setLayout (this);   
   
   #if (DEBUG == 1)
   	printf(" Layout::attachView -END- \n");
   #endif  
}

void Layout::detachView (View *view)
{
   if (this->view != view)
      MSG_ERR("detachView: this->view: %p view %p\n", this->view, view);

   // printf("in detachView\n"); // POS (Changhun Jung)

   view->setLayout (NULL);
   //printf("after setLayout\n"); // POS (Changhun Jung)
   platform->detachView (view);
   // printf("after platform::detachView\n"); // POS (Changhun Jung)
   this->view = NULL;
   /**
    * \todo Actually, viewportMarkerWidthDiff and
    *       viewportMarkerHeightDiff have to be recalculated here, since the
    *       effective (i.e. maximal) values may change, after the view has been
    *       detached. Same applies to the usage of viewports.
    */
}

void Layout::scroll(ScrollCommand cmd)
{
   if (view->usesViewport ())
      view->scroll(cmd);
}

/**
 * \brief Scrolls all viewports, so that the region [x, y, width, height]
 *    is seen, according to hpos and vpos.
 */
void Layout::scrollTo (HPosition hpos, VPosition vpos,
                       int x, int y, int width, int height)
{
   scrollTo0 (hpos, vpos, x, y, width, height, true);
}

void Layout::scrollTo0 (HPosition hpos, VPosition vpos,
                        int x, int y, int width, int height,
                        bool scrollingInterrupted)
{
   if (usesViewport) {
      _MSG("scrollTo (%d, %d, %s)\n",
           x, y, scrollingInterrupted ? "true" : "false");

      scrollTargetHpos = hpos;
      scrollTargetVpos = vpos;
      scrollTargetX = x;
      scrollTargetY = y;
      scrollTargetWidth = width;
      scrollTargetHeight = height;

      if (scrollIdleId == -1) {
         scrollIdleId = platform->addIdle (&Layout::scrollIdle);
         scrollIdleNotInterrupted = true;
      }

      scrollIdleNotInterrupted =
         scrollIdleNotInterrupted || !scrollingInterrupted;
   }
}

void Layout::scrollIdle ()
{
   bool xChanged = true;
   switch (scrollTargetHpos) {
   case HPOS_LEFT:
      scrollX = scrollTargetX;
      break;
   case HPOS_CENTER:
      scrollX =
         scrollTargetX
         - (viewportWidth - vScrollbarThickness - scrollTargetWidth) / 2;
      break;
   case HPOS_RIGHT:
      scrollX =
         scrollTargetX
         - (viewportWidth - vScrollbarThickness - scrollTargetWidth);
      break;
   case HPOS_INTO_VIEW:
      xChanged = calcScrollInto (scrollTargetX, scrollTargetWidth, &scrollX,
                                 viewportWidth - vScrollbarThickness);
      break;
   case HPOS_NO_CHANGE:
      xChanged = false;
      break;
   }

   bool yChanged = true;
   switch (scrollTargetVpos) {
   case VPOS_TOP:
      scrollY = scrollTargetY;
      break;
   case VPOS_CENTER:
      scrollY =
         scrollTargetY
         - (viewportHeight - hScrollbarThickness - scrollTargetHeight) / 2;
      break;
   case VPOS_BOTTOM:
      scrollY =
         scrollTargetY
         - (viewportHeight - hScrollbarThickness - scrollTargetHeight);
      break;
   case VPOS_INTO_VIEW:
      yChanged = calcScrollInto (scrollTargetY, scrollTargetHeight, &scrollY,
                                 viewportHeight - hScrollbarThickness);
      break;
   case VPOS_NO_CHANGE:
      yChanged = false;
      break;
   }

   if (xChanged || yChanged) {
      adjustScrollPos ();
      view->scrollTo (scrollX, scrollY);
   }

   scrollIdleId = -1;
}

void Layout::adjustScrollPos ()
{
   scrollX = misc::min (scrollX,
      canvasWidth - (viewportWidth - vScrollbarThickness));
   scrollX = misc::max (scrollX, 0);

   scrollY = misc::min (scrollY,
      canvasAscent + canvasDescent - (viewportHeight - hScrollbarThickness));
   scrollY = misc::max (scrollY, 0);

   _MSG("adjustScrollPos: scrollX=%d scrollY=%d\n", scrollX, scrollY);
}

bool Layout::calcScrollInto (int requestedValue, int requestedSize,
                             int *value, int viewportSize)
{
   if (requestedSize > viewportSize) {
      // The viewport size is smaller than the size of the region which will
      // be shown. If the region is already visible, do not change the
      // position. Otherwise, show the left/upper border, this is most likely
      // what is needed.
      if (*value >= requestedValue &&
          *value + viewportSize < requestedValue + requestedSize)
         return false;
      else
         requestedSize = viewportSize;
   }

   if (requestedValue < *value) {
      *value = requestedValue;
      return true;
   } else if (requestedValue + requestedSize > *value + viewportSize) {
      *value = requestedValue - viewportSize + requestedSize;
      return true;
   } else
      return false;
}

void Layout::draw (View *view, Rectangle *area)
{
   Rectangle widgetArea, intersection, widgetDrawArea;

   // POS (Changhun Jung)
   #if (DEBUG == 1)
	   printf("Layout::draw \n");
   #endif

   
   if (topLevel) {
      /* Draw the top level widget. */
      widgetArea.x = topLevel->allocation.x;
      widgetArea.y = topLevel->allocation.y;
      widgetArea.width = topLevel->allocation.width;
      widgetArea.height = topLevel->getHeight ();

      if (area->intersectsWith (&widgetArea, &intersection)) {
         view->startDrawing (&intersection);
		 
		 // POS (Changhun Jung)
		 #if (DEBUG == 1)
			 printf("after view->startDrawing\n"); 
		 #endif
		 
		 
         /* Intersection in widget coordinates. */
         widgetDrawArea.x = intersection.x - topLevel->allocation.x;
         widgetDrawArea.y = intersection.y - topLevel->allocation.y;
         widgetDrawArea.width = intersection.width;
         widgetDrawArea.height = intersection.height;

		 // printf(" &topLevel: 0x%lX\n",topLevel); // POS (Changhun Jung)
         topLevel->draw (view, &widgetDrawArea);		 
		 #if (DEBUG == 1)
			 printf("after topLevel->Draw\n"); // POS (Changhun Jung)
		 #endif
		 
         view->finishDrawing (&intersection);
		 // POS (Changhun Jung)
		 #if (DEBUG == 1)
			 printf("after view->finishDrawing\n");
		 #endif
      }
   }
   #if (DEBUG == 1)
	   printf("Layout::draw -END-\n");
   #endif   
}

/**
 * Sets the anchor to scroll to.
 */
void Layout::setAnchor (const char *anchor)
{
   _MSG("setAnchor (%s)\n", anchor);

   if (requestedAnchor)
      delete requestedAnchor;
   requestedAnchor = anchor ? strdup (anchor) : NULL;
   updateAnchor ();
}

/**
 * Used, when the widget is not allocated yet.
 */
char *Layout::addAnchor (Widget *widget, const char* name)
{
   return addAnchor (widget, name, -1);
}

char *Layout::addAnchor (Widget *widget, const char* name, int y)
{
   String key (name);
   if (anchorsTable->contains (&key))
      return NULL;
   else {
      Anchor *anchor = new Anchor ();
      anchor->name = strdup (name);
      anchor->widget = widget;
      anchor->y = y;

      anchorsTable->put (new String (name), anchor);
      updateAnchor ();

      return anchor->name;
   }
}

void Layout::changeAnchor (Widget *widget, char* name, int y)
{
   String key (name);
   Anchor *anchor = anchorsTable->get (&key);
   assert (anchor);
   assert (anchor->widget == widget);
   anchor->y = y;
   updateAnchor ();
}

void Layout::removeAnchor (Widget *widget, char* name)
{
   String key (name);
   anchorsTable->remove (&key);
}

void Layout::updateAnchor ()
{
   Anchor *anchor;
   if (requestedAnchor) {
      String key (requestedAnchor);
      anchor = anchorsTable->get (&key);
   } else
      anchor = NULL;

   if (anchor == NULL) {
      /** \todo Copy comment from old docs. */
      if (scrollIdleId != -1 && !scrollIdleNotInterrupted) {
         platform->removeIdle (scrollIdleId);
         scrollIdleId = -1;
      }
   } else
      if (anchor->y != -1)
         scrollTo0 (HPOS_NO_CHANGE, VPOS_TOP, 0, anchor->y, 0, 0, false);
}

void Layout::setCursor (style::Cursor cursor)
{
   // POS (Changhun Jung)
   #if (DEBUG == 1) 
	   printf("In Layout::setCursor\n");
   #endif
   if (cursor != this->cursor) {
      this->cursor = cursor;
	  printf("before view->setCursor\n");
      view->setCursor (cursor);
	  printf("after view->setCursor\n");
   }
   // POS (Changhun Jung)
   #if (DEBUG == 1) 
	   printf("Layout::setCursor -END- \n");
   #endif   
}

void Layout::updateCursor ()
{
   #if (DEBUG == 1) // POS (Changhun Jung)
	   printf("In Layout::updateCursor\n");
   #endif
   if (widgetAtPoint && widgetAtPoint->style)
      setCursor (widgetAtPoint->style->cursor);
   else
      setCursor (style::CURSOR_DEFAULT);
}

void Layout::updateBgColor ()
{	
	topLevel->getStyle()->backgroundColor;
	//printf("in updateBgColor \n");
	
   /* The toplevel widget should always have a defined background color,
    * except at the beginning. Searching a defined background is not
    * necessary. */
   if (topLevel && topLevel->getStyle() &&
       topLevel->getStyle()->backgroundColor)
   {
      //printf("in updateBgColor if~\n");
      bgColor = topLevel->getStyle()->backgroundColor;
   }
   else
   {
      //printf("in updateBgColor else~\n");
      bgColor = NULL;
   }   
   //view->setBgColor (topLevel->getStyle()->backgroundColor);
   view->setBgColor (bgColor);
   //printf("after view setBgColor \n");
}

void Layout::resizeIdle ()
{
   //static int calls = 0;
   //MSG(" Layout::resizeIdle calls = %d\n", ++calls);
   
   // POS (Changhun Jung)
   #if (DEBUG == 1)
	   printf("In resizeIdle\n");
   #endif

   
   while (resizeIdleId != -1) {
      // Reset already here, since in this function, queueResize() may be
      // called again.
      resizeIdleId = -1;

      if (topLevel) {
         Requisition requisition;
         Allocation allocation;

	 	 //printf("before sizerequest \n");

	     topLevel->sizeRequest (&requisition);
		 //printf("requisition.width: %d\n",requisition.width);
		 //printf("requisition.ascent: %d\n",requisition.ascent);
		 //printf("requisition.descent: %d\n",requisition.descent);
	         
	     allocation.x = allocation.y = 0;
	     allocation.width = requisition.width;
	     allocation.ascent = requisition.ascent;
	     allocation.descent = requisition.descent;
	

	 
		 //topLevel->printAll(); // POS (Changhun Jung)

		 //printf(" Layout -> platform: 0x%lX\n",platform);// POS (Changhun Jung)
		 
		 // POS (Changhun Jung)
		 #if (DEBUG == 1)
			 printf("before setPlatform\n");
		 #endif
		 
#if 0		 
		 if(___mode ==2)// POS (Changhun Jung)
			 topLevel->setPlatform (platform);
#endif		 		 
	     topLevel->sizeAllocate (&allocation);

		 // POS (Changhun Jung)
		 #if (DEBUG == 1)
			 printf("after sizeAllocate\n");
		 #endif
		 
		 
         canvasWidth = requisition.width;
         canvasAscent = requisition.ascent;
         canvasDescent = requisition.descent;

         emitter.emitCanvasSizeChanged (
            canvasWidth, canvasAscent, canvasDescent);
		 

         // Tell the view about the new world size.
         view->setCanvasSize (canvasWidth, canvasAscent, canvasDescent);
         //  view->queueDrawTotal (false);

         if (usesViewport) {
            int actualHScrollbarThickness =
               (canvasWidth > viewportWidth) ? hScrollbarThickness : 0;
            int actualVScrollbarThickness =
            (canvasAscent + canvasDescent > viewportHeight) ?
            vScrollbarThickness : 0;

            if (!canvasHeightGreater &&
               canvasAscent + canvasDescent
               > viewportHeight - actualHScrollbarThickness) {
               canvasHeightGreater = true;
               setSizeHints ();
               /* May queue a new resize. */
            }

            // Set viewport sizes.
            if (view->usesViewport ())
               view->setViewportSize (viewportWidth, viewportHeight,
                                      actualHScrollbarThickness,
                                      actualVScrollbarThickness);
         }
      }

     // views are redrawn via Widget::resizeDrawImpl ()

   }

   updateAnchor ();
   // POS (Changhun Jung)
   #if (DEBUG == 1)
	   printf("resizeIdle -END-\n\n");
   #endif
}

void Layout::setSizeHints ()
{

	/* // POS (Changhun Jung)
		printf("in setSizeHint\n");		
		printf("----------------------------------------\n");
		printf("viewport width: %d height: %d\n",viewportWidth,viewportHeight);
		printf("----------------------------------------\n\n");		
	*/			
		//printf("[In setSizeHints] address of topLevel: 0x%lX\n",(unsigned long)topLevel); // POS (Changhun Jung)
		

		//	((dw::Textblock*)topLevel)->printWord(0);
		
		   if (topLevel) {
		   	  //printf("before setWidth\n");
		      topLevel->setWidth (viewportWidth
		                          - (canvasHeightGreater ? vScrollbarThickness : 0));
		      //printf("after setWidth\n");
		      topLevel->setAscent (viewportHeight - vScrollbarThickness);
		      //printf("after setAscent\n");
		      topLevel->setDescent (0);
		      //printf("after setDescent\n");
		   }
		

	/*	
		printf("----------------------------------------\n");
		printf("viewport width: %d height: %d\n",viewportWidth,viewportHeight);
		printf("----------------------------------------\n\n");			
	*/
}

void Layout::queueDraw (int x, int y, int width, int height)
{
   // pos (Changhun Jung)
   #if (DEBUG == 1)
	   printf(" Layout::In queuedraw\n");
   #endif
   //printf("x: %d,y: %d, width: %d, height: %d\n",x,y,width,height);
   
   Rectangle area;
   area.x = x;
   area.y = y;
   area.width = width;
   area.height = height;


   // pos (Changhun Jung)
   /*
   area.x = 0;
   area.y = 0;
   area.width = 780;
   area.height = 33;   
   
   printf("area.x: %d\n",area.x);
   printf("area.y: %d\n",area.y);
   printf("area.width: %d\n",area.width);
   printf("area.height: %d\n",area.height);
   printf(" modifiy area!!!\n");
   */

   	
   if (area.isEmpty ()) return;
   // pos (Changhun Jung)
   #if (DEBUG == 1)
	   printf("before view->queuedraw\n");
   #endif

   
   view->queueDraw (&area);

   // pos (Changhun Jung)
   #if (DEBUG == 1)
      printf("after view->queuedraw\n");
   #endif   
	
}

void Layout::queueDrawExcept (int x, int y, int width, int height,
   int ex, int ey, int ewidth, int eheight) {



   //x= -2, ex = -1, y= -2, ey= -1, width = 1, height = 1,ewidth = 1, eheight = 1;
   
   if (x == ex && y == ey && width == ewidth && height == eheight)
      return;

   // queueDraw() the four rectangles within rectangle (x, y, width, height)
   // around rectangle (ex, ey, ewidth, eheight).
   // Some or all of these may be empty.

   // upper left corner of the intersection rectangle

   int ix1 = misc::max (x, ex);
   int iy1 = misc::max (y, ey);
   // lower right corner of the intersection rectangle

   int ix2 = misc::min (x + width, ex + ewidth);
   int iy2 = misc::min (y + height, ey + eheight);



   //printf("x:%d  y:%d width:%d height:%d   ex:%d  ey:%d  ewidth:%d  eheight: %d\n",x,y,width,height, ex, ey, ewidth, eheight);   
   queueDraw (x, y, width, iy1 - y);
   queueDraw (x, iy2, width, y + height - iy2);
   queueDraw (x, iy1, ix1 - x, iy2 - iy1);
   queueDraw (ix2, iy1, x + width - ix2, iy2 - iy1);
      
}

void Layout::queueResize ()
{
   if (resizeIdleId == -1) {
      view->cancelQueueDraw ();

	  resizeIdleId = platform->addIdle (&Layout::resizeIdle);	  
#if 0	  
      if (___mode ==2) // POS (Changhun Jung)
      {
      	if (addIdle == 1)
      	{
		  	resizeIdleId = platform->addIdle (&Layout::resizeIdle);	  
			addIdle--;
      	}
      }
	  else 
	  	resizeIdleId = platform->addIdle (&Layout::resizeIdle);	  
#endif	  
   }
}


// Views

bool Layout::buttonEvent (ButtonEventType type, View *view, int numPressed,
                          int x, int y, ButtonState state, int button)

{
   EventButton event;

   moveToWidgetAtPoint (x, y, state);

   event.xCanvas = x;
   event.yCanvas = y;
   event.state = state;
   event.button = button;
   event.numPressed = numPressed;

   return processMouseEvent (&event, type, true);
}

/**
 * \brief This function is called by a view, to delegate a motion notify
 * event.
 *
 * Arguments are similar to dw::core::Layout::buttonPress.
 */
bool Layout::motionNotify (View *view,  int x, int y, ButtonState state)
{
   EventButton event;
   // POS (Changhun Jung)
   #if (DEBUG == 1)
      printf("Layout::motionNotify\n");
   #endif
   
   moveToWidgetAtPoint (x, y, state);
   event.xCanvas = x;
   event.yCanvas = y;
   event.state = state;

   return processMouseEvent (&event, MOTION_NOTIFY, true);
}

/**
 * \brief This function is called by a view, to delegate a enter notify event.
 *
 * Arguments are similar to dw::core::Layout::buttonPress.
 */
void Layout::enterNotify (View *view, int x, int y, ButtonState state)
{
   Widget *lastWidget;
   EventCrossing event;

   lastWidget = widgetAtPoint;
   moveToWidgetAtPoint (x, y, state);

   if (widgetAtPoint) {
      event.state = state;
      event.lastWidget = lastWidget;
      event.currentWidget = widgetAtPoint;
      widgetAtPoint->enterNotify (&event);
   }
}

/**
 * \brief This function is called by a view, to delegate a leave notify event.
 *
 * Arguments are similar to dw::core::Layout::buttonPress.
 */
void Layout::leaveNotify (View *view, ButtonState state)
{
   Widget *lastWidget;
   EventCrossing event;

   lastWidget = widgetAtPoint;
   moveOutOfView (state);

   if (lastWidget) {
      event.state = state;
      event.lastWidget = lastWidget;
      event.currentWidget = widgetAtPoint;
      lastWidget->leaveNotify (&event);
   }
}

/*
 * Return the widget at position (x, y). Return NULL, if there is no widget.
 */
Widget *Layout::getWidgetAtPoint (int x, int y)
{
   _MSG ("------------------------------------------------------------\n");
   _MSG ("widget at (%d, %d)\n", x, y);
   if (topLevel)
      return topLevel->getWidgetAtPoint (x, y, 0);
   else
      return NULL;
}


/*
 * Emit the necessary crossing events, when the mouse pointer has moved to
 * the given widget.
 */
void Layout::moveToWidget (Widget *newWidgetAtPoint, ButtonState state)
{
   Widget *ancestor, *w;
   Widget **track;
   int trackLen, i;
   EventCrossing crossingEvent;
   
   // POS (Changhun Jung)
   #if (DEBUG == 1)
      printf("In Layout::moveToWidget\n");
      printf("problem occurs here\n");
   #endif
   if (newWidgetAtPoint != widgetAtPoint) {
      // The mouse pointer has been moved into another widget.
      if (newWidgetAtPoint && widgetAtPoint)
         ancestor =
            newWidgetAtPoint->getNearestCommonAncestor (widgetAtPoint);

      else if (newWidgetAtPoint)
         ancestor = newWidgetAtPoint->getTopLevel ();
      else
         ancestor = widgetAtPoint->getTopLevel ();
      // Construct the track.
      trackLen = 0;
      if (widgetAtPoint)
         // first part
         for (w = widgetAtPoint; w != ancestor; w = w->getParent ())
            trackLen++;
      trackLen++; // for the ancestor
      if (newWidgetAtPoint)
         // second part
         for (w = newWidgetAtPoint; w != ancestor; w = w->getParent ())
            trackLen++;
      track = new Widget* [trackLen];
      i = 0;
      if (widgetAtPoint)
         /* first part */
         for (w = widgetAtPoint; w != ancestor; w = w->getParent ())
            track[i++] = w;
      track[i++] = ancestor;
      if (newWidgetAtPoint) {
         /* second part */
         i = trackLen - 1;
         for (w = newWidgetAtPoint; w != ancestor; w = w->getParent ())
            track[i--] = w;
      }
      /* Send events to all events on the track */
	  #if (DEBUG == 1)
		  printf("trackLen =%d\n", trackLen); // POS (Changhun Jung)
	  #endif
      for (i = 0; i < trackLen; i++) {
         crossingEvent.state = state;
         crossingEvent.currentWidget = widgetAtPoint; // ???
         crossingEvent.lastWidget = widgetAtPoint; // ???
         #if (DEBUG == 1)
            printf("i =%d\n",i); // POS (Changhun Jung)
         #endif   
         if (i != 0)
            track[i]->enterNotify (&crossingEvent);
		 //printf("after enterNotify\n"); // POS (Changhun Jung)
         if (i != trackLen - 1)
            track[i]->leaveNotify (&crossingEvent);
		 #if (DEBUG == 1)
		    printf("iterate end\n");
		 #endif
      }
      delete[] track;

      widgetAtPoint = newWidgetAtPoint;
      updateCursor ();
   }
}

/**
 * \brief Common processing of press, release and motion events.
 *
 * This function depends on that move_to_widget_at_point()
 * has been called before.
 */
bool Layout::processMouseEvent (MousePositionEvent *event,
                                ButtonEventType type, bool mayBeSuppressed)
{
   Widget *widget;

   for (widget = widgetAtPoint; widget; widget = widget->getParent ()) {
      if (!mayBeSuppressed || widget->isButtonSensitive ()) {
         event->xWidget = event->xCanvas - widget->getAllocation()->x;
         event->yWidget = event->yCanvas - widget->getAllocation()->y;

         switch (type) {
         case BUTTON_PRESS:
            return widget->buttonPress ((EventButton*)event);

         case BUTTON_RELEASE:
            return widget->buttonRelease ((EventButton*)event);

         case MOTION_NOTIFY:
            return widget->motionNotify ((EventMotion*)event);

         default:
            misc::assertNotReached ();
         }
      }
   }
   if (type == BUTTON_PRESS)
      return emitLinkPress (NULL, -1, -1, -1, -1, (EventButton*)event);
   else if (type == BUTTON_RELEASE)
      return emitLinkRelease(NULL, -1, -1, -1, -1, (EventButton*)event);

   return false;
}

/*
 * This function must be called by a view, when the user has manually changed
 * the viewport position. It is *not* called, when the layout has requested the
 * position change.
 */
void Layout::scrollPosChanged (View *view, int x, int y)
{
   if (x != scrollX || y != scrollY) {
      scrollX = x;
      scrollY = y;

      setAnchor (NULL);
      updateAnchor ();
   }
}

/*
 * This function must be called by a viewport view, when its viewport size has
 * changed. It is *not* called, when the layout has requested the size change.
 */
void Layout::viewportSizeChanged (View *view, int width, int height)
{
   _MSG("Layout::viewportSizeChanged w=%d h=%d new_w=%d new_h=%d\n",
        viewportWidth, viewportHeight, width, height);
   // pos (Changhun Jung)
   #if (DEBUG == 1)
	   printf("in viewportSizeChanged \n");
   #endif

   
   /* If the width has become higher, we test again, whether the vertical
    * scrollbar (so to speak) can be hidden again. */
   if (usesViewport && width > viewportWidth)
      canvasHeightGreater = false;

   /* if size changes, redraw this view.
    * TODO: this is a resize call (redraw/resize code needs a review). */
   if (viewportWidth != width || viewportHeight != height)
      queueResize();

   viewportWidth = width;
   viewportHeight = height;

   setSizeHints ();
   // pos (Changhun Jung)
   #if (DEBUG == 1)
   		printf("viewportSizeChanged -END-\n\n");  
   #endif
   

}

} // namespace dw
} // namespace core

