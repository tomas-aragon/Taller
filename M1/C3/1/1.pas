{

a. Implemente un módulo que almacene información de socios de un club en un árbol binario
de búsqueda. De cada socio se debe almacenar número de socio, nombre y edad. La carga
finaliza con el número de socio 0 y el árbol debe quedar ordenado por número de socio. La
información de cada socio debe generarse aleatoriamente.

b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que :

i. Informar los datos de los socios en orden creciente.

ii. Informar los datos de los socios en orden decreciente.

iii. Informar el número de socio con mayor edad. Debe invocar a un módulo recursivo que
retorne dicho valor.

iv. Aumentar en 1 la edad de los socios con edad impar e informar la cantidad de socios
que se les aumentó la edad.

vi. Leer un nombre e informar si existe o no existe un socio con ese nombre. Debe invocar
a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.

vii. Informar la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
cantidad.

viii. Informar el promedio de edad de los socios. Debe invocar a un módulo recursivo que
retorne el promedio de las edades de los socios.

}


program TP1A1; // TP1 APARTADO 1

uses
sysutils, strings;

const
v_nombres: array[1..3] of string = ( 'Alberto', 'Susana', 'Pablo' );

type

socio = record
nro: integer;
nombre: string;
edad: integer;
end;

arbol = ^nodo;

nodo = record
dato: socio;
HI: arbol;
HD: arbol;
end;


procedure generar_socio( var s: socio );
begin
s.nro := random(101);
s.nombre := v_nombres[random(3) + 1];
s.edad := random(83) + 18; // de 18-100.
end; // PROC.




procedure cargar_ordenado( var a: arbol; s: socio );
begin

if ( a = NIL ) then begin // IF A, CASO INSERTAR NODO, HOJA O RAÍz

new( a ); a^.dato := s; a^.HI := NIL; a^.HD := NIL;

end else if (s.nro > 0 ) then begin // IF A, CASO RECORRE

if ( s.nro <= a^.dato.nro ) then cargar_ordenado( a^.HI, s ) else cargar_ordenado( a^.HD, s );

end; // IF A

end; // PROC.



procedure imprimir_creciente( a: arbol );
begin

if ( a <> NIL ) then begin
imprimir_creciente( a^.HI );

writeln( 'Socio nro: ', a^.dato.nro, '; nombre: ', a^.dato.nombre, '; edad: ', a^.dato.edad );

imprimir_creciente( a^.HD );

end;

end; // PROC.






procedure imprimir_decreciente( a: arbol );
begin

if ( a <> NIL ) then begin


imprimir_decreciente( a^.HD );

writeln( 'Socio nro: ', a^.dato.nro, '; nombre: ', a^.dato.nombre, '; edad: ', a^.dato.edad );

imprimir_decreciente( a^.HI );



end;

end; // PROC.




procedure buscar_mayor( a: arbol; var mayor: socio );
begin

if (a <> NIL) then begin

buscar_mayor( a^.HI, mayor );

if ( a^.dato.edad > mayor.edad ) then begin mayor.nro := a^.dato.nro; mayor.edad := a^.dato.edad; mayor.nombre := a^.dato.nombre; end;

buscar_mayor( a^.HD, mayor );

end;

end; // PROC.





procedure contar_edad_impar( var a: arbol; var cantidad: integer );
begin

if (a <> NIL) then begin

contar_edad_impar( a^.HI, cantidad );

if ( (a^.dato.edad MOD 2) = 1) then begin
writeln( 'Entro edad impar: socio nro: ', a^.dato.nro, '; nombre: ', a^.dato.nombre, '; edad: ', a^.dato.edad );
a^.dato.edad  := a^.dato.edad + 1; 
cantidad := cantidad + 1;
end;

contar_edad_impar( a^.HD, cantidad );

end;

end; // PROC.





procedure calc_promedio_edad( var a: arbol; var c, suma: integer );
begin

if (a <> NIL) then begin

calc_promedio_edad( a^.HI, c, suma );

suma  := suma + a^.dato.edad;
c := c + 1;

calc_promedio_edad( a^.HD, c, suma );

end;

end; // PROC.






procedure buscar_nombre( a: arbol; nombre: string; var esta: boolean ); //B-6
begin

if (a <> NIL) then begin

buscar_nombre( a^.HI, nombre, esta );

if ( a^.dato.nombre = nombre ) then esta := true;

buscar_nombre( a^.HD, nombre, esta );

end;

end; // PROC.







procedure contar_socios( a: arbol; var c_socios: integer ); // B-7
begin

if (a <> NIL) then begin

contar_socios( a^.HI, c_socios );
c_socios := c_socios + 1;
contar_socios( a^.HD, c_socios );

end;

end; // PROC.


// PROG. PPAL.
var a: arbol; s, mayor: socio; cantidad: integer; nombre: string; esta: boolean; c_socios: integer; suma: integer;
begin

a := NIL; s.nro := MAXINT;

while (s.nro > 0) do begin
generar_socio( s );
cargar_ordenado( a, s );
end;

writeln('Imprimir creciente, apartado b-1');
imprimir_creciente( a );
writeln('Imprimir decreciente, apartado b-2');
imprimir_decreciente( a );

mayor.edad := -1;
buscar_mayor( a, mayor );

writeln( 'El numero de socio, del cliente que tiene más edad (' , mayor.edad, ') es ', mayor.nro, '.' );


cantidad := 0;
contar_edad_impar( a, cantidad );
writeln( 'Cantidad de socios con edades impar, b-4: ' , cantidad );



writeln('Ingrese un nombre para buscarlo:');
readln( nombre );
buscar_nombre( a, nombre, esta ); //B-6
writeln( nombre, ' esta en el arbol ', esta );



imprimir_creciente( a );

c_socios := 0;
contar_socios( a, c_socios );
writeln( 'Cantidad de socios, b-7: ' , c_socios );

suma := 0; cantidad := 0;
calc_promedio_edad( a, c_socios, suma );

writeln( 'Edad promedio, b-8: ' , suma / c_socios:10:3 );





end.
