deferred class LIBERTY_AST_NON_TERMINAL_NODE

inherit
	EIFFEL_NON_TERMINAL_NODE

feature {ANY}
	name_at (index: INTEGER): STRING is
		do
			Result := nodes.item(index).name
		end

	node_at (index: INTEGER): EIFFEL_NODE is
		do
			Result := nodes.item(index)
		end

	valid_index (index: INTEGER): BOOLEAN is
		do
			Result := index.in_range(lower, upper)
		end

	lower: INTEGER is 0

	upper: INTEGER is
		do
			Result := count + 1
		end

	count: INTEGER is
		deferred
		ensure
			Result > 0
		end

	is_empty: BOOLEAN is False

feature {EIFFEL_GRAMMAR}
	set (index: INTEGER; node: EIFFEL_NODE) is
		do
			nodes.put(node, index)
		end

feature {}
	possible_counts: SET[INTEGER] is
		deferred
		end

	nodes: FIXED_ARRAY[EIFFEL_NODE]

	make (a_name: STRING; a_names: COLLECTION[STRING]) is
		require
			a_name.is_equal(name)
			possible_counts.has(a_names.count)
		do
			nodes := nodes.alloc(a_names.count)
		ensure
			nodes.capacity = a_names.count
		end

invariant
	possible_counts.has(count)
	nodes.capacity = count

end