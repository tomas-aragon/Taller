package codigo;

public abstract class Figura {

private String CF;

private String CB;

public Figura(String CF, String CB) {
this.CF = CF;
this.CB = CB;
}

public abstract double calcArea();

public abstract double calcPerimetro();



public void despintar(){
this.setCB("Negro");
this.setCF("Blanco");
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

@Override
public String toString() {
return " Color de fondo " + this.getCF() + ", color del borde " + this.getCB() + ". Tiene perímetro " + this.calcPerimetro() + " y área " + this.calcArea() + ".";
}

}
