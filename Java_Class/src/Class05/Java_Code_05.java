package Class05;

import java.util.Scanner;

interface Calculator {
	int add(int a, int b);

	default int mult(int a, int b) {
		return a * b;
	}

	static int sub(int a, int b) {
		return a - b;
	}
}

class Cal implements Calculator {
	@Override
	public int add(int a, int b) {
		// TODO Auto-generated method stub
		return a + b;
	}
}

public class Java_Code_05 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Calculator c = new Cal();
		
		System.out.println("덧셈");
		System.out.println(c.add(sc.nextInt(), sc.nextInt()));
		
		System.out.println("곱샘");
		System.out.println(c.mult(sc.nextInt(),sc.nextInt()));
		
		System.out.println("뺄셈");
		System.out.println(Calculator.sub(sc.nextInt(),sc.nextInt()));
	}
}