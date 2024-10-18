package main;


public abstract class Figura {


private String CF;

private String CB;


public abstract double calcArea();

public abstract double calcPerimetro();








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
