package app;



import PaqueteLectura.Lector;

public class App {

    

public static void main( String[] args ) {

System.out.println("Ingrese nombre:");
String nombre = Lector.leerString();


System.out.println("Ingrese DNI:");
int DNI = Lector.leerInt();

System.out.println("Ingrese edad:");
int edad = Lector.leerInt();



Persona p = new Persona( nombre, DNI, edad );
System.out.println(p.toString());


}
    
}
