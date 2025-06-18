package lobby;

import java.util.*;
import lobby.*;
import game.*;

public class Menu {
	Scanner sc = new Scanner(System.in);
	final String Menu[] = { "지도", "상점", "내정보", "기술", "게임종료" };
	Map map = new Map();
	Unit unit = new Unit();
	Store store = new Store();

	public void menuPrint() throws Exception {
		for (int i = 0; i < Menu.length; i++) {
			System.out.println((i + 1) + ". " + Menu[i]);
		}
		int Select = sc.nextInt();
		switch (Select) {
		case 1:
			map.printMap();
			break;
		case 2:
			store.StorePrint();
			break;
		case 3:
			unit.printInfo();
			break;
		case 4:
			break;
		case 5:
			System.out.println("[" + unit.getUserName() + "] 님이 로그아웃을 하였습니다.");
			System.exit(0);
			break;

		}
	}
}
