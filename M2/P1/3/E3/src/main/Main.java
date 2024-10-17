package main;


import PaqueteLectura.GeneradorAleatorio;

public class Main {

public static void main(String[] args) {

Util U = new Util( 5 );


U.cargarMatriz();

U.imprimirMatriz();

System.out.println("Fila 1, tiene suma " + U.sumarFila(1) );

U.generarVec();

U.imprimirVec();


System.out.println( U.buscarValor(552) );















}
    
}
