package main;

import PaqueteLectura.Lector;


public class Main {

public static void main(String[] args) {

    
Circulo C;

System.out.println( "Ingrese el radio del circulo" );
double r = Lector.leerDouble();

C = new Circulo( r );




System.out.println( "El circulo de radio " + C.getRadio() + " tiene área " + C.calcArea() + " y perímetro " + C.calcPerimetro() + "." );



    }
    
}
