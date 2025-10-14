%{
#include <stdio.h>
#include <ctype.h>
%}

%%
[a-z]       { putchar(toupper(yytext[0])); }
[A-Z]       { putchar(tolower(yytext[0])); }
.|\n        { ECHO; }
%%

int main(void) {
    yylex();
    return 0;
}

int yywrap(void) {
    return 1;
}

