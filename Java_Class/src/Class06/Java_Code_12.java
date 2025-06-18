package Class06;

class Person1 {
	String name;
	int age;

	public Person1(String name, int age) {
		this.name = name;
		this.age = age;
	}

	public void introduce() {
		System.out.println(name + "입니다, 나이 : " + age);
	}
}

public class Java_Code_12 {
	public static void main(String[] args) {
		Person1 p = new Person1("홍길동", 25) {
			@Override
			public void introduce() {
				System.out.println("안녕하세요." + name + "입니다. 저의 나이는 " + age + "살 입니다.");
			}
		};
		p.introduce();
	}
}