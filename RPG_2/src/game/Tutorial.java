package game;

import lobby.*;
import java.util.*;

public class Tutorial {
	Scanner sc = new Scanner(System.in);
	Unit unit = new Unit();
	Random rd = new Random();
	String select = "";

	public void start() {
		unit.location = "학교 안 복도";
		System.out.println("[" + unit.getName() + "]님은 현재 어두운 복도 한 가운데에 서 있습니다.");
		System.out.println("그리고 [" + unit.userName + "] 님의 시야에 보이는 것은 1반 교실 뿐입니다.");
		System.out.println("1반 교실에 들어가시겠습니까?(y/n)");
		select = sc.next();
		if (select.equalsIgnoreCase("y")) {
			place();
		} else if (select.equalsIgnoreCase("n")) {
			System.out.println("그냥 지나칩니다.");
		}
		System.out.println("튜토리얼을 종료합니다.(맵을 선택할 시, 자동으로 마을로 이동합니다.- 튜토리얼 전용) \n[명령어 리스트]\n1. 맵\n2. 내정보\n3. 게임종료");
		select = sc.next();
		switch (select) {
		case "1":
			System.out.println("마을로 이동합니다.");
			break;
		case "2":
			System.out.println("내정보를 엽니다");
			break;
		case "3":
			System.out.println("게임을 종료합니다.");
			break;
		}
	}

	public void place() {
		int rand = rd.nextInt(1, 100);
		System.out.println("1반 교실에 들어갔습니다.");
		if (rand >= 65) {
			System.out.println("몬스터가 나타났습니다!");
		} else {
			System.out.println("주변을 수색하시겠습니까?(y/n)");
			select = sc.next();
			if (select.equalsIgnoreCase("y")) {
				rand = rd.nextInt(1, 100);
				if (rand >= 70) {
					System.out.println("주변에 아무것도 보이지 않습니다!");
				} else {
					System.out.println("수색 중에 몬스터가 나타났습니다!");
					System.out.println("공격하시겠습니까? (y/n)");
					select = sc.next();
					if (select.equalsIgnoreCase("y")) {
						System.out.println("무기가 없어 공격을 할 수 없습니다. 어쩔 수 없이 도망칩니다!!");
					} else if (select.equalsIgnoreCase("n")) {
						System.out.println("교실 밖으로 도망 쳤습니다!");
					}
				}
			} else if (select.equalsIgnoreCase("n")) {
				System.out.println("[" + unit.getName() + "]님은 그대로 1반 교실에 있습니다.");
			}
		}
	}
}
