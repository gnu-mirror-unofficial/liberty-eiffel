-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class DEBUG_KEY_SUPPORT

insert
	GLOBALS

feature {}
	match_debug_keys (e_debug: DEBUG_COMPOUND; list: FAST_ARRAY[STRING]): BOOLEAN is
		local
			key: STRING; i: INTEGER
		do
			from
				i := list.upper
			until
				Result or else i < list.lower
			loop
				key := list.item(i)
				if key = fz_yes then
					Result := True
				elseif key = fz_no then
					i := list.lower
				else
					Result := e_debug.match_debug_key(key)
				end
				i := i - 1
			end
		end

	add_default_debug_key (key: STRING) is
		require
			key /= Void
		do
			if default_debug_keys = Void then
				create default_debug_keys.with_capacity(4)
			end
			default_debug_keys.add_last(key)
		ensure
			default_debug_keys.has(key)
		end

	default_debug_keys: FAST_ARRAY[STRING]
			-- The default(s) one for this cluster/ace file.

end -- class DEBUG_KEY_SUPPORT
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