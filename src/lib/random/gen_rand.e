-- See the Copyright notice at the end of this file.
--
deferred class GEN_RAND

obsolete "In release 2.3, the new name for this class is RANDOM_NUMBER_GENERATOR.%N%
         %Update your code. (January 10th 2006.)%N"
			
	
feature {ANY} -- Creation procedures:
	make is
			-- Create the generator with an automatic hazardous setting of
			-- the `seed_value'.
			-- Because automatic setting may be done using internal address
			-- of Current for example, it may produces platform dependent
			-- behavior or compilation-mode dependant behavior.
			-- Also consider `with_seed' to chose the most appropriate.
		deferred
		end

	with_seed (seed_value: INTEGER) is
			-- Create the generator with an explicit `seed_value'.
		deferred
		end

feature {ANY}
	next is
			-- Compute next random number in sequence.
		deferred
		end

feature {ANY} -- No modifications:
	last_double: REAL is
			-- Look at the last computed number.
			-- Range 0 to 1
		obsolete "Use `last_real' instead (nov 4th 2004)."
		do
			Result := last_real
		ensure
			Result > 0 and Result <= 1
		end

	last_real: REAL is
			-- Look at the last computed number.
			-- Range 0 to 1
		deferred
		ensure
			Result > 0 and Result <= 1
		end

	last_integer (n: INTEGER): INTEGER is
			-- Look the last computed number.
			-- Range 1 to `n'.
		require
			n >= 1
		deferred
		ensure
			1 <= Result and Result <= n
		end

feature {}
	clock_based_random_seed: INTEGER is
			-- Some positive random value to be used as a seed which may change as much as possible in a random 
			-- way.
		local
			clock: CLOCK; microsecond_time: MICROSECOND_TIME
		do
			-- Trying first the CPU clock value:
			Result := clock.value
			if Result <= 0 then
				-- So we try something else:
				microsecond_time.update
				Result := microsecond_time.microsecond
			end
		ensure
			Result > 0
		end
	
end -- class GEN_RAND
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------