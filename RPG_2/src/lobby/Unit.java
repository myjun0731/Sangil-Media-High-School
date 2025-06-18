package lobby;

import java.util.*;

public class Unit {
	private static String userName;
	private static String userJob;
	private static int level;
	private static int hp;
	private static int mp;
	private static String location;
	private static List<String> inventory;
	private final int maxInventory;
	private static int money;

	public Unit() {
		this.userJob = "학생";
		this.level = 1;
		this.hp = 20;
		this.mp = 3;
		this.location = "";
		this.inventory = new ArrayList<>();
		this.maxInventory = 30;
	}

	public static int getMoney() {
		return money;
	}

	public static void setMoney(int money) {
		Unit.money = money;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserJob() {
		return userJob;
	}

	public void setUserJob(String userJob) {
		this.userJob = userJob;
	}

	public int getLevel() {
		return level;
	}

	public int getHp() {
		return hp;
	}

	public int getMp() {
		return mp;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public List<String> getInventory() {
		return inventory;
	}

	public void setInventory(String item) {
		if (inventory.size() >= maxInventory) {
			System.out.println("[!] 인벤토리에 들어갈 공간이 없습니다.");
		} else {
			inventory.add(item);
		}
	}

	public void printSetting() {
		System.out.println("닉네임 : " + userName);
		System.out.println("직업 : " + userJob);
		System.out.println("체력 : " + hp + " / 공격력 : " + mp);
	}

	public void printInfo() {
		System.out.println("===== 유저 정보 =====");
		System.out.println("닉네임 : " + userName);
		System.out.println("직업 : " + userJob);
		System.out.println("레벨 : " + level);
		System.out.println("화폐 : " + money + "p");
		System.out.println("체력 : " + hp);
		System.out.println("공격력 : " + mp);
		System.out.println("위치 : " + location);
		System.out.println("인벤토리 [" + inventory.size() + "/" + maxInventory + "] : " + inventory);
	}
}
