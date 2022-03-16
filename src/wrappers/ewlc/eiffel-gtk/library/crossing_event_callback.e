note
	description: "Generic callback for the enter-notify-event and leave-notify-event signals"
	copyright: "[
					Copyright (C) 2006-2022: Anthony Lenton, eiffel-libraries team,  GTK+ team and others
					
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

deferred class CROSSING_EVENT_CALLBACK
	-- You want to use one of ENTER_NOTIFY_EVENT_CALLBACK or LEAVE_NOTIFY_EVENT_CALLBACK

inherit CALLBACK redefine object end

insert G_OBJECT_FACTORY [GTK_WIDGET]

feature {ANY}
	object: GTK_WIDGET

feature {ANY}

	callback (event_ptr: POINTER; instance: POINTER): INTEGER
		local
			crossing_event: GDK_EVENT_CROSSING
		do
			-- The following is written with the implicit requirement 
			-- that object actually has an Eiffel wrapper.
			object := wrapper(instance)

			create crossing_event.from_external_pointer (event_ptr)

			Result := function.item ([crossing_event, object]).to_integer
			-- GTK is about to release this event, detach it from Eiffel
			crossing_event.dispose
		end

	callback_pointer: POINTER
		do
			Result := get_callback_pointer ($callback)
		ensure
			Result.is_not_null
		end

	connect (an_object: GTK_WIDGET; a_function: FUNCTION [ANY, TUPLE [GDK_EVENT_CROSSING, GTK_WIDGET], BOOLEAN])
		do
			handler_id := g_signal_connect_closure (an_object.handle,
																 signal_name.to_external,
																 handle, 0 -- i.e. call it before default handler
																)
			function := a_function
		end

	function: FUNCTION [ANY, TUPLE [GDK_EVENT_CROSSING, GTK_WIDGET], BOOLEAN]

end -- class CROSSING_EVENT_CALLBACK
