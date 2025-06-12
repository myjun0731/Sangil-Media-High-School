package Class04;

class Animal2 {
	void speak() {
		System.out.println("소리를 냅니다.");
	}
}

class Dog2 extends Animal2 {
	@Override
	void speak() {
		super.speak();
		System.out.println("멍멍!");
	}
}

public class Java_Code_10 {
	public static void main(String[] args) {
		Dog2 d = new Dog2();
		d.speak();
	}
}