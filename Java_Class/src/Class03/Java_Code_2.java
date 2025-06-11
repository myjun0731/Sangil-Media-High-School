package Class03;

public class Java_Code_2 {
	public static void main(String[] args) {
		int[][] score = { { 90, 85, 78 }, { 88, 92, 95 }, { 70, 60, 80 } };
		int Class = 1;
		for (int Num[] : score) {
			System.out.println();
			System.out.print(Class + "번 학생 점수 : ");
			int sum = 0;
			for (int n : Num) {
				System.out.print(n + " ");
				sum += n;
			}
			System.out.println();
			double avg = (double) sum / Num.length;
			System.out.println(Class + "번 평균 :" + avg);
			Class++;
		}
	}
}