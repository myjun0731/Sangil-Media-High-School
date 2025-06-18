package Class06;

import java.util.ArrayList;

class Person {
	String name;
	int age;

	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}

	public void introduce() {
		System.out.println(name + "입니다, 나이 :" + age);
	}
}

public class Java_Code_04 {
	public static void main(String[] args) {
		ArrayList<Person> people = new ArrayList<>();

		people.add(new Person("김철수", 25));
		people.add(new Person("이영희", 30));
		people.add(new Person("박민수", 22));

		System.out.println("리스트에 저장된 사람 객체 :");
		for (Person p : people) {
			p.introduce();
		}

	}
}