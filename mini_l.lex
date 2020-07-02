%{
int position = 1;
int currentLine = 1;
%}

Letter [a-zA-Z]
Digit [0-9]
Comm   ##.* 
%%
[ \t ]+ {position= position + yyleng;}
{Comm} {position= position + yyleng;}
function {printf("FUNCTION\n");position= position + yyleng;}
beginparams {printf("BEGIN_PARAMS\n");position= position + yyleng;}
endparams {printf("END_PARAMS\n");position= position + yyleng;}
beginlocals {printf("BEGIN_LOCALS\n");position= position + yyleng;}
endlocals {printf("END_LOCALS\n");position= position + yyleng;}
beginbody {printf("BEGIN_BODY\n");position= position + yyleng;}
endbody {printf("END_BODY\n");position= position + yyleng;}
integer {printf("INTEGER\n");position= position + yyleng;}
array {printf("ARRAY\n");position= position + yyleng;}
of {printf("OF\n");position= position + yyleng;}
if {printf("IF\n");position= position + yyleng;}
then {printf("THEN\n");position= position + yyleng;}
endif {printf("ENDIF\n");position= position + yyleng;}
else {printf("ELSE\n");position= position + yyleng;}
while {printf("WHILE\n");position= position + yyleng;}
do {printf("DO\n");position= position + yyleng;}
beginloop {printf("BEGINLOOP\n");position= position + yyleng;}
endloop {printf("ENDLOOP\n");position= position + yyleng;}
continue {printf("CONTINUE\n");position= position + yyleng;}
read {printf("READ\n");position= position + yyleng;}
write {printf("WRITE\n");position= position + yyleng;}
and {printf("AND\n");position= position + yyleng;}
or {printf("OR\n");position= position + yyleng;}
not {printf("NOT\n");position= position + yyleng;}
true {printf("TRUE\n");position= position + yyleng;}
false {printf("FALSE\n");position= position + yyleng;}
return {printf("RETURN\n");position= position + yyleng;}


"-" {printf("SUB\n");position= position + yyleng;}
"+" {printf("ADD\n");position= position + yyleng;}
"*" {printf("MULT\n");position= position + yyleng;}
"/" {printf("DIV\n");position= position + yyleng;}
"%" {printf("MOD\n");position= position + yyleng;}
"==" {printf("EQ\n");position= position + yyleng;}
"<>" {printf("NEQ\n");position= position + yyleng;}
"<" {printf("LT\n");position= position + yyleng;}
">" {printf("GT\n");position= position + yyleng;}
"<=" {printf("LTE\n");position= position + yyleng;}
">=" {printf("GTE\n");position= position + yyleng;}

";" {printf("SEMICOLON\n");position= position + yyleng;}
":" {printf("COLON\n");position= position + yyleng;}
"," {printf("COMMA\n");position= position + yyleng;}
"(" {printf("L_PAREN\n");position= position + yyleng;}
")" {printf("R_PAREN\n");position= position + yyleng;}
"[" {printf("L_SQUARE_BRACKET\n");position= position + yyleng;}
"]" {printf("R_SQUARE_BRACKET\n");position= position + yyleng;}
":=" {printf("ASSIGN\n");position= position + yyleng;}

[0-9]+{Letter}((({Letter}|{Digit})|_)*({Letter}|{Digit})+)* {printf("Error at line %d, column %d: identifier \"%s\" must begin with a letter\n", currentLine, position, yytext); exit(1);}
[0-9]+ {printf("NUMBER %s\n", yytext);position= position + yyleng;}
{Letter}((({Letter}|{Digit})|_)*({Letter}|{Digit})+)*_ {printf("Error at line %d, column %d: identifier \"%s\" cannot end with an underscore\n", currentLine, position, yytext); exit(1);}
{Letter}((({Letter}|{Digit})|_)*({Letter}|{Digit})+)* {printf("IDENT %s\n", yytext);position= position + yyleng;}
(_)+({Letter}((({Letter}|{Digit})|_)*({Letter}|{Digit})+)*) {printf("Error at line %d, column %d: identifier \"%s\" must begin with a letter\n", currentLine, position, yytext); exit(1);}


"\n" {currentLine = currentLine + 1; position = 1;}
. {printf("Error on line %d, column %d: unrecognized symbol \"%s\"\n", currentLine, position, yytext); exit(0);}

%%

