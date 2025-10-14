%{
#include "y.tab.h"
%}

%%
"for"           { return FOR; }
"("             { return LPAREN; }
")"             { return RPAREN; }
";"             { return SEMI; }
"="             { return ASSIGN; }
"<"             { return LT; }
">"             { return GT; }
"++"            { return INCR; }
"--"            { return DECR; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }
[0-9]+          { return NUM; }
[ \t\n]+        ;      /* ignore whitespace */
.               ;      /* ignore any other character */
%%

int yywrap() { return 1; }


