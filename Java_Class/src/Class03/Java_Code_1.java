package Class03;

public class Java_Code_1 {
	public static void main(String[] args) {
		int[] numbers = { 10, 20, 30, 40, 50, 60 };
		int[][] a = { { 1, 2 }, { 3, 4, 5 } };

		for (int num : numbers) {
			System.out.println("값 : " + num);
		}
		System.out.println("---");
		for (int[] m : a) {
			for (int n : m) {
				System.out.println(n);
			}
		}
	}
}