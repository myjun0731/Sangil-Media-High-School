package lobby;

import lobby.*;
import java.util.Scanner;

public class Unit {
	public static String userName;
	public static String userJob = "학생";
	public static int level = 1;
	public static int hp = 50;
	public static int mp = 15;
	public static String location = "마을";

	public void setName(String userName) {
		this.userName = userName;
	}

	public void setJob(String userJob) {
		this.userJob = userJob;
	}

	public String getName() {
		return userName;
	}

	public String getJob() {
		return userJob;
	}

	public void Setting() {
		boolean yn = true;
		do {
			Scanner sc = new Scanner(System.in);
			System.out.print("닉네임을 입력해주세요 :");
			setName(sc.next());

			System.out.println(
					"닉네임 : [Lv." + level + "] " + userName + "\n직업 : " + userJob + "\n체력 : " + hp + " / 공격력 : " + mp);
			System.out.println("다시 설정 하시곘습니까? (y/n)");
			String cmd = sc.next();
			if (cmd.equalsIgnoreCase("y")) {
				System.out.println("다시 닉네임부터 설정합니다.");
			} else if (cmd.equalsIgnoreCase("n")) {
				yn = false;
			}
		} while (yn);
	}

	public void map() {
		// TODO Auto-generated method stub
		String map[] = { "마을", "상점", "학교" };
		for (String m : map) {
			System.out.println("1. " + m);
		}
	}

	public void Info() {
		System.out.println("닉네임 : " + userName);
		System.out.println("직업 : " + userJob);
		System.out.println("레벨 : " + level);
		System.out.println("체력 : " + hp);
		System.out.println("공격력: " + mp);
		System.out.println("위치 : " + location);
	}
}