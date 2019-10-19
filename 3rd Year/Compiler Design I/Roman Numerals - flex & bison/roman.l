%option noyywrap
%{
#include "roman.tab.h"
void yyerror(char *s);
%}

%%

"I"             { yylval = 1; return I; } 
"II"            { yylval = 2; return II; }
"III"           { yylval = 3; return III; }
"IV"            { yylval = 4; return IV; }
"V"             { yylval = 5; return V; }
"VI"            { yylval = 6; return VI; }
"VII"           { yylval = 7; return VII; }
"VIII"          { yylval = 8; return VIII; }
"IX"            { yylval = 9; return IX; }
"X"             { yylval = 10; return X; }
"XX"            { yylval = 20; return X; }
"XXX"           { yylval = 30; return X; }
"Xl"            { yylval = 40; return X; }
"L"             { yylval = 50; return X; }
"LX"            { yylval = 60; return X; }
"LXX"           { yylval = 70; return X; }
"LXXX"          { yylval = 80; return X; }
"XC"            { yylval = 90; return X; }
"C"             { yylval = 100; return X; }
"CC"            { yylval = 200; return X; }
"CCC"           { yylval = 300; return X; }
"CD"            { yylval = 400; return X; }
"D"             { yylval = 500; return X; }
"DC"            { yylval = 600; return X; }
"DCC"           { yylval = 700; return X; }
"DCCC"          { yylval = 800; return X; }
"CM"            { yylval = 900; return X; }
"M"             { yylval = 1000; return X; }


\n              { return EOL; }
.               { yyerror("syntax error\n"); }


%%

