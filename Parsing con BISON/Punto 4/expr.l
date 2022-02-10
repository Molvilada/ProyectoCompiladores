%{ 
    #include"y.tab.h" 
    #include<stdio.h>
    #include<string.h>
%}

%% 

\<[a-zA-Z]+\>   {
                    yylval.str = malloc(yyleng - 1);  
                    memcpy(yylval.str, yytext + 1, yyleng - 1);
                    return TK_START;
                }

\<\/[a-zA-Z]+\> {   yylval.str = malloc(yyleng - 1);  
                    memcpy(yylval.str, yytext + 2, yyleng - 1); 
                    return TK_STOP;
                }

[a-zA-Z ]+ {yylval.str = strdup(yytext);return TK_STR;} 
[\n] ;

. ;

%% 