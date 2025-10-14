%{
#include <stdio.h>
#include <string.h>
int count = 0;
%}

%%
[Aa][a-zA-Z]*   { count++; }
[a-zA-Z]+       { /* other words */ }
[ \t\n]+        { /* skip whitespace */ }
.               { /* skip punctuation */ }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a sentence:\n");
    yylex();
    printf("Number of words starting with 'A' or 'a': %d\n", count);
    return 0;
}

