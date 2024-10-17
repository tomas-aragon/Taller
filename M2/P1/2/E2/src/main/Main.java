package main;


import PaqueteLectura.GeneradorAleatorio;

public class Main {

public static void main(String[] args) {

int DF = 15;

double[] jugadores;


Util U;
U = new Util();

jugadores = new double[DF];

for (int i = 0; i < jugadores.length; i++) {

jugadores[i] = GeneradorAleatorio.generarDouble( 40 ) + 75;

}


double p;
p = U.calcAlturaPromedio(jugadores);


int c;
c = U.contarPorEncimaProm(p, jugadores);


for ( int i = 0; i < jugadores.length; i++ ) { System.out.println( "Jugador " + i + " tiene altura " + jugadores[i] ); }

System.out.println( "Altuta promedio " + p + ", jugadores por encima de este promedio " + c );


}
    
}
