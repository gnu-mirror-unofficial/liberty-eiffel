-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_VECTOR_UCHAR_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_vector_uchar_add (an_a: POINTER; a_b: POINTER): INTEGER_32 is
 		-- gsl_vector_uchar_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_add"
		}"
		end

	gsl_vector_uchar_add_constant (an_a: POINTER; a_x: REAL_64): INTEGER_32 is
 		-- gsl_vector_uchar_add_constant
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_add_constant"
		}"
		end

	gsl_vector_uchar_alloc (a_n: NATURAL_32): POINTER is
 		-- gsl_vector_uchar_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_alloc"
		}"
		end

	gsl_vector_uchar_alloc_from_block (a_b: POINTER; an_offset: NATURAL_32; a_n: NATURAL_32; a_stride: NATURAL_32): POINTER is
 		-- gsl_vector_uchar_alloc_from_block
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_alloc_from_block"
		}"
		end

	gsl_vector_uchar_alloc_from_vector (a_v: POINTER; an_offset: NATURAL_32; a_n: NATURAL_32; a_stride: NATURAL_32): POINTER is
 		-- gsl_vector_uchar_alloc_from_vector
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_alloc_from_vector"
		}"
		end

	gsl_vector_uchar_calloc (a_n: NATURAL_32): POINTER is
 		-- gsl_vector_uchar_calloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_calloc"
		}"
		end

	gsl_vector_uchar_const_ptr (a_v: POINTER; an_i: NATURAL_32): POINTER is
 		-- gsl_vector_uchar_const_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_const_ptr"
		}"
		end

	-- function gsl_vector_uchar_const_subvector (at line 116 in file /usr/include/gsl/gsl_vector_uchar.h is not wrappable
	-- function gsl_vector_uchar_const_subvector_with_stride (at line 122 in file /usr/include/gsl/gsl_vector_uchar.h is not wrappable
	-- function gsl_vector_uchar_const_view_array (at line 95 in file /usr/include/gsl/gsl_vector_uchar.h is not wrappable
	-- function gsl_vector_uchar_const_view_array_with_stride (at line 100 in file /usr/include/gsl/gsl_vector_uchar.h is not wrappable
	gsl_vector_uchar_div (an_a: POINTER; a_b: POINTER): INTEGER_32 is
 		-- gsl_vector_uchar_div
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_div"
		}"
		end

	gsl_vector_uchar_equal (an_u: POINTER; a_v: POINTER): INTEGER_32 is
 		-- gsl_vector_uchar_equal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_equal"
		}"
		end

	gsl_vector_uchar_fprintf (a_stream: POINTER; a_v: POINTER; a_format: POINTER): INTEGER_32 is
 		-- gsl_vector_uchar_fprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_fprintf"
		}"
		end

	gsl_vector_uchar_fread (a_stream: POINTER; a_v: POINTER): INTEGER_32 is
 		-- gsl_vector_uchar_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_fread"
		}"
		end

	gsl_vector_uchar_free (a_v: POINTER) is
 		-- gsl_vector_uchar_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_free"
		}"
		end

	gsl_vector_uchar_fscanf (a_stream: POINTER; a_v: POINTER): INTEGER_32 is
 		-- gsl_vector_uchar_fscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_fscanf"
		}"
		end

	gsl_vector_uchar_fwrite (a_stream: POINTER; a_v: POINTER): INTEGER_32 is
 		-- gsl_vector_uchar_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_fwrite"
		}"
		end

	gsl_vector_uchar_get (a_v: POINTER; an_i: NATURAL_32): CHARACTER is
 		-- gsl_vector_uchar_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_get"
		}"
		end

	gsl_vector_uchar_isneg (a_v: POINTER): INTEGER_32 is
 		-- gsl_vector_uchar_isneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_isneg"
		}"
		end

	gsl_vector_uchar_isnonneg (a_v: POINTER): INTEGER_32 is
 		-- gsl_vector_uchar_isnonneg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_isnonneg"
		}"
		end

	gsl_vector_uchar_isnull (a_v: POINTER): INTEGER_32 is
 		-- gsl_vector_uchar_isnull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_isnull"
		}"
		end

	gsl_vector_uchar_ispos (a_v: POINTER): INTEGER_32 is
 		-- gsl_vector_uchar_ispos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_ispos"
		}"
		end

	gsl_vector_uchar_max (a_v: POINTER): CHARACTER is
 		-- gsl_vector_uchar_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_max"
		}"
		end

	gsl_vector_uchar_max_index (a_v: POINTER): NATURAL_32 is
 		-- gsl_vector_uchar_max_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_max_index"
		}"
		end

	gsl_vector_uchar_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER_32 is
 		-- gsl_vector_uchar_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_memcpy"
		}"
		end

	gsl_vector_uchar_min (a_v: POINTER): CHARACTER is
 		-- gsl_vector_uchar_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_min"
		}"
		end

	gsl_vector_uchar_min_index (a_v: POINTER): NATURAL_32 is
 		-- gsl_vector_uchar_min_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_min_index"
		}"
		end

	gsl_vector_uchar_minmax (a_v: POINTER; a_min_out: POINTER; a_max_out: POINTER) is
 		-- gsl_vector_uchar_minmax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_minmax"
		}"
		end

	gsl_vector_uchar_minmax_index (a_v: POINTER; an_imin: POINTER; an_imax: POINTER) is
 		-- gsl_vector_uchar_minmax_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_minmax_index"
		}"
		end

	gsl_vector_uchar_mul (an_a: POINTER; a_b: POINTER): INTEGER_32 is
 		-- gsl_vector_uchar_mul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_mul"
		}"
		end

	gsl_vector_uchar_ptr (a_v: POINTER; an_i: NATURAL_32): POINTER is
 		-- gsl_vector_uchar_ptr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_ptr"
		}"
		end

	gsl_vector_uchar_reverse (a_v: POINTER): INTEGER_32 is
 		-- gsl_vector_uchar_reverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_reverse"
		}"
		end

	gsl_vector_uchar_scale (an_a: POINTER; a_x: REAL_64): INTEGER_32 is
 		-- gsl_vector_uchar_scale
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_scale"
		}"
		end

	gsl_vector_uchar_set (a_v: POINTER; an_i: NATURAL_32; a_x: CHARACTER) is
 		-- gsl_vector_uchar_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_set"
		}"
		end

	gsl_vector_uchar_set_all (a_v: POINTER; a_x: CHARACTER) is
 		-- gsl_vector_uchar_set_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_set_all"
		}"
		end

	gsl_vector_uchar_set_basis (a_v: POINTER; an_i: NATURAL_32): INTEGER_32 is
 		-- gsl_vector_uchar_set_basis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_set_basis"
		}"
		end

	gsl_vector_uchar_set_zero (a_v: POINTER) is
 		-- gsl_vector_uchar_set_zero
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_set_zero"
		}"
		end

	gsl_vector_uchar_sub (an_a: POINTER; a_b: POINTER): INTEGER_32 is
 		-- gsl_vector_uchar_sub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_sub"
		}"
		end

	-- function gsl_vector_uchar_subvector (at line 105 in file /usr/include/gsl/gsl_vector_uchar.h is not wrappable
	-- function gsl_vector_uchar_subvector_with_stride (at line 111 in file /usr/include/gsl/gsl_vector_uchar.h is not wrappable
	gsl_vector_uchar_swap (a_v: POINTER; a_w: POINTER): INTEGER_32 is
 		-- gsl_vector_uchar_swap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_swap"
		}"
		end

	gsl_vector_uchar_swap_elements (a_v: POINTER; an_i: NATURAL_32; a_j: NATURAL_32): INTEGER_32 is
 		-- gsl_vector_uchar_swap_elements
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_uchar_swap_elements"
		}"
		end

	-- function gsl_vector_uchar_view_array (at line 87 in file /usr/include/gsl/gsl_vector_uchar.h is not wrappable
	-- function gsl_vector_uchar_view_array_with_stride (at line 92 in file /usr/include/gsl/gsl_vector_uchar.h is not wrappable

end -- class GSL_VECTOR_UCHAR_EXTERNALS
