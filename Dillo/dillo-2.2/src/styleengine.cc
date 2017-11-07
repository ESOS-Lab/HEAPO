/*
 * File: styleengine.cc
 *
 * Copyright 2008-2009 Johannes Hofmann <Johannes.Hofmann@gmx.de>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 */

#include "../dlib/dlib.h"
#include "msg.h"
#include "prefs.h"
#include "html_common.hh"
#include "styleengine.hh"

using namespace dw::core::style;

StyleEngine::StyleEngine (dw::core::Layout *layout) {
   StyleAttrs style_attrs;
   FontAttrs font_attrs;

   doctree = new Doctree ();
   stack = new lout::misc::SimpleVector <Node> (1);
   cssContext = new CssContext ();
   this->layout = layout;
   importDepth = 0;

   stack->increase ();
   Node *n = stack->getRef (stack->size () - 1);

   /* Create a dummy font, attribute, and tag for the bottom of the stack. */
   font_attrs.name = prefs.font_sans_serif;
   font_attrs.size = (int) (14 * prefs.font_factor + 0.5);
   if (font_attrs.size < prefs.font_min_size)
      font_attrs.size = prefs.font_min_size;
   if (font_attrs.size > prefs.font_max_size)
      font_attrs.size = prefs.font_max_size;
   font_attrs.weight = 400;
   font_attrs.style = FONT_STYLE_NORMAL;
   font_attrs.letterSpacing = 0;

   style_attrs.initValues ();
   style_attrs.font = Font::create (layout, &font_attrs);
   style_attrs.color = Color::create (layout, 0);
   style_attrs.backgroundColor = Color::create (layout, 0xffffff);

   n->style = Style::create (layout, &style_attrs);
   n->wordStyle = NULL;
   n->styleAttribute = NULL;
   n->inheritBackgroundColor = false;
}

StyleEngine::~StyleEngine () {
   while (doctree->top ())
      endElement (doctree->top ()->element);
   delete stack;
   delete doctree;
   delete cssContext;
}

/**
 * \brief tell the styleEngine that a new html element has started.
 */
void StyleEngine::startElement (int element) {
   if (stack->getRef (stack->size () - 1)->style == NULL)
      style0 ();

   stack->increase ();
   Node *n = stack->getRef (stack->size () - 1);
   n->style = NULL;
   n->wordStyle = NULL;
   n->styleAttribute = NULL;
   n->inheritBackgroundColor = false;

   DoctreeNode *dn = doctree->push ();
   dn->element = element;
}

void StyleEngine::startElement (const char *tagname) {
   startElement (a_Html_tag_index (tagname));
}

void StyleEngine::setId (const char *id) {
   DoctreeNode *dn =  doctree->top ();
   assert (dn->id == NULL);
   dn->id = dStrdup (id);
};

/**
 * \brief split a string at sep chars and return a SimpleVector of strings
 */
static lout::misc::SimpleVector<char *> *splitStr (const char *str, char sep) {
   const char *p1 = NULL;
   lout::misc::SimpleVector<char *> *list =
      new lout::misc::SimpleVector<char *> (1);

   for (;; str++) {
      if (*str != '\0' && *str != sep) {
         if (!p1)
            p1 = str;
      } else if (p1) {
         list->increase ();
         list->set (list->size () - 1, dStrndup (p1, str - p1));
         p1 = NULL;
      }

      if (*str == '\0')
         break;
   }

   return list;
}

void StyleEngine::setClass (const char *klass) {
   DoctreeNode *dn = doctree->top ();
   assert (dn->klass == NULL);
   dn->klass = splitStr (klass, ' ');
};

void StyleEngine::setStyle (const char *style) {
   Node *n = stack->getRef (stack->size () - 1);
   assert (n->styleAttribute == NULL);
   n->styleAttribute = dStrdup (style);
};

/**
 * \brief set properties that were definded using (mostly deprecated) HTML
 *    attributes (e.g. bgColor).
 */
