package Class08;

import javax.swing.*;
import java.awt.*;

public class Java_Code_01_GUI01 {
	public static void main(String[] args) {
		JFrame frame = new JFrame();
		frame.setTitle("회원가입 폼");
		frame.setSize(350, 250);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		JPanel panel = new JPanel();
		panel.setLayout(new GridLayout(5, 2));
		panel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

		JLabel idLabel = new JLabel("아이디:");
		JTextField idField = new JTextField();

		JLabel nameLabel = new JLabel("이름:");
		JTextField nameField = new JTextField();

		JLabel genderLabel = new JLabel("성별:");
		JPanel genderPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
		JRadioButton maleBtn = new JRadioButton("남");
		JRadioButton femaleBtn = new JRadioButton("여");
		ButtonGroup genderGroup = new ButtonGroup();
		genderGroup.add(maleBtn);
		genderGroup.add(femaleBtn);
		genderPanel.add(maleBtn);
		genderPanel.add(femaleBtn);

		JButton joinButton = new JButton("가입 완료");
		JCheckBox agreeBox = new JCheckBox("약관에 동의합니다.");

		panel.add(idLabel);
		panel.add(idField);
		panel.add(nameLabel);
		panel.add(nameField);
		panel.add(genderLabel);
		panel.add(genderPanel);
		panel.add(new JLabel());
		panel.add(agreeBox);
		panel.add(new JLabel());
		panel.add(joinButton);

		frame.add(panel);
		frame.setVisible(true);
	}
}
