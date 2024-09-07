{

A. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta.

i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.

ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.

iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.

nota: el módulo debe retornar TRES árboles.

---

B. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.

C. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.

D. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas.

}


program TP3A2;

type

v_fecha = array[1..3] of integer;

venta = record
cod: integer;
fecha: v_fecha;
unidades: integer;
end;

producto = record
cod: integer;
unidades: integer;
end;


arbol = ^nodo;

nodo = record
dato: venta;
HI: arbol;
HD: arbol;
end;


{===+++===}

// APARTADO 1-A

procedure generar_venta( var v: venta );
begin

v.cod := random(151);
v.fecha[1] :=  random(31) + 1;
v.fecha[2] :=  random(12) + 1;
v.fecha[3] :=  random(35) + 1990;
v.unidades :=  random(100) + 1;

end;


procedure cargar_ventas( var a: arbol; v: venta );
begin
if (a = NIL) then begin
new( a ); a^.dato := v; a^.HI := NIL; a^.HD := NIL;
end else begin
if ( v.cod < a^.dato.cod ) then cargar_ventas(a^.HI, v ) else cargar_ventas(a^.HD, v );
end;

end; // CARGAR_VENTAS


procedure imprimir_ordenado( a: arbol );
begin

if (a <> NIL) then begin
imprimir_ordenado( a^.HI );
writeln( 'Cod de producto ', a^.dato.cod, '; fecha ', a^.dato.fecha[1], '/', a^.dato.fecha[2], '/', a^.dato.fecha[3], '; unidades vendidas ', a^.dato.unidades );
imprimir_ordenado( a^.HD );

end;

end; // PROC



{===+++===}


// APARTADO 1-B


function contar( a1: arbol; cod: integer; var unidades: integer );

begin


if ( a1 <> NIL ) then begin

contar( a1^.HI, cod );

if (a1^.dato.cod = cod) then unidades := unidades + a1^.dato.unidades;

contar( a1^.HD, cod );


end; // IF

end; // PROC




procedure cargar_productos( a1: arbol; var a2: arbol; var cod_ant: integer );
var unidades: integer;
begin

if ( a2 = NIL ) then begin // IF A

new( a2 ); a2^.HI := NIL; a2^.HD := NIL;
a2^.dato := a1^.dato; cod_ant := a1^.dato.cod;

end else begin


if (a1 <> NIL) and ( a1^.dato.cod < cod_ant ) then begin
cod_ant := a1^.dato.cod;
cargar_productos( a1^.HI, a2^.HI, cod_ant );


end else if (a1 <> NIL) and ( a1^.dato.cod > cod_ant ) then begin
cod_ant := a1^.dato.cod;
cargar_productos( a1^.HD, a2^.HD, cod_ant );


end else if (a1 <> NIL) and ( a1^.dato.cod = cod_ant ) then begin
cod_ant := a1^.dato.cod;
unidades := 0;
contar( a1, a1^.dato.cod, unidades ); // CASO COD. IGUALES
end;


end; // IF A


end; // CARGAR_PRODUCTOS



procedure crear_subarbol( a1: arbol; var a2: arbol );
var unidades: integer;
begin


if (a1 <> NIL) then begin

crear_subarbol(a1^.HI, a2 );

unidades := 0;
contar( a1, a1^.dato.cod, unidades);
a2^.dato.cod := a1^.dato.cod; a2^.dato.unidades := a1^.dato.cod; 


crear_subarbol(a1^.HD, a2 );



end;

end;




procedure retornar_arboles( var a1, a2: arbol; v: venta );
begin // RETORNAR_ARBOLES
end;




// PROGR PPAL

var a1, ca1, a2, t: arbol; v: venta; i, cod_ant: integer;
begin
a1 := NIL; a2 := NIL;

generar_venta( v );
while (v.cod <> 0) do begin
cargar_ventas( a1, v );
generar_venta( v );
end;


writeln( 'Arbol a1, ventas:' );
imprimir_ordenado( a1 );




{===+++===}
// APARATADO 1-B

ca1 := a1;


for i := 1 to 200 do begin
cargar_productos( a1, a2, cod_ant );
end;



writeln( 'Arbol a2, productos:' );
imprimir_ordenado( a2 );


end.
