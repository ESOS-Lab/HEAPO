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



#include "textblock.hh"
#include "../lout/msg.h"
#include "../lout/misc.hh"

#include <stdio.h>
#include <limits.h>

//POS (Changhun Jung)
#include <pos-lib.h>
#include "../myconfig.h"


// POS (Taeho Hwang)
#include <time.h>
#include <stdio.h>
static unsigned long total_draw_time;


using namespace lout;

namespace dw {

int Textblock::CLASS_ID = -1;

Textblock::Textblock (bool limitTextWidth)
{
   registerName ("dw::Textblock", &CLASS_ID);
   setFlags (USES_HINTS);
   setButtonSensitive(true);

   hasListitemValue = false;
   innerPadding = 0;
   line1Offset = 0;
   line1OffsetEff = 0;
   ignoreLine1OffsetSometimes = false;
   mustQueueResize = false;
   redrawY = 0;
   lastWordDrawn = -1;

   /*
    * The initial sizes of lines and words should not be
    * too high, since this will waste much memory with tables
    * containing many small cells. The few more calls to realloc
    * should not decrease the speed considerably.
    * (Current setting is for minimal memory usage. An interesting fact
    * is that high values decrease speed due to memory handling overhead!)
    * TODO: Some tests would be useful.
    */
    
//POS (Changhun Jung)    
#if (DEBUG == 1)
	printf("Textblock is being made\n");
#endif


if(___mode == 0) //POS (Changhun Jung)
{
   lines = new misc::SimpleVector <Line> (1);
   words = new misc::SimpleVector <Word> (1);
   anchors = new misc::SimpleVector <Anchor> (1);
}

//POS (Changhun Jung)
if(___mode == 1)
{      
    lines = (misc::SimpleVector <Line> *)pos_malloc (__POS_OBJ_NAME,sizeof(misc::SimpleVector <Line>));
    words = (misc::SimpleVector <Word> *)pos_malloc (__POS_OBJ_NAME,sizeof(misc::SimpleVector <Word>));
    anchors = (misc::SimpleVector <Anchor> *)pos_malloc (__POS_OBJ_NAME,sizeof(misc::SimpleVector <Anchor>));
      
   
   
   misc::SimpleVector <Line> *_lines;
   misc::SimpleVector <Word> *_words;
   misc::SimpleVector <Anchor> *_anchors;
   _lines = new misc::SimpleVector <Line> (1);
   _words = new misc::SimpleVector <Word> (1);
   _anchors = new misc::SimpleVector <Anchor> (1);

   memcpy (lines, _lines, sizeof(misc::SimpleVector <Line>));
   memcpy (words, _words, sizeof(misc::SimpleVector <Word>));
   memcpy (anchors, _anchors, sizeof(misc::SimpleVector <Anchor>));

   delete _lines;
   delete _words;
   delete _anchors;

   lines->set_IsPos(1);
   words->set_IsPos(1);
   anchors->set_IsPos(1);
   
}


   //DBG_OBJ_SET_NUM(page, "num_lines", num_lines);

   lastLineWidth = 0;
   lastLineParMin = 0;
   lastLineParMax = 0;
   wrapRef = -1;

   //DBG_OBJ_SET_NUM(page, "last_line_width", last_line_width);
   //DBG_OBJ_SET_NUM(page, "last_line_par_min", last_line_par_min);
   //DBG_OBJ_SET_NUM(page, "last_line_par_max", last_line_par_max);
   //DBG_OBJ_SET_NUM(page, "wrap_ref", wrap_ref);

   hoverLink = -1;

   // random values
   availWidth = 100;
   availAscent = 100;
   availDescent = 0;

   hoverTooltip = NULL;

   this->limitTextWidth = limitTextWidth;

   for (int layer = 0; layer < core::HIGHLIGHT_NUM_LAYERS; layer++) {
      /* hlStart[layer].index > hlEnd[layer].index means no highlighting */
      hlStart[layer].index = 1;
      hlStart[layer].nChar = 0;
      hlEnd[layer].index = 0;
      hlEnd[layer].nChar = 0;
   }
   //printf(" Textblock::Textblock -END-\n"); //POS (Changhun Jung)
}





