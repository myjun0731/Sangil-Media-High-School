package Class01;

import java.util.Scanner;

public class Java_Code_6 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		System.out.print("점수 입력:");
		int Score = sc.nextInt();

		if (Score >= 60) {
			System.out.println("합격");
		}
		if (Score >= 90) {
			System.out.println("A등급");
		} else {
			System.out.println("A등급 아님");
		}

		if (Score >= 90) {
			System.out.println("수");
		} else if (Score >= 80) {
			System.out.println("우");
		} else if (Score >= 70) {
			System.out.println("미");
		} else {
			System.out.println("그 외");
		}

		sc.close();
	}
}