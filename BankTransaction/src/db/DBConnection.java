package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static final String hostUrl = "jdbc:mysql://localhost:3306/transaction";
	public static final String username = "root";
	public static final String password = "admin";

	public static Connection getConnection() {
		Connection con = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/transaction", "root", "admin");

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return con;
	}
}
