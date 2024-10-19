package app;

public class Trabajador extends Persona {

    private String tarea;

    public Trabajador(String nombre, long DNI, int edad, String tarea ) {
        super(nombre, DNI, edad);
        this.tarea = tarea;
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }

    @Override
    public String toString() {
        return super.toString() + " Soy " + this.getTarea() + ".";
    }
    
    
    
    
    

}
