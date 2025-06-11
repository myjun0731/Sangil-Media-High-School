package Class03;

class Greeter {
	public void greet() {
		System.out.println("안녕하세요!");
	}

	public void greet(String name) {
		System.out.println(name + "님,안녕하세요!");
	}

}

public class Java_Code_10 {
	public static void main(String[] args) {
		Greeter gr = new Greeter();

		gr.greet();
		gr.greet("홍길동");
	}
}