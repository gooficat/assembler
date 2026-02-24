#include "token_stream.h"
int main(void)
{
    Token_Stream stream;
    token_stream_init(&stream, "tests/test.asm");
    token_stream_next(&stream);

    puts(stream.buffer);

    token_stream_close(&stream);
    return 0;
}
