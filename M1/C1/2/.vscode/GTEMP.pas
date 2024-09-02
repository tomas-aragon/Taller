program TP1EJ2;

const DF = 300;

type
oficina = record
cod: integer;
dni: integer;
VExpensa: integer;
end;

vector = array[1..DF] of oficina;

rdl = 0..DF;

procedure CargarOficinas ( var vec: vector; var DL: rdl );
var aux: integer;
begin


writeln( 'Codigo de oficina' );
readln( aux );


while ( aux <> -1 ) do begin 

if ( aux <> -1 ) then begin

DL := DL + 1;

vec[DL].cod := aux;

writeln( 'dni del inquilino' );
readln( vec[DL].dni );

writeln( 'valor de las expensas' );
readln( vec[DL].VExpensa );

writeln( 'Codigo de oficina' );
readln( aux );

end; {FIN IF}


end; {FIN WHILE}

end; {FIN PROC.}


procedure OrdenarInsercion( var vec: vector; DL: rdl );
var i, j: integer; act: oficina; // ACT ES EL ULTIMO ELEMENTO DEL SUBCONJ.
begin

for i := 2 to DL do begin // 

act := vec[i];
j := i - 1;

while ( j >= 1 ) and ( vec[j].cod > act.cod ) do begin // MIENTRAS J ES VALIDO Y V[J] ES MAYOR, CORRE V[J] A DERECHAS.
vec[j + 1] := vec[j];
j := j - 1;
end; {FINAL FOR j}

vec[j + 1] := act; // INSERTA ACT.

end; {FINAL FOR i}

end; {FINAL PROC.}


procedure  OrdenarSeleccion( var vec: vector; DL: rdl);
var i, j, p: integer; item: oficina;// p ES LA POSICION DEL MENOR ELEMENTO.
begin

for i := 1 to ( DL - 1 ) do begin // EL ULTIMO ELEMENTO DEBE SER EL MAYOR SI SUS ANTERIORES YA ESTAN ORDENADOS.

p := i;

for j := (i + 1) to DL do begin // CALC. EL MIN A PARTIR DE i + 1.

if (vec[j].cod < vec[p].cod ) then p := j;

end; {FINAL FOR j}

item := vec[i]; // INTERCAMBIO
vec[i] := vec[p];
vec[p] := item;

end; {FINAL FOR i}

end; {FINAL PROC.}




procedure ImprimirOficinas ( vec: vector; DL: rdl );
var i: integer;
begin


for i := 1 to DL do begin

writeln('Codigo ', vec[i].cod );

writeln('DNI ', vec[i].dni );

writeln('Valor expensas ', vec[i].VExpensa );

end;

end;



var vec: vector; DL: rdl;
begin 

DL := 0;

CargarOficinas( vec, DL );

ImprimirOficinas( vec, DL );



writeln('Vector ordenado, insercion, apartado 2-b ');
writeln();

OrdenarInsercion( vec, DL );
ImprimirOficinas( vec, DL );



writeln('Vector ordenado, seleccion, apartado 2-c ');
writeln();


OrdenarSeleccion( vec, DL );
ImprimirOficinas( vec, DL );





end.