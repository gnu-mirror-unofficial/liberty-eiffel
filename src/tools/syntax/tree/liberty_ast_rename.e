class LIBERTY_AST_RENAME

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	old_name: EIFFEL_TERMINAL_NODE is
		do
			Result ::= nodes.item(0)
		end

	new_name: EIFFEL_TERMINAL_NODE is
		do
			Result ::= nodes.item(2)
		end

feature {ANY}
	count: INTEGER is 3

	name: STRING is "Rename"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 3 >> }
		end

end