-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PACKRAT_SEQUENCE

inherit
   PACKRAT_ALTERNATIVE
      redefine
         set_nt
      end

insert
   PACKRAT

create {PACKRAT}
   make

feature {ANY}
   frozen positive_lookahead, prefix "@": PACKRAT_ALTERNATIVE is
      do
         create {PACKRAT_AND} Result.make(Current)
      end

   frozen negative_lookahead, prefix "~": PACKRAT_ALTERNATIVE is
      do
         create {PACKRAT_NOT} Result.make(Current)
      end

   is_coherent: BOOLEAN is
      local
         i: INTEGER
      do
         from
            Result := True
            i := primaries.lower
         until
            not Result or else i > primaries.upper
         loop
            Result := primaries.item(i).is_coherent
            i := i + 1
         end

      end

feature {PACKRAT_INTERNAL}
   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]]) is
      local
         i: INTEGER
      do
         if action = Void then
            action := non_terminal_builder
         end
         from
            i := primaries.lower
         until
            i > primaries.upper
         loop
            primaries.item(i).set_default_tree_builders(non_terminal_builder, terminal_builder)
            i := i + 1
         end
      end

   set_nt (a_nt: like nt) is
      local
         i: INTEGER
      do
         Precursor(a_nt)
         from
            i := primaries.lower
         until
            i > primaries.upper
         loop
            primaries.item(i).set_nt(a_nt)
            i := i + 1
         end
      end

feature {}
   primaries: TRAVERSABLE[PACKRAT_PRIMARY]
   how_many: INTEGER_8
   action: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]

feature {}
   make (a_primaries: TRAVERSABLE[PACKRAT_PRIMARY]; a_how_many: like how_many; a_action: like action) is
      require
         a_primaries /= Void
         a_how_many.in_range(one, one_or_more)
      do
         primaries := a_primaries
         how_many := a_how_many
         action := a_action
      ensure
         primaries = a_primaries
         how_many = a_how_many
         action = a_action
      end

invariant
   primaries /= Void
   how_many.in_range(one, one_or_more)

end -- class PACKRAT_SEQUENCE
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
