package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import bean.AccountBean;
import bean.CurrentBean;
import bean.UserBean;
import db.DBConnection;

public class BankDao {
	public static boolean register(UserBean bean) {
		boolean f = false;
		Connection con = null;
		try {
			if (bean != null) {
				con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement("insert into user values (?,?,?,?,?,?,?,?)");
				ps.setString(1, bean.getFirstName());
				ps.setString(2, bean.getLastName());
				ps.setString(3, bean.getDob());
				ps.setString(4, bean.getGender());
				ps.setString(5, bean.getAddress());
				ps.setString(6, bean.getMobile());
				ps.setString(7, bean.getEmail());
				ps.setString(8, bean.getAccNumber());
				int i = ps.executeUpdate();
				if (i > 0) {
					f = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return f;

	}

	public static boolean createAccount(AccountBean bean) {
		boolean f = false;
		Connection con = null;
		try {
			if (bean != null) {
				con = DBConnection.getConnection();
				PreparedStatement ps = con
						.prepareStatement("insert into account(accno,cardno,fingerid) values (?,?,?)");
				ps.setString(1, bean.getAccNumber());
				ps.setString(2, bean.getCardNumber());
				ps.setString(3, bean.getFingerId());
				int i = ps.executeUpdate();
				if (i > 0) {
					f = true;
				}
			}

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return f;
	}

	public static boolean isExistUser(String accno, String card, String figerId) {
		boolean flag = false;
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("select * from account where accno=? || cardno=? || fingerid=?");
			ps.setString(1, accno);
			ps.setString(2, card);
			ps.setString(3, figerId);
			ResultSet rs = ps.executeQuery();
			flag = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return flag;
	}

	public static UserBean cardValidation(String card) {
		String name = "";
		UserBean bean = new UserBean();
		Connection con = null;
		try {

			if (card != null && card.length() == 10) {

				con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(
						"select * from account join user on account.accno=user.account where account.cardno=?");
				ps.setString(1, card);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {

					name = rs.getString("user.firstname");
					bean.setFirstName(name);
					bean.setMobile(rs.getString("user.mobile"));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return bean;

	}

	public static String generateOTP(String cardNumber) {
		String otp = "";
		Connection con = null;
		try {

			if (cardNumber != null && cardNumber.length() == 10) {
				otp = Paillier.generatePassword();
				con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement("update account set otp=? where cardno=?");
				ps.setString(1, otp);
				ps.setString(2, cardNumber);
				int i = ps.executeUpdate();

			}

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return otp;
	}

	public static boolean otpVerification(String otp, String cardNumber) {
		boolean f = false;
		Connection con = null;
		try {

			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from account where cardno=? and otp=?");
			ps.setString(1, cardNumber);
			ps.setString(2, otp);
			ResultSet rs = ps.executeQuery();
			f = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return f;
	}

	public static boolean fingerValidation(String card, String finger) {
		Connection con = null;
		boolean f = false;
		try {

			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from account where cardno=? and fingerid=?");
			ps.setString(1, card);
			ps.setString(2, finger);
			ResultSet rs = ps.executeQuery();
			f = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return f;

	}

	public static CurrentBean getCurrentUser(String cardNumber, String finger) {

		Connection con = null;
		CurrentBean bean = null;
		try {

			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"select * from account join user on user.account = account.accno where account.cardno=? and account.fingerid=?");
			ps.setString(1, cardNumber);
			ps.setString(2, finger);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				bean = new CurrentBean();
				bean.setAccNum(rs.getString("account.accno"));
				bean.setName(rs.getString("user.firstname"));
				bean.setMobile(rs.getString("user.mobile"));
				bean.setMail(rs.getString("user.email"));
				bean.setCardNumber(rs.getString("account.cardno"));
				bean.setAmount(rs.getString("account.amount"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return bean;

	}

	public static HashMap<String, UserBean> viewAllUser() {
		HashMap<String, UserBean> hs = new HashMap<>();
		Connection con = null;
		try {

			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from user");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String accno = rs.getString("account");
				UserBean bean = new UserBean();
				bean.setFirstName(rs.getString("firstname"));
				bean.setLastName(rs.getString("lastname"));
				bean.setDob(rs.getString("dob"));
				bean.setGender(rs.getString("gender"));
				bean.setAddress(rs.getString("address"));
				bean.setMobile(rs.getString("mobile"));
				bean.setEmail(rs.getString("email"));
				bean.setAccNumber(accno);
				hs.put(accno, bean);

			}

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return hs;
	}

	public static HashMap<String, AccountBean> viewAllAccounts() {
		HashMap<String, AccountBean> hs = new HashMap<>();
		Connection con = null;
		try {

			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from account");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String account = rs.getString("accno");
				AccountBean bean = new AccountBean();
				bean.setCardNumber(rs.getString("cardno"));
				bean.setAccNumber(rs.getString("accno"));
				bean.setFingerId(rs.getString("fingerid"));
				bean.setAmount(rs.getString("amount"));
				hs.put(account, bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return hs;
	}

	public static boolean deposit(String accountNumber, String amount) {
		boolean deposite = false;
		Connection con = null;
		PreparedStatement ps = null;
		int currentAmount = 0;
		try {

			con = DBConnection.getConnection();
			ps = con.prepareStatement("select amount from account where accno=?");
			ps.setString(1, accountNumber);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				String amountDb = rs.getString("amount");
				currentAmount = Integer.parseInt(amountDb);
			}
			currentAmount = currentAmount + Integer.parseInt(amount);
			ps = con.prepareStatement("update account set amount = ? where accno= ?");
			ps.setString(1, String.valueOf(currentAmount));
			ps.setString(2, accountNumber);

			int i = ps.executeUpdate();
			if (i > 0) {
				deposite = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return deposite;

	}

	public static boolean deleteAccount(String accNumber) {
		boolean f = false;
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("delete from user where account=?");
			ps.setString(1, accNumber);
			int i = ps.executeUpdate();
			if (i > 0) {
				ps = con.prepareStatement("delete from account where accno=?");
				ps.setString(1, accNumber);
				int j = ps.executeUpdate();
				if (j > 0) {
					f = true;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return f;

	}
	
	public static CurrentBean sessionUpdate(CurrentBean user) {
		CurrentBean bean = null;
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from account join user on user.account=account.accno where cardno=?");
			ps.setString(1, user.getCardNumber());
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				bean = new CurrentBean();
				bean.setAccNum(rs.getString("user.account"));
				bean.setAmount(rs.getString("account.amount"));
				bean.setCardNumber(rs.getString("account.cardno"));
				bean.setName(rs.getString("user.firstname"));
				bean.setMail(rs.getString("user.email"));
				bean.setMobile(rs.getString("user.mobile"));
				return bean;
				
				
			}else {
				return null;
			}
			
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}
}
