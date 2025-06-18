package Class06;

import java.util.ArrayList;
import java.util.Scanner;

public class Java_Code_03 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		ArrayList<String> list = new ArrayList<>();
		boolean tf = true;
		while (tf) {
			String name = null;
			System.out.println("1. 추가 | 2. 삭제 | 3. 전체보기 | 4. 검색 | 0. 종료");
			int select = sc.nextInt();
			switch (select) {
			case 1:
				System.out.print("[추가] 이름 입력 :");
				name = sc.next();
				list.add(name);
				System.out.println("추가되었습니다.");
				break;
			case 2:
				System.out.print("[삭제] 이름 입력 :");
				name = sc.next();
				list.remove(name);
				System.out.println("삭제되었습니다.");
				break;
			case 3:
				System.out.println("학생 이름 목록");
				for (String n : list) {
					System.out.println(n);
				}
				break;
			case 4:
				System.out.print("[검색] 이름 입력 :");
				name = sc.next();
				if (list.contains(name)) {
					System.out.println(name + "님이 목록에 있습니다.");
				} else {
					System.out.println(name + "님이 목록에 없습니다.");
				}
				break;
			case 0:
				System.out.println("종료합니다.");
				tf = false;
				break;

			}

		}
	}
}