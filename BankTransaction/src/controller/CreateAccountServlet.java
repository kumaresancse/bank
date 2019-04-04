package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AccountBean;
import bean.UserBean;
import dao.BankDao;

@WebServlet("/CreateAccountServlet")
public class CreateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CreateAccountServlet() {
		super();

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("g");
		String address = request.getParameter("address");
		String mobile = request.getParameter("mobile");
		String mail = request.getParameter("mail");

		String accno = request.getParameter("acno");
		String cardNumber = request.getParameter("card");
		String fingerId = request.getParameter("fid");
		boolean status = false;
		if (fname != null && lname != null && dob != null && gender != null && address != null && mobile != null
				&& mail != null && accno != null && cardNumber != null) {

			UserBean bean = new UserBean();
			bean.setFirstName(fname);
			bean.setLastName(lname);
			bean.setDob(dob);
			bean.setGender(gender);
			bean.setAddress(address);
			bean.setMobile(mobile);
			bean.setEmail(mail);
			bean.setAccNumber(accno);

			AccountBean accountBean = new AccountBean();
			accountBean.setAccNumber(accno);
			accountBean.setCardNumber(cardNumber);
			accountBean.setFingerId(fingerId);

			boolean existAcc = BankDao.isExistUser(accno, cardNumber, fingerId);

			if (!existAcc) {

				boolean isUser = BankDao.register(bean);
				if (isUser) {
					boolean isAccount = BankDao.createAccount(accountBean);
					if (!isAccount) {
						status = true;
					}
				} else {
					status = true;
				}

			} else {
				status = true;

			}
		}else {
			status = true;
		}
		if (status) {
			RequestDispatcher rd = request.getRequestDispatcher("adduser.jsp");
			request.setAttribute("res", "Card Number or Account Number Unavailable!!!");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("adduser.jsp");
			request.setAttribute("res", "Register Success!!!");
			rd.forward(request, response);
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
