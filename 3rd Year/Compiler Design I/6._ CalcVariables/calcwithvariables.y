%{
#include <stdio.h>
void yyerror();
int yylex();
int yyparse();

int vars[26];
int offset = 97;

%}

/* declare tokens */
%token NUM VAR ASSIGN PRINT SEMICOL ADD SUB MUL DIV

%%

calclist: /* nothing */
 | calclist vars
; 

vars: VAR ASSIGN exp SEMICOL { vars[$1-offset] = $3; }
 | PRINT VAR SEMICOL { printf("%d\n", vars[$2-offset]); }
;

exp: factor 
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
;

factor: term 
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
;

term: VAR   { $$ = vars[$1-offset]; }
 | SUB NUM  { $$ = $2 * -1; } 
 | NUM      { $$ = $1; } 
;

%%

int main()
{
  yyparse();
  return 0;
}

void yyerror(char *s)
{
  fprintf(stderr, "%s\n", s);
}

