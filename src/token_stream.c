#include "token_stream.h"
#include <ctype.h>
#include <stdlib.h>

void token_stream_state_init(Token_Stream_State *state, const char *file_path)
{
	fopen_s(&state->file, file_path, "r");
	state->line_number = 1;
	state->C = fgetc(state->file);
}

void token_stream_init(Token_Stream *stream, const char *file_path)
{
	token_stream_state_init(&stream->file_state, file_path);
	stream->file_state.backtrace = NULL;
}

void token_stream_strip_whitespace(Token_Stream *stream)
{
	while (isspace(stream->file_state.C))
	{
		if (stream->file_state.C == '\n')
		{
			stream->file_state.line_number++;
		}
		stream->file_state.C = fgetc(stream->file_state.file);
	}
}

void token_stream_next(Token_Stream *stream)
{
repeat:
	token_stream_strip_whitespace(stream);

	if (stream->file_state.C == EOF)
	{
		if (stream->file_state.backtrace == NULL)
		{
			// printf("End of file (%s) ('%i')\n", stream->buffer, stream->file_state.C);
			stream->buffer[0] = '\0';
		}
		else
		{
			// printf("End of nested file (%s) ('%i') ('%p')\n", stream->buffer, stream->file_state.C,
			// stream->file_state.backtrace);
			token_stream_pop_back(stream);
			goto repeat;
		}
	}
	else if (stream->file_state.C == '_' || isalnum(stream->file_state.C))
	{
		int i = 0;
		do
		{
			stream->buffer[i++] = stream->file_state.C;
			stream->file_state.C = fgetc(stream->file_state.file);
		} while (stream->file_state.C == '_' || isalnum(stream->file_state.C));
		stream->buffer[i] = '\0';
	}
	else if (stream->file_state.C == '"')
	{
		int i = 0;
		stream->file_state.C = fgetc(stream->file_state.file);
		while (stream->file_state.C != '"')
		{
			stream->buffer[i++] = stream->file_state.C;
			stream->file_state.C = fgetc(stream->file_state.file);
			if (stream->file_state.C == '\\')
			{ // temporary escape solution for some characters
				stream->file_state.C = fgetc(stream->file_state.file);
				stream->buffer[i++] = stream->file_state.C;
			}
		}
		stream->file_state.C = fgetc(stream->file_state.file);
		stream->buffer[i] = '\0';
	}
	else
	{
		stream->buffer[0] = stream->file_state.C;
		stream->file_state.C = fgetc(stream->file_state.file);
		stream->buffer[1] = '\0';
	}
}

void token_stream_close(Token_Stream *stream)
{
	fclose(stream->file_state.file);
	if (stream->file_state.backtrace)
	{
		token_stream_pop_back(stream);
		token_stream_close(stream);
	}
}

void token_stream_rewind(Token_Stream *stream)
{
	if (stream->file_state.backtrace)
	{
		token_stream_pop_back(stream);
		token_stream_rewind(stream);
	}
	else
	{
		rewind(stream->file_state.file);
		stream->file_state.backtrace = NULL;
		stream->file_state.line_number = 1;
		stream->file_state.C = fgetc(stream->file_state.file);
	}
}

void token_stream_push_back(Token_Stream *stream, const char *new_path)
{
	stream->file_state.backtrace = malloc(sizeof stream->file_state);
	*stream->file_state.backtrace = stream->file_state;
	stream->file_state.backtrace->backtrace = NULL; // i have no idea why but this is required
	token_stream_state_init(&stream->file_state, new_path);
}

void token_stream_pop_back(Token_Stream *stream)
{
	// printf("Popping file state (%s) ('%i')\n", stream->buffer, stream->file_state.C);
	Token_Stream_State *back = stream->file_state.backtrace;
	fclose(stream->file_state.file);
	stream->file_state = *stream->file_state.backtrace;
	free(back);
}
