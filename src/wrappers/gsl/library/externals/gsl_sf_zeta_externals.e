-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_ZETA_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_sf_eta (a_s: REAL_64): REAL_64 is
 		-- gsl_sf_eta
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_eta"
		}"
		end

	gsl_sf_eta_e (a_s: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_eta_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_eta_e"
		}"
		end

	gsl_sf_eta_int (a_n: INTEGER_32): REAL_64 is
 		-- gsl_sf_eta_int
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_eta_int"
		}"
		end

	gsl_sf_eta_int_e (a_n: INTEGER_32; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_eta_int_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_eta_int_e"
		}"
		end

	gsl_sf_hzeta (a_s: REAL_64; a_q: REAL_64): REAL_64 is
 		-- gsl_sf_hzeta
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_hzeta"
		}"
		end

	gsl_sf_hzeta_e (a_s: REAL_64; a_q: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_hzeta_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_hzeta_e"
		}"
		end

	gsl_sf_zeta (a_s: REAL_64): REAL_64 is
 		-- gsl_sf_zeta
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_zeta"
		}"
		end

	gsl_sf_zeta_e (a_s: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_zeta_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_zeta_e"
		}"
		end

	gsl_sf_zeta_int (a_n: INTEGER_32): REAL_64 is
 		-- gsl_sf_zeta_int
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_zeta_int"
		}"
		end

	gsl_sf_zeta_int_e (a_n: INTEGER_32; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_zeta_int_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_zeta_int_e"
		}"
		end

	gsl_sf_zetam1 (a_s: REAL_64): REAL_64 is
 		-- gsl_sf_zetam1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_zetam1"
		}"
		end

	gsl_sf_zetam1_e (a_s: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_zetam1_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_zetam1_e"
		}"
		end

	gsl_sf_zetam1_int (a_s: INTEGER_32): REAL_64 is
 		-- gsl_sf_zetam1_int
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_zetam1_int"
		}"
		end

	gsl_sf_zetam1_int_e (a_s: INTEGER_32; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_zetam1_int_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_zetam1_int_e"
		}"
		end


end -- class GSL_SF_ZETA_EXTERNALS
