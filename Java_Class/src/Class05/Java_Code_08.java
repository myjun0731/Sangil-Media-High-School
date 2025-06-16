package Class05;

import java.util.Scanner;

class InvalidOperatorException extends Exception {
	public InvalidOperatorException(String msg) {
		super(msg);
	}
}

class Cal1 {
	public char Cp(char sign) throws InvalidOperatorException {
		if (!(sign == '+' || sign == '-' || sign == '/' || sign == '*')) {
			throw new InvalidOperatorException("기호를 잘못 입력하셨습니다.");
		}
		return sign;
	}
}

public class Java_Code_08 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		boolean cmd = true;
		while (cmd) {
			Cal1 cp = new Cal1();
			int num1 = 0, num2 = 0;
			char sign = '+';

			try {
				System.out.print("첫번째 정수 입력 : ");
				num1 = sc.nextInt();
				System.out.print("두번째 정수 입력 : ");
				num2 = sc.nextInt();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("숫자만 입력하세요.");
			}

			System.out.print("연산자 입력(+,-,*,/) : ");
			try {
				switch (cp.Cp(sc.next().charAt(0))) {
				case '-':
					System.out.println(num1 - num2);
					break;
				case '+':
					System.out.println(num1 + num2);
					break;
				case '*':
					System.out.println(num1 * num2);
					break;
				case '/':
					try {
						System.out.println(num1 / num2);
					} catch (ArithmeticException e) {
						// TODO: handle exception
						System.out.println("0으로 나눌수 없음.");
					}
					break;
				}
			} catch (InvalidOperatorException e) {
				// TODO: handle exception
				System.out.println("예외 메시지 : " + e.getMessage());
			}
			System.out.println("계속하시겠습니까?(Y/N)");
			char yn = sc.next().charAt(0);
			if (yn == 'Y' || yn == 'y') {
				System.out.println("계속..");
			} else if (yn == 'N' || yn == 'n') {
				System.out.println("멈춥니다.");
				cmd = false;

			}
		}
	}
}