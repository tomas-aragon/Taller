package App;

import PaqueteLectura.GeneradorAleatorio;

public class Sistema {


private double[][] temperaturas;
private int desde;
private int N;

public Sistema( int desde, int N ) {
this.temperaturas = new double[N][12];
this.desde = desde;
this.N = N;
}











//////

// I ES EL AÑO. J ES EL MES, 

public void generarTemperaturas( ) {

 int i, j; double t;


for (i = 0; i < temperaturas.length; i++) {


for (j = 0; j < 12; j++) {

t = GeneradorAleatorio.generarDouble( 45 );
temperaturas[i][j] = t; 

}
} 

   
 
}



public void imprimirDatos(){

double promedio = 0.00; 
int j; int i;
int[] vf = new int[2];


// Todas las medicions, el promedio mensual

for (i = 0; i < temperaturas.length; i++) { 

for (j = 0; j < 12; j++) {

vf[0] = this.getDesde() + i;
vf[1] = j + 1;
System.out.println("Año " + vf[0] + ", mes " + vf[1] + ", temeperatura promedio " +   String.format( "%.2f", temperaturas[i][j] ) + "."); 

}

}

// Promedios de cada mes

// I ES EL AÑO. J ES EL MES, 

for ( j = 0; j < 12; j++) {

for ( i = 0; i < temperaturas.length; i++) { 
promedio += temperaturas[i][j];

}
promedio = promedio / 12.00;
vf[1] = j + 1;


System.out.println( "Promedio del mes " + vf[1] + " es " + String.format("%.2f", promedio) + "." );
promedio = 0.00;
}



///////

// Promedios de cada año años
// I ES EL AÑO. J ES EL MES, 


promedio = 0.00;

for ( i = 0; i < temperaturas.length; i++ ) {

for ( j = 0; j < 12; j++ ) { promedio += temperaturas[i][j]; } 
promedio = promedio / 12.00;

vf[0] = getDesde() + i - 1;
System.out.println( "Promedio año " +  vf[0] + " es " + String.format( "%.2f", promedio )  );
promedio = 0.00;
}


} // imprimirDatos();





public double reportarPromedioDeMes( int M ) {
double promedio = 0.00; 


if ( M >= 0 && M < 12 ) {
    


for (int j = 0; j < temperaturas.length; j++) { 
promedio += temperaturas[j][M];

}

promedio = promedio / (double) temperaturas.length;

} else System.out.println( "Mes invalido, rango de 1-12." ); 

return promedio;

}




public double reportarPromedioDeA( int A  ) {

double promedio = 0.00;

A = A - this.getDesde();


for (int i = 0; i < 12; i++ ) { promedio += temperaturas[A][i]; } 
promedio = promedio / 12.00;



return promedio;
}




// Año 1992, mes 1 tiene la temperatura máxima 53.99.

public String buscarMesMax(){

String r; double max = -1; int[] fecha  = new int[2];

for ( int i = 0; i < temperaturas.length; i++ ) {

for ( int j = 0; j < 12; j++ ) {  

if ( temperaturas[i][j] >  max ) {
max = temperaturas[i][j];
fecha[0] = i;
fecha[1] = j;
} 

}
}

fecha[0] += getDesde();
fecha[1]++;

r = "Año " + fecha[0] + ", mes " + fecha[1] + " tiene la temperatura máxima " + String.format("%.2f", max ) + ".";

return r;
}



// GETTERS Y SETTERS



public double[][] getTemperaturas() {
return temperaturas;
}

public void setTemperaturas(double[][] temperaturas) {
this.temperaturas = temperaturas;
}

public int getDesde() {
return desde;
}

public void setDesde(int desde) {
this.desde = desde;
}

public int getN() {
return N;
}


public void setN(int N) {
this.N = N;
}


}
