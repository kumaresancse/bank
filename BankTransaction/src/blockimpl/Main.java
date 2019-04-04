package blockimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBConnection;

public class Main {

	public static void main(String[] args) {

	}

	public static int blockChain(String sender, String receiver, String amount, String time) {
		int i = 0;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from transaction order by id desc limit 1");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				String[] genesisTransactions = { sender, receiver, amount, time };
				Block genesisBlock = new Block(Integer.parseInt(rs.getString("blocks")), genesisTransactions);
				PreparedStatement ps1 = con.prepareStatement(
						"insert into transaction (sender,receiver,amount,time,blocks) values (?,?,?,?,?)");
				ps1.setString(1, Crypto.encryptAES(sender));
				ps1.setString(2, Crypto.encryptAES(receiver));
				ps1.setString(3, Crypto.encryptAES(amount));
				ps1.setString(4, Crypto.encryptAES(time));
				ps1.setString(5, genesisBlock.getBlockHash() + "");
				i = ps1.executeUpdate();
			} else {
				String[] genesisTransactions = { sender, receiver, amount, time };
				Block genesisBlock = new Block(0, genesisTransactions);
				PreparedStatement ps1 = con.prepareStatement(
						"insert into transaction (sender,receiver,amount,time,blocks) values (?,?,?,?,?)");
				ps1.setString(1, Crypto.encryptAES(sender));
				ps1.setString(2, Crypto.encryptAES(receiver));
				ps1.setString(3, Crypto.encryptAES(amount));
				ps1.setString(4, Crypto.encryptAES(time));
				ps1.setString(5, genesisBlock.getBlockHash() + "");
				i = ps1.executeUpdate();
			}

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return i;
	}

}
