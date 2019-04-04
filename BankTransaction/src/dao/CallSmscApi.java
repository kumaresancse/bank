package dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;

public class CallSmscApi {

	public CallSmscApi() {

	}

	public static void sendsms(String otp, String ph) throws Exception {
		java.util.Date date = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String creation_date = sdf.format(date);
		String postData = "";
		String retval = "";

		// give all Parameters In String
		String User = "uniq";
		String passwd = "123456";
		String sid = "UNIQTE";
		String mtype = "normal";
		String DR = "Y";
		String mobilenumber = ph;

		System.out.println(mobilenumber);
		String message = "" + otp;
		System.out.println(message);
		String txt = "http://bhashsms.com/api/sendmsg.php?user=" + User + "&pass=" + passwd + "&phone=" + mobilenumber
				+ "&sender=" + sid + "&priority=ndnd&stype=normal&text=" + message;
		System.out.println(txt);

		URL url = new URL(txt);
		HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();

		// If You Are Behind The Proxy Server Set IP And PORT else Comment Below 4 Lines
		// Properties sysProps = System.getProperties();
		// sysProps.put("proxySet", "true");
		// sysProps.put("proxyHost", "Proxy Ip");
		// sysProps.put("proxyPort", "PORT");

		urlconnection.setRequestMethod("POST");
		urlconnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		urlconnection.setDoOutput(true);
		OutputStreamWriter out = new OutputStreamWriter(urlconnection.getOutputStream());
		out.write(postData);
		out.close();
		BufferedReader in = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
		String decodedString;
		while ((decodedString = in.readLine()) != null) {
			retval += decodedString;
		}
		in.close();
		System.out.println(retval);
		System.out.println("end sms");
	}

}
