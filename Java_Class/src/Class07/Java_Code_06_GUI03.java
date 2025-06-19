package Class07;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Java_Code_06_GUI03 {
	public static void main(String[] args) {
		JFrame frame = new JFrame("다이얼로그 실습");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(400, 300);
		frame.setLocationRelativeTo(null);

		JPanel panel = new JPanel();
		panel.setLayout(new GridLayout(3, 1, 10, 10));

		JButton btnMessage = new JButton("메시지 다이얼로그");
		JButton btnConfirm = new JButton("확인 다이얼로그");
		JButton btnInput = new JButton("입력 다이얼로그");

		btnMessage.addActionListener((ActionEvent e) -> {
			JOptionPane.showMessageDialog(frame, "안녕하세요! 메시지 다이얼로그입니다.", "메시지 알림", JOptionPane.INFORMATION_MESSAGE);
		});

		btnConfirm.addActionListener((ActionEvent e) -> {
			int result = JOptionPane.showConfirmDialog(frame, "계속 진행하시겠습니까?", "확인", JOptionPane.YES_NO_CANCEL_OPTION,
					JOptionPane.QUESTION_MESSAGE);

			String response = "";
			switch (result) {
			case JOptionPane.YES_OPTION:
				response = "예를 선택하셨습니다.";
				break;
			case JOptionPane.NO_OPTION:
				response = "아니오를 선택하셨습니다.";
				break;
			case JOptionPane.CANCEL_OPTION:
				response = "취소를 선택하셨습니다.";
				break;
			case JOptionPane.CLOSED_OPTION:
				response = "다이얼로그를 닫았습니다.";
				break;
			}

			JOptionPane.showMessageDialog(frame, response);
		});

		btnInput.addActionListener((ActionEvent e) -> {
			String name = JOptionPane.showInputDialog(frame, "이름을 입력하세요:", "입력", JOptionPane.PLAIN_MESSAGE);

			if (name != null && !name.isEmpty()) {
				JOptionPane.showMessageDialog(frame, name + " 님, 환영합니다!", "입력 결과", JOptionPane.INFORMATION_MESSAGE);
			} else if (name != null) {
				JOptionPane.showMessageDialog(frame, "이름을 입력하지 않았습니다.", "입력 오류", JOptionPane.WARNING_MESSAGE);
			}
		});

		panel.add(btnMessage);
		panel.add(btnConfirm);
		panel.add(btnInput);

		frame.add(panel);
		frame.setVisible(true);
	}
}