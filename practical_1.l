%{
#include <stdio.h>
%}

%%
one|One|ONE      printf("1");
two|Two|TWO      printf("2");
three|Three|THREE printf("3");
four|Four|FOUR   printf("4");
five|Five|FIVE   printf("5");
six|Six|SIX      printf("6");
seven|Seven|SEVEN printf("7");
eight|Eight|EIGHT printf("8");
nine|Nine|NINE   printf("9");
%%

int main(){
    yylex();
    return 0;
}