void StyleEngine::setNonCssHints (CssPropertyList *nonCssHints) {
   if (stack->getRef (stack->size () - 1)->style)
      stack->getRef (stack->size () - 1)->style->unref ();
   style0 (nonCssHints); // evaluate now, so caller can free nonCssHints
}

/**
 * \brief Use of the background color of the parent style as default.
 *   This is only used in table code to allow for colors specified for
 *   table rows as table rows are currently no widgets and therefore
 *   don't draw any background.
 */
void StyleEngine::inheritBackgroundColor () {
   stack->getRef (stack->size () - 1)->inheritBackgroundColor = true;
}

/**
 * \brief set the CSS pseudo class :link.
 */
void StyleEngine::setPseudoLink () {
   DoctreeNode *dn = doctree->top ();
   dn->pseudo = "link";
}

/**
 * \brief set the CSS pseudo class :visited.
 */
void StyleEngine::setPseudoVisited () {
   DoctreeNode *dn = doctree->top ();
   dn->pseudo = "visited";
}

/**
 * \brief tell the styleEngine that a html element has ended.
 */
void StyleEngine::endElement (int element) {
   assert (stack->size () > 0);
   assert (element == doctree->top ()->element);

   Node *n = stack->getRef (stack->size () - 1);

   if (n->style)
      n->style->unref ();
   if (n->wordStyle)
      n->wordStyle->unref ();
   if (n->styleAttribute)
      dFree ((void*) n->styleAttribute);

   doctree->pop ();
   stack->setSize (stack->size () - 1);
}

/**
 * \brief Make changes to StyleAttrs attrs according to CssPropertyList props.
 */
