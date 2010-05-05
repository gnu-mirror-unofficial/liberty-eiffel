-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_BENCH
	-- Allocation and recycling of ARRAY[INTEGER] of random size.
	-- SE runs fast, since it does not try to mark the contents of these
	-- arrays.
	-- Compiled with SmartEiffel, this benchmark has an important memory
	-- footprint, because SE's GC does not merge memory blocks
	-- and thus recycles poorly the dead arrays.

creation {ANY}
	make

feature {ANY}
	array_int: ARRAY[INTEGER]

	make is
		local
			i: INTEGER; random: PRESS_RANDOM_NUMBER_GENERATOR
		do
			create random.with_seed(74363)
			from
				i := 30000
			until
				i = 0
			loop
				random.next
				create array_int.make(0, random.last_integer(50000))
				i := i - 1
			end
		end

end -- class TEST_BENCH
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
