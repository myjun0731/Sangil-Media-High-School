package Class07;

class MessagerPrinter implements Runnable {
	String Num;

	public MessagerPrinter(String Num) {
		// TODO Auto-generated constructor stub
		this.Num = Num;
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		for (int i = 0; i < 3; i++) {
			System.out.println(Num + " : 메시지 출력");
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
}

public class Java_Code_01 {
	public static void main(String[] args) {
//		MessagerPrinter printer = new MessagerPrinter();
		Thread t1 = new Thread(new MessagerPrinter("t1"));
		Thread t2 = new Thread(new MessagerPrinter("t2"));
		t1.start();
		t2.start();
	}
}