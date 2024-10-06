program Parcial_TGT1;





type

prestamo = record
ISBN: integer;
nro_prestamo: integer;
cod_socio: integer;
end;

// A. prestamos a un mismo socio se leen consecutivamente.
//    la lectura finaliza al ingresar el cod_socio 0.
// A-i retornar una estructura adecuada para la busqueda por ISBN
// A-ii  una estructura que almacene cod_socio y su cantidad de prestamos

// Usar A-i para contar los prestamos con un ISBN dado

// Usar A-ii para contar los socios con un mas de n prestamos


arbol = ^na; // A-i arbol ordenado segun ISBN.


na = record
dato: prestamo;
hi: arbol;
hd: arbol;
end;




{===}

socio = record
cod_socio: integer;
c_prestamos: integer;
end;


lista = ^nl; // A-ii lista socios segun cod_socio.

nl = record
dato: socio;
sig: lista;
end;


procedure leerDatos( var p: prestamo );
var aux, k, isbn : integer;
begin

aux := random(1001);
k := aux;
if ( k MOD 3 = 0 ) then p.cod_socio := p.cod_socio + 1; // 1 de cada 4 veces
p.nro_prestamo := random(1000) + 1; // 1-1000.

isbn := random(101);

if ( isbn MOD 5 = 0 ) then isbn := 1333 else isbn := random(1638) +  1000;

p.ISBN := isbn; // 16384-32768.

end;



procedure insertarArbol( var a: arbol; p: prestamo );
var nue: arbol;
begin


if (a = NIL) then begin // IF A

new( nue ); nue^.dato := p; nue^.hi := NIL; nue^.hd := NIL; a := nue;

end else begin // IF A


if ( p.ISBN < a^.dato.ISBN ) then insertarArbol( a^.hi, p ) else insertarArbol( a^.hd, p );


end; // IF A
end; // PROC



procedure insertarlista( var l: lista; cod, cantidad: integer );
var ant, act, nue: lista;
begin

new (nue);
nue^.dato.cod_socio := cod;
nue^.dato.c_prestamos := cantidad;
nue^.sig := NIL; 

if (l = NIL) then l := nue else begin

ant := l; act := l;

while (act <> NIL ) do begin 
ant := act;
act := act^.sig;
end;

ant^.sig := nue;

end; // IF

end; // PROC



procedure cargar( var a: arbol; var l: lista; var p: prestamo; var cod, cantidad: integer  );
begin

cod := p.cod_socio;

while ( cod = p.cod_socio ) do begin
leerDatos( p );
insertarArbol( a, p );

if (p.cod_socio = cod) then begin
cantidad := cantidad + 1;
end;

end; // WHILE


insertarlista( l, cod, cantidad );

cod := p.cod_socio;
cantidad := 1;



end; // PROC


{===+++===}

// AP. B

procedure contar_prestamos_ISBN( a : arbol; ISBN: integer; var cantidad: integer  ); // B
begin

if (a <> NIL) then begin
contar_prestamos_ISBN( a^.hi, isbn, cantidad );

if (a^.dato.ISBN = ISBN ) then cantidad := cantidad + 1;

contar_prestamos_ISBN( a^.hd, isbn, cantidad );
end; // IF

end; // PROC



{

Duda:

Porque a veces una función recursiva retorna basura
cuando el mismo código en un procedimiento retorna el valor adecuado. 

Ejemplo:
contar_prestamos_ISBN_f vs. contar_prestamos_ISBN

}


function contar_prestamos_ISBN_f( a : arbol; ISBN: integer ): integer; // B
var c: integer;
begin

if (a <> NIL) then begin


writeln( 'Entra if funcion contar' );

c := 0;

if (a^.dato.ISBN = ISBN ) then begin
c := 1;
writeln('Incremento');
end;


contar_prestamos_ISBN_f := c + contar_prestamos_ISBN_f( a^.hi, ISBN ) + contar_prestamos_ISBN_f( a^.hd, ISBN );

end; // IF

end; // PROC


{===+++===+++===}





function contar_socios_superan_prestamos( l: lista; n: integer ): integer; // PORQUE NO FUNCA
var c: integer;
begin

if ( l <> NIL ) then begin

if ( l^.dato.c_prestamos > n ) then c := 1;
contar_socios_superan_prestamos := c + contar_socios_superan_prestamos( l^.sig, n );

end;

end; // PROC



procedure contar_socios_superan_prestamos_p( l: lista; n: integer; var cantidad: integer );
begin

if ( l <> NIL ) then begin

if ( l^.dato.c_prestamos > n ) then cantidad := cantidad + 1;
contar_socios_superan_prestamos_p( l^.sig, n, cantidad );

end;

end; // PROC





{=== Imprimir ===}


procedure imprimirarbol( a: arbol );
begin

if (a <> NIL) then begin
imprimirarbol( a^.hi );

writeln ( 'ISBN ', a^.dato.ISBN, '; numero de prestamo ', a^.dato.nro_prestamo, '; codigo de socio ', a^.dato.cod_socio );

imprimirarbol( a^.hd );

end; // IF

end; // PROC


procedure implimirlista ( l: lista );
begin


while (l <> NIL) do begin
writeln ( 'Codigo de socio ', l^.dato.cod_socio, '; cantidad de prestamos ', l^.dato.c_prestamos );
l := l^.sig;
end;

end; // PROC








{===PROG PPAL===}

var
a: arbol; l: lista; 
p: prestamo; 
n, i, cod, cantidad: integer;
c_ISBN, ISBN: integer;

c_socios, c_p: integer;

begin

writeln(MAXINT);


a := NIL; l := NIL;








{===+++===}

p.cod_socio := 1; 

cantidad := 0; cod := p.cod_socio;



n := 13; // n es el numero de socios que quiero que se agreguen a la lista, cada uno con alguna cant de prestamos

for  i := 1 to n do cargar( a, l, p, cod, cantidad );

writeln( 'Arbol segun ISBN' );
imprimirarbol( a );
writeln( 'lista segun socio' );
implimirlista( l );

c_ISBN := 0;

ISBN := 1333;

writeln();
writeln();


contar_prestamos_ISBN( a, ISBN, c_ISBN );
writeln( 'Cantidad de prestamos con ISBN ', ISBN, ' es ', c_ISBN );

c_ISBN := 0;

c_ISBN  := contar_prestamos_ISBN_f( a, ISBN );
writeln( 'Igual pero cuento con una funcion recursiva: Cantidad de prestamos con ISBN ', ISBN, ' es ', c_ISBN );


c_p := 3;
c_socios := 0;
contar_socios_superan_prestamos_p( l, c_p, c_socios );
writeln( 'Cantidad de socios que superan ', c_p , ' es ', c_socios );


end.