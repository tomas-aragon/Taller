package app;


public class Main {


public static void main(String[] args) {

Trabajador T;

Persona P;


// Persona(String nombre, long DNI, int edad) {}
P = new Persona( "Joaquín Sánchez", 42332771, 72 );

// Trabajador(String nombre, long DNI, int edad, String tarea ) {}
T = new Trabajador( "Maria Pérez saens Peña", 42332771, 31, "Paisajista" );


System.out.println( T.toString() );
System.out.println( P.toString() );



}
    
}
