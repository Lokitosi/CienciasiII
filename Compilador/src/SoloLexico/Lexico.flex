package SoloLexico;
import static SoloLexico.Tokens.*;
%%
%class Lexico
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t \r]+
%{
    public String lexemas;
%}
%%
/* Integer */
(int) {lexemas=yytext(); return Int;}

/* Double */
(double) {lexemas=yytext(); return Doble;}

/* Char */
(char) {lexemas=yytext(); return Char;}

 //Document Functions 
 /* Include */
(include) {lexemas=yytext(); return Include;}

 /* Define */
 (define) {lexemas=yytext(); return Define;}

  /* Break */
(break) {lexemas=yytext(); return Break;}

 /* Case */
 (case) {lexemas=yytext(); return Case;}

  /* Const */
(const) {lexemas=yytext(); return Const;}

 /* Continue */
 (continue) {lexemas=yytext(); return Continue;}

  /* Default */
(default) {lexemas=yytext(); return Default;}

 /* Do */
 (do) {lexemas=yytext(); return Do;}

 /* Float */
 (float) {lexemas=yytext(); return Float;}

  /* For */
(for) {lexemas=yytext(); return For;}

 /* Else */
 (else) {lexemas=yytext(); return Else;}

  /* Long */
(long) {lexemas=yytext(); return Long;}

 /* Register */
 (register) {lexemas=yytext(); return Register;}

  /* Return */
(return) {lexemas=yytext(); return Return;}

 /* Short */
 (short) {lexemas=yytext(); return Short;}

  /* Unsigned */
(unsigned) {lexemas=yytext(); return Unsigned;}

 /* Struct */
 (struct) {lexemas=yytext(); return Struct;}

  /* Switch */
(switch) {lexemas=yytext(); return Switch;}

 /* Typedef */
 (typedef) {lexemas=yytext(); return Typedef;}

  /* Void */
(void) {lexemas=yytext(); return Void;}

 /* While */
 (while) {lexemas=yytext(); return While;}

 //Functions like the ones in the doc

  /* Printf */
(printf) {lexemas=yytext(); return Printf;}

 /* Scanf */
 (scanf) {lexemas=yytext(); return Scanf;}

  /* Cin */
(cin) {lexemas=yytext(); return Cin;}

 /* Cout */
 (cout) {lexemas=yytext(); return Cout;}

  /* Using */
(using) {lexemas=yytext(); return Using;}

 /* Namespace */
 (namespace) {lexemas=yytext(); return Namespace;}

  /* Std */
(std) {lexemas=yytext(); return Std;}

 /* String */
 (string) {lexemas=yytext(); return String;}

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//" ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Comillas */
( "\"" ) {lexemas=yytext(); return Comillas;}

/* Tipo de dato String */
( String ) {lexemas=yytext(); return Cadena;}

/* Operador Igual */
( "=" ) {lexemas=yytext(); return Igual;}

/* Operador Suma */
( "+" ) {lexemas=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexemas=yytext(); return Resta;}

/* Parentesis de apertura */
( "(" ) {lexemas=yytext(); return Parent_a;}

/* Parentesis de cierre */
( ")" ) {lexemas=yytext(); return Parent_c;}

/* Llave de apertura */
( "{" ) {lexemas=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexemas=yytext(); return Llave_c;}

/* If */
( "if" ) {lexemas=yytext(); return If;}

/* Marcador de inicio de algoritmo */
( "main" ) {lexemas=yytext(); return Main;}

/* P_coma */
( ";" ) {lexemas=yytext(); return P_coma;}

/* Identificador */
{L}({L}|{D})* {lexemas=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexemas=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}
