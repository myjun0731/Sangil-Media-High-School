package logic;

import unit.Player;
import java.util.Scanner;

public class StoryMode {
	private static final Scanner scanner = new Scanner(System.in);

	public static void start(Player player) {
		System.out.println("\n[ 스토리 모드 ]");
		System.out.println("1. 연구소 방문");
		System.out.println("2. 고대 유적 조사");
		System.out.println("3. 연합 본부로 이동");
		System.out.println("4. 돌아가기");
		System.out.print("선택 > ");

		int choice = scanner.nextInt();
		scanner.nextLine();

		switch (choice) {
		case 1:
			System.out.println("AI 연구소에서 이상한 신호를 감지했습니다. 미스터리한 기계 장치 발견!");
			player.addItem("회복제", 1);
			break;
		case 2:
			System.out.println("고대 유적에서 데이터칩을 발견했습니다. EXP +100!");
			player.gainExp(100);
			break;
		case 3:
			System.out.println("연합 본부에서 사이드 퀘스트를 부여받았습니다. 골드 +200");
			player.addGold(200);
			break;
		default:
			System.out.println("이전 메뉴로 돌아갑니다.");
		}
	}
}