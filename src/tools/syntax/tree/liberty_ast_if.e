class LIBERTY_AST_IF

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	expression: LIBERTY_AST_EXPRESSION is
		do
			Result ::= nodes.item(1)
		end

	instructions: EIFFEL_LIST_NODE is
		do
			Result ::= nodes.item(3)
		end

feature {ANY}
	count: INTEGER is 4

	name: STRING is "If"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 4 >> }
		end

end
