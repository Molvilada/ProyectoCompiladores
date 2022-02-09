%{ 
    #include"y.tab.h" 
    extern yylval; 
%}

%% 

[<[a-z]+>] { return START; }
[<\/[a-z]+>] { return STOP; }
[0-9]+ { return NUM; }
[^><]+ { return STR; }

%% 