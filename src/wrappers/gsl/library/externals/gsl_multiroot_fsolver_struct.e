-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MULTIROOT_FSOLVER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_multiroot_fsolver_struct_set_type (a_structure: POINTER; a_value: POINTER) is
			-- Setter for type field of GSL_MULTIROOT_FSOLVER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_struct_set_type"
		}"
		end

	gsl_multiroot_fsolver_struct_set_function (a_structure: POINTER; a_value: POINTER) is
			-- Setter for function field of GSL_MULTIROOT_FSOLVER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_struct_set_function"
		}"
		end

	gsl_multiroot_fsolver_struct_set_x (a_structure: POINTER; a_value: POINTER) is
			-- Setter for x field of GSL_MULTIROOT_FSOLVER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_struct_set_x"
		}"
		end

	gsl_multiroot_fsolver_struct_set_f (a_structure: POINTER; a_value: POINTER) is
			-- Setter for f field of GSL_MULTIROOT_FSOLVER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_struct_set_f"
		}"
		end

	gsl_multiroot_fsolver_struct_set_dx (a_structure: POINTER; a_value: POINTER) is
			-- Setter for dx field of GSL_MULTIROOT_FSOLVER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_struct_set_dx"
		}"
		end

	gsl_multiroot_fsolver_struct_set_state (a_structure: POINTER; a_value: POINTER) is
			-- Setter for state field of GSL_MULTIROOT_FSOLVER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_struct_set_state"
		}"
		end

feature {} -- Low-level queries

	gsl_multiroot_fsolver_struct_get_type (a_structure: POINTER): POINTER is
			-- Query for type field of GSL_MULTIROOT_FSOLVER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_struct_get_type"
		}"
		end

	gsl_multiroot_fsolver_struct_get_function (a_structure: POINTER): POINTER is
			-- Query for function field of GSL_MULTIROOT_FSOLVER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_struct_get_function"
		}"
		end

	gsl_multiroot_fsolver_struct_get_x (a_structure: POINTER): POINTER is
			-- Query for x field of GSL_MULTIROOT_FSOLVER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_struct_get_x"
		}"
		end

	gsl_multiroot_fsolver_struct_get_f (a_structure: POINTER): POINTER is
			-- Query for f field of GSL_MULTIROOT_FSOLVER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_struct_get_f"
		}"
		end

	gsl_multiroot_fsolver_struct_get_dx (a_structure: POINTER): POINTER is
			-- Query for dx field of GSL_MULTIROOT_FSOLVER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_struct_get_dx"
		}"
		end

	gsl_multiroot_fsolver_struct_get_state (a_structure: POINTER): POINTER is
			-- Query for state field of GSL_MULTIROOT_FSOLVER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiroot_fsolver_struct_get_state"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_multiroot_fsolver"
		}"
		end

end -- class GSL_MULTIROOT_FSOLVER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

