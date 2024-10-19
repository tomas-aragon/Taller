package repaso_3;

public abstract class Recital {

    private String banda;

    private String[] temas;

    public Recital(String banda, int c_temas) {
        this.setBanda(banda);
        System.out.println("Cantidad de temas " + c_temas);
        this.temas = new String[c_temas];
    }

    public void agregarTema(String t) {

        int i = 0;
        while (getTemas()[i] != null && i < getTemas().length) {
            i++;
        }

        getTemas()[i] = t;

    }

    public void actuar() {
        for (int i = 0; i < this.getTemas().length; i++) {
            System.out.println("Y ahora vamos a tocar " + this.getTemas()[i]);
        }

    }

    public String getBanda() {
        return banda;
    }

    public void setBanda(String banda) {
        this.banda = banda;
    }

    public String[] getTemas() {
        return temas;
    }

    public void setTemas(String[] temas) {
        this.temas = temas;
    }

}
