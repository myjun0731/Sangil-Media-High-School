package Class07;

class Counter {
	int count = 0;

	public synchronized void increment() {
		count++;
	}
}

public class Java_Code_03 {
	public static void main(String[] args) {
		Counter c = new Counter();
		Thread t1 = new Thread(() -> {
			for (int i = 0; i < 100000000; i++) {
				c.increment();
			}
		});
		Thread t2 = new Thread(() -> {
			for (int i = 0; i < 100000000; i++) {
				c.increment();
			}
		});

		t1.start();
		t2.start();
		try {
			t1.join();
			t2.join();
		} catch (InterruptedException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(c.count);
	}
}