	Textblock::~Textblock ()
	{
	   //_MSG ("Textblock::~Textblock\n");
		if(___mode == 0) // POS (Changhun Jung)
		{
			   for (int i = 0; i < words->size(); i++) {
			      Word *word = words->getRef (i);
			      if (word->content.type == core::Content::WIDGET)
			         delete word->content.widget;
			      word->style->unref ();
			      word->spaceStyle->unref ();
			   }

			   for (int i = 0; i < anchors->size(); i++) {
			      Anchor *anchor = anchors->getRef (i);
			      // This also frees the names (see removeAnchor() and related). 
			      removeAnchor(anchor->name);
			   }

			   delete lines;
			   delete words;
			   delete anchors;

			   // Make sure we don't own widgets anymore. Necessary before call of
			   //   parent class destructor. (???) 
			   words = NULL;
		}
	   //DBG_OBJ_SET_NUM(page, "num_lines", page->num_lines);
	   
	}




/**
 * The ascent of a textblock is the ascent of the first line, plus
 * padding/border/margin. This can be used to align the first lines
 * of several textblocks in a horizontal line.
 */
void Textblock::sizeRequestImpl (core::Requisition *requisition)
{
   //POS (Changhun Jung)
   #if (DEBUG == 1)
   	printf("In Textblock::sizeRequestImpl \n");
   #endif

   
   rewrap ();
   //printf("after rewrap \n"); //POS (Changhun Jung)
   if (lines->size () > 0) {
      Line *lastLine = lines->getRef (lines->size () - 1);
      requisition->width =
         misc::max (lastLine->maxLineWidth, lastLineWidth);
      /* Note: the breakSpace of the last line is ignored, so breaks
         at the end of a textblock are not visible. */
      requisition->ascent = lines->getRef(0)->ascent;
      requisition->descent = lastLine->top
         + lastLine->ascent + lastLine->descent - lines->getRef(0)->ascent;
   } else {
      requisition->width = lastLineWidth;
      requisition->ascent = 0;
      requisition->descent = 0;
   }

   requisition->width += innerPadding + getStyle()->boxDiffWidth ();
   requisition->ascent += getStyle()->boxOffsetY ();
   requisition->descent += getStyle()->boxRestHeight ();

   if (requisition->width < availWidth)
      requisition->width = availWidth;
   
   //POS (Changhun Jung)
   #if (DEBUG == 1)
	   printf("Textblock::sizeRequestImpl -END-\n");
   #endif

   
}

/**
 * Get the extremes of a word within a textblock.
 */
void Textblock::getWordExtremes (Word *word, core::Extremes *extremes)
{
   if (word->content.type == core::Content::WIDGET) {
      if (word->content.widget->usesHints ())
         word->content.widget->getExtremes (extremes);
      else {
         if (core::style::isPerLength
             (word->content.widget->getStyle()->width)) {
            extremes->minWidth = 0;
            if (word->content.widget->hasContents ())
               extremes->maxWidth = 1000000;
            else
               extremes->maxWidth = 0;
         } else if (core::style::isAbsLength
                    (word->content.widget->getStyle()->width)) {
            /* Fixed lengths are only applied to the content, so we have to
             * add padding, border and margin. */
            extremes->minWidth = extremes->maxWidth =
               core::style::absLengthVal (word->content.widget->getStyle()
                                          ->width)
               + word->style->boxDiffWidth ();
         } else
            word->content.widget->getExtremes (extremes);
      }
   } else {
      extremes->minWidth = word->size.width;
      extremes->maxWidth = word->size.width;
   }
}

void Textblock::getExtremesImpl (core::Extremes *extremes)
{
   core::Extremes wordExtremes;
   Line *line;
   Word *word;
   int wordIndex, lineIndex;
   int parMin, parMax;
   bool nowrap;

   //DBG_MSG (widget, "extremes", 0, "Dw_page_get_extremes");
   //DBG_MSG_START (widget);

   // POS (Changhun Jung)
   #if (DEBUG == 1)
	   printf(" In Textblock::getExtrmemsImpl\n");
   #endif

   if (lines->size () == 0) {
      /* empty page */
      extremes->minWidth = 0;
      extremes->maxWidth = 0;
   } else if (wrapRef == -1) {
      /* no rewrap necessary -> values in lines are up to date */
      line = lines->getRef (lines->size () - 1);
      /* Historical note: The former distinction between lines with and without
       * words[first_word]->nowrap set is no longer necessary, since
       * Dw_page_real_word_wrap sets max_word_min to the correct value in any
       * case. */
      extremes->minWidth = line->maxWordMin;
      extremes->maxWidth = misc::max (line->maxParMax, lastLineParMax);
      //DBG_MSG (widget, "extremes", 0, "simple case");
   } else {
      /* Calculate the extremes, based on the values in the line from
         where a rewrap is necessary. */
      //DBG_MSG (widget, "extremes", 0, "complex case");

      if (wrapRef == 0) {
         extremes->minWidth = 0;
         extremes->maxWidth = 0;
         parMin = 0;
         parMax = 0;
      } else {
         line = lines->getRef (wrapRef);
         extremes->minWidth = line->maxWordMin;
         extremes->maxWidth = line->maxParMax;
         parMin = line->parMin;
         parMax = line->parMax;

         //DBG_MSGF (widget, "extremes", 0, "parMin = %d", parMin);
      }

      //_MSG ("*** parMin = %d\n", parMin);

     int prevWordSpace = 0;
      for (lineIndex = wrapRef; lineIndex < lines->size (); lineIndex++) {
         //DBG_MSGF (widget, "extremes", 0, "line %d", lineIndex);
         //DBG_MSG_START (widget);

         line = lines->getRef (lineIndex);
         nowrap =
            words->getRef(line->firstWord)->style->whiteSpace
            != core::style::WHITE_SPACE_NORMAL;

         //DEBUG_MSG (DEBUG_SIZE_LEVEL, "   line %d (of %d), nowrap = %d\n",
         //           lineIndex, page->num_lines, nowrap);
 
         for (wordIndex = line->firstWord; wordIndex <= line->lastWord;
              wordIndex++) {
            word = words->getRef (wordIndex);
            getWordExtremes (word, &wordExtremes);

            /* For the first word, we simply add the line1_offset. */
            if (ignoreLine1OffsetSometimes && wordIndex == 0) {
               wordExtremes.minWidth += line1Offset;
               //DEBUG_MSG (DEBUG_SIZE_LEVEL + 1,
               //           "      (next plus %d)\n", page->line1_offset);
            }

            if (nowrap) {
               parMin += prevWordSpace + wordExtremes.minWidth;
               //DBG_MSGF (widget, "extremes", 0, "parMin = %d", parMin);
            } else {
               if (extremes->minWidth < wordExtremes.minWidth)
                  extremes->minWidth = wordExtremes.minWidth;
            }

            _MSG("parMax = %d, wordMaxWidth=%d, prevWordSpace=%d\n",
                 parMax, wordExtremes.maxWidth, prevWordSpace);
            if (word->content.type != core::Content::BREAK)
               parMax += prevWordSpace;
            parMax += wordExtremes.maxWidth;
            prevWordSpace = word->origSpace;

            //DEBUG_MSG (DEBUG_SIZE_LEVEL + 1,
            //           "      word %s: maxWidth = %d\n",
            //           a_Dw_content_text (&word->content),
            //           word_extremes.maxWidth);
         }

         /* This "line->lastWord >= line->firstWord" test seems questionable */

         if ((line->lastWord >= line->firstWord &&
              words->getRef(line->lastWord)->content.type
              == core::Content::BREAK ) ||
             lineIndex == lines->size () - 1 ) {
            word = words->getRef (line->lastWord);

            //DEBUG_MSG (DEBUG_SIZE_LEVEL + 2,
            //           "   parMax = %d, after word %d (%s)\n",
            //           parMax, line->last_word - 1,
            //           a_Dw_content_text (&word->content));

            if (extremes->maxWidth < parMax)
               extremes->maxWidth = parMax;

            if (nowrap) {
               //DBG_MSGF (widget, "extremes", 0, "parMin = %d", parMin);
               if (extremes->minWidth < parMin)
                  extremes->minWidth = parMin;

               //DEBUG_MSG (DEBUG_SIZE_LEVEL + 2,
               //           "   parMin = %d, after word %d (%s)\n",
               //           parMin, line->last_word - 1,
               //           a_Dw_content_text (&word->content));
            }

            prevWordSpace = 0;
            parMin = 0;
            parMax = 0;
         }

         //DBG_MSG_END (widget);
      }

      //DEBUG_MSG (DEBUG_SIZE_LEVEL + 3, "   Result: %d, %d\n",
      //           extremes->minWidth, extremes->maxWidth);
   }

   //DBG_MSGF (widget, "extremes", 0, "width difference: %d + %d",
   //          page->inner_padding, p_Dw_style_box_diff_width (widget->style));

   int diff = innerPadding + getStyle()->boxDiffWidth ();
   extremes->minWidth += diff;
   extremes->maxWidth += diff;
   
   // POS (Changhun Jung)
   #if (DEBUG == 1)
	   printf(" In Textblock::getExtrmemsImpl -END-\n");
   #endif

   
   //DBG_MSG_END (widget);
}


void Textblock::sizeAllocateImpl (core::Allocation *allocation)
{
   int lineIndex, wordIndex;
   Line *line;
   Word *word;
   int xCursor;
   core::Allocation childAllocation;
   core::Allocation *oldChildAllocation;


   #if (DEBUG == 1)
   	printf("In sizeAllocateImpl\n"); //POS (Changhun Jung)
   #endif 
   //printAll();
   
   if (allocation->width != this->allocation.width) {
      redrawY = 0;
   }
   //printf("size: %d\n",lines->size());

   for (lineIndex = 0; lineIndex < lines->size (); lineIndex++) {
      line = lines->getRef (lineIndex);
      xCursor = lineXOffsetWidget (line);

      for (wordIndex = line->firstWord; wordIndex <= line->lastWord;
           wordIndex++) {
         word = words->getRef (wordIndex);
		 //printf("&word: 0x%lX\n",word); // POS (Changhun Jung)
		 // POS (Changhun Jung)
		 #if (DEBUG == 1)
			 words->_print();
		 #endif


		 // printAll(); // POS (Changhun Jung)
         if (wordIndex == lastWordDrawn + 1) {
            redrawY = misc::min (redrawY, lineYOffsetWidget (line));
         }
         switch (word->content.type) {
         case core::Content::WIDGET:
		 	//printf("case Content::WIDGET\n"); //POS (Changhun Jung)
            /** \todo Justification within the line is done here. */
            childAllocation.x = xCursor + allocation->x;
            /* align=top:
               childAllocation.y = line->top + allocation->y;
            */

            /* align=bottom (base line) */
            /* Commented lines break the n2 and n3 test cases at
             * http://www.dillo.org/test/img/ */
            childAllocation.y =
               lineYOffsetCanvasAllocation (line, allocation)
               + (line->ascent - word->size.ascent);
               // - word->content.widget->getStyle()->margin.top;
            childAllocation.width = word->size.width;
            childAllocation.ascent = word->size.ascent;
               // + word->content.widget->getStyle()->margin.top;
            childAllocation.descent = word->size.descent;
               // + word->content.widget->getStyle()->margin.bottom;

			// POS (Changhun Jung)
			//printf("before getAllocation()\n");
			//if(___mode == 0|| ___mode ==1)
	            oldChildAllocation = word->content.widget->getAllocation();
			/*
			if(___mode ==2)
			{
				oldChildAllocation->x = -1;
				oldChildAllocation->y = -1;
				oldChildAllocation->width = 1;				
			}
			*/
			//else if(___mode ==2)
				//oldChildAllocation = allocation;
			//printWord(0);
			//printf("after getAllocation()\n");
			// printf("&allocation: 0x%lX\n",oldChildAllocation);
			
			//printf("childAllocation.x: %d\n",childAllocation.x);
			//printf("childAllocation.y: %d\n",childAllocation.y);
			//printf("childAllocation.width: %d\n",childAllocation.width);

			//printf("oldchildAllocation.x: %d\n",oldChildAllocation->x);
			//printf("oldchildAllocation.y: %d\n",oldChildAllocation->y);
			//printf("oldchildAllocation.width: %d\n",oldChildAllocation->width);
			
            if (childAllocation.x != oldChildAllocation->x ||
               childAllocation.y != oldChildAllocation->y ||
               childAllocation.width != oldChildAllocation->width) {
               /* The child widget has changed its position or its width
                * so we need to redraw from this line onwards.
                */
               //printf("before redrawY\n"); //POS (Changhun Jung) 
               redrawY = misc::min (redrawY, lineYOffsetWidget (line));
               //printf("after redrawY\n"); //POS (Changhun Jung)			   
               if (word->content.widget->wasAllocated ()) {
                  redrawY = misc::min (redrawY,
                     oldChildAllocation->y - this->allocation.y);
               }
            } else if (childAllocation.ascent + childAllocation.descent !=
               oldChildAllocation->ascent + oldChildAllocation->descent) {
               /* The child widget has changed its height. We need to redraw
                * from where it changed.
                * It's important not to draw from the line base, because the
                * child might be a table covering the whole page so we would
                * end up redrawing the whole screen over and over.
                * The drawing of the child content is left to the child itself.
                */
               //printf(" In else \n"); //POS (Changhun Jung)
               int childChangedY =
                  misc::min(childAllocation.y - allocation->y +
                     childAllocation.ascent + childAllocation.descent,
                     oldChildAllocation->y - this->allocation.y +
                     oldChildAllocation->ascent + oldChildAllocation->descent);
               //printf(" before redrawY\n"); //POS (Changhun Jung)
               redrawY = misc::min (redrawY, childChangedY);
               //printf(" after redrawY\n"); //POS (Changhun Jung)		   
            }
			 //printf("sizeAllocate(childAllocation) ... \n"); // POS (Changhun Jung)
            word->content.widget->sizeAllocate (&childAllocation);
            break;

         default:
            // make compiler happy
            
            break;
         }
         xCursor += (word->size.width + word->effSpace);
      }
   }

   //printf("second for\n"); //POS (Changhun Jung)
   for (int i = 0; i < anchors->size(); i++) {
      Anchor *anchor = anchors->getRef(i);
      int y;
      if (anchor->wordIndex >= words->size()) {
         y = allocation->y + allocation->ascent + allocation->descent;
      } else {
         Line *line = lines->getRef(findLineOfWord (anchor->wordIndex));
         y = lineYOffsetCanvasAllocation (line, allocation);
      }

	if(___mode != 2) // POS (Changhun Jung)	 
      changeAnchor (anchor->name, y);

   }


   //POS (Changhun Jung)
   #if (DEBUG == 1)
	   	printf("sizeAllocateImpl -END-\n");  
   #endif
}

void Textblock::resizeDrawImpl ()
{
   queueDrawArea (0, redrawY, allocation.width, getHeight () - redrawY);
   if (lines->size () > 0) {
      Line *lastLine = lines->getRef (lines->size () - 1);
      /* Remember the last word that has been drawn so we can ensure to
       * draw any new added words (see sizeAllocateImpl()).
       */
      lastWordDrawn = lastLine->lastWord;
   }

   redrawY = getHeight ();
}

void Textblock::markSizeChange (int ref)
{
   markChange (ref);
}

void Textblock::markExtremesChange (int ref)
{
   markChange (ref);
}

/*
 * Implementation for both mark_size_change and mark_extremes_change.
 */
void Textblock::markChange (int ref)
{
   if (ref != -1) {
      //DBG_MSGF (page, "wrap", 0, "Dw_page_mark_size_change (ref = %d)", ref);

      if (wrapRef == -1)
         wrapRef = ref;
      else
         wrapRef = misc::min (wrapRef, ref);

      //DBG_OBJ_SET_NUM (page, "wrap_ref", page->wrap_ref);
   }
}

void Textblock::setWidth (int width)
{
   //printf("In Textblock::setWidth\n");
   /* If limitTextWidth is set to YES, a queue_resize may also be
    * necessary. */
   if (availWidth != width || limitTextWidth) {
      //DEBUG_MSG(DEBUG_REWRAP_LEVEL,
      //          "Dw_page_set_width: Calling p_Dw_widget_queue_resize, "
      //          "in page with %d word(s)\n",
      //          page->num_words);

      availWidth = width;
  	  //printf("before queueResize\n");
      queueResize (0, false);
   	  //printf("after queueResize\n");
      mustQueueResize = false;
      redrawY = 0;
   }
}

void Textblock::setAscent (int ascent)
{
	//printf("in Textblock as;dlkfja;sldkjf\n");
   if (availAscent != ascent) {
      //DEBUG_MSG(DEBUG_REWRAP_LEVEL,
      //          "Dw_page_set_ascent: Calling p_Dw_widget_queue_resize, "
      //          "in page with %d word(s)\n",
      //          page->num_words);

      availAscent = ascent;
      queueResize (0, false);
      mustQueueResize = false;
   }
}

void Textblock::setDescent (int descent)
{
   if (availDescent != descent) {
      //DEBUG_MSG(DEBUG_REWRAP_LEVEL,
      //          "Dw_page_set_descent: Calling p_Dw_widget_queue_resize, "
      //          "in page with %d word(s)\n",
      //          page->num_words);

      availDescent = descent;
      queueResize (0, false);
      mustQueueResize = false;
   }
}

bool Textblock::buttonPressImpl (core::EventButton *event)
{
   return sendSelectionEvent (core::SelectionState::BUTTON_PRESS, event);
}

bool Textblock::buttonReleaseImpl (core::EventButton *event)
{
   return sendSelectionEvent (core::SelectionState::BUTTON_RELEASE, event);
}

bool Textblock::motionNotifyImpl (core::EventMotion *event)
{
   if (event->state & core::BUTTON1_MASK)
      return sendSelectionEvent (core::SelectionState::BUTTON_MOTION, event);
   else {
      bool inSpace;
      int linkOld = hoverLink;
      core::style::Tooltip *tooltipOld = hoverTooltip;
      const Word *word = findWord (event->xWidget, event->yWidget, &inSpace);

      // cursor from word or widget style
      if (word == NULL) {
         setCursor (getStyle()->cursor);
         hoverLink = -1;
         hoverTooltip = NULL;
      } else {
         core::style::Style *style = inSpace ? word->spaceStyle : word->style;
         setCursor (style->cursor);
         hoverLink = style->x_link;
         hoverTooltip = style->x_tooltip;
      }
      // Show/hide tooltip
      if (tooltipOld != hoverTooltip) {
         if (tooltipOld)
            tooltipOld->onLeave ();
         if (hoverTooltip)
            hoverTooltip->onEnter ();
      } else if (hoverTooltip)
         hoverTooltip->onMotion ();

      if (hoverLink != linkOld)
         return layout->emitLinkEnter (this, hoverLink, -1, -1, -1);
      else
         return hoverLink != -1;
   }
}

void Textblock::enterNotifyImpl (core::EventCrossing *event)
{
}

void Textblock::leaveNotifyImpl (core::EventCrossing *event)
{
   hoverLink = -1;
   (void) layout->emitLinkEnter (this, hoverLink, -1, -1, -1);
   if (hoverTooltip) {
      hoverTooltip->onLeave();
      hoverTooltip = NULL;
   }
}

/**
 * \brief Send event to selection.
 */
bool Textblock::sendSelectionEvent (core::SelectionState::EventType eventType,
                                    core::MousePositionEvent *event)
{
   core::Iterator *it;
   Line *line, *lastLine;
   int nextWordStartX, wordStartX, wordX, nextWordX, yFirst, yLast;
   int charPos = 0, prevPos, wordIndex, lineIndex, link;
   Word *word;
   bool found, withinContent, r;

   if (words->size () == 0)
      // no contens at all
      return false;

   // In most cases true, so set here:
   link = -1;
   withinContent = true;

   lastLine = lines->getRef (lines->size () - 1);
   yFirst = lineYOffsetCanvasI (0);
   yLast =
      lineYOffsetCanvas (lastLine) + lastLine->ascent + lastLine->descent;
   if (event->yCanvas < yFirst) {
      // Above the first line: take the first word.
      withinContent = false;
      wordIndex = 0;
      charPos = 0;
   } else if (event->yCanvas >= yLast) {
      // Below the last line: take the last word.
      withinContent = false;
      wordIndex = words->size () - 1;
      word = words->getRef (wordIndex);
      charPos = word->content.type == core::Content::TEXT ?
         strlen (word->content.text) : 0;
   } else {
      lineIndex = findLineIndex (event->yWidget);
      line = lines->getRef (lineIndex);

      // Pointer within the break space?
      if (event->yWidget >
          (lineYOffsetWidget (line) + line->ascent + line->descent)) {
         // Choose this break.
         withinContent = false;
         wordIndex = line->lastWord;
         charPos = 0;
      } else if (event->xWidget < lineXOffsetWidget (line)) {
         // Left of the first word in the line.
         wordIndex = line->firstWord;
         withinContent = false;
         charPos = 0;
      } else {
         nextWordStartX = lineXOffsetWidget (line);
         found = false;
         for (wordIndex = line->firstWord;
              !found && wordIndex <= line->lastWord;
              wordIndex++) {
            word = words->getRef (wordIndex);
            wordStartX = nextWordStartX;
            nextWordStartX += word->size.width + word->effSpace;

            if (event->xWidget >= wordStartX &&
                event->xWidget < nextWordStartX) {
               // We have found the word.
               if (word->content.type == core::Content::TEXT) {
                  // Search the character the mouse pointer is in.
                  // nextWordX is the right side of this character.
                  charPos = 0;
                  while ((nextWordX = wordStartX +
                          layout->textWidth (word->style->font,
                                             word->content.text, charPos))
                         <= event->xWidget)
                     charPos = layout->nextGlyph (word->content.text, charPos);

                  // The left side of this character.
                  prevPos = layout->prevGlyph (word->content.text, charPos);
                  wordX = wordStartX + layout->textWidth (word->style->font,
                                                          word->content.text,
                                                          prevPos);

                  // If the mouse pointer is left from the middle, use the left
                  // position, otherwise, use the right one.
                  if (event->xWidget <= (wordX + nextWordX) / 2)
                     charPos = prevPos;
               } else {
                  // Depends on whether the pointer is within the left or
                  // right half of the (non-text) word.
                  if (event->xWidget >=
                      (wordStartX + nextWordStartX) / 2)
                     charPos = core::SelectionState::END_OF_WORD;
                  else
                     charPos = 0;
               }

               found = true;
               link = word->style ? word->style->x_link : -1;
               break;
            }
         }

         if (!found) {
            // No word found in this line (i.e. we are on the right side),
            // take the last of this line.
            withinContent = false;
            wordIndex = line->lastWord;
            if (wordIndex >= words->size ())
               wordIndex--;
            word = words->getRef (wordIndex);
            charPos = word->content.type == core::Content::TEXT ?
               strlen (word->content.text) :
               (int)core::SelectionState::END_OF_WORD;
         }
      }
   }

   it = new TextblockIterator (this, core::Content::SELECTION_CONTENT,
                               wordIndex);
   r = selectionHandleEvent (eventType, it, charPos, link, event,
                             withinContent);
   it->unref ();
   return r;
}

void Textblock::removeChild (Widget *child)
{
   /** \bug Not implemented. */
}

core::Iterator *Textblock::iterator (core::Content::Type mask, bool atEnd)
{
   return new TextblockIterator (this, mask, atEnd);
}

/*
 * ...
 *
 * availWidth is passed from wordWrap, to avoid calculating it twice.
 */
void Textblock::justifyLine (Line *line, int availWidth)
{
   /* To avoid rounding errors, the calculation is based on accumulated
    * values (*_cum). */
   int i;
   int origSpaceSum, origSpaceCum;
   int effSpaceDiffCum, lastEffSpaceDiffCum;
   int diff;

   diff = availWidth - lastLineWidth;
   if (diff > 0) {
      origSpaceSum = 0;
      for (i = line->firstWord; i < line->lastWord; i++)
         origSpaceSum += words->getRef(i)->origSpace;

      origSpaceCum = 0;
      lastEffSpaceDiffCum = 0;
      for (i = line->firstWord; i < line->lastWord; i++) {
         origSpaceCum += words->getRef(i)->origSpace;

         if (origSpaceCum == 0)
            effSpaceDiffCum = lastEffSpaceDiffCum;
         else
            effSpaceDiffCum = diff * origSpaceCum / origSpaceSum;

         words->getRef(i)->effSpace = words->getRef(i)->origSpace +
            (effSpaceDiffCum - lastEffSpaceDiffCum);
         //DBG_OBJ_ARRSET_NUM (page, "words.%d.eff_space", i,
         //                    page->words[i].eff_space);

         lastEffSpaceDiffCum = effSpaceDiffCum;
      }
   }
}


void Textblock::addLine (int wordInd, bool newPar)
{
   Line *lastLine, *plastLine;

   //DBG_MSG (page, "wrap", 0, "Dw_page_add_line");
   //DBG_MSG_START (page);

   lines->increase ();
   //DBG_OBJ_SET_NUM(page, "num_lines", page->num_lines);

   //DEBUG_MSG (DEBUG_REWRAP_LEVEL, "--- new line %d in %p, with word %d of %d"
   //           "\n", page->num_lines - 1, page, word_ind, page->num_words);

   lastLine = lines->getRef (lines->size () - 1);

   if (lines->size () == 1)
      plastLine = NULL;
   else
      plastLine = lines->getRef (lines->size () - 2);

   if (plastLine) {
      /* second or more lines: copy values of last line */
      lastLine->top =
         plastLine->top + plastLine->ascent +
         plastLine->descent + plastLine->breakSpace;
      lastLine->maxLineWidth = plastLine->maxLineWidth;
      lastLine->maxWordMin = plastLine->maxWordMin;
      lastLine->maxParMax = plastLine->maxParMax;
      lastLine->parMin = plastLine->parMin;
      lastLine->parMax = plastLine->parMax;
   } else {
      /* first line: initialize values */
      lastLine->top = 0;
      lastLine->maxLineWidth = line1OffsetEff;
      lastLine->maxWordMin = 0;
      lastLine->maxParMax = 0;
      lastLine->parMin =  line1OffsetEff;
      lastLine->parMax =  line1OffsetEff;
   }

   //DBG_OBJ_ARRSET_NUM (page, "lines.%d.top", page->num_lines - 1,
   //                    lastLine->top);
   //DBG_OBJ_ARRSET_NUM (page, "lines.%d.maxLineWidth", page->num_lines - 1,
   //                    lastLine->maxLineWidth);
   //DBG_OBJ_ARRSET_NUM (page, "lines.%d.maxWordMin", page->num_lines - 1,
   //                    lastLine->maxWordMin);
   //DBG_OBJ_ARRSET_NUM (page, "lines.%d.maxParMax", page->num_lines - 1,
   //                    lastLine->maxParMax);
   //DBG_OBJ_ARRSET_NUM (page, "lines.%d.parMin", page->num_lines - 1,
   //                    lastLine->parMin);
   //DBG_OBJ_ARRSET_NUM (page, "lines.%d.parMax", page->num_lines - 1,
   //                    lastLine->parMax);

   lastLine->firstWord = wordInd;
   lastLine->ascent = 0;
   lastLine->descent = 0;
   lastLine->marginDescent = 0;
   lastLine->breakSpace = 0;
   lastLine->leftOffset = 0;

   //DBG_OBJ_ARRSET_NUM (page, "lines.%d.ascent", page->num_lines - 1,
   //                    lastLine->ascent);
   //DBG_OBJ_ARRSET_NUM (page, "lines.%d.descent", page->num_lines - 1,
   //                    lastLine->descent);

   /* update values in line */
   lastLine->maxLineWidth = misc::max (lastLine->maxLineWidth, lastLineWidth);

   if (lines->size () > 1)
      lastLineWidth = 0;
   else
      lastLineWidth = line1OffsetEff;

   if (newPar) {
      lastLine->maxParMax = misc::max (lastLine->maxParMax, lastLineParMax);
      //DBG_OBJ_ARRSET_NUM (page, "lines.%d.maxParMax", page->num_lines - 1,
      //                    lastLine->maxParMax);

      if (lines->size () > 1) {
         lastLine->parMin = 0;
         lastLine->parMax = 0;
      } else {
         lastLine->parMin = line1OffsetEff;
         lastLine->parMax = line1OffsetEff;
      }
      lastLineParMin = 0;
      lastLineParMax = 0;

      //DBG_OBJ_SET_NUM(page, "lastLineParMin", page->lastLineParMin);
      //DBG_OBJ_SET_NUM(page, "lastLineParMax", page->lastLineParMax);
   }

   lastLine->parMin = lastLineParMin;
   lastLine->parMax = lastLineParMax;

   //DBG_OBJ_ARRSET_NUM (page, "lines.%d.parMin", page->num_lines - 1,
   //                    lastLine->parMin);
   //DBG_OBJ_ARRSET_NUM (page, "lines.%d.parMax", page->num_lines - 1,
   //                    lastLine->parMax);

   //DBG_MSG_END (page);
}

/*
 * This method is called in two cases: (i) when a word is added (by
 * Dw_page_add_word), and (ii) when a page has to be (partially)
 * rewrapped. It does word wrap, and adds new lines, if necessary.
 */
void Textblock::wordWrap(int wordIndex)
{
   Line *lastLine;
   Word *word;
   int availWidth, lastSpace, leftOffset;
   bool newLine = false, newPar = false;
   core::Extremes wordExtremes;


   //MSG("In Textblock::wordWrap\n"); //POS (Changhun Jung)
   //DBG_MSGF (page, "wrap", 0, "Dw_page_real_word_wrap (%d): %s, width = %d",
   //          word_ind, a_Dw_content_html (&page->words[word_ind].content),
   //          page->words[word_ind].size.width);
   //DBG_MSG_START (page);

   availWidth = this->availWidth - getStyle()->boxDiffWidth() - innerPadding;
   if (limitTextWidth &&
       layout->getUsesViewport () &&
       availWidth > layout->getWidthViewport () - 10)
      availWidth = layout->getWidthViewport () - 10;

   word = words->getRef (wordIndex);

   if (lines->size () == 0) {
      //DBG_MSG (page, "wrap", 0, "first line");
      newLine = true;
      newPar = true;
      lastLine = NULL;
   } else {
      Word *prevWord = words->getRef (wordIndex - 1);

      lastLine = lines->getRef (lines->size () - 1);

      if (prevWord->content.type == core::Content::BREAK) {
         //DBG_MSG (page, "wrap", 0, "after a break");
         /* previous word is a break */
         newLine = true;
         newPar = true;
      } else if (word->style->whiteSpace
                 != core::style::WHITE_SPACE_NORMAL) {
         //DBG_MSGF (page, "wrap", 0, "no wrap (white_space = %d)",
         //          word->style->white_space);
         newLine = false;
         newPar = false;
      } else {
         if (lastLine->firstWord != wordIndex) {
            /* Does new word fit into the last line? */
            //DBG_MSGF (page, "wrap", 0,
            //          "word %d (%s) fits? (%d + %d + %d &lt;= %d)...",
            //          word_ind, a_Dw_content_html (&word->content),
            //          page->lastLine_width, prevWord->orig_space,
            //          word->size.width, availWidth);
            newLine = (lastLineWidth + prevWord->origSpace
                       + word->size.width > availWidth);
            //DBG_MSGF (page, "wrap", 0, "... %s.",
            //          newLine ? "No" : "Yes");
         }
      }
   }

   /* Has sometimes the wrong value. */
   word->effSpace = word->origSpace;
   //DBG_OBJ_ARRSET_NUM (page,"words.%d.eff_space", word_ind, word->eff_space);

   /* Test, whether line1_offset can be used. */
   if (wordIndex == 0) {
      if (ignoreLine1OffsetSometimes) {
         if (line1Offset + word->size.width > availWidth)
            line1OffsetEff = 0;
         else
            line1OffsetEff = line1Offset;
      } else
         line1OffsetEff = line1Offset;
   }

   if (lastLine != NULL && newLine && !newPar &&
       word->style->textAlign == core::style::TEXT_ALIGN_JUSTIFY)
      justifyLine (lastLine, availWidth);

   if (newLine) {
      addLine (wordIndex, newPar);
      lastLine = lines->getRef (lines->size () - 1);
   }

   lastLine->lastWord = wordIndex;
   lastLine->ascent = misc::max (lastLine->ascent, (int) word->size.ascent);
   lastLine->descent = misc::max (lastLine->descent, (int) word->size.descent);

   //DBG_OBJ_ARRSET_NUM (page, "lines.%d.ascent", page->num_lines - 1,
   //                    lastLine->ascent);
   //DBG_OBJ_ARRSET_NUM (page, "lines.%d.descent", page->num_lines - 1,
   //                    lastLine->descent);

   if (word->content.type == core::Content::WIDGET) {
      lastLine->marginDescent =
         misc::max (lastLine->marginDescent,
                    word->size.descent +
                    word->content.widget->getStyle()->margin.bottom);

      //DBG_OBJ_ARRSET_NUM (page, "lines.%d.descent", page->num_lines - 1,
      //                    lastLine->descent);

      /* If the widget is not in the first line of the paragraph, its top
       * margin may make the line higher.
       */
      if (lines->size () > 1) {
         /* Here, we know already what the break and the bottom margin
          * contributed to the space before this line.
          */
         lastLine->ascent =
            misc::max (lastLine->ascent,
                       word->size.ascent
                       + word->content.widget->getStyle()->margin.top);

         //DBG_OBJ_ARRSET_NUM (page, "lines.%d.ascent", page->num_lines - 1,
         //                    lastLine->ascent);
      }
   } else
      lastLine->marginDescent =
         misc::max (lastLine->marginDescent, lastLine->descent);

   getWordExtremes (word, &wordExtremes);
   lastSpace = (wordIndex > 0) ? words->getRef(wordIndex - 1)->origSpace : 0;

   if (word->content.type == core::Content::BREAK)
      lastLine->breakSpace =
         misc::max (word->content.breakSpace,
                    lastLine->marginDescent - lastLine->descent,
                    lastLine->breakSpace);

   lastLineWidth += word->size.width;
   if (!newLine)
      lastLineWidth += lastSpace;

   lastLineParMin += wordExtremes.maxWidth;
   lastLineParMax += wordExtremes.maxWidth;
   if (!newPar) {
      lastLineParMin += lastSpace;
      lastLineParMax += lastSpace;
   }

   if (word->style->whiteSpace != core::style::WHITE_SPACE_NORMAL) {
      lastLine->parMin += wordExtremes.minWidth + lastSpace;
      /* This may also increase the accumulated minimum word width.  */
      lastLine->maxWordMin =
         misc::max (lastLine->maxWordMin, lastLine->parMin);
      /* NOTE: Most code relies on that all values of nowrap are equal for all
       * words within one line. */
   } else
      /* Simple case. */
      lastLine->maxWordMin =
         misc::max (lastLine->maxWordMin, wordExtremes.minWidth);

   //DBG_OBJ_SET_NUM(page, "lastLine_par_min", page->lastLine_par_min);
   //DBG_OBJ_SET_NUM(page, "lastLine_par_max", page->lastLine_par_max);
   //DBG_OBJ_ARRSET_NUM (page, "lines.%d.par_min", page->num_lines - 1,
   //                    lastLine->par_min);
   //DBG_OBJ_ARRSET_NUM (page, "lines.%d.par_max", page->num_lines - 1,
   //                    lastLine->par_max);
   //DBG_OBJ_ARRSET_NUM (page, "lines.%d.max_word_min", page->num_lines - 1,
   //                    lastLine->max_word_min);

   /* Finally, justify the line. Breaks are ignored, since the HTML
    * parser sometimes assignes the wrong style to them. (TODO: ) */
   if (word->content.type != core::Content::BREAK) {
      switch (word->style->textAlign) {
      case core::style::TEXT_ALIGN_LEFT:
      case core::style::TEXT_ALIGN_JUSTIFY:  /* see some lines above */
      case core::style::TEXT_ALIGN_STRING:   /* handled elsewhere (in the
                                                * future) */
         leftOffset = 0;
         break;

      case core::style::TEXT_ALIGN_RIGHT:
         leftOffset = availWidth - lastLineWidth;
         break;

      case core::style::TEXT_ALIGN_CENTER:
         leftOffset = (availWidth - lastLineWidth) / 2;
         break;

      default:
         /* compiler happiness */
         leftOffset = 0;
      }

      /* For large lines (images etc), which do not fit into the viewport: */
      if (leftOffset < 0)
         leftOffset = 0;

      if (hasListitemValue &&
          lastLine == lines->getRef (0)) {
         /* List item markers are always on the left. */
         lastLine->leftOffset = 0;
         words->getRef(0)->effSpace = words->getRef(0)->origSpace + leftOffset;
         //DBG_OBJ_ARRSET_NUM (page, "words.%d.eff_space", 0,
         //                    page->words[0].eff_space);
      } else
         lastLine->leftOffset = leftOffset;
   }

   mustQueueResize = true;

   //DBG_MSG_END (page);
}


/**
 * Calculate the size of a widget within the page.
 * (Subject of change in the near future!)
 */
void Textblock::calcWidgetSize (core::Widget *widget, core::Requisition *size)
{
   //POS (Changhun Jung)
   #if (DEBUG == 1)
   	printf("In Textblock::calcWidgetSize");
   #endif

   
   core::Requisition requisition;
   int availWidth, availAscent, availDescent;
   core::style::Style *wstyle = widget->getStyle();

   /* We ignore line1_offset[_eff]. */
   availWidth = this->availWidth - getStyle()->boxDiffWidth () - innerPadding;
   availAscent = this->availAscent - getStyle()->boxDiffHeight ();
   availDescent = this->availDescent;

   if (widget->usesHints ()) {
      widget->setWidth (availWidth);
      widget->setAscent (availAscent);
      widget->setDescent (availDescent);

      widget->sizeRequest (size);
 
//      size->ascent -= wstyle->margin.top;
//      size->descent -= wstyle->margin.bottom;
   } else {
      /* TODO: Use margin.{top|bottom} here, like above.
       * (No harm for the next future.) */
      if (wstyle->width == core::style::LENGTH_AUTO ||
          wstyle->height == core::style::LENGTH_AUTO)
         widget->sizeRequest (&requisition);

      if (wstyle->width == core::style::LENGTH_AUTO)
         size->width = requisition.width;
      else if (core::style::isAbsLength (wstyle->width))
         /* Fixed lengths are only applied to the content, so we have to
          * add padding, border and margin. */
         size->width = core::style::absLengthVal (wstyle->width)
            + wstyle->boxDiffWidth ();
      else
         size->width = (int) (core::style::perLengthVal (wstyle->width)
                       * availWidth);

      if (wstyle->height == core::style::LENGTH_AUTO) {
         size->ascent = requisition.ascent;
         size->descent = requisition.descent;
      } else if (core::style::isAbsLength (wstyle->height)) {
         /* Fixed lengths are only applied to the content, so we have to
          * add padding, border and margin. */
         size->ascent = core::style::absLengthVal (wstyle->height)
                        + wstyle->boxDiffHeight ();
         size->descent = 0;
      } else {
         double len = core::style::perLengthVal (wstyle->height);
         size->ascent = (int) (len * availAscent);
         size->descent = (int) (len * availDescent);
      }
   }
   //POS (Changhun Jung)
   #if (DEBUG == 1)
   		printf("In Textblock::calcWidgetSize -END-\n");
   #endif

   
}

/**
 * Rewrap the page from the line from which this is necessary.
 * There are basically two times we'll want to do this:
 * either when the viewport is resized, or when the size changes on one
 * of the child widgets.
 */
void Textblock::rewrap ()
{
   int i, wordIndex;
   Word *word;
   Line *lastLine;

   //POS (Changhun Jung)
   #if (DEBUG == 1)
	   printf("In Textblock::rewrap()\n");
   #endif
   
   
   if (wrapRef == -1)
      /* page does not have to be rewrapped */
      return;

   //DBG_MSGF (page, "wrap", 0,
   //          "Dw_page_rewrap: page->wrap_ref = %d, in page with %d word(s)",
   //          page->wrap_ref, page->num_words);
   //DBG_MSG_START (page);

   /* All lines up from page->wrap_ref will be rebuild from the word list,
    * the line list up from this position is rebuild. */
   
   lines->setSize (wrapRef);
   //printf("after lines->setSize\n"); //POS (Changhun Jung)   
   lastLineWidth = 0;
   //DBG_OBJ_SET_NUM(page, "num_lines", page->num_lines);
   //DBG_OBJ_SET_NUM(page, "lastLine_width", page->lastLine_width);

   /* In the word list, start at the last word plus one in the line before. */
   if (wrapRef > 0) {
      /* Note: In this case, Dw_page_real_word_wrap will immediately find
       * the need to rewrap the line, since we start with the last one (plus
       * one). This is also the reason, why page->lastLine_width is set
       * to the length of the line. */
      lastLine = lines->getRef (lines->size () - 1);
   //printf("after lines->getRef\n"); //POS (Changhun Jung) 
      lastLineParMin = lastLine->parMin;
      lastLineParMax = lastLine->parMax;

      wordIndex = lastLine->lastWord + 1;
      for (i = lastLine->firstWord; i < lastLine->lastWord; i++)
         lastLineWidth += (words->getRef(i)->size.width +
                           words->getRef(i)->origSpace);
      lastLineWidth += words->getRef(lastLine->lastWord)->size.width;
   } else {
      lastLineParMin = 0;
      lastLineParMax = 0;

      wordIndex = 0;
   }

   for (; wordIndex < words->size (); wordIndex++) {
      word = words->getRef (wordIndex);

      if (word->content.type == core::Content::WIDGET)
         calcWidgetSize (word->content.widget, &word->size);
      wordWrap (wordIndex);

      if (word->content.type == core::Content::WIDGET) {
         word->content.widget->parentRef = lines->size () - 1;
         //DBG_OBJ_SET_NUM (word->content.widget, "parent_ref",
         //                 word->content.widget->parent_ref);
      }

      //DEBUG_MSG(DEBUG_REWRAP_LEVEL,
      //          "Assigning parent_ref = %d to rewrapped word %d, "
      //          "in page with %d word(s)\n",
      //          page->num_lines - 1, wordIndex, page->num_words);

      /* todo_refactoring:
      if (word->content.type == DW_CONTENT_ANCHOR)
         p_Dw_gtk_viewport_change_anchor
            (widget, word->content.anchor,
             Dw_page_line_total_y_offset (page,
                                          &page->lines[page->num_lines - 1]));
      */
   }

   /* Next time, the page will not have to be rewrapped. */
   wrapRef = -1;

   //DBG_MSG_END (page);
   
   //POS (Changhun Jung)
   #if (DEBUG == 1)
	   printf("In Textblock::rewrap() -END-\n");
   #endif   
}

/*
 * Draw the decorations on a word.
 */
void Textblock::decorateText(core::View *view, core::style::Style *style,
                             core::style::Color::Shading shading,
                             int x, int yBase, int width)
{
   int y;

   if (style->textDecoration & core::style::TEXT_DECORATION_UNDERLINE) {
      y = yBase + 1;
      view->drawLine (style->color, shading, x, y, x + width - 1, y);
   }
   if (style->textDecoration & core::style::TEXT_DECORATION_OVERLINE) {
      y = yBase - style->font->ascent + 1;
      view->drawLine (style->color, shading, x, y, x + width - 1, y);
   }
   if (style->textDecoration & core::style::TEXT_DECORATION_LINE_THROUGH) {
      int height = 1 + style->font->xHeight / 10;

      y = yBase + (style->font->descent - style->font->ascent) / 2;
      view->drawRectangle (style->color, shading, true, x, y, width, height);
   }
}

/*
 * Draw a word of text.
 */
void Textblock::drawText(int wordIndex, core::View *view,core::Rectangle *area,
                         int xWidget, int yWidgetBase)
{
   //printf("In drawText\n"); //POS (Changhun Jung)

   Word *word = words->getRef(wordIndex);
   int xWorld = allocation.x + xWidget;
   core::style::Style *style = word->style;
   int yWorldBase;

   /* Adjust the text baseline if the word is <SUP>-ed or <SUB>-ed. */
   if (style->valign == core::style::VALIGN_SUB)
      yWidgetBase += style->font->ascent / 3;
   else if (style->valign == core::style::VALIGN_SUPER) {
      yWidgetBase -= style->font->ascent / 2;
   }
   yWorldBase = yWidgetBase + allocation.y;




   /* Draw background (color, image), when given. */
   if (style->hasBackground ())
      drawBox (
         view, style, area, xWidget, yWidgetBase - style->font->ascent,
         word->size.width, style->font->ascent + style->font->descent, false);
   
//POS (Changhun Jung)   
/* 
   printf("before view-drawText \n");
   printf("content.text : %s\n",word->content.text);
   printf("x: %d, y: %d\n",xWorld,yWorldBase);
   printf("color %d\n",style->color->getColor());   
   
   printf("address of style: 0x%lX\n",(unsigned long)style);
   printf("address of clorl: 0x%lX\n",(unsigned long)style->color);
   printf("address of font: 0x%lX\n",(unsigned long)style->font);  
*/
   //printf("font->size: %d\n",style->font->size);
   
   view->drawText (style->font, style->color,
                   core::style::Color::SHADING_NORMAL, xWorld, yWorldBase,
                   word->content.text, strlen (word->content.text));
      
   if (style->textDecoration)
      decorateText(view, style, core::style::Color::SHADING_NORMAL, xWorld,
                   yWorldBase, word->size.width);

   for (int layer = 0; layer < core::HIGHLIGHT_NUM_LAYERS; layer++) {
      if (hlStart[layer].index <= wordIndex &&
          hlEnd[layer].index >= wordIndex) {
         const int wordLen = strlen (word->content.text);
         int xStart, width;
         int firstCharIdx = 0;
         int lastCharIdx = wordLen;

         if (wordIndex == hlStart[layer].index)
            firstCharIdx = misc::min (hlStart[layer].nChar, wordLen);

         if (wordIndex == hlEnd[layer].index)
            lastCharIdx = misc::min (hlEnd[layer].nChar, wordLen);

         xStart = xWorld;
         if (firstCharIdx)
            xStart += layout->textWidth (style->font, word->content.text,
                                         firstCharIdx);
         if (firstCharIdx == 0 && lastCharIdx == wordLen)
            width = word->size.width;
         else
            width = layout->textWidth (style->font,
                                    word->content.text + firstCharIdx,
                                    lastCharIdx - firstCharIdx);
         if (width > 0) {
            /* Highlight text */
            core::style::Color *wordBgColor;

            if (!(wordBgColor =  style->backgroundColor))
               wordBgColor = getBgColor();

            /* Draw background for highlighted text. */
            view->drawRectangle (
               wordBgColor, core::style::Color::SHADING_INVERSE, true, xStart,
               yWorldBase - style->font->ascent, width,
               style->font->ascent + style->font->descent);

            /* Highlight the text. */
            view->drawText (style->font, style->color,
                            core::style::Color::SHADING_INVERSE, xStart,
                            yWorldBase, word->content.text + firstCharIdx,
                            lastCharIdx - firstCharIdx);

            if (style->textDecoration)
               decorateText(view, style, core::style::Color::SHADING_INVERSE,
                            xStart, yWorldBase, width);
         }
      }
   }
}

/*
 * Draw a space.
 */
void Textblock::drawSpace(int wordIndex, core::View *view,
                          core::Rectangle *area, int xWidget, int yWidgetBase)
{
   Word *word = words->getRef(wordIndex);
   int xWorld = allocation.x + xWidget;
   int yWorldBase;
   core::style::Style *style = word->spaceStyle;
   bool highlight = false;

   /* Adjust the space baseline if it is <SUP>-ed or <SUB>-ed */
   if (style->valign == core::style::VALIGN_SUB)
      yWidgetBase += style->font->ascent / 3;
   else if (style->valign == core::style::VALIGN_SUPER) {
      yWidgetBase -= style->font->ascent / 2;
   }
   yWorldBase = allocation.y + yWidgetBase;

   for (int layer = 0; layer < core::HIGHLIGHT_NUM_LAYERS; layer++) {
      if (hlStart[layer].index <= wordIndex &&
          hlEnd[layer].index > wordIndex) {
         highlight = true;
         break;
      }
   }
   if (highlight) {
      core::style::Color *spaceBgColor;

      if (!(spaceBgColor = style->backgroundColor))
         spaceBgColor = getBgColor();

      view->drawRectangle (
         spaceBgColor, core::style::Color::SHADING_INVERSE, true, xWorld,
         yWorldBase - style->font->ascent, word->effSpace,
         style->font->ascent + style->font->descent);
   } else {
      /* Draw space background (color, image), when given. */
      if (style->hasBackground ())
         drawBox (
            view, style, area, xWidget, yWidgetBase - style->font->ascent,
            word->effSpace, style->font->ascent + style->font->descent, false);
   }
   if (style->textDecoration) {
      core::style::Color::Shading shading = highlight ?
         core::style::Color::SHADING_INVERSE :
         core::style::Color::SHADING_NORMAL;

      decorateText(view, style, shading, xWorld, yWorldBase, word->effSpace);
   }
}

/*
 * Paint a line
 * - x and y are toplevel dw coordinates (Question: what Dw? Changed. Test!)
 * - area is used always (ev. set it to event->area)
 * - event is only used when is_expose
 */
void Textblock::drawLine (Line *line, core::View *view, core::Rectangle *area)
{

   //printf("\nIn Textblock::drawLine\n"); //POS (Changhun Jung)
   
   int xWidget = lineXOffsetWidget(line);
   int yWidgetBase = lineYOffsetWidget (line) + line->ascent;

   /* Here's an idea on how to optimize this routine to minimize the number
    * of drawing calls:
    *
    * Copy the text from the words into a buffer, adding a new word
    * only if: the attributes match, and the spacing is either zero or
    * equal to the width of ' '. In the latter case, copy a " " into
    * the buffer. Then draw the buffer. */

   for (int wordIndex = line->firstWord;
        wordIndex <= line->lastWord && xWidget < area->x + area->width;
        wordIndex++) {
      Word *word = words->getRef(wordIndex);
	  
      //printf("after words->getRef\n"); //POS (Changhun Jung)
	  
      if (xWidget + word->size.width + word->effSpace >= area->x) {
         if (word->content.type == core::Content::TEXT ||
             word->content.type == core::Content::WIDGET) {

            if (word->size.width > 0) {
               if (word->content.type == core::Content::WIDGET) {
                  core::Widget *child = word->content.widget;
                  core::Rectangle childArea;

                  if (child->intersects (area, &childArea))
                  {                     
                     child->draw (view, &childArea);
                  }
               } else {
                  drawText(wordIndex, view, area, xWidget, yWidgetBase);
               }
            }
            if (word->effSpace > 0 && wordIndex < line->lastWord &&
                words->getRef(wordIndex + 1)->content.type !=
                                                        core::Content::BREAK) {
               drawSpace(wordIndex, view, area, xWidget + word->size.width,
                         yWidgetBase);
            }

         }
      }
      xWidget += word->size.width + word->effSpace;
   }
}

/**
 * Find the first line index that includes y, relative to top of widget.
 */
int Textblock::findLineIndex (int y)
{
   int maxIndex = lines->size () - 1;
   int step, index, low = 0;

   step = (lines->size() + 1) >> 1;
   while ( step > 1 ) {
      index = low + step;
      if (index <= maxIndex &&
          lineYOffsetWidgetI (index) <= y)
         low = index;
      step = (step + 1) >> 1;
   }

   if (low < maxIndex && lineYOffsetWidgetI (low + 1) <= y)
      low++;

   /*
    * This new routine returns the line number between (top) and
    * (top + size.ascent + size.descent + breakSpace): the space
    * _below_ the line is considered part of the line.  Old routine
    * returned line number between (top - previous_line->breakSpace)
    * and (top + size.ascent + size.descent): the space _above_ the
    * line was considered part of the line.  This is important for
    * Dw_page_find_link() --EG
    * That function has now been inlined into Dw_page_motion_notify() --JV
    */
   return low;
}

/**
 * \brief Find the line of word \em wordIndex.
 */
int Textblock::findLineOfWord (int wordIndex)
{
   int high = lines->size () - 1, index, low = 0;

   //g_return_val_if_fail (word_index >= 0, -1);
   //g_return_val_if_fail (word_index < page->num_words, -1);

   while (true) {
      index = (low + high) / 2;
      if (wordIndex >= lines->getRef(index)->firstWord) {
         if (wordIndex <= lines->getRef(index)->lastWord)
            return index;
         else
            low = index + 1;
      } else
         high = index - 1;
   }
}

/**
 * \brief Find the index of the word, or -1.
 */
Textblock::Word *Textblock::findWord (int x, int y, bool *inSpace)
{
   int lineIndex, wordIndex;
   int xCursor, lastXCursor, yWidgetBase;
   Line *line;
   Word *word;

   *inSpace = false;

   if ((lineIndex = findLineIndex (y)) >= lines->size ())
      return NULL;
   line = lines->getRef (lineIndex);
   yWidgetBase = lineYOffsetWidget (line) + line->ascent;
   if (yWidgetBase + line->descent <= y)
      return NULL;

   xCursor = lineXOffsetWidget (line);
   for (wordIndex = line->firstWord; wordIndex <= line->lastWord;wordIndex++) {
      word = words->getRef (wordIndex);
      lastXCursor = xCursor;
      xCursor += word->size.width + word->effSpace;
      if (lastXCursor <= x && xCursor > x &&
          y > yWidgetBase - word->size.ascent &&
          y <= yWidgetBase + word->size.descent) {
         *inSpace = x >= xCursor - word->effSpace;
         return word;
      }
   }

   return NULL;
}

void Textblock::draw (core::View *view, core::Rectangle *area)
{
   int lineIndex;
   Line *line;

   // printf("in Textblock::draw\n"); // POS (Changhun Jung)
   
   drawWidgetBox (view, area, false);

   // printf("after drawBox\n"); // POS (Changhun Jung)
   
   lineIndex = findLineIndex (area->y);

   for (; lineIndex < lines->size (); lineIndex++) {
      line = lines->getRef (lineIndex);
	  //printf("after lines->getRef\n");
      if (lineYOffsetWidget (line) >= area->y + area->height)
         break;

      drawLine (line, view, area);
   }
}

/**
 * Add a new word (text, widget etc.) to a page.
 */
Textblock::Word *Textblock::addWord (int width, int ascent, int descent,
                                     core::style::Style *style)
{
   Word *word;

   //printf("in addWord\n");
   words->increase ();
   //printf("after words->increase\n");

   word = words->getRef (words->size() - 1);
   word->size.width = width;
   word->size.ascent = ascent;
   word->size.descent = descent;
   word->origSpace = 0;
   word->effSpace = 0;
   word->content.space = false;

   //DBG_OBJ_ARRSET_NUM (page, "words.%d.size.width", page->num_words - 1,
   //                    word->size.width);
   //DBG_OBJ_ARRSET_NUM (page, "words.%d.size.descent", page->num_words - 1,
   //                    word->size.descent);
   //DBG_OBJ_ARRSET_NUM (page, "words.%d.size.ascent", page->num_words - 1,
   //                    word->size.ascent);
   //DBG_OBJ_ARRSET_NUM (page, "words.%d.orig_space", page->num_words - 1,
   //                    word->orig_space);
   //DBG_OBJ_ARRSET_NUM (page, "words.%d.eff_space", page->num_words - 1,
   //                    word->eff_space);
   //DBG_OBJ_ARRSET_NUM (page, "words.%d.content.space", page->num_words - 1,
   //                    word->content.space);

   word->style = style;
   word->spaceStyle = style;
   style->ref ();
   style->ref ();

   return word;
}

/**
 * Calculate the size of a text word.
 */
void Textblock::calcTextSize (const char *text, size_t len,
                              core::style::Style *style,
                              core::Requisition *size)
{
   //printf("in Textblock::calcTextSize\n");
   //printf("before textWidth\n");
   size->width = layout->textWidth (style->font, text, len);
   //printf("before ascent\n");
   size->ascent = style->font->ascent;
   //printf("before descent\n");
   size->descent = style->font->descent;
   //printf("after descent\n");

   /* In case of a sub or super script we increase the word's height and
    * potentially the line's height.
    */
   if (style->valign == core::style::VALIGN_SUB)
      size->descent += (size->ascent / 3);
   else if (style->valign == core::style::VALIGN_SUPER)
      size->ascent += (size->ascent / 2);
}


/**
 * Add a word to the page structure. Stashes the argument pointer in
 * the page data structure so that it will be deallocated on destroy.
 */


void Textblock::addText (const char *text, size_t len,
                         core::style::Style *style)
{
   Word *word;
   core::Requisition size;

   // printf("In addText\n"); // POS (Changhun Jung)
   calcTextSize (text, len, style, &size);
   word = addWord (size.width, size.ascent, size.descent, style);  //inner function modified 
   word->content.type = core::Content::TEXT;

   //POS (Changhun Jung)
   char *newchar;
   
if(___mode == 0) //POS (Changhun Jung)
{
   #if 0
	   word->content.text = layout->textZone->strndup(text, len);
   #endif
   //POS (Changhun Jung)
   #if 1
	   newchar = (char *)malloc(len+1);   	
	   word->content.text = newchar;
	   memcpy(newchar,text,len);
	   newchar[len] = '\0';
	   //printf("malloc(In textlock): 0x%lX\n",newchar);
	   if(newchar == NULL)
	   	printf("malloc error(In textlock)\n");
   #endif
}


//POS (Changhun Jung)
else
{   
   
   newchar = (char *)pos_malloc(__POS_OBJ_NAME,len+1);
   word->content.text = newchar;
   memcpy(newchar,text,len);
   newchar[len] = '\0';
   //printf("pos malloc(In textlock): 0x%lX\n",newchar);
   if(newchar == NULL)
	  printf("pos malloc error(In textlock)\n"); 
}
   
	
   //DBG_OBJ_ARRSET_STR (page, "words.%d.content.text", page->num_words - 1,
   //                    word->content.text);

   wordWrap (words->size () - 1);
}

/**
 * Add a widget (word type) to the page.
 */
void Textblock::addWidget (core::Widget *widget, core::style::Style *style)
{
   Word *word;
   core::Requisition size;

   /* We first assign -1 as parent_ref, since the call of widget->size_request
    * will otherwise let this Textblock be rewrapped from the beginning.
    * (parent_ref is actually undefined, but likely has the value 0.) At the,
    * end of this function, the correct value is assigned. */
   widget->parentRef = -1;


   widget->setParent (this);


   widget->setStyle (style);

   

   calcWidgetSize (widget, &size);
   
   word = addWord (size.width, size.ascent, size.descent, style);


   word->content.type = core::Content::WIDGET;
   word->content.widget = widget;


   //DBG_OBJ_ARRSET_PTR (page, "words.%d.content.widget", page->num_words - 1,
   //                    word->content.widget);

   wordWrap (words->size () - 1);
 
   word->content.widget->parentRef = lines->size () - 1;

   //DBG_OBJ_SET_NUM (word->content.widget, "parent_ref",
   //                 word->content.widget->parent_ref);

   //DEBUG_MSG(DEBUG_REWRAP_LEVEL,
   //          "Assigning parent_ref = %d to added word %d, "
   //          "in page with %d word(s)\n",
   //          page->num_lines - 1, page->num_words - 1, page->num_words);
}


/**
 * Add an anchor to the page. "name" is copied, so no strdup is necessary for
 * the caller.
 *
 * Return true on success, and false, when this anchor had already been
 * added to the widget tree.
 */
bool Textblock::addAnchor (const char *name, core::style::Style *style)
{
   char *copy;
   int y;

   // Since an anchor does not take any space, it is safe to call
   // addAnchor already here.
   if (wasAllocated ()) {
      if (lines->size () == 0)
         y = allocation.y;
      else
         y = allocation.y + lineYOffsetWidgetI (lines->size () - 1);
      copy = Widget::addAnchor (name, y);
   } else
      copy = Widget::addAnchor (name);

   if (copy == NULL)
      /**
       * \todo It may be necessary for future uses to save the anchor in
       *    some way, e.g. when parts of the widget tree change.
       */
      return false;
   else {
      Anchor *anchor;

      anchors->increase();
      anchor = anchors->getRef(anchors->size() - 1);
      anchor->name = copy;
      anchor->wordIndex = words->size();
      return true;
   }
}


/**
 * ?
 */
void Textblock::addSpace (core::style::Style *style)
{
   int wordIndex = words->size () - 1;

   if (wordIndex >= 0) {
      Word *word = words->getRef(wordIndex);

      if (!word->content.space) {
         word->content.space = true;
         word->effSpace = word->origSpace = style->font->spaceWidth;

         //DBG_OBJ_ARRSET_NUM (page, "words.%d.orig_space", nw,
         //                    page->words[nw].orig_space);
         //DBG_OBJ_ARRSET_NUM (page, "words.%d.eff_space", nw,
         //                    page->words[nw].eff_space);
         //DBG_OBJ_ARRSET_NUM (page, "words.%d.content.space", nw,
         //                    page->words[nw].content.space);
         word->spaceStyle->unref ();
         word->spaceStyle = style;
         style->ref ();
      }
   }
}


/**
 * Cause a paragraph break
 */
void Textblock::addParbreak (int space, core::style::Style *style)
{
   Word *word;

   /* A break may not be the first word of a page, or directly after
      the bullet/number (which is the first word) in a list item. (See
      also comment in Dw_page_size_request.) */
   if (words->size () == 0 ||
       (hasListitemValue && words->size () == 1)) {
      /* This is a bit hackish: If a break is added as the
         first/second word of a page, and the parent widget is also a
         Textblock, and there is a break before -- this is the case when
         a widget is used as a text box (lists, blockquotes, list
         items etc) -- then we simply adjust the break before, in a
         way that the space is in any case visible. */
      Widget *widget;

      /* Find the widget where to adjust the breakSpace. */
      for (widget = this;
           widget->getParent() &&
              widget->getParent()->instanceOf (Textblock::CLASS_ID);
           widget = widget->getParent ()) {
         Textblock *textblock2 = (Textblock*)widget->getParent ();
         int index = textblock2->hasListitemValue ? 1 : 0;
         bool isfirst = (textblock2->words->getRef(index)->content.type
                         == core::Content::WIDGET
                         && textblock2->words->getRef(index)->content.widget
                         == widget);
         if (!isfirst) {
            /* The page we searched for has been found. */
            Word *word2;
            int lineno = widget->parentRef;

            if (lineno > 0 &&
                (word2 =
                 textblock2->words->getRef(textblock2->lines
                                           ->getRef(lineno - 1)->firstWord)) &&
                word2->content.type == core::Content::BREAK) {
               if (word2->content.breakSpace < space) {
                  word2->content.breakSpace = space;
                  textblock2->queueResize (lineno, false);
                  textblock2->mustQueueResize = false;
               }
            }
            return;
         }
         /* Otherwise continue to examine parents. */
      }
      /* Return in any case. */
      return;
   }

   /* Another break before? */
   if ((word = words->getRef(words->size () - 1)) &&
       word->content.type == core::Content::BREAK) {
      Line *lastLine = lines->getRef (lines->size () - 1);

      word->content.breakSpace =
         misc::max (word->content.breakSpace, space);
      lastLine->breakSpace =
         misc::max (word->content.breakSpace,
                    lastLine->marginDescent - lastLine->descent,
                    lastLine->breakSpace);
      return;
   }

   word = addWord (0, 0, 0, style);
   word->content.type = core::Content::BREAK;
   word->content.breakSpace = space;
   wordWrap (words->size () - 1);
}

/*
 * Cause a line break.
 */
void Textblock::addLinebreak (core::style::Style *style)
{
   Word *word;

   if (words->size () == 0 ||
       words->getRef(words->size () - 1)->content.type == core::Content::BREAK)
      // An <BR> in an empty line gets the height of the current font
      // (why would someone else place it here?), ...
      word = addWord (0, style->font->ascent, style->font->descent, style);
   else
      // ... otherwise, it has no size (and does not enlarge the line).
      word = addWord (0, 0, 0, style);

   word->content.type = core::Content::BREAK;
   word->content.breakSpace = 0;
   word->style = style;
   wordWrap (words->size () - 1);
}


/**
 * \brief Search recursively through widget.
 *
 * This is an optimized version of the general
 * dw::core::Widget::getWidgetAtPoint method.
 */
core::Widget  *Textblock::getWidgetAtPoint(int x, int y, int level)
{
   int lineIndex, wordIndex;
   Line *line;

   if (x < allocation.x ||
       y < allocation.y ||
       x > allocation.x + allocation.width ||
       y > allocation.y + getHeight ()) {
      return NULL;
   }

   lineIndex = findLineIndex (y - allocation.y);

   if (lineIndex < 0 || lineIndex >= lines->size ()) {
      return this;
   }

   line = lines->getRef (lineIndex);

   for (wordIndex = line->firstWord; wordIndex <= line->lastWord;wordIndex++) {
      Word *word =  words->getRef (wordIndex);

      if (word->content.type == core::Content::WIDGET) {
         core::Widget * childAtPoint;
         childAtPoint = word->content.widget->getWidgetAtPoint (x, y,
                                                                level + 1);
         if (childAtPoint) {
            return childAtPoint;
         }
      }
   }

   return this;
}


/**
 * This function "hands" the last break of a page "over" to a parent
 * page. This is used for "collapsing spaces".
 */
void Textblock::handOverBreak (core::style::Style *style)
{
   if (lines->size() > 0) {
      Widget *parent;
      Line *lastLine = lines->getRef (lines->size () - 1);

      if (lastLine->breakSpace != 0 && (parent = getParent()) &&
          parent->instanceOf (Textblock::CLASS_ID)) {
         Textblock *textblock2 = (Textblock*) parent;
         textblock2->addParbreak(lastLine->breakSpace, style);
      }
   }
}

/*
 * Any words added by a_Dw_page_add_... are not immediately (queued to
 * be) drawn, instead, this function must be called. This saves some
 * calls to p_Dw_widget_queue_resize.
 *
 */
void Textblock::flush ()
{
   if (mustQueueResize) {
      queueResize (-1, true);
      mustQueueResize = false;
   }
}


// next: Dw_page_find_word

void Textblock::changeLinkColor (int link, int newColor)
{
   for (int lineIndex = 0; lineIndex < lines->size(); lineIndex++) {
      bool changed = false;
      Line *line = lines->getRef (lineIndex);
      int wordIdx;

      for (wordIdx = line->firstWord; wordIdx <= line->lastWord; wordIdx++){
         Word *word = words->getRef(wordIdx);

         if (word->style->x_link == link) {
            core::style::StyleAttrs styleAttrs;

            switch (word->content.type) {
            case core::Content::TEXT:
            {  core::style::Style *old_style = word->style;
               styleAttrs = *old_style;
               styleAttrs.color = core::style::Color::create (layout,
                                                              newColor);
               word->style = core::style::Style::create (layout, &styleAttrs);
               old_style->unref();
               old_style = word->spaceStyle;
               styleAttrs = *old_style;
               styleAttrs.color = core::style::Color::create (layout,
                                                              newColor);
               word->spaceStyle =
                               core::style::Style::create(layout, &styleAttrs);
               old_style->unref();
               break;
            }
            case core::Content::WIDGET:
            {  core::Widget *widget = word->content.widget;
               styleAttrs = *widget->getStyle();
               styleAttrs.color = core::style::Color::create (layout,
                                                              newColor);
               styleAttrs.setBorderColor(
                           core::style::Color::create (layout, newColor));
               widget->setStyle(
                             core::style::Style::create (layout, &styleAttrs));
               break;
            }
            default:
               break;
            }
            changed = true;
         }
      }
      if (changed)
         queueDrawArea (0, lineYOffsetWidget(line), allocation.width,
                        line->ascent + line->descent);
   }
}

void Textblock::changeWordStyle (int from, int to, core::style::Style *style,
                                 bool includeFirstSpace, bool includeLastSpace)
{
}

// ----------------------------------------------------------------------

Textblock::TextblockIterator::TextblockIterator (Textblock *textblock,
                                                 core::Content::Type mask,
                                                 bool atEnd):
   core::Iterator (textblock, mask, atEnd)
{
   index = atEnd ? textblock->words->size () : -1;
   content.type = atEnd ? core::Content::END : core::Content::START;
}

Textblock::TextblockIterator::TextblockIterator (Textblock *textblock,
                                                 core::Content::Type mask,
                                                 int index):
   core::Iterator (textblock, mask, false)
{
   this->index = index;

   if (index < 0)
      content.type = core::Content::START;
   else if (index >= textblock->words->size ())
      content.type = core::Content::END;
   else
      content = textblock->words->getRef(index)->content;
}

object::Object *Textblock::TextblockIterator::clone()
{
   return new TextblockIterator ((Textblock*)getWidget(), getMask(), index);
}

int Textblock::TextblockIterator::compareTo(misc::Comparable *other)
{
   return index - ((TextblockIterator*)other)->index;
}

bool Textblock::TextblockIterator::next ()
{
   Textblock *textblock = (Textblock*)getWidget();

   if (content.type == core::Content::END)
      return false;

   do {
      index++;
      if (index >= textblock->words->size ()) {
         content.type = core::Content::END;
         return false;
      }
   } while ((textblock->words->getRef(index)->content.type & getMask()) == 0);

   content = textblock->words->getRef(index)->content;
   return true;
}

bool Textblock::TextblockIterator::prev ()
{
   Textblock *textblock = (Textblock*)getWidget();

   if (content.type == core::Content::START)
      return false;

   do {
      index--;
      if (index < 0) {
         content.type = core::Content::START;
         return false;
      }
   } while ((textblock->words->getRef(index)->content.type & getMask()) == 0);

   content = textblock->words->getRef(index)->content;
   return true;
}

void Textblock::TextblockIterator::highlight (int start, int end,
                                              core::HighlightLayer layer)
{
   Textblock *textblock = (Textblock*)getWidget();
   int index1 = index, index2 = index;

   if (textblock->hlStart[layer].index > textblock->hlEnd[layer].index) {
      /* nothing is highlighted */
      textblock->hlStart[layer].index = index;
      textblock->hlEnd[layer].index = index;
   }

   if (textblock->hlStart[layer].index >= index) {
      index2 = textblock->hlStart[layer].index;
      textblock->hlStart[layer].index = index;
      textblock->hlStart[layer].nChar = start;
   }

   if (textblock->hlEnd[layer].index <= index) {
      index2 = textblock->hlEnd[layer].index;
      textblock->hlEnd[layer].index = index;
      textblock->hlEnd[layer].nChar = end;
   }

   textblock->queueDrawRange (index1, index2);
}

void Textblock::TextblockIterator::unhighlight (int direction,
                                                core::HighlightLayer layer)
{
   Textblock *textblock = (Textblock*)getWidget();
   int index1 = index, index2 = index;

   if (textblock->hlStart[layer].index > textblock->hlEnd[layer].index)
      return;

   if (direction == 0) {
      index1 = textblock->hlStart[layer].index;
      index2 = textblock->hlEnd[layer].index;
      textblock->hlStart[layer].index = 1;
      textblock->hlEnd[layer].index = 0;
   } else if (direction > 0 && textblock->hlStart[layer].index <= index) {
      index1 = textblock->hlStart[layer].index;
      textblock->hlStart[layer].index = index + 1;
      textblock->hlStart[layer].nChar = 0;
   } else if (direction < 0 && textblock->hlEnd[layer].index >= index) {
      index1 = textblock->hlEnd[layer].index;
      textblock->hlEnd[layer].index = index - 1;
      textblock->hlEnd[layer].nChar = INT_MAX;
   }

   textblock->queueDrawRange (index1, index2);
}

void Textblock::queueDrawRange (int index1, int index2)
{
   int from = misc::min (index1, index2);
   int to = misc::max (index1, index2);

   from = misc::min (from, words->size () - 1);
   from = misc::max (from, 0);
   to = misc::min (to, words->size () - 1);
   to = misc::max (to, 0);

   int line1 = findLineOfWord (from);
   int line2 = findLineOfWord (to);

   queueDrawArea (0,
      lineYOffsetWidgetI (line1),
      allocation.width,
      lineYOffsetWidgetI (line2)
      - lineYOffsetWidgetI (line1)
      + lines->getRef (line2)->ascent
      + lines->getRef (line2)->descent);
}

void Textblock::TextblockIterator::getAllocation (int start, int end,
                                                  core::Allocation *allocation)
{
   Textblock *textblock = (Textblock*)getWidget();
   int lineIndex = textblock->findLineOfWord (index);
   Line *line = textblock->lines->getRef (lineIndex);
   Word *word = textblock->words->getRef (index);

   allocation->x =
      textblock->allocation.x + textblock->lineXOffsetWidget (line);

   for (int i = line->firstWord; i < index; i++) {
      Word *w = textblock->words->getRef(i);
      allocation->x += w->size.width + w->effSpace;
   }
   if (start > 0 && word->content.type == core::Content::TEXT) {
      allocation->x += textblock->layout->textWidth (word->style->font,
                                                     word->content.text,
                                                     start);
   }
   allocation->y =
      textblock->allocation.y
      + textblock->lineYOffsetWidget (line) + line->ascent - word->size.ascent;

   allocation->width = word->size.width;
   if (word->content.type == core::Content::TEXT) {
      int wordEnd = strlen(word->content.text);

      if (start > 0 || end < wordEnd) {
         end = misc::min(end, wordEnd); /* end could be INT_MAX */
         allocation->width =
            textblock->layout->textWidth (word->style->font,
                                          word->content.text + start,
                                          end - start);
      }
   }
   allocation->ascent = word->size.ascent;
   allocation->descent = word->size.descent;
}

} // namespace dw
