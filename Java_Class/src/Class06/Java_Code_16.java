package Class06;

class Counter extends Thread {
	public void run() {
		for (int i = 1; i <= 5; i++) {
			System.out.println(i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO: handle exception
			}
		}
	}
}

public class Java_Code_16 {
	public static void main(String[] args) {
		Counter t1 = new Counter();
		Counter t2 = new Counter();
		t1.start();
		t2.start();
	}
}