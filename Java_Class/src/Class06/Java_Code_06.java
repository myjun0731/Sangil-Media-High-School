package Class06;

import java.util.*;

public class Java_Code_06 {
	public static void main(String[] args) {
		HashSet<String> student = new HashSet<>();
		Scanner sc = new Scanner(System.in);
		boolean tf = true;

		while (tf) {
			System.out.print("이름 입력 : ");
			String name = sc.next();
			if (student.contains(name)) {
				System.out.println("이미 존재하는 이름입니다.");
			} else if (name.equals("종료")) {
				tf = false;
			} else {
				System.out.println("등록 되었습니다.");
				student.add(name);
			}
		}
		System.out.println("\n==== 학생 목록 ==== \n" + student);
	}
}