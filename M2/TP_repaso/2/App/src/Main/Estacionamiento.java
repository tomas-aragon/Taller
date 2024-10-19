/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Main;

public class Estacionamiento {

private String nombre;
        
private String direccion;
        
private float horaApertura;
        
private float horaCierre;
        






private Auto[][] lugares; // [piso][plaza]

    public Estacionamiento( String nombre, String direccion ) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = 8;
        this.horaCierre = 21;
        this.lugares = new Auto[5][10];
    }

    public Estacionamiento(String nombre, String direccion, float horaApertura, float horaCierre, int pisos, int plazas ) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.setHoraApertura( horaApertura );
        this.setHoraCierre( horaCierre );
        this.lugares = new Auto[pisos][plazas];
    }
    
    public void estacionarAuto( Auto a, int piso, int plaza ) {
    
    lugares[piso][plaza] = a;
    
    }
    
    
    public String buscarAutoPatente( String patente ) {
    String r = null;
        
    int i = 0; int j = 0; // I FILA, PISO; J COLUMNA, PLAZA
    
    
    System.out.println( "Estacionamiento: " + lugares.length + " plantas y " +  lugares[0].length + " plazas" );

    for (i = 0; i < lugares.length; i++) {
    
    
    for (j = 0; j < lugares[0].length; j++) {
    
    if ( lugares[i][j] != null && lugares[i][j].getPatente().equals(patente) ) r = "Piso " + i + " y plaza " + j;   
        
    
    }    
        
    }
    
    if (r == null) r = "Auto inexistente";
    
    
    return r;
    }
    
    public int contarAutosPlaza( int plaza ) {
    int c = 0;
    
    for (int i = 0; i < lugares.length; i++){ if (lugares[i][plaza] != null) c++; }
    
    
    return c;
    }




    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public float getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(float horaApertura) {
        this.horaApertura = horaApertura;
    }

    public float getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(float horaCierre) {
        this.horaCierre = horaCierre;
    }

    public Auto[][] getLugares() {
        return lugares;
    }


public String toString(){

String s = "";

s += this.getNombre() + " en " + this.getDireccion() + "\n";

for ( int i = 0; i < lugares.length; i++ ) {

for ( int j = 0; j < lugares[0].length; j++ ) {
if ( lugares[i][j] != null ) s += lugares[i][j].toString(); else s += "libre\n";
}

}

return s;
}
    

}
