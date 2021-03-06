-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class CGI_REMOTE_INFO
   --
   -- REMOTE_ADDR, REMOTE_HOST, REMOTE_IDENT, REMOTE_USER
   --

insert
   ANY
      redefine
         out_in_tagged_out_memory
      end

create {CGI}
   make

feature {ANY}
   addr, host, ident, user: FIXED_STRING

feature {CGI}
   error: STRING

feature {}
   make (a, h, i, u: STRING)
      do
         if a /= Void then
            addr := a.intern
         end
         if h /= Void then
            host := h.intern
         end
         if i /= Void then
            ident := i.intern
         end
         if u /= Void then
            user := u.intern
         end
      end

   set_error (t: STRING)
      require
         t /= Void
      do
         error := "Invalid REMOTE_INFO: "
         error.append(t)
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "{CGI_REMOTE_INFO")
         if addr /= Void then
            tagged_out_memory.append(once " addr=")
            tagged_out_memory.append(addr)
         end
         if host /= Void then
            tagged_out_memory.append(once " host=")
            tagged_out_memory.append(host)
         end
         if ident /= Void then
            tagged_out_memory.append(once " ident=")
            tagged_out_memory.append(ident)
         end
         if user /= Void then
            tagged_out_memory.append(once " user=")
            tagged_out_memory.append(user)
         end
         tagged_out_memory.extend('}')
      end

end -- class CGI_REMOTE_INFO
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
