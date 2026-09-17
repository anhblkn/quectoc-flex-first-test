%option noyywrap noinput nounput

%{

#include <stdio.h>

static void emit(const char *kind);

%}
%%

"let"
 
{ emit("KW_LET"); }

[A
-
Za
-
z_][A
-
Za
-
z0
-
9_]* { emit("IDENTIFIER"); }

[0
-
9]+
 
{ emit("INT_LITERAL"); }

"="
 
{ emit("ASSIGN"); }

";"
 
{ emit("SEMICOLON"); }

[
 
\
t
\
r
\
n]+
 
{ /* skip white space */ }

.
 
{ emit("LEX_ERROR"); }

%%
static void emit(const char *kind) {

printf("%s
 
%s
\
n", kind, yytext);

}

int main(void) {

yylex();

return 0;

}
