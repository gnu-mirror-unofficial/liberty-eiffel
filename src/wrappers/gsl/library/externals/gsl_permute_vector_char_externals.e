-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_PERMUTE_VECTOR_CHAR_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_permute_vector_char (a_p: POINTER; a_v: POINTER): INTEGER_32 is
 		-- gsl_permute_vector_char
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permute_vector_char"
		}"
		end

	gsl_permute_vector_char_inverse (a_p: POINTER; a_v: POINTER): INTEGER_32 is
 		-- gsl_permute_vector_char_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permute_vector_char_inverse"
		}"
		end


end -- class GSL_PERMUTE_VECTOR_CHAR_EXTERNALS
