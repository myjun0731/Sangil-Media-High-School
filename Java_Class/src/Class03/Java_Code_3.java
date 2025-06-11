package Class03;

public class Java_Code_3 {
	public static void main(String[] args) {
		String s1 = "Hi";
		String s2 = "Hi";
		String s3 = new String("Hi");

		System.out.println(s1 == s2);
		System.out.println(s1 == s3);
		System.out.println(s1.equals(s3));

	}
}