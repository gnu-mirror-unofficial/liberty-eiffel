-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_LAGUERRE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_sf_laguerre_1 (an_a: REAL_64; a_x: REAL_64): REAL_64 is
 		-- gsl_sf_laguerre_1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_laguerre_1"
		}"
		end

	gsl_sf_laguerre_1_e (an_a: REAL_64; a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_laguerre_1_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_laguerre_1_e"
		}"
		end

	gsl_sf_laguerre_2 (an_a: REAL_64; a_x: REAL_64): REAL_64 is
 		-- gsl_sf_laguerre_2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_laguerre_2"
		}"
		end

	gsl_sf_laguerre_2_e (an_a: REAL_64; a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_laguerre_2_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_laguerre_2_e"
		}"
		end

	gsl_sf_laguerre_3 (an_a: REAL_64; a_x: REAL_64): REAL_64 is
 		-- gsl_sf_laguerre_3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_laguerre_3"
		}"
		end

	gsl_sf_laguerre_3_e (an_a: REAL_64; a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_laguerre_3_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_laguerre_3_e"
		}"
		end

	gsl_sf_laguerre_n (a_n: INTEGER_32; an_a: REAL_64; a_x: REAL_64): REAL_64 is
 		-- gsl_sf_laguerre_n
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_laguerre_n"
		}"
		end

	gsl_sf_laguerre_n_e (a_n: INTEGER_32; an_a: REAL_64; a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_laguerre_n_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_laguerre_n_e"
		}"
		end


end -- class GSL_SF_LAGUERRE_EXTERNALS
