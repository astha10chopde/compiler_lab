%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token FOR LPAREN RPAREN SEMI ASSIGN LT GT INCR DECR ID NUM

%%
stmt : FOR LPAREN expr SEMI cond SEMI inc RPAREN
      {
        printf("Valid for loop statement\n");
      }
     ;

expr : ID ASSIGN NUM
     ;

cond : ID LT NUM
     | ID GT NUM
     ;

inc  : ID INCR
     | ID DECR
     ;

%%

void yyerror(const char *s)
{
    printf("Invalid for loop statement\n");
}

int main()
{
    printf("Enter a for loop:\n");
    yyparse();
    return 0;
}

