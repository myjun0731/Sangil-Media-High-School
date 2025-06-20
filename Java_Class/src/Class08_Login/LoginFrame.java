package Class08_Login;

import javax.swing.*;
import java.awt.*;
import java.beans.Visibility;

public class LoginFrame extends JFrame {
	public LoginFrame() {
		setTitle("로그인");
		setSize(300, 200);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		JPanel panel = new JPanel(new GridLayout(4, 2, 10, 10));

		JTextField idField = new JTextField();
		JPasswordField pwField = new JPasswordField();
		JButton loginBtn = new JButton("로그인");
		JButton signUpBtn = new JButton("회원가입");

		panel.add(new JLabel("아이디:"));
		panel.add(idField);
		panel.add(new JLabel("비밀번호:"));
		panel.add(pwField);
		panel.add(loginBtn);
		panel.add(signUpBtn);

		loginBtn.addActionListener(e -> {
			String username = idField.getText();
			String password = new String(pwField.getPassword());

			if (username.isEmpty() || password.isEmpty()) {
				JOptionPane.showMessageDialog(this, "아이디와 비밀번호를 모두 입력해주세요!");
				return;
			}

			if (UserDatabase.checkUser(username, password)) {
				WelcomeFrame welcomeFrame = new WelcomeFrame();
				welcomeFrame.setVisible(true);
				dispose();
			} else {
				JOptionPane.showMessageDialog(this, "아이디 또는 비밀번호가 일치하지 않습니다!");
			}
		});

		signUpBtn.addActionListener(e -> {
			SignUpFrame signUpFrame = new SignUpFrame();
			signUpFrame.setVisible(true);
			dispose();
		});
		add(panel);
	}
}