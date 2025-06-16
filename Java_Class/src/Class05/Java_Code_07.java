package Class05;

public class Java_Code_07 {
	public static void main(String[] args) {
		try {
			String s = null;
			System.out.println(s.length());
		} catch (NullPointerException e) {
			System.out.println("문자열이 Null 입니다.");
		} catch (Exception e) {
			System.out.println("예외 발생");
		}
	}
}