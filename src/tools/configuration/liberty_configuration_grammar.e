class LIBERTY_CONFIGURATION_GRAMMAR
--
-- ASSET: ASSembly of Eiffel Types
--
-- An asset describes a system (similar to good ol' ACE files)
--

insert
	EIFFEL_GRAMMAR
		redefine
			the_table
		end

feature {}
	the_table: PARSE_TABLE is
		once
			Result := {PARSE_TABLE <<
											 "Asset", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW asset", "KW entity name", "Default", "Root", "Needs", "KW end", "KW end of file" >> }, agent build_root >> };
											 "Cluster", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW cluster", "KW entity name", "Version", "Includes", "Needs", "Concurrency", "KW end", "KW end of file" >> }, agent build_root >> };
											 "Configuration", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW configuration", "KW entity name", "Overrides", "Clusters", "KW end", "KW end of file" >> }, agent build_root >> };

											 "Root", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW root", "KW class name", "Root_Procedure" >> }, Void >> };
											 "Root_Procedure", {PARSE_NON_TERMINAL << epsilon, Void;
																									{FAST_ARRAY[STRING] << "KW .", "KW entity name" >> }, Void >> };
											 "Default", {PARSE_NON_TERMINAL << epsilon, Void;
																						  {FAST_ARRAY[STRING] << "KW default", "Assertion", "Debug" >> }, Void >> };
											 "Assertion", {PARSE_NON_TERMINAL << epsilon, Void;
																							 {FAST_ARRAY[STRING] << "KW assertion", "Assertion_Level" >> }, Void >> };
											 "Assertion_Level", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW none" >> }, Void;
																									 {FAST_ARRAY[STRING] << "KW require" >> }, Void;
																									 {FAST_ARRAY[STRING] << "KW ensure" >> }, Void;
																									 {FAST_ARRAY[STRING] << "KW loop" >> }, Void;
																									 {FAST_ARRAY[STRING] << "KW check" >> }, Void;
																									 {FAST_ARRAY[STRING] << "KW all" >> }, Void >> };
											 "Needs", {PARSE_NON_TERMINAL << epsilon, Void;
																						{FAST_ARRAY[STRING] << "KW needs", "Cluster_Configuration*" >>}, Void >> };
											 "Cluster_Configuration*", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Cluster_Configuration*");
																										  {FAST_ARRAY[STRING] << "Cluster_Configuration", "Cluster_Configuration*" >> }, agent build_continue_list("Cluster_Configuration", 0, "Cluster_Configuration*");
																										  {FAST_ARRAY[STRING] << "Cluster_Configuration", "KW ;", "Cluster_Configuration*" >> }, agent build_continue_list("Cluster_Configuration", 1, "Cluster_Configuration*") >> };
											 "Cluster_Configuration", { PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW cluster name", "Cluster_Constraints", "Cluster_Details" >> }, Void >> };
											 "Cluster_Constraints", {PARSE_NON_TERMINAL << epsilon, Void;
																										  {FAST_ARRAY[STRING] << "KW (", "Cluster_Version_Constraint", "KW )" >> }, Void >> };
											 "Cluster_Version_Constraint", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW version", "Version_Operator", "KW string" >> }, Void >> };
											 "Version_Operator", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW =" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW <=" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW >=" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW /=" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW <" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW >" >> }, Void >> };
											 "Cluster_Details", {PARSE_NON_TERMINAL << epsilon, Void;
																									 {FAST_ARRAY[STRING] << "Concurrency", "Assertion", "Debug", "KW end" >> }, Void >> };
											 "Debug", {PARSE_NON_TERMINAL << epsilon, Void;
																						{FAST_ARRAY[STRING] << "KW debug", "Debug_Configuration+" >> }, Void >> };
											 "Debug_Configuration+", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Debug_Configuration" >> }, agent build_new_list("Debug_Configuration", "Debug_Configuration+");
																											{FAST_ARRAY[STRING] << "Debug_Configuration", "Debug_Configuration+" >> }, agent build_continue_list("Debug_Configuration", 0, "Debug_Configuration+");
																											{FAST_ARRAY[STRING] << "Debug_Configuration", "KW ;", "Debug_Configuration+" >> }, agent build_continue_list("Debug_Configuration", 1, "Debug_Configuration+") >> };
											 "Debug_Configuration", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW default", "KW :", "Debug_Key+" >> }, Void;
																										  {FAST_ARRAY[STRING] << "KW class name", "KW :", "Debug_Key+" >> }, Void >> };
											 "Debug_Key+", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Debug_Key" >> }, agent build_new_list("Debug_Key", "Debug_Key+");
																							  {FAST_ARRAY[STRING] << "Debug_Key", "KW ,", "Debug_Key+" >> }, agent build_continue_list("Debug_Key", 1, "Debug_Key+") >> };

											 "KW asset", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "asset"), Void);
											 "KW root", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "root"), Void);
											 "KW default", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "default"), Void);
											 "KW assertion", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "assertion"), Void);
											 "KW none", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "none"), Void);
											 "KW require", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "require"), Void);
											 "KW ensure", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "ensure"), Void);
											 "KW loop", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "loop"), Void);
											 "KW check", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "check"), Void);
											 "KW all", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "all"), Void);
											 "KW needs", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "needs"), Void);
											 "KW version", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "version"), Void);
											 "KW <", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "<"), Void);
											 "KW >", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ">"), Void);
											 "KW <=", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "<="), Void);
											 "KW >=", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ">="), Void);
											 "KW =", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "="), Void);
											 "KW /=", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "/="), Void);
											 "KW concurrency", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "concurrence"), Void);
											 "KW debug", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "debug"), Void);
											 "KW :", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ":"), Void);
											 "KW .", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "."), Void);
											 "KW ;", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ";"), Void);
											 "KW ,", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ","), Void);
											 "KW (", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "("), Void);
											 "KW )", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ")"), Void);
											 "KW end", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "end"), Void);
											 "KW thread", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "thread"), Void);
											 "KW process", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "process"), Void);
											 "KW server", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "server"), Void);
											 "KW client", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "client"), Void);
											 "KW is", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "is"), Void);
											 "KW daemon", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "daemon"), Void);
											 "KW True", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "True"), Void);
											 "KW False", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "False"), Void);
											 "KW creation", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "creation"), Void);
											 "KW as needed", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "as needed"), Void);
											 "KW pool of", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "pool of"), Void);
											 "KW shared", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "shared"), Void);
											 "KW listen", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "listen"), Void);
											 "KW connect", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "connect"), Void);
											 "KW mmap", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "mmap"), Void);
											 "KW message", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "message"), Void);
											 "KW cluster", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "cluster"), Void);
											 "KW includes", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "includes"), Void);
											 "KW not", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "not"), Void);
											 "KW configuration", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "configuration"), Void);
											 "KW overrides", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "overrides"), Void);
											 "KW clusters", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "clusters"), Void);
											 "KW string", create {PARSE_TERMINAL}.make(agent parse_string, Void);
											 "KW cluster name", create {PARSE_TERMINAL}.make(agent parse_class_or_cluster_name, Void);
											 "KW class name", create {PARSE_TERMINAL}.make(agent parse_class_or_cluster_name, Void);
											 "KW entity name", create {PARSE_TERMINAL}.make(agent parse_entity_name, Void);
											 "KW end of file", create {PARSE_TERMINAL}.make(agent parse_end, Void)
											 >> };
		end

end