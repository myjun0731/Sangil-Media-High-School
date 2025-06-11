package Class01;

public class Java_Code_3 {
	public static void main(String[] args) {
		int samll = 100;
		long big = samll;
		double dbl = big;

		System.out.println("자동 형 변환 결과");
		System.out.println("int -> long : " + big);
		System.out.println("long -> double : " + dbl);

		double d = 123.456;
		int i = (int) d;

		long l = 10000000000L;
		int i2 = (int) l;

		System.out.println("강제 형 변환 결과");
		System.out.println("double -> int : " + i);
		System.out.println("long -> int (값 손실) : " + i2);

	}
}