package main;

public class Cliente {


private String nombre;

private int DNI; 

private int edad;

public Cliente(String nombre, int DNI, int edad) {
    this.nombre = nombre;
    this.DNI = DNI;
    this.edad = edad;
}





public int getDNI() {
    return DNI;
}

public void setDNI(int DNI) {
    this.DNI = DNI;
}

public String getNombre() {
    return nombre;
}

public void setNombre(String nombre) {
    this.nombre = nombre;
}

public int getEdad() {
    return edad;
}

public void setEdad(int edad) {
    this.edad = edad;
}






}
