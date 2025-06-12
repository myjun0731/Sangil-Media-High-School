package Class04;

class Person4 {
	void speak() {
		System.out.println("Hello");
	}
}

class Korean extends Person4 {
	@Override
	void speak() {
		System.out.println("안녕하세요");
	}
}

public class Java_Code_09 {
	public static void main(String[] args) {
		Korean ko = new Korean();
		ko.speak();
	}
}