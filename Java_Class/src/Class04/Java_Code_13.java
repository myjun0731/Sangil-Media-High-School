package Class04;

class Animal3 {
	void speak() {
		System.out.println("소리를 냅니다.");
	}
}

class Dog3 extends Animal3 {
	@Override
	void speak() {
		System.out.println("멍멍!");
	}
}

class Cat3 extends Animal3 {
	@Override
	void speak() {
		System.out.println("야옹!");
	}
}

public class Java_Code_13 {
	public static void main(String[] args) {
		Animal3 Ar[] = { new Dog3(), new Cat3() };
		for (int i = 0; i < Ar.length; i++) {
			Ar[i].speak();
		}
	}
}