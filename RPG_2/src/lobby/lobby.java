package lobby;

import game.Tutorial;

public class lobby {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Unit unit = new Unit();
		Tutorial tuto = new Tutorial();
		System.out.println("캐릭터를 생성합니다!");
		unit.Setting();
		System.out.println("캐릭터를 생성하였습니다!\n튜토리얼에 진입합니다!");
		tuto.start();
	}
}