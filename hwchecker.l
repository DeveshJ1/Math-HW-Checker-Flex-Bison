
%{
#include "hwchecker.tab.h"
#include <cstdlib>
#include <iostream>
#include <cstring> 
int unaryMinusFlag = 0;

using namespace std;

%}
%option noyywrap
DIGIT [0-9]

NUMBER {DIGIT}+

%%

[ \t\r\n]+          /* Skip whitespace */
"="               { return EQ; }
"<"               { return LT; }
">"               { return GT; }
"+"               { return PLUS; }
"-"               { return MINUS; }  
"*"               { return TIMES; }
"/"               { return DIVIDE; }
"("               { return LPAREN; }
")"               { return RPAREN; }
{DIGIT}+":"       { yylval.str = strdup(yytext); return LineNum;  } /* Added to recognize colons */
[a-zA-Z]		  {
                    cerr << "Error: syntax error" << endl;
                    exit(1);
               	  }
{NUMBER}          { yylval.num = atoi(yytext); return NUMBER;}
.                  { std::cerr << "Error: syntax error" << std::endl; exit(1); }


%%

