package Class04;

class Animal {
	String name;

	void speak() {
		System.out.println("소리를 냅니다.");
	}
}

class Dog extends Animal {
	void bark() {
		System.out.println("멍멍!");
	}
}

class Cat extends Animal {
	void meow() {
		System.out.println("야옹!");
	}
}

public class Java_Code_06 {
	public static void main(String[] args) {
		Dog d = new Dog();
		d.name = "바둑이";
		d.speak();
		d.bark();
	}
}