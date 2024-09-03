{

TP2EJ4

Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa el número cero.


Analizando las posibilidades encontramos que: 
Binario (N) es N si el valor es menor a 2. ¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
próxima llamada recursiva? 

Ejemplo: si se ingresa 23, el programa debe mostrar 10111.

}


program TP2EJ4;
uses
sysutils;

type
RB = 0..1;

bin16 = array[1..16] of RB; // vector 16 bits

{===+++===}





procedure convertir_a_binario( n: longint; i: integer; var b: bin16 );
begin


if (n > 0) and (i >= 1) then begin

if (( n MOD 2 = 1)) then b[i] := 1 else b[i] := 0;

i := i - 1;
n := n DIV 2;

writeln(i, ' -> ', b[i]);

convertir_a_binario( n, i, b );
end; // IF

end; // PROC










// PROGR PPAL

var 
i, j: integer;
b: bin16;
n: longint;

begin


i := 16;

for j := 1 to 16 do b[j] := 0;


writeln('Ingrese un numero positivo de 1 a 65535 incluido. o 0 para finalizar');
readln( n );

while (n <> 0) do begin

convertir_a_binario( n, i, b );
writeln(n,  ' en binario de 16-bits es:');

for j := 1 to 16 do write(b[j]);

for j := 1 to 16 do b[j] := 0;


writeln();
writeln('Ingrese un numero positivo de 1 a 65535 incluido. o 0 para finalizar');
readln( n );

end;



end.