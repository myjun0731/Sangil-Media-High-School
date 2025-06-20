package Class08_Login;

import java.util.HashMap;

public class UserDatabase {
	private static final HashMap<String, String> users = new HashMap<>();

	public static void addUser(String username, String password) {
		users.put(username, password);
	}

	public static boolean checkUser(String username, String password) {
		return users.containsKey(username) && users.get(username).equals(password);
	}
}