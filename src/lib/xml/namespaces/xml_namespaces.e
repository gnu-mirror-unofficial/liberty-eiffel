-- See the Copyright notice at the end of this file.
--
expanded class XML_NAMESPACES
   --
   -- Known namespace actions
   --
feature {}
   namespace_actions: HASHED_DICTIONARY[PROCEDURE[TUPLE[XMLNS_PARSER, UNICODE_STRING]], UNICODE_STRING]
      once
         create Result.make
      end

feature {ANY}
   register_namespace_action (a_namespace: UNICODE_STRING; a_action: PROCEDURE[TUPLE[XMLNS_PARSER, UNICODE_STRING]])
      do
         namespace_actions.put(a_action, a_namespace)
      end

end -- class XML_NAMESPACES
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
