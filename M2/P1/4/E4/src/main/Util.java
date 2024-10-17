package main;

public class Util {
   
    
private int pisos;

private int oficinasPorPiso;


private int[][] Ed;

    public Util(int pisos, int oficinasPorPiso ) {
        this.pisos = pisos;
        this.oficinasPorPiso = oficinasPorPiso;
        this.Ed = new int[pisos][oficinasPorPiso];
    }
    
    
    
    // === //
    
    
    public void llegar( int piso, int oficina ) {
    
    if ( piso < 9 && piso >= 0 ) this.Ed[piso][oficina] += 1;
    
    }
    
    public void imprimirOficina(){
    for (int i = 0; i < Ed.length; i++) {
    
    System.out.println();

    for (int j = 0; j < Ed[i].length; j++  ) { System.out.print( Ed[i][j] + " | " ); }
    }
    
    System.out.println();
    
    }
    
    
    // === //
    
    

    public int getPisos() {
        return pisos;
    }

    public void setPisos(int pisos) {
        this.pisos = pisos;
    }

    public int getOficinasPorPiso() {
        return oficinasPorPiso;
    }

    public void setOficinasPorPiso(int oficinasPorPiso) {
        this.oficinasPorPiso = oficinasPorPiso;
    }

    public int[][] getEd() {
        return Ed;
    }

    public void setEd(int[][] Ed) {
        this.Ed = Ed;
    }



    
    

}
