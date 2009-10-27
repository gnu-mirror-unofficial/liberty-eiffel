deferred class XMLNS_CALLBACKS
	--
	-- This class fulfills the same role as XML_CALLBACKS, but using namespace differenciation.
	--

feature {XMLNS_PARSER}
	set_validator (a_validator: like validator) is
			-- Sets a validator for this XML file.
		require
			validator = Void
			a_validator /= Void
		do
			validator := a_validator
		ensure
			validator = a_validator
		end

	validator: XMLNS_VALIDATOR
			-- The XML validator for this file (usually an XML Schema)

	with_attribute (attribute_namespace, attribute_name, attribute_value: UNICODE_STRING; line, column: INTEGER) is
			-- Called by the parser to add an attribute of a node BEFORE calling `open_node'
		require
			not attribute_name.is_empty
			attribute_value /= Void
		deferred
		end

	open_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER) is
			-- When the parser reads an opening node
		require
			not node_name.is_empty
		deferred
		ensure
			not at_error implies current_node.is_equal(node_name)
			not at_error implies (current_namespace = node_namespace or else (node_namespace /= Void and then current_namespace /= Void
																									and then current_namespace.is_equal(node_namespace)))
		end

	close_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER) is
			-- When the parser reads a closing node
		require
			not node_name.is_empty
			current_node.is_equal(node_name)
			node_namespace = Void implies current_namespace = Void
			node_namespace /= Void implies current_namespace.is_equal(node_namespace)
		deferred
		end

	open_close_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER) is
			-- When the parser reads a node that opens and closes immediately (syntax "<node/>")
		require
			not node_name.is_empty
		deferred
		end

	xml_header (line, column: INTEGER) is
			-- Called by the parser if a "<?xml ... ?>" header is read.
			-- Note that with_attribute may have been called first (usually with the version and encoding
			-- attributes)
		deferred
		end

	processing_instruction (a_target, a_data: UNICODE_STRING) is
			-- Called by the parser if a "<?...?>" processing instruction is read.
		deferred
		end

	entity (a_entity: UNICODE_STRING; line, column: INTEGER): UNICODE_STRING is
			-- Called by the parser when an '''&entity;''' is found. Note that standard XML attributes (''lt'',
			-- ''gt'', ''amp'', ''apos'' and ''quot'') are automatically handled and not given to this feature
			-- (they cannot be bypassed).
			-- Returns Void if the entity is not recognized.
		deferred
		end

	current_node: UNICODE_STRING is
			-- The current node
		deferred
		end

	current_namespace: UNICODE_STRING is
			-- The current namespace
		deferred
		end

	data (a_data: UNICODE_STRING; line, column: INTEGER) is
			-- Called by the parser when the node contains raw data
		require
			not a_data.is_empty
		deferred
		end

	parse_error (line, column: INTEGER; message: STRING) is
			-- Called by the parser if there is an error
		require
			message /= Void
		deferred
		ensure
			at_error
		end

	at_error: BOOLEAN is
			-- True if there was at least an error
		deferred
		end

end -- class XMLNS_CALLBACKS