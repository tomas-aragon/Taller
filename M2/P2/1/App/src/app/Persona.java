/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package app;

public class Persona {
  
    
    
private String nombre;

private int DNI;

private int edad;


public Persona( String unNombre, int unDNI, int unaEdad ){

nombre = unNombre;
DNI = unDNI;
edad = unaEdad;       

};



public Persona(){};



public String getNombre(){

    return nombre;
};


public void setNombre(String nuevoNombre){

    nombre = nuevoNombre;

};

public int getDNI(){

return DNI;

};
    

public void setDNI( int nuevoDNI ){

    DNI = nuevoDNI;

};


public int getEdad(){

    return edad;

};


public void setEdad(int nuevaEdad){

    edad = nuevaEdad;

};


public String toString(){

    String s =  "Nombre: " + nombre + "; DNI: " + DNI + "; edad: " + edad;

    return s;
};


}
