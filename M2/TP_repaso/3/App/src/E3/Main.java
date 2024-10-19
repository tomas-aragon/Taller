package repaso_3;

import PaqueteLectura.GeneradorAleatorio;
public class Main {

public static void main(String[] args) {

int t1 = 5;

Evento E = new Evento("beneficio","Raúl García", "2/2/25","Soda estéreo", t1);


for (int i = 0; i < t1; i++) { E.agregarTema( GeneradorAleatorio.generarString(14) + 3 ); }



E.actuar();




Gira G = new Gira( "Gira latinoamerica", 7, "Virus", 3 );


int i = 0;
Fecha f = new Fecha( GeneradorAleatorio.generarString(4), i  + "/8/25" );


for ( i = 1; i < 7; i++) {
    
f.setCiudad( GeneradorAleatorio.generarString(4) );
    
f.setDia(  i  + "/8/25" );
G.agregarFecha( f ); }

G.actuar();






}
    
}
