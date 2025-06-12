package Class04;

class Animal1 {
	void speak() {
		System.out.println("소리를 냅니다.");
	}
}

class Dog1 extends Animal1 {
	@Override
	void speak() {
		System.out.println("멍멍!");
	}
}

public class Java_Code_08 {
	public static void main(String[] args) {
		Dog1 d = new Dog1();
		d.speak();
	}
}