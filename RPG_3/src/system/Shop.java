package system;

import unit.Player;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Shop {
	private final Map<String, Integer> items = new HashMap<>(); // 아이템명 -> 가격
	private final Scanner scanner = new Scanner(System.in);

	public Shop() {
		items.put("회복제", 50);
		items.put("철검", 150);
		items.put("강철검", 300);
		items.put("강철갑옷", 300);
	}

	public void enterShop(Player player) {
		System.out.println("=== 상점에 입장했습니다 ===");
		boolean shopping = true;

		while (shopping) {
			System.out.println("\n보유 골드: " + player.getGold());
			System.out.println("구매 가능한 아이템 목록:");
			int i = 1;
			for (String item : items.keySet()) {
				System.out.println(i + ". " + item + " - " + items.get(item) + "골드");
				i++;
			}
			System.out.println(i + ". 나가기");
			System.out.print("구매할 번호를 입력하세요: ");

			int choice;
			try {
				choice = Integer.parseInt(scanner.nextLine());
			} catch (NumberFormatException e) {
				System.out.println("숫자를 입력해주세요.");
				continue;
			}

			if (choice == i) {
				System.out.println("상점을 나갑니다.");
				shopping = false;
				continue;
			}

			if (choice < 1 || choice > items.size()) {
				System.out.println("올바른 번호를 선택해주세요.");
				continue;
			}

			String selectedItem = (String) items.keySet().toArray()[choice - 1];
			int price = items.get(selectedItem);

			if (player.getGold() >= price) {
				player.addGold(-price);
				player.addItem(selectedItem, 1);
				System.out.println(selectedItem + "를 구매했습니다.");
			} else {
				System.out.println("골드가 부족합니다.");
			}
		}
	}
}
