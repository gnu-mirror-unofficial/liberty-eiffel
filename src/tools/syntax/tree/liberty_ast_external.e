-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_EXTERNAL

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	definition: LIBERTY_AST_STRING is
		do
			Result ::= nodes.item(1)
		end

	alias_clause: LIBERTY_AST_ALIAS is
		do
			Result ::= nodes.item(2)
		end

feature {ANY}
	count: INTEGER is 3

	name: STRING is "External"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 3 >> }
		end

end