void StyleEngine::apply (StyleAttrs *attrs, CssPropertyList *props) {
   FontAttrs fontAttrs = *attrs->font;
   Font *parentFont = stack->get (stack->size () - 2).style->font;
   char *c, *fontName;

   /* Determine font first so it can be used to resolve relative lenths. */
   for (int i = 0; i < props->size (); i++) {
      CssProperty *p = props->getRef (i);

      switch (p->name) {
         case CSS_PROPERTY_FONT_FAMILY:
            // Check font names in comma separated list.
            // Note, that p->value.strVal is modified, so that in future calls
            // the matching font name can be used directly.
            fontName = NULL;
            while (p->value.strVal) {
               if ((c = strchr(p->value.strVal, ',')))
                  *c = '\0';
               dStrstrip(p->value.strVal);

               if (strcmp (p->value.strVal, "serif") == 0)
                  fontName = prefs.font_serif;
               else if (strcmp (p->value.strVal, "sans-serif") == 0)
                  fontName = prefs.font_sans_serif;
               else if (strcmp (p->value.strVal, "cursive") == 0)
                  fontName = prefs.font_cursive;
               else if (strcmp (p->value.strVal, "fantasy") == 0)
                  fontName = prefs.font_fantasy;
               else if (strcmp (p->value.strVal, "monospace") == 0)
                  fontName = prefs.font_monospace;
               else if (Font::exists(layout, p->value.strVal))
                  fontName = p->value.strVal;

               if (fontName) {   // font found
                  fontAttrs.name = fontName;
                  break;
               } else if (c) {   // try next from list
                  memmove(p->value.strVal, c + 1, strlen(c + 1) + 1);
               } else {          // no font found
                  break;
               }
            }

            break;
         case CSS_PROPERTY_FONT_SIZE:
            if (p->type == CSS_TYPE_ENUM) {
               switch (p->value.intVal) {
                  case CSS_FONT_SIZE_XX_SMALL:
                     fontAttrs.size = (int) (11.0 * prefs.font_factor + 0.5);
                     break;
                  case CSS_FONT_SIZE_X_SMALL:
                     fontAttrs.size = (int) (12.0 * prefs.font_factor + 0.5);
                     break;
                  case CSS_FONT_SIZE_SMALL:
                     fontAttrs.size = (int) (13.0 * prefs.font_factor + 0.5);
                     break;
                  case CSS_FONT_SIZE_MEDIUM:
                     fontAttrs.size = (int) (14.0 * prefs.font_factor + 0.5);
                     break;
                  case CSS_FONT_SIZE_LARGE:
                     fontAttrs.size = (int) (15.0 * prefs.font_factor + 0.5);
                     break;
                  case CSS_FONT_SIZE_X_LARGE:
                     fontAttrs.size = (int) (16.0 * prefs.font_factor + 0.5);
                     break;
                  case CSS_FONT_SIZE_XX_LARGE:
                     fontAttrs.size = (int) (17.0 * prefs.font_factor + 0.5);
                     break;
                  case CSS_FONT_SIZE_SMALLER:
                     fontAttrs.size -= (int) (1.0 * prefs.font_factor + 0.5);
                     break;
                  case CSS_FONT_SIZE_LARGER:
                     fontAttrs.size += (int) (1.0 * prefs.font_factor + 0.5);
                     break;
                  default:
                     assert(false); // invalid font-size enum
               }
            } else {
               computeValue (&fontAttrs.size, p->value.intVal, parentFont,
                  parentFont->size);
            }

            if (fontAttrs.size < prefs.font_min_size)
               fontAttrs.size = prefs.font_min_size;
            if (fontAttrs.size > prefs.font_max_size)
               fontAttrs.size = prefs.font_max_size;

            break;
         case CSS_PROPERTY_FONT_STYLE:
            fontAttrs.style = (FontStyle) p->value.intVal;
            break;
         case CSS_PROPERTY_FONT_WEIGHT:

            if (p->type == CSS_TYPE_ENUM) {
               switch (p->value.intVal) {
                  case CSS_FONT_WEIGHT_BOLD:
                     fontAttrs.weight = 700;
                     break;
                  case CSS_FONT_WEIGHT_BOLDER:
                     fontAttrs.weight += 300;
                     break;
                  case CSS_FONT_WEIGHT_LIGHT:
                     fontAttrs.weight = 100;
                     break;
                  case CSS_FONT_WEIGHT_LIGHTER:
                     fontAttrs.weight -= 300;
                     break;
                  case CSS_FONT_WEIGHT_NORMAL:
                     fontAttrs.weight = 400;
                     break;
                  default:
                     assert(false); // invalid font weight value
                     break;
               }
            } else {
               fontAttrs.weight = p->value.intVal;
            }

            if (fontAttrs.weight < 100)
               fontAttrs.weight = 100;
            if (fontAttrs.weight > 900)
               fontAttrs.weight = 900;

            break;
         case CSS_PROPERTY_LETTER_SPACING:
            if (p->type == CSS_TYPE_ENUM) {
               if (p->value.intVal == CSS_LETTER_SPACING_NORMAL) {
                  fontAttrs.letterSpacing = 0;
               }
            } else {
               computeValue (&fontAttrs.letterSpacing, p->value.intVal,
                  parentFont, parentFont->size);
            }

            /* Limit letterSpacing to reasonable values to avoid overflows e.g,
             * when measuring word width.
             */
            if (fontAttrs.letterSpacing > 1000)
               fontAttrs.letterSpacing = 1000;
            else if (fontAttrs.letterSpacing < -1000)
               fontAttrs.letterSpacing = -1000;
            break;
         default:
            break;
      }
   }

   attrs->font = Font::create (layout, &fontAttrs);

   for (int i = 0; i < props->size (); i++) {
      CssProperty *p = props->getRef (i);

      switch (p->name) {
         /* \todo missing cases */
         case CSS_PROPERTY_BACKGROUND_COLOR:
            if (prefs.allow_white_bg || p->value.intVal != 0xffffff)
               attrs->backgroundColor = Color::create(layout, p->value.intVal);
            else
               //attrs->backgroundColor = Color::create(layout, 0xdcd1ba);
               attrs->backgroundColor = Color::create(layout, 0xe0e0a3);
            break;
         case CSS_PROPERTY_BORDER_TOP_COLOR:
            attrs->borderColor.top =
              Color::create (layout, p->value.intVal);
            break;
         case CSS_PROPERTY_BORDER_BOTTOM_COLOR:
            attrs->borderColor.bottom =
              Color::create (layout, p->value.intVal);
            break;
         case CSS_PROPERTY_BORDER_LEFT_COLOR:
            attrs->borderColor.left =
              Color::create (layout, p->value.intVal);
            break;
         case CSS_PROPERTY_BORDER_RIGHT_COLOR:
            attrs->borderColor.right =
              Color::create (layout, p->value.intVal);
            break;
         case CSS_PROPERTY_BORDER_BOTTOM_STYLE:
            attrs->borderStyle.bottom = (BorderStyle) p->value.intVal;
            break;
         case CSS_PROPERTY_BORDER_LEFT_STYLE:
            attrs->borderStyle.left = (BorderStyle) p->value.intVal;
            break;
         case CSS_PROPERTY_BORDER_RIGHT_STYLE:
            attrs->borderStyle.right = (BorderStyle) p->value.intVal;
            break;
         case CSS_PROPERTY_BORDER_TOP_STYLE:
            attrs->borderStyle.top = (BorderStyle) p->value.intVal;
            break;
         case CSS_PROPERTY_BORDER_BOTTOM_WIDTH:
            computeBorderWidth (&attrs->borderWidth.bottom, p, attrs->font);
            break;
         case CSS_PROPERTY_BORDER_LEFT_WIDTH:
            computeBorderWidth (&attrs->borderWidth.left, p, attrs->font);
            break;
         case CSS_PROPERTY_BORDER_RIGHT_WIDTH:
            computeBorderWidth (&attrs->borderWidth.right, p, attrs->font);
            break;
         case CSS_PROPERTY_BORDER_TOP_WIDTH:
            computeBorderWidth (&attrs->borderWidth.top, p, attrs->font);
            break;
         case CSS_PROPERTY_BORDER_SPACING:
            computeValue (&attrs->hBorderSpacing, p->value.intVal,attrs->font);
            computeValue (&attrs->vBorderSpacing, p->value.intVal,attrs->font);
            break;
         case CSS_PROPERTY_COLOR:
            attrs->color = Color::create (layout, p->value.intVal);
            break;
         case CSS_PROPERTY_CURSOR:
            attrs->cursor = (Cursor) p->value.intVal;
            break;
         case CSS_PROPERTY_DISPLAY:
            attrs->display = (DisplayType) p->value.intVal;
            break;
         case CSS_PROPERTY_LIST_STYLE_POSITION:
            attrs->listStylePosition = (ListStylePosition) p->value.intVal;
            break;
         case CSS_PROPERTY_LIST_STYLE_TYPE:
            attrs->listStyleType = (ListStyleType) p->value.intVal;
            break;
         case CSS_PROPERTY_MARGIN_BOTTOM:
            computeValue (&attrs->margin.bottom, p->value.intVal, attrs->font);
            if (attrs->margin.bottom < 0) // \todo fix negative margins in dw/*
               attrs->margin.bottom = 0;
            break;
         case CSS_PROPERTY_MARGIN_LEFT:
            computeValue (&attrs->margin.left, p->value.intVal, attrs->font);
            if (attrs->margin.left < 0) // \todo fix negative margins in dw/*
               attrs->margin.left = 0;
            break;
         case CSS_PROPERTY_MARGIN_RIGHT:
            computeValue (&attrs->margin.right, p->value.intVal, attrs->font);
            if (attrs->margin.right < 0) // \todo fix negative margins in dw/*
               attrs->margin.right = 0;
            break;
         case CSS_PROPERTY_MARGIN_TOP:
            computeValue (&attrs->margin.top, p->value.intVal, attrs->font);
            if (attrs->margin.top < 0) // \todo fix negative margins in dw/*
               attrs->margin.top = 0;
            break;
         case CSS_PROPERTY_PADDING_TOP:
            computeValue (&attrs->padding.top, p->value.intVal, attrs->font);
            break;
         case CSS_PROPERTY_PADDING_BOTTOM:
            computeValue (&attrs->padding.bottom, p->value.intVal,attrs->font);
            break;
         case CSS_PROPERTY_PADDING_LEFT:
            computeValue (&attrs->padding.left, p->value.intVal, attrs->font);
            break;
         case CSS_PROPERTY_PADDING_RIGHT:
            computeValue (&attrs->padding.right, p->value.intVal, attrs->font);
            break;
         case CSS_PROPERTY_TEXT_ALIGN:
            attrs->textAlign = (TextAlignType) p->value.intVal;
            break;
         case CSS_PROPERTY_TEXT_DECORATION:
            attrs->textDecoration |= p->value.intVal;
            break;
         case CSS_PROPERTY_VERTICAL_ALIGN:
            attrs->valign = (VAlignType) p->value.intVal;
            break;
         case CSS_PROPERTY_WHITE_SPACE:
            attrs->whiteSpace = (WhiteSpace) p->value.intVal;
            break;
         case CSS_PROPERTY_WIDTH:
            computeLength (&attrs->width, p->value.intVal, attrs->font);
            break;
         case CSS_PROPERTY_HEIGHT:
            computeLength (&attrs->height, p->value.intVal, attrs->font);
            break;
         case PROPERTY_X_LINK:
            attrs->x_link = p->value.intVal;
            break;
         case PROPERTY_X_IMG:
            attrs->x_img = p->value.intVal;
            break;
         case PROPERTY_X_TOOLTIP:
            attrs->x_tooltip = Tooltip::create(layout, p->value.strVal);
            break;
         default:
            break;
      }
   }

   /* make sure border colors are set */
   if (attrs->borderColor.top == NULL)
      attrs->borderColor.top = attrs->color;
   if (attrs->borderColor.bottom == NULL)
      attrs->borderColor.bottom = attrs->color;
   if (attrs->borderColor.left == NULL)
      attrs->borderColor.left = attrs->color;
   if (attrs->borderColor.right == NULL)
      attrs->borderColor.right = attrs->color;

}

