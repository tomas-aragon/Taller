package App;

public abstract class Figura {
 
public String CF;
public String CB;

    public Figura(String CF, String CB) {
        this.CF = CF;
        this.CB = CB;
    }




public abstract double calcArea(  );
public abstract double calcPerimetro(  );




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
public String toString () {

    return "Color de fondo " + getCF() + ", color del borde " + getCB();

}


}
