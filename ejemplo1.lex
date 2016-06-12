%%
[0-9|A-F|a-f]+  printf("El número ingresado %s es hexadecimal",yytext);
[G-Z|g-z]+[0-9]* printf("No es un número hexadecimal");
%%

main() {
printf("Ingrese un número\n");
yylex();
printf("\nSE TERMINÓ\n\n");
}


