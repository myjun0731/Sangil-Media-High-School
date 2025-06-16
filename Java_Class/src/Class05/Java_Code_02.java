package Class05;

abstract class Person {
	String name;

	public Person(String name) {
		// TODO Auto-generated constructor stub
		this.name = name;
	}

	abstract void printInfo();
}

class Student extends Person {
	int grade;

	public Student(String name, int grade) {
		// TODO Auto-generated constructor stub
		super(name);
		this.grade = grade;
	}

	@Override
	void printInfo() {
		// TODO Auto-generated method stub
		System.out.println("학생 이름 : " + name + ", 학년 : " + grade);
	}
}

class Teacher extends Person {
	String subject;

	public Teacher(String name, String subject) {
		super(name);
		this.subject = subject;
	}

	@Override
	void printInfo() {
		// TODO Auto-generated method stub
		System.out.println("교사 이름 : " + name + ", 과목 : " + subject);
	}

}

public class Java_Code_02 {
	public static void main(String[] args) {
		Person[] Person = { new Student("김철수", 2), new Teacher("박선생", "수학"), new Student("이영희", 4) };
		for (Person p : Person) {
			p.printInfo();
		}
	}
}