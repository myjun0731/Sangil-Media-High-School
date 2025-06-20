package Class08;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ItemEvent;

public class Java_Code_03_GUI03 {
	public static void main(String[] args) {
		JFrame frame = new JFrame();
		frame.setTitle("콤보박스 실습");
		frame.setSize(400, 300);
		frame.setLocationRelativeTo(null);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JPanel panel = new JPanel();
		panel.setLayout(new GridLayout(4, 1, 10, 10));
		Font font = new Font("맑은 고딕", Font.PLAIN, 14);

		JLabel titleLabel = new JLabel("도시 입력", JLabel.CENTER);
		titleLabel.setFont(font.deriveFont(Font.BOLD, 16f));

		JComboBox<String> comboBox = new JComboBox<String>(new String[] { "서울", "대구" });
		comboBox.setFont(font);
		JLabel resultJLabel = new JLabel("선택된 도시 : 없음", JLabel.CENTER);

		JButton confirmButton = new JButton("확인");

		comboBox.addItemListener(e -> {
			if (e.getStateChange() == ItemEvent.SELECTED) {
				resultJLabel.setText("선택된 도시 : " + comboBox.getSelectedItem());
			}
		});

		confirmButton.addActionListener(e -> {
			JOptionPane.showMessageDialog(frame, comboBox.getSelectedItem() + "을 선택!", "선택 확인",
					JOptionPane.INFORMATION_MESSAGE);
		});

		panel.add(titleLabel);
		panel.add(comboBox);
		panel.add(resultJLabel);
		panel.add(confirmButton);
		frame.add(panel);
		frame.setVisible(true);
	}
}