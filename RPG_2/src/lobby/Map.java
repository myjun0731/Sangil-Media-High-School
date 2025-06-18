package lobby;

import java.util.List;
import java.util.Scanner;
import java.util.ArrayList;

public class Map {
	Unit unit = new Unit();
	Scanner sc = new Scanner(System.in);
	private final List<String> locations;

	public Map() {
		locations = new ArrayList<>();
		locations.add("학교 정문");
		locations.add("1반 교실");
		locations.add("매점");
		locations.add("급식실");
		locations.add("집");
	}

	public void printMap() {
		System.out.println("[이동 가능한 지역 목록]");
		for (int i = 0; i < locations.size(); i++) {
			System.out.println((i + 1) + ". " + locations.get(i));
		}
		int Select = sc.nextInt();
		moveMap(Select);
	}

	public void moveMap(int location) {
		int loca = location - 1;
		System.out.println("[" + getLocation(loca) + "] 로 이동합니다!");
		unit.setLocation(getLocation(loca));
	}

	public String getLocation(int index) {
		if (index >= 0 && index < locations.size()) {
			return locations.get(index);
		}
		return null;
	}
}
