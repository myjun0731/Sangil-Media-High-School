package util;

import java.util.Random;

public class Util {
	private static final Random random = new Random();

	// ▶ 크리티컬 판정 (기본 20%)
	public static boolean isCritical() {
		return random.nextInt(100) < 20;
	}

	// ▶ 범위 랜덤값 (예: 10 ~ 20)
	public static int getRandomInRange(int min, int max) {
		return random.nextInt(max - min + 1) + min;
	}

	// ▶ 텍스트 출력 딜레이 (한 글자씩 출력 효과)
	public static void delayedPrint(String message, int delayMillis) {
		for (char c : message.toCharArray()) {
			System.out.print(c);
			try {
				Thread.sleep(delayMillis);
			} catch (InterruptedException e) {
				Thread.currentThread().interrupt();
			}
		}
		System.out.println();
	}

	// ▶ 전투 메시지 강조 출력
	public static void printAction(String message) {
		System.out.println("▶ " + message);
	}

	// ▶ 구분선
	public static void printDivider() {
		System.out.println("\n==============================\n");
	}

	// ▶ 단순 대기 (1초 등)
	public static void wait(int millis) {
		try {
			Thread.sleep(millis);
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
		}
	}
}
