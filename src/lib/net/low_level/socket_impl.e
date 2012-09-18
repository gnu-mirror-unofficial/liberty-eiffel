-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class SOCKET_IMPL

inherit
   SOCKET

insert
   STRING_HANDLER
   SOCKET_HANDLER
   SOCKET_PLUG_IN
   RECYCLABLE
   DISPOSABLE

feature {SOCKET_HANDLER}
   is_connected: BOOLEAN
   error: STRING

   read is
      do
         if delay_read and then is_connected then
            delayed_read
         end
         delay_read := True
      end

   last_read: STRING is
      do
         if delay_read and then is_connected then
            delayed_read
         end
         Result := last_delayed_read
      end

   write (data: STRING) is
      local
         dummy: INTEGER
      do
         dummy := net_write(fd, data.count, data.storage)
         error := last_error
         if error /= Void then
            disconnect
         end
      end

   disconnect is
      do
         net_shutdown(fd)
         net_disconnect(fd)
         is_connected := False
         fire_disconnected
      end

   clear is
      do
         if disconnected_listeners /= Void then
            disconnected_listeners.clear_count
         end
      end

   fd: INTEGER

feature {}
   connect (a_fd: like fd) is
      do
         if a_fd >= 0 then
            is_connected := True
            fd := a_fd
         else
            error := last_error
         end
         delay_read := False
      end

   sync: BOOLEAN
   buffer_size: like default_buffer_size
   delay_read: BOOLEAN

   set_sync (a_sync: like sync) is
      do
         sync := a_sync
         if a_sync then
            buffer_size := 1
         else
            buffer_size := default_buffer_size
         end
      ensure
         sync = a_sync
      end

   delayed_read is
      require
         is_connected
         delay_read
      local
         count: INTEGER
      do
         last_delayed_read.resize(buffer_size)
         count := net_read(fd, buffer_size, last_delayed_read.storage.to_external, sync)
         if count < 0 then
            count := 0
         end
         last_delayed_read.resize(count)
         error := last_error
         if error /= Void then
            disconnect
         end
         delay_read := False
      ensure
         not delay_read
      end

   last_delayed_read: STRING

invariant
   sync implies buffer_size = 1
   last_delayed_read /= Void

end -- class SOCKET_IMPL
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIsLITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.