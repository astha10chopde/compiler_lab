%{
#include "y.tab.h"
#include <stdlib.h>
%}

DIGIT   [0-9]
NUMBER  {DIGIT}+(\.{DIGIT}+)?

%%
{NUMBER}        { yylval.dval = atof(yytext); return NUM; }
[ \t]+          ;   /* ignore whitespace */
\n              { return '\n'; }
"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
"^"             { return '^'; }

.               { return yytext[0]; }
%%
int yywrap() { return 1; }

