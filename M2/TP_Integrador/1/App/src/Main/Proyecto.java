/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Main;


/**
 *
 * @author ta
 */
public class Proyecto {

    private String nombre;

    private int cod;

    private String director;

    private Investigador[] investigadores;

    public Proyecto(String nombre, int cod, String director) {
        this.nombre = nombre;
        this.cod = cod;
        this.director = director;
        this.investigadores = new Investigador[50];

    }

    public void agregarInvestigador(Investigador inv) {

        
        if (this.investigadores == null) {
        System.out.println( "Sin investigadores" );
        investigadores = new Investigador[50];
        
        } else {
            
        int i = 0;
        while (this.investigadores[i] != null && i < this.investigadores.length) { i++; }

        investigadores[i] = inv;
        System.out.println("investigadores[" + i + "]" );
        }
    }

    public double dineroTotalOtorgado() {

        int i = 0;
        int j = 0;
        double t = 0;
        

        while ( i < investigadores.length && investigadores[i] != null ) {
            
            while ( j < investigadores[i].getSubs().length  ) {
                
               if ( investigadores[i].getSubs()[j].isFueOtorgado() == true ) t += this.investigadores[i].getSubs()[j].getMonto();
               j++;

            }
        i++;
        j = 0;


        }
        return t;
    }
    
    
    public void otorgatTodos(Investigador inv ){
    
    for (int i = 0; i < 5; i++) {
    if ( inv.getSubs()[i].isFueOtorgado() == false ) inv.getSubs()[i].setFueOtorgado(true);
    }
    
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String toString() {
        String aux = "Proyecto " + this.getNombre() + "; cod " + this.getCod() + ". con director " + this.getDirector() + 
                " - dinero total " + this.dineroTotalOtorgado() +"\n";

        for (int i = 0; i < this.investigadores.length; i++) {

            if (this.investigadores[i] != null) {
                aux += investigadores[i].toString() + "\n";
            }

        }

        return aux;

    }

}
