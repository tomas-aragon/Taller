program Aragon_Tomas;


const vd: array[1..5] of char = ('L','M','N','O', 'P');


type
atencion = record
matricula: integer;
dni: integer;
mes: integer;
diagnostico: char;
end;


dato_arbol = record
dni: integer;
diagnostico: char;
end;



arbol = ^na;

na = record
dato: dato_arbol;
hi: arbol;
hd: arbol;
end;



v_meses = array[1..12] of arbol;


{---=== APARTADO A---===}


// A

procedure leerAtencion( var r : atencion ); 
begin


r.matricula := random(10001);
if ( r.matricula <> 0 ) then begin


r.dni := random(5000) + 12000;

r.mes := random(12) + 1;

r.diagnostico := vd[random(5) + 1];

end;

end; // PROC



procedure insertarArbol( var a: arbol; da: dato_arbol  );
begin

if ( a = NIL ) then begin

new (a); a^.dato := da;
a^.hi := NIL;  a^.hd := NIL;

end else if ( da.dni < a^.dato.dni ) then insertarArbol( a^.hi, da )

else insertarArbol( a^.hd, da );



end; // PROC



procedure cargarAtenciones( var v: v_meses; r: atencion );
var da: dato_arbol;
begin

da.dni := r.dni;
da.diagnostico := r.diagnostico;


insertarArbol(v[r.mes], da );



end; // PROC

procedure imprimirArbol( a: arbol);
begin

if (a <> NIL) then begin
imprimirArbol(a^.hi);

writeln(  'DNI paciente ', a^.dato.dni, '; Diagnostico ', a^.dato.diagnostico );

imprimirArbol(a^.hd);
end; // IF

end;


{---=== APARTADO B ---===}


// B


procedure contar_a_por_mes( a: arbol; var c: integer);
begin
if (a <> NIL) then begin 

contar_a_por_mes(a^.hi, c);

c:= c + 1;

contar_a_por_mes(a^.hd, c);

end; // IF

end; // PROC







{---PROG PPAL---}

var
v: v_meses; i, c: integer; r: atencion;

begin


for i := 1 to 12 do v[i] := NIL;

leerAtencion (r);

while ( r.matricula <> 0 ) do begin
cargarAtenciones(  v, r  );
leerAtencion(r);
end;



for i := 1 to 12 do begin

writeln( '---> Mes: ', i );
imprimirArbol( v[i] );

end;


for i := 1 to 12 do begin

c := 0;
contar_a_por_mes( v[i], c );
writeln( 'Cantidad atenciones mes ', i,' es ', c );

end;



end.
