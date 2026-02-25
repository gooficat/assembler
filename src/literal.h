#pragma once

#include "asm_unit.h"
#include <stdbool.h>
#include <stdint.h>

int64_t asm_parse_literal(Asm_Unit *unit);

bool qualifies_as_literal(const char *token);
