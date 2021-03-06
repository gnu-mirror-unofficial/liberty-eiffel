-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright (C) 2006-2022: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
-- associated documentation files (the "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
-- following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
-- USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://ese.sourceforge.net
-- -----------------------------------------------------------------------------------------------------------
class EDC_STORABLE_TRAVERSABLE

inherit
   TRAVERSABLE[EDC_DATUM]

create {EDC_STORABLE_DATA}
   make

feature {ANY} -- Indexing:
   lower: INTEGER
      do
         Result := data.lower
      end

   upper: INTEGER
      do
         Result := data.upper
      end

feature {ANY} -- Counting:
   count: INTEGER
      do
         Result := data.count
      end

   is_empty: BOOLEAN
      do
         Result := count = 0
      end

feature {ANY} -- Accessing:
   item (i: INTEGER): EDC_DATUM
      do
         Result := data.item(i).item(index)
      end

   first: like item
      do
         Result := item(lower)
      end

   last: like item
      do
         Result := item(upper)
      end

feature {ANY} -- Other features:
   g_get_new_iterator: ITERATOR[EDC_DATUM]
      do
         create {EDC_STORABLE_ITERATOR} Result.make(Current)
      end

feature {}
   make (a_data: like data; a_index: like index)
      do
         data := a_data
         index := a_index
      end

   data: EDC_STORABLE_DATA

   index: INTEGER

end -- class EDC_STORABLE_TRAVERSABLE
