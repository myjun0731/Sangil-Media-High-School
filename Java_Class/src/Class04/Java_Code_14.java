package Class04;

class Animal4 {
	void speak() {
		System.out.println("소리를 냅니다.");
	}
}

class Dog4 extends Animal4 {
	void bark() {
		System.out.println("멍멍!");
	}
}

public class Java_Code_14 {
	public static void main(String[] args) {
		Animal4 a = new Dog4();

		a.speak();
		

	}
}