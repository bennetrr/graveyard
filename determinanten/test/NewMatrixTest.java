import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class NewMatrixTest {
    @Test
    void detNichtQuadratisch() {
        // Arrange
        int[][] matrix1 = {
                {9, 8},
                {5, 8},
                {7, 4},
        };

        int[][] matrix2 = {
                {9, 8, 7, 4},
                {5, 8, 3, 8},
                {7, 4, 2, 6},
        };

        // Act
        var det1 = new NewMatrix(matrix1).det();
        var det2 = new NewMatrix(matrix2).det();

        // Assert
        assertEquals(0, det1, "Mehr Zeilen als Spalten failed");
        assertEquals(0, det2, "Mehr Spalten als Zeilen failed");
    }

    @Test
    void det0() {
        // Arrange
        int[][] matrix1 = {  // Eine Zeile 0
                {0, 0, 0},
                {3, 5, 0},
                {2, 9, 4},
        };

        int[][] matrix2 = {  // Eine Spalte
                {0, 3, 0},
                {0, 3, 5},
                {0, 2, 4},
        };

        int[][] matrix3 = {  // Zwei Zeilen gleich
                {3, 5, 0},
                {3, 5, 0},
                {2, 9, 4},
        };

        int[][] matrix4 = {  // Zwei Spalten gleich
                {3, 3, 0},
                {3, 3, 5},
                {2, 2, 4},
        };

        int[][] matrix5 = {  // Nicht 0
                {3, 2, 0},
                {3, 4, 5},
                {2, 2, 4},
        };

        // Act
        boolean det1is0 = new NewMatrix(matrix1).detIs0(matrix1);
        boolean det2is0 = new NewMatrix(matrix2).detIs0(matrix2);
        boolean det3is0 = new NewMatrix(matrix3).detIs0(matrix3);
        boolean det4is0 = new NewMatrix(matrix4).detIs0(matrix4);
        boolean det5is0 = new NewMatrix(matrix5).detIs0(matrix5);

        // Assert
        assertTrue(det1is0, "Eine Zeile 0 failed");
        assertTrue(det2is0, "Eine Spalte 0 failed");
        assertTrue(det3is0, "Zwei Zeilen gleich failed");
        assertTrue(det4is0, "Zwei Spalten gleich failed");
        assertFalse(det5is0, "Nicht null failed");
    }

    @Test
    void detX2() {
        // Arrange
        int[][] matrix1 = {
                {0, -4},
                {-8, 9},
        };

        int[][] matrix2 = {
                {2, -5},
                {-9, -1},
        };

        int[][] matrix3 = {
                {0, -4},
                {0, -7},
        };

        int[][] matrix4 = {
                {0, -6},
                {1, 6},
        };

        int[][] matrix5 = {
                {8, -3},
                {2, -8},
        };

        int[][] matrix6 = {
                {9, -8},
                {-1, 8},
        };

        int[][] matrix7 = {
                {4, 4},
                {3, -9},
        };

        int[][] matrix8 = {
                {6, 2},
                {1, 1},
        };

        int[][] matrix9 = {
                {-9, -6},
                {0, 1},
        };

        int[][] matrix10 = {
                {-9, -3},
                {-9, -10},
        };

        // Act
        var det1 = new NewMatrix(matrix1).det();
        var det2 = new NewMatrix(matrix2).det();
        var det3 = new NewMatrix(matrix3).det();
        var det4 = new NewMatrix(matrix4).det();
        var det5 = new NewMatrix(matrix5).det();
        var det6 = new NewMatrix(matrix6).det();
        var det7 = new NewMatrix(matrix7).det();
        var det8 = new NewMatrix(matrix8).det();
        var det9 = new NewMatrix(matrix9).det();
        var det10 = new NewMatrix(matrix10).det();

        // Assert
        assertEquals(-32, det1);
        assertEquals(-47, det2);
        assertEquals(0, det3);
        assertEquals(6, det4);
        assertEquals(-58, det5);
        assertEquals(64, det6);
        assertEquals(-48, det7);
        assertEquals(4, det8);
        assertEquals(-9, det9);
        assertEquals(63, det10);
    }

    @Test
    void detX3() {
        // Arrange
        int[][] matrix1 = {
                {-4, -10, -10},
                {-6, -4, -10},
                {-10, -1, -10},
        };

        int[][] matrix2 = {
                {7, -3, 2},
                {-2, 0, -2},
                {8, -7, 2},
        };

        int[][] matrix3 = {
                {0, -7, 9},
                {-6, 6, 1},
                {2, -8, 3},
        };

        int[][] matrix4 = {
                {7, -5, -2},
                {4, -2, -9},
                {0, 2, -10},
        };

        int[][] matrix5 = {
                {-7, -7, 4},
                {1, -3, 1},
                {-9, -8, 6},
        };

        int[][] matrix6 = {
                {9, -8, -2},
                {-2, -2, -10},
                {7, 1, -4},
        };

        int[][] matrix7 = {
                {0, 8, -2},
                {9, -1, 8},
                {-6, 0, 2},
        };

        int[][] matrix8 = {
                {-4, 0, -2},
                {-8, -3, -5},
                {2, -7, 8},
        };

        int[][] matrix9 = {
                {-4, 5, 8},
                {-5, -7, 1},
                {-10, -3, 1},
        };

        int[][] matrix10 = {
                {7, 2, 2},
                {-7, 1, -3},
                {-7, 5, 2},
        };

        // Act
        var det1 = new NewMatrix(matrix1).det();
        var det2 = new NewMatrix(matrix2).det();
        var det3 = new NewMatrix(matrix3).det();
        var det4 = new NewMatrix(matrix4).det();
        var det5 = new NewMatrix(matrix5).det();
        var det6 = new NewMatrix(matrix6).det();
        var det7 = new NewMatrix(matrix7).det();
        var det8 = new NewMatrix(matrix8).det();
        var det9 = new NewMatrix(matrix9).det();
        var det10 = new NewMatrix(matrix10).det();

        // Assert
        assertEquals(-180, det1);
        assertEquals(-34, det2);
        assertEquals(184, det3);
        assertEquals(50, det4);
        assertEquals(35, det5);
        assertEquals(762, det6);
        assertEquals(-516, det7);
        assertEquals(112, det8);
        assertEquals(-449, det9);
        assertEquals(133, det10);
    }

    @Test
    void detXn() {
        // Arrange
        int[][] matrix1 = {
                {5, -2, 7, 2},
                {7, 3, -3, 9},
                {-8, -3, -3, -2},
                {3, 7, -10, 5},
        };

        int[][] matrix2 = {
                {1, -10, -2, 3},
                {9, -9, -8, -9},
                {6, 3, -4, 1},
                {3, -4, 4, -4},
        };

        int[][] matrix3 = {
                {3, 9, -1, -10, -5},
                {-1, 3, -5, 7, 0},
                {-3, 7, 8, -6, 3},
                {2, -1, -2, 2, -5},
                {-5, 5, -10, -3, -4},
        };

        int[][] matrix4 = {
                {5, -8, -8, -6, -3},
                {-8, 7, 0, 5, 5},
                {9, -5, 7, 9, 1},
                {-5, 3, -2, 3, 5},
                {3, 6, -4, -8, -2},
        };

        int[][] matrix5 = {
                {0, -9, 9, 1, -3, 1},
                {-5, -3, -8, -2, -10, -3},
                {7, -10, 8, 4, 0, -5},
                {-1, -7, -3, 4, -4, 2},
                {2, -10, -3, 8, -7, 4},
                {5, -6, -8, 9, -5, -8},
        };

        int[][] matrix6 = {
                {-8, -1, 4, -6, -4, 0},
                {-6, 3, -10, -7, -7, 7},
                {6, 5, 1, -8, -6, -6},
                {8, 5, 2, -7, -1, 7},
                {4, 3, 3, 1, -9, -10},
                {7, -4, 3, 2, 6, 1},
        };

        int[][] matrix7 = {
                {-10, -6, 1, 8, 2, 6, -9},
                {-5, -7, 8, 9, -2, -9, -6},
                {1, 2, -8, -2, 5, 7, 3},
                {8, 5, 4, 6, 9, -8, 3},
                {7, -8, -3, -4, 9, 0, 9},
                {-7, 2, 7, 6, -6, 0, -2},
                {-10, 1, 0, -2, 5, 2, 0},
        };

        int[][] matrix8 = {
                {-7, -10, 5, 0, 0, 1, 9},
                {-6, 1, 7, 0, -10, 0, 2},
                {6, -6, -8, -8, -1, 2, 6},
                {2, -8, 2, 5, -7, -5, 9},
                {-6, -8, 0, 1, 9, 5, -1},
                {-6, -7, -4, 2, 1, -7, 5},
                {-4, -7, 1, 7, -6, 6, 9},
        };

        int[][] matrix9 = {
                {-10, 1, 8, -2, -9, -2, -7, 4},
                {-8, 6, 7, 8, -8, 8, 2, 7},
                {0, 0, -1, -4, 4, 8, -10, 8},
                {7, 8, 7, 2, 7, 5, 7, -10},
                {-9, 6, -1, 3, 6, -7, 3, -8},
                {-2, -3, -4, -5, 1, 4, 4, 1},
                {7, -2, -2, -7, 3, -7, 5, 8},
                {3, 3, -9, 6, 8, 7, 0, 2},
        };

        int[][] matrix10 = {
                {-7, -3, -10, 4, 6, -7, 1, -10},
                {8, 6, 9, 8, 9, -1, 1, -2},
                {4, 2, 5, -4, 2, -4, -2, 7},
                {9, -2, -9, 3, 9, -2, -1, 4},
                {1, -10, -1, 5, -5, -6, -2, 9},
                {0, -6, -5, 6, 6, -6, 2, 1},
                {-9, 0, -5, 1, -7, -2, -3, 9},
                {-6, 2, -4, 7, -9, 2, 7, 7},
        };



        // Act
        var det1 = new NewMatrix(matrix1).det();
        var det2 = new NewMatrix(matrix2).det();
        var det3 = new NewMatrix(matrix3).det();
        var det4 = new NewMatrix(matrix4).det();
        var det5 = new NewMatrix(matrix5).det();
        var det6 = new NewMatrix(matrix6).det();
        var det7 = new NewMatrix(matrix7).det();
        var det8 = new NewMatrix(matrix8).det();
        var det9 = new NewMatrix(matrix9).det();
        var det10 = new NewMatrix(matrix10).det();

        // Assert
        assertEquals(-95, det1, "X4 failed");
        assertEquals(-6076, det2, "X4 failed");
        assertEquals(-36382, det3, "X5 failed");
        assertEquals(12960, det4, "X5 failed");
        assertEquals(143823, det5, "X6 failed");
        assertEquals(678090, det6, "X6 failed");
        assertEquals(-10803495, det7, "X7 failed");
        assertEquals(-12346404, det8, "X7 failed");
        assertEquals(157229654, det9, "X8 failed");
        assertEquals(-162106460, det10, "X8 failed");
    }

    @Test
    void detXnReallyBig(){
        // Arrange
        int[][] matrix1 = {
                {-6, -1, 1, 5, 6, 2, -2, 6, -10, 8, 5, -1, -2, 7, -9},
                {-2, -7, -2, 7, 4, -9, -3, 0, -3, 7, 8, 2, -5, -3, -4},
                {4, -4, 2, -1, -4, 8, -9, 4, -7, 6, 3, 5, -2, -8, -1},
                {5, 1, 2, -8, 4, -9, -8, -10, 4, -8, -8, 9, -4, 6, -7},
                {2, 2, -9, 1, 9, 8, 5, -9, 5, -9, 8, -7, 7, -6, 9},
                {-9, 1, 4, 0, -2, 6, 7, -3, 8, 4, 0, -6, 6, -6, -3},
                {9, -2, -7, -9, 5, 4, -9, -10, 4, 1, 4, -9, -5, 5, 4},
                {-8, -3, 2, 7, 8, -3, 2, -5, 4, -2, -2, -4, -6, 5, -1},
                {0, -4, 1, 5, -2, 2, 9, 7, -4, 5, 9, -8, -7, -2, 4},
                {-2, 3, -8, -10, 3, -6, -10, -5, -6, 9, -5, 3, -8, -8, -9},
                {2, 1, 7, 6, -10, -9, -7, -9, 0, 1, -5, -10, -8, -9, -7},
                {-4, -2, -8, -9, -8, 3, 5, 2, 6, 4, 2, -8, 2, -5, -4},
                {4, -6, -3, 9, -2, -10, -4, 8, 9, 2, 1, 5, 0, 7, 0},
                {-10, 0, -4, 9, 1, 5, -2, 9, -2, 8, -8, -10, -10, 1, 0},
                {-10, 0, -6, -10, -5, -3, -9, 2, 7, 3, 2, 6, -10, -10, -5},
        };
//
//        int[][] matrix2 = {
//                {8, -10, 9, 7, -6, -3, -9, -4, 1, -1, -4, 9, -7, -2, -5},
//                {5, 4, 6, 3, 7, 7, 4, -2, 4, 5, 2, -4, -5, -9, 0},
//                {3, -2, 4, -3, -5, -7, 1, 3, 0, -8, -6, 4, 0, -10, 5},
//                {4, 4, 8, 3, 3, 2, -8, -4, 1, -3, 1, -5, 5, 4, -4},
//                {-1, 5, -5, 7, -5, 6, 3, -3, 5, 6, -1, -4, -4, -8, -5},
//                {-4, -10, 5, -2, -9, -7, -7, 5, 1, -8, -8, -7, 0, -7, -7},
//                {1, 8, -6, 2, 0, 5, 4, 1, 9, 7, -10, 4, -7, 1, 0},
//                {-1, -9, 7, -8, -3, 8, -1, 9, -8, -1, -9, -6, 8, 0, 0},
//                {-9, 7, -9, -6, -1, -1, 1, 1, 7, -5, -1, 5, 5, 3, 3},
//                {-6, 1, -8, -3, 7, -3, -6, -10, 3, -10, 4, -9, -7, -1, -9},
//                {-2, 3, 5, 5, 6, -4, -3, 3, -2, -3, -10, -4, -1, -10, 8},
//                {-6, 8, 1, -10, -3, -9, -4, 0, -8, -9, -6, 5, 3, -10, 2},
//                {7, 0, -6, 8, -6, -10, 2, -2, 7, -5, -4, -9, 5, 9, 2},
//                {-1, 7, 7, 1, 2, 9, 1, 6, 7, -10, -7, 0, 4, -1, -7},
//                {-6, -4, -7, 9, -3, -2, -2, 4, -9, 6, -2, 4, -4, -8, 1},
//        };
//
//        int[][] matrix3 = {
//                {0, -2, 0, 2, -1, -3, 9, -7, -8, -4, 1, 1, -2, 5, 7},
//                {5, -4, -6, -10, -6, 8, -5, 3, 5, -3, -3, -9, 5, 1, -4},
//                {-10, -6, 0, 8, 3, 0, 5, -7, -8, 4, -10, -6, -9, 1, 3},
//                {-9, -8, 9, -3, 2, 7, -6, -10, -1, 8, 0, 3, -2, -8, 2},
//                {0, -10, 8, 2, -8, 6, 1, -10, -9, 9, -6, -1, 9, -1, 9},
//                {7, -3, -1, 1, -7, -9, 6, -3, 9, -7, -7, 8, -7, -2, -5},
//                {-2, 4, 2, 5, 8, 6, -2, 7, -1, -6, -8, -5, -8, 6, -7},
//                {-3, 4, -2, -8, 3, -2, 0, -2, 2, -1, -1, 9, -5, 0, -6},
//                {6, -3, -3, -3, 5, 4, -9, 9, -4, -8, -4, 1, 1, -9, 3},
//                {-4, -1, 6, 9, 9, 6, -7, 9, 6, 6, 7, 2, 2, -2, -9},
//                {-8, 1, -9, 0, 4, -7, -4, 6, 5, -6, -8, -10, -4, -1, 2},
//                {-10, -3, 1, -5, 5, 4, 7, 5, 4, -1, -8, 5, -3, 7, -1},
//                {-4, 4, 7, -2, -10, -10, -3, -2, 5, -9, -4, -5, 6, 2, 5},
//                {2, 0, -9, 0, -9, 5, 7, 7, 1, 5, 5, 9, -9, -8, -2},
//                {-6, -3, 0, 6, 7, 8, 8, -5, 3, 5, 1, 7, -7, 3, -3},
//        };
//
//        int[][] matrix4 = {
//                {2, 3, -8, -5, -5, -7, 3, 8, 4, 6, -10, -6, 9, 5, -4},
//                {3, -5, -5, 0, -2, 1, -4, -3, -10, 5, -9, -6, -4, 3, -8},
//                {-8, 7, -1, 5, -8, -2, 0, -3, 7, 6, 9, 5, 8, 3, 3},
//                {-5, -7, 0, 9, -8, 9, 7, -3, -8, -7, -9, 3, 9, 0, -6},
//                {-3, -1, 8, 1, 0, 3, -8, 4, -3, 9, 3, 0, 7, 5, -5},
//                {8, 8, -1, -6, -8, 7, 2, -4, -7, 0, -3, 0, -6, 5, 4},
//                {3, -9, -10, -3, -3, -3, -3, -9, 1, -7, -5, 3, -8, 8, 2},
//                {8, 8, -10, -5, 6, 0, -5, 5, -10, 6, -4, -1, 6, -5, 3},
//                {8, -6, 1, 9, 8, -6, 9, 2, -7, 4, -2, 5, 0, -7, -7},
//                {-9, -3, 5, 3, 5, -2, -2, -2, 2, -8, -3, -9, -1, -3, 1},
//                {2, -5, 9, -1, -4, 0, 2, -4, -10, 2, 4, -7, -7, -4, -6},
//                {-10, -2, 7, 7, 5, 6, -9, 7, 9, 6, -7, 7, -6, -6, -2},
//                {7, 5, -9, -1, -4, -1, 7, 3, 2, 9, -4, 3, -4, 5, 8},
//                {-7, 3, -6, 4, 4, -7, 6, 4, -2, -3, -2, -7, 3, 8, 1},
//                {7, -8, -6, -3, -8, -4, -8, -6, 7, 3, 7, 2, 2, -3, -5},
//        };

        // Act
        var det1 = new NewMatrix(matrix1).det();
//        var det2 = new NewMatrix(matrix2).det();
//        var det3 = new NewMatrix(matrix3).det();
//        var det4 = new NewMatrix(matrix4).det();

        // Assert
        assertEquals(30140503947079228L, det1);
//        assertEquals(-44663789889511744L, det2);
//        assertEquals(55667105961969624L, det3);
//        assertEquals(140577488712348672L, det4);
    }

    @Test
    void prettyPrint() {
        // Arrange
        int[][] matrix1 = {
                {33, 5, 0},
                {6, -54, 0},
                {2, 29, -4},
        };

        // Act
        String output = new NewMatrix(matrix1).toString();

        // Assert
        assertEquals("""
                │  33   5   0 │
                │   6 -54   0 │
                │   2  29  -4 │
                """, output);
    }
}