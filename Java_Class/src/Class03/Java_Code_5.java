package Class03;

import java.util.Scanner;

public class Java_Code_5 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("이메일 주소 입력 : ");
		String email = sc.next();
		if (email.contains("@")) {
			String[] Word = email.split("@");

			switch (Word[1]) {
			case "naver.com":
				System.out.print("네이버 계정, ");
				break;
			case "gmail.com":
				System.out.print("구글 계정, ");
				break;
			}

			System.out.println("올바른 이메일 형식입니다.");
		} else {
			System.out.println("잘못된 이메일 형식입니다.");
		}
	}
}