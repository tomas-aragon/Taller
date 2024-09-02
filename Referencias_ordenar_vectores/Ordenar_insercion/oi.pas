program ejemplo_ordenar_insersion;

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


procedure  ordenar_insersion( var v: vec; DL: integer);
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


{ --- --- --- --- }



var
v: vec; i, DL: integer;

begin
DL := 0;

for i := 1 to 17 do begin
cargar_vector( v, DL );
end;

imprimir_vector( v, DL );

ordenar_insersion( v, DL );

writeln('DL := ', DL);
writeln('El vector ordenado es: ');

imprimir_vector( v, DL );


end.