program busqueda_dicotomica_arboles;



type


abb = ^nodo;

nodo = record
dato: integer;
HI: abb;
HD: abb;
end;


procedure insertar( var a: abb; n: integer );
begin
if ( a = NIL ) then begin { IF A, CASO INSERTAR NODO, HOJA O RAIZ }

new( a ); a^.dato := n; a^.HI := NIL; a^.HD := NIL;

end else begin { IF A, CASO RECORRE }

if (  n <= a^.dato ) then insertar( a^.HI, n ) else insertar( a^.HD, n );

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





procedure busqueda_dicotomica( a: abb; n: integer; var esta: boolean );
begin

if (a = NIL) then esta := false // IF A
else if ( n < a^.dato ) then busqueda_dicotomica( a^.HI, n, esta )
else if ( n > a^.dato ) then busqueda_dicotomica( a^.HD, n, esta )
else esta := true; // IF A


end; // PROC



{===+++===}






function busqueda_dicotomica( a: abb; n: integer ): boolean; // FUNC NO FUNCA
begin

if (a = NIL) then busqueda_dicotomica := false // IF A

else if ( n < a^.dato ) then busqueda_dicotomica( a^.HI, n )

else if ( n > a^.dato ) then busqueda_dicotomica( a^.HD, n )

else busqueda_dicotomica := true; // IF A


end;








var a: abb; n, i, k: integer; esta, b: boolean; e: integer;


begin


k := 63; // 2^7 - 1. 7 niveles

for i := 1 to k do begin	
n := random(1000) + 1;
insertar( a, n );
end;

writeln();
enorden( a );
writeln();

e := 549;

writeln();
writeln( 'Buscando ', e, ':' );
busqueda_dicotomica( a, e, esta );
writeln( e, ' esta: ', esta );


e := 187;

writeln();
writeln( 'Buscando c. funcion ', e, ': NO FUNCA' ); // NO FUNCA
b := busqueda_dicotomica( a, e );
writeln( e, ' esta: ', b );

end.