package main;

public class Campeonato {

private final int cPartidos = 20;
private Partido[] VP;

public Campeonato() {

    this.VP = new Partido[cPartidos];
}
//////


public void agregarPartido(Partido P) {

if ( P.getEquipoVisitante().equals("ZZZ") == false ) {

int i = 0;
while ( VP[i] != null && i < cPartidos ) { i++; }

VP[i] = P;

} // iF
}

public int contarVictoriasRiver(){
int c = 0;

int i = 0;


while ( i < this.getcPartidos() && VP[i] != null ) {
if ( (VP[i].getEquipoLocal().equals("River") && 
      VP[i].getGolesLocal() > VP[i].getGolesVisitante() ) ||
     (VP[i].getEquipoVisitante().equals("River") && 
      VP[i].getGolesLocal() < VP[i].getGolesVisitante() ) ) { c++; }
i++;
}

return c;
}


public int contarGolesBocaLocal(){
int c = 0;

for (int i = 0; i < VP.length; i++) {
if (  VP[i].getEquipoLocal().equals("Boca") ) { c+= VP[i].getGolesLocal(); }
}

return c;
}




//////
public int getcPartidos() {
    return cPartidos;
}

public Partido[] getVP() {
    return VP;
}


}
