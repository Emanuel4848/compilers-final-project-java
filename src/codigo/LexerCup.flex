package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, value);
    };

    private Symbol symbol(int type) {
        return new Symbol(type, null);
    }
%}
%%

"if"           {return symbol(sym.IF, yytext());}
"true"         {return symbol(sym.TRUE, yytext());}
"false"        {return symbol(sym.FALSE, yytext());}

"=="           {return symbol(sym.Igual_Igual, yytext());}
"<="           {return symbol(sym.Menor_Igual, yytext());}
">="           {return symbol(sym.Mayor_Igual, yytext());}
"<"            {return symbol(sym.Menor, yytext());}
">"            {return symbol(sym.Mayor, yytext());}

"("            {return symbol(sym.Parentesis_a, yytext());}
")"            {return symbol(sym.Parentesis_c, yytext());}
";"            {return symbol(sym.P_coma, yytext());}


{L}            {return symbol(sym.Identificador, yytext());}
{D}+           {return symbol(sym.Numero, yytext());}

{espacio}      {/*Ignore*/}
.  {return symbol(sym.ERROR, yytext());}
