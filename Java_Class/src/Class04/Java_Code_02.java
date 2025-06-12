package Class04;

class Person {
	private String name;
	private int age;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		if (age >= 0) {
			this.age = age;
		}
	}
}

public class Java_Code_02 {
	public static void main(String[] args) {
		Person p = new Person();
		p.setName("Jun");
		p.setAge(19);
		System.out.println("Name : " + p.getName());
		System.out.println("Age : " + p.getAge());
	}
}