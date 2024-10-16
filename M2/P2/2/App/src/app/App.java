package app;


import PaqueteLectura.GeneradorAleatorio;


public class App {
public static void main(String[] args) {


Persona[] vec_personas = new Persona[15];

int i = 0;
int edad =-1;

while ( (edad != 0) & (i <= 14) ) {
edad = GeneradorAleatorio.generarInt(100);

if (edad != 0) {
    
vec_personas[i] = new Persona( GeneradorAleatorio.generarString(7), GeneradorAleatorio.generarInt(40000000), edad );
System.out.println( i + "; " + vec_personas[i].toString() );

i ++;

}

}


// ---+++---


// Contar mayores de 65 años.
int cantidad = 0;


for (int j = 0; j < i; j++){


edad = vec_personas[j].getEdad();

if (edad > 65) cantidad ++;

}

System.out.println( "Cantidad mayor que 65 es " + cantidad );




// Persona con menor DNI


Persona elegido = new Persona();
elegido.setDNI(Integer.MAX_VALUE);

for (int j = 0; j < i; j++){


if (vec_personas[j].getDNI() < elegido.getDNI() ) {
    
    elegido.setDNI( vec_personas[j].getDNI() );
    elegido.setNombre( vec_personas[j].getNombre() );
    elegido.setEdad( vec_personas[j].getEdad() );
} 


}

System.out.println( "la persona con menor DNI es: " + elegido.toString() );






}
    
}
