package Class01;

import java.util.Scanner;

public class Java_Code_9 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		double Sum = 0;
		System.out.println("전기 요금 계산기");
		System.out.println("전기 사용량 : ");
		int Kwh = sc.nextInt();

		switch (Kwh / 10) {
		case 1:
			Sum += (Kwh * 60.7) + 410;
			break;
		case 2:
			Sum += (100 * 60.7) * (Kwh * 125.9) + 910;
			break;
		case 3:
			Sum += (100 * 125.9) * (100 * 60.7) * (Kwh * 125.9) + 1600;
			break;
		case 4:
			Sum += (100 * 187.9) * (100 * 125.9) * (100 * 60.7) * (Kwh * 125.9) + 3850;
			break;
		case 5:
			Sum += (100 * 280.6) * (100 * 187.9) * (100 * 125.9) * (100 * 60.7) * (Kwh * 125.9) + 1600;
			break;
		case 6:
			Sum += (100 * 12940) * (100 * 280.6) * (100 * 187.9) * (100 * 125.9) * (100 * 60.7) * (Kwh * 125.9) + 1600;
			break;

		}
		sc.close();
	}
}