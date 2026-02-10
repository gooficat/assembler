
# struct
#   FILE *file
#   short buff
#   char tokn[32]

.equ TOKN_MAX_LEN, 32

.equ TOK_STRM_FILE, 0
.equ TOK_STRM_BUFF, 8
.equ TOK_STRM_TOKN, 12
.equ TOK_STRM_LEN, TOK_STRM_TOKN + TOKN_MAX_LEN

.extern tok_open
.extern tok_next