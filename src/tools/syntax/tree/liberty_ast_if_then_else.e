class LIBERTY_AST_IF_THEN_ELSE

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	then_clause: LIBERTY_AST_THEN is
		do
			Result ::= nodes.item(0)
		end

	elseif_list: EIFFEL_LIST_NODE is
		do
			Result ::= nodes.item(1)
		end

	else_clause: LIBERTY_AST_ELSE is
		do
			Result ::= nodes.item(2)
		end

feature {ANY}
	count: INTEGER is 4

	name: STRING is "If_Then_Else"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 4 >> }
		end

end