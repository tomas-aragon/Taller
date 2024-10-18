package main;

public abstract class Autor {

private String nombre;

private String bio;

private String origen;




    public Autor(String nombre, String bio, String origen) {
        this.nombre = nombre;
        this.bio = bio;
        this.origen = origen;
    }
    
    
    
    
    ///////

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    @Override
    public String toString() {
        return "Autor " + nombre + ", biografía: " + bio + ", origen " + origen + ".\n";
    }


    

    

}
