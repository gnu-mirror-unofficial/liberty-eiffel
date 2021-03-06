note
	description: "Report messages of minor importance to the user"
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_STATUS_BAR
	-- A GtkStatusbar is usually placed along the bottom of an
	-- application's main GtkWindow. It may provide a regular
	-- commentary of the application's status (as is usually the case
	-- in a web browser, for example), or may be used to simply output
	-- a message when the status changes, (when an upload is complete
	-- in an FTP client, for example). It may also have a resize grip
	-- (a triangular area in the lower right corner) which can be
	-- clicked on to resize the window containing the statusbar.

	-- Status bars in Gtk+ maintain a stack of messages. The message at
	-- the top of the each bar's stack is the one that will currently
	-- be displayed.

	-- Any messages added to a statusbar's stack must specify a
	-- context_id that is used to uniquely identify the source of a
	-- message. This context_id can be generated by (unwrapped)
	-- gtk_statusbar_get_context_id(), given a message and the
	-- statusbar that it will be added to. Note that messages are
	-- stored in a stack, and when choosing which message to display,
	-- the stack structure is adhered to, regardless of the context
	-- identifier of a message.

	-- Status bars are created using `make'.
	
	-- Messages are added to the bar's stack with `push'.

	-- The message at the top of the stack can be removed using
	-- `pop'. A message can be removed from anywhere in the stack if
	-- its message_id was recorded at the time it was added. This is
	-- done using `remove'.

inherit
	GTK_HBOX
		rename make as make_hbox
		export {} make_hbox
		redefine struct_size
		end 

	-- TODO: GtkStatusbar implements AtkImplementorIface.
	
insert GTK_SHADOW_TYPE
	
create {ANY} make, from_external_pointer
	
feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkStatusBar)"
		end

feature {} -- Creation
	make
			-- Creates a new GtkStatusbar ready for messages.
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_statusbar_new)
		end

feature {ANY} -- Context ids

	new_context_id (description: STRING)
		require
			description /= Void
		do
			last_context_id := gtk_statusbar_get_context_id (handle, description.to_external)
		end

	last_context_id: INTEGER

feature {ANY} -- Stack like behaviour

	push (context_id: INTEGER; a_message: STRING)
			-- Pushes `a_message' onto a statusbar's stack.
			-- `context_id' will be used
		require
			a_message /= Void
		do
			last_pushed := gtk_statusbar_push (handle, context_id,
									  a_message.to_external)
		end

	last_pushed: INTEGER
			-- Message id for the last message pushed

	pop (context_id: INTEGER)
			-- Pop last message with current (i.e.: last) context id.
		do
			gtk_statusbar_pop (handle, context_id);
			-- Removes the message at the top of a GtkStatusBar's stack.
		end

	remove_message (context_id, a_message_id: INTEGER)
			-- Forces the removal of a message from a statusbar's
			-- stack. The exact `message_id' must be specified.
		do
			gtk_statusbar_remove (handle, context_id, a_message_id)
		end

	set_has_resize_grip (a_setting: BOOLEAN)
			-- Sets whether the statusbar has a resize grip. True by default.
		do
			gtk_statusbar_set_has_resize_grip(handle, a_setting.to_integer)
		ensure set: a_setting = has_resize_grip
		end			

	has_resize_grip: BOOLEAN
			-- Does the statusbar have a resize grip?
		do
			Result := gtk_statusbar_get_has_resize_grip(handle).to_boolean
		end

feature {ANY} -- Style Properties
	shadow_type: INTEGER
			-- Style of bevel around the statusbar text. Note: in C it is a
			-- GtkShadowType.  Default value: `gtk_shadow_in'.
		do
			print_shadow_type_notice
			invoke_get_property (shadow_type_property_spec.owner_class, handle,
										shadow_type_property_spec.param_id,
										shadow_type_gvalue.handle,
										shadow_type_property_spec.handle)
			Result := shadow_type_gvalue.integer
		ensure is_valid_gtk_shadow_type (Result)
		end

feature {ANY} -- TODO: Signals

	-- "text-popped" void user_function (GtkStatusbar *statusbar, guint
	-- context_id, gchar *text, gpointer user_data) : Run last
	
	-- The "text-popped" signal
	
	-- void user_function (GtkStatusbar *statusbar, guint context_id,
	-- gchar *text, gpointer user_data) : Run last

	-- Is emitted whenever a new message is popped off a statusbar's stack.
	-- statusbar : 	the object which received the signal.
	-- context_id : 	the context id of the relevant message/statusbar.
	-- text : 	the message that was just popped.
	-- user_data : 	user data set when the signal handler was connected.


	-- "text-pushed" void user_function (GtkStatusbar *statusbar, guint
	-- context_id, gchar *text, gpointer user_data) : Run last

	-- The "text-pushed" signal

	-- void user_function (GtkStatusbar *statusbar, guint context_id,
	-- gchar *text, gpointer user_data) : Run last

	-- Is emitted whenever a new message gets pushed onto a statusbar's stack.
	-- statusbar : 	the object which received the signal.
	-- context_id : 	the context id of the relevant message/statusbar.
	-- text : 	the message that was pushed.
	-- user_data : 	user data set when the signal handler was connected.

feature {} -- Implementation
	shadow_type_property_name: STRING is "shadow-type"

	shadow_type_property_spec: G_PARAM_SPEC
		once
			Result:=find_property(shadow_type_property_name)
		ensure not_void: Result /= Void
		end

	shadow_type_gvalue: G_VALUE
	
	print_shadow_type_notice
		once
			print ("[
					  Note: GTK_STATUS_BAR's shadow_type feature relies on the assumption that a GValue
					  can hold an enum value and that can ben handled like an integer.
					  If you are reading this note after an application crash, please report the bug to
					  the Eiffel Wrapper Libraries Collection project at https://gna.org/projects/eiffel-libraries/ 
					  ]")
		end

feature {} -- External calls 

	gtk_statusbar_new: POINTER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_statusbar_get_context_id (a_statusbar, a_context_description: POINTER): INTEGER
			-- Note Result shall be NATURAL since it's a guint
		external "C use <gtk/gtk.h>"
		ensure positive: Result > 0
		end
	
	gtk_statusbar_push (a_statusbar: POINTER; a_context_id: INTEGER;
							  a_text: POINTER): INTEGER
		require
			-- Note: `a_context_id' is a guint and shall be a NATURAL
			positive_context_id: a_context_id >= 0 
		external "C use <gtk/gtk.h>"
		ensure positive: Result > 0
		end

	gtk_statusbar_pop (a_statusbar: POINTER; a_context_id: INTEGER)
		require
			-- Note: `a_context_id' is a guint and shall be a NATURAL
			positive_context_id: a_context_id >= 0 
		external "C use <gtk/gtk.h>"
		end

	gtk_statusbar_remove (a_statusbar: POINTER; a_context_id,
								 a_message_id: INTEGER)
		require
			-- Note: `a_context_id' and `a_message_id' are guint and shall be NATURAL
			positive_context_id: a_context_id >= 0 
			positive_message_id: a_message_id >= 0 
		external "C use <gtk/gtk.h>"
		end

	gtk_statusbar_set_has_resize_grip (a_statusbar: POINTER; a_setting: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_statusbar_get_has_resize_grip (a_statusbar: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

end
