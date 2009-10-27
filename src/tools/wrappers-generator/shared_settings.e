deferred class SHARED_SETTINGS
	-- Access to the `settings' singleton and commodity features like "proxy"
	-- setters, queries and logging facilities.

feature {ANY}
	settings: SETTINGS is
			-- The singleton to access all the shared settings
		once
			create Result
		end 

	headers: WORDS is once create Result.make end

	is_to_be_emitted (a_file_name: STRING): BOOLEAN is
		-- Shall the declaration in file named `a_file_name' be
		-- wrapped? The content of a file will be emitted when global
		-- is True or if `a_file_name' is in `headers' hashed set.
	do
		Result := (global or else 
		           (a_file_name/=Void and then headers.has(a_file_name)))
   ensure
	   void_gets_false: global or (a_file_name=Void implies Result=False)
	end

feature -- Syntactic sugar
	verbose: BOOLEAN is
		do
			Result := settings.verbose
		end

	global: BOOLEAN is
		do
			Result := settings.global
		end

	on_standard_output: BOOLEAN is
		-- Shall the wrappers be outputted on standard output?
	do
		Result := directory=Void
	end


	directory: STRING is
		do
			Result := settings.directory
		end

	use_naturals is
		do
			settings.use_naturals
		end

	use_integers is
		do
			settings.use_integers
		end

	are_naturals_used: BOOLEAN is
		do
			Result := settings.are_naturals_used
		end

