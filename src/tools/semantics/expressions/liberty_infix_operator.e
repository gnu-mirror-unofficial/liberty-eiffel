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
class LIBERTY_INFIX_OPERATOR

inherit
	LIBERTY_INFIX_CALL
		rename
			make as infix_make
		end

create {LIBERTY_TYPE_BUILDER}
	make

feature {}
	make (a_left, a_right: LIBERTY_EXPRESSION; a_entity: like entity; a_position: like position) is
		require
			a_left /= Void
			a_right /= Void
			a_entity.feature_name.is_infix
			a_position /= Void
		do
			target := a_left
			actuals := {FAST_ARRAY[LIBERTY_EXPRESSION] << a_right >> }
			entity := a_entity
			position := a_position
		ensure
			target = a_left
			actuals.first = a_right
			position = a_position
		end

	infix_name: LIBERTY_FEATURE_NAME is
		do
			check False end
		end

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_INFIX_OPERATOR_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_infix_operator(Current)
		end

end