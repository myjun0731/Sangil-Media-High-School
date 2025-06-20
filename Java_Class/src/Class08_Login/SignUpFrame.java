package Class08_Login;

import javax.swing.*;
import java.awt.*;

public class SignUpFrame extends JFrame {
	public SignUpFrame() {
		setTitle("회원가입");
		setSize(300, 200);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JPanel panel = new JPanel(new GridLayout(4, 2, 10, 10));

		JTextField idField = new JTextField();
		JPasswordField pwField = new JPasswordField();
		JButton signUpBtn = new JButton("회원가입");
		JButton backBtn = new JButton("뒤로");

		panel.add(new JLabel("아이디:"));
		panel.add(idField);
		panel.add(new JLabel("비밀번호:"));
		panel.add(pwField);
		panel.add(signUpBtn);
		panel.add(backBtn);

		signUpBtn.addActionListener(e -> {
			String username = idField.getText();
			String password = new String(pwField.getPassword());

			if (username.isEmpty() || password.isEmpty()) {
				JOptionPane.showMessageDialog(this, "아이디와 비밀번호를 모두 입력해주세요!");
				return;
			}

			UserDatabase.addUser(username, password);
			JOptionPane.showMessageDialog(this, "회원가입 완료!");
			new LoginFrame().setVisible(true);
			dispose();
		});

		backBtn.addActionListener(e -> {
			new LoginFrame().setVisible(true);
			dispose();
		});

		add(panel);
	}
}