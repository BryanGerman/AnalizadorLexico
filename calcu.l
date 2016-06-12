%{ 
#include <stdlib.h> 
#include <math.h>
void yyerror(char *); 
#include "calcu.tab.h" 
%} 

%% 
[0-9]+      { 
                yylval = atoi(yytext); 
                return INTEGER; 
            } 
[-+\n]      return *yytext; 
[ \t]       ; /* skip whitespace */ 
.           yyerror("invalid character"); 
%% 
int yywrap(void) { 
    return 1; 
}
