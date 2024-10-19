package codigo;

import PaqueteLectura.Lector;


public class Main {
public static void main(String[] args) {


Triangulo T;

double [] l = new double[3];



System.out.println( "Ingrese los lados de un triángulo:" );
for (int i = 0; i < l.length; i++) { l[i] =  Lector.leerDouble(); }



T = new Triangulo( l[0], l[1], l[2], "Rojo", "Blanco" );

T.despintar();
System.out.println( T.toString() );


}
}
