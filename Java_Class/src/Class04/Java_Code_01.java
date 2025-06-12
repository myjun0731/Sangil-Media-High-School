package Class04;

class Student {
	public String name;
	private int age;

	public void introduce() {
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
	}
}

public class Java_Code_01 {
	public static void main(String[] args) {
		Student s = new Student();
		s.name = "지후";
//		s.age = 18; - 에러(접근 제어자 private로 인한 에러)
	}
}