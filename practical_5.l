%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+ {
    int num = atoi(yytext);        // Convert string to integer
    printf("%d in hex is %X\n", num, num);  // Print in hexadecimal
}
.|\n    ;
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

