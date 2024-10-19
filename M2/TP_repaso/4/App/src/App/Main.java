package App;

import PaqueteLectura.GeneradorAleatorio;

public class Main {

public static void main(String[] args) {





// Coro(int dimension, String tipo, String nombre, long DNI, int edad, int antiguedad );








// Corista(int tono, String nombre, long DNI, int edad);


Corista C;

Semicircular C1 = new Semicircular( 21, "Coristas por la vida",  "Alfonso Pérez", 33444555, 41, 7 );


for ( int i = 0; i < C1.getDimension(); i++ ) {
    
C = new Corista( i, "Raul Cantarino", 28667889, 32 );
C1.agregarOrdenado(C);
}


System.out.println( C1.toString() );

System.out.println( "Coro semicircular, esta lleno " + C1.estaLleno() + "." );

System.out.println( "Coro semicircular, esta bien formado " + C1.estaBienFormado() + "." );



// PorHileras(int f, int c, String nombre, long DNI, int edad, int antiguedad);

PorHileras C2 = new PorHileras( 8, 13, "Alto coro de egresadors de la escuela téctica de estudios de la computación", "Hernesto Aramburu", 40111222, 33, 2 );


for (int i = 0; i < C2.getDimension()[0]; i++ ) {
    
    
for (int j = 0; j < C2.getDimension()[1]; j++ ) {

C = new Corista( i * j, "Hernesto Aguilar", 3111889, 81 );
C2.agregarCorista(C);
}
}

System.out.println( C2.toString() );

System.out.println( "Coro por hileras, esta lleno " + C2.estaLleno() + "." );

System.out.println( "Coro por hileras, esta bien formado " + C2.estaBienFormado() + "." );





}
    
}
