-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class COMPLEX_MATH[A_PRECISION->FLOAT]

feature {ANY} --
   complex (a_real, an_imaginary: A_PRECISION): COMPLEX_GENERAL[A_PRECISION]
      do
         Result.set(a_real,an_imaginary)
      end

feature {ANY} -- Complex constants:
   i: COMPLEX_GENERAL[A_PRECISION]
         -- complex i
      local
         a_number: A_PRECISION
      do
         Result.set(a_number.zero, a_number.one)
      end

end -- class COMPLEX_MATH
--
-- Copyright (C) 2011-2022: Paolo Redaelli
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
