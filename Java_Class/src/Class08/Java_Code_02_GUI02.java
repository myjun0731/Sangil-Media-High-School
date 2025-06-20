package Class08;

import javax.swing.*;
import java.awt.*;

public class Java_Code_02_GUI02 {
	public static void main(String[] args) {
		JFrame frame = new JFrame();
		frame.setTitle("비밀번호 입력 실습");
		frame.setSize(300, 200);
		frame.setLocationRelativeTo(null);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		JPanel panel = new JPanel();
		panel.setLayout(new GridLayout(3, 1));

		JLabel pwLabel = new JLabel("비밀번호 입력:");
		JPasswordField pwField = new JPasswordField(15);
		JButton loginButton = new JButton("로그인");

		loginButton.addActionListener(e -> {
			char[] pw = pwField.getPassword();
			String passwordString = new String(pw);

			if (passwordString.equals("1234")) {
				JOptionPane.showConfirmDialog(frame, "로그인 성공", "성공", JOptionPane.INFORMATION_MESSAGE);
			} else {
				JOptionPane.showConfirmDialog(frame, "비밀번호가 일치하지 않음.", "실패", JOptionPane.ERROR_MESSAGE);
			}
		});

		panel.add(pwLabel);
		panel.add(pwField);
		panel.add(loginButton);

		frame.add(panel);
		frame.setVisible(true);
	}
}