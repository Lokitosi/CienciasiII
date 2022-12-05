package properties;
import java_cup.runtime.Symbol;
%%
%class SymbolAnalyzerCup
%public
%type java_cup.runtime.Symbol
%cup 
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t \r \n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Comillas */
( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}

/* Nativos */
( #include ) {return new Symbol(sym.Include, yychar, yyline, yytext());}

( define ) {return new Symbol(sym.Define, yychar, yyline, yytext());}

( break ) {return new Symbol(sym.Break, yychar, yyline, yytext());}

( const ) {return new Symbol(sym.Const, yychar, yyline, yytext());}

( continue ) {return new Symbol(sym.Continue, yychar, yyline, yytext());}

( default ) {return new Symbol(sym.Default, yychar, yyline, yytext());}

( register ) {return new Symbol(sym.Register, yychar, yyline, yytext());}

( unsigned ) {return new Symbol(sym.Unsigned, yychar, yyline, yytext());}

( struct ) {return new Symbol(sym.Struct, yychar, yyline, yytext());}

( switch ) {return new Symbol(sym.Switch, yychar, yyline, yytext());}

( case ) {return new Symbol(sym.Case, yychar, yyline, yytext());}

( typedef ) {return new Symbol(sym.Typedef, yychar, yyline, yytext());}

/* Nativos */
( printf ) {return new Symbol(sym.Printf, yychar, yyline, yytext());}

( scanf ) {return new Symbol(sym.Scanf, yychar, yyline, yytext());}

( cin ) {return new Symbol(sym.Cin, yychar, yyline, yytext());}

( cout ) {return new Symbol(sym.Cout, yychar, yyline, yytext());}

( using ) {return new Symbol(sym.Using, yychar, yyline, yytext());}

( namespace ) {return new Symbol(sym.Namespace, yychar, yyline, yytext());}

( std ) {return new Symbol(sym.Std, yychar, yyline, yytext());}

( void ) {return new Symbol(sym.Void, yychar, yyline, yytext());}

/* Tipos de datos */
( int ) {return new Symbol(sym.Int, yychar, yyline, yytext());}

( byte ) {return new Symbol(sym.Byte, yychar, yyline, yytext());}

( char ) {return new Symbol(sym.Char, yychar, yyline, yytext());}

( short ) {return new Symbol(sym.Short, yychar, yyline, yytext());}

( long ) {return new Symbol(sym.Long, yychar, yyline, yytext());}

( float ) {return new Symbol(sym.Float, yychar, yyline, yytext());}

( double ) {return new Symbol(sym.Double, yychar, yyline, yytext());}

( String ) {return new Symbol(sym.Cadena, yychar, yyline, yytext());}

/* Palabra reservada If */
( if ) {return new Symbol(sym.If, yychar, yyline, yytext());}

/* Palabra reservada Else */
( else ) {return new Symbol(sym.Else, yychar, yyline, yytext());}

/* Palabra reservada Do */
( do ) {return new Symbol(sym.Do, yychar, yyline, yytext());}

/* Palabra reservada While */
( while ) {return new Symbol(sym.While, yychar, yyline, yytext());}

/* Palabra reservada For */
( for ) {return new Symbol(sym.For, yychar, yyline, yytext());}

/* Operador Asignacion */
( "=" ) {return new Symbol(sym.Asignation, yychar, yyline, yytext());}

/* Operador Suma */
( "+" ) {return new Symbol(sym.Add, yychar, yyline, yytext());}

/* Operador Resta */
( "-" ) {return new Symbol(sym.Resta, yychar, yyline, yytext());}

/* Operador Multiplicacion */
( "*" ) {return new Symbol(sym.Times, yychar, yyline, yytext());}

/* Operador Division */
( "/" ) {return new Symbol(sym.Divide, yychar, yyline, yytext());}

/* Operador Modulo */
( "%" ) {return new Symbol(sym.Module, yychar, yyline, yytext());}

/* Operadores logicos */
( "&&" ) {return new Symbol(sym.DoubleAnd, yychar, yyline, yytext());}

( "||" ) {return new Symbol(sym.DoubleOr, yychar, yyline, yytext());}

( "!" ) {return new Symbol(sym.Not, yychar, yyline, yytext());}

( "&" ) {return new Symbol(sym.And, yychar, yyline, yytext());}

( "|" ) {return new Symbol(sym.Or, yychar, yyline, yytext());}

/*Operadores Relacionales */
( ">" ) {return new Symbol(sym.GreatherThan, yychar, yyline, yytext());}

( "<" ) {return new Symbol(sym.LessThan, yychar, yyline, yytext());}

( "==" ) {return new Symbol(sym.Equal, yychar, yyline, yytext());}

( "!=" ) {return new Symbol(sym.NotEqual, yychar, yyline, yytext());}

( ">=" ) {return new Symbol(sym.GreaterEqualThan, yychar, yyline, yytext());}

( "<=" ) {return new Symbol(sym.LessEqualThan, yychar, yyline, yytext());}

/*Operadores de corrimiento*/
( "<<" ) {return new Symbol(sym.LeftShift, yychar, yyline, yytext());}

( ">>" ) {return new Symbol(sym.RightShift, yychar, yyline, yytext());}

/* Operadores Atribucion */
( "+=" ) {return new Symbol(sym.PlusEqual, yychar, yyline, yytext());}

( "-=" ) {return new Symbol(sym.MinusEqual, yychar, yyline, yytext());}

( "*=" ) {return new Symbol(sym.TimesEqual, yychar, yyline, yytext());}

( "/=" ) {return new Symbol(sym.DivideEqual, yychar, yyline, yytext());}

( "%=" ) {return new Symbol(sym.ModuleEqual, yychar, yyline, yytext());}

/* Operadores unarios*/
( "++" ) {return new Symbol(sym.Increment, yychar, yyline, yytext());}

( "--" ) {return new Symbol(sym.Decrement, yychar, yyline, yytext());}

/*Operadores Booleanos*/
( true ) {return new Symbol(sym.True, yychar, yyline, yytext());}

( false ) {return new Symbol(sym.False, yychar, yyline, yytext());}

/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.Parent_a, yychar, yyline, yytext());}

/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.Parent_c, yychar, yyline, yytext());}

/* Llave de apertura */
( "{" ) {return new Symbol(sym.Llave_a, yychar, yyline, yytext());}

/* Llave de cierre */
( "}" ) {return new Symbol(sym.Llave_c, yychar, yyline, yytext());}

/* Corchete de apertura */
( "[" ) {return new Symbol(sym.Corchete_a, yychar, yyline, yytext());}

/* Corchete de cierre */
( "]" ) {return new Symbol(sym.Corchete_c, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "main" ) {return new Symbol(sym.Main, yychar, yyline, yytext());}

/* Punto y coma */
( ";" ) {return new Symbol(sym.P_coma, yychar, yyline, yytext());}

/* Dos puntos */
( ":" ) {return new Symbol(sym.Dos_P, yychar, yyline, yytext());}

/* Punto */
( "." ) {return new Symbol(sym.Punto, yychar, yyline, yytext());}

/* Coma */
( "," ) {return new Symbol(sym.Coma, yychar, yyline, yytext());}

/* Identificador */
{L}({L}|{D}|_)* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}

/* Numero */
("(-"{D}+")")|({D}+"."+{D})|("(-"{D}+"."+{D}+")")|{D}+|("-"+{D}+"."+{D}) {return new Symbol(sym.Numero, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}