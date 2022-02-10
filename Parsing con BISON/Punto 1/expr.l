%{ 
    #include"y.tab.h" 
    #include<math.h> 
    #include <stdio.h>
%}

%% 

[0-9]+ {yylval.real=atof(yytext);return TK_NUM;} 

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

"log"  {return TK_LOG;} 

"sqrt"  {return TK_SQRT;} 

"e"     {return TK_E;}

[\t]+   ;

" "     { }

[\n]    {return 0;} 

.       {return yytext[0]; } 

%% 