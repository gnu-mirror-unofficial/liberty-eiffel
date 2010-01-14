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
class LIBERTY_TYPE_INIT
--
-- Loads the type's parents, but also initializes general type information such as obsolete, deferred and so
-- on
--

insert
	LIBERTY_TYPE_BUILDER_TOOLS

creation {LIBERTY_TYPE_BUILDER}
	make

feature {}
	make (a_builder: like builder; a_type: like type; a_universe: like universe; default_effective_generic_parameters: like effective_generic_parameters) is
		require
			a_builder /= Void
			a_type /= Void
			a_universe /= Void
		do
			builder := a_builder
			type := a_type
			universe := a_universe
			effective_generic_parameters := default_effective_generic_parameters
		ensure
			builder = a_builder
			type = a_type
			universe = a_universe
			effective_generic_parameters = default_effective_generic_parameters
		end

feature {LIBERTY_TYPE_BUILDER}
	init_type_header is
		local
			ast: LIBERTY_AST_CLASS_HEADER
			marker: LIBERTY_AST_CLASS_MARKER
			name: FIXED_STRING
			type_parameters: LIBERTY_AST_TYPE_PARAMETERS
			type_parameter: LIBERTY_AST_TYPE_PARAMETER
			constraint: LIBERTY_TYPE
			i, n: INTEGER
		do
			ast := type.ast.class_header
			marker := ast.class_marker
			if marker.is_deferred then
				type.set_deferred
			elseif marker.is_expanded then
				type.set_expanded
			elseif marker.is_separate then
				type.set_separate
			else
				type.set_reference
			end
			name := ast.class_name.image.image.intern
			if name /= type.name then
				errors.set(level_fatal_error, "Expected type " + type.name + ", but got " + name)
			end
			type_parameters := ast.type_parameters
			n := type_parameters.list_count
			if n /= type.parameters.count then
				errors.add_position(semantics_position_at(ast.class_name))
				errors.add_position(type.descriptor_position)
				errors.set(level_error, once "Bad number of generic parameters")
			elseif n > 0 then
				check
					same_indexes: type_parameters.list_lower = type.parameters.lower
				end
				create {HASHED_DICTIONARY[LIBERTY_TYPE, FIXED_STRING]} effective_generic_parameters.with_capacity(n)
				from
					i := type_parameters.list_lower
				until
					i > type_parameters.list_upper
				loop
					type_parameter := type_parameters.list_item(i)
					if type_parameter.has_constraint then
						constraint := universe.get_type_from_type_definition(type, type_parameter.constraint, effective_generic_parameters)
						if not type.parameters.item(i).type.is_child_of(constraint) then
							errors.add_position(semantics_position_at(type_parameter.class_name))
							errors.set(level_error, once "Bad effective parameter: does not inherit or insert the constraint " + constraint.name)
						end
					end
					effective_generic_parameters.add(type.parameters.item(i).type, type_parameter.class_name.image.image.intern)
					i := i + 1
				end
				builder.set_effective_generic_parameters(effective_generic_parameters)
			end
		end

end -- class LIBERTY_TYPE_PARENT_LOADER