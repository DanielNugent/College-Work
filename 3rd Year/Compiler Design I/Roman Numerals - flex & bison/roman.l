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

\n              { return EOL; }



%%

