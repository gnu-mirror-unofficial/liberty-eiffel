-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class REGULAR_EXPRESSION_ITEM_TEXT_NO_CASE
   --
   -- accept one string
   --

inherit
   REGULAR_EXPRESSION_ITEM

create {ANY}
   make

feature {ANY}
   text: STRING
         -- the accepted string

   make (value: STRING)
      require
         value_not_void: value /= Void
         value_not_empty: value.count > 0
      do
         text := value.as_upper
      ensure
         definition: text.is_equal(value.as_upper)
         text_not_void: text /= Void
         text_not_empty: text.count > 0
      end

   explore (matcher: BACKTRACKING_REGULAR_EXPRESSION)
      do
         matcher.match_string_no_case(text)
      end

invariant
   text_not_void: text /= Void
   text_not_empty: text.count > 0

end -- class REGULAR_EXPRESSION_ITEM_TEXT_NO_CASE
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
