-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SORT_VECTOR_ULONG_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_sort_vector_ulong (a_v: POINTER) is
 		-- gsl_sort_vector_ulong
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_vector_ulong"
		}"
		end

	gsl_sort_vector_ulong_index (a_p: POINTER; a_v: POINTER): INTEGER_32 is
 		-- gsl_sort_vector_ulong_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_vector_ulong_index"
		}"
		end

	gsl_sort_vector_ulong_largest (a_dest: POINTER; a_k: NATURAL_32; a_v: POINTER): INTEGER_32 is
 		-- gsl_sort_vector_ulong_largest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_vector_ulong_largest"
		}"
		end

	gsl_sort_vector_ulong_largest_index (a_p: POINTER; a_k: NATURAL_32; a_v: POINTER): INTEGER_32 is
 		-- gsl_sort_vector_ulong_largest_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_vector_ulong_largest_index"
		}"
		end

	gsl_sort_vector_ulong_smallest (a_dest: POINTER; a_k: NATURAL_32; a_v: POINTER): INTEGER_32 is
 		-- gsl_sort_vector_ulong_smallest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_vector_ulong_smallest"
		}"
		end

	gsl_sort_vector_ulong_smallest_index (a_p: POINTER; a_k: NATURAL_32; a_v: POINTER): INTEGER_32 is
 		-- gsl_sort_vector_ulong_smallest_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_vector_ulong_smallest_index"
		}"
		end


end -- class GSL_SORT_VECTOR_ULONG_EXTERNALS
