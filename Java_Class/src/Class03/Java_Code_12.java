package Class03;

class Book {
	static String Bname;
	static String Bcreate;

	public static void setBname(String bname) {
		Bname = bname;
	}

	public static void setBcreate(String bcreate) {
		Bcreate = bcreate;
	}

}

public class Java_Code_12 {
	public static void main(String[] args) {
		String Bna[] = { "어린 왕자", "데미안", "햄릿" };
		String Bcr[] = { "생텍쥐페리", "헤르만 헤세", "셰익스피어" };
		Book[] b = new Book[3];

		for (int i = 0; i < b.length; i++) {
			b[i].setBname(Bna[i]);
			b[i].setBcreate(Bcr[i]);
			System.out.println("제목 : " + b[i].Bname + ", 저자 : " + b[i].Bcreate);
		}

	}
}