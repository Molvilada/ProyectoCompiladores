%{ 
    #include"y.tab.h" 
    extern yylval; 
%}

%% 

[<] {return "<"} 

[>] {return ">"}

[/] {return "/"}

[A-Za-z]+ {return ident}

[/]     {return '/';} 

[\t]+   ;

" "     { }

[\n]    {return 0;} 

.       {return yytext[0]; } 

%% 