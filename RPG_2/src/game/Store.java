package game;

import lobby.*;
import game.*;

public class Store {
	Unit unit = new Unit();
	final static String[] object = { "키보드", "마우스", "무선 충전기", "모니터" };
	final static int[] objectPrice = { 20, 30, 50, 50 };

	public void StorePrint() {
		for (int i = 0; i < object.length; i++) {
			System.out.println((i + 1) + ". " + object[i] + " : " + objectPrice[i] + "p");
		}
	}
}