-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class FOREIGN_DLL_FUNCTION

inherit
   FOREIGN_AGENT
      export {FOREIGN_DLL_HANDLER}
         ffi_call, types
      end

create {FOREIGN_DLL}
   make

feature {}
   make (external_function: POINTER; a_parameter_types: like parameter_types; a_result_type: like result_type)
      require
         external_function.is_not_null
         a_parameter_types /= Void
      do
         parameter_types := a_parameter_types
         result_type := a_result_type
         prepare(external_function)
      ensure
         parameter_types = a_parameter_types
         result_type = a_result_type
      end

end -- class FOREIGN_DLL_FUNCTION
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
