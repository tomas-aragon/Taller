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

uses
sysutils;

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





procedure ordenar_insersion( var v: vector; DL: RDL); // B
var i, j, act: integer; // ACT ES EL ULTIMO ELEMENTO ELEMENTO DEL SUBCONJ.
begin

for i := 2 to DL do begin // 

act := v[i];

j := i - 1;

while ( j >= 1 ) and ( v[j] > act ) do begin // MIENTRAS J ES VALIDO Y V[J] ES MAYOR, CORRE V[J] A DERECHAS.
v[j + 1] := v[j];
j := j - 1;
end; {FINAL FOR j}

v[j + 1] := act; // INSERTA ACT.

end; {FINAL FOR i}

end; {FINAL PROC.}

procedure busqueda_dicotomica (v: vector; DL: RDL; ini, fin: integer; n: integer; var posicion: integer ); // C
var i, mitad: integer; b: boolean;
begin

ini := 1; fin := DL; mitad := (fin + ini) DIV 2;

posicion := -1; b := false;



while (not b) and(mitad <> ini) and (mitad <> fin) do begin
if ( n = v[mitad] ) then b := (b OR true) else b := ( b OR false);
if ( b ) then posicion := mitad;


if ( v[mitad] < n ) then begin
mitad := mitad + 1; 
mitad := ( mitad + fin ) DIV 2;
end else if ( n < v[mitad] ) then begin

mitad := mitad - 1; 
mitad := ( ini + mitad + 1) DIV 2;
end;


writeln( 'ini ', ini, '; mitad ', mitad, '; fin ', fin );
writeln( 'posicion -> ', posicion );



end; // WHILE




end; // PROC


procedure imprimir_vector( v: vector; DL: RDL );
var i: integer;
begin

for i := 1 to DL do writeln('i ', i, '; v[i] ', v[i]);

end;



var v: vector; DL: RDL; ini, fin, n, posicion: integer; mensaje, s: string; ps: longint;
begin

DL := 0;

cargar_vector( v, DL );

imprimir_vector( v, DL );

ordenar_insersion( v, DL );

writeln('v ordenado');
imprimir_vector( v, DL );



n := 1;
busqueda_dicotomica ( v, DL, ini, fin, n, posicion ); // C

s := IntToStr( posicion );
if (posicion = -1) then mensaje := ' no se encuentra en el vector.' else mensaje := ' tiene posicion ' + s;

writeln('Buscando. ', n, mensaje );




end.