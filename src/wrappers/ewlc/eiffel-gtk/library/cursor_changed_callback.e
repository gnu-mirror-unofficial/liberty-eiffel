note
	description: "Generic callback for the cursor-changed signal"
	copyright: "[
					Copyright (C) 2006-2022: Paolo Redaelli, eiffel-libraries team,  GTK+ team and others
					
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

class CURSOR_CHANGED_CALLBACK

inherit CALLBACK redefine object end

insert G_OBJECT_FACTORY [GTK_TREE_VIEW]

create {ANY} make

feature {ANY}
	object: GTK_TREE_VIEW

feature {ANY}
	callback (instance: POINTER)
		do
			debug
				print ("Callback: instance=") print (instance.to_string) print ("%N")
			end
			object := wrapper(instance)
			procedure.call ([object])
		end

	callback_pointer: POINTER
		do
			Result := get_callback_pointer ($callback)
		ensure
			Result.is_not_null
		end

	connect (an_object: GTK_TREE_VIEW; a_procedure: PROCEDURE [ANY, TUPLE[GTK_TREE_VIEW]])
		do
			debug
				print ("CURSOR_CHANGED_CALLBACK.connect (an_object=") print (an_object.to_pointer.to_string)
				print (" an_object.handle=") print (an_object.handle.to_string)
				print (") Current=") print (to_pointer.to_string)
				print (" Current.handle=") print (handle.to_string)
				print ("%N")
			end
					 
			handler_id := g_signal_connect_closure (an_object.handle,
																 signal_name.to_external,
																 handle,
																 0 -- i.e. call it before default handler
																 )
			procedure:=a_procedure
		end

	signal_name: STRING is "cursor-changed"

	procedure: PROCEDURE [ANY, TUPLE[GTK_TREE_VIEW]]
end
