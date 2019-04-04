package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CurrentBean;
import bean.TransactionBean;
import dao.BankDao;
import dao.TransactionDao;

/**
 * Servlet implementation class TransactionServlet
 */
@WebServlet("/TransactionServlet")
public class TransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public TransactionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		CurrentBean user = (CurrentBean) session.getAttribute("user");
		String senderAccount = request.getParameter("accno");
		String receiverName = request.getParameter("rname");
		String receiverAccount = request.getParameter("raccno");
		String amount = request.getParameter("tamount");
		String date = TransactionDao.getCurrentTime();
		TransactionBean bean = new TransactionBean();
		bean.setSender(senderAccount);
		bean.setReceiver(receiverAccount);
		bean.setAmount(amount);
		bean.setReceiverName(receiverName);
		bean.setCurrentTime(date);
		String result = TransactionDao.updateTransaction(bean);
		if(result!=null && result!="" && result.toLowerCase().contains("success")) {
			
			CurrentBean updateUser = BankDao.sessionUpdate(user);
			if(updateUser!=null) {
				session.setAttribute("user", updateUser);
			}
			RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
			request.setAttribute("res", result);
			rd.forward(request, response);
			
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("failure.jsp");
			request.setAttribute("res", "Transaction failed!!!");
			rd.forward(request, response);
		}
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
