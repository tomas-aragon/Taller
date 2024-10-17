package main;

import PaqueteLectura.Lector;

public class Util {

private int[][] calificaciones;

    public Util() {
        this.calificaciones = new int[5][4]; /* FILAS 5 CLIENTES, COLUMNAS: (0) Atención al cliente (1) Calidad de la comida (2) Precio (3) Ambiente. */
    }
    
    //////
    
    
    public void cargarCal(){
    
    for (int i = 0; i < calificaciones.length; i++){
    
    int j = 0;
    
    while (j < calificaciones[i].length) {    
    
    int k = Lector.leerInt();
    if (k > 0 && k <= 10) { calificaciones[i][j] = k; j++; } else System.out.println("Ingrese una calificacion entre 1 y 10: ");
    
    }
    
    }
    } // cargarCal
    
    
    public void imprimirCal(){
    
    for (int i = 0; i < calificaciones.length; i++){
    
        
    for (int j = 0; j < calificaciones[i].length; j++) { System.out.print(calificaciones[i][j] + " | "); }
    
    System.out.println();

    }
    }
    
    //////

    public int[][] getCalificaciones() {
        return calificaciones;
    }

    public void setCalificaciones(int[][] calificaciones) {
        this.calificaciones = calificaciones;
    }
    
    



    
    

}
