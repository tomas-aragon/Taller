program referencia_abb_cargar_enorden_postorden_preorden;



type


abb = ^nodo;

nodo = record
dato: integer;
HI: abb;
HD: abb;
end;


procedure cargar( var a: abb; n: integer );
begin
if ( a = NIL ) then begin { IF A, CASO INSERTAR NODO, HOJA O RAIZ }

new( a ); a^.dato := n; a^.HI := NIL; a^.HD := NIL;

end else begin { IF A, CASO RECORRE }

if (  n <= a^.dato ) then cargar( a^.HI, n ) else cargar( a^.HD, n );

end; { IF A }

end; { PROC. }




procedure enorden(  a: abb );
begin
if ( a <> NIL ) then begin
	
enorden( a^.HI );
writeln( a^.dato );
enorden( a^.HD );
	
end; { IF A }
end; { PROC. }



procedure preorden(  a: abb );
begin
if ( a <> NIL ) then begin
	
writeln( a^.dato );
preorden( a^.HI );
preorden( a^.HD );

end; 

end; { PROC. }



procedure postorden(  a: abb );
begin
if ( a <> NIL ) then begin

preorden( a^.HI );
preorden( a^.HD );
writeln( a^.dato );
	
end; 
	
end; { PROC. }


var a: abb; n, i, k: integer;


begin


k := 63; // 2^7 - 1. 7 niveles

for i := 1 to k do begin	
n := random(1000) + 1;
writeln( 'Carga ', n );
cargar( a, n );
end;

writeln( 'Enorden:' );
enorden( a );


writeln();

writeln( 'Preorden:' );
preorden( a );



writeln();

writeln( 'Postorden:' );
postorden( a );


end.