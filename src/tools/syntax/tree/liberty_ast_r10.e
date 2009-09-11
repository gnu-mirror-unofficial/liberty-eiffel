class LIBERTY_AST_R10

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	is_empty: BOOLEAN is
		do
			Result := count = 0
		end

	feature_name: LIBERTY_AST_ENTITY_NAME is
		require
			not is_empty
		do
			Result ::= nodes.item(1)
		end

	actuals: LIBERTY_AST_ACTUALS is
		require
			not is_empty
		do
			Result ::= nodes.item(2)
		end

	remainder: LIBERTY_AST_R10 is
		require
			not is_empty
		do
			Result ::= nodes.item(3)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := count.capacity
		end

	name: STRING is "r10"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 0, 4 >> }
		end

end