
%{
int num_lineas = 0, num_caracteres = 0;
%}
ID       [a-z][a-z|A-Z|0-9]*
DIGITO [0-9]
CHAR  [a-z|0-9]


%%
\n {	++num_lineas;
	++num_caracteres;
}

int|float|bool|char|string|if|then|else|while|do|input|output|return {
	    printf("Palabra reservada:          %s\n",yytext);
	    }

{ID}        {printf( "Un identificador:           %s\n", yytext );}

","|";"|":"|"("|")"|"["|"]"|"{"|"}"|"+"|"-"|"*"|"/"|"<"|">"|"="|"!"|"%"|"&"|"$" {printf( "Un operador:                %s\n", yytext);}

"<="|">="|"=="|"!="|"&&"|"||"  {printf("Operando compuesto:         %s\n",yytext);}

{DIGITO}*|"-"{DIGITO}* { printf("Literal de tipo int:       %s\n",yytext);}

{DIGITO}*"\.""0"*|{DIGITO}*"\."{DIGITO}*|"-"{DIGITO}*"\.""0"*|"-"{DIGITO}*"\."{DIGITO}*  { printf("Literal de tipo float:      %s\n",yytext);}

true|false|TRUE|FALSE	{ printf("Literal de tipo boolean:    %s\n",yytext);}

"{"[^}\n]*"}"

[ \t]+ 

"'"[a-z|A-Z|0-9]"'"  {printf ("Literal de tipo char:       %s\n",yytext);}

"\""[^\n]*"\"" {printf("Literal de tipo String:     %s\n",yytext);}

.       {    
	++num_caracteres;
	printf( "Error en la línea: %d    %s\n",num_caracteres, yytext );
	yyterminate();}




%%

main(){
    yyin = fopen( "Codigo.txt", "r" );
    yylex();
    }