feature {} -- Type mangling
	dequalify (an_id: UNICODE_STRING): UNICODE_STRING is
		-- `an_id' without the type qualifier used by GccXml to mark the
		-- identification labels.

		-- "const", "reference" and "volatile" qualifier are represented in a
		-- CvQualifiedType node adding 'c', 'r' and 'v' to the identifies. i.e.
		-- if "int" has id "_422" a  "const int foo" argument type will be of
		-- type CvQualifiedType with it "_422c". The same rule is used - as far
		-- as I know - also for reference and volatile types.

		-- Result is identical to `an_id' if it does not end with 'c', 'r' and
		-- 'v'; otherwise it is a copy of `an_id' with the last character ('c',
		-- 'r' or 'v') removed. 
	require
		not_void: an_id /= Void
	do
		inspect
		an_id.last.to_character
		when 'c', 'r', 'v' then
		Result := an_id.substring(an_id.lower, an_id.upper - 1)
		else Result := an_id
		end
		-- debug 
		-- 	log(once "dequalify(@(1))=@(2)",<<an_id.out,Result.out>>)
		-- end
	end


feature {} -- Auxiliary features
	buffer: FORMATTER is
		-- Buffer to render the text of the feature currently being
		-- wrapped (a function call, a structure or an enumeration).
	once 
		create Result
	end

	formatter: FORMATTER is
		-- Shared formatter used to format various strings.
	once
		create Result
	end

feature {} -- Constants
	comment: STRING is "%N%T%T-- "

	variadic_function_note: STRING is "%T%T%T-- Variadic call%N"

	unwrappable_function_note: STRING is "%T%T%T-- Unwrappable function%N%T%Tobsolete %"Unwrappable C function%"%N"

	expanded_class: STRING is "expanded class "

	deferred_class: STRING is "deferred class "

	-- struct: STRING is "_STRUCT"

	-- enum: STRING is "_ENUM"

	struct_inherits: STRING is "%N%Ninherit ANY undefine is_equal, copy end%N%N"

	queries_header: STRING is "feature {} -- Low-level queries%N%N"

	setters_header: STRING is "feature {} -- Low-level setters%N%N"

	externals_header: STRING is "feature {} -- External calls%N%N"

	typedefs_features_header: STRING is "feature -- C type definitions (typedefs)%N"

	footer: STRING is "end%N"

	automatically_generated_header: STRING is "[
		-- This file have been created by wrapper-generator.
		-- Any change will be lost by the next execution of the tool.


		]"

	automatically_patched_header: STRING is 
		-- Label 
		"[
		-- This file have been automatically created combining the output file
		-- of eiffel-gcc-xml @(1)
		-- with the differences patches found into @(2)

		-- Any change will be lost by the next execution of the tool.

		]"

feature {} -- Logging
	logger: STRING_PRINTER is
		-- The formatter used to log messages
	once
		create Result.make(std_error)
	ensure Result/=Void
	end

	log_string (a_string: STRING) is
		-- If verbose print `a_string' to logger's output
	require a_string/=Void
	do
		if verbose then
			std_error.put_string(a_string)
		end
	end

	log_word (a_word: STRING) is
		-- If verboe print 'a_word' and a whitespace to logger's output 
	require a_word/=Void
	do
		if verbose then
			std_error.put_string(a_word)
			std_error.put_character(' ')
		end
	end

	log (a_message: TRAVERSABLE[CHARACTER]; some_arguments: TRAVERSABLE[ANY]) is
			-- Utility feature to replace "if verbose then logger.put_message(foo,bar) end" with "log(foo,bar)"
		require
			a_message /= Void
			some_arguments /= Void
		do
			if verbose then
				logger.put_message(a_message, some_arguments)
			end
		end

	log2 (a_tuple: TUPLE[STRING,STRING]) is
		-- If verbose log the strings contained in `a_tuple' to std_error.
	require a_tuple/=Void
	do
		if verbose then
			std_error.put_string(a_tuple.item_1)
			std_error.put_string(a_tuple.item_2)
		end
	end

	log3 (a_tuple: TUPLE[STRING,STRING,STRING]) is
		-- If verbose log the strings contained in `a_tuple' to std_error.
	require a_tuple/=Void
	do
		if verbose then
			std_error.put_string(a_tuple.item_1)
			std_error.put_string(a_tuple.item_2)
			std_error.put_string(a_tuple.item_3)
		end
	end


	log4 (a_tuple: TUPLE[STRING,STRING,STRING,STRING]) is
		-- If verbose log the strings contained in `a_tuple' to std_error.
	require a_tuple/=Void
	do
		if verbose then
			std_error.put_string(a_tuple.item_1)
			std_error.put_string(a_tuple.item_2)
			std_error.put_string(a_tuple.item_3)
			std_error.put_string(a_tuple.item_4)
		end
	end

	log5 (a_tuple: TUPLE[STRING,STRING,STRING,STRING,STRING]) is
		-- If verbose log the strings contained in `a_tuple' to std_error.
	require a_tuple/=Void
	do
		if verbose then
			std_error.put_string(a_tuple.item_1)
			std_error.put_string(a_tuple.item_2)
			std_error.put_string(a_tuple.item_3)
			std_error.put_string(a_tuple.item_4)
			std_error.put_string(a_tuple.item_5)
		end
	end

	log6 (a_tuple: TUPLE[STRING,STRING,STRING,STRING,STRING,STRING]) is
		-- If verbose log the strings contained in `a_tuple' to std_error.
	require a_tuple/=Void
	do
		if verbose then
			std_error.put_string(a_tuple.item_1)
			std_error.put_string(a_tuple.item_2)
			std_error.put_string(a_tuple.item_3)
			std_error.put_string(a_tuple.item_4)
			std_error.put_string(a_tuple.item_5)
			std_error.put_string(a_tuple.item_6)
		end
	end

	log_tuple (a_tuple: TUPLE) is
		-- Log the strings contained in `a_tuple' to std_error up to 5 fields.
	obsolete "Use log2, log3 ... instead"
	require a_tuple/=Void
	local
		t1: TUPLE[STRING]
		t2: TUPLE[STRING,STRING]
		t3: TUPLE[STRING,STRING,STRING]
		t4: TUPLE[STRING,STRING,STRING,STRING]
		t5: TUPLE[STRING,STRING,STRING,STRING,STRING]
	do
		inspect a_tuple.count
		when 1 then
			t1::=a_tuple
			std_error.put_string(t1.item_1)
		when 2 then
			t2::=a_tuple
			std_error.put_string(t2.item_1) std_error.put_string(t2.item_2)
		when 3 then
			t3::=a_tuple
			std_error.put_string(t3.item_1) std_error.put_string(t3.item_2) std_error.put_string(t3.item_3)
		when 4 then
			t4::=a_tuple
			std_error.put_string(t4.item_1) std_error.put_string(t4.item_2) std_error.put_string(t4.item_3) std_error.put_string(t4.item_4)
		when 5 then
			t5::=a_tuple
			std_error.put_string(t5.item_1) std_error.put_string(t5.item_2) std_error.put_string(t5.item_3) std_error.put_string(t5.item_4) std_error.put_string(t5.item_5)
		else std_error.put_string(once "log unsupported tuple") -- nothing
		end
	end
end -- class SHARED_SETTINGS

-- Copyright 2008,2009 Paolo Redaelli

-- eiffel-gcc-xml  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- eiffel-gcc-xml is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.
