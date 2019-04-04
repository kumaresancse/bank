package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.TransactionBean;
import blockimpl.Crypto;
import blockimpl.Main;
import db.DBConnection;

public class TransactionDao {
	public static String getCurrentTime() {
		String time = "";

		try {

			SimpleDateFormat fmt = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			Date d = new Date();
			time = fmt.format(d);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return time;

	}

	private static String getCurrentBalance(String accno) {
		String senderAmount = "";
		Connection con = null;
		try {

			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from account where accno=?");
			ps.setString(1, accno);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				senderAmount = rs.getString("amount");
			} else {
				senderAmount = "0";
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
		return senderAmount;
	}

	private static int balanceUpdate(String accno, String amount) {
		Connection con = null;
		int i = 0;
		try {

			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("update account set amount=? where accno=?");
			ps.setString(1, amount);
			ps.setString(2, accno);
			i = ps.executeUpdate();

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
		return i;
	}

	private static boolean checkAvaliable(String Transamount, String currentBalance) {
		boolean f = false;
		int current = Integer.parseInt(currentBalance);
		int trans = Integer.parseInt(Transamount);
		if (current >= trans) {
			f = true;
		}
		return f;
	}

	public static String updateTransaction(TransactionBean bean) {
		String result = "";
		Connection con = null;
		try {
			String senderBalance = getCurrentBalance(bean.getSender());
			String receiverBalance = getCurrentBalance(bean.getReceiver());

			if (!checkAvaliable(bean.getAmount(), senderBalance)) {
				return "Your Balance Is too Low!!!";
			}

			con = DBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into transaction (sender,receiver,amount,time) values (?,?,?,?)");

			ps.setString(1, bean.getSender());
			ps.setString(2, bean.getReceiver());
			ps.setString(3, bean.getAmount());
			ps.setString(4, bean.getCurrentTime());

			int get = balanceUpdate(bean.getReceiver(), creditAmount(receiverBalance, bean.getAmount()));
			int sent = 0;
			if (get > 0) {
				sent = balanceUpdate(bean.getSender(), debitAmount(senderBalance, bean.getAmount()));
			}

			if (sent > 0 && get > 0) {
//				int i = ps.executeUpdate();
				Main.blockChain(bean.getSender(), bean.getReceiver(), bean.getAmount(), bean.getCurrentTime());
				return "Transaction Success!!!";
			} else {
				return "Transaction failed!!!";
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

	private static String debitAmount(String currentBalance, String transBalance) {
		String total = "";
		int amount = Integer.parseInt(currentBalance) - Integer.parseInt(transBalance);
		total = String.valueOf(amount);
		return total;

	}

	private static String creditAmount(String currentBalance, String transBalance) {

		String total = "";
		int amount = Integer.parseInt(currentBalance) + Integer.parseInt(transBalance);
		total = String.valueOf(amount);
		return total;

	}

	public static ArrayList<TransactionBean> viewTransaction() {
		Connection con = null;
		ArrayList<TransactionBean> al = new ArrayList<>();
		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from transaction");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TransactionBean bean = new TransactionBean();
				bean.setSender(Crypto.decryptAES(rs.getString("sender")));
				bean.setReceiver(Crypto.decryptAES(rs.getString("receiver")));
				bean.setAmount(Crypto.decryptAES(rs.getString("amount")));
				bean.setCurrentTime(Crypto.decryptAES(rs.getString("time")));
				al.add(bean);

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
		return al;
	}

}
