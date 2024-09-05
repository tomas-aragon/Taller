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






procedure generar_venta( var v: venta );
begin

v.cod := random(151);
v.fecha[1] :=  random(31) + 1;
v.fecha[2] :=  random(12) + 1;
v.fecha[3] :=  random(35) + 1990;
v.unidades :=  random(100) + 1;

end;


procedure insertar_producto( var ap: arbol; cod, cantidad: integer );
begin
if (ap = NIL) then begin
new( ap ); ap^.dato.cod := cod; ap^.dato.unidades := cantidad;
end else begin
if ( cod < ap^.dato.cod ) then insertar_producto( ap^.HI, cod, cantidad ) else insertar_producto( ap^.HD, cod, cantidad ); 
end;

end; // CARGAR

procedure contar_unidades( var a: arbol; var cod, cantidad: integer);
begin

cantidad := 0; cod := a^.dato.cod;

while ( a^.dato.cod = cod ) do begin
cantidad := cantidad + a^.dato.unidades;
a := a^.HD;
end; // WHILE


end;



procedure cargar_productos( a: arbol; var ap: arbol; cod, cantidad: integer  );
begin

if (a <> NIL) then begin // IF A


cargar_productos( a^.HI, ap, cod, cantidad );
contar_unidades( a, cod, cantidad );
insertar_producto( ap, cod, cantidad );
cargar_productos( a^.HD, ap, cod, cantidad );


end; // IF A
end; // CARGAR_PRODUCTOS





procedure cargar_ventas( var a: arbol; v: venta );
begin
if (a = NIL) then begin
new( a ); a^.dato := v; a^.HI := NIL; a^.HD := NIL;
end else begin
if ( v.cod < a^.dato.cod ) then cargar_ventas(a^.HI, v ) else  cargar_ventas(a^.HD, v );
end;

end; // CARGAR_VENTAS



procedure retornar_arboles( var a, ap: arbol; v: venta; cod, cantidad: integer );
begin // RETORNAR_ARBOLES
end;




procedure imprimir_ordenado( a: arbol );
begin

if (a <> NIL) then begin
imprimir_ordenado( a^.HI );
writeln( 'Cod de producto ', a^.dato.cod, '; fecha ', a^.dato.fecha[1], '/', a^.dato.fecha[2], '/', a^.dato.fecha[3], '; unidades vendidas ', a^.dato.unidades );
imprimir_ordenado( a^.HD );

end;

end;




// PROGR PPAL

var a, ap: arbol; v: venta; cod, cantidad: integer;
begin
a := NIL; ap := NIL; cantidad := 0;

generar_venta( v );
while (v.cod <> 0) do begin
cargar_ventas( a, v );
generar_venta( v );
end;


writeln( 'Arbol a, ventas:' );
imprimir_ordenado( a );

cod := -1;
cargar_productos( a, ap, cod, cantidad );


writeln( 'Arbol ap, productos:' );
imprimir_ordenado( ap );


end.
