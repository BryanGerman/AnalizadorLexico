
%{
int num_lineas = 0, num_caracteres = 0;
FILE * salida;

%}
ID       [a-z][a-z|A-Z|0-9]*
DIGITO [0-9]
CHAR  [a-z|0-9]


%%
\n {	++num_lineas;
	++num_caracteres;
}

int|float|bool|char|string|if|then|else|while|do|input|output|return {
	    fprintf(salida,"Palabra_reservada :          %s\n",yytext);
	    }

{ID}        {fprintf( salida,"Identificador :           %s\n", yytext );}

","|";"|":"|"("|")"|"["|"]"|"{"|"}"|"+"|"-"|"*"|"/"|"<"|">"|"="|"!"|"%"|"&"|"$" {fprintf( salida,"Un_operador :                %s\n", yytext);}

"<="|">="|"=="|"!="|"&&"|"||"  {fprintf(salida,"Operando_compuesto :         %s\n",yytext);}

{DIGITO}*|"-"{DIGITO}* { fprintf(salida,"Literal_de_tipo_int :       %s\n",yytext);}

{DIGITO}*"\.""0"*|{DIGITO}*"\."{DIGITO}*|"-"{DIGITO}*"\.""0"*|"-"{DIGITO}*"\."{DIGITO}*  { fprintf(salida,"Literal_de_tipo_float :      %s\n",yytext);}

true|false|TRUE|FALSE	{ fprintf(salida,"Literal_de_tipo_boolean :    %s\n",yytext);}

"{"[^}\n]*"}"

[ \t]+ 

"'"[a-z|A-Z|0-9]"'"  {fprintf (salida,"Literal_de_tipo_char :       %s\n",yytext);}

"\""[^\n]*"\"" {fprintf(salida,"Literal_de_tipo_String :     %s\n",yytext);}

.       {    
	++num_caracteres;
	fprintf(salida, "Error en la línea: %d    %s\n",num_caracteres, yytext );
	yyterminate();}




%%

main(){
    yyin = fopen( "Codigo.txt", "r" );
	salida = fopen("CodigoTokenClasses.txt","w");
	yylex();

    }
