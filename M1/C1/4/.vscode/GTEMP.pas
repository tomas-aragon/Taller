{

4.- Una librería requiere el procesamiento de la información de sus productos.
De cada producto se conoce:

El código del producto, código de rubro (del 1 al 8) y precio.



Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.

b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.

c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.

d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.

e. Muestre los precios del vector resultante del punto d).

f. Calcule el promedio de los precios del vector resultante del punto d)

}

program TP1EJ4;


const DF = 30; // APARTADO C.

type

RRubro = 1..18;
RDL = 0..DF; // APARTADO C.


producto = record
cod: integer;
codRubro: RRubro;
precio: real;
end;


lista = ^nodo;

nodo = record
dato: producto;
sig: lista;
end;

{===+++===}


v_productos = array[1..DF] of producto; // APARTADO C, PROD. DEL RUBRO 3


{===+++===}

procedure leerInfo( var p: producto );
begin


writeln( 'Ingrese el codigo del producto:' );
readln( p.cod );

writeln( 'Ingrese su codigo de rubro, 1-18:' );
readln( p.codRubro );

writeln( 'Ingrese su precio:' );
readln( p.precio );

end;



procedure CargarProductos( var l: lista; p: producto  ); // A. leer y almacenar ordenado, ord. por código de producto y agrupados por rubro. Finalizar con el precio 0
var nue, ant, act: lista;
begin

new( nue ); nue^.dato := p; ant := l; act := l;



while ( act <> NIL) and ( act^.dato.codRubro <> nue^.dato.codRubro ) do begin
ant := act;
act := act^.sig;
end;

while ( act <> NIL) and ( act^.dato.cod < nue^.dato.cod ) do begin
ant := act;
act := act^.sig;
end;


if ( ant = act ) then l := nue else ant^.sig := nue;
nue^.sig := act;

end; {PROC.}

procedure ImprimirProductos( l: lista );
begin

while ( l <> NIL ) do begin
writeln('Codigo ', l^.dato.cod, '; Codigo de rubro (1-18): ', l^.dato.codRubro, '; Precio ', l^.dato.precio:2:2 );
l := l^.sig;
end;

end;




procedure ImprimirCodigosPorRubro( l: lista ); // APARTADO B
var r: RRubro;
begin


while ( l <> NIL ) do begin {WHILE A}

r := l^.dato.codRubro;


while ( l <> NIL ) and ( r = l^.dato.codRubro ) do begin
writeln('Codigo ', l^.dato.cod, '; Codigo de rubro (1-18): ', l^.dato.codRubro, '; Precio ', l^.dato.precio:2:2 );
l := l^.sig;
end;

writeln('---***---');

end; {WHILE A}

end;


procedure GenerarVector( var v: v_productos; var DL: RDL; l: lista ); // APARTADO C
begin

while (l <> NIL) and (l^.dato.cod < 3) do begin
l := l^.sig;
end;


while (l <> NIL) and (DL < 30) and (l^.dato.codRubro = 3) do begin
DL := Dl + 1;
v[DL] := l^.dato;
l := l^.sig;
end;


end;


procedure OrdenarSeleccion( var v: v_productos; DL: RDL );
var i, j, posicion: integer; aux: producto;
begin

for i := 1 to (DL - 1) do begin

posicion := i;

for j := (i + 1) to DL do begin
if (v[j].precio < v[posicion].precio) then posicion := j;
end;


aux := v[i]; v[i] := v[posicion]; v[posicion] := aux;

end; {FOR i}

end;



function CalcularPromedio( v: v_productos; DL: RDL ): real;
var i: integer; suma: real;
begin
suma := 0;

for i := 1 to DL do suma := suma + v[i].precio;

CalcularPromedio := suma / DL;


end;




var l: lista; p: producto; DL: RDL; i: integer; v: v_productos; promedio: real;

begin
l := NIL; DL := 0;


leerInfo( p );

while ( p.precio <> 0) do begin
CargarProductos( l, p );
leerInfo( p );
end; {WHILE}

ImprimirProductos( l );


writeln();
ImprimirCodigosPorRubro( l );

GenerarVector(  v, DL, l );

writeln('Productos del 3er rubro:');
for i := 1 to DL do writeln('Cod. ', v[i].cod, '; cod. de rubro ', v[i].codRubro, '; precio ', v[i].precio:2:2 );



writeln('Productos del 3er rubro ordenados por precio:');
OrdenarSeleccion( v, DL );
for i := 1 to DL do writeln('Cod. ', v[i].cod, '; cod. de rubro ', v[i].codRubro, '; precio ', v[i].precio:2:2 );



promedio := CalcularPromedio( v, DL ); // APARTADO 4-F
writeln('El promedio de estos precios es ', promedio:2:2 );



end.