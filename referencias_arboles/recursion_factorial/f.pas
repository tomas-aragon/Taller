


program factorial_recursivo;


function factorial( n: integer ):integer;
begin

if (n = 1) then factorial := 1 
else factorial := n * factorial( n - 1 );

end;// FUNC.


var n, f: integer;
begin
	
writeln( 'Ingrese un numero entero mayor o igual que 1: ', f );

readln(n);

f := factorial( n );
writeln( 'Factorial de ', n, ': ', f );

end.