indexing
	description: "The AVStream structure"
	copyright: "[
					Copyright (C) 2006 Soluciones Informaticas Libres S.A. (Except)
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class AV_STREAM

inherit
	SHARED_C_STRUCT
		redefine
			from_external_pointer
		end

insert
	AV_STREAM_EXTERNALS

creation
	make, from_external_pointer

feature {WRAPPER, WRAPPER_HANDLER} -- Creation

	from_external_pointer (a_ptr: POINTER) is
		do
			is_shared := True
			Precursor (a_ptr)
		end

feature -- Access

	index: INTEGER is
		do
			Result := av_stream_get_index (handle)
		end

	id: INTEGER is
		do
			Result := av_stream_get_id (handle)
		end

	codec: AV_CODEC_CONTEXT is
		do
			if wrapped_codec = Void then
				create wrapped_codec.from_external_pointer (av_stream_get_codec (handle))
			end
			Result := wrapped_codec
		end

	quality: REAL is
		do
			Result := av_stream_get_quality (handle)
		end

	start_time: INTEGER_64 is
		do
			Result := av_stream_get_start_time (handle)
		end

	duration: INTEGER_64 is
		do
			Result := av_stream_get_duration (handle)
		end

	language: STRING is
		do
			create Result.from_external_copy (av_stream_get_language (handle))
		end

feature -- Size

	struct_size: INTEGER is
		external "C inline use <avformat.h>"
		alias "sizeof(AVStream)"
		end

feature {} -- Representation

	wrapped_codec: AV_CODEC_CONTEXT

end -- class AV_STREAM
