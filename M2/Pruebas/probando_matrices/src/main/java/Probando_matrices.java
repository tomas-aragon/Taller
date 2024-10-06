/**
 * @author ta
 */
public class Probando_matrices {

public static void main(String[] args) {




int[][] mm = new int[3][6]; // 3 FILAS, 6 COLUMNAS 0-2 Y 0-5


for (int i = 1; i <= 2; i ++) {

for (int j = 1; j <= 5; j++) { mm[i][j] = i * j; }

}


for (int i = 1; i <= 2; i ++) {

for (int j = 1; j <= 5; j++) { System.out.println( mm[i][j] ); }

}
 











}
}
