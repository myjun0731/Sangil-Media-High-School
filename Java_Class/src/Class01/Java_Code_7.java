package Class01;

import java.util.Scanner;

public class Java_Code_7 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		final String setID = "admin";
		final String setPW = "1234";
		final String setID_Guest = "guest";
		final String setPW_Guest = "0000";
		boolean login = false;

		// 입력
		System.out.print("ID 입력:");
		String ID = sc.next();

		System.out.print("PW 입력:");
		String PW = sc.next();

		// 판단
		login = (setID.equals(ID) && setPW.equals(PW)) || (setID_Guest.equals(ID) || setPW_Guest.equals(PW));

		// 출력
		if (login) {
			System.out.println("로그인 성공");
		} else {
			System.out.println("로그인 실패");
		}
		sc.close();
	}
}