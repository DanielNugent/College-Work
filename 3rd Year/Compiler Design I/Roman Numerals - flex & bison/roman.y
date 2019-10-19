%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(char *s);
%}

// declare tokens
%token I II III IV V VI VII VIII IX X
%token EOL

%%

expr:
    | expr val EOL { printf("%d\n", $2); }
;

val: term
;


term: I { $$ = $1; }
    | II { $$ = $1; }
    | III { $$ = $1; }
    | IV { $$ = $1; }
    | V { $$ = $1; }
    | VI { $$ = $1; }
    | VII { $$ = $1; }
    | VIII { $$ = $1; }
    | IX { $$ = $1; }
    | X { $$ = $1; }
;


%%

int main()
{
  yyparse();
  return 0;
}

void yyerror(char *s)
{
  printf("%s", s);
  exit(0);
}