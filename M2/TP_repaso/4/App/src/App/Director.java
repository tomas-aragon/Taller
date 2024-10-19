/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package App;

/**
 *
 * @author ta
 */
public class Director extends Individuo {
  
    private int antiguiedad;

    public Director(  String nombre, long DNI, int edad, int antiguiedad) {
        super( nombre, DNI, edad );
        this.antiguiedad = antiguiedad;
    }

    
    
    
    public int getAntiguiedad() {
        return antiguiedad;
    }

    public void setAntiguiedad(int antiguiedad) {
        this.antiguiedad = antiguiedad;
    }

    @Override
    public String toString() {
        return "Director " + super.toString() +  " Tiene enatiguedad " + this.getAntiguiedad() ;
    }
    
    
    
    
}
