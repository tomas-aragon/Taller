package main;

public class Triangulo {

    private double[] lados;

    private String CF;// color fondo

    private String CB;// color borde

    public Triangulo(double[] lados, String CF, String CB) {
        this.lados = lados;
        this.CF = CF;
        this.CB = CB;
    }

    //////
    public double calcArea() {
        double a;
        double s = 0;

        for (int i = 0; i < this.getLados().length; i++) {
            s += this.getLados()[i];
        }

        s = (double) s / (double) 2.0;

        a = (double) Math.sqrt( (double) s * (  (double) s - (double) getLados()[0] ) * 
                              ( (double)  s - (double) getLados()[1] ) * ( (double)  s - (double) getLados()[2] ) );

        return a;
    }

    public double calcPerimetro() {
        double p = 0;

        for (int i = 0; i < getLados().length; i++) {
            p += getLados()[i];
        }

        return p;
    }

    //////
    public double[] getLados() {
        return lados;
    }

    public void setLados(double[] lados) {
        this.lados = lados;
    }

    public String getCF() {
        return CF;
    }

    public void setCF(String CF) {
        this.CF = CF;
    }

    public String getCB() {
        return CB;
    }

    public void setCB(String CB) {
        this.CB = CB;
    }

}
