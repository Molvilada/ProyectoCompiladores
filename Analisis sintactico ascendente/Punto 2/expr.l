%{ 
    #include"y.tab.h" 
    #include<math.h> 
    #include <stdio.h>
    #include <stdlib.h>
    int nlines=0;
%}

%% 


[0-9]+  {yylval=atof(yytext);return TK_NUM;} 

[+]     {return '+';} 

[-]     {return '-';} 

[*]     {return '*';} 

[/]     {return '/';} 

[\^]    {return '^';}

"PI"    {return TK_PI;}

"sen"   {return TK_SEN;} 

"cos"   {return TK_COS;} 

"tan"   {return TK_TAN;} 

"senh"  {return TK_SENH;} 

"cosh"  {return TK_COSH;} 

"tanh"  {return TK_TANH;} 

"log"   {return TK_LOG;} 

"sqrt"  {return TK_SQRT;} 

"e"     {return TK_E;}

[A-Za-z]+ {return TK_ID;}

"="     {return '=';}

";"     {return ';';}

[\t]+   ;

" "     { }

[\n]   {return 0;}

.      

%% 