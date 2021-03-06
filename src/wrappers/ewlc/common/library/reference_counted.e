note
	copyright: "[
					Copyright (C) 2008-2022: Paolo Redaelli
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

deferred class REFERENCE_COUNTED
	-- A wrapper for a C object whose memory is handled throught
	-- reference counting, i.e. GObject

inherit
   WRAPPER
      undefine
         from_external_pointer
      end

feature {WRAPPER, WRAPPER_HANDLER}
	ref
			-- Increase the reference count 
		deferred 
		end

	unref
			-- Decrease the reference count
		deferred
		end

	dispose
			-- 
		do 
			unref 
			handle := default_pointer
		end
end
