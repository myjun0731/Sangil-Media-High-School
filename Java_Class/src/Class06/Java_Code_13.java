package Class06;

@FunctionalInterface
interface Calculator {
	int operate(int a, int b);
}

public class Java_Code_13 {
	public static void main(String[] args) {
		Calculator add = (a, b) -> a + b;
		int result = add.operate(5, 3);
		System.out.println("계산 결과 : " + result);
	}
}