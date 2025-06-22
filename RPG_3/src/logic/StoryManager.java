package logic;

import unit.Player;
import util.Util;

import java.util.Scanner;

public class StoryManager {
	private static final Scanner scanner = new Scanner(System.in);

	// ▶ 인트로 챕터: 선택지 기반 분기 반환
	public static int intro(Player player) {
		Util.printDivider();
		Util.delayedPrint("4023년. AI가 지배하는 도시", 20);
		Util.delayedPrint(player.getName() + " 님은 폐허가 된 연구소에 숨어 있습니다.", 10);
		Util.delayedPrint("갑자기 경고음이 울리며 AI 드론이 접근합니다!", 5);
		Util.printDivider();

		System.out.println("당신의 선택은?");
		System.out.println("1. 드론과 전투를 준비한다");
		System.out.println("2. 숨는다");
		System.out.println("3. 다른 출구를 탐색한다");
		System.out.print("선택 > ");

		int choice = getUserChoice(1, 3);

		switch (choice) {
		case 1 -> {
			Util.printAction("당신은 무기를 꺼내 들고 전투를 준비합니다.");
			return 1; // → Battle
		}
		case 2 -> {
			Util.printAction("숨었지만 AI는 감지에 능숙합니다...");
			if (Math.random() < 0.5) {
				Util.printAction("당신은 들켰습니다! 강제 전투 돌입!");
				return 1; // Battle
			} else {
				Util.printAction("성공적으로 숨었습니다. 체력 회복 +10");
				player.heal(10);
				return 2; // Bonus
			}
		}
		case 3 -> {
			Util.printAction("다른 출구를 찾았지만, 자물쇠가 걸려있습니다.");
			System.out.println("해킹을 시도하시겠습니까?");
			System.out.println("1. 해킹 시도  |  2. 돌아간다");
			System.out.print("선택 > ");
			int sub = getUserChoice(1, 2);
			if (sub == 1) {
				if (Math.random() < 0.7) {
					Util.printAction("해킹 성공! 보급 키트를 얻었다.");
					player.addItem("회복제", 1);
					return 2; // Bonus
				} else {
					Util.printAction("해킹 실패! 경고음이 울리고 적이 다가온다!");
					return 1; // Battle
				}
			} else {
				Util.printAction("당신은 처음 자리로 돌아갑니다...");
				return 0; // No Action
			}
		}
		default -> {
			System.out.println("예기치 않은 오류");
			return 0;
		}
		}
	}

	// ▶ 사용자 선택 유효성 검사
	private static int getUserChoice(int min, int max) {
		int choice;
		while (true) {
			try {
				choice = Integer.parseInt(scanner.nextLine());
				if (choice >= min && choice <= max) {
					return choice;
				}
				System.out.print("[" + min + "~" + max + "] 중에 선택하세요 > ");
			} catch (NumberFormatException e) {
				System.out.print("숫자로 입력하세요 > ");
			}
		}
	}
}
