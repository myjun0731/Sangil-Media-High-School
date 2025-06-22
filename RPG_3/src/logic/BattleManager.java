// BattleManager.java
package logic;

import unit.Player;
import unit.Enemy;
import java.util.Scanner;

public class BattleManager {
	private static final Scanner scanner = new Scanner(System.in);

	public static void startBattle(Player player, Enemy enemy) {
		System.out.println("전투 시작!");
		while (player.isAlive() && enemy.isAlive()) {
			System.out.println("\n[ 전투 메뉴 ]");
			System.out.println("플레이어 HP: " + player.getHp() + " | 적 HP: " + enemy.getHp());
			System.out.println("HP 차이: " + Math.abs(player.getHp() - enemy.getHp()));
			System.out.println("1. 공격");
			System.out.println("2. 아이템 사용");
			System.out.print("선택 > ");

			int choice = scanner.nextInt();
			scanner.nextLine();

			if (choice == 1) {
				player.attack(enemy);
			} else if (choice == 2) {
				System.out.println("아이템 사용 기능은 현재 전투 중 제한됩니다.");
			} else {
				System.out.println("잘못된 입력입니다.");
				continue;
			}

			if (enemy.isAlive()) {
				enemy.attack(player);
			}
		}

		if (player.isAlive()) {
			System.out.println("\n전투 승리! 골드 100, EXP 80 획득.");
			player.addGold(100);
			player.gainExp(80);
		} else {
			System.out.println("\n전투에서 패배하였습니다...");
		}
	}
}
