/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main;

public class Util {
    
private double altPromedio;
    
 
public double calcAlturaPromedio ( double[] j ) {
double a = 0;


for ( int i = 0; i < j.length; i ++ ) { a += j[i]; }

a = a / (double) j.length;

return a;
}

public int contarPorEncimaProm( double p, double[] j ){
int c = 0;

for (int i = 0; i < j.length; i++) { 
if ( j[i] > p ) { c += 1; }
}


return c;
}

    

}
