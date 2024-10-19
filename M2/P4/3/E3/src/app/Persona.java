package app;

public class Persona {
    
    
    private String nombre;
    
    private long DNI;
   
    private int edad;

    public Persona(String nombre, long DNI, int edad) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
    }

    
    
    
    
    
    
    
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public long getDNI() {
        return DNI;
    }

    public void setDNI(long DNI) {
        this.DNI = DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    @Override
    public String toString() {
        return "Mi nombre es " + this.getNombre() + ", mi DNI es " + this.getDNI() + ", tengo " + this.getEdad() + " años.";
    }
    
   
    
    
    
    
    
}
