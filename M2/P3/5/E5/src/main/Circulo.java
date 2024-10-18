package main;



public class Circulo extends Figura {

    private double radio;

    public Circulo(double radio) {
        this.radio = radio;
    }
    
    
    
    
    @Override
    public double calcArea(){
    double A = 0;
    
    A = Math.PI * getRadio() * getRadio();
    
    return A;
    }
    
    
    
    
    @Override
    public double calcPerimetro(){
    double P = 0;
    
    
    P = 2 * Math.PI * getRadio();
    
    return P;
    }

    
    

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    
    

    
}
