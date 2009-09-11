deferred class LIBERTY_AST_R4

inherit
	LIBERTY_AST_EXPRESSION_REMAINDER[LIBERTY_AST_E4]

feature {}
	is_eq: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).is_equal(once "KW =")
		end

	is_ne: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).is_equal(once "KW /=")
		end

	is_le: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).is_equal(once "KW <=")
		end

	is_lt: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).is_equal(once "KW <")
		end

	is_ge: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).is_equal(once "KW >=")
		end

	is_gt: BOOLEAN is
		do
			Result := not is_empty and then nodes.item(0).is_equal(once "KW >")
		end

feature {ANY}
	name: STRING is "r4"

end