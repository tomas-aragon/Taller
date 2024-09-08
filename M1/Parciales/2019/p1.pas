program proyectos_feria_sientifica;


const
v_nombres: array[1..13] of string = ( 'Carlos', 'Martina', 'Julian', 'Sofia', 'Ernesto', 'Pau', 'Einstein', 'Lucia', 'Ramiro', 'Uou', 'AAu', 'zzz', 'Garcia Lorca' );

v_temas: array[1..3] of string = ( 'Logica', 'Combinatoria', 'Programacion' );


type

voto = record
nombre: string;
tema: string;
end;


proyecto = record
tema: string;
c_votos: integer;
end;


lista = ^nl;

nl = record
dato: proyecto;
sig: lista;
end;

{+++}




alumno = record
nombre: string;
proyectos: lista;
end;

arbol = ^na; // a es un arbol de alumnos, cada alumno tiene un nombre y una lista ordenada de sus proyectos. cada proyecto tiene la cuenta de sus votos

na = record
dato: alumno;
hi: arbol;
hd: arbol;
end;


{===+++===+++===}

// C-1

resultado = record
nombre: string;
cv_maxima: integer;
mejor_tema: string;
end;






{===+++===+++===}





procedure leerVoto( var v: voto );
begin

// writeln( 'Ingrese el nombre del alumno que quiere votar:' );

v.nombre := v_nombres[random(13) + 1];

// writeln( 'Ingrese el proyecto del alumno que quiere votar:' );

v.tema := v_temas[random(3) + 1];

end;


procedure insertarOrdenado( var l: lista; v: voto );
var 
nue, ant, act: lista; p: proyecto;
begin

ant := l; act := l; p.tema := v.tema;

while ((act <> NIL) and (act^.dato.tema < p.tema)) do begin // Recorre
ant := act; act := act^.sig;
end;


{===+++===}

if ((act <> NIL) and (act^.dato.tema = p.tema)) then act^.dato.c_votos := act^.dato.c_votos + 1 // IF A, suma 1 voto


else begin // IF A, Inserta

new(nue); nue^.dato.tema := p.tema; nue^.dato.c_votos := 1;
if (ant = act) then l := nue {Caso: lista vacia o insertar adelante.}
else ant^.sig := nue; {Caso insertar en medio o al final }  
nue^.sig := act; // act es NIL si llego al final o si la lista estaba vacia.

end; // IF A

end; {FINAL PROC.}



procedure cargarVoto( var a: arbol; v: voto ); // A
begin

if (a = NIL) then begin

new(a); a^.dato.nombre := v.nombre;
a^.hi := NIL; a^.hd := NIL;
insertarOrdenado( a^.dato.proyectos, v );

end else if ( v.nombre < a^.dato.nombre ) then cargarVoto( a^.hi, v )

else if (  v.nombre > a^.dato.nombre ) then cargarVoto( a^.hd, v )

else insertarOrdenado( a^.dato.proyectos, v );

end; // PROC.


{===+++===+++===}

// APARTADO C-1


procedure recorrer_lista( l: lista; var r: resultado );
begin

r.cv_maxima := -1;

while (l <> NIL) do begin
if ( l^.dato.c_votos > r.cv_maxima ) then begin
r.cv_maxima :=  l^.dato.c_votos;
r.mejor_tema := l^.dato.tema;
end; // IF
l := l^.sig;

end; // WHILE

end; // PROC.


procedure encontrar_ganador( a: arbol; var ganador: resultado );
var r: resultado;
begin

if (a <> NIL) then begin
encontrar_ganador( a^.hi, ganador );


recorrer_lista( a^.dato.proyectos, r );

if ( r.cv_maxima > ganador.cv_maxima ) then begin // Si hay empates no se consideran, gana el primero en orden alfabetico
ganador.cv_maxima := r.cv_maxima;
ganador.nombre := a^.dato.nombre;
ganador.mejor_tema := r.mejor_tema;
end;


encontrar_ganador( a^.hd, ganador );

end; // IF

end; // PROC.


{===+++===+++===}


// APARTADO C-2

procedure informar_total_votos( l: lista );
var total: integer;
begin

total := 0;

while ( l <> NIL ) do begin

total := total + l^.dato.c_votos;
l := l^.sig;
end;

writeln( total ,' votos en total.');

end;


 
procedure imprimirlista( l: lista );
begin

while ( l <> NIL ) do begin
writeln( 'Proyecto con el tema ', l^.dato.tema, ' obtuvo ', l^.dato.c_votos, ' votos.' );
l := l^.sig;
end;

end;


procedure informar( a: arbol );
begin

if (a <> NIL) then begin
informar( a^.hi );
writeln('Alumno ', a^.dato.nombre );
informar_total_votos( a^.dato.proyectos );
informar( a^.hd );
end;
end; // PROC




{===+++===+++===}



procedure imprimirArbol( a: arbol );
begin

if (a <> NIL) then begin
imprimirArbol( a^.hi );
writeln('Alumno ', a^.dato.nombre );
imprimirlista( a^.dato.proyectos );
imprimirArbol( a^.hd );
end;
end; // PROC






{ PROG PPAL }


var
a: arbol;
v: voto;
n, i: integer;

ganador: resultado; // APARTADO C-1

begin


leerVoto(v);

n := 400;

for i := 1 to n do begin
cargarVoto( a, v );
leerVoto( v );
end;


imprimirArbol(a);


// APARTADO C-1

ganador.cv_maxima := -1;
encontrar_ganador( a, ganador );

writeln( 'El ganador es ', ganador.nombre, '; tiene ', ganador.cv_maxima, ' votos en el tema ', ganador.mejor_tema );



// APARTADO C-2
informar( a );




end.












