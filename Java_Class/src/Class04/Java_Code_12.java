package Class04;

class Phone {
	String name = "세명";

	void call() {
		System.out.println("전화 연결 중..");
	}
}

class SmartPhone extends Phone {
	@Override
	void call() {
		super.call();
		System.out.println("화면에서 통화 앱 실행");
	}
}

public class Java_Code_12 {
	public static void main(String[] args) {
		SmartPhone sp = new SmartPhone();
		sp.call();
	}
}