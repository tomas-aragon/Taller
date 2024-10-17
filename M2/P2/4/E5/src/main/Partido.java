package main;

public class Partido {

private String equipoLocal;    
private String equipoVisitante;
private int golesLocal;
private int golesVisitante;


/* nombre del equipo local, el nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). */

public Partido( String equipoLocal, String equipoVisitante, int golesLocal, int golesVisitante ) {
        this.equipoLocal = equipoLocal;
        this.equipoVisitante = equipoVisitante;
        this.golesLocal = golesLocal;
        this.golesVisitante = golesVisitante;
    }

public Partido(){}




public boolean hayEmpate(){
boolean b;

if ( golesLocal == golesVisitante ) b = true; else b = false;    

return b;
}


public boolean hayGanador(){
boolean b;

if ( golesLocal != golesVisitante ) b = true; else b = false;    


return b;
}

public String getGanador() {
String ganador;

if ( golesLocal > golesVisitante ) ganador = equipoLocal; else if ( golesLocal < golesVisitante )  ganador = equipoVisitante; else ganador  = "";


return ganador;
}


// // //

    public String getEquipoLocal() {
        return equipoLocal;
    }

    public void setEquipoLocal(String equipoLocal) {
        this.equipoLocal = equipoLocal;
    }

    public String getEquipoVisitante() {
        return equipoVisitante;
    }

    public void setEquipoVisitante(String equipoVisitante) {
        this.equipoVisitante = equipoVisitante;
    }

    public int getGolesLocal() {
        return golesLocal;
    }

    public void setGolesLocal(int golesLocal) {
        this.golesLocal = golesLocal;
    }

    public int getGolesVisitante() {
        return golesVisitante;
    }

    public void setGolesVisitante(int golesVisitante) {
        this.golesVisitante = golesVisitante;
    }

@Override 
public String toString () {
String s;
    
s = "{ " + this.equipoLocal + " " + this.golesLocal + " VS " + this.equipoVisitante + " " +  this.golesVisitante + " }\n";


return s;
}


}
