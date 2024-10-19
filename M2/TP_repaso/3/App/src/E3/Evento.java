/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repaso_3;

public class Evento extends Recital {

    private String motivo; // beneficio, TV, privado
    private String contratante;
    private String dia;

    public Evento(String motivo, String contratante, String dia, String banda, int c_temas) {
        super(banda, c_temas);
        this.setMotivo(motivo);
        this.setContratante(contratante);
        this.setDia(dia);
    }


    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getContratante() {
        return contratante;
    }

    public void setContratante(String contratante) {
        this.contratante = contratante;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

}
