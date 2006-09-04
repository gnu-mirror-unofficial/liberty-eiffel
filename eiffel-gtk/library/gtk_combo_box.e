indexing
	description: "GtkComboBox -- A widget used to choose from a list of items."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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
	
			-- Description: A GtkComboBox is a widget that allows the
			-- user to choose from a list of valid choices. The
			-- GtkComboBox displays the selected choice. When activated,
			-- the GtkComboBox displays a popup which allows the user to
			-- make a new choice. The style in which the selected value
			-- is displayed, and the style of the popup is determined by
			-- the current theme. It may be similar to a GtkOptionMenu,
			-- or similar to a Windows-style combo box.

			-- Unlike its predecessors GtkCombo and GtkOptionMenu, the
			-- GtkComboBox uses the model-view pattern; the list of valid
			-- choices is specified in the form of a tree model, and the
			-- display of the choices can be adapted to the data in the
			-- model by using cell renderers, as you would in a tree
			-- view. This is possible since GtkComboBox implements the
			-- GtkCellLayout interface. The tree model holding the valid
			-- choices is not restricted to a flat list, it can be a real
			-- tree, and the popup will reflect the tree structure.

			-- In addition to the model-view API, GtkComboBox offers a
			-- simple API which is suitable for text-only combo boxes,
			-- and hides the complexity of managing the data in a
			-- model. It consists of the functions `with_text',
			-- `append_text', `insert_text', `prepend_text',
			-- `remove_text' and `active_text'.
	
class GTK_COMBO_BOX
inherit
	GTK_BIN redefine make end 
	GTK_CELL_EDITABLE 
	GTK_CELL_LAYOUT undefine store_eiffel_wrapper redefine struct_size end
		-- GtkComboBox also implements AtkImplementorIface interface.

insert
	G_OBJECT_RETRIEVER [GTK_TREE_MODEL]
		rename
			retrieve_eiffel_wrapper_from_gobject_pointer as retrieve_model_wrapper_from_pointer,
			eiffel_wrapper_from_gobject_pointer as model_wrapper_from_pointer,
			g_object_get_eiffel_wrapper as g_object_get_model_wrapper
		export {WRAPPER} all 
		end

creation make, with_text_only

feature {} -- Creation
	make is
			-- Creates a new empty GtkComboBox.
		do
			from_external_pointer (gtk_combo_box_new)
			is_text_only:=False
		ensure then no_text_only: not is_text_only
		end


	with_model (a_model: GTK_TREE_MODEL) is
			-- Creates a new GtkComboBox with `a_model'.
		do
			from_external_pointer (gtk_combo_box_new_with_model (handle))
			is_text_only:=False
		ensure no_text_only: not is_text_only
		end

feature -- Model-related features
	wrap_width: INTEGER is
			-- the wrap width which is used to determine the number of
			-- columns for the popup menu. If the wrap width is larger
			-- than 1, the combo box is in table mode.
		require no_simple_api: not is_text_only
		do
			Result:=gtk_combo_box_get_wrap_width (handle)
		end

	set_wrap_width (a_width: INTEGER) is
			-- Sets the wrap width of combo_box to be `a_width'. The wrap
			-- width is basically the preferred number of columns when
			-- you want the popup to be layed out in a table.
		require no_simple_api: not is_text_only
		do
			gtk_combo_box_set_wrap_width    (handle, a_width)
		end

	row_span_column: INTEGER is
			-- the column with row span information for combo_box.
		require no_simple_api: not is_text_only
		do
			Result := gtk_combo_box_get_row_span_column (handle)
		end

	set_row_span_column (a_row_span: INTEGER) is
			-- Sets the column with row span information for combo_box to
			-- be row_span. The row span column contains integers which
			-- indicate how many rows an item should span.
		require no_simple_api: not is_text_only
		do
			gtk_combo_box_set_row_span_column (handle, a_row_span)
		end

	column_span_column: INTEGER is
			-- the column with column span information for combo_box.
		require no_simple_api: not is_text_only
		do
			Result:= gtk_combo_box_get_column_span_column (handle)
		end

	set_column_span_column (a_column_span: INTEGER) is
			-- Sets the column with column span information for combo_box
			-- to be column_span. The column span column contains
			-- integers which indicate how many columns an item should
			-- span.
		require no_simple_api: not is_text_only
		do
			gtk_combo_box_set_column_span_column (handle, a_column_span)
		end

	active_column: INTEGER is
			-- the index of the currently active item, or -1 if there's
			-- no active item. If the model is a non-flat treemodel, and
			-- the active item is not an immediate child of the root of
			-- the tree, this function returns the result of the C call
			-- "gtk_tree_path_get_indices (path)[0]", where path is the
			-- GtkTreePath of the active item.
		require no_simple_api: not is_text_only
		do
			Result := gtk_combo_box_get_active (handle)
		end

	set_active (an_index: INTEGER) is
			-- Sets the active item of combo_box to be the item at index.
		require no_simple_api: not is_text_only
		do
			gtk_combo_box_set_active (handle,an_index)
		end

	active_iter: GTK_TREE_ITER is
			-- An iterator pointing to the current active item, if it
			-- exists. Otherwise Void
		require no_simple_api: not is_text_only
		local gbool: INTEGER; 
		do
			create Result.make -- a newly allocated iterator
			gbool := gtk_combo_box_get_active_iter (handle, Result.handle)
			if gbool=0 then Result:=Void end
		end

	set_active_iter (an_iterator: GTK_TREE_ITER) is
			-- Sets the current active item to be the one referenced by
			-- `an_iterator' that must correspond to a path of depth one.
		require 
			no_simple_api: not is_text_only
			-- TODO: an_iterator.depth = 1
		do
			gtk_combo_box_set_active_iter (handle, an_iterator.handle)
		end
	

	model: GTK_TREE_MODEL is
			-- the GtkTreeModel which is acting as data source for
			-- combo_box.
		require no_simple_api: not is_text_only
		local model_ptr: POINTER
		do
			model_ptr := gtk_combo_box_get_model (handle)
			Result := retrieve_model_wrapper_from_pointer (model_ptr)
		end
	
	set_model (a_model: GTK_TREE_MODEL) is
			-- Sets the model used by combo_box to be model. Will unset a
			-- previously set model (if applicable). If model is NULL,
			-- then it will unset the model.

			-- Note that this function does not clear the cell renderers,
			-- you have to call `cell_layout_clear' yourself if you need
			-- to set up different cell renderers for the new model.
		require 
			no_simple_api: not is_text_only
			model_not_void: a_model /= Void
		do
			gtk_combo_box_set_model (handle, a_model.handle)
		end

	unset_model is
			-- Unsets the model used by combo box.
		require no_simple_api: not is_text_only
		do
			gtk_combo_box_set_model (handle, default_pointer)
		end


feature {} -- Simplified, text-only API creation
	with_text_only is
			-- Convenience constructor of a new text combo box, which
			-- will display only strings. If you use this function to
			-- create a text combo box, you should only manipulate its
			-- data source with the following convenience functions:
			-- `append_text', `insert_text', `prepend_text'' and
			-- `remove_text' as the "simple_api" preconditions state.
		do
			from_external_pointer (gtk_combo_box_new_text )
			is_text_only:=True
		ensure text_only: is_text_only
		end

feature -- Simplified, text-only API
	is_text_only: BOOLEAN
	append_text (a_text: STRING) is
			-- Appends `a_text' to the list of strings stored in combo box.		
		require 
			simple_api: is_text_only
			text_not_void: a_text /= Void
		do
			gtk_combo_box_append_text (handle, a_text.to_external)
		end

	insert_text (a_text: STRING; a_position: INTEGER) is
			-- Inserts `a_text' at `a_position' in the list of strings
			-- stored in combo_box.
		require 
			simple_api: is_text_only
			text_not_void: a_text /= Void
		do
			gtk_combo_box_insert_text (handle, a_position, a_text.to_external)
		end

	prepend_text (a_text: STRING) is
			-- Prepends `a_text' to the list of strings stored in combo box.		
		require 
			simple_api: is_text_only
			text_not_void: a_text /= Void
		do
			gtk_combo_box_prepend_text (handle, a_text.to_external)
		end

	remove_text (a_position: INTEGER) is
			-- Removes the string at `a_position' from combo box. 
		require simple_api: is_text_only
		do
			gtk_combo_box_remove_text (handle, a_position)
		end

	active_text: STRING is
			-- The currently active string in combo_box or Void if none
			-- is selected.
		require simple_api: is_text_only
		local ptr: POINTER
		do
			ptr := gtk_combo_box_get_active_text (handle)
			-- Returns : a newly allocated string containing the
			-- currently active text.
			if ptr.is_not_null then create Result.from_external(ptr) end
		end

