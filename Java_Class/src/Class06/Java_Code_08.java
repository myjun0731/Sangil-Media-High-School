package Class06;

import java.util.*;

public class Java_Code_08 {
	public static void main(String[] args) {
		Map<String, Integer> Score = new HashMap<>();
		Scanner sc = new Scanner(System.in);
		boolean tf = true;
		Score.put("홍길동", 70);
		Score.put("김영희", 50);
		while (tf) {
			String name = "";
			System.out.println();
			System.out.println("==메뉴 선택==");
			System.out.println("1. 점수 검색");
			System.out.println("2. 점수 수정");
			System.out.println("3. 전체 출력");
			System.out.println("0. 종료");
			int select = sc.nextInt();
			switch (select) {
			case 1:
				System.out.print("검색할 이름 입력 : ");
				name = sc.next();
				if (Score.containsKey(name)) {
					System.out.println("검색 결과입니다.");
					System.out.println(name + "님의 점수 : " + Score.get(name));
				} else {
					System.out.println("존재하지 않는 이름입니다.");
				}
				break;
			case 2:
				System.out.print("수정할 이름 입력 : ");
				name = sc.next();
				if (Score.containsKey(name)) {
					System.out.print("새 점수 입력 : ");
					Score.replace(name, sc.nextInt());
				} else {
					System.out.println("존재하지 않는 이름입니다.");
				}
				break;
			case 3:
				System.out.println("--전체 점수 목록--");
				for (Map.Entry<String, Integer> entry : Score.entrySet()) {
					System.out.println("이름 : " + entry.getKey() + ", 점수 : " + entry.getValue());
				}
				break;
			case 0:
				System.out.println("종료합니다");
				tf = false;
				break;
			}
		}
	}
}