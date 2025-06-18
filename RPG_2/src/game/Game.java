package game;

import lobby.*;

import java.util.*;

public class Game {
	private Unit unit;

	Menu menu = new Menu();

	public void login(Unit unit) {
		this.unit = unit;
		System.out.println("[" + unit.getUserName() + "] 님이 게임에 접속하셨습니다.");
		menuSelect();
	}

	public void menuSelect() {
		boolean tf = true;
		while (tf) {
			try {
				System.out.println("===== 메인 메뉴 =====");
				menu.menuPrint();
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println("[!] 숫자만 입력 해주십시오.");
				break;
			}
		}
	}
}
