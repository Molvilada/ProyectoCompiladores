%{
    #include "y.tab.h"
    #include<math.h>
    #include <stdio.h>
    #include <stdlib.h>
    #define PI 3.14159265358979323846
    void yyerror(char *);
    int yylex(void);
    int sym[26];
%} 

/* %union
{
 double real;
} */

%token TK_NUM 
%token TK_SEN
%token TK_COS
%token TK_TAN
%token TK_SENH
%token TK_COSH
%token TK_TANH
%token TK_SQRT
%token TK_LOG
%token TK_E
%token TK_PI
%token TK_ID
%token ';'
%right '='
%left '-''+' 
%left '*''/' 
%right '^'

/* %type <real> exp */
/* %type <val> line */

%% 
start: /*epsilon*/
    | start line 
    ;

line: exp '\n'            {printf("%d\n", $1); }
    | TK_ID '=' exp '\n'  {sym[$1] = $3;};

exp:exp'+'exp           {$$ = $1+$3;} 
    |exp'-'exp          {$$ = $1-$3;} 
    |exp'*'exp          {$$ = $1*$3;} 
    |exp'/'exp          { 
                            if($3 == 0){  
                                yyerror("División por 0");
                            }else{ 
                                $$ = $1/$3; 
                            } 
                        } 
    |exp'^'exp          {$$ = pow($1, $3);} 
    |'('exp')'          {$$ = $2;} 
    |TK_SEN'('exp')'    {$$ = sin($3);} 
    |TK_COS'('exp')'    {$$ = cos($3);}
    |TK_TAN'('exp')'    {  
                            if(fabs(cos($3)) < 0.0001){  
                                yyerror("Cálculo en valores fuera del dominio");  
                            }else{ 
                                $$ = tan($3); 
                            }
                        }
    |TK_SENH'('exp')'   {$$ = sinh($3);}
    |TK_COSH'('exp')'   {$$ = cosh($3);}
    |TK_TANH'('exp')'   {$$ = tanh($3);}
    |TK_LOG'('exp')'    {
                            if($3 <= 0){  
                                yyerror("Cálculo en valores fuera del dominio"); 
                            }else{ 
                                $$ = log($3); 
                            }
                        }
    |TK_E'('exp')'      {$$ = exp($3);}
    |TK_SQRT'('exp')'   {
                            if($3 < 0){  
                                yyerror("Cálculo en valores fuera del dominio"); 
                            }else{ 
                                $$ = sqrt($3); 
                            }
                        }
    |TK_PI              {$$ = PI;}
    |TK_NUM             {$$ = $1;} 
    |TK_ID              {printf(sym[$1]);$$ = sym[$1];}
    ; 

%% 

main() 
{ 
    printf("Enter the Expression:\n"); 
    if(yyparse() == 0)
        printf("Success");
    return 0; 
} 

yywrap()
{
} 

yyerror ()
{
    printf("ERROR: Invalid Arithmetic Expression\n"); 
    return 0;
}