/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repaso_3;

public class Gira extends Recital {

    private String nombre;
    private Fecha[] fechas;
    private Fecha fActual;

    public Gira(String nombre, int c_fechas, String banda, int c_temas) {
        super(banda, c_temas);
        this.setNombre(nombre);
        this.fechas = new Fecha[c_fechas];
        this.fActual = null;
    }
    
    
    public void agregarFecha( Fecha f ){
    if (fActual == null) fActual = f;
    else {    
    
    int i = 0;
    while (fechas[i] != null && i < fechas.length) {i++;}    
    
    fechas[i] = f;
    
    
    } // ELSE
    }
    

    public void actuar() {
        
        
    if (fActual == null) fActual = fechas[0];
    else {    
    



    System.out.println("buenas noches " + fActual.getCiudad() );
    super.actuar();
    
    
    int i = 0;
    while ( fechas[i] != null && fechas[i].equals(fActual) == false ) {i ++;}

    this.fActual = fechas[i];




    } // ELSE
    
    
    }
    
    
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Fecha[] getFechas() {
        return fechas;
    }

    public void setFechas(Fecha[] fechas) {
        this.fechas = fechas;
    }

    public Fecha getfActual() {
        return fActual;
    }

    public void setfActual(Fecha fActual) {
        this.fActual = fActual;
    }


}
