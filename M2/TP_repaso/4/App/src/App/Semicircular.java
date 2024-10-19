package App;


public class Semicircular extends Coro {

private int dimension;
private Corista[] coristas;

public Semicircular(int dimension, String nCoro, String nombre, long DNI, int edad, int antiguedad) {
super(nCoro, nombre, DNI, edad, antiguedad);
this.coristas = new Corista[dimension];

}

// // // 



@Override
public void agregarCorista(Corista C) {

int i = 0;

while (i < getCoristas().length && getCoristas()[i] != null) {
i++;
}

getCoristas()[i] = C;

}


@Override
public void agregarOrdenado(Corista C) {


int i = 0;

while (i < getCoristas().length && getCoristas()[i] != null && getCoristas()[i].getTono() < C.getTono() ) {
i++;
} 

getCoristas()[i] = C;

}



@Override
public boolean estaLleno( ){

int c = 0;

for ( int i = 0; i < getCoristas().length; i++ ) {
if ( getCoristas()[i] != null ) c++;
}


return c == this.getDimension();
}




@Override
public  boolean estaBienFormado( ) {
boolean r = true;



for ( int i  = 0; i < getCoristas().length - 1; i++ ) { 
if ( getCoristas()[i] != null && getCoristas()[i].getTono() > getCoristas()[i++].getTono() ) { r = false; }
}





return r;
}





// // // 



public int getDimension() {
return dimension;
}

public void setDimension(int dimension) {
this.dimension = dimension;
}

public Corista[] getCoristas() {
return coristas;
}




@Override
public String toString() {

String r;
r = super.toString() + ". Tipo semicircular, tiene dimension " + this.getDimension() + ".\nCoristas:\n";

for (int i = 0; i < this.getDimension(); i++) { r += getCoristas()[i].toString(); }
return r;

}




}