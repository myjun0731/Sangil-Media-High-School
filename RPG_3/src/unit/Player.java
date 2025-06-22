package unit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class Player {
	private final String name;
	private int hp;
	private int mp;
	private int atk;
	private int def;

	private int level;
	private int exp;
	private int gold;

	private final Map<String, Integer> inventory = new HashMap<>();
	private Scanner sc = new Scanner(System.in);

	private String equippedWeapon = null;
	private String equippedArmor = null;

	// 무기/방어구 보너스
	private static final Map<String, Integer> weaponBonus = new HashMap<>();
	private static final Map<String, Integer> armorBonus = new HashMap<>();
	static {
		weaponBonus.put("철검", 10);
		weaponBonus.put("강철검", 20);
		weaponBonus.put("레이저블레이드", 40);

		armorBonus.put("가죽갑옷", 8);
		armorBonus.put("강철갑옷", 15);
	}

	// 생성자
	public Player(String name, int hp, int atk, int def) {
		this.name = name;
		this.hp = hp;
		this.mp = 30;
		this.atk = atk;
		this.def = def;
		this.level = 1;
		this.exp = 0;
		this.gold = 500;

		// 기본 아이템
		inventory.put("회복제", 2);
	}

	// 경험치 획득 및 레벨업 처리
	public void gainExp(int amount) {
		System.out.println("▶ " + amount + " EXP를 획득했습니다!");
		this.exp += amount;
		checkLevelUp();
	}

	private void checkLevelUp() {
		int requiredExp = level * 100;
		while (exp >= requiredExp) {
			exp -= requiredExp;
			levelUp();
			requiredExp = level * 100;
		}
	}

	private void levelUp() {
		level++;
		hp += 20;
		mp += 10;
		atk += 5;
		def += 3;
		System.out.println("📈 LEVEL UP! → Lv." + level);
		System.out.println("스탯 증가! HP+20, MP+10, ATK+5, DEF+3");
	}

	// 공격력/방어력 보너스 반영
	public int getTotalAtk() {
		int bonus = 0;
		if (equippedWeapon != null && weaponBonus.containsKey(equippedWeapon)) {
			bonus = weaponBonus.get(equippedWeapon);
		}
		return atk + bonus;
	}

	public int getTotalDef() {
		int bonus = 0;
		if (equippedArmor != null && armorBonus.containsKey(equippedArmor)) {
			bonus = armorBonus.get(equippedArmor);
		}
		return def + bonus;
	}

	// 장비 장착
	public boolean equipItem(String itemName) {
		if (!inventory.containsKey(itemName) || inventory.get(itemName) < 1) {
			System.out.println("인벤토리에 해당 아이템이 없습니다.");
			return false;
		}

		if (weaponBonus.containsKey(itemName)) {
			equippedWeapon = itemName;
			System.out.println("[" + itemName + "] 무기를 장착했습니다! (+ATK " + weaponBonus.get(itemName) + ")");
			return true;
		} else if (armorBonus.containsKey(itemName)) {
			equippedArmor = itemName;
			System.out.println("[" + itemName + "] 방어구를 장착했습니다! (+DEF " + armorBonus.get(itemName) + ")");
			return true;
		}

		System.out.println("이 아이템은 장착할 수 없습니다.");
		return false;
	}

	// 공격
	public void attack(Enemy enemy) {
		int damage = Math.max(getTotalAtk() - enemy.getDef(), 0);
		enemy.takeDamage(damage);
		System.out.println(name + "이(가) " + damage + "의 피해를 입혔습니다!");
	}

	// 피해 입기
	public void takeDamage(int damage) {
		hp -= damage;
		if (hp < 0)
			hp = 0;
		System.out.println(name + "이(가) " + damage + "의 피해를 입었습니다! (HP: " + hp + ")");
	}

	// 회복
	public void heal(int amount) {
		hp += amount;
		if (hp > getMaxHp())
			hp = getMaxHp();
		System.out.println(name + "의 HP가 " + amount + " 회복되었습니다. (HP: " + hp + ")");
	}

	public void useMp(int amount) {
		mp -= amount;
		if (mp < 0)
			mp = 0;
	}

	// 아이템 사용
	public boolean useItem(String itemName) {
		if (inventory.containsKey(itemName) && inventory.get(itemName) > 0) {
			inventory.put(itemName, inventory.get(itemName) - 1);
			if (inventory.get(itemName) == 0) {
				inventory.remove(itemName);
			}
			System.out.println(itemName + "을(를) 사용했습니다.");
			return true;
		} else {
			System.out.println("해당 아이템이 없습니다.");
			return false;
		}
	}

	public void addItem(String itemName, int quantity) {
		inventory.put(itemName, inventory.getOrDefault(itemName, 0) + quantity);
		System.out.println(itemName + " " + quantity + "개를 획득했습니다.");
	}

	// 골드
	public int getGold() {
		return gold;
	}

	public void addGold(int amount) {
		gold += amount;
		if (gold < 0)
			gold = 0;
	}

	// 상태 출력
	public void printStatus() {
		System.out.println("\n[ " + name + " 상태 ]");
		System.out.println("Lv." + level + " | EXP: " + exp + " / " + (level * 100));
		System.out.println("HP: " + hp + " / " + getMaxHp());
		System.out.println("MP: " + mp);
		System.out.println("ATK: " + getTotalAtk() + " (기본 " + atk + ")");
		System.out.println("DEF: " + getTotalDef() + " (기본 " + def + ")");
		System.out.println("골드: " + gold);
		System.out.println("장착 무기: " + (equippedWeapon != null ? equippedWeapon : "없음"));
		System.out.println("장착 방어구: " + (equippedArmor != null ? equippedArmor : "없음"));
		System.out.println("인벤토리: " + inventory);
	}

	public void openInventory() {
		Map<String, Integer> inventory = getInventory();
		if (inventory.isEmpty()) {
			System.out.println("인벤토리가 비어 있습니다.");
			return;
		}

		System.out.println("\n[ 인벤토리 ]");
		int index = 1;
		List<String> items = new ArrayList<>();

		for (Map.Entry<String, Integer> entry : inventory.entrySet()) {
			System.out.println(index + ". " + entry.getKey() + " (" + entry.getValue() + "개)");
			items.add(entry.getKey());
			index++;
		}

		System.out.println(index + ". 취소");
		System.out.print("사용 또는 장착할 아이템 번호 선택 > ");

		int choice;
		try {
			choice = Integer.parseInt(sc.nextLine());
		} catch (NumberFormatException e) {
			System.out.println("숫자를 입력하세요.");
			return;
		}

		if (choice < 1 || choice > items.size()) {
			System.out.println("취소 또는 잘못된 입력입니다.");
			return;
		}

		String selectedItem = items.get(choice - 1);

		// 아이템 종류별로 처리
		if (selectedItem.equals("회복제")) {
			if (useItem("회복제")) {
				heal(30); // 회복제 효과
			}
		} else if (selectedItem.equals("철검") || selectedItem.equals("강철검") || selectedItem.equals("가죽갑옷")
				|| selectedItem.equals("강철갑옷")) {
			equipItem(selectedItem);
		} else {
			System.out.println("이 아이템은 사용할 수 없습니다.");
		}
	}

	// 상태 확인
	public boolean isAlive() {
		return hp > 0;
	}

	// 기타 getter
	public String getName() {
		return name;
	}

	public int getHp() {
		return hp;
	}

	public int getMp() {
		return mp;
	}

	public int getAtk() {
		return atk;
	}

	public int getDef() {
		return def;
	}

	public int getLevel() {
		return level;
	}

	public int getExp() {
		return exp;
	}

	public int getMaxHp() {
		return 100 + (level - 1) * 20;
	}

	public Map<String, Integer> getInventory() {
		return inventory;
	}
}
