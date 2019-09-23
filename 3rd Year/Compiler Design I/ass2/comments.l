%{
char no_comments[10000];
%}

%%

\"[^\"]*\"          { strcat(no_comments, yytext); }
\*\*.*              { }
\{[^\}]*\}          { }
\{[^\}]*            { strcat(no_comments,"syntax error\n"); return 0; }
\[^\{]*\}           { strcat(no_comments,"syntax error\n"); return 0; }
\}                  { strcat(no_comments,"syntax error\n"); return 0; }

\n                  { strcat(no_comments, yytext); }
.                   { strcat(no_comments, yytext); }


%%

int main(int argc, char **argv)
{
    extern FILE *yyin;
    yyin = fopen("test.txt", "r"); 
    yylex();
    printf("%s", no_comments);
    return 0;
}