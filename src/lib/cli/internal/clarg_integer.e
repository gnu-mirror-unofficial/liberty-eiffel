-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CLARG_INTEGER

inherit
   CLARG_WITH_ARG[INTEGER]

create {COMMAND_LINE_ARGUMENT_FACTORY}
   optional, positional

feature {ANY}
   item: INTEGER
   is_set: BOOLEAN

feature {CLARG_PARSER}
   is_valid_data (arg: STRING): BOOLEAN
      do
         Result := arg.is_integer
      end

feature {}
   set_data (context: COMMAND_LINE_CONTEXT; arg: STRING)
      do
         item := arg.to_integer
         is_set := True
      end

   unset
      do
         is_set := False
      end

end -- CLARG_INTEGER
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
