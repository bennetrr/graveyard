public class Main {
    public static void main(String[] args) {
        int[][] matrix = {
                {1,-5, 6, 9},
                {8, 3,-2, 7},
                {7, 5, 8,-2},
                {9,-5, 3, 6}
        };

        var matrix1 = new NewMatrix(matrix);
        System.out.println(matrix1);
        System.out.println(matrix1.det());
    }
}