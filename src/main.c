#include "token_stream.h"
int main(void)
{
    Token_Stream stream;
    token_stream_init(&stream, "C:/Users/User/Documents/Programming/Assembler/tests/test.asm");

    token_stream_push_back(&stream, "C:/Users/User/Documents/Programming/Assembler/tests/test.asm");

    while (stream.buffer[0] != '\0') {
        token_stream_next(&stream);
        puts(stream.buffer);
    }

    token_stream_close(&stream);
    return 0;
}
