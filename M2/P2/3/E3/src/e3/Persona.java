package e3;

public class Persona {    
    
    
private String nombre;

private int DNI;

private int edad;

private int dia;

private int turno;


public Persona( String unNombre, int unDNI, int unaEdad, int unDia, int unTurno ){

nombre = unNombre;
DNI = unDNI;
edad = unaEdad;       
dia = unDia;
turno = unTurno;

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


public int getDia(){

return dia;

};
    

public void setDia( int nuevoDia ){

    dia = nuevoDia;

};


public int getTurno(){

return turno;

};
    

public void setTurno( int nuevoTurno ){

    turno = nuevoTurno;

};


@Override
public String toString(){

    String s =  "Nombre: " + nombre + "; DNI: " + DNI + "; edad: " + edad + ". Tiene turno " + turno + " el dia " + dia ;
  

    return s;
};


}
