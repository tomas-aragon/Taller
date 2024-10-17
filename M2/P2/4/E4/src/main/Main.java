package main;

import PaqueteLectura.GeneradorAleatorio;


public class Main {

public static void main(String[] args) {


Casting C = new Casting();

Persona P;


String nombre = GeneradorAleatorio.generarString( 5 ); 
int i = 0;
int d; // DIA


while (i <= 40 && nombre.equals("ZZZ") == false ) {

P = new Persona ( GeneradorAleatorio.generarInt( 1222222222 ), nombre, GeneradorAleatorio.generarInt( 18 ) + 80 );
d = GeneradorAleatorio.generarInt( 5 );

C.anotarPersona(P, d);

i++;
nombre = GeneradorAleatorio.generarString( 5 );
}



int dia = 2;
C.informarDia( dia );

}
    
}
