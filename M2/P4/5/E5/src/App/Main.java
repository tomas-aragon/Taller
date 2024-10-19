package App;

public class Main {

public static void main(String[] args) {




Dibujo D = new Dibujo("El festín de Harpago");


Rectangulo R1 = new Rectangulo( 1.0, 2.0, "rojo", "negro" );



Rectangulo R2 = new Rectangulo( 5.0, 1.0, "verde", "negro" );



Circulo C1 = new Circulo(  3.5, "blanco", "negro" );


D.agregar(C1);

D.agregar(R1);

D.agregar(R2);


D.mostrar();

/*  

Piense: ¿qué ventaja tiene esta implementación a medida que aumentan las posibles
figuras en la jerarquía? ¿cuál es la ventaja del polimorfismo? ¿dónde se observa en
este ejercicio?

Respuesta: en la clase Dibujo podemos usar un parametro genérico tipo Figura sin tener que tener que escribir un método diferente

para cada subclase de Figura. cuando escribimos *f.toString()*, este metodo es diferente para cada tipo de Figura f en particulor. 

¿será esto a lo que le decimos binding dinámico?


*/




}
    
}
