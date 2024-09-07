program Horas_de_trabajo_2021_T2;

type

RD = 0..31;
RM = 1..12;
RH = 1..8;
{
dia_laboral = record // NODO L_DIAS
dia: RD;
mes: RM;
horas: RH;
end;

l_dias = ^nodo;

nodo = record
dato: dia_laboral;
sig;

// // //

empleado = record
nro: integer;
horas: l_dias;
end;

}


{===+++===}


dia_laboral = record // NODO L_DIAS
nro_empleado: integer;
dia: RD;
mes: RM;
horas: RH;
end;

arbol = ^na;

na = record
dato: dia_laboral;
hi: arbol;
hd: arbol;
end;


lista = ^nl; // B


nl = record
dato: dia_laboral;
sig: lista;
end;


{===+++===+++===}




procedure leerDia( var d: dia_laboral );
begin

d.nro_empleado := random(1000) + 1;

d.dia := random(31);
d.mes := random(12) + 1;
d.horas := random(8) + 1;
end;// PROC.



procedure cargarArbol( var a: arbol; d: dia_laboral ); // A
begin

if (a = NIL) then begin

new( a ); a^.dato := d; a^.hi := NIL; a^.hd := NIL;

end else if (d.nro_empleado < a^.dato.nro_empleado) then cargarArbol(a^.hi, d)

else cargarArbol(a^.hd, d);


end; // PROC.

{===+++===}

// B


procedure insertarAdelante( var l: lista; d: dia_laboral );
var nue: lista;
begin

new( nue ); nue^.dato := d;

nue^.sig := l;
l := nue;

end;// PROC.




procedure encontrar_dias_rango( a: arbol; x, y: integer; var l: lista );
begin

if (a <> NIL) then begin // IF A


encontrar_dias_rango( a^.hi, x, y, l );

if ( (a^.dato.horas >= x) and (a^.dato.horas <= y) ) then insertarAdelante( l, a^.dato );

encontrar_dias_rango( a^.hd, x, y, l );


end; // IF A

end; // PROC



{===+++===+++===}

// APART. C


function calc_total_horas( l: lista ): integer;
begin

if (l <> NIL) then calc_total_horas := l^.dato.horas + calc_total_horas(l^.sig);

end;





{===+++===}




procedure imprimirArbol( a: arbol );
begin

if (a <> NIL) then begin

imprimirArbol(a ^.hi );

writeln( 'numero de empleado ', a^.dato.nro_empleado, '; dia ', a^.dato.dia, '; mes ', a^.dato.mes, '; horas trabajadas ', a^.dato.horas );

imprimirArbol( a^.hd );

end;

end; // PROC.

function cortar( d: dia_laboral ): boolean;
begin
cortar := false;
end; // PROC.



procedure imprimirlista_r( l: lista );
begin

if (l <> NIL) then begin
writeln( 'numero de empleado ', l^.dato.nro_empleado,  '; dia ', l^.dato.dia, '; mes ', l^.dato.mes, '; horas trabajadas ', l^.dato.horas );
l := l^.sig;
imprimirlista_r( l );
end; // IF

end; // PROC.







procedure imprimirlista( l: lista );
begin

while (l <> NIL) do begin
writeln( 'numero de empleado ', l^.dato.nro_empleado,  '; dia ', l^.dato.dia, '; mes ', l^.dato.mes, '; horas trabajadas ', l^.dato.horas );
l := l^.sig;
end;

end; // PROC.





{PROG PPAL}


var 
a: arbol;
d: dia_laboral;
l: lista; // APART. B
x, y: integer;


t_horas: integer; // APART. C

begin
	
a := NIL; l := NIL;


leerDia(d);


while( d.dia > 0 ) do begin
cargarArbol(a, d);
leerDia(d);
end;



imprimirArbol(a);

x := 8; y := 8;

encontrar_dias_rango( a, x, y, l );
writeln( 'Empleados que trabajaron entre ', x,  ' y ', y, ' horas son:' );

imprimirlista( l );


t_horas := calc_total_horas( l );
writeln( 'El total de las horas de todos estos es ', t_horas );



end.