package main;


import PaqueteLectura.GeneradorAleatorio;

public class Main {
public static void main(String[] args) {

GeneradorAleatorio.iniciar();    

    
int pisos = 8; int cOficinas = 4;

Util U = new Util( pisos, cOficinas );

int p; int o;


p = 0; o = 0;

while ( p != 9 ) {
if ( p < 8 ) U.llegar( p, o);
System.out.println("empleado ingreso a la ofina del piso " + p + " oficina nro. " + o );
p = GeneradorAleatorio.generarInt(pisos + 2);
o =  GeneradorAleatorio.generarInt(cOficinas);
}


System.out.print( "matriz contadora, las filas son los pisos, las columnas son las oficinas. El entero representa la cant. de personas en esa oficina" );
U.imprimirOficina();



    }
    
}
