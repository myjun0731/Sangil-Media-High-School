package Class06;

@FunctionalInterface
interface Calculator1 {
	int operate(int a, int b);
}

public class Java_Code_14 {
	public static void main(String[] args) {
		Calculator1 add = (a, b) -> a + b;
		int addResult = add.operate(5, 3);

		Calculator1 sub = (a, b) -> a - b;
		int subResult = sub.operate(5, 3);

		Calculator1 mul = (a, b) -> a * b;
		int mulResult = mul.operate(5, 3);

		Calculator1 div = (a, b) -> a / b;
		int divResult = div.operate(5, 3);

		System.out.println("덧셈 계산 결과 : " + addResult);
		System.out.println("뺄셈 계산 결과 : " + subResult);
		System.out.println("곱셈 계산 결과 : " + mulResult);
		System.out.println("나눗셈 계산 결과 : " + divResult);
	}
}