%{
int evens = 0;
%}

%%

[0-9]*[02468] { evens++; }
[0-9]*[13579] { }
(.|\n) { }
%%

main(int argc, char **argv)
{
    yylex();
    printf("%d\n", evens);
    return 0;
}