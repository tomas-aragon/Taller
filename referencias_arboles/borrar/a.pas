program borrar_nodo_arbol;


type


arbol = ^nodo;


nodo = record
dato: integer;
p: arbol;
hi: arbol;
hd: arbol;
end;

{===+++===}


procedure insertar( var a: arbol; n: integer; var ant: arbol );
begin

if (a = NIL) then begin
new( a ); a^.hi := NIL; a^.hd := NIL; a^.dato := n; a^.p := ant; 
end else if ( n < a^.dato ) then begin
ant := a;
insertar( a^.hi, n, ant ) 
end else begin
ant := a;
insertar( a^.hd, n, ant );
end;


end; // PROC


procedure imprimir( a: arbol );
begin
if ( a <> NIL ) then begin
imprimir( a^.hi );
writeln( a^.dato );
imprimir( a^.hd );
end; // IF

end; // PROC.


procedure borrar( var a: arbol; n: integer; se_puede: boolean );
begin



if (a = NIL) then se_puede := false

else if ( n < a^.dato ) then borrar( a^.hi, n, se_puede ) 

else if ( n > a^.dato ) then  borrar( a^.hd, n, se_puede )

else begin // ENCONTRO EL NODO


if (a^.hi = NIL) and (a^.hd = NIL) then dispose( a ) // CASO HOJA, TENGO QUE PODER DERREFERENCIAR AL PADRE!

else if (a^.hi = NIL) xor (a^.hd = NIL) then // CASO UN SOLO HIJO

else if (a^.hi <> NIL) and (a^.hd <> NIL) then // CASO DOS HIJOS


end; // IF

end; // PROC


// PROG PPAL
var a: arbol; i, n: integer; se_puede: boolean; ant: arbol;

begin
a := NIL;

for i := 1 to 13 do begin
n := random( 101 );
writeln( n );
insertar( a, n, ant );
end; // FOR

writeln( '---+++---' );

imprimir( a );

//writeln( 'Ingrese un dato para borrar del arbol:' );
// readln( k );
// se_puede := false;
// borrar( a, k, se_puede );

//imprimir( a );

writeln( 'ant^.dato ', ant^.dato );



end.
