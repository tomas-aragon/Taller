/*
* Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
* Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
*/
package App;

/**
*
* @author ta
*/
public abstract class Coro {

private String nCoro;
private Director director;

public Coro( String nCoro, String nombre, long DNI, int edad, int antiguedad ) {

this.nCoro = nCoro;
this.director = new Director( nombre, DNI, edad, antiguedad );

}



public abstract void agregarCorista( Corista C );

public abstract void agregarOrdenado( Corista C );

public abstract boolean estaLleno( );

public abstract boolean estaBienFormado( );





// // // 




public String getnCoro() {
        return nCoro;
    }

    public void setnCoro(String nCoro) {
        this.nCoro = nCoro;
    }





public Director getDirector() {
return director;
}

public void setDirector(Director director) {
this.director = director;


}



    @Override
    public String toString() {
        return this.getnCoro() + ", " +  this.getDirector().toString();
    }





}
