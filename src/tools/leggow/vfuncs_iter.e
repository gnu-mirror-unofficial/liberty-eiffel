expanded class VFUNCS_ITER
	-- An expanded iterator over virtual functions of a GI_CLASS
insert GI_ITERATOR[GI_VFUNC_INFO]

feature {ANY}
	start is
		do
			i:=gi_class.virtual_functions_lower
		end

	is_off: BOOLEAN is
		do
			Result:=i>gi_class.virtual_functions_upper
		end

	item: GI_VFUNC_INFO is 
	do 
		Result:=gi_class.virtual_function(i)
	end

end -- class VFUNCS_ITER

-- Copyright (C) 2013-2022: Paolo Redaelli <paolo.redaelli@gmail.com>
-- 
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
	
