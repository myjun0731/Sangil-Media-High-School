package logic;

import unit.Player;
import unit.Enemy;
import java.util.Scanner;

public class CombatMode {
	private static final Scanner scanner = new Scanner(System.in);

	public static void start(Player player) {
		boolean fighting = true;

		while (fighting && player.isAlive()) {
			System.out.println("\n[ 전투 모드 ]");
			System.out.println("1. 폐허 도시");
			System.out.println("2. 기계 사냥터");
			System.out.println("3. 방사능 지대");
			System.out.println("4. 돌아가기");
			System.out.print("선택 > ");
			int choice = scanner.nextInt();
			scanner.nextLine();

			Enemy enemy = null;
			switch (choice) {
			case 1:
				enemy = new Enemy("좀비 드론", 40, 12, 5);
				break;
			case 2:
				enemy = new Enemy("기계 맹수", 60, 18, 8);
				break;
			case 3:
				enemy = new Enemy("돌연변이 병기", 80, 22, 10);
				break;
			case 4:
				fighting = false;
				continue;
			default:
				System.out.println("잘못된 선택입니다.");
				continue;
			}

			System.out.println("적이 나타났습니다! (" + enemy.getName() + ")");
			BattleManager.startBattle(player, enemy);

			if (!player.isAlive())
				break;

			System.out.println("전투를 마치고 기력을 회복합니다.");
			player.heal(20);
		}
	}
}