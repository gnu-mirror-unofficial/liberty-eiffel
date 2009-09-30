class LIBERTY_AST_E10

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	is_call: BOOLEAN is
		do
			Result := count = 1 and then nodes.first.name.is_equal(once "Call")
		end

	call: LIBERTY_AST_CALL is
		require
			is_call
		do
			Result ::= nodes.item(0)
		end

	is_tuple: BOOLEAN is
		do
			Result := nodes.first.name.is_equal(once "KW [")
			check
				Result = nodes.last.name.is_equal(once "KW ]")
			end
		end

	tuple_actuals: EIFFEL_LIST_NODE is
			-- Void if empty tuple
		require
			is_tuple
		do
			if count = 3 then
				Result ::= nodes.item(1)
			end
		end

	is_open_argument: BOOLEAN is
		do
			Result := count = 1 and then nodes.first.name.is_equal(once "KW ?")
		end

	is_manifest_or_type_test: BOOLEAN is
		do
			Result := count = 2 and then nodes.first.name.is_equal(once "Manifest_Or_Type_Test")
		end

	manifest_or_type_test: LIBERTY_AST_MANIFEST_OR_TYPE_TEST is
		require
			is_manifest_or_type_test
		do
			Result ::= nodes.item(0)
		end

	manifest_or_type_test_r10: LIBERTY_AST_R10 is
		require
			is_manifest_or_type_test
		do
			Result ::= nodes.item(1)
		end

	is_inline_agent: BOOLEAN is
		do
			Result := count = 4
			check
				Result = nodes.item(0).name.is_equal(once "Agent_Signature")
			end
		end

	inline_agent_signature: LIBERTY_AST_AGENT_SIGNATURE is
		require
			is_inline_agent
		do
			Result ::= nodes.item(0)
		end

	inline_agent_block: LIBERTY_AST_EIFFEL_BLOCK is
		require
			is_inline_agent
		do
			Result ::= nodes.item(2)
		end

	inline_agent_actuals: LIBERTY_AST_ACTUALS is
		require
			is_inline_agent
		do
			Result ::= nodes.item(3)
		end

	is_agent_creation: BOOLEAN is
		do
			Result := count = 2 and then nodes.item(0).name.is_equal(once "KW agent")
		end

	agent_creation_expression: LIBERTY_AST_EXPRESSION is
		require
			is_agent_creation
		do
			Result ::= nodes.item(1)
		end

	is_creation_expression: BOOLEAN is
		do
			Result := count = 1 and then nodes.item(0).name.is_equal(once "Creation_Expression")
		end

	creation_expression: LIBERTY_AST_CREATION_EXPRESSION is
		require
			is_creation_expression
		do
			Result ::= nodes.item(0)
		end

	is_void: BOOLEAN is
		do
			Result := count = 1 and then nodes.item(0).name.is_equal(once "KW Void")
		end

	is_assignment_test: BOOLEAN is
		do
			Result := count = 3 and then nodes.item(1).name.is_equal(once "KW ?:=")
		end

	assignment_test_entity_name: LIBERTY_AST_ENTITY_NAME is
		require
			is_assignment_test
		do
			Result ::= nodes.item(0)
		end

	assignment_test_expression: LIBERTY_AST_EXPRESSION is
		require
			is_assignment_test
		do
			Result ::= nodes.item(2)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "e10"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1, 2, 3, 4 >> }
		end

end
