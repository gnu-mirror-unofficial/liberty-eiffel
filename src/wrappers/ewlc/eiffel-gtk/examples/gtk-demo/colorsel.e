note
	description: "."
	copyright: "[
					Copyright (C) 2006-2022: Paolo Redaelli, GTK+ team
					
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

class COLORSEL
	
create {ANY} make

feature {ANY}
-- /* Color Selector
--  *
--  * GtkColorSelection lets the user choose a color. GtkColorSelectionDialog is
--  * a prebuilt dialog containing a GtkColorSelection.
--  *
--  */

-- #include <gtk/gtk.h>

-- static GtkWidget *window = NULL;
-- static GtkWidget *da;
-- static GdkColor color;
-- static GtkWidget *frame;

-- /* Expose callback for the drawing area
--  */
-- static gboolean
-- expose_event_callback (GtkWidget *widget, GdkEventExpose *event, gpointer data)
-- {
--   if (widget->window)
--     {
--       GtkStyle *style;

--       style = gtk_widget_get_style (widget);

--       gdk_draw_rectangle (widget->window,
--                           style->bg_gc[GTK_STATE_NORMAL],
--                           TRUE,
--                           event->area.x, event->area.y,
--                           event->area.width, event->area.height);
--     }

--   return TRUE;
-- }

-- static void
-- change_color_callback (GtkWidget *button,
-- 		       gpointer	  data)
-- {
--   GtkWidget *dialog;
--   GtkColorSelection *colorsel;
--   gint response;
  
--   dialog = gtk_color_selection_dialog_new ("Changing color");

--   gtk_window_set_transient_for (GTK_WINDOW (dialog), GTK_WINDOW (window));
  
--   colorsel = GTK_COLOR_SELECTION (GTK_COLOR_SELECTION_DIALOG (dialog)->colorsel);

--   gtk_color_selection_set_previous_color (colorsel, &color);
--   gtk_color_selection_set_current_color (colorsel, &color);
--   gtk_color_selection_set_has_palette (colorsel, TRUE);
  
--   response = gtk_dialog_run (GTK_DIALOG (dialog));

--   if (response == GTK_RESPONSE_OK)
--     {
--       gtk_color_selection_get_current_color (colorsel,
-- 					     &color);
		
--       gtk_widget_modify_bg (da, GTK_STATE_NORMAL, &color);
--     }
  
--   gtk_widget_destroy (dialog);
-- }

-- GtkWidget *
-- do_colorsel (GtkWidget *do_widget)
-- {
--   GtkWidget *vbox;
--   GtkWidget *button;
--   GtkWidget *alignment;
  
--   if (!window)
--     {
--       color.red = 0;
--       color.blue = 65535;
--       color.green = 0;
		
--       window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
--       gtk_window_set_screen (GTK_WINDOW (window),
-- 			     gtk_widget_get_screen (do_widget));
--       gtk_window_set_title (GTK_WINDOW (window), "Color Selection");

--       g_signal_connect (window, "destroy",
-- 			G_CALLBACK (gtk_widget_destroyed), &window);

--       gtk_container_set_border_width (GTK_CONTAINER (window), 8);

--       vbox = gtk_vbox_new (FALSE, 8);
--       gtk_container_set_border_width (GTK_CONTAINER (vbox), 8);
--       gtk_container_add (GTK_CONTAINER (window), vbox);

--       /*
--        * Create the color swatch area
--        */
		
		
--       frame = gtk_frame_new (NULL);
--       gtk_frame_set_shadow_type (GTK_FRAME (frame), GTK_SHADOW_IN);
--       gtk_box_pack_start (GTK_BOX (vbox), frame, TRUE, TRUE, 0);

--       da = gtk_drawing_area_new ();

--       g_signal_connect (da, "expose_event",
-- 			G_CALLBACK (expose_event_callback), NULL);

--       /* set a minimum size */
--       gtk_widget_set_size_request (da, 200, 200);
--       /* set the color */
--       gtk_widget_modify_bg (da, GTK_STATE_NORMAL, &color);
		
--       gtk_container_add (GTK_CONTAINER (frame), da);

--       alignment = gtk_alignment_new (1.0, 0.5, 0.0, 0.0);
		
--       button = gtk_button_new_with_mnemonic ("_Change the above color");
--       gtk_container_add (GTK_CONTAINER (alignment), button);
		
--       gtk_box_pack_start (GTK_BOX (vbox), alignment, FALSE, FALSE, 0);
		
--       g_signal_connect (button, "clicked",
-- 			G_CALLBACK (change_color_callback), NULL);
--     }

--   if (!GTK_WIDGET_VISIBLE (window))
--     {
--       gtk_widget_show_all (window);
--     }
--   else
--     {
--       gtk_widget_destroy (window);
--       window = NULL;
--     }

--   return window;
-- }
end
