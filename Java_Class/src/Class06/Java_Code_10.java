package Class06;

import java.io.*;
import java.util.Scanner;

public class Java_Code_10 {
	public static void main(String[] args) throws IOException {
		String Link = "C:/Users/teacher-pc/Desktop/";
		FileWriter fw = new FileWriter(Link + "memo.txt");
		Scanner sc = new Scanner(System.in);

		String memo = "";
		System.out.println("메모할 내용 입력");
		memo = sc.next();
		fw.write(memo);
		fw.close();
		System.out.println("저장완료");
		System.out.println();
		BufferedReader br = new BufferedReader(new FileReader(Link + "memo.txt"));
		String line;
		System.out.println("--메모내용--");
		System.out.println(br.readLine());
		br.close();
		sc.close();
	}
}