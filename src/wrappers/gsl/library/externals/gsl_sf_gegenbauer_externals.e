-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_GEGENBAUER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_sf_gegenpoly_1 (a_lambda: REAL_64; a_x: REAL_64): REAL_64 is
 		-- gsl_sf_gegenpoly_1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gegenpoly_1"
		}"
		end

	gsl_sf_gegenpoly_1_e (a_lambda: REAL_64; a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_gegenpoly_1_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gegenpoly_1_e"
		}"
		end

	gsl_sf_gegenpoly_2 (a_lambda: REAL_64; a_x: REAL_64): REAL_64 is
 		-- gsl_sf_gegenpoly_2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gegenpoly_2"
		}"
		end

	gsl_sf_gegenpoly_2_e (a_lambda: REAL_64; a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_gegenpoly_2_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gegenpoly_2_e"
		}"
		end

	gsl_sf_gegenpoly_3 (a_lambda: REAL_64; a_x: REAL_64): REAL_64 is
 		-- gsl_sf_gegenpoly_3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gegenpoly_3"
		}"
		end

	gsl_sf_gegenpoly_3_e (a_lambda: REAL_64; a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_gegenpoly_3_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gegenpoly_3_e"
		}"
		end

	gsl_sf_gegenpoly_array (a_nmax: INTEGER_32; a_lambda: REAL_64; a_x: REAL_64; a_result_array: POINTER): INTEGER_32 is
 		-- gsl_sf_gegenpoly_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gegenpoly_array"
		}"
		end

	gsl_sf_gegenpoly_n (a_n: INTEGER_32; a_lambda: REAL_64; a_x: REAL_64): REAL_64 is
 		-- gsl_sf_gegenpoly_n
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gegenpoly_n"
		}"
		end

	gsl_sf_gegenpoly_n_e (a_n: INTEGER_32; a_lambda: REAL_64; a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_gegenpoly_n_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gegenpoly_n_e"
		}"
		end


end -- class GSL_SF_GEGENBAUER_EXTERNALS
