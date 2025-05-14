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
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, value);
    };

    private Symbol symbol(int type) {
        return new Symbol(type, null);
    }
%}
%%
int | float {return symbol(sym.Tipo, yytext());}
{espacio} {/*Ignore*/}
"=" {return symbol(sym.Igual, yytext());}
"+" {return symbol(sym.Suma, yytext());}
"-" {return symbol(sym.Resta, yytext());}
"*" {return symbol(sym.Multiplicacion, yytext());}
"/" {return symbol(sym.Division, yytext());}
"(" {return symbol(sym.Parentesis_a, yytext());}
")" {return symbol(sym.Parentesis_c, yytext());}
";" {return symbol(sym.P_coma, yytext());}
{L}({L}|{D})* {return symbol(sym.Identificador, yytext());}
("(-"{D}+")"|{D}+) {return symbol(sym.Numero, yytext());}
 . {return symbol(sym.ERROR, yytext());}
