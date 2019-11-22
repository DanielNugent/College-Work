%{
#include "calcwithvariables.tab.h"
#include <string.h>
void yyerror(char *s);
%}

%%

[a-z]       { yylval = (yytext[0] - 'a'); return VAR; }
[0-9]       { yylval = atoi(yytext); return NUM; }
"+"         { return ADD; }
"-"         { return SUB; }
"*"         { return MUL; }
"/"         { return DIV; }
"print "    { return PRINT; }
";"         { return SEMICOL; }
":="        { return ASSIGN; }
[\t\n" "]   { }
.           { yyerror("syntax error"); }

%%
