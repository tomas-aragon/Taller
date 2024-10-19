/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Main;

public class App {

public static void main(String[] args) {





Estacionamiento E = new Estacionamiento("Estacionamiento Gran Gorge", "55 e 1 y 2");

Auto A1 = new Auto("William Thomas", "AB 202 HY");
E.estacionarAuto(A1, 2, 0);


Auto A2 = new Auto("Fabritzio Gesungericht", "AF 666 DE");
E.estacionarAuto(A2, 3, 2);


Auto A3 = new Auto("Umberto Eco", "RE 332 FI");
E.estacionarAuto(A3, 3, 5);


Auto A4 = new Auto("Hernán Rubio", "Au 565 CH");
E.estacionarAuto(A4, 2, 4);


Auto A5 = new Auto("Ramiro Garcia Fernandez", "AU 111 RO");
E.estacionarAuto(A5, 3, 9);


Auto A6 = new Auto("Helena Hauf", "EN 323 TE");
E.estacionarAuto(A6, 1, 9);


/*===+++===*/

System.out.println( E.toString() );

int plaza = 0;
System.out.println( "Cantidad de autos en la plaza " + plaza + " es " + E.contarAutosPlaza( plaza ) );

String patente = "AU 111 RO";

System.out.println( "Auto con patente " + patente + " en " + E.buscarAutoPatente( patente ) );


    }
    
}
