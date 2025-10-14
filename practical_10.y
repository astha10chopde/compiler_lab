%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);

int tempCount = 1;

char* newTemp() {
    char *t = (char*)malloc(10);
    sprintf(t, "t%d", tempCount++);
    return t;
}
%}

%union {
    char *str;
}

%token <str> ID NUM
%token ASSIGN PLUS MINUS MUL DIV LPAREN RPAREN
%type <str> expr term factor assign_stmt

%%
stmt : assign_stmt { printf("\n Intermediate Code generation completed!\n"); }
     ;

assign_stmt : ID ASSIGN expr
    {
        printf("%s = %s\n", $1, $3);
    }
    ;

expr : expr PLUS term
        {
            char *t = newTemp();
            printf("%s = %s + %s\n", t, $1, $3);
            $$ = t;
        }
     | expr MINUS term
        {
            char *t = newTemp();
            printf("%s = %s - %s\n", t, $1, $3);
            $$ = t;
        }
     | term { $$ = $1; }
     ;

term : term MUL factor
        {
            char *t = newTemp();
            printf("%s = %s * %s\n", t, $1, $3);
            $$ = t;
        }
     | term DIV factor
        {
            char *t = newTemp();
            printf("%s = %s / %s\n", t, $1, $3);
            $$ = t;
        }
     | factor { $$ = $1; }
     ;

factor : ID { $$ = $1; }
       | NUM { $$ = $1; }
       | LPAREN expr RPAREN { $$ = $2; }
       ;

%%

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    printf("Enter an arithmetic expression (e.g., a = b + c * d):\n");
    yyparse();
    return 0;
}
