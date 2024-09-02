{

se desea procesar la información de las ventas de productos de un comercio (como máximo 50). 
Implementar un programa que invoque los siguientes módulos:


a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el día de la venta, código del producto (entre 1 y 15) y cantidad vendida
 (como máximo 99 unidades). El código y el dia deben generarse automáticamente (random) y la cantidad se debe leer. El ingreso de las ventas finaliza con el día de venta 0 
 (no se procesa).
b. Un módulo que muestre el contenido del vector resultante del punto a).
c. Un módulo que ordene el vector de ventas por código.
d. Un módulo que muestre el contenido del vector resultante del punto c).
e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos valores que se ingresan como parámetros. 
f. Un módulo que muestre el contenido del vector resultante del punto e).
g. Un módulo que retorne la información (ordenada por código de producto de menor a mayor) de cada código par de producto junto a la cantidad total de productos vendidos.
h. Un módulo que muestre la información obtenida en el punto g).

}

program MODULO_IMPERATIVO_C1;

const DF = 50;

type 
r_dias = 0..31;
r_cod = 0..15;
r_cant = 1..99;
RDL = 0..DF;
     
   
venta = record
dia: r_dias;
cod: r_cod;
cant: r_cant;
end;
			 
vector = array [1..DF] of venta;



elemento = record
cod: r_cod;
total: integer;
end;
	            
	            
lista = ^nodo;

nodo = record
dato: elemento;
sig: lista;
end;
	
	        
{=====++++======}






procedure AlmacenarInformacion (var vec: vector; var DL: RDL);
  

procedure LeerVenta (var prod: venta);
begin

randomize;

write ('Dia: ');
readln( prod.dia );
writeln( prod.dia );

if (prod.dia <> 0) then begin

writeln ( 'Codigo de producto: ' );
prod.cod := random(16) + 1;
writeln( prod.cod );

writeln( 'Ingrese cantidad (entre 1 y 99): ' );
readln( prod.cant );
writeln( prod.cant );

end; {FIN IF}
end; {FIN LeerVenta}

var UnaVenta: venta;
begin

DL := 0;
LeerVenta (UnaVenta);

while ( ( UnaVenta.dia <> 0 ) and ( DL < DF ) ) do begin
DL := DL + 1;
vec[DL] := UnaVenta;
LeerVenta (UnaVenta);
end;

end; {FIN AlmacenarInformacion}





procedure ImprimirVector (vec: vector; DL: RDL);
var i: integer;
begin

write( '------' );
for i:= 1 to DL do write( '---' );

writeln;
write('Codigo: | ');

for i:= 1 to DL do begin

if(vec[i].cod <= 9) then write ('0');
write(vec[i].cod, ' | ');

end; // FIN FOR

writeln;
write ('Cantidad: | ');

for i:= 1 to DL do begin
 
if (vec[i].cant <= 9) then write ('0');
write(vec[i].cant, ' | ');

end; // FIN FOR

writeln;

write( '------' );
for i:= 1 to DL do write( '---' );
writeln;

end; // FIN PROC.



procedure Ordenar (var vec: vector; DL: RDL);
var i, j, pos: RDL; item: venta;
begin

for i := 1 to DL - 1 do begin  // busca el mínimo y guarda en pos la posición

pos := i;
for j := i + 1 to DL do if (vec[j].cod < vec[pos].cod) then pos := j;

// intercambia vec[i] y vec[pos]
item := vec[pos];   
vec[pos] := vec[i];   
vec[i] := item;
end;

end; // FIN PROC.




procedure Eliminar (var vec: vector; var DL: RDL; c1, c2: r_cod);

function BuscarPosicion (vec: vector; DL: RDL; ci: r_cod): RDL;
var pos: RDL;
begin
pos:= 1;
while (( pos <= DL ) and ( ci > vec[pos].cod )) do pos:= pos + 1;
if ( pos > DL ) then BuscarPosicion:= 0 else BuscarPosicion:= pos;
end;


function BuscarPosicionDesde (vec: vector; DL, pos: RDL; cs: r_cod): RDL;
begin
while (( pos <= DL ) and ( cs >= vec[pos].cod )) do pos:= pos + 1;
if ( pos > DL ) then BuscarPosicionDesde:= DL else BuscarPosicionDesde := pos - 1;
end;


// PROC ELIMINAR
var pi, ps, salto, i: RDL; 
begin

pi:= BuscarPosicion (vec, DL, c1);
if (pi <> 0) then begin

ps:= BuscarPosicionDesde (vec, DL, pi, c2);

writeln('pi: ', pi, '; ps: ', ps );

salto := (ps - pi) + 1;

for i := (ps + 1) to DL do vec[i - salto] := vec[ i ];

DL := DL - salto;
end;

end; // FIN Eliminar




procedure GenerarLista (vec: vector; DL: RDL; var l: lista);

procedure AgregarAtras (var l, ult: lista; item: elemento);
begin

// COMPLETAR

end;


var i: RDL; ult: lista; e: elemento;
begin

l:= nil; ult:= nil; i:= 1;

while (i<= DL) do begin
e.cod:=  vec[i].cod;
e.total:= 0;

while ((i<= DL) and (e.cod = vec[i].cod)) do begin
e.total:= e.total + vec[i].cant;
i:= i + 1;
end;

AgregarAtras (l, ult, e);

end; // FIN WHILE

end;




procedure ImprimirLista (l: lista);
begin

// COMPLETAR

end;





// PROGR PPAL
var 
vec: vector;
DL: RDL;
c1, c2: r_cod;
l: lista;

begin

AlmacenarInformacion (vec, DL);
writeln;

if (DL = 0) then writeln ('--- Vector sin elementos ---') else begin
 
writeln ('--- Vector ingresado --->');
writeln;
ImprimirVector (vec, DL);
writeln;

writeln ('--- Vector ordenado --->');
writeln;
Ordenar (vec, DL);
ImprimirVector (vec, DL);

write ('Ingrese codigo inferior: ');
readln (c1);
write ('Ingrese codigo superior: ');
readln (c2);
write ('Eliminando entre cod. ingresados: ');
Eliminar (vec, DL, c1, c2);
ImprimirVector (vec, DL);

{
if (DL = 0) then writeln ('--- Vector sin elementos, luego de la eliminacion ---') else begin
writeln;
writeln ('--- Vector luego de la eliminacion --->');
writeln;
ImprimirVector (vec, DL);

GenerarLista (vec, DL, l);
if (l = nil) then writeln ('--- Lista sin elementos ---')
else begin
writeln;
writeln ('--- Lista obtenida --->');
writeln;
ImprimirLista (l);
end;
end;


}
end; {FIN IF}

end.
