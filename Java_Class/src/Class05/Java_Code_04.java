package Class05;

interface Switch {
	void turnOn();
	void turnOff();
}

class Lamp implements Switch {

	@Override
	public void turnOn() {
		// TODO Auto-generated method stub
		System.out.println("전등 켜짐");
	}

	@Override
	public void turnOff() {
		// TODO Auto-generated method stub
		System.out.println("전등 꺼짐");
	}
}

class Fan implements Switch {

	@Override
	public void turnOn() {
		// TODO Auto-generated method stub
		System.out.println("선풍기 켜짐");
	}

	@Override
	public void turnOff() {
		// TODO Auto-generated method stub
		System.out.println("선풍기 꺼짐");
	}
}

public class Java_Code_04 {
	public static void main(String[] args) {
		Switch[] devices = { new Lamp(), new Fan() };

		for (Switch sw : devices) {
			sw.turnOn();
			sw.turnOff();
		}

	}
}