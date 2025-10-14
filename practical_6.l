%{
#include <stdio.h>
%}

%%
.*com$    { printf("Line ending with 'com': %s\n", yytext); }
.*        { /* ignore other lines */ }
%%

int main() {
    printf("Enter lines (Ctrl+D to stop):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}


