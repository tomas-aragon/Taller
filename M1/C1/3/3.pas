{
TP1EJ3

netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce:

código de película, código de género, 1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror, y puntaje promedio otorgado por las críticas.


Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.

b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a).

c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).


}

program TP1EJ3;

const
DF = 8;

type
RGeneros = 1..8;
RPuntajes = 1..5;
RDL = 1..DF;


pelicula = record
cod: integer;
genero: RGeneros;
puntaje: RPuntajes;
end;

{---}
lista = ^nodo;

nodo = record
dato: pelicula;
sig: lista;
end;

{---}

// Apartado 3-B

maximos = record
cod: integer;
genero: RGeneros;
puntaje: RPuntajes;
end;



v_generos = array[1..DF] of maximos;

{---+++---}


procedure CargarPeliculas( var l: lista; var c: integer ); // Apartado 3-A
var nue, ant, act: lista; genero: RGeneros;
begin

new(nue);

nue^.dato.cod := c;


writeln('Ingrese su cod. de genero, 1..8');
readln( nue^.dato.genero );


writeln('Ingrese su puntaje, 1..5');
readln( nue^.dato.puntaje );

{===+++===}

ant := l; act := l; genero := nue^.dato.genero;


while ( act <> NIL ) and ( genero > act^.dato.genero ) do begin // recorre
ant := act;
act := act^.sig;
end; {WHILE} 

while ( act <> NIL ) and ( genero = act^.dato.genero ) do begin
ant := act;
act := act^.sig;
end; {WHILE} 



if ( ant = act ) then begin // caso lista vacia
l := nue;
end else begin
ant^.sig := nue;
end;

nue^.sig := act;

end; {FIN PROC.}







procedure BuscarPuntajeMaximo( l: lista; var vc: v_generos; var DL: RDL ); // Apartado 3-B, por cada genero guardar en un vector el cod. de la de mayor puntaje.
var puntaje, cod, genero: integer;
begin
while ( l <> NIL ) and ( l^.dato.genero <= 8 ) do begin

puntaje := -1; genero := l^.dato.genero;

while ( l <> NIL ) and ( genero = l^.dato.genero ) do begin

if (l^.dato.puntaje > puntaje) then begin
puntaje := l^.dato.puntaje;
cod := l^.dato.cod;
end;

l := l^.sig;
end; {WHILE}


vc[genero].cod := cod;
vc[genero].puntaje := puntaje;
vc[genero].genero := genero;

DL := DL + 1;

end; {FOR i}


end; {PROC.}


procedure OrdenarSeleccion( var v: v_generos; DL: RDL );
var i, j: integer; aux: maximos; posicion: integer;
begin

for i := 1 to (DL - 1) do begin

posicion := i;

for j := (posicion + 1) to DL do begin
if (v[j].puntaje <= v[posicion].puntaje) then posicion := j;
end; {FOR}


aux := v[posicion];
v[posicion] := v[i];
v[i] := aux;


end;

end; {PROC.}




{===+++===}

procedure ImprimirPeliculas( l: lista );
begin

while (l <> NIL) do begin
writeln( 'Codigo ', l^.dato.cod, '; genero ', l^.dato.genero, '; puntaje ', l^.dato.puntaje );
l := l^.sig
end;


end; {PROC.}


procedure ImprimirVector( vc: v_generos; DL: RDL );
var i: integer;
begin


for i := 1 to DL do writeln( 'Genero ', vc[i].genero,'; Puntaje maximo ', vc[i].puntaje, '; codigo ', vc[i].cod );


end; {PROC.}









var
l: lista; c: integer; vc, v: v_generos; i, j: integer; DL: RDL;
begin

l := NIL; DL := 0;

writeln('Ingrese el cod. de la pelicula');
readln( c );

while (c <> -1) do begin
CargarPeliculas( l, c );
writeln('Ingrese el cod. de la pelicula');
readln( c );
end;


ImprimirPeliculas( l );


for i := 1 to 8 do begin // Incicializa vc en -1
vc[i].cod := -1;
vc[i].puntaje := -1;
end;


BuscarPuntajeMaximo( l, vc, DL ); // Apartado 3-B, por cada genero guardar en un vector el cod. de la de mayor puntaje.


writeln(  );
writeln( 'Películas con mayor puntaje por género:' );
for i := 1 to 8 do if vc[i].cod <> -1 then writeln( 'Genero ', i,'; Puntaje maximo ', vc[i].puntaje, '; codigo ', vc[i].cod ) else writeln( 'Género sin películas' );

j := 1;

for i := 1 to 8 do begin // genero un subvector de vc: v
if vc[i].cod <> -1 then begin
v[j] := vc[i]; j := j + 1;
end;
end;

writeln(); // APartado C
writeln( 'v_DL ', DL );
for i := 1 to DL do writeln( 'Genero ' , v[i].genero,'; Puntaje maximo ', v[i].puntaje, '; codigo ', v[i].cod );


writeln();
writeln('Ordenando...');
OrdenarSeleccion( v, DL );
ImprimirVector( v, DL );



writeln();
writeln( 'Apartado D:' );
writeln( 'Pelicula con mayor puntaje cod ', v[DL].cod, '. Pelicula con menor puntaje cod. ', v[1].cod );


end.