-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class THREADS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_cleanup_threads is
 		-- xmlCleanupThreads
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCleanupThreads()"
		}"
		end

	xml_free_mutex (a_tok: POINTER) is
 		-- xmlFreeMutex
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeMutex"
		}"
		end

	xml_free_rmutex (a_tok: POINTER) is
 		-- xmlFreeRMutex
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeRMutex"
		}"
		end

	xml_get_global_state: POINTER is
 		-- xmlGetGlobalState
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetGlobalState()"
		}"
		end

	xml_get_thread_id: INTEGER is
 		-- xmlGetThreadId
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetThreadId()"
		}"
		end

	xml_init_threads is
 		-- xmlInitThreads
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlInitThreads()"
		}"
		end

	xml_is_main_thread: INTEGER is
 		-- xmlIsMainThread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIsMainThread()"
		}"
		end

	xml_lock_library is
 		-- xmlLockLibrary
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlLockLibrary()"
		}"
		end

	xml_mutex_lock (a_tok: POINTER) is
 		-- xmlMutexLock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMutexLock"
		}"
		end

	xml_mutex_unlock (a_tok: POINTER) is
 		-- xmlMutexUnlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMutexUnlock"
		}"
		end

	xml_new_mutex: POINTER is
 		-- xmlNewMutex
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewMutex()"
		}"
		end

	xml_new_rmutex: POINTER is
 		-- xmlNewRMutex
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewRMutex()"
		}"
		end

	xml_rmutex_lock (a_tok: POINTER) is
 		-- xmlRMutexLock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRMutexLock"
		}"
		end

	xml_rmutex_unlock (a_tok: POINTER) is
 		-- xmlRMutexUnlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRMutexUnlock"
		}"
		end

	xml_unlock_library is
 		-- xmlUnlockLibrary
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlUnlockLibrary()"
		}"
		end


end -- class THREADS_EXTERNALS