/**
 * \brief Resolve relative lengths to absolute values.
 */
bool StyleEngine::computeValue (int *dest, CssLength value, Font *font) {
   static float dpmm;

   if (dpmm == 0.0)
      dpmm = layout->dpiX () / 25.4; /* assume dpiX == dpiY */

   switch (CSS_LENGTH_TYPE (value)) {
      case CSS_LENGTH_TYPE_PX:
         *dest = (int) CSS_LENGTH_VALUE (value);
         return true;
      case CSS_LENGTH_TYPE_MM:
         *dest = (int) (CSS_LENGTH_VALUE (value) * dpmm + 0.5);
        return true;
      case CSS_LENGTH_TYPE_EM:
         *dest = (int) (CSS_LENGTH_VALUE (value) * font->size + 0.5);
        return true;
      case CSS_LENGTH_TYPE_EX:
         *dest = (int) (CSS_LENGTH_VALUE(value) * font->xHeight + 0.5);
        return true;
      default:
         break;
   }

   return false;
}

bool StyleEngine::computeValue (int *dest, CssLength value, Font *font,
                                int percentageBase) {
   if (CSS_LENGTH_TYPE (value) == CSS_LENGTH_TYPE_PERCENTAGE) {
      *dest = (int) (CSS_LENGTH_VALUE (value) * percentageBase + 0.5);
      return true;
   } else
      return computeValue (dest, value, font);
}

