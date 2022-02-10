%{
    #include<stdio.h> 
    #include<string.h>
%} 

%union{
    char *str;
}

%token <str>TK_START <str>TK_STOP <str>TK_STR

%type <str> xml start
%%



start : xml  {printf("Sucess \n");} 




xml: TK_START exp TK_STOP   {   
                                if(strcmp($1, $3)  != 0){
                                    yyerror("error");
                                }     
                            };

exp : start
| TK_STR
| exp start
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
