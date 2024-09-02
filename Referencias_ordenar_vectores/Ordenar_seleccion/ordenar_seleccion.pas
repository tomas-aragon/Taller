program progr_ordenar_seleccion_vector;

const
DF = 123;

type
vec = array[1..DF] of integer;


procedure cargar_vector( var v: vec; var DL: integer );
begin

DL := DL + 1;
v[DL] := random( 13388 );

end;


procedure imprimir_vector( v: vec; DL: integer );
var
i: integer;
begin


for i := 1 to DL do begin

writeln( i,' --> ', v[i] );

end;


end; {FINAL PROC.}


procedure  ordenar_seleccion( var v: vec; DL: integer);
var i, j, p, item: integer; // p ES LA POSICION DEL MENOR ELEMENTO.
begin

for i := 1 to ( DL - 1 ) do begin // EL ULTIMO ELEMENTO DEBE SER EL MAYOR SI SUS ANTERIORES YA ESTAN ORDENADOS.

p := i;

for j := (i + 1) to DL do begin // CALC. EL MIN A PARTIR DE i + 1.

if (v[j] < v[p] ) then p := j;

end; {FINAL FOR j}

item := v[i]; // INTERCAMBIO
v[i] := v[p];
v[p] := item;

end; {FINAL FOR i}

end; {Final PROC.}


{ --- --- --- --- }



var
v: vec; i, DL: integer;

begin
DL := 0;

for i := 1 to 17 do begin
cargar_vector( v, DL );
end;

imprimir_vector( v, DL );

ordenar_seleccion( v, DL );

writeln('DL := ', DL);
writeln('El vector ordenado es: ');

imprimir_vector( v, DL );


end.