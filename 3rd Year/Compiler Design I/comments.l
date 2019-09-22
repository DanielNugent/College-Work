%{
int matches = 0;
%}

%%

\*\*.*           { printf("%s", yytext); }
(^\{.+\}$|\{\})  { printf("%s", yytext); }
.       {}

%%

int main(int argc, char **argv)
{
    extern FILE *yyin;
    yyin = fopen("test.txt", "r"); 
    yylex();
    printf("%d", matches);
    return 0;
}