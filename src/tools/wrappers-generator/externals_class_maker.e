obsolete class EXTERNALS_CLASS_MAKER
	"Move EXTERNALS_CLASS_MAKER's logic into heirs of GCCXML_NODE"
inherit
	CLASS_MAKER
		redefine is_initialized, emit_structure
		end

insert
	EXCEPTIONS

creation {ANY}
	with_header, without_header

feature {ANY} -- Creation and initialization
	with_header (an_header: STRING) is
		require
			header_not_void: an_header /= Void
		do
			header := an_header
			initialize
		end

	without_header is
		do
			initialize
		end

	is_initialized: BOOLEAN is
		do
			Result := Precursor and then headers /= Void
		end

feature {ANY}
	header: STRING
			-- The C header that shall be included to use the wrapped
			-- features.

feature {ANY} -- Functions emittion
	append_function_body (a_node: XML_COMPOSITE_NODE) is
		local
			function_header: STRING
		do
			if header = Void then
				function_header := files_by_id.at(a_node.attribute_at(once U"file")).attribute_at(once U"name").to_utf8
			else
				function_header := header
			end
			if variadic then
				buffer.append(variadic_function_note)
			end
			buffer.put_message(once "		external %"C use <@(1)>%"%N%
			%		end%N",
			<<function_header>>)
		end

feature {ANY} -- Structure emission
	emit_structure (a_node: XML_COMPOSITE_NODE; a_structure_name: STRING) is
		do
			if header = Void then
				header := files_by_id.at(a_node.attribute_at(once U"file")).attribute_at(once U"name").to_utf8
			end
			Precursor(a_node, a_structure_name)
		end

	emit_structure_field (a_field: XML_COMPOSITE_NODE; a_structure_name: STRING) is
		local
			fieldname, type: STRING
		do
			fieldname := adapt(a_field.attribute_at(once U"name").to_utf8)
			type := eiffel_type_of(a_field)
			if type /= Void then
				log(once "Appending query for @(1)%N",
				<<fieldname>>)
				queries.put_message(once "	get_@(1) (a_structure: POINTER): @(2) is%N%
				%		external %"C struct @(3) get @(4) use <@(5)>%"%N%
				%		end%N%N",
				<<fieldname, type, a_structure_name, fieldname, header>>)
				log(once "Appending setter for @(1).@(2)%N",
				<<a_structure_name, fieldname>>)
				setters.put_message(once "	low_level_set_@(1) (a_structure: POINTER; a_value: @(2)) is%N%
				%		external %"C struct @(3) set @(4) use <@(5)>%"%N%
				%		end%N%N",
				<<fieldname, type, a_structure_name, fieldname, header>>)
			else
				log(once "Field @(1) in structure @(2) is not wrappable: @(3)",
				<<fieldname, a_structure_name, last_error>>)
				queries.put_message(once "	-- Unwrappable @(1): @(2)%N",
				<<fieldname, last_error>>)
			end
		end

	append_structure_size (a_node: XML_COMPOSITE_NODE; a_structure_name: STRING) is
	do 
		buffer.reset
		buffer.put_message(once 
		"feature -- Structure size%N%
		%	struct_size: INTEGER is%N%
		%	external %"C inline use <@(1)>%"%N%
		%	alias %"sizeof(@(2))%"%N%
		%	end%N%
		%%N",
		<< header,a_node.attribute_at(once U"name").as_utf8>>)
		buffer.print_on(output)
		buffer.reset
	end

feature {ANY} -- Enumeration emitter
	append_enumeration_value_low_level (an_eiffel_value, a_c_value, a_file_name: STRING) is
		local
			location: STRING
		do
			if header /= Void then
				location := header
			else
				location := a_file_name
			end
			low_level_values.put_message(once "	@(1): INTEGER is%N%
			%		external %"C macro use <@(2)%N%
			%		alias %"@(3)%"%N%
			%		end%N%N",
			<<an_eiffel_value, location, a_c_value>>)
		end

end -- class EXTERNALS_CLASS_MAKER

-- Copyright 2008,2009 Paolo Redaelli

-- eiffel-gcc-xml  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- eiffel-gcc-xml is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.