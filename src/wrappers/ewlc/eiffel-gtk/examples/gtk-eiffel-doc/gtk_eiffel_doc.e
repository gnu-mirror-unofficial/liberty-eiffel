note
	description: "."
	copyright: "[
					Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
					
					Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE

					Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN					

					Copyright (C) 2007-2022: Paolo Redaelli

					
					This program is free software; you can redistribute it and/or
					modify it under the terms of the GNU General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					General Public License for more details.

					You should have received a copy of the GNU General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GTK_EIFFEL_DOC
	-- A graphical, interactive tool to read the descriptions of Eiffel classes,
	-- generated by their source code, given a loadpath.se file or an ACE file.
	
	-- TODO: If no such file is provided, the classes from the configuration file
	-- are used.

inherit
	EXTERNAL_TOOL undefine is_equal, copy, fill_tagged_out_memory end
	CLUSTER_VISITOR undefine is_equal, copy, fill_tagged_out_memory end
	VISITOR  undefine is_equal, copy, fill_tagged_out_memory end
	
	-- Graphical interface parents
	GTK_WINDOW redefine on_destroy end
	
insert
	GTK_FILE_CHOOSER_ACTION	undefine fill_tagged_out_memory end
	G_TYPES undefine fill_tagged_out_memory end

create {ANY} main

feature {ANY} 
	main
		do
			initialize_external_tool
			build_gui
			build_documentation
			gtk.run_main_loop 
		end

	initialize_external_tool
		do
			root_class_name := as_any
			bootstrap
		end

	build_documentation
			-- Builds the GTK_TREE_MODELs used		
		do
			-- local text_iterator: ITERATOR[HASHED_STRING]; name: STRING
			create clusters.make
			create classes.make
			create classes_by_cluster.make(tree_store_columns)
			classes_by_cluster.set_sort_column_id (class_name_column_n, gtk_sort_ascending)
			
			-- The pointer will store the address of the Eiffel object
			create cluster_iter.make_from_model(classes_by_cluster)
			create class_iter.make_from_model(classes_by_cluster)
			
			-- Disable the class tree widget
			classes_tree.set_sensitive(False) 
			
			error_handler.when_fatal_error(agent on_fatal_error)
			loaded_cluster_count := 0
			create directory.make
			ace.for_all_clusters(agent {CLUSTER}.accept(Current)) -- agent load_cluster)

			debug io.put_line(once "Building cluster-classes tree (cluster-subcluster currently non computed)") end
			progress_bar.set_text( (classes.count.out+" classes in "+
											clusters.count.out+" clusters.") )
			progress_bar.set_fraction(0.0)
			-- It is much more efficient to set the model and connect the
			-- `on_changed' agent after having finished to insert data in
			-- the tree model.
			classes_tree.set_model(classes_by_cluster)			
			classes_tree.selection.connect_to_changed_signal(agent on_changed)
			classes_tree.set_sensitive(True) -- Re-enable the class tree widget			
		end
	
feature {ANY} -- Classes and clusters storage 
	classes_by_name: GTK_TREE_STORE
	classes_by_cluster: GTK_TREE_STORE
	
	cluster_iter, class_iter: GTK_TREE_ITER

	class_name_column_n: INTEGER is 0
	hashed_name_column_n: INTEGER is 1
	cluster_bool_column_n: INTEGER is 2
	columns_n: INTEGER is 3
			-- Column numbers of `classes_by_name' and
			-- `classes_by_cluster'; the class/cluster name, its hashed
			-- string object, a boolean set to True for clusters.
	
	tree_store_columns: ARRAY[INTEGER_32]
			-- The columns used in the `classes_by_name' and
			-- `classes_by_cluster' models.

			-- TODO: once NATURAL_32 is available this should be an ARRAY[NATURAL_32]
		once
			-- Result := {ARRAY[INTEGER_32] 0,
			-- <<g_type_string.to_integer_32,
				  -- g_type_pointer.to_integer_32,
				  -- g_type_boolean.to_integer_32>>}
			Result := {ARRAY[INTEGER_32] 0, <<g_type_string,
														 g_type_pointer,
														 g_type_boolean>>}

		end
	
	class_text_buffers: HASHED_DICTIONARY[EIFFEL_DOCUMENTATION_TEXT_BUFFER,HASHED_STRING]
		once
			create Result.make
		end
	
feature {ANY} -- Clusters and classes list
	clusters: HASHED_DICTIONARY[CLUSTER,HASHED_STRING] 
			-- All the clusters known 
	
	classes: HASHED_DICTIONARY[CLASS_TEXT,HASHED_STRING]
			-- All the known classes
	
feature {ANY} -- 
	on_fatal_error
		do
			io.put_string(once "Fatal error:%N")			
		end

	loaded_cluster_count: INTEGER
			-- The number of clusters loaded so far.
	
	directory: DIRECTORY 
			-- The directory used in `visit_cluster'
	
	visit_cluster (a_cluster: CLUSTER)
			-- Visit `a_cluster', add its hashed name to `clusters' and
			-- add the hashed name of its classes to `classes';
			-- CLASS_TEXT instances are not created by this features,
			-- because it is a long process, and this feature should
			-- allow smooth behaviour of the user interface while loading
			-- clusters.

			-- CLASS_TEXT instances will be created when the user wants
			-- to show this class.

			-- `classes_by_name' and `classes_by_cluster' tree stores are
			-- filled it, with both the string (column 0) and the pointer
			-- to the hashed string (column 
		require else directory /= Void
		local
			path, class_file_name, progress_bar_text: STRING;
			hashed_cluster_name, hashed_class_name: HASHED_STRING;
			index: INTEGER_32
		do
			debug io.put_string(once "Cluster: "); io.put_line(a_cluster.name) end
			
			hashed_cluster_name := string_aliaser.hashed_string(a_cluster.name)
			clusters.put(a_cluster,hashed_cluster_name)
			
			classes_by_cluster.append (cluster_iter, Void)
			classes_by_cluster.set_string (cluster_iter, class_name_column_n, a_cluster.name)
			classes_by_cluster.set_pointer (cluster_iter, hashed_name_column_n, hashed_cluster_name.to_pointer)
			classes_by_cluster.set_boolean (cluster_iter, cluster_bool_column_n, True)
			
			loaded_cluster_count := loaded_cluster_count + 1
			
			-- TODO: use something that is easier to Internationalize, "Reading cluster %s (%d of 
			-- %d)." % (a_cluster.name, loaded_cluster_count, ace.cluster_count)
			progress_bar_text:="Reading cluster "
			progress_bar_text.append(a_cluster.name)
			progress_bar_text.append(once " (")
			loaded_cluster_count.append_in(progress_bar_text)
			progress_bar_text.append(once " of ")
			ace.cluster_count.append_in(progress_bar_text)
			progress_bar_text.append(once ")")			
			-- TODO: the code above is horrible for an translator
			progress_bar.set_text(progress_bar_text)
			
			progress_bar.set_fraction(loaded_cluster_count/ace.cluster_count)
			
			update_user_interface
			
			path := a_cluster.directory_path
			if path /= Void and then not path.is_empty then
				directory.scan(path)
				if directory.last_scan_status=True then
					from index := directory.lower until index > directory.upper
					loop
						class_file_name := directory.item(index)
						-- path should be the complete path of the file
						class_file_name.to_upper
						if class_file_name.has_suffix(once ".E") then
							class_file_name.remove_tail(2)
							-- class_file_name is now simply the class name
							if is_valid_class_name(class_file_name) then
								debug io.put_spaces(3);	io.put_line(class_file_name)end
								hashed_class_name := string_aliaser.hashed_string(class_file_name)
								classes.put(Void, hashed_class_name) 

								classes_by_cluster.append (class_iter, cluster_iter)
								classes_by_cluster.set_string (class_iter, class_name_column_n, class_file_name)
								classes_by_cluster.set_pointer (class_iter, hashed_name_column_n, hashed_class_name.to_pointer)
								classes_by_cluster.set_boolean (class_iter, cluster_bool_column_n, False)
								
								update_user_interface
							end
						end
						index := index + 1
					end -- directory loop
				else
					debug io.put_string(path) io.put_line(" is not a directory") end
				end -- if directory.last_scan_status=True
			else 
				debug io.put_line(once "Path void or empty") end
			end
		end

	show_class (an_hashed_class_name: HASHED_STRING)
			-- Show the documentation of the class named
			-- `an_hashed_class_name'. If the documentation of the class
			-- hasn't already been generated, generate if.
		require
			name_not_void: an_hashed_class_name/=Void
			is_a_class: classes.has(an_hashed_class_name)
		local class_documentation: EIFFEL_DOCUMENTATION_TEXT_BUFFER 
		do
			class_documentation := class_text_buffers.reference_at(an_hashed_class_name)
			if class_documentation = Void then
				class_documentation := documentation_for(an_hashed_class_name)
				class_text_buffers.put(class_documentation, an_hashed_class_name)
			else
				debug
					io.put_line("Retrieving cached class description.")
				end
			end
			text_view.set_buffer(class_documentation)
		end
	
	documentation_for (an_hashed_class_name: HASHED_STRING): EIFFEL_DOCUMENTATION_TEXT_BUFFER
			-- The documentation of the class named
			-- `an_hashed_class_name'. If it hasn't already been make a 
			-- new text buffer is created and it's content is stored 
			-- into `classes' dictionary.
		require
			name_not_void: an_hashed_class_name/=Void
			is_a_class: classes.has(an_hashed_class_name)
		local class_name: CLASS_NAME; class_text: CLASS_TEXT
		do
			class_text := classes.reference_at(an_hashed_class_name)
			if class_text = Void then
				create class_name.unknown_position(an_hashed_class_name)
				classes.put(class_name.class_text, an_hashed_class_name)
			end
			
			create Result.from_class_name(class_name)
		ensure
			not_void: Result /= Void
			class_text_added_to_classes: classes.reference_at(an_hashed_class_name) /= Void 
		end
	
feature {ANY} -- External tool
	parse_arguments
		do
			-- local argi: INTEGER; arg: STRING
			print("parse arguments only called in non-ace mode%N")
		end

	is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
		do
			-- This is called by smart_eiffel.ace from a loop similar to the one in parse_arguments
			Result := is_version_flag(arg)
				or else is_style_warning_flag(arg)
				or else is_no_warning_flag(arg)
				or else is_verbose_flag(arg)
		end

	valid_argument_for_ace_mode: STRING is "Only the flags -verbose, -version and -help are allowed%Nin ACE file mode.%N"

	use_short_mode: BOOLEAN is False -- True

	usage: STRING is "Please write a proper usage description."

feature {ANY}
	is_valid_class_name (name: STRING): BOOLEAN
			-- Does it follow the syntactic rules for a class name?  I.e. an uppercase letter followed by
			-- optional uppercase letters, digits and underscores.
		require name_not_void: name /= Void
		local i, n: INTEGER
		do
			if not name.is_empty then
				n := name.count
				from i := 2; Result := name.first.in_range('A','Z')
				until not Result or else i > n
				loop
					inspect name.item(i)
					when 'A'..'Z', '0'..'9', '_' then -- ok
					else Result := False
					end
					i := i + 1
				end
			end
		end

feature {ANY} -- User interface
	build_gui
		do
			gtk.initialize
			make
			set_title (window_title)
			set_default_size (640, 480)
			add(main_box)
			
			enable_on_destroy
			show_all
		end

	update_user_interface
			-- Keep the user interface updated: do a main iteration of
			-- the GTK main loop until all user interface events have
			-- been processed. This feature is meant to be called when
			-- processing callbacks that takes long time to process.
		do
			from until not gtk.are_events_pending
			loop gtk.not_blocking_main_iteration -- To keep the User Interface updated.
			end
		end
	
feature {ANY} -- Text constants
	window_title: STRING is "Eiffel documentation"
	ace_chooser_title: STRING is "Assembly of Classes in Eiffel"
	please_select_something_string: STRING
		"<big><big>Please pick either a <b><big>loadpath</big></b> or an <b><big>ACE</big></b> <small>(<b>A</b>ssembly of <b>C</b>lasses in <b>E</b>iffel)</small> file. WEll, actually there is the ACE file passed as argument</big></big>"

feature {ANY} -- Syntactic sugar
	unhomogeneous: BOOLEAN is False
			-- To make non-homogeneours boxes (i.e. GTK_BOXes)
	spaceless: INTEGER is 0
			-- To make boxes with no space between elements
	
feature {ANY} -- Class sorting labels
	alphabetically_sorted: STRING is "Alphabetically"
	sorted_by_cluster: STRING is "By cluster"
	hierarchical_view: STRING is "Class hierarchy"
	sorted_by_usage: STRING is "Most viewed first"

feature {ANY} -- Feature sorting labels
	as_in_source_features: STRING is "As in source"
	alphabetically_sorted_features: STRING is "Alphabetically"
	sorted_by_usage_feature: STRING is "Most viewed first"
	
feature {ANY} -- Widgets
	main_box: GTK_VBOX
			-- The main box: above the ace file chooser, below the rest
		local load_button: GTK_BUTTON
		once
			
			create Result.make(unhomogeneous, spaceless)
			-- pack_start (widget, expand,fill,padding)
			Result.pack_start(ace_chooser,False,True,spaceless)
			create load_button.with_label("Load the ACE/loadpath given on the commandline")
			Result.pack_start(load_button,False,False,spaceless)
			Result.pack_start(tree_text_box,True,True,spaceless)
			Result.pack_start(progress_bar,False,True,spaceless)

			load_button.connect_clicked_signal_to(agent on_load_ace_button)			
		end
	
	tree_text_box: GTK_HPANED
			-- The box containing the classes tree on the left above the
			-- combo to choose the fittest sorting; on the right the
			-- class viewer
		once
			create Result.make
			Result.pack1(tree_box, False, True) -- i.e. don't resize and do shrink
			Result.pack2(text_scrolled_window,True,True) -- ok to resize and to shrink
		end
	
	tree_box: GTK_VBOX
			-- The vertival box containing the classes tree and
			-- sort-selection combo box.
		once
			create Result.make(unhomogeneous, spaceless)
			Result.pack_start(classes_scrolled_window, True, True, spaceless)
			Result.pack_start(tree_sort_selector, False, True, spaceless)
		end

	ace_chooser: GTK_FILE_CHOOSER_BUTTON
			-- The button to choose the ace file
		once
			create Result.from_title(ace_chooser_title, gtk_file_chooser_action_open)
			Result.add_filter(ace_filter)
			Result.add_filter(loadpath_filter)
			Result.set_filter(ace_filter)
			Result.set_width_chars(ace_chooser_title.count)
		end
			
	text_scrolled_window: GTK_SCROLLED_WINDOW
			-- The container of the `text_view' as child widget adds
			-- scrollbars to it, so the gtk-eiffel-doc window does not
			-- expand too much when documentation with long lines is
			-- shown.
		once
			create Result
			Result.set_shadow_type(gtk_shadow_etched_in)
			Result.set_policy(gtk_policy_automatic,gtk_policy_automatic)
			Result.add(text_view)
		end

	text_view: GTK_TEXT_VIEW
		once 
			create Result.make
			Result.set_editable(False)
			Result.set_cursor_visible(False)
			Result.set_wrap_mode(gtk_wrap_word)
		end
	
	classes_scrolled_window: GTK_SCROLLED_WINDOW
			-- The container that containing `class_text' as child widget 
			-- adds scrollbars to it, so the gtk-eiffel-doc window 
			-- will not be thousand lines long.
		once
			create Result
			Result.set_shadow_type(gtk_shadow_etched_in)
			Result.set_policy(gtk_policy_automatic,gtk_policy_automatic)
			Result.add(classes_tree)
		end
	
	classes_tree: GTK_TREE_VIEW
			-- The class tree
		once
			create Result.make
			Result.insert_column (class_name_column, class_name_column_n)
		end
	
	text_renderer: GTK_CELL_RENDERER
		once
			create {GTK_CELL_RENDERER_TEXT} Result.make
		end

	class_name_column: GTK_TREE_VIEW_COLUMN
		once
			create Result.make
			Result.set_title ("Name")
			Result.pack_start (text_renderer, True)
			Result.add_attribute (text_renderer, "text", class_name_column_n)
		end
	
	tree_sort_selector: GTK_COMBO_BOX
			-- The combo box that allow the user to choose the fittest sorting.
		once
			create Result.with_text_only
			Result.append_text(alphabetically_sorted)
			Result.append_text(sorted_by_cluster)
			Result.append_text(sorted_by_usage)
		end
	
	nothing_selected_label: GTK_LABEL
			-- The label showed when no ACE or loadpath file are
			-- selected. 
		once
			create Result.with_markup_label(please_select_something_string)
			Result.set_line_wrap
			Result.set_alignment(0.5,0.5) -- i.e. centered
		end

	progress_bar: GTK_PROGRESS_BAR
			-- The bar used to show the progress of clusters and classes processing
		once
			create Result.make
			Result.set_pulse_step(0.01)
		end
	
feature {ANY} -- File filters
	ace_filter: GTK_FILE_FILTER
		once
			create Result.make
			Result.set_name(once "Assembly of Classes in Eiffel (ACE)")
			Result.add_pattern(once "*.ace")
		end

	loadpath_filter: GTK_FILE_FILTER
		once
			create Result.make
			Result.set_name(once "Loadpath")
			Result.add_pattern(once "*.se")
		end

feature {ANY}  -- Callbacks
	on_destroy
		do
			print ("Eiffel doc window is being destroyed%N")
			gtk.quit
		end

	on_load_ace_button(a_button: GTK_BUTTON)
		do
			io.put_line(once "(Re) build documentation")
			build_documentation
		end

	on_changed (a_selection: GTK_TREE_SELECTION)
		local
			hashed_name: HASHED_STRING; a_value: G_VALUE
			a_model: GTK_TREE_MODEL; an_iter: GTK_TREE_ITER
		do
			debug io.put_string(once "on selection changed: ") end
			an_iter := a_selection.selected
			if a_selection.is_node_selected then
				check an_iter_not_void: an_iter /= Void end

				a_model := a_selection.tree_view.model
				check model_not_void: a_model /= Void end
				
				a_value := a_model.value(an_iter, hashed_name_column_n)
				if a_value.is_pointer then
					-- We got a "well formed" selection
					debug io.put_string(a_model.value(an_iter, class_name_column_n).string)	end

					hashed_name := pointer_to_hashed_string(a_value.pointer)
					if hashed_name /= Void then
						if a_model.value(an_iter, cluster_bool_column_n).boolean=True then -- Cluster selected
							debug
								io.put_line(once " cluster.")
							end
						else -- Class selected
							debug
								io.put_line(once " class.")
							end
							progress_bar.set_text("Loading class "+hashed_name.to_string)
							show_class (hashed_name)
						end
					else -- hashed_name is Void
						debug
							io.put_line(once "No hashed string in the model")
						end
					end
				else 
					debug io.put_line(once "Column hashed_name_column_n is not a pointer") end
				end
			else
				debug io.put_line(once "no node selected.") end
			end -- if a_selection.is_node_selected 
		end

	-- 	on_row_activated (a_path: GTK_TREE_PATH; a_column: GTK_TREE_VIEW_COLUMN; a_view: GTK_TREE_VIEW) is
	-- 		local
	-- 			hashed_name: HASHED_STRING; a_model: GTK_TREE_MODEL; an_iter: GTK_TREE_ITER
	-- 			a_value: G_VALUE
	-- 		do
	-- 			debug
	-- 				io.put_string(once "on row activated: path "); io.put_string(a_path.to_string)
	-- 				io.put_string(once " column %""); io.put_string(a_column.title)
	-- 				io.put_string(once "%" view "); io.put_line(a_view.out)
	-- 			end
	-- 			a_model := a_view.model
	-- 			if a_model /= Void then 
	-- 				an_iter := a_model.get_new_iterator(a_path)

	-- 				debug
	-- 					io.put_line(a_model.value(an_iter,class_name_column_n).string)
	-- 				end
	-- 				hashed_name := pointer_to_hashed_string(a_model.value(an_iter, hashed_name_column_n).pointer)
	-- 				check hashed_name /= Void end
	-- 				a_value := a_model.value(an_iter, cluster_bool_column_n)
	-- 				check a_value.is_boolean end
	-- 				if a_value.boolean then -- Cluster selected
	-- 					debug io.put_line(once "A cluster") end
	-- 				else -- Class selected
	-- 					debug io.put_line(once "A class") end
	-- 					progress_bar.set_text("Loading class "+hashed_name.to_string)
	-- 					--class_text.
	-- 					-- show_class (hashed_name)
	-- 				end
	-- 			else
	-- 				raise(once "Row activated in a GTK_TREE_VIEW with no model set.")
	-- 			end
	-- 		end
	
feature {} -- Dirty tricks 
	pointer_to_hashed_string (a_pointer: POINTER): HASHED_STRING
			-- Forced (DANGEROUS!) conversion of `a_pointer' into an
			-- HASHED_STRING; `a_pointer' must have been obtained with
			-- `to_pointer' used on a real HASHED_STRING. This feature is
			-- used to bless life into the address of a HASHED_STRING
			-- stored into a GtkTreeModel. By the way all the hashed
			-- strings will always be there because there is the
			-- `string_aliaser' singleton.
		external "C inline"
		alias "$a_pointer"
		end
end 