bool StyleEngine::computeLength (dw::core::style::Length *dest,
                                 CssLength value, Font *font) {
   int v;

   if (CSS_LENGTH_TYPE (value) == CSS_LENGTH_TYPE_PERCENTAGE) {
      *dest = createPerLength (CSS_LENGTH_VALUE (value));
      return true;
   } else if (CSS_LENGTH_TYPE (value) == CSS_LENGTH_TYPE_AUTO) {
      *dest = dw::core::style::LENGTH_AUTO;
      return true;
   } else if (computeValue (&v, value, font)) {
      *dest = createAbsLength (v);
      return true;
   }

   return false;
}

void StyleEngine::computeBorderWidth (int *dest, CssProperty *p,
                                      dw::core::style::Font *font) {
   if (p->type == CSS_TYPE_ENUM) {
      switch (p->value.intVal) {
         case CSS_BORDER_WIDTH_THIN:
            *dest = 1;
            break;
         case CSS_BORDER_WIDTH_MEDIUM:
            *dest = 2;
            break;
         case CSS_BORDER_WIDTH_THICK:
            *dest = 3;
            break;
         default:
            assert(false);
      }
   } else {
      computeValue (dest, p->value.intVal, font);
   }
}

/**
 * \brief Similar to StyleEngine::style(), but with backgroundColor set.
 * A normal style might have backgroundColor == NULL to indicate a transparent
 * background. This method ensures that backgroundColor is set.
 */
