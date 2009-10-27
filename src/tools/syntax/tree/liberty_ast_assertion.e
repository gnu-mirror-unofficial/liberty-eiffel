-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_ASSERTION

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	tag: LIBERTY_AST_ASSERTION_TAG is
		do
			Result ::= nodes.item(0)
		end

	expression: LIBERTY_AST_EXPRESSION is
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is 2

	name: STRING is "Assertion"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 2 >> }
		end

end