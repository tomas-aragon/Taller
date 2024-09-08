program proyectos_feria_sientifica;


type

proyecto = record
tema: string;
c_votos: integer;
end;


lista = ^nl;

nl = record
dato: proyecto;
sig: lista;
end;

{+++}




alumno = record
nombre: string;
proyectos: lista;
end;

arbol = ^na; // a es un arbol de alumnos, cada alumno tiene un nombre y una lista ordenada de sus proyectos. cada proyecto tiene la cuenta de sus votos

na = record
dato: alumno;
hi: arbol;
hd: arbol;
end;


{===+++===+++===}



procedure votar( var a: arbol );
begin

end;











begin
	



end.