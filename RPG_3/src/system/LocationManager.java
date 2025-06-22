package system;

import logic.BattleManager;
import logic.CombatMode;
import logic.StoryManager;
import logic.StoryMode;
import unit.Enemy;
import unit.Player;

import java.util.*;

public class LocationManager {
	private final Player player;
	private final Scanner scanner = new Scanner(System.in);
	private boolean isRunning = true;
	private final Shop shop = new Shop();

	public LocationManager(Player player) {
		this.player = player;
	}

	private void showMainMenu() {
		System.out.println("\n=== 메인 메뉴 ===");
		System.out.println("1. 스토리 모드");
		System.out.println("2. 전투 모드");
		System.out.println("3. 상태 보기");
		System.out.println("4. 게임 종료");
		System.out.print("선택 > ");

		int choice = scanner.nextInt();
		scanner.nextLine();

		switch (choice) {
		case 1:
			StoryMode.start(player); // 새로운 클래스
			break;
		case 2:
			CombatMode.start(player); // 새로운 클래스
			break;
		case 3:
			player.printStatus();
			break;
		case 4:
			isRunning = false;
			break;
		default:
			System.out.println("잘못된 선택입니다.");
		}
	}

	private void enterLab() {
		System.out.println("\n[연구소] 폐허가 된 연구소에 도착했습니다...");
		int storyResult = StoryManager.intro(player);
		if (storyResult == 1) {
			Enemy drone = new Enemy("AI 감시 드론", 50, 15, 5);
			BattleManager.startBattle(player, drone);
		} else if (storyResult == 2) {
			System.out.println("연구소에서 회복 키트를 찾았습니다! HP 30 회복");
			player.heal(30);
		} else {
			System.out.println("연구소에서 아무 일도 일어나지 않았습니다.");
		}
	}

	private void enterBattlefield() {
		System.out.println("\n[전쟁터] 적들이 출몰하는 전쟁터에 들어섰습니다...");
		Enemy enemy = new Enemy("적병", 70, 18, 8);
		BattleManager.startBattle(player, enemy);
	}
}
