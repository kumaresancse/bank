package dao;

import bean.LoginBean;

public class LoginDao {
	public static boolean validate(LoginBean bean) {
		boolean f = false;
		try {

			if (bean.getUserName().equals("admin") && bean.getPassword().equals("admin")) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return f;
	}
}
