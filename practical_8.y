%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int yylex(void);
int yyerror(const char *s);
%}

/* Semantic value is double */
%union {
    double dval;
}

%token <dval> NUM
%type  <dval> expr

%left '+' '-'
%left '*' '/'
%right '^'
%left UMINUS
%token EOL

%%
input:
      /* empty */
    | input line
    ;

line:
      expr EOL       { printf("= %.10g\n", $1); }
    | error EOL      { yyerror("Invalid expression"); yyerrok; }
    ;

expr:
      NUM
    | expr '+' expr  { $$ = $1 + $3; }
    | expr '-' expr  { $$ = $1 - $3; }
    | expr '*' expr  { $$ = $1 * $3; }
    | expr '/' expr  { 
                        if ($3 == 0) { fprintf(stderr, "Error: division by zero\n"); $$ = 0; }
                        else $$ = $1 / $3;
                      }
    | expr '^' expr  { $$ = pow($1, $3); }
    | '(' expr ')'   { $$ = $2; }
    | '-' expr %prec UMINUS { $$ = -$2; }
    ;
%%
int main() {
    printf("Desk Calculator (type expressions, one per line):\n");
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

