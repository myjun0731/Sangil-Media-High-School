package Class01;

import java.util.Scanner;

public class Java_Code_8 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("1. 저장");
		System.out.println("2. 수정");
		System.out.println("3. 삭제");
		System.out.println("4. 종료");

		System.out.print("메뉴 입력(선택) : ");
		int menu = sc.nextInt();
		switch (menu) {
		case 1:
			System.out.println("1번 선택, 저장합니다.");
			break;
		case 2:
			System.out.println("2번 선택, 수정합니다.");
			break;
		case 3:
			System.out.println("3번 선택, 삭제합니다.");
			break;
		case 4:
			System.out.println("4번 선택, 종료합니다.");
			break;
		default:
			System.out.println("다시 입력, 1~4번 사이의 숫자를 입력하시오.");
			break;
		}
		sc.close();
	}
}