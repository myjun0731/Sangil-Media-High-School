package Class04;

class Student2 {
	private String name;
	private int grade;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		if (grade >= 1) {
			this.grade = grade;
		}
	}
}

public class Java_Code_03 {
	public static void main(String[] args) {
		Student2 st = new Student2();
		st.setName("명준");
		st.setGrade(19);
		System.out.println("이름 : " + st.getName());
		System.out.println("학년 : " + st.getGrade());
	}
}