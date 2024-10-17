package main;


import PaqueteLectura.GeneradorAleatorio;

public class Util {

    


int[][] grilla;

private int DF, DC;

int[] vecSuma; 


public Util( int DF ){  

this.DF = DF;
this.DC = DF;
    
grilla = new int[DF][DC];   

vecSuma = new int[DC];

}

 
public void imprimirMatriz( ) { 
for (int i = 0; i <  grilla.length; i++ ) {

    
for (int j = 0; j < grilla[i].length; j++) {
System.out.print( grilla[i][j] );
System.out.print( " | " );

}    

System.out.println();


}
}



public void cargarMatriz() {


for (int i = 0; i <  grilla.length; i++ ) {

    
for (int j = 0; j < grilla[i].length; j++) {
grilla[i][j] = GeneradorAleatorio.generarInt(31);
}    


}
}


public int sumarFila( int f ) {
int s = 0;
for (int i = 0; i < grilla[f].length; i++ ) { s += grilla[f][i];}


return s;
}



public int sumarCol( int c ) {
int s = 0;
for (int i = 0; i < grilla.length; i++ ) { s += grilla[i][c];}


return s;
}



public void generarVec( ){ 
for (int i =  0; i < vecSuma.length; i ++) { vecSuma[i]  = this.sumarCol(i);}

}



public void imprimirVec( ){ 
for (int i =  0; i < vecSuma.length; i ++) { System.out.print( "Columna " + i + ", " + vecSuma[i] + ", " );}
System.out.println();
}

public String buscarValor( int k ){
String s = "valor " + k + " no encontrado\n";
        
        

    
for ( int i = 0; i < grilla.length; i++ ) {

for (int j = 0; j < grilla[i].length; j++ ) { 


if (grilla[i][j] == k ) {
s = "Valor " + k +" en " + i + ", " + j + "\n";
return s;            
}

}

}
return s;

}


    
}
