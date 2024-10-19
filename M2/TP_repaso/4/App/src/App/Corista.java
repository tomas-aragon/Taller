/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package App;

public class Corista extends Individuo {
  
    
    private int tono;

    public Corista(int tono, String nombre, long DNI, int edad) {
        super(nombre, DNI, edad);
        this.tono = tono;
    }

    
    
    
    
    
    
    
    
    
    
    public int getTono() {
        return tono;
    }

    public void setTono(int tono) {
        this.tono = tono;
    }

    @Override
    public String toString() {
        return "Corista "+ super.toString() +  " tiene tono " + this.getTono() + ".\n";
    }
    
    
    
}
