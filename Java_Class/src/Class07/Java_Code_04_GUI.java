package Class07;

import java.awt.event.*;

import javax.swing.*;

public class Java_Code_04_GUI {
	public static void main(String[] args) {
		JFrame frame = new JFrame("나의 첫번째 GUI");
		frame.setSize(400, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setLocale(null);

		JPanel panel = new JPanel();
		JLabel label = new JLabel("버튼을 눌러주세요!");
		JButton button = new JButton("클릭!");
		JButton btn1 = new JButton("버튼 1");
		JButton btn2 = new JButton("버튼 2");

		ActionListener listener = new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
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

//		람다식
//		button.addActionListener(e -> {
//			// TODO Auto-generated method stub
//			label.setText("클릭");
//		});
		btn1.addActionListener(listener);
		btn2.addActionListener(listener);

		panel.add(label);
		panel.add(btn1);
		panel.add(btn2);

		frame.add(panel);
		frame.setVisible(true);
	}
}