-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class TCPHDR_STRUCT
-- Wrapper of struct tcphdr defined in file /usr/include/netinet/tcp.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Anonymous field at line 76.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_tcphdr"
               }"
               end

end -- class TCPHDR_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
