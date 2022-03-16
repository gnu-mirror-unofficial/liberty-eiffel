class C_QUALIFIED_TYPE
   -- A CvQualifiedType node of an XML file generated by gccxml.
   -- Known attributes are: const, restrict, volatile

inherit
   C_TYPE
   IDENTIFIED_NODE
   TYPED_NODE
   STORABLE_NODE

create {GCCXML_TREE}
   make

feature {ANY}
   store
      do
         types.fast_put(Current, id)
      end

   is_fundamental: BOOLEAN
      do
         Result := types.at(type).is_fundamental
      end

   is_void: BOOLEAN
      do
         Result := types.at(type).is_void
      end

   has_wrapper: BOOLEAN
      do
         Result := types.at(type).has_wrapper
      end

   wrapper_type: STRING
      do
         Result := types.at(type).wrapper_type
      end -- invariant name.is_equal(once U"CvQualifiedType")

end -- class C_QUALIFIED_TYPE
-- Copyright (C) 2008-2022: ,2009,2010 Paolo Redaelli
-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as publhed by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.
-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.
-- You should have received a copy of the GNU General Public License along with
-- th program.  If not, see <http://www.gnu.org/licenses/>.
