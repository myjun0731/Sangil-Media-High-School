package Class03;

import java.util.Scanner;

class Calculator {
	public int add(int a, int b) {
		return a + b;
	}

	public int sub(int a, int b) {
		return a - b;
	}
}

public class Java_Code_7 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Calculator cal = new Calculator();
		System.out.print("첫번째 수 :");
		int a = sc.nextInt();
		System.out.print("두번째 수 :");
		int b = sc.nextInt();

		System.out.println("덧셈 : " + cal.add(a, b));
		System.out.println("뺄셈 : " + cal.sub(a, b));
	}
}