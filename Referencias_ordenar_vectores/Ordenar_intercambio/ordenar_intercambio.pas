program progr_ordenar_intercambio_vector;






const
dimf = 33;
diml = 33;


type

vector_t = array[1..dimf] of integer;



procedure cargar_vec_auto( var vec: vector_t );
var
i: integer;
var_intermedia: integer;
begin

for i := 1 to diml do begin


var_intermedia :=  (i * 1601) MOD 7366;
vec[i] := random( var_intermedia );

end; {Final for}

end;







procedure imprimir_vec( vec: vector_t );
var
i: integer;
begin

for i := 1 to diml do begin

writeln( i,' --> ', vec[i] );

end; {Final for}


end; {Final proc.}


procedure  ordenar( var vec: vector_t; var pases: integer );
var
continuar: boolean;
i, var_intermedia: integer;
contador: integer;
begin

continuar := true;
contador := 0;


while ( continuar ) do begin

for i := 1 to (diml - 1) do begin


if ( vec[i] > vec[(i + 1)] ) then
begin

{ Intercambia valores }

var_intermedia := vec[i];
vec[i] := vec[(i + 1)];
vec[(i + 1)] := var_intermedia;

contador := contador + 1;

end; { Final if }


end; { Final for }

if ( contador = 0 ) then continuar := false;
contador := 0;
pases := pases + 1;


end; { Final while }


end; { Final proc. switch }






var {Progr. Ppal}
vec: vector_t;
pases: integer;

begin

randomize;

cargar_vec_auto( vec );

imprimir_vec( vec );

writeln('');

ordenar( vec, pases );

imprimir_vec( vec );

writeln('');

writeln('Hubo que hacer ', pases, ' recorridos del vector para ordenarlo');




{---}




end.