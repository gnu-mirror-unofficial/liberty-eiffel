-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_ENSURE

inherit
	LIBERTY_WRITTEN_ASSERTIONS

create {LIBERTY_TYPE_BUILDER}
	make

feature {}
	make (a_assertions: like assertions) is
		require
			a_assertions /= Void
		do
			assertions := a_assertions
		ensure
			assertions = a_assertions
		end

end