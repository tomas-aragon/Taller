package main;

public class Libro {

    private String titulo;

    private Autor autor;

    private String editorial;

    private int aEdicion;

    private double precio;

    public Libro( String t, Autor a, String editorial, int aEdicion, double precio) {

        
        this.autor = a;

        this.titulo = t;

        this.editorial = editorial;
        this.aEdicion = aEdicion;
        this.precio = precio;
    }

   
    
        
    public Libro( ) {}

    
    ////
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Autor getAutor() {
        return autor;
    }

    public void setAutor(Autor autor) {
        this.autor = autor;
    }

    public String getEditorial() {
        return editorial;
    }

    public void setEditorial(String editorial) {
        this.editorial = editorial;
    }

    public int getaEdicion() {
        return aEdicion;
    }

    public void setaEdicion(int aEdicion) {
        this.aEdicion = aEdicion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }


}
