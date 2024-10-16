package e3;

import PaqueteLectura.GeneradorAleatorio;


public class Main {

    
    

public static void main( String[] args ) {

Persona[][] tabla_turnos = new Persona[10][30]; // 10n turnos por dia como maximo

GeneradorAleatorio.iniciar();

int c_postulantes = 40;

System.out.println("Postulantes " + c_postulantes);

int i = 0;

int j = 0;

String nombre = "0";
    
while ( (i < 30) & (i*10 + j < c_postulantes) & (nombre != "ZZZ")) { // i dia, j turno

nombre = GeneradorAleatorio.generarString(7);

while ( (j < 10) & (i*10 + j < c_postulantes)  & (nombre != "ZZZ") ) {


tabla_turnos[j][i] = new Persona ( nombre, GeneradorAleatorio.generarInt(40000000), 18 + GeneradorAleatorio.generarInt(83), i, j );
j++;

System.out.println("i. j: " + i + " " + j );

}

j = 0;
i++;

} // While i






i = 0;
j = 0;

    
while ( (i < 30) & (i*10 + j < c_postulantes)) { 



while ( (j < 10) & (i*10 + j < c_postulantes) ) {


System.out.println(  tabla_turnos[j][i].toString()  );

j++;

}

j = 0;
i++;

} // While i




}
    
}
