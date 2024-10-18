/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main;





public class Estante {

private Libro[] estante;

public Estante( int N ) {
this.estante = new Libro[N];
}


public void agregarLibro( Libro L ) {

int i = 0;

while ( i < estante.length && estante[i] != null ) { i++; }

estante[i] = L;
}


public Libro devolverLibro ( String t ) {

    
Libro r = null;
int i = 0;
while (i < estante.length && estante[i].getTitulo().equals(t) == false ) { i ++; }
    
if ( estante[i].getTitulo().equals(t) ) r = estante[i];

return r;

}


public boolean estaLleno() {
int c = 0;
int i = 0;

while (i < estante.length && estante[i] != null ) {c++; i++; }


return c == 20;
}


public int contarLibros () {
int c = 0; int i = 0;

while (i < estante.length && estante[i] != null ) { i++; c++; }


return c;
}


public String toString() {
String s = "Estanteria\n";

int i = 0;


while ( i < estante.length && estante[i] != null ) {

s += "libro " + i + " - " + estante[i].getTitulo() + " por " + estante[i].getAutor() + "\n" ;
i++;
}


return s;
}


}