feature -- For accessibility technologies
	popup is
			-- Pops up the menu or dropdown list of combo box. This
			-- function is mostly intended for use by accessibility
			-- technologies; applications should have little use for it.
		do
			gtk_combo_box_popup (handle)
		end

	popdown is
			-- Hides the menu or dropdown list of combo_box.  This
			-- function is mostly intended for use by accessibility
			-- technologies; applications should have little use for it.
		do
			gtk_combo_box_popdown (handle)
		end

	-- TODO: popup_accessible_object: ATK_OBJECT is AtkObject*
	-- gtk_combo_box_get_popup_accessible (GtkComboBox *combo_box);
	-- Gets the accessible object corresponding to the combo box's
	-- popup. This function is mostly intended for use by accessibility
	-- technologies; applications should have little use for it.

	-- gtk_combo_box_get_row_separator_func ()

	-- GtkTreeViewRowSeparatorFunc gtk_combo_box_get_row_separator_func
	-- (GtkComboBox *combo_box);

	-- Returns the current row separator function.

	-- combo_box : 	a GtkComboBox
	-- Returns : 	the current row separator function.

	-- Since 2.6
	-- gtk_combo_box_set_row_separator_func ()

	-- void gtk_combo_box_set_row_separator_func
	-- (GtkComboBox *combo_box,
	-- GtkTreeViewRowSeparatorFunc func,
	-- gpointer data,
	-- GtkDestroyNotify destroy);

	-- Sets the row separator function, which is used to determine whether a row should be drawn as a separator. If the row separator function is NULL, no separators are drawn. This is the default value.

	-- combo_box : 	a GtkComboBox
	-- func : 	a GtkTreeViewRowSeparatorFunc
	-- data : 	user data to pass to func, or NULL
	-- destroy : 	destroy notifier for data, or NULL

	-- Since 2.6
	-- gtk_combo_box_set_add_tearoffs ()

	-- void gtk_combo_box_set_add_tearoffs (GtkComboBox *combo_box,
	-- gboolean add_tearoffs);

	-- Sets whether the popup menu should have a tearoff menu item.

	-- combo_box : 	a GtkComboBox
	-- add_tearoffs : 	TRUE to add tearoff menu items

	-- Since 2.6
	-- gtk_combo_box_get_add_tearoffs ()

	-- gboolean gtk_combo_box_get_add_tearoffs (GtkComboBox *combo_box);

	-- Gets the current value of the :add-tearoffs property.

	-- combo_box : 	a GtkComboBox
	-- Returns : 	the current value of the :add-tearoffs property.
	-- gtk_combo_box_set_focus_on_click ()

	-- void gtk_combo_box_set_focus_on_click
	-- (GtkComboBox *combo,
	-- gboolean focus_on_click);

	-- Sets whether the combo box will grab focus when it is clicked with the mouse. Making mouse clicks not grab focus is useful in places like toolbars where you don't want the keyboard focus removed from the main area of the application.

	-- combo : 	a GtkComboBox
	-- focus_on_click : 	whether the combo box grabs focus when clicked with the mouse

	-- Since 2.6
	-- gtk_combo_box_get_focus_on_click ()

	-- gboolean gtk_combo_box_get_focus_on_click
	-- (GtkComboBox *combo);

	-- Returns whether the combo box grabs focus when it is clicked with the mouse. See gtk_combo_box_set_focus_on_click().

	-- combo : 	a GtkComboBox
	-- Returns : 	TRUE if the combo box grabs focus when it is clicked with the mouse.

	-- Since 2.6
feature -- Properties

	-- "active" gint : Read / Write
	-- "add-tearoffs" gboolean : Read / Write
	-- "column-span-column" gint : Read / Write
	-- "focus-on-click" gboolean : Read / Write
	-- "has-frame" gboolean : Read / Write
	-- "model" GtkTreeModel : Read / Write
	-- "row-span-column" gint : Read / Write
	-- "wrap-width" gint : Read / Write

	-- Style Properties

	-- "appears-as-list" gboolean : Read

	-- Property Details
	-- The "active" property

	-- "active" gint : Read / Write

	-- The item which is currently active. If the model is a non-flat treemodel, and the active item is not an immediate child of the root of the tree, this property has the value gtk_tree_path_get_indices (path)[0], where path is the GtkTreePath of the active item.

	-- Allowed values: >= -1

	-- Default value: -1

	-- Since 2.4
	-- The "add-tearoffs" property

	-- "add-tearoffs" gboolean : Read / Write

	-- The add-tearoffs property controls whether generated menus have tearoff menu items.

	-- Note that this only affects menu style combo boxes.

	-- Default value: FALSE

	-- Since 2.6
	-- The "column-span-column" property

	-- "column-span-column" gint : Read / Write

	-- If this is set to a non-negative value, it must be the index of a column of type G_TYPE_INT in the model.

	-- The values of that column are used to determine how many columns a value in the list will span.

	-- Allowed values: >= -1

	-- Default value: -1

	-- Since 2.4
	-- The "focus-on-click" property

	-- "focus-on-click" gboolean : Read / Write

	-- Whether the combo box grabs focus when it is clicked with the mouse.

	-- Default value: TRUE
	-- The "has-frame" property

	-- "has-frame" gboolean : Read / Write

	-- The has-frame property controls whether a frame is drawn around the entry.

	-- Default value: TRUE

	-- Since 2.6
	-- The "model" property

	-- "model" GtkTreeModel : Read / Write

	-- The model from which the combo box takes the values shown in the list.

	-- Since 2.4
	-- The "row-span-column" property

	-- "row-span-column" gint : Read / Write

	-- If this is set to a non-negative value, it must be the index of a column of type G_TYPE_INT in the model.

	-- The values of that column are used to determine how many rows a value in the list will span. Therefore, the values in the model column pointed to by this property must be greater than zero and not larger than wrap-width.

	-- Allowed values: >= -1

	-- Default value: -1

	-- Since 2.4
	-- The "wrap-width" property

	-- "wrap-width" gint : Read / Write

	-- If wrap-width is set to a positive value, the list will be displayed in multiple columns, the number of columns is determined by wrap-width.

	-- Allowed values: >= 0

	-- Default value: 0

	-- Since 2.4
	-- Style Property Details
	-- The "appears-as-list" style property

	-- "appears-as-list" gboolean : Read

	-- Whether dropdowns should look like lists rather than menus.

	-- Default value: FALSE
feature -- Signals

	-- "changed" void user_function (GtkComboBox *widget,
	-- gpointer user_data) : Run last

	-- Signal Details
	-- The "changed" signal

	-- void user_function (GtkComboBox *widget,
	-- gpointer user_data) : Run last

	-- The changed signal is emitted when the active item is changed. The can be due to the user selecting a different item from the list, or due to a call to gtk_combo_box_set_active_iter(). It will also be emitted while typing into a GtkComboBoxEntry, as well as when selecting an item from the GtkComboBoxEntry's list.

	-- widget : 	the object which received the signal
	-- user_data : 	user data set when the signal handler was connected.

	-- Since 2.4
	-- See Also

	-- GtkComboBoxEntry, GtkTreeModel, GtkCellRenderer

feature -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkComboBox)"
		end

feature {} -- External calls
	gtk_combo_box_new: POINTER is -- 	GtkWidget*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_new_with_model (a_model: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_wrap_width (a_combo_box: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_wrap_width (a_combo_box: POINTER; a_width: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_row_span_column (a_combo_box: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_row_span_column (a_combo_box: POINTER; a_row_span: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_column_span_column (a_combo_box: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_column_span_column (a_combo_box: POINTER; a_column_span: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_active (a_combo_box: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_active (a_combo_box: POINTER; an_index: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_active_iter (a_combo_box: POINTER; a_gtktreeiter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_active_iter (a_combo_box: POINTER; a_gtktreeiter: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_model (a_combo_box: POINTER): POINTER is -- GtkTreeModel*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_model (a_combo_box: POINTER; a_model: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_new_text: POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_append_text (a_combo_box: POINTER; a_text: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_insert_text (a_combo_box: POINTER; a_position: INTEGER; a_text: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_prepend_text (a_combo_box: POINTER; a_text: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_remove_text (a_combo_box: POINTER; a_position: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_active_text (a_combo_box: POINTER): POINTER is --	gchar*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_popup (a_combo_box: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_popdown (a_combo_box: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_popup_accessible (a_combo_box: POINTER): POINTER is -- AtkObject*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_row_separator_func (a_combo_box: POINTER): POINTER is -- GtkTreeViewRowSeparatorFunc
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_row_separator_func (a_combo_box: POINTER; a_gtktreeviewrowseparatorfunc: POINTER; some_data: POINTER; a_gtkdestroynotify: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_add_tearoffs (a_combo_box: POINTER; add_tearoffs: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_add_tearoffs (a_combo_box: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_focus_on_click (a_combo_box: POINTER; focus_on_click: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_focus_on_click (a_combo_box: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
end
