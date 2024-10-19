/*
* Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
* Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
*/
package App;

public class Circulo extends Figura {

private double radio;




public Circulo(double radio, String CF, String CB) {
super(CF, CB);
this.radio = radio;
}





public double calcArea(){

double area;

area = Math.PI * getRadio() * getRadio();


return area;
}    




public double calcPerimetro(){

double perimetro;

perimetro = 2 * Math.PI * getRadio();


return perimetro;
}  











// // //




public double getRadio() {
return radio;
}

public void setRadio(double radio) {
this.radio = radio;
}

@Override
public String toString() {
return "Un circulo de radio " + this.getRadio() + ". " + super.toString() + " y tiene área " + this.calcArea()  + ".\n";
}




}
