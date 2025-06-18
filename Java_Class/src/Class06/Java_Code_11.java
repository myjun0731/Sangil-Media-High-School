package Class06;

import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;

public class Java_Code_11 {
	public static void main(String[] args) throws IOException {
		String Link = "C:/Users/teacher-pc/Desktop/";
		Scanner sc = new Scanner(System.in);
		boolean tf = true;

		ArrayList<String> student = new ArrayList<>();

		System.out.println("출석할 학생 이름을 입력 ('종료'를 입력할 시, 종료 됨)");
		while (tf) {
			System.out.print("이름 입력 : ");
			String name = sc.next();
			if (name.equals("종료")) {
				tf = false;
			} else {
				student.add("- " + name + "\n");
			}
		}
		FileWriter fw = new FileWriter(Link + "Student.txt");

		for (String n : student) {
			fw.write(n);
		}
		fw.close();
		System.out.println("저장완료");
		System.out.println();
		BufferedReader br = new BufferedReader(new FileReader(Link + "Student.txt"));
		String line;
		System.out.println("--학생 출석 목록(" + student.size() + "명)--");
		while ((line = br.readLine()) != null) {
			System.out.println(line);
		}
		br.close();
		sc.close();
	}
}