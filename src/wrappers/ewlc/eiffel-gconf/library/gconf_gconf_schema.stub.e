note
	description: "."
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
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

	wrapped_version: "Unknown"

class GCONF_GCONF_SCHEMA

inherit
	(SHARED_?)C_STRUCT

insert
	GCONF_GCONF_SCHEMA_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: GConf Reference Manual (start)
	--   Link: Using the GConf library (parent)
	--   Link: gconf-listeners (previous)
	--   Link: gconf-sources (next)
	--   Link: Using the GConf library (chapter)
	--
	--   Prev Up Home                  GConf Reference Manual                  Next
	--   Top  |  Description
	--
	--   GConfSchema
	--
	--   GConfSchema -- A GConfSchema describes a GConfEntry
	--
	--Synopsis
	--
	--
	--
	--
	--                     GConfSchema;
	-- GConfSchema*        gconf_schema_new                    (void);
	-- void                gconf_schema_free                   (GConfSchema *sc);
	-- GConfSchema*        gconf_schema_copy                   (const GConfSchema *sc);
	-- GConfValueType      gconf_schema_get_type               (const GConfSchema *schema);
	-- const char*         gconf_schema_get_locale             (const GConfSchema *schema);
	-- const char*         gconf_schema_get_short_desc         (const GConfSchema *schema);
	-- const char*         gconf_schema_get_long_desc          (const GConfSchema *schema);
	-- const char*         gconf_schema_get_owner              (const GConfSchema *schema);
	-- GConfValue*         gconf_schema_get_default_value      (const GConfSchema *schema);
	-- GConfValueType      gconf_schema_get_car_type           (const GConfSchema *schema);
	-- GConfValueType      gconf_schema_get_cdr_type           (const GConfSchema *schema);
	-- GConfValueType      gconf_schema_get_list_type          (const GConfSchema *schema);
	-- void                gconf_schema_set_type               (GConfSchema *sc,
	--                                                          GConfValueType type);
	-- void                gconf_schema_set_locale             (GConfSchema *sc,
	--                                                          const gchar *locale);
	-- void                gconf_schema_set_short_desc         (GConfSchema *sc,
	--                                                          const gchar *desc);
	-- void                gconf_schema_set_long_desc          (GConfSchema *sc,
	--                                                          const gchar *desc);
	-- void                gconf_schema_set_owner              (GConfSchema *sc,
	--                                                          const gchar *owner);
	-- void                gconf_schema_set_default_value      (GConfSchema *sc,
	--                                                          const GConfValue *val);
	-- void                gconf_schema_set_default_value_nocopy
	--                                                         (GConfSchema *sc,
	--                                                          GConfValue *val);
	-- void                gconf_schema_set_car_type           (GConfSchema *sc,
	--                                                          GConfValueType type);
	-- void                gconf_schema_set_cdr_type           (GConfSchema *sc,
	--                                                          GConfValueType type);
	-- void                gconf_schema_set_list_type          (GConfSchema *sc,
	--                                                          GConfValueType type);
	--
	--Description
	--
	--   A "schema" describes a key-value pair in a GConf database. It may include
	--   information such as default value and value type, as well as documentation
	--   describing the pair, the name of the application that created the pair,
	--   etc.
	--
	--   A GConfSchema duplicates some of the information about the value it
	--   describes, such as type information. In these cases, the type information
	--   provided describes what the type of the value should be, not what the type
	--   actually is.
	--
	--Details
	--
	--  GConfSchema
	--
	-- typedef struct _GConfSchema GConfSchema;
	--
	--   An opaque data type representing a description of a key-value pair.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_new ()
	--
	-- GConfSchema*        gconf_schema_new                    (void);
	--
	--   Creates a new GConfSchema.
	--
	--   Returns : newly allocated GConfSchema
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_free ()
	--
	-- void                gconf_schema_free                   (GConfSchema *sc);
	--
	--   Deallocates a GConfSchema. Also frees any allocated memory inside the
	--   GConfSchema.
	--
	--   sc : a GConfSchema to destroy.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_copy ()
	--
	-- GConfSchema*        gconf_schema_copy                   (const GConfSchema *sc);
	--
	--   Copies a GConfSchema. The copy is a deep copy, that is, any allocated
	--   memory inside the GConfSchema will also be copied.
	--
	--   sc :      a GConfSchema to copy.
	--   Returns : a newly allocated GConfSchema
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_get_type ()
	--
	-- GConfValueType      gconf_schema_get_type               (const GConfSchema *schema);
	--
	--   Returns the type of the entry described by a GConfSchema
	--
	--   schema :  a GConfSchema
	--   Returns : the entry type.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_get_locale ()
	--
	-- const char*         gconf_schema_get_locale             (const GConfSchema *schema);
	--
	--   Returns the locale for a GConfSchema. The returned string is not a copy,
	--   so don't try to free it. It is "owned" by the GConfSchema and will be
	--   destroyed when the GConfSchema is destroyed.
	--
	--   schema :  a GConfSchema
	--   Returns : the locale
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_get_short_desc ()
	--
	-- const char*         gconf_schema_get_short_desc         (const GConfSchema *schema);
	--
	--   Returns the short description for a GConfSchema. The returned string is
	--   not a copy, don't try to free it. It is "owned" by the GConfSchema and
	--   will be destroyed when the GConfSchema is destroyed.
	--
	--   schema :  a GConfSchema.
	--   Returns : the short description.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_get_long_desc ()
	--
	-- const char*         gconf_schema_get_long_desc          (const GConfSchema *schema);
	--
	--   Returns the long description for a GConfSchema. The returned string is not
	--   a copy, don't try to free it. It is "owned" by the GConfSchema and will be
	--   destroyed when the GConfSchema is destroyed.
	--
	--   schema :  a GConfSchema
	--   Returns : the long description.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_get_owner ()
	--
	-- const char*         gconf_schema_get_owner              (const GConfSchema *schema);
	--
	--   Returns the owner of a GConfSchema. The returned string is not a copy,
	--   don't try to free it. It is "owned" by the GConfSchema and will be
	--   destroyed when the GConfSchema is destroyed.
	--
	--   schema :  a GConfSchema.
	--   Returns : the owner.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_get_default_value ()
	--
	-- GConfValue*         gconf_schema_get_default_value      (const GConfSchema *schema);
	--
	--   Returns the default value of the entry that is described by a GConfSchema.
	--
	--   schema :  a GConfSchema.
	--   Returns : the default value of the entry.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_get_car_type ()
	--
	-- GConfValueType      gconf_schema_get_car_type           (const GConfSchema *schema);
	--
	--   Returns the default type of the first member of the pair in the entry
	--   (which should be of type GCONF_VALUE_PAIR) described by schema.
	--
	--   schema :  a GConfSchema.
	--   Returns : the type of the first member of the pair element of the entry.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_get_cdr_type ()
	--
	-- GConfValueType      gconf_schema_get_cdr_type           (const GConfSchema *schema);
	--
	--   Returns the default type of the second member of the pair in the entry
	--   (which should be of type GCONF_VALUE_PAIR) described by schema.
	--
	--   schema :  a GConfSchema.
	--   Returns : the type of the second member of the pair element of the entry.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_get_list_type ()
	--
	-- GConfValueType      gconf_schema_get_list_type          (const GConfSchema *schema);
	--
	--   Returns the default type of the list elements of the entry (which should
	--   be of default type GCONF_VALUE_LIST) described by schema.
	--
	--   +schema: a GConfSchema. +Returns: the type of the list elements of the
	--   entry.
	--
	--   schema :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_set_type ()
	--
	-- void                gconf_schema_set_type               (GConfSchema *sc,
	--                                                          GConfValueType type);
	--
	--   Sets the GConfValueType of the GConfSchema to type.
	--
	--   sc :   a GConfSchema.
	--   type : the type.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_set_locale ()
	--
	-- void                gconf_schema_set_locale             (GConfSchema *sc,
	--                                                          const gchar *locale);
	--
	--   Sets the locale for a GConfSchema to locale. locale is copied.
	--
	--   sc :     a GConfSchema.
	--   locale : the locale.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_set_short_desc ()
	--
	-- void                gconf_schema_set_short_desc         (GConfSchema *sc,
	--                                                          const gchar *desc);
	--
	--   Sets the short description of a GConfSchema to desc. desc is copied.
	--
	--   sc :   a GConfSchema.
	--   desc : the short description.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_set_long_desc ()
	--
	-- void                gconf_schema_set_long_desc          (GConfSchema *sc,
	--                                                          const gchar *desc);
	--
	--   Sets the long description of a GConfSchema to desc. desc is copied.
	--
	--   sc :   a GConfSchema.
	--   desc : the long description.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_set_owner ()
	--
	-- void                gconf_schema_set_owner              (GConfSchema *sc,
	--                                                          const gchar *owner);
	--
	--   Sets the "owner" of the GConfSchema, where the owner is the name of the
	--   application that created the entry.
	--
	--   sc :    a GConfSchema.
	--   owner : the name of the creating application.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_set_default_value ()
	--
	-- void                gconf_schema_set_default_value      (GConfSchema *sc,
	--                                                          const GConfValue *val);
	--
	--   Sets the default value for the entry described by the GConfSchema. The
	--   GConfValue is copied. Alternatively, use
	--   gconf_schema_set_default_value_nocopy().
	--
	--   sc :  a GConfSchema.
	--   val : the default value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_set_default_value_nocopy ()
	--
	-- void                gconf_schema_set_default_value_nocopy
	--                                                         (GConfSchema *sc,
	--                                                          GConfValue *val);
	--
	--   Sets the default value for the entry described by the GConfSchema. The
	--   GConfValue is not copied; the GConfSchema takes ownership of it.
	--   Alternatively, use gconf_schema_set_default_value().
	--
	--   sc :  a GConfSchema.
	--   val : the default value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_set_car_type ()
	--
	-- void                gconf_schema_set_car_type           (GConfSchema *sc,
	--                                                          GConfValueType type);
	--
	--   Sets the GConfValueType of the first member (car) of the entry (which
	--   should be of type GCONF_VALUE_PAIR) described by GConfSchema to type.
	--
	--   sc :   a GConfSchema.
	--   type : the type.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_set_cdr_type ()
	--
	-- void                gconf_schema_set_cdr_type           (GConfSchema *sc,
	--                                                          GConfValueType type);
	--
	--   Sets the GConfValueType of the second member (cdr) of the entry (which
	--   should be of type GCONF_VALUE_PAIR) described by GConfSchema to type.
	--
	--   sc :   a GConfSchema.
	--   type : the type.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_schema_set_list_type ()
	--
	-- void                gconf_schema_set_list_type          (GConfSchema *sc,
	--                                                          GConfValueType type);
	--
	--   Sets the GConfValueType of the list elements of the entry (which should be
	--   of type GCONF_VALUE_LIST) described by GConfSchema to type.
	--
	--   sc :   a GConfSchema.
	--   type : the type.

end -- class GCONF_GCONF_SCHEMA
