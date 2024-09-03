{

TP2EJ3
Implementar un programa que invoque a los siguientes módulos:

a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300 y menores a 1550, incluidos ambos.

b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. Utilizar lo realizado en la práctica anterior.

c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);

nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra en el vector.

}


program TP2EJ3;

const DF = 20;

type

RDL = 0..DF;
RV = 300..1550;

vector = array[1..DF] of RV;


{===+++===}



procedure cargar_vector( var v: vector; var DL: RDL );
begin

if (DL < DF) then begin
DL := DL + 1;
v[DL] := random(1251) + 300;
cargar_vector( v, DL );
end;

end; {PROC.}


procedure imprimir_vector( v: vector; DL: RDL );
var i: integer;
begin

for i := 1 to DL do writeln('i ', i, '; v[i] ', v[i]);

end;



var v: vector; DL: RDL;
begin

DL := 0;

cargar_vector( v, DL );

imprimir_vector( v, DL );
	
end.