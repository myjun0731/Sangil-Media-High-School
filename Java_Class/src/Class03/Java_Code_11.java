package Class03;

class Student {
	String name;
	int age;
	String major;

	public Student(String name, int age, String major) {
		// TODO Auto-generated constructor stub
		this.name = name;
		this.age = age;
		this.major = major;
	}

	public void introduce() {
		System.out.println("안녕하세요! 제 이름은 " + name + "입니다.");
		System.out.println("나이는 " + age + "이고, 전공은 " + major + "입니다.");
	}

	public void study(String subject) {
		System.out.println(name + "이가 " + subject + "를 공부하고 있네요.");
	}
}

public class Java_Code_11 {
	public static void main(String[] args) {
		Student st1 = new Student("홍길동", 20, "컴공과");
		Student st2 = new Student("김영희", 21, "경영과");

		st1.introduce();
		st1.study("자료구조");
		System.out.println();
		st2.introduce();
		st2.study("화계학");
	}
}