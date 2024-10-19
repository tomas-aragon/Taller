package Main;


public class Auto {

private String propietario;


private String patente;

    public Auto(String propietario, String patente) {
        this.propietario = propietario;
        this.patente = patente;
    }





    public String getPropietario() {
        return propietario;
    }

    public void setPropietario(String propietario) {
        this.propietario = propietario;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }


    @Override
    public String toString(){
    String s = "Auto c. patente " + this.getPatente() + " y propietario " + this.getPropietario() + "\n";
    return s;
    }
    
    
}
