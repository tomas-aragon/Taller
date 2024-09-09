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


procedure insertar( var a: arbol; n: integer  );
begin

if (a = NIL) then begin

new( a ); a^.hi := NIL; a^.hd := NIL; a^.dato := n;

end else if ( n < a^.dato ) then insertar( a^.hi, n ) 

else insertar( a^.hd, n );

end; // PROC.




procedure imprimir( a: arbol );
begin
if ( a <> NIL ) then begin
imprimir( a^.hi );
writeln( a^.dato );
imprimir( a^.hd );
end; // IF

end; // PROC.


function  minimo( a: arbol ): arbol ; // MINIMO DEVUELVE EL PUNTERO A LA HOJA DE LA IZQ.
begin

if ( a^.hi <> NIL) then begin

minimo := minimo( a^.hi );

end else minimo := a;

end; // FUNC.



procedure borrar( var a: arbol; n: integer; var se_puede: boolean );
var aux: arbol;
begin

if (a = NIL) then se_puede := false { IF A }

else if ( n < a^.dato ) then borrar( a^.hi, n, se_puede ) 

else if ( n > a^.dato ) then  borrar( a^.hd, n, se_puede )

else begin { ELSE-IF A, ENCONTRO EL NODO }

se_puede := true;

if (a^.hi = NIL) then begin { IF B, CASO TIENE SOLAM. HIJO DER. }
aux := a;
a := a^.hd;
dispose( aux );

end else if (a^.hd = NIL)  then begin { CASO TIENE SOLAM. HIJO IZQ. }
aux := a;
a := a^.hi;
dispose( aux );

end else begin { CASO DOS HIJOS }
aux := minimo( a^.hd );
a^.dato := aux^.dato;
borrar( a^.hd, aux^.dato, se_puede );
end; { IF B }

end; { ELSE-IF A }

end; // PROC


// PROG PPAL
var a: arbol; i, n, k: integer; se_puede: boolean;

begin
a := NIL;

for i := 1 to 13 do begin
n := random( 101 );
writeln( n );
insertar( a, n );
end; // FOR

writeln( '---+++---' );

imprimir( a );

se_puede := false;


writeln( 'Ingrese un dato para borrar del arbol:' );
k := 42;
borrar( a, k, se_puede );


writeln();
writeln('se pudo borrar ', k, ': ', se_puede );

writeln('---+++---');
imprimir( a );



end.
