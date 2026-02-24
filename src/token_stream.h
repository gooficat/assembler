#pragma once

#include <stdint.h>
#include <stdio.h>

typedef struct Token_Stream_State {
    FILE* file;
    int C;
    uint64_t line_number;
    struct Token_Stream_State* backtrace;
} Token_Stream_State;

#define TOK_MAX_SIZE 1024
typedef struct {
    Token_Stream_State file_state;
    char buffer[TOK_MAX_SIZE];
} Token_Stream;



void token_stream_init(Token_Stream* stream, const char* file_path);
void token_stream_next(Token_Stream* stream);
void token_stream_close(Token_Stream* stream);
void token_stream_rewind(Token_Stream* stream);
void token_stream_push_back(Token_Stream* stream, const char* new_path);
void token_stream_pop_back(Token_Stream* stream);
