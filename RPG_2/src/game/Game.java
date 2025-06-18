package game;

import lobby.*;

import java.util.*;

public class Game {
	private Unit unit;

	Menu menu = new Menu();

	public void login(Unit unit) {
		this.unit = unit;
		boolean tf = true;
		System.out.println("[" + unit.getUserName() + "] 님이 게임에 접속하셨습니다.");

		while (tf) {
			System.out.println("===== 메인 메뉴 =====");
			menu.menuPrint();
		}

	}
}
