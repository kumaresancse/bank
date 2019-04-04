package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BankDao;

/**
 * Servlet implementation class CloseAccount
 */
@WebServlet("/CloseAccount")
public class CloseAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CloseAccount() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accNumber = request.getParameter("accno");
		boolean f = BankDao.deleteAccount(accNumber);
		if(f) {
			RequestDispatcher rd = request.getRequestDispatcher("close.jsp");
			request.setAttribute("res", "Successfully deleted!!!");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("close.jsp");
			request.setAttribute("res", "failed!!!");
			rd.forward(request, response);
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
