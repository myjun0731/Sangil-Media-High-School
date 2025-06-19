package Class07;

public class Java_Code_02 {
	public static void main(String[] args) {
		Thread t1 = new Thread(() -> {
			for (int i = 1; i <= 5; i++) {
				System.out.println("A:" + i);
				try {
					Thread.sleep(500);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		});
		Thread t2 = new Thread(() -> {
			for (int i = 1; i <= 5; i++) {
				System.out.println("B:" + i);
				try {
					Thread.sleep(500);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		});

		t1.start();
		try {
			t1.join();
		} catch (InterruptedException e) {
			// TODO: handle exception
		}
		t2.start();
	}
}