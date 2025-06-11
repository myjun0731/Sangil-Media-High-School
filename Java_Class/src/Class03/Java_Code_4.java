package Class03;

import java.util.Scanner;

public class Java_Code_4 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("문자열 입력 : ");
		String input = sc.next();

		System.out.println("1. 문자열 길이 : " + input.length());

		System.out.println("2. 대문자로 변환: " + input.toUpperCase());
		System.out.println("3. 대문자로 변환: " + input.toLowerCase());

		System.out.print("찾고 싶은 문자 입력 : ");
		String ch = sc.next();
		int index = input.indexOf(ch);
		if (index != -1) {
			System.out.println("4. '" + ch + "' 의 위치 : " + index);
		} else {
			System.out.println("4. 해당 문자는 문자열에 없습니다.");
		}
		System.out.print("포함 여부 확인 문자 입력 : ");
		String keyword = sc.next();
		System.out.println("5. 포함 여부 : " + input.contains(keyword));

		if (input.length() >= 5) {
			System.out.println("6. 앞 5글자 출력 : " + input.substring(0, 5));
		} else {
			System.out.println("6. 문자열 길이가 5보다 짧아 자룰 수 없음.");
		}
		System.out.println("7. 공백 제거 : [" + input.trim() + "]");
		String added = input.concat(" - 문자열 실습 완료!");
		System.out.println("8. 문자열 결합 결과 : "+added);
	}
}