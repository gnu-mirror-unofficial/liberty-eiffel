-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
deferred class LIBERTY_INTERPRETER_OBJECT

inherit
	LIBERTY_EXPRESSION
		undefine
			is_equal
		end

feature {ANY}
	result_type: LIBERTY_TYPE is
		do
			Result := type
		end

	type: LIBERTY_ACTUAL_TYPE
			-- the actual dynamic type of the object

	is_between (lower, upper: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION): BOOLEAN is
		local
			fd: LIBERTY_FEATURE_DEFINITION
			cmp: LIBERTY_INTERPRETER_OBJECT_NATIVE[BOOLEAN]
		do
			fd := type.feature_definition(le_feature_name)
			cmp ::= interpreter.item_feature(lower, fd, {FAST_ARRAY[LIBERTY_INTERPRETER_OBJECT] << Current >> }, a_position)
			if cmp.item then
				cmp ::= interpreter.item_feature(Current, fd, {FAST_ARRAY[LIBERTY_INTERPRETER_OBJECT] << upper >> }, a_position)
				Result := cmp.item
			end
		end

	storage_twin: like Current is
			-- either Current or a twin depending on the storage class (expanded, reference, separate)
		do
			if type.is_expanded then
				Result := expanded_twin
			elseif type.is_separate then
				not_yet_implemented
			else
				Result := Current
			end
		ensure
			is_equal(Result)
		end

feature {LIBERTY_INTERPRETER_OBJECT_PRINTER, LIBERTY_INTERPRETER_FEATURE_CALL}
	show_stack (o: OUTPUT_STREAM; indent: INTEGER) is
		deferred
		end

feature {}
	expanded_twin: like Current is
		require
			type.is_expanded
		deferred
		ensure
			is_equal(Result)
		end

	interpreter: LIBERTY_INTERPRETER

	le_feature_name: LIBERTY_FEATURE_NAME is
		once
			create Result.infixed("<=".intern)
		end

feature {ANY}
	accept (visitor: VISITOR) is
		do
			check False end
		end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			check False end
		end

invariant
	type /= Void
	interpreter /= Void

end -- class LIBERTY_INTERPRETER_OBJECT
