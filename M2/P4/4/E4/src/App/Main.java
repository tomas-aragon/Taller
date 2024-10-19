package App;


public class Main {

public static void main(String[] args) {

    
    
/// Estacion Ensenada

int desde = 2021;  
int N = 3; // 2021-2023
double[] coor = new double[2]; coor[0] = -34.921; coor[1] = -57.955;

Estacion ELP = new Estacion( desde, N, "La Plata", coor );


ELP.getS().generarTemperaturas();



System.out.println( ELP.toString() );
System.out.println( ELP.getS().buscarMesMax() );


double PA;

for (int i = desde; i < desde + N; i++ ) {
PA = ELP.getS().reportarPromedioDeA( i );
System.out.println( "El promedio del año " + i + " es " + String.format( "%.2f", PA ) );
}


/// Estacion Mar del Plata

int M;
double PM;


N = 4; // 2020-2023
coor[0] = -38.002; coor[1] = -57.556;

Estacion EMDP = new Estacion( desde, N, "Mar del Plata", coor );
EMDP.getS().generarTemperaturas();



System.out.println( EMDP.toString() );
System.out.println( EMDP.getS().buscarMesMax() );


int mes;
for (int i = 0; i < 12; i++) {
PM = EMDP.getS().reportarPromedioDeMes(i);
mes = i + 1;
System.out.println( "El promedio del mes " + mes + " es " + String.format( "%.2f", PM ) );

}







}
    
}
