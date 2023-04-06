import static java.lang.System.arraycopy;

class Matrix {

    //Atribute
    int[][] A;
    int determinante;
    int m;
    int n;

    //Konstrutor
    Matrix(int[][] B) {
        A = B;
        m = A.length;
        n = A[0].length;
    }

    //Methoden
    void det(int[][] B) {
        intDet(B);
    }

    int intDet(int[][] B) {
        int dt = 0;
        if(m == n) {    //Testen, welche groesse die Matrix hat
            if(m == 2) {
                x2matrix(B);
            } else if(m == 3) {
                x3matrix(B);
            } else if(m == 4) {
                x4matrix(B);
            }
        } else {
            determinante = 0;
        }
        return dt;
    }

    int x2matrix(int[][] B) {    //über Definition
        int dt = B[0][0] * B[1][1] - B[0][1] * B[1][0];
        return dt;
    }

    int x3matrix(int[][] B) {    //Regel von Sarrus
        int dt =  B[0][0] * B[1][1] * B[2][2] + B[0][1] * B[1][2] * B[2][0] + B[0][2] * B[1][0] * B[2][1] - B[2][0] * B[1][1] * B[0][2] - B[2][1] * B[1][2] * B[0][0] - B[2][2] * B[1][0] * B[0][1];
        return dt;
    }

    int x4matrix(int[][] B) {    //Laplacescher Entwicklungssatz
        int dt = 0;
        int vorzeichen = 1;

        for(int i = 0; i < 4; i++) {
            dt = dt + vorzeichen * B[0][0] * intDet(untermatrix(B, i));
            vorzeichen = -vorzeichen;
        }
        return dt;
    }

    int[][] untermatrix(int[][] B, int zeile) {    //Untermatrix ohne 0-ter Spalte und einer Zeile
        int m_ = B.length - 1;
        int[][] C = new int[m_][m_];

//        reverse(B);    //löschen der 0-ten Spalte
//        shorten(B);    //
//        reverse(B);    //

        arraycopy(B, 0, C, 0, zeile);                     //Alle Zeilen außer zeile in C, D und von dort in E
        arraycopy(B, zeile + 1, C, zeile, m_ - zeile);    //

        return(C);
    }
  
  
  
 /* ArrayList<int[][]> untermatrix(int[][] B) {    //ArrayList aus n Untermatrizen
    int m_ = B.length;
    int[][] C = new int[m_][m_ - 1];
    int[][] D = new int[m_ - 1][m_ - 1];
    ArrayList<int[][]> tArrayListMatrix = new ArrayList<int[][]>();
    
    for(int i = 1; i < m_; i++) {    //Entfernen der 0-ten Spalte
      for(int j = 0; j < m_; j++) {
        C[j][i - 1] = B[j][i];
      }
    }
    for(int i = 0; i < m_; i++) {    //Entfernen der i-ten Zeile und Eintrag in die ArrayList
      D = zeileAusMatrix(C, i);
      tArrayListMatrix.add(D);     
    }
    return tArrayListMatrix;
  }  
  
  
  int[][] zeileAusMatrix(int[][] B, int zeile) {    //Entfernen einer Zeile aus der Matrix
    int m_ = B.length;
    int[][] C = new int[m_ - 1][m_];
     
    for (int i = 0, k = 0; i < m_; i++, k++) {    //Testen, ob die Zeile übernommen werden soll
      if(i == zeile) {
        k--;
        continue;
      }
      arrayCopy(B[i], C[k]);
    }
    return C;
  }*/
}