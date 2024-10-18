package main;

public class Hotel {

private Habitacion[] hotel;

private int  N = 26;

public Hotel( ) {
this.hotel = new Habitacion[N];


for (int i = 0; i < N; i++) { 
this.hotel[i] = new Habitacion();
}

}

public void agregarCliente(Cliente C, int X){

if (X >= 0 && X < N && hotel[X].isOcupada() == false ) {

hotel[X].setCliente( C );
hotel[X].setOcupada( true );

} else System.out.println( "Imposible agregar el cliente en habitacion " + X );


}


public void aumentarPrecio( double incremento ) {

for (int i = 0; i < N; i++) { hotel[i].setCosto( hotel[i].getCosto() + incremento ); }

}




///////


public Habitacion[] getHotel() {
return hotel;
}

public void setHotel(Habitacion[] hotel) {
this.hotel = hotel;
}

public int getN() {
return N;
}

public void setN(int N) {
this.N = N;
}




public String toString(  ) { 
String r = "";
String ocupada;



for (int i = 0; i < N; i++) {

if ( hotel[i].isOcupada() == false ) ocupada = "libre.\n"; else ocupada = "ocupada, cliente " + hotel[i].getCliente().getNombre() + 
 ", DNI " + hotel[i].getCliente().getDNI() + ", edad " + hotel[i].getCliente().getEdad() + ".\n";

r += "Habitacion " + i + ", " + hotel[i].getCosto() + ", " + ocupada;
}


return r;

}


}
