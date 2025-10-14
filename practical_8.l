%{
#include "y.tab.h"
#include <stdlib.h>
%}

DIGIT   [0-9]
NUMBER  {DIGIT}+(\.{DIGIT}+)?([eE][-+]?[0-9]+)?

%%

{NUMBER}        { yylval.dval = atof(yytext); return NUM; }
[ \t]+          ;   /* ignore spaces and tabs */
\n              { return EOL; }
"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
"^"             { return '^'; }
"("             { return '('; }
")"             { return ')'; }

.               { return yytext[0]; }  /* any other character */
%%

int yywrap() { return 1; }



