package Class03;

class Calculator2 {
	int add(int a, int b) {
		return a + b;
	}

	Double add(Double a, Double b) {
		return a + b;
	}

	int add(int a) {
		return a + 10;
	}

}

public class Java_Code_9 {
	public static void main(String[] args) {
		Calculator2 c = new Calculator2();
		System.out.println(c.add(5, 3));
		System.out.println(c.add(2.5, 3.1));
		System.out.println(c.add(7));
	}
}