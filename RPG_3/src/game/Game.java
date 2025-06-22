// Game.java
package game;

import logic.CombatMode;
import logic.StoryMode;
import unit.Player;
import system.*;

import java.util.Scanner;

public class Game {
	private Player player;
	private Shop shop;
	private final Scanner scanner = new Scanner(System.in);
	private boolean isRunning = true;

	public Game() {
		// TODO Auto-generated constructor stub
		shop = new Shop();
	}

	public void start() {
		createPlayer();

		while (isRunning && player.isAlive()) {
			showMainMenu();
		}

		endGame();
	}

	private void createPlayer() {
		System.out.println("=== 텍스트 RPG에 오신 것을 환영합니다 ===");
		System.out.print("플레이어 이름을 입력하세요: ");
		String name = scanner.nextLine();
		player = new Player(name, 100, 20, 10);
		System.out.println("환영합니다, " + player.getName() + " 님.");
	}

	private void showMainMenu() {
		System.out.println("\n=== 메인 메뉴 ===");
		System.out.println("1. 스토리 모드");
		System.out.println("2. 전투 모드");
		System.out.println("3. 상태 보기");
		System.out.println("4. 상점 이용");
		System.out.println("5. 인벤토리");
		System.out.println("6. 게임 종료");
		System.out.print("선택 > ");

		int choice = scanner.nextInt();
		scanner.nextLine();

		switch (choice) {
		case 1:
			StoryMode.start(player);
			break;
		case 2:
			CombatMode.start(player);
			break;
		case 3:
			player.printStatus();
			break;
		case 4:
			shop.enterShop(player);
			break;
		case 5:
			player.openInventory();
			break;
		case 6:
			isRunning = false;
			break;
		default:
			System.out.println("올바른 번호를 입력하세요.");
		}
	}

	private void endGame() {
		System.out.println("\n=== 게임 종료 ===");
		if (!player.isAlive()) {
			System.out.println("당신은 전투에서 패배했습니다...");
		} else {
			System.out.println("게임을 종료합니다. 수고하셨습니다!");
		}
	}

	public static void main(String[] args) {
		new Game().start();
	}
}
