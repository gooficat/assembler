#include "token_stream.h"
#include <stdlib.h>
#include <ctype.h>

void token_stream_state_init(Token_Stream_State* state, const char* file_path) {
    fopen_s(&state->file, file_path, "r");
    state->line_number = 1;
    state->backtrace = NULL;
}

void token_stream_init(Token_Stream* stream, const char* file_path) {
    token_stream_state_init(&stream->file_state, file_path);
}

void token_stream_strip_whitespace(Token_Stream* stream) {
    while (isspace(stream->file_state.C)) {
        if (stream->file_state.C == '\n') {
            stream->file_state.line_number++;
        }
        stream->file_state.C = fgetc(stream->file_state.file);
    }
}

void token_stream_next(Token_Stream* stream) {
repeat:
    token_stream_strip_whitespace(stream);

    if (stream->file_state.C == EOF) {
        if (stream->file_state.backtrace != NULL) {
            token_stream_pop_back(stream);
            goto repeat;
        }
        else {
            stream->buffer[0] = '\0';
        }
    }
    else {
        int i = 0;
        if (isalnum(stream->file_state.C)) {
            do {
                stream->buffer[i++] = stream->file_state.C;
                stream->file_state.C = fgetc(stream->file_state.file);
            } while (isalnum(stream->file_state.C));
        }
        else {
            stream->buffer[i++] = stream->file_state.C;
            stream->file_state.C = fgetc(stream->file_state.file);
        }
        stream->buffer[i] = '\0';
    }
}

void token_stream_close(Token_Stream* stream) {

}

void token_stream_rewind(Token_Stream* stream) {

}

void token_stream_push_back(Token_Stream* stream, const char* new_path) {
    stream->file_state.backtrace = malloc(sizeof stream->file_state);
    *stream->file_state.backtrace = stream->file_state;
    token_stream_state_init(&stream->file_state, new_path);
}

void token_stream_pop_back(Token_Stream* stream) {
    stream->file_state = *stream->file_state.backtrace;
    free(stream->file_state.backtrace);
}
