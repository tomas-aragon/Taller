package main;

import PaqueteLectura.GeneradorAleatorio;

public class Main {
public static void main(String[] args) {


Hotel H = new Hotel();
Cliente C;

int k;
for (int i = 0; i < 28; i++) {


k = GeneradorAleatorio.generarInt( H.getN() );

C = new Cliente( "eduardo Ibañes", 445566, 33 );
H.agregarCliente(C, k);
}





System.out.println(H.toString());

System.out.println( "Aumentando precio de las habitaciones en 1200$" );
H.aumentarPrecio(1200.0);



System.out.println(H.toString());


}

}
