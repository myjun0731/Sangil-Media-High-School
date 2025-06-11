package Class01;

import java.util.Scanner;

public class Java_Code_4 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("이름 입력 :");
		String name = sc.nextLine();

		System.out.println("나이 입력 : ");
		int age = sc.nextInt();

		System.out.println("안녕하세요. " + name + "님!");
		System.out.println("당신은 " + age + "살 입니다.");
	}
}