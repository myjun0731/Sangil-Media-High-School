package Class07;

import java.awt.BorderLayout;
import java.awt.TextField;
import java.awt.event.*;

import javax.swing.*;

public class Java_Code_04_GUI01 {
	public static void main(String[] args) {
		JFrame frame = new JFrame("나의 첫번째 GUI");
		frame.setSize(400, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		JPanel panel = new JPanel();
		JLabel label = new JLabel("n번째 버튼 클릭");
		JLabel label2 = new JLabel("선택결과:");

		JButton btn1 = new JButton("버튼 1");
		JButton btn2 = new JButton("버튼 2");

		JRadioButton rb1 = new JRadioButton("남");
		JRadioButton rb2 = new JRadioButton("여");
		ButtonGroup group = new ButtonGroup();
		group.add(rb1);
		group.add(rb2);

		TextField textfield = new TextField();

		textfield.addKeyListener(new KeyAdapter() {
			@Override
			public void keyReleased(KeyEvent e) {
				String inputText = textfield.getText();
				label.setText("입력값 : " + inputText);
			}
		});

		ActionListener buttonListener = new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				if (e.getSource() == btn1) {
					label.setText("1번째 버튼 클릭");
					btn1.setEnabled(false);
					btn2.setEnabled(true);
				} else if (e.getSource() == btn2) {
					label.setText("2번째 버튼 클릭");
					btn1.setEnabled(true);
					btn2.setEnabled(false);
				}
			}
		};

		ActionListener radioListener = new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				if (rb1.isSelected()) {
					label2.setText("선택결과:남자");
				} else if (rb2.isSelected()) {
					label2.setText("선택결과:여자");
				} else {
					label2.setText("선택결과:선택 되지 않음");
				}
			}
		};

		btn1.addActionListener(buttonListener);
		btn2.addActionListener(buttonListener);
		rb1.addActionListener(radioListener);
		rb2.addActionListener(radioListener);

		panel.setLayout(new BorderLayout());
		JPanel topPanel = new JPanel();
		JPanel bottomPanel = new JPanel();

		topPanel.setLayout(new BoxLayout(topPanel, BoxLayout.Y_AXIS));
		topPanel.add(label);
		topPanel.add(label2);
		panel.add(topPanel, BorderLayout.NORTH);

		panel.add(textfield, BorderLayout.CENTER);

		bottomPanel.add(btn1);
		bottomPanel.add(btn2);
		bottomPanel.add(rb1);
		bottomPanel.add(rb2);
		panel.add(bottomPanel, BorderLayout.SOUTH);

		frame.add(panel);
		frame.setVisible(true);
	}
}
