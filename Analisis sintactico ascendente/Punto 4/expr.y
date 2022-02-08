%{
    #include<stdio.h> 
%} 

%token ident

%% 
start: L {printf("%d\n",$$);} 

L: E L 
| /*epsilon*/;
E: A L B
| ident;
A: '<'ident'>';
B: '<''/'ident'>';

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
