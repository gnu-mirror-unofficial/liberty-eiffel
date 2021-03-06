-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class RUNNER_TYPED_BUILTINS[E_]
   --
   -- a collection of builtins tools
   --

inherit
   RUNNER_UNTYPED_BUILTINS

feature {}
   left (processor: RUNNER_PROCESSOR): RUNNER_NATIVE_EXPANDED[E_]
      do
         Result ::= processor.current_frame.target
      end

   right (processor: RUNNER_PROCESSOR): RUNNER_NATIVE_EXPANDED[E_]
      do
         Result ::= processor.current_frame.arguments.first
      end

   set_return (processor: RUNNER_PROCESSOR; value: E_)
      local
         the_factory: RUNNER_EXPANDED_FACTORY[E_]
      do
         processor.current_frame.set_return(the_factory.new(processor, value, processor.current_frame.type_of_result))
      end

end -- class RUNNER_TYPED_BUILTINS
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
