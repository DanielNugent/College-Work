%{

%}
NEW_YEAR [1-9]{2}[12]
NEW_COUNTY C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW

NUMBER [1-9][0-9]{0,5}

OLD_YEAR [0-9]{2}
OLD_COUNTY C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LK|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|TN|TS|W|WD|WH|WX|WW
%%

[\n|\s|\t| ]*{NEW_YEAR}\-{NEW_COUNTY}\-{NUMBER}[\n|\s|\t| ]* {
  int year = yytext[1] - '0';
  int years_since_reg = 9-year;
  printf("%d\n", years_since_reg);
}

[\n|\s|\t| ]*{OLD_YEAR}\-{OLD_COUNTY}\-{NUMBER}[\n|\s|\t| ]* {
    printf("%s", yytext);
}

%%

main(int argc, char **argv)
{
    yylex();
    return 0;
}