package Class08_Login;

import javax.swing.*;
import java.awt.*;

public class WelcomeFrame extends JFrame {
	public WelcomeFrame() {
		setTitle("환영합니다");
		setSize(300, 200);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		JPanel panel = new JPanel(new BorderLayout());
		Font font = new Font("맑은 고딕", Font.BOLD, 20);

		JLabel welcomeLabel = new JLabel("환영합니다!", JLabel.CENTER);
		welcomeLabel.setFont(font);

		JButton logoutBtn = new JButton("로그아웃");

		panel.add(welcomeLabel, BorderLayout.CENTER);
		panel.add(logoutBtn, BorderLayout.SOUTH);

		logoutBtn.addActionListener(e -> {
			new LoginFrame().setVisible(true);
			dispose();
		});

		add(panel);
	}
}