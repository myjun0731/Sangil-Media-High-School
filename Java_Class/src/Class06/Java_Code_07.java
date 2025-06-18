package Class06;

import java.util.*;

public class Java_Code_07 {
	public static void main(String[] args) {
		Map<String, String> phoneBook = new HashMap<>();

		phoneBook.put("홍길동", "010-1234-5678");
		phoneBook.put("김영희", "010-9876-5432");

		System.out.println("홍길동의 번호 : " + phoneBook.get("홍길동"));

		if (phoneBook.containsKey("김영희")) {
			System.out.println("김영희가 연락처에 있습니다.");
		}
		System.out.println();
		phoneBook.remove("홍길동");
		System.out.println("--연락처 목록--");
		for (String name : phoneBook.keySet()) {
			System.out.println(name);
		}
		System.out.println();
		System.out.println("--전체 연락처 목록--");
		for (Map.Entry<String, String> entry : phoneBook.entrySet()) {
			System.out.println(entry.getKey() + " : " + entry.getValue());
		}
	}
}