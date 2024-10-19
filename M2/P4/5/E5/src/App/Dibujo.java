package App;

public class Dibujo {
    private String titulo;
    private Figura[] vec;
    private final int capacidad = 10;
    private int cantidad;
    
    
    public Dibujo( String titulo ) {
    this.titulo = titulo;
    this.vec = new Figura[capacidad];
    
    }
    
    
    public void agregar(Figura f) {
    
    int i = 0;
    while ( i < vec.length && vec[i] != null ) { i++; }
    
    vec[i] = f;
    
    System.out.print( "Agregó: " + f.toString() );
    }
    
    
    public double calcArea(){
    double area = 0;
    int i = 0;
    while ( i < vec.length && vec[i] != null ) { area += vec[i].calcArea(); i++; }
    
    return area;
    }
    
    
    
    public void mostrar(){
    
    System.out.println( "Dibujo: " + getTitulo() );
    System.out.println( "Tiene un área total de "+ this.calcArea() );
    System.out.println( "Contiene las siguientes figuras: " );

    int i = 0;
    while ( i < vec.length && vec[i] != null ) { System.out.print( vec[i].toString() ); i++; }
    }
    
    
    
    public boolean estaLleno(){return ( capacidad  == cantidad ); }

    
    
    
    // // // 
    
    
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    
    
}
