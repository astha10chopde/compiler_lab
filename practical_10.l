%{
#include "y.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]*   { yylval.str = strdup(yytext); return ID; }
[0-9]+                   { yylval.str = strdup(yytext); return NUM; }
"="                      { return ASSIGN; }
"+"                      { return PLUS; }
"-"                      { return MINUS; }
"*"                      { return MUL; }
"/"                      { return DIV; }
"("                      { return LPAREN; }
")"                      { return RPAREN; }
[ \t\n]+                 ;    /* skip spaces */
.                        ;    /* ignore anything else */
%%

int yywrap() { return 1; }


