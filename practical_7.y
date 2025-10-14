%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/* Forward declarations */
int yylex(void);
int yyerror(char *s);
%}

/* Tell yacc that semantic values are doubles */
%union {
    double dval;
}

%token <dval> NUM
%type  <dval> expr

%left '+' '-'
%left '*' '/'
%right '^'

%%
input:
    /* empty */
  | input line
  ;

line:
    expr '\n'   { printf("Result = %.10g\n", $1); }
  ;

expr:
    NUM                 { $$ = $1; }
  | expr expr '+'       { $$ = $1 + $2; }
  | expr expr '-'       { $$ = $1 - $2; }
  | expr expr '*'       { $$ = $1 * $2; }
  | expr expr '/'       { 
                            if ($2 == 0) {
                                fprintf(stderr, "Error: division by zero\n");
                                exit(1);
                            }
                            $$ = $1 / $2;
                        }
  | expr expr '^'       { $$ = pow($1, $2); }
  ;
%%
int main() {
    printf("Enter postfix expressions (end each with ENTER):\n");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
