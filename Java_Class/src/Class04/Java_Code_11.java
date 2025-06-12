package Class04;

class Person5 {
	String name = "세명";

	void introduce() {
		System.out.println("이름 : " + name);
	}
}

class Student4 extends Person5 {
	int grade = 2;

	@Override
	void introduce() {
		super.introduce();
		System.out.println("학년 : " + grade);
	}
}

public class Java_Code_11 {
	public static void main(String[] args) {
		Student4 st = new Student4();
		st.introduce();
	}
}