package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio = [ \t\r]+
%{
    public String lexeme;
%}
%%

{espacio} {/*Ignore*/}
"\n"          { lexeme = yytext(); return Linea; }

"if"          { lexeme = yytext(); return IF; }
"true"        { lexeme = yytext(); return TRUE; }
"false"       { lexeme = yytext(); return FALSE; }

"=="          { lexeme = yytext(); return Igual_Igual; }
"<="          { lexeme = yytext(); return Menor_Igual; }
">="          { lexeme = yytext(); return Mayor_Igual; }
"<"           { lexeme = yytext(); return Menor; }
">"           { lexeme = yytext(); return Mayor; }


"("           { lexeme = yytext(); return Parentesis_a; }
")"           { lexeme = yytext(); return Parentesis_c; }
";"           { lexeme = yytext(); return P_coma; }

{L}({L}|{D})* { lexeme = yytext(); return Identificador; }
{D}+          { lexeme = yytext(); return Numero; }
. { return ERROR; }
