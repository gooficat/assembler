#include <stdio.h>
#include <stdint.h>

#include "token_stream.h"


typedef struct {
    char* name;
    uint64_t value;
} Label;

typedef struct {
    Token_Stream stream;
    FILE* out;
    uint64_t offset;
    struct {
        Label* data;
        uint64_t size;
        uint64_t capacity;
    } Labels;
} Asm_Unit;
