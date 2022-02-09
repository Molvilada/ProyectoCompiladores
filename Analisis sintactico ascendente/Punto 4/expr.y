%{
    #include<stdio.h> 
%} 

%token START STOP STR NUM
%%

start : START value STOP {printf("Correcto");}
;

value : start {printf("entra a simple_xml");} 
| STR {printf("entra a STR");}
| NUM {printf("entra a NUM");}
| value start {printf("value simple_xml");}
;

%% 

main() 
{ 
    printf("Enter the Expression:\n"); 

    if(yyparse()==0) 
        printf("Success\n"); 
} 

yywrap()
{
} 

yyerror() 
{ 
    printf("ERROR: Invalid Expression\n"); 
}
