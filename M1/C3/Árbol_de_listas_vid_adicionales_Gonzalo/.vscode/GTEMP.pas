program arbol_de_listas;
{$R+}



const
DF = 12;
v_emails: array[1..DF] of string = ( 'laura@gmail.com', 'jorge@gmail.com', 'felix@gmail.com', 
									 'emerson.palmer@yahoo.com',  'renata.garcia@hotmail.com', 'izaias-lopez@gmail.com', 'raul.barbieri@gmail.com',
									 'tolstoy@yahoo.com.ar',  'nietzsche@gmail.com',  'a.turing@hotmail.com',  'jim_kajiya@gmail.com',  'c.babagge@yahoo.com.ar'  );

type

RC = 0..1000;

v_fecha = array[1..3] of integer;

cliente = record
cod: RC;
email: string;
end;

mensaje = record
emisor: string;
asunto: string;
fecha: v_fecha;
leido: boolean;
texto: string;
end;


lista = ^nodo_lista;

nodo_lista = record
dato: mensaje;
sig: lista;
end;


c = record
cliente: cliente;
mensajes: lista;
end;

arbol = ^nodo_arbol;

nodo_arbol = record
dato: c;
HI: arbol;
HD: arbol;
end;

data = record
cli: cliente;
msj: mensaje;
end;

{===+++===}

// APARTADO A

procedure leerDatos( var d: data );
var i, j: integer;
begin

d.cli.cod := random(1001); // 0-1000
i := (d.cli.cod MOD DF) + 1; // i va de 1 a 12; mismo i para un cod repetido
d.cli.email := v_emails[ i ];

d.msj.emisor :=  v_emails[ random(DF) + 1 ];
d.msj.fecha[1] := random(12) + 1;
d.msj.fecha[2] :=  random(28) + 1;
d.msj.fecha[3] :=  random(35) + 1990; // 1990-2024
d.msj.asunto := 'Curabitur sed commodo nibh';
j := random(2);
d.msj.leido := (j = 1); // 0-1 ¿es igual a 1? 1 -> TRUE.
d.msj.texto := 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.';
end; // PROC.


procedure agregarAdelante( var l: lista; d: data );
var nue: lista;
begin

new(nue); nue^.dato := d.msj;

nue^.sig := l;

l := nue;

end; // PROC.


procedure cargar( var a: arbol; d: data );
begin

if (a = NIL) then begin

new( a ); 
a^.dato.cliente := d.cli; 
a^.dato.mensajes:= NIL; 
agregarAdelante( a^.dato.mensajes, d );
a^.HI := NIL;
a^.HD := NIL;

end else if ( a^.dato.cliente.cod = d.cli.cod ) then agregarAdelante( a^.dato.mensajes, d )

else if (  a^.dato.cliente.cod < d.cli.cod ) then cargar( a^.HD, d )

else cargar( a^.HI, d ); // IF-ELIF-ELIF-ELSE, IGUALES A IZQ.

end; // PROC


procedure imprimirMensajes( m: lista );
begin


while ( m <> NIL ) do begin
writeln( 'Emisor: ', m^.dato.emisor, '; Fecha: ', m^.dato.fecha[1], '/', m^.dato.fecha[2], '/', m^.dato.fecha[3], '; Asunto: ', m^.dato.asunto, '; leido: ', m^.dato.leido, '; Texto: ', m^.dato.texto );
m := m^.sig;
end;

end; // PROC.


{===+++===}


// B

procedure contar_correos( l: lista; var cantidad: integer );
begin

cantidad := 0;

while (l <> NIL) do begin
if ( l^.dato.leido = false ) then cantidad := cantidad + 1;
l := l^.sig;
end;

end; // PROC



procedure correos_no_leidos( a: arbol; c: RC; var cantidad: integer );
begin

if (a = NIL) then cantidad := 0

else if ( a^.dato.cliente.cod = c ) then contar_correos( a^.dato.mensajes, cantidad )

else if ( a^.dato.cliente.cod < c ) then correos_no_leidos( a^.HD, c, cantidad )

else correos_no_leidos( a^.HI, c, cantidad );

	
end; // PROC.



{===+++===}

// C


function correos_desde( l: lista; dir: string ): integer; // RECORRE LISTA DE MENSAJES Y CUENTA LOS CORR. DESDE DIR
var c: integer;
begin

c := 0;

if (l = NIL) then correos_desde := 0 else begin // IF A

while (l <> NIL) do begin
if ( l^.dato.emisor = dir ) then c := c + 1;
l := l^.sig;
end;

correos_desde := c;

end; // IF A

end; // PROC.

function contar_enviados_desde( a: arbol; dir: string ): integer;
begin

if ( a = NIL ) then contar_enviados_desde := 0

else contar_enviados_desde := correos_desde( a^.dato.mensajes, dir ) + contar_enviados_desde ( a^.HI, dir ) + contar_enviados_desde ( a^.HD, dir );


end; // PROC.





{===+++===}

procedure imprimirOrdenado( a: arbol );
begin


if ( a <> NIL ) then begin

imprimirOrdenado( a^.HI );

writeln('Cliente cod. ', a^.dato.cliente.cod, '; email ', a^.dato.cliente.email );
imprimirMensajes( a^.dato.mensajes );
writeln();

imprimirOrdenado( a^.HD );

end; // IF

end;




// PROG PPAL

var
d: data; a: arbol; i, n: integer; cod: RC; correos_sin_leer: integer; dir: string; numero_correos: integer;

begin

// APARTADO A

a := NIL;

n := 100; i := 1;// N ES EL NUMERO DE MENSAJES TOTAL, PARA NO DEPENDER DE QUE ENTRE UN 0 RANDOM PARA QUE CORTE, Y PODER PROBAR EL PROGR.

leerDatos( d );
while (( i <= n ) and ( d.cli.cod > 0 )) do begin
cargar( a, d );
leerDatos( d );
end;




imprimirOrdenado( a );


// APARTADO B

cod:= 945;
correos_no_leidos( a, cod, correos_sin_leer );


writeln();
writeln( 'El usuario con codigo ', cod, ', tiene ', correos_sin_leer, ' correos sin leer.' );


// APARTADO C


dir := 'renata.garcia@hotmail.com';
numero_correos := 0;
numero_correos := contar_enviados_desde ( a, dir );

writeln( 'El total de correo enviados desde ', dir, ' es: ', numero_correos );

end.