#include "literal.h"
#include "token_stream.h"

#include <ctype.h>
#include <stdlib.h>

int64_t asm_parse_singular_number(Asm_Unit *unit)
{
	int64_t out;
	if (unit->stream.buffer[0] == '-')
	{
		out = -asm_parse_singular_number(unit);
	}
	else if (unit->stream.buffer[0] == '~')
	{
		out = ~asm_parse_singular_number(unit);
	}
	else if (unit->stream.buffer[0] == '(')
	{
		token_stream_next(&unit->stream);
		out = asm_parse_literal(unit);
	}
	else
	{
		out = strtoll(unit->stream.buffer, NULL, 0);
	}
	token_stream_next(&unit->stream);
	return out;
}

bool is_operator(char c)
{
	switch (c)
	{
	case '+':
	case '-':
	case '*':
	case '/':
	case '%':
	case '&':
	case '|':
	case '^':
		return true;
	default:
		return false;
	}
}

int64_t asm_char_arithmetic(int64_t left, char operator, int64_t right)
{
	switch (operator)
	{
	case '+':
		return left + right;
	case '-':
		return left - right;
	case '*':
		return left * right;
	case '/':
		return left / right;
	case '%':
		return left % right;
	case '&':
		return left & right;
	case '|':
		return left | right;
	case '^':
		return left ^ right;
	default:
		return 0;
	}
}

int64_t asm_parse_literal(Asm_Unit *unit)
{
	int64_t out = asm_parse_singular_number(unit);
	if (is_operator(unit->stream.buffer[0]))
	{
		char operator = unit->stream.buffer[0];
		token_stream_next(&unit->stream);
		out = asm_char_arithmetic(out, operator, asm_parse_literal(unit));
	}
	return out;
}

bool qualifies_as_literal(const char *token)
{
	return isalnum(token[0]) || token[0] == '-' || token[0] == '~' || token[0] == '(' || token[0] == '!';
}