Style * StyleEngine::backgroundStyle () {
   StyleAttrs attrs = *style ();

   for (int i = stack->size () - 1; i >= 0 && ! attrs.backgroundColor; i--)
      attrs.backgroundColor = stack->getRef (i)->style->backgroundColor;

   assert (attrs.backgroundColor);
   return Style::create (layout, &attrs);
}

/**
 * \brief Create a new style object based on the previously opened / closed
 * HTML elements and the nonCssProperties that have been set.
 * This method is private. Call style() to get a current style object.
 */
Style * StyleEngine::style0 (CssPropertyList *nonCssProperties) {
   CssPropertyList props, *styleAttributeProps = NULL;
   const char *styleAttribute =
      stack->getRef (stack->size () - 1)->styleAttribute;
   // get previous style from the stack
   StyleAttrs attrs = *stack->getRef (stack->size () - 2)->style;

   // Ensure that StyleEngine::style0() has not been called before for
   // this element.
   // Style computation is expensive so limit it as much as possible.
   // If this assertion is hit, you need to rearrange the code that is
   // doing styleEngine calls to call setNonCssHints() before calling
   // style() or wordStyle() for each new element.
   assert (stack->getRef (stack->size () - 1)->style == NULL);

   // reset values that are not inherited according to CSS
   attrs.resetValues ();

   if (stack->getRef (stack->size () - 2)->inheritBackgroundColor) {
      attrs.backgroundColor =
         stack->getRef (stack->size () - 2)->style->backgroundColor;

      attrs.valign = stack->getRef (stack->size () - 2)->style->valign;
   }

   // parse style information from style="" attribute, if it exists
   if (styleAttribute && prefs.parse_embedded_css)
      styleAttributeProps =
         CssParser::parseDeclarationBlock (styleAttribute,
                                           strlen (styleAttribute));

   // merge style information
   cssContext->apply (&props, doctree, styleAttributeProps, nonCssProperties);

   // apply style
   apply (&attrs, &props);

   stack->getRef (stack->size () - 1)->style = Style::create (layout, &attrs);

   if (styleAttributeProps)
      delete styleAttributeProps;

   return stack->getRef (stack->size () - 1)->style;
}

Style * StyleEngine::wordStyle0 (CssPropertyList *nonCssProperties) {
   StyleAttrs attrs = *style ();
   attrs.resetValues ();

   if (stack->getRef (stack->size () - 1)->inheritBackgroundColor)
      attrs.backgroundColor = style ()->backgroundColor;

   attrs.valign = style ()->valign;

   stack->getRef(stack->size() - 1)->wordStyle = Style::create(layout, &attrs);
   return stack->getRef (stack->size () - 1)->wordStyle;
}

void StyleEngine::parse (DilloHtml *html, DilloUrl *url, const char *buf,
                         int buflen, CssOrigin origin) {
   if (importDepth > 10) { // avoid looping with recursive @import directives
      MSG_WARN("Maximum depth of CSS @import reached--ignoring stylesheet.\n");
      return;
   }

   importDepth++;
   CssParser::parse (html, url, cssContext, buf, buflen, origin);
   importDepth--;
}
