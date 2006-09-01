deferred class XMLRPC_ERROR_TYPE

		-- #define XMLRPC_INTERNAL_ERROR               (-500)
		-- #define XMLRPC_TYPE_ERROR                   (-501)
		-- #define XMLRPC_INDEX_ERROR                  (-502)
		-- #define XMLRPC_PARSE_ERROR                  (-503)
		-- #define XMLRPC_NETWORK_ERROR                (-504)
		-- #define XMLRPC_TIMEOUT_ERROR                (-505)
		-- #define XMLRPC_NO_SUCH_METHOD_ERROR         (-506)
		-- #define XMLRPC_REQUEST_REFUSED_ERROR        (-507)
		-- #define XMLRPC_INTROSPECTION_DISABLED_ERROR (-508)
		-- #define XMLRPC_LIMIT_EXCEEDED_ERROR         (-509)
		-- #define XMLRPC_INVALID_UTF8_ERROR           (-510)

feature {} -- enum

	is_valid_xmlrpc_error_type (an_error: INTEGER) : BOOLEAN is
		do
			Result := ((an_error = xmlrpc_internal_error) or else
			           (an_error = xmlrpc_type_error) or else
			           (an_error = xmlrpc_index_error) or else
			           (an_error = xmlrpc_parse_error) or else
			           (an_error = xmlrpc_network_error) or else
			           (an_error = xmlrpc_timeout_error) or else
			           (an_error = xmlrpc_no_such_method_error) or else
			           (an_error = xmlrpc_request_refused_error) or else
			           (an_error = xmlrpc_introspection_disabled_error) or else
			           (an_error = xmlrpc_limit_exceeded_error) or else
			           (an_error = xmlrpc_invalid_utf8_error))
		end

		xmlrpc_internal_error: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_INTERNAL_ERROR"
		end

		xmlrpc_type_error: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_ERROR"
		end

		xmlrpc_index_error: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_INDEX_ERROR"
		end

		xmlrpc_parse_error: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_PARSE_ERROR"
		end

		xmlrpc_network_error: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_NETWORK_ERROR"
		end

		xmlrpc_timeout_error: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TIMEOUT_ERROR"
		end

		xmlrpc_no_such_method_error: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_NO_SUCH_METHOD_ERROR"
		end

		xmlrpc_request_refused_error: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_REQUEST_REFUSED_ERROR"
		end

		xmlrpc_introspection_disabled_error: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_INTROSPECTION_DISABLED_ERROR"
		end

		xmlrpc_limit_exceeded_error: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_LIMIT_EXCEEDED_ERROR"
		end

		xmlrpc_invalid_utf8_error: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_INVALID_UTF8_ERROR"
		end

end -- class XMLRPC_ERROR_TYPE
