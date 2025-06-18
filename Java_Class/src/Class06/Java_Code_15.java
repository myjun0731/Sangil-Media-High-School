package Class06;

class myThread extends Thread {
	public void run() {
		System.out.println("스레드 실행 중..");
	}
}

public class Java_Code_15 {
	public static void main(String[] args) {
		myThread t = new myThread();
		t.start();
		t.run();
	}
}