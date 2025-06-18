package Class06;

import java.io.*;

public class Java_Code_09 {
	public static void main(String[] args) throws IOException {
		FileWriter fw = new FileWriter("output.txt");
		fw.write("안녕하세요! \n파일에 저장중입니다.");
		fw.close();

//		BufferedReader br = new BufferedReader(new FileReader("output.txt"));
//		String line;
//		while ((line = br.readLine()) != null) {
//			System.out.println(line);
//		}
	}
}