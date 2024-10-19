/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Main;

/**
 *
 * @author ta
 */
public class Subsidio {
    
    
   private float monto;
   
   private String motivo;
   
   private boolean fueOtorgado;

    public Subsidio(float monto, String motivo ) {
        this.monto = monto;
        this.motivo = motivo;
        this.fueOtorgado = false;
    }
    
    
    


   

   
   
   


    public float getMonto() {
        return monto;
    }

    public void setMonto(float monto) {
        this.monto = monto;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean isFueOtorgado() {
        return fueOtorgado;
    }

    public void setFueOtorgado(boolean fueOtorgado) {
        this.fueOtorgado = fueOtorgado;
    }
   
   
   public String toString (){ 
   String aux = "Subsidio de " + this.getMonto() + " por motivo " + this.getMotivo() + ". Otorgado := " + this.isFueOtorgado() + "\n";

   return aux;  

   }
    
}
