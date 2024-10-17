package main;

import PaqueteLectura.GeneradorAleatorio;
public class Main {
public static void main(String[] args) {





int[] numeros;
int DF = 11;
numeros = new int[DF];

int k = GeneradorAleatorio.generarInt(12);

int i = 0;

while ( k != 11 && i < DF ) {
    

numeros[i] = k;
k = GeneradorAleatorio.generarInt(12);    
i++;

}

int j = 0;
while ( numeros[j]  !=  0 && j < DF ) {
System.out.println( j + " " + numeros[j]*2 );
j++;
}

}
    
}
