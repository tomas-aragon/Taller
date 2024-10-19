package codigo;


public class Triangulo extends Figura {


private double[] lados;








public Triangulo(double a, double b, double c, String CF, String CB) {
super(CF, CB);
this.lados = new double[3];
this.lados[0] = a; this.lados[1] = b; this.lados[2] = c;
}



///////



public double calcPerimetro () {return lados[0] + lados[1] + lados[2];}


public double calcArea () {
double s;     


s = lados[0] + lados[1] + lados[2];
s = s/2.0;

double A = s * (s - lados[0]) * (s - lados[1]) *(s - lados[2]) ;
A = Math.sqrt( A );

return A;
}

//////

public double[] getLados() {
return lados;
}

public void setLados(double a, double b, double c) {
this.lados[0] = a; this.lados[1] = b; this.lados[2] = c;

}

@Override
public String toString() {
return "Triangulos con lados " + this.getLados()[0] + ", " + this.getLados()[1] + ", " + this.getLados()[2] + ". Colores " + super.toString();
}



}
