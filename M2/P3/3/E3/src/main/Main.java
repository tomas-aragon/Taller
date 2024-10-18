package main;

public class Main {

public static void main(String[] args) {

int N = 20;

Estante E = new Estante(N);
Libro L;


for (int i = 0; i < 13; i++) { 

Autor A = new Autor( "D. Ullman", "le gustan las computadoras", "US" );
L = new Libro( "Compilers: Principles, Techniques, and Tools", A, "Pearson", 1986, 12.50 );
E.agregarLibro(L);

}


Autor A = new Autor( "Louisa May Alcott", "Es una mujercita", "US" );
L = new Libro( "Mujercitas", A , "*", 1869, 22.222 );
E.agregarLibro(L);


Libro buscado = new Libro();
buscado = E.devolverLibro("Mujercitas");

System.out.println("El autor de Mujercitas es " + buscado.getAutor().getNombre() );

System.out.println( E.toString() );
}
    
}
