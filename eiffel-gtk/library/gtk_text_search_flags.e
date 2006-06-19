indexing
	description: "enum GtkTextSearchFlags"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_TEXT_SEARCH_FLAGS
feature  -- enum
	are_valid_search_flags (some_flags :INTEGER): BOOLEAN is
		do	
			Result:=(some_flags | (gtk_text_search_visible_only & gtk_text_search_text_only)).to_boolean
		end

	gtk_text_search_visible_only: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TEXT_SEARCH_VISIBLE_ONLY"
		end
	
	gtk_text_search_text_only: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TEXT_SEARCH_TEXT_ONLY"
		end
end
	
