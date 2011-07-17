-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CREATION_CLAUSE_LIST

inherit
	VISITABLE
insert
	GLOBALS

creation {CLASS_TEXT}
	make

feature {ANY}
	start_position: POSITION is
		do
			Result := list.first.start_position
		end

	pretty is
		local
			i: INTEGER
		do
			from
				i := list.lower
			until
				i > list.upper
			loop
				list.item(i).pretty
				i := i + 1
			end
		end

	short (client: CLASS_NAME): BOOLEAN is
			-- True when at least one creation list is printed for the given `client'.
		local
			i: INTEGER
		do
			from
				i := list.lower
			until
				i > list.upper
			loop
				Result := list.item(i).short(Result, client) or else Result
				i := i + 1
			end
		end

	get_clause (fn: FEATURE_NAME): CREATION_CLAUSE is
		local
			i: INTEGER
		do
			from
				i := list.lower
			until
				i > list.upper or else list.item(i).has(fn)
			loop
				i := i + 1
			end
			if i <= list.upper then
				Result := list.item(i)
			end
		end

	accept (visitor: CREATION_CLAUSE_LIST_VISITOR) is
		do
			visitor.visit_creation_clause_list(Current)
		end

feature {CLASS_TEXT}
	default_root: STRING is
			-- Return the default creation procedure name to be used as the root
			-- procedure (the execution entry point of the system).
		local
			i: INTEGER
		do
			from
				i := list.upper
			until
				Result /= Void or else i < list.lower
			loop
				Result := list.item(i).default_root
				if Result /= as_make then
					Result := Void
				end
				i := i - 1
			end
			from
				i := list.lower
			until
				Result /= Void or else i > list.upper
			loop
				Result := list.item(i).default_root
				i := i + 1
			end
		end

	root_creation_search (a_name: STRING): FEATURE_NAME is
		local
			i: INTEGER
		do
			from
				i := list.upper
			until
				i < list.lower or else Result /= Void
			loop
				Result := list.item(i).root_creation_search(a_name)
				i := i - 1
			end
		end

	add_last (cc: CREATION_CLAUSE) is
		require
			cc /= Void
		do
			list.add_last(cc)
		end

	extra_expanded_check (type: TYPE) is
		require
			type.is_user_expanded
		local
			fn: FEATURE_NAME; i: INTEGER
		do
			from
				i := list.lower
			until
				i > list.upper
			loop
				fn := list.item(i).extra_expanded_check(type, fn)
				i := i + 1
			end
			if fn = Void then
				error_handler.add_position(start_position)
				error_handler.add_position(type.canonical_type_mark.start_position)
				error_handler.append("Unable to find the default creation procedure for expanded type ")
				error_handler.append(type.name.to_string)
				error_handler.append(". An expanded type must have one unique creation procedure with no %
											%argument: the creation procedure used for automatic initialization. %
											%Please, consider to add explicitely the `default_create' procedure %
											%from ANY or some other existing procedure with no arguments. %
											%For expanded class with no creation clause, the `default_create' procedure %
											%is the one used for automatic initialization.")
				error_handler.print_as_fatal_error
			end
		end

	user_expanded_default_create_stamp (type: TYPE): FEATURE_STAMP is
			-- Must be called after `extra_expanded_check'.
		require
			type.is_user_expanded
		local
			i: INTEGER
		do
			from
				i := list.upper
			until
				Result /= Void
			loop
				Result := list.item(i).user_expanded_default_create_stamp(type)
				i := i - 1
			end
		end

	check_for (type: TYPE) is
		local
			i: INTEGER
		do
			from
				i := list.upper
			until
				i < list.lower
			loop
				list.item(i).check_for(type)
				i := i - 1
			end
		end
	
feature {CREATE_SUPPORT}
	all_positions_in_error_handler is
			-- (To show available creation procedure.)
		local
			i: INTEGER; creation_clause: CREATION_CLAUSE; procedure_list: FEATURE_NAME_LIST
		do
			from
				i := list.upper
			until
				i < list.lower
			loop
				creation_clause := list.item(i)
				procedure_list := creation_clause.procedure_list
				if procedure_list /= Void then
					procedure_list.all_positions_in_error_handler
				else
					error_handler.add_position(creation_clause.start_position)
				end
				i := i - 1
			end
		end

feature {CREATION_CLAUSE_LIST_VISITOR}
	list: FAST_ARRAY[CREATION_CLAUSE]

feature {}
	make (first: CREATION_CLAUSE) is
		require
			first /= Void
		do
			create list.with_capacity(4)
			list.add_last(first)
		ensure
			list.first = first
		end

invariant
	not list.is_empty

end -- class CREATION_CLAUSE_LIST
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
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------