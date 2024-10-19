/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package app;

/**
 *
 * @author ta
 */
public class Entrenador extends Empleado {
 
    
    
    
    private int campeonatosGanados;

    public Entrenador(int campeonatosGanados, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.campeonatosGanados = campeonatosGanados;
    }
    
    @Override
    public double calcularEfectividad(){
    double e;
    
    e = (double) this.getCampeonatosGanados() / (double) this.getAntiguedad();
    
    
    return e;    
    }
    
    
    
    
    
    @Override
    public double calcularSueldo() {
    double s;
    
    s = this.getSueldo();
    
    if ( this.getCampeonatosGanados() < 5 && this.getCampeonatosGanados() >= 0 ) { s += (double) this.getCampeonatosGanados() * 5000.00;
    
    } else if ( this.getCampeonatosGanados() >= 5 && this.getCampeonatosGanados() <= 10 ) {     s += (double) this.getCampeonatosGanados() * 30000.00;

    } else if ( this.getCampeonatosGanados() > 10 ) { s += (double) this.getCampeonatosGanados() * 50000.00; }
    
    
    
    return s;
    }
    
    
    
    /// /// ///

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    
    
    
    
@Override
public String toString () {
return "Entrenador " + this.getNombre() + " tiene sueldo total " + this.calcularSueldo() + " y una efectividad de " + this.calcularEfectividad() + " (C=" + this.getCampeonatosGanados() + "/A=" + this.getAntiguedad() + ")."; 
}
    
    
}
