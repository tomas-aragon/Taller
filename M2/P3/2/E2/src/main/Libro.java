package main;

public class Libro extends Autor {

    private String titulo;

    private Autor primerAutor;

    private String editorial;

    private int aEdicion;

    private double precio;

    public Libro(String titulo, String nombre, String bio, String origen, String editorial, int aEdicion, double precio) {

        super(nombre, bio, origen);

        this.titulo = titulo;

        this.editorial = editorial;
        this.aEdicion = aEdicion;
        this.precio = precio;
    }

    ////
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Autor getPrimerAutor() {
        return primerAutor;
    }

    public void setPrimerAutor(Autor primerAutor) {
        this.primerAutor = primerAutor;
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

    @Override
    public String toString() {
        return "Título: " + this.getTitulo() + "\n" + super.toString()
                + "Editorial " + this.getEditorial() + ", año de la edición " + this.getaEdicion() + ", precio " + this.getPrecio() + ".\n";
    }

}
