/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package app;

/**
 *
 * @author ta
 */
public class Jugador extends Empleado {

private int cPartidos;
private int cGoles;

    public Jugador(int cPartidos, int cGoles, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.cPartidos = cPartidos;
        this.cGoles = cGoles;
    }



    @Override
    public double calcularEfectividad(){
    double e;
    
    e = (double) this.getcGoles() / (double) this.getcPartidos();
    
    
    return e;    
    }

    
    
    
    
    @Override
    public double calcularSueldo() {
    double s;
    
    s = this.getSueldo();
    
    if ( this.calcularEfectividad() > .5  ) { s += this.getSueldo(); }    
    
    return s;
    }
    
    
    // // //
    

    public int getcPartidos() {
        return cPartidos;
    }

    public void setcPartidos(int cPartidos) {
        this.cPartidos = cPartidos;
    }

    public int getcGoles() {
        return cGoles;
    }

    public void setcGoles(int cGoles) {
        this.cGoles = cGoles;
    }



    
@Override
public String toString () {
return "Jugador " + this.getNombre() + " tiene sueldo total " + this.calcularSueldo() + " y una efectividad de " + this.calcularEfectividad() + " (G=" + this.getcGoles() + "/P=" + this.getcPartidos() + ")."; 
}

    
    
    

}
