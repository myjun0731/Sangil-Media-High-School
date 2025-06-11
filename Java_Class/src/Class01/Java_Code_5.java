package Class01;

import java.util.Scanner;

public class Java_Code_5 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		System.out.print("국어점수입력:");
		int ko = sc.nextInt();
		System.out.print("수학점수입력:");
		int math = sc.nextInt();
		System.out.print("영어점수입력:");
		int eng = sc.nextInt();

		int total = ko + math + eng;
		double avg = total / 3.0;

		boolean passkor = ko >= 60;
		boolean passmath = math >= 60;
		boolean passeng = eng >= 60;
		boolean passAll = passkor && passmath && passeng;

		boolean highScore = avg >= 90;
		boolean warning = avg < 60 || !passAll;

		System.out.println("총점 : " + total);
		System.out.println("평균 : " + avg);
		System.out.println("개별과목 통과 여부 : " + passAll);
		System.out.println("우수 학생 여부 : " + highScore);
		System.out.println("경고 대상 여부 : " + warning);

		sc.close();
	}
}