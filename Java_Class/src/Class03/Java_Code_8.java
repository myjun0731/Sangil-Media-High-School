package Class03;

import java.util.Scanner;

class Person {
	String name;
	int id;
	int age;

	Person(String name, int id, int age) {
		// TODO Auto-generated constructor stub
		this.name = name;
		this.id = id;
		this.age = age;
	}
	

}

public class Java_Code_8 {
	public static void main(String[] args) {
		Person p1 = new Person("홍길동", 1234, 28);
		Person p2 = new Person("홍길순", 12345, 28);
	}
}