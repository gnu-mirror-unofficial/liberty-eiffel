-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ITERATOR_ON_PYTHON_DICTIONARY_ITEMS[V_, K_]
   -- Please do not use this class directly. Look at `ITERATOR'.

inherit
   ITERATOR[V_]

create {ANY}
   make

feature {}
   dictionary: ABSTRACT_PYTHON_DICTIONARY[V_, K_]
         -- The one to be traversed.

   item_index: INTEGER
         -- Memorize the current position.

feature {ANY}
   make (d: like dictionary)
      require
         d /= Void
      do
         dictionary := d
         start
      ensure
         dictionary = d
      end

   start
      do
         item_index := dictionary.next_internal_index(-1)
         generation := iterable_generation
      end

   is_off: BOOLEAN
      do
         Result := not dictionary.valid_internal_index(item_index)
      end

   item: V_
      do
         Result := dictionary.item(item_index)
      end

   next
      do
         item_index := dictionary.next_internal_index(item_index)
      end

feature {ANY}
   iterable_generation: INTEGER
      do
         Result := dictionary.generation
      end

   generation: INTEGER

end -- class ITERATOR_ON_PYTHON_DICTIONARY_ITEMS
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
