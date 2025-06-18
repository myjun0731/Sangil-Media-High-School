package game;

import lobby.Unit;
import java.util.Random;
import java.util.Scanner;

public class Tutorial {
	private final Scanner sc = new Scanner(System.in);
	private final Random random = new Random();
	private Game game = new Game();
	private Unit unit;

	public void narration() {
		System.out.println("----------------------------------------");
		System.out.println("<튜토리얼 - 복도>");
		System.out.println("========================================");
		System.out.println("<나레이션>");
		System.out.println("“이 학교는 자바 실력을 키워야만 탈출할 수 있습니다.”");
		System.out.println("당신은 졸업을 앞두고 있던 평범한 고등학생.");
		System.out.println("그러나 눈을 떠보니 학교의 모든 출입구가 봉인되어 있다.");
		System.out.println("정체불명의 방송이 울려 퍼진다.");
		System.out.println("========================================");
	}

	public void start(Unit unit) {
		this.unit = unit;
		unit.setLocation("복도");

		narration();

		System.out.println("\n[" + unit.getUserName() + "]님은 지금 복도에 있습니다.");
		System.out.println("당신의 앞에는 ‘1반 교실’이라는 문패가 붙은 교실이 하나 보입니다.");
		System.out.print("▶ 1반 교실에 들어가시겠습니까? (y/n): ");
		String input = sc.next();

		if (input.equalsIgnoreCase("y")) {
			enterClassroom();
		} else {
			System.out.println("당신은 공허 속에 머뭅니다... 그러나 길은 하나뿐입니다.");
			System.out.println("용기를 내어 1반 교실로 향합니다.");
			enterClassroom();
		}

		printTutorialEndMenu();
	}

	private void enterClassroom() {
		System.out.println("\n[시스템] 1반 교실에 입장했습니다.");
		unit.setLocation("교실");
		System.out.println("교실 안은 컴퓨터와 교재들이 어지럽게 놓여 있습니다.");

		System.out.print("▶ 주변을 둘러보시겠습니까? (y/n): ");
		String input = sc.next();

		if (input.equalsIgnoreCase("y")) {
			searchClassroom();
		} else {
			System.out.println("[" + unit.getUserName() + "]님은 교실 한쪽 구석에 앉아 조용히 상황을 살핍니다.");
		}
	}

	private void searchClassroom() {
		int chance = random.nextInt(100);

		System.out.println("\n[시스템] 주변을 둘러보는 중...");
		if (chance >= 30) {
			System.out.println("[획득] 당신은 책상에 놓여있는 손전등을 발견했습니다!");
			unit.setInventory("손전등");

			System.out.println("[팁] 손전등은 어두운 공간을 조사할 때 유용하게 사용됩니다.");
		} else {
			System.out.println("너무 어두워서 아무것도 찾을 수 없습니다.");
		}
	}

	private void printTutorialEndMenu() {
		System.out.println("\n================ 튜토리얼 종료 ================");
		System.out.println("이제 본격적인 자바 학습 여정을 떠날 시간입니다!");
		System.out.println("다음 장소로 가기 전에 필요한 작업을 선택하세요.");
		System.out.println("1. 게임 접속");
		System.out.println("2. 내 정보 확인");

		System.out.print("▶ 선택: ");
		String input = sc.next();

		switch (input) {
		case "1":
			System.out.println("[시스템] 튜토리얼을 끝내고 게임에 접속합니다.");
			break;
		case "2":
			System.out.println("[" + unit.getUserName() + "]님의 정보:");
			unit.printInfo();
			printTutorialEndMenu();
			break;
		default:
			System.out.println("잘못된 입력입니다. 다시 선택해주세요.");
			printTutorialEndMenu();
		}
	}
}
