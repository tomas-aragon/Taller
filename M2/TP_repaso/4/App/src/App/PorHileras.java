package App;

public class PorHileras extends Coro {

private int[] dimension;
private Corista[][] coristas;

public PorHileras(int f, int c, String nCoro, String nombre, long DNI, int edad, int antiguedad) {
super(nCoro, nombre, DNI, edad, antiguedad);


this.coristas = new Corista[f][c];

this.dimension = new int[2];
this.dimension[0] = f;
this.dimension[1] = c;
}


// // //



@Override
public void agregarCorista(Corista C) {


int f = 0;
int c = 0;

System.out.println( "getCoristas().length " + getCoristas().length + "; getCoristas()[f].length "  + getCoristas()[f].length );
while ( f < this.getDimension()[0]  - 1 && getCoristas()[f][c] != null ) {

while ( c < this.getDimension()[1] - 1 && getCoristas()[f][c] != null ) { c++; }
f++;
c = 0;
}    

getCoristas()[f][c] = C;

}

@Override
public void agregarOrdenado(Corista C) {





int f = 0;
int c = 0;

while ( f < getCoristas().length && getCoristas()[f][c] != null && getCoristas()[f][c].getTono() < C.getTono() ) {

while ( c < getCoristas()[f].length && getCoristas()[f][c] != null ) { 
    
if ( c < getCoristas()[f].length ) c++;

}

if ( f < getCoristas().length ) f++;
c = 0;
}    

if ( f == getCoristas().length ) f--;
if ( c == getCoristas()[f].length ) c--;


getCoristas()[f][c] = C;


}



@Override
public boolean estaLleno( ){

int c = 0;
for ( int i = 0; i < getCoristas().length; i++ ) {

for ( int j = 0; j < getCoristas()[i].length; j++ ) { 

if ( getCoristas()[i][j] != null ) c++;

}
}


return c == ( this.getDimension()[0] * getDimension()[1]);
}




@Override
public  boolean estaBienFormado( ) {
boolean r = true;



int j = 0;
int i = 0;

while (  i < getCoristas().length - 1 && getCoristas()[i][j] != null ) { 


while ( j < getCoristas()[i].length - 1 && getCoristas()[i][j] != null && getCoristas()[i][j++] != null ) {    
if ( getCoristas()[i][j] != null && getCoristas()[i][j].getTono() != getCoristas()[i][j++].getTono() ) { r = false; }
j++;
}
if ( getCoristas()[i][j] != null &&  getCoristas()[i++][j] != null && getCoristas()[i][j].getTono() > getCoristas()[i++][j].getTono() ) { r = false; }
i++;
j = 0;
}



return r;
};







// // //

public int[] getDimension() {
return dimension;
}


public Corista[][] getCoristas() {
return coristas;
}

@Override
public String toString() {

String r;
r = super.toString() + ". Tipo por hileras, tiene dimension " + this.getDimension()[0] + ", " + this.getDimension()[1] + ".\n" + 
      
"Coristas:\n";

for (int i = 0; i < this.getDimension()[0]; i++) { 
for (int j = 0; j < this.getDimension()[1]; j++) { if ( getCoristas()[i][j] != null ) r += this.getCoristas()[i][j].toString(); }
}
return r;

}




}
