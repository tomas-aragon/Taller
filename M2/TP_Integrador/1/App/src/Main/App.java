package Main;

import PaqueteLectura.GeneradorAleatorio;



public class App {

public static void main(String[] args) {
GeneradorAleatorio.iniciar();

int c_investigadores = GeneradorAleatorio.generarInt(11);
System.out.println( "C. inv. " + c_investigadores );

Proyecto p;
Subsidio sub;    



String nombreProy = GeneradorAleatorio.generarString(10);   
int codProy = GeneradorAleatorio.generarInt(13333);
String dirProy = GeneradorAleatorio.generarString(7);

p = new Proyecto (nombreProy, codProy, dirProy );


Investigador inv = new Investigador( GeneradorAleatorio.generarString(17), 
        GeneradorAleatorio.generarInt(5) + 1, GeneradorAleatorio.generarString(6) );



for (int j = 0; j < c_investigadores; j++) {

 
inv.setNombre( GeneradorAleatorio.generarString(17) );
inv.setCat(GeneradorAleatorio.generarInt(5) + 1 );
inv.setSpec(GeneradorAleatorio.generarString(6) );

for (int i = 0; i < 5; i++) {
float monto = GeneradorAleatorio.generarInt(50);
String motivo = GeneradorAleatorio.generarString(13);

sub = new Subsidio( monto, motivo );

boolean b = GeneradorAleatorio.generarBoolean();

sub.setFueOtorgado(b);
inv.agregarSubsidio(sub);



}

p.otorgatTodos(inv);


p.agregarInvestigador(inv);

}

double dinero = 0;

dinero = p.dineroTotalOtorgado();

System.out.println( p.toString() + "- Dinero total: " + dinero );


}
}




//int k = GeneradorAleatorio.generarInt(51); // K = NRO DE INVESTIGADORES
//
//
//for (int i = 0; i <= k; i++ ) {
//
//    
//    
//    
//String nombreinv = GeneradorAleatorio.generarString(17);
//int catinv = GeneradorAleatorio.generarInt(5) + 1;
//String specinv = GeneradorAleatorio.generarString(6);
//
//inv = new investigador( nombreinv, catinv, specinv  );
//
//
//int n = GeneradorAleatorio.generarInt(6); // N = NRO DE SUBSIDIOS,
//
//
//for (int j = 0; j <= n; j++ ){
//
//float monto = GeneradorAleatorio.generarInt(100);
//String motivo = GeneradorAleatorio.generarString(13);
//
//sub = new Subsidio( monto, motivo );
//
//boolean b = GeneradorAleatorio.generarBoolean();
//
//sub.setFueOtorgado(b);
//
//
//inv.agregarSubsidio(sub);
//
//    
//} // I
//
//p.agregarinvestigador(inv);
//
//
//} // K
//
//
//System.out.println(p.dineroTotalOtorgado());
//
//
//
//
//
//
//    }
//    
//}
