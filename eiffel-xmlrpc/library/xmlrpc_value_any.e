class XMLRPC_VALUE_ANY

inherit
	SHARED_C_STRUCT redefine dispose end

insert
	XMLRPC_VALUE_EXTERNALS

feature -- size

	struct_size: INTEGER is
		external "C inline use <xmlrpc-c/base.h>"
		alias "sizeof (xmlrpc_value)"
		end

feature {} -- Creation

	from_value (a_value: XMLRPC_VALUE) is
		require
			a_value /= Void
		do
			create env.make
			if is_valid then
				value := a_value
				from_external_pointer (value.handle)
				is_shared := True
			end
		end

feature {} -- Representation

	env: XMLRPC_ENV

	value: XMLRPC_VALUE
		-- This feature is needed to ensure correct garbage collection.
		-- As this class (and all XMLRPC_VALUE_* classes) are SHARED_C_STRUCTs,
		-- we shouldn't release the XMLRPC_VALUE until all XMLRPC_VALUE_*s are
		-- disposed.

feature -- Representation

	is_valid: BOOLEAN is
		require
			env /= Void
			env.handle.is_not_null
		do
			Result := not env.fault_occurred
		end

feature {} -- Destruction

	dispose is
		do
			unref
			Precursor
		end

	unref is
		require
			handle.is_not_null
		do
			xmlrpc_decref (handle)
		end

invariant

	--value /= Void
	env /= Void

end -- class XMLRPC_VALUE_ANY
