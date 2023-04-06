import java.util.Arrays;

import static java.lang.String.join;
import static java.lang.System.arraycopy;
import static java.util.Collections.nCopies;

/*
https://matheguru.com/lineare-algebra/determinante.html.
Die Erklärungen sind etwas einfacher als bei Wikipedia.
 */

public class NewMatrix {
    int[][] matrix;

    public NewMatrix(int[][] matrix) {
        this.matrix = matrix;
    }

    @Override
    public String toString() {
        // Bestimme die maximale Länge eines Elements in der Matrix.
        var maxStringSize = 0;
        for (int[] zeile : matrix) {
            for (int element : zeile) {
                var currentStringSize = String.valueOf(element).length();
                if (maxStringSize < currentStringSize) maxStringSize = currentStringSize;
            }
        }
        maxStringSize++;  // Füge ein Leerzeichen hinzu, damit die Zahlen nicht direkt aneinander gesetzt werden.

        var output = new StringBuilder();
        for (int[] zeile : matrix) {
            output.append("│");  // Matrix-Rahmen links zeichnen.

            for (int element : zeile) {
                var anzahlLeerzeichen = maxStringSize - String.valueOf(element).length();  // Anzahl der fehlenden Leerzeichen berechnen.
                output.append(join("", nCopies(anzahlLeerzeichen, " ")));  // Leerzeichen auffüllen.
                output.append(element);  // Zahlen einfügen.
            }

            output.append(" │");  // Matrix-Rahmen rechts zeichnen.
            output.append("\n");  // Neue Zeile.
        }
        return output.toString();
    }

    public long det() {
        return _det(matrix);
    }

    private long _det(int[][] matrix) {
        var m = matrix.length;
        var n = matrix[0].length;

        if (m != n) return 0;  // Beende, wenn die Matrix nicht quadratisch ist.
        if (detIs0(matrix)) return 0;  // Beende, wenn die Matrix 0 ist.

        if (m == 2)
            return x2Matrix(matrix);  // Führe die Berechnung für eine 2x2 Matrix durch.
        if (m == 3)
            return x3Matrix(matrix);  // Führe die Berechnung für eine 3x3 Matrix durch.
        return xnMatrix(matrix);  // Führe die Berechnung für eine nxn Matrix durch.
    }

    protected boolean detIs0(int[][] matrix) {
        // Überprüfe, ob eine Zeile 0 ist.
        if (zeile0(matrix)) return true;

        // Überprüfe, ob zwei Zeilen proportional (gleich) sind.
        if (zweiZeilenGleich(matrix)) return true;

        // Matrix auf die Seite legen.
        int[][] umkehrMatrix = umkehrMatrix(matrix);

        // Überprüfe, ob eine Spalte 0 ist (d.h. alle Elemente der Spalte 0).
        if (zeile0(umkehrMatrix)) return true;

        // Überprüfe, ob zwei Spalten proportional (gleich) sind.
        return zweiZeilenGleich(umkehrMatrix);
    }

    private boolean zeile0(int[][] matrix) {
        var m = matrix.length;
        var n = matrix[0].length;

        for (int[] zeile : matrix) {
            if (Arrays.equals(zeile, new int[n]))
                return true;  // new int[0] ist ein Array mit n Elementen, die alle 0 sind.
        }
        return false;
    }

    private boolean zweiZeilenGleich(int[][] matrix) {
        var m = matrix.length;
        var n = matrix[0].length;

        for (int i = 0; i < m; i++) {
            for (int j = i; j < m; j++) {
                if (i == j) continue;  // Überspringe die gleiche Zeile.
                if (Arrays.equals(matrix[i], matrix[j])) return true;
            }
        }
        return false;
    }

    private int[][] umkehrMatrix(int[][] matrix) {
        var m = matrix.length;
        var n = matrix[0].length;

        var umkehrMatrix = new int[n][m];
        for (int i = 0; i < m; i++) {  //Z
            for (int j = 0; j < n; j++) {  //S
                umkehrMatrix[j][i] = matrix[i][j];
            }
        }
        return umkehrMatrix;
    }

    private long x2Matrix(int[][] matrix) {
        return (long) matrix[0][0] * matrix[1][1] - (long) matrix[0][1] * matrix[1][0];
    }

    private long x3Matrix(int[][] matrix) {
        return (long) matrix[0][0] * matrix[1][1] * matrix[2][2]
               + (long) matrix[0][1] * matrix[1][2] * matrix[2][0]
               + (long) matrix[0][2] * matrix[1][0] * matrix[2][1]
               - (long) matrix[2][0] * matrix[1][1] * matrix[0][2]
               - (long) matrix[2][1] * matrix[1][2] * matrix[0][0]
               - (long) matrix[2][2] * matrix[1][0] * matrix[0][1];
    }

    private long xnMatrix(int[][] matrix) {
        // Laplaceschen Entwicklungsansatz anwenden
        long det = 0;
        var vorzeichen = 1;

        for (int i = 0; i < matrix.length; i++) {
            det += vorzeichen * matrix[i][0] * _det(unterMatrix(matrix, i));
            vorzeichen = -vorzeichen;
        }
        return det;
    }

    private int[][] unterMatrix(int[][] matrix, int zeile) {
        var m = matrix.length;
        var n = matrix[0].length;

        // Entferne die n-te Zeile.
        var ergebnisMatrix = entferneZeile(matrix, zeile);

        // Entferne die erste Spalte.
        ergebnisMatrix = umkehrMatrix(entferneZeile(umkehrMatrix(ergebnisMatrix), 0));
        return ergebnisMatrix;
    }


    private int[][] entferneZeile(int[][] matrix, int zeile) {
        int m = matrix.length;
        int n = matrix[0].length;
        int[][] ergebnisMatrix = new int[m - 1][n];

        for (int i = 0, k = 0; i < m; i++, k++) {
            if (i == zeile) {
                k--;
                continue;
            }
            arraycopy(matrix[i], 0, ergebnisMatrix[k], 0, n);
        }
        return ergebnisMatrix;
    }
}
