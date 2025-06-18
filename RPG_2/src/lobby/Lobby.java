package lobby;

import game.*;
import java.util.Scanner;

public class Lobby {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Unit unit = new Unit();
		Tutorial tutorial = new Tutorial();
		Game game = new Game();

		System.out.println("캐릭터를 생성합니다!");

		boolean repeat = true;
		while (repeat) {
			System.out.print("닉네임을 입력해주세요: ");
			String name = sc.next();
			unit.setUserName(name);

			unit.printSetting();

			System.out.print("다시 설정하시겠습니까? (y/n): ");
			String answer = sc.next();
			if (answer.equalsIgnoreCase("n")) {
				repeat = false;
			}
		}
		System.out.println("캐릭터를 생성하였습니다!");
		tutorial.start(unit);
		game.login(unit);
	}
}