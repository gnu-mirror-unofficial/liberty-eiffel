-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CST_ATT_UNIQUE
        --
        -- For "unique" constant attribute.
        --

inherit
        CST_ATT

creation {ANY}
        make

creation {CST_ATT_UNIQUE}
        with

feature {ANY}
        accept (visitor: CST_ATT_UNIQUE_VISITOR) is
                do
                        visitor.visit_cst_att_unique(Current)
                end

feature {}
        rank: INTEGER
                        -- To find the the corresponding name in the `feature_text' (i.e.
                        -- in most cases, this is simply one, because people are not
                        -- used to have a lot of synonyms).

        value_memory: INTEGER_CONSTANT

        add_into_ (ft: like feature_text; fd: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME]) is
                local
                        n: like names; fn: FEATURE_NAME; i, max: INTEGER; ic: INTEGER_CONSTANT; sp: POSITION
                do
                        n := ft.names -- The `value' of the first one:
                        rank := 1
                        counter.next
                        fn := names.item(rank)
                        sp := fn.start_position
                        create value_memory.with(counter.item, sp, create {INTEGER_TYPE_MARK}.integer_32(sp))
                        fd.add(Current, fn)
                        -- For other names:
                        from
                                i := 2
                                max := n.count
                        until
                                i > max
                        loop
                                counter.next
                                fn := names.item(i)
                                sp := fn.start_position
                                create ic.with(counter.item, sp, create {INTEGER_TYPE_MARK}.integer_32(sp))
                                fd.add(create {like Current}.with(ft, rank, result_type, ic), fn)
                                i := i + 1
                        end
                end

        with (ft: like feature_text; r: like rank; rt: like result_type; ic: INTEGER_CONSTANT) is
                require
                        ft /= Void
                        r >= 1
                        ic /= Void
                do
                        feature_text := ft
                        result_type := rt
                        rank := r
                        value_memory := ic
                ensure
                        feature_text = ft
                        rank = r
                        value = ic
                end

        make (rt: like result_type) is
                require
                        rt.is_integer
                do
                        result_type := rt
                ensure
                        result_type = rt
                end

        pretty_constant_value (indent_level: INTEGER) is
                do
                        pretty_printer.put_string(once "unique")
                end

        counter: COUNTER is
                once
                        create Result
                end

end -- class CST_ATT_UNIQUE
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------