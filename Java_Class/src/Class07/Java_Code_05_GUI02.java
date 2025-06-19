package Class07;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.TextField;
import java.awt.event.*;

import javax.swing.*;

public class Java_Code_05_GUI02 {
	public static void main(String[] args) {
		JFrame frame = new JFrame("계산기 레이아웃");
		frame.setSize(300, 200);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setLocationRelativeTo(null);
		JPanel panel = new JPanel(new GridLayout(4, 3));

		for (int i = 1; i <= 9; i++) {
			panel.add(new JButton(String.valueOf(i)));
		}
		panel.add(new JButton("*"));
		panel.add(new JButton("0"));
		panel.add(new JButton("#"));

		frame.add(panel);
		frame.setVisible(true);
	}
}