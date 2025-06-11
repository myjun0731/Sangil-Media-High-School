package Class03;

import java.util.Scanner;

public class Java_Code_6 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("전화번호 입력 : ");
		String phoneNumber = sc.next();

		String Number[] = phoneNumber.split("-");

		for (String n : Number) {
			System.out.print(n);
		}

		System.out.print("문자열 입력 : ");
		String txt = sc.next();

		for (int i = txt.length() - 1; i >= 0; i--) {
			System.out.print(txt.charAt(i));
		}
	}
}