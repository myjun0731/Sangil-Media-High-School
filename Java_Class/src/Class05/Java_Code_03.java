package Class05;

interface USB {
	void connect();
}

class Mouse implements USB {

	@Override
	public void connect() {
		// TODO Auto-generated method stub
		System.out.println("마우스를 연결합니다");
	}
}

class keyboard implements USB {

	@Override
	public void connect() {
		// TODO Auto-generated method stub
		System.out.println("키보드를 연결합니다");
	}
}

public class Java_Code_03 {
	public static void main(String[] args) {
		USB device = new Mouse();
		device.connect();
	}
}