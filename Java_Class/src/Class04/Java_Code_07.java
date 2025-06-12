package Class04;

class Person2 {
	String name;

	void introduce() {
		System.out.println("안녕하세요, 저는 " + name + "입니다.");
	}
}

class Student1 extends Person2 {
	public void study() {
		// TODO Auto-generated method stub
		System.out.println(name + "이(가) 열심히 공부합니다.");
	}
}

class Teacher extends Person2 {
	public void teach() {
		// TODO Auto-generated method stub
		System.out.println(name + "이(가) 수업을 진행합니다.");
	}
}

public class Java_Code_07 {
	public static void main(String[] args) {
		Student1 st1 = new Student1();
		Teacher te1 = new Teacher();
		st1.name = "김학생";
		st1.introduce();
		st1.study();
		System.out.println();
		te1.name = "박선생";
		te1.introduce();
		te1.teach();
	}
}