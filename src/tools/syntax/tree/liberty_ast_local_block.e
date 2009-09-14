class LIBERTY_AST_LOCAL_BLOCK

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_DECLARATION]
		export
			{ANY} list_valid_index, list_count, list_lower, list_upper, list_item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Local_Block"

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_LOCAL_BLOCK_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_local_block(Current)
		end

end
