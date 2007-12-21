indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

	wrapped_version: "2.0.1"

class GTK_SOURCE_VIEW

inherit
	(SHARED_?)C_STRUCT

insert
	GTK_SOURCE_VIEW_EXTERNALS

creation make, from_external_pointer

feature {} -- Creation

	--   Link: GtkSourceView 2 Reference Manual (start)
	--   Link: API reference (parent)
	--   Link: Searching in a GtkSourceBuffer (previous)
	--   Link: GtkSourceLanguage (next)
	--   Link: API reference (reference)
	--   Link: Syntax highlighting reference (reference)
	--
	--   Prev      Up     Home        GtkSourceView 2 Reference Manual     Next
	--   Top  |  Description  |  Object Hierarchy  |  Implemented Interfaces  |
	--   Properties  |  Signals
	--
	--   GtkSourceView
	--
	--   GtkSourceView
	--
	--Synopsis
	--
	--
	-- #include <gtksourceview/gtksourceview.h>
	--
	--
	--                     GtkSourceView;
	--                     GtkSourceViewClass;
	-- enum                GtkSourceSmartHomeEndType;
	-- GtkWidget*          gtk_source_view_new                 (void);
	-- GtkWidget*          gtk_source_view_new_with_buffer     (GtkSourceBuffer *buffer);
	-- void                gtk_source_view_set_auto_indent     (GtkSourceView *view,
	--                                                          gboolean enable);
	-- gboolean            gtk_source_view_get_auto_indent     (GtkSourceView *view);
	-- void                gtk_source_view_set_indent_on_tab   (GtkSourceView *view,
	--                                                          gboolean enable);
	-- gboolean            gtk_source_view_get_indent_on_tab   (GtkSourceView *view);
	-- void                gtk_source_view_set_indent_width    (GtkSourceView *view,
	--                                                          gint width);
	-- gint                gtk_source_view_get_indent_width    (GtkSourceView *view);
	-- void                gtk_source_view_set_insert_spaces_instead_of_tabs
	--                                                         (GtkSourceView *view,
	--                                                          gboolean enable);
	-- gboolean            gtk_source_view_get_insert_spaces_instead_of_tabs
	--                                                         (GtkSourceView *view);
	-- void                gtk_source_view_set_smart_home_end  (GtkSourceView *view,
	--                                                          GtkSourceSmartHomeEndType smart_he);
	-- GtkSourceSmartHomeEndType gtk_source_view_get_smart_home_end
	--                                                         (GtkSourceView *view);
	-- void                gtk_source_view_set_highlight_current_line
	--                                                         (GtkSourceView *view,
	--                                                          gboolean show);
	-- gboolean            gtk_source_view_get_highlight_current_line
	--                                                         (GtkSourceView *view);
	-- void                gtk_source_view_set_show_line_numbers
	--                                                         (GtkSourceView *view,
	--                                                          gboolean show);
	-- gboolean            gtk_source_view_get_show_line_numbers
	--                                                         (GtkSourceView *view);
	-- void                gtk_source_view_set_show_right_margin
	--                                                         (GtkSourceView *view,
	--                                                          gboolean show);
	-- gboolean            gtk_source_view_get_show_right_margin
	--                                                         (GtkSourceView *view);
	-- void                gtk_source_view_set_right_margin_position
	--                                                         (GtkSourceView *view,
	--                                                          guint pos);
	-- guint               gtk_source_view_get_right_margin_position
	--                                                         (GtkSourceView *view);
	-- void                gtk_source_view_set_tab_width       (GtkSourceView *view,
	--                                                          guint width);
	-- guint               gtk_source_view_get_tab_width       (GtkSourceView *view);
	--
	--
	--Object Hierarchy
	--
	--
	--   GObject
	--    +----GInitiallyUnowned
	--          +----GtkObject
	--                +----GtkWidget
	--                      +----GtkContainer
	--                            +----GtkTextView
	--                                  +----GtkSourceView
	--
	--Implemented Interfaces
	--
	--   GtkSourceView implements AtkImplementorIface and GtkBuildable.
	--
	--Properties
	--
	--
	--   "auto-indent"              gboolean              : Read / Write
	--   "highlight-current-line"   gboolean              : Read / Write
	--   "indent-on-tab"            gboolean              : Read / Write
	--   "indent-width"             gint                  : Read / Write
	--   "insert-spaces-instead-of-tabs" gboolean              : Read / Write
	--   "right-margin-position"    guint                 : Read / Write
	--   "show-line-numbers"        gboolean              : Read / Write
	--   "show-right-margin"        gboolean              : Read / Write
	--   "smart-home-end"           GtkSourceSmartHomeEndType  : Read / Write
	--   "tab-width"                guint                 : Read / Write
	--
	--Signals
	--
	--
	--   "redo"                                           : Run Last / Action
	--   "undo"                                           : Run Last / Action
	--
	--Description
	--
	--Details
	--
	--  GtkSourceView
	--
	-- typedef struct _GtkSourceView GtkSourceView;
	--
	--   --------------------------------------------------------------------------
	--
	--  GtkSourceViewClass
	--
	-- typedef struct {
	--         GtkTextViewClass parent_class;
	--
	--         void (*undo) (GtkSourceView *view);
	--         void (*redo) (GtkSourceView *view);
	--
	--         /* Padding for future expansion */
	--         void (*_gtk_source_reserved1) (void);
	--         void (*_gtk_source_reserved2) (void);
	--         void (*_gtk_source_reserved3) (void);
	--         void (*_gtk_source_reserved4) (void);
	-- } GtkSourceViewClass;
	--
	--   --------------------------------------------------------------------------
	--
	--  enum GtkSourceSmartHomeEndType
	--
	-- typedef enum
	-- {
	--         GTK_SOURCE_SMART_HOME_END_DISABLED,
	--         GTK_SOURCE_SMART_HOME_END_BEFORE,
	--         GTK_SOURCE_SMART_HOME_END_AFTER,
	--         GTK_SOURCE_SMART_HOME_END_ALWAYS
	-- } GtkSourceSmartHomeEndType;
	--
	--   GTK_SOURCE_SMART_HOME_END_DISABLED smart-home-end disabled.
	--   GTK_SOURCE_SMART_HOME_END_BEFORE   move to the first/last non-whitespace
	--                                      character on the first press of the
	--                                      HOME/END keys and to the beginning/end
	--                                      of the line on the second press.
	--   GTK_SOURCE_SMART_HOME_END_AFTER    move to the beginning/end of the line
	--                                      on the first press of the HOME/END keys
	--                                      and to the first/last non-whitespace
	--                                      character on the second press.
	--   GTK_SOURCE_SMART_HOME_END_ALWAYS   always move to the first/last
	--                                      non-whitespace character when the
	--                                      HOME/END keys are pressed.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_new ()
	--
	-- GtkWidget*          gtk_source_view_new                 (void);
	--
	--   Creates a new GtkSourceView. An empty default buffer will be created for
	--   you. If you want to specify your own buffer, consider
	--   gtk_source_view_new_with_buffer().
	--
	--   Returns : a new GtkSourceView
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_new_with_buffer ()
	--
	-- GtkWidget*          gtk_source_view_new_with_buffer     (GtkSourceBuffer *buffer);
	--
	--   Creates a new GtkSourceView widget displaying the buffer buffer. One
	--   buffer can be shared among many widgets.
	--
	--   buffer :  a GtkSourceBuffer.
	--   Returns : a new GtkTextView.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_set_auto_indent ()
	--
	-- void                gtk_source_view_set_auto_indent     (GtkSourceView *view,
	--                                                          gboolean enable);
	--
	--   If TRUE auto indentation of text is enabled.
	--
	--   view :   a GtkSourceView.
	--   enable : whether to enable auto indentation.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_get_auto_indent ()
	--
	-- gboolean            gtk_source_view_get_auto_indent     (GtkSourceView *view);
	--
	--   Returns whether auto indentation of text is enabled.
	--
	--   view :    a GtkSourceView.
	--   Returns : TRUE if auto indentation is enabled.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_set_indent_on_tab ()
	--
	-- void                gtk_source_view_set_indent_on_tab   (GtkSourceView *view,
	--                                                          gboolean enable);
	--
	--   If TRUE, when the tab key is pressed and there is a selection, the
	--   selected text is indented of one level instead of being replaced with the
	--   \t characters. Shift+Tab unindents the selection.
	--
	--   view :   a GtkSourceView.
	--   enable : whether to indent a block when tab is pressed.
	--
	--   Since 1.8
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_get_indent_on_tab ()
	--
	-- gboolean            gtk_source_view_get_indent_on_tab   (GtkSourceView *view);
	--
	--   Returns whether when the tab key is pressed the current selection should
	--   get indented instead of replaced with the \t character.
	--
	--   view :    a GtkSourceView.
	--   Returns : TRUE if the selection is indented when tab is pressed.
	--
	--   Since 1.8
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_set_indent_width ()
	--
	-- void                gtk_source_view_set_indent_width    (GtkSourceView *view,
	--                                                          gint width);
	--
	--   Sets the number of spaces to use for each step of indent. If width is -1,
	--   the value of the GtkSourceView::tab-width property will be used.
	--
	--   view :  a GtkSourceView.
	--   width : indent width in characters.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_get_indent_width ()
	--
	-- gint                gtk_source_view_get_indent_width    (GtkSourceView *view);
	--
	--   Returns the number of spaces to use for each step of indent. See
	--   gtk_source_view_set_indent_width() for details.
	--
	--   view :    a GtkSourceView.
	--   Returns : indent width.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_set_insert_spaces_instead_of_tabs ()
	--
	-- void                gtk_source_view_set_insert_spaces_instead_of_tabs
	--                                                         (GtkSourceView *view,
	--                                                          gboolean enable);
	--
	--   If TRUE any tabulator character inserted is replaced by a group of space
	--   characters.
	--
	--   view :   a GtkSourceView.
	--   enable : whether to insert spaces instead of tabs.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_get_insert_spaces_instead_of_tabs ()
	--
	-- gboolean            gtk_source_view_get_insert_spaces_instead_of_tabs
	--                                                         (GtkSourceView *view);
	--
	--   Returns whether when inserting a tabulator character it should be replaced
	--   by a group of space characters.
	--
	--   view :    a GtkSourceView.
	--   Returns : TRUE if spaces are inserted instead of tabs.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_set_smart_home_end ()
	--
	-- void                gtk_source_view_set_smart_home_end  (GtkSourceView *view,
	--                                                          GtkSourceSmartHomeEndType smart_he);
	--
	--   Set the desired movement of the cursor when HOME and END keys are pressed.
	--
	--   view :     a GtkSourceView.
	--   smart_he : the desired behavior among GtkSourceSmartHomeEndType
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_get_smart_home_end ()
	--
	-- GtkSourceSmartHomeEndType gtk_source_view_get_smart_home_end
	--                                                         (GtkSourceView *view);
	--
	--   view :    a GtkSourceView.
	--   Returns : a GtkSourceSmartHomeEndTypeend value specifying how the cursor
	--             will move when HOME and END keys are pressed.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_set_highlight_current_line ()
	--
	-- void                gtk_source_view_set_highlight_current_line
	--                                                         (GtkSourceView *view,
	--                                                          gboolean show);
	--
	--   If show is TRUE the current line is highlighted.
	--
	--   view : a GtkSourceView
	--   show : whether to highlight the current line
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_get_highlight_current_line ()
	--
	-- gboolean            gtk_source_view_get_highlight_current_line
	--                                                         (GtkSourceView *view);
	--
	--   Returns whether the current line is highlighted
	--
	--   view :    a GtkSourceView
	--   Returns : TRUE if the current line is highlighted.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_set_show_line_numbers ()
	--
	-- void                gtk_source_view_set_show_line_numbers
	--                                                         (GtkSourceView *view,
	--                                                          gboolean show);
	--
	--   If TRUE line numbers will be displayed beside the text.
	--
	--   view : a GtkSourceView.
	--   show : whether line numbers should be displayed.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_get_show_line_numbers ()
	--
	-- gboolean            gtk_source_view_get_show_line_numbers
	--                                                         (GtkSourceView *view);
	--
	--   Returns whether line numbers are displayed beside the text.
	--
	--   view :    a GtkSourceView.
	--   Returns : TRUE if the line numbers are displayed.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_set_show_right_margin ()
	--
	-- void                gtk_source_view_set_show_right_margin
	--                                                         (GtkSourceView *view,
	--                                                          gboolean show);
	--
	--   If TRUE a right margin is displayed
	--
	--   view : a GtkSourceView.
	--   show : whether to show a right margin.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_get_show_right_margin ()
	--
	-- gboolean            gtk_source_view_get_show_right_margin
	--                                                         (GtkSourceView *view);
	--
	--   Returns whether a right margin is displayed.
	--
	--   view :    a GtkSourceView.
	--   Returns : TRUE if the right margin is shown.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_set_right_margin_position ()
	--
	-- void                gtk_source_view_set_right_margin_position
	--                                                         (GtkSourceView *view,
	--                                                          guint pos);
	--
	--   Sets the position of the right margin in the given view.
	--
	--   view : a GtkSourceView.
	--   pos :
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_get_right_margin_position ()
	--
	-- guint               gtk_source_view_get_right_margin_position
	--                                                         (GtkSourceView *view);
	--
	--   Gets the position of the right margin in the given view.
	--
	--   view :    a GtkSourceView.
	--   Returns : the position of the right margin.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_set_tab_width ()
	--
	-- void                gtk_source_view_set_tab_width       (GtkSourceView *view,
	--                                                          guint width);
	--
	--   Sets the width of tabulation in characters.
	--
	--   view :  a GtkSourceView.
	--   width : width of tab in characters.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_view_get_tab_width ()
	--
	-- guint               gtk_source_view_get_tab_width       (GtkSourceView *view);
	--
	--   Returns the width of tabulation in characters.
	--
	--   view :    a GtkSourceView.
	--   Returns : width of tab.
	--
	--Property Details
	--
	--  The "auto-indent" property
	--
	--   "auto-indent"              gboolean              : Read / Write
	--
	--   Whether to enable auto indentation.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "highlight-current-line" property
	--
	--   "highlight-current-line"   gboolean              : Read / Write
	--
	--   Whether to highlight the current line.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "indent-on-tab" property
	--
	--   "indent-on-tab"            gboolean              : Read / Write
	--
	--   Whether to indent the selected text when the tab key is pressed.
	--
	--   Default value: TRUE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "indent-width" property
	--
	--   "indent-width"             gint                  : Read / Write
	--
	--   Width of an indentation step expressed in number of spaces.
	--
	--   Allowed values: [-1,32]
	--
	--   Default value: -1
	--
	--   --------------------------------------------------------------------------
	--
	--  The "insert-spaces-instead-of-tabs" property
	--
	--   "insert-spaces-instead-of-tabs" gboolean              : Read / Write
	--
	--   Whether to insert spaces instead of tabs.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "right-margin-position" property
	--
	--   "right-margin-position"    guint                 : Read / Write
	--
	--   Position of the right margin.
	--
	--   Allowed values: [1,200]
	--
	--   Default value: 80
	--
	--   --------------------------------------------------------------------------
	--
	--  The "show-line-numbers" property
	--
	--   "show-line-numbers"        gboolean              : Read / Write
	--
	--   Whether to display line numbers.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "show-right-margin" property
	--
	--   "show-right-margin"        gboolean              : Read / Write
	--
	--   Whether to display the right margin.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "smart-home-end" property
	--
	--   "smart-home-end"           GtkSourceSmartHomeEndType  : Read / Write
	--
	--   Set the behavior of the HOME and END keys.
	--
	--   Default value: GTK_SOURCE_SMART_HOME_END_DISABLED
	--
	--   Since 2.0
	--
	--   --------------------------------------------------------------------------
	--
	--  The "tab-width" property
	--
	--   "tab-width"                guint                 : Read / Write
	--
	--   Width of an tab character expressed in number of spaces.
	--
	--   Allowed values: [1,32]
	--
	--   Default value: 8
	--
	--Signal Details
	--
	--  The "redo" signal
	--
	-- void                user_function                      (GtkSourceView *sourceview,
	--                                                         gpointer       user_data)       : Run Last / Action
	--
	--   sourceview : the object which received the signal.
	--   user_data :  user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "undo" signal
	--
	-- void                user_function                      (GtkSourceView *sourceview,
	--                                                         gpointer       user_data)       : Run Last / Action
	--
	--   sourceview : the object which received the signal.
	--   user_data :  user data set when the signal handler was connected.

end -- class GTK_SOURCE_VIEW
