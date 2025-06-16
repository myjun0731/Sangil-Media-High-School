package Class05;

public class Java_Code_06 {
	public static void main(String[] args) {
		try {
			int result = 10 / 0;
			System.out.println("결과 : " + result);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("0으로 나눌 수 없습니다.");
		}
	}
}