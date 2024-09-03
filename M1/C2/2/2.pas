{

TP2EJ2.

a.Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.

b.Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.

c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.

d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.

e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.


}


program TP2EJ1;

type

lista = ^nodo;

nodo = record
dato: integer;
sig: lista;
end;


{===+++===}




procedure generar_lista( var l, ult: lista; var cortar: boolean  ); // A
var nue: lista; r: integer;
begin


r := random(101) + 100;


if ( not cortar ) then begin // IF A

new( nue ); nue^.dato := r; nue^.sig := NIL;

writeln('dato cargado: ', nue^.dato );


if (l = NIL) then l := nue else ult^.sig := nue;

ult := nue;

if (r = 100) then cortar := true;
generar_lista( l, ult, cortar );

end; // IF A
end; {PROC}



procedure imprimir_lista( l: lista ); // B
begin

if ( l <> NIL ) then begin

writeln( 'dato: ', l^.dato );
l := l^.sig;
imprimir_lista( l );
end;

end;




procedure imprimir_lista_alrevez( l: lista ); // C
begin

if ( l <> NIL ) then begin
imprimir_lista_alrevez( l^.sig ); // POST ORDEN
writeln( 'dato: ', l^.dato );
end;

end;


procedure buscar_minimo( l: lista; var n: integer ); // D
begin


if ( l <> NIL ) then begin
if ( l^.dato < n ) then n := l^.dato;
l := l^.sig;
buscar_minimo( l, n );
end;

end; // PROC.


procedure buscar_elemento( l: lista; k: integer; var esta: boolean );
begin


if ( l <> NIL ) then begin
if ( l^.dato = k ) then esta := true;
l := l^.sig;
buscar_elemento( l, k, esta );
end;

end;




var l, ult: lista; cortar, esta: boolean; n, k: integer;
begin

l := NIL; ult := NIL; cortar := false;


generar_lista( l, ult, cortar );
imprimir_lista( l );


Writeln( 'imprimir lista alrevez:' );
imprimir_lista_alrevez( l ); // c

Writeln( 'primer elemento de l: :', l^.dato );


n := MAXINT;
buscar_minimo( l, n );
Writeln( 'El minimo es: :', n ); // D

k := 1; esta := false;

buscar_elemento( l, k, esta );
Writeln( 'El elemento ', k,' se encuentra en la lista: ', esta ); // E

	
end.