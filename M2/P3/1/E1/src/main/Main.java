package main;

import PaqueteLectura.Lector;

public class Main {


public static void main(String[] args) {

    
Triangulo t;

double[] vec = new double[3];

System.out.println( " Ingrese los lados del triángulo: " );
    
for (int i = 0; i < 3; i++) { vec[i] = Lector.leerDouble(); }

t = new Triangulo( vec, "Amarillo", "Negro" );


System.out.println( "Triángulo de lados " + t.getLados()[0] + ", " + t.getLados()[1] + ", " + t.getLados()[2] + ". Tiene área " +  (double) t.calcArea() + " y perímetro " + t.calcPerimetro() );

    





    }
    
}
