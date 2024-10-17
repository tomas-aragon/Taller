/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main;

public class Casting {

    private Persona[][] turnos;

    public Casting() {
        this.turnos = new Persona[5][8]; // 5 DIAS Y 8 TURNOS POR DIA

        for (int i = 0; i < turnos.length; i++) {
            for (int j = 0; j < turnos[i].length; j++) {
                turnos[i][j] = null;
            }
        }
    }

//////
    public void anotarPersona(Persona P, int d) {

        if (d < 0 || d > 4) {
            System.out.println("Dia inválido (0-4).");
        } else {

            int i = 0;
            while (i < turnos[0].length && turnos[d][i] != null) {
                i++;
            }

            if ( i < turnos[0].length && turnos[d][i] == null ) {
                turnos[d][i] = P;
            } else {
                System.out.println("no hay turnos el dia " + d);
            }

        } // ELSE
    }

    public int contarInscriptosDia(int d) {
        int c = 0;

        for (int i = 0; i < turnos[0].length; i++) {
            if (turnos[d][i] != null) {
                c++;
            }

        }

        return c;
    }

    public void informarDia(int d) {

        System.out.println("Inscriptos dia " + d + " es " + this.contarInscriptosDia(d));

        for (int i = 0; i < turnos[0].length; i++) {
            if (turnos[d][i] != null) {
                System.out.println("Día " + d + ", Turno " + i + " audiciona " + turnos[d][i].getNombre());
            }
        }

    }

//////
    public Persona[][] getTurnos() {
        return turnos;
    }

}
