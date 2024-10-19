/*
* Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
* Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
*/
package app;

/**
*
* @author ta
*/
public abstract class Empleado {

private String nombre;
private double sueldo;
private int antiguedad;

public Empleado(String nombre, double sueldo, int antiguedad) {
this.nombre = nombre;
this.sueldo = sueldo;
this.antiguedad = antiguedad;
}

public abstract double calcularEfectividad();

public abstract double calcularSueldo();


public double getSueldo() {
double s;
s = this.getBasico();
s += (double) this.getAntiguedad() * (this.getBasico() / 10.00);
return s;
}



/// /// ///

public String getNombre() {
return nombre;
}

public void setNombre(String nombre) {
this.nombre = nombre;
}

public double getBasico() {
return sueldo;
}

public void setSueldo(double sueldo) {
this.sueldo = sueldo;
}

public int getAntiguedad() {
return antiguedad;
}

public void setAntiguedad(int antiguedad) {
this.antiguedad = antiguedad;
}

}
