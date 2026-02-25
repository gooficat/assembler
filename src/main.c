#include "token_stream.h"
#include <string.h>

int main(void)
{
	Token_Stream stream;
	token_stream_init(&stream, "C:/Users/User/Documents/Programming/Assembler/tests/test.asm");

	while (stream.buffer[0] != '\0')
	{
		token_stream_next(&stream);

		if (!strcmp(stream.buffer, "include"))
		{
			token_stream_next(&stream);
			token_stream_push_back(&stream, stream.buffer);
		}

		puts(stream.buffer);
	}

	token_stream_close(&stream);
	return 0;
}
