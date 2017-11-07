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



#include "fltkmisc.hh"

#include <fltk/events.h>
#include <fltk/Monitor.h>
#include <stdio.h>

namespace dw {
namespace fltk {
namespace misc {

int screenWidth ()
{
   return ::fltk::Monitor::all ().w ();
}

int screenHeight ()
{
   return ::fltk::Monitor::all ().h ();
}

void warpPointer (int x, int y)
{
   ::fltk::warp_mouse (x, y);
}

} // namespace misc
} // namespace fltk
} // namespace dw
