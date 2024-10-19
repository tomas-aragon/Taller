package App;


public class Estacion {


private String nombre;
private double[] coor;
private Sistema S;




public Estacion(int desde, int N, String nombre, double[] coor ) {

this.S = new Sistema( desde, N );    
this.coor = new double[2];
this.coor = coor;
this.nombre = nombre;

}




public String getNombre() {
return nombre;
}

public void setNombre(String nombre) {
this.nombre = nombre;
}


public double[] getCoor() {
return coor;
}

public void setCoor(double[] coor) {
this.coor = coor;
}


public Sistema getS() {
return S;
}

public void setS(Sistema S) {
this.S = S;
}


@Override
public String toString () {
return "Estacion " + this.getNombre() + ", coordenadas " + this.getCoor()[0] + ",  " + this.getCoor()[1] + ".";
}
}
