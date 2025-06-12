package Class04;

class Student3 {
	static int count = 0;
	String name;

	public Student3(String name) {
		this.name = name;
		count++;
	}

	public static void printCount() {
		System.out.println("현재 학생 수 : " + count);
	}

	public void introduce() {
		System.out.println("안녕하세요 저는 " + name + "입니다.");
	}
}

public class Java_Code_04 {
	public static void main(String[] args) {

		Student3 st1 = new Student3("Jun");
		Student3 st2 = new Student3("MyJun");

		st1.introduce();
		st2.introduce();

		Student3.printCount();
	}
}