/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Main;

public class Investigador {
    
    
    private String nombre;
    
    private int cat;
    
    private String spec;
    
    private Subsidio[] subs;

    
    
    
 
 public Investigador(String nombre, int cat, String spec ) {
        this.nombre = nombre;
        this.cat = cat;
        this.spec = spec;
        this.subs = new Subsidio[5];
    }

 
 
 

 public void agregarSubsidio( Subsidio s ){
int i = 0;
if (this.subs == null) { 

System.out.println("Sin subsidios");
this.subs = new Subsidio[5];

}
 while ( i < this.subs.length - 1 && this.subs[i] != null) { i++; }
 
 
subs[i] = s;
 
 
 }
    
 public double totalSubsidios(){
 
 double c = 0;    
 
 for (int i = 0; i < subs.length; i++) {
 if ( subs[i].isFueOtorgado() == true ) c += subs[i].getMonto();
 }
 
 return c;
     
 }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCat() {
        return cat;
    }

    public void setCat(int cat) {
        this.cat = cat;
    }

    
    
    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }
    
    
    

    public Subsidio[]  getSubs() {
        return subs;
    }

    public void setSubs(Subsidio[] subs) {
        this.subs = subs;
    }
    
    
    
@Override
 public String toString(){
 
 String aux = "Investigador: " + this.getNombre() + "; categoria " + this.getCat() + "; especialidad " + this.getSpec() + 
       " total acumulado en subsidios " + this.totalSubsidios() + "\n" ; 
 for ( int i =0; i < this.subs.length; i++ ){
 
 if ( this.subs[i] != null ) aux += subs[i].toString() + "\n";
 
 }

 
  return aux;
}
    
    
    
    
}
