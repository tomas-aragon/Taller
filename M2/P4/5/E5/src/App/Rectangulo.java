package App;

public class Rectangulo extends Figura {
 

    
private double[] lados;




    public Rectangulo(double a, double b, String CF, String CB) {
        super(CF, CB);
        
        this.lados = new double[2];
        this.lados[0] = a;
        this.lados[1] = b;

    }




    
public double calcArea(){

double area;

area = getLados()[0] * getLados()[1];

return area;
}    



    
public double calcPerimetro(){

double perimetro;

perimetro = 2 * getLados()[0] +  2 * getLados()[1];

return perimetro;
}    




// // //



    public double[] getLados() {
        return lados;
    }

    public void setLados(double[] lados) {
        this.lados = lados;
    }
    
 

    
        @Override
    public String toString() {
        return "Un rectangulo de lados " + this.getLados()[0] + " y " + this.getLados()[1] +  ". " + super.toString() + " y tiene área " + this.calcArea() + ".\n";
    }

    
}
