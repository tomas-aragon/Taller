package main;

import PaqueteLectura.GeneradorAleatorio;
public class Main {

public static void main(String[] args) {


Campeonato C = new Campeonato();

Partido P;
P = new Partido( "Boca", "River", GeneradorAleatorio.generarInt(11), GeneradorAleatorio.generarInt(11) );


int i = 0;
while ( P.getEquipoVisitante().equals("ZZZ") == false && i < C.getcPartidos() ) {

C.agregarPartido(P);
System.out.println( P.toString() );
P = new Partido( "Boca", "River", GeneradorAleatorio.generarInt(5), GeneradorAleatorio.generarInt(5) );
i++;
}

System.out.println( "River ganó " + C.contarVictoriasRiver() + " veces." );
System.out.println( "Boca hizo " + C.contarGolesBocaLocal() + " goles de local en las 20 fechas del campeonato." );


}
    
}
