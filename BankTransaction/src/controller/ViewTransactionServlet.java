package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.TransactionBean;
import dao.TransactionDao;

/**
 * Servlet implementation class ViewTransactionServlet
 */
@WebServlet("/ViewTransactionServlet")
public class ViewTransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public ViewTransactionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		ArrayList<TransactionBean> bean = TransactionDao.viewTransaction();
		if(bean!=null && bean.size()>0) {
			request.setAttribute("transaction", bean);
			RequestDispatcher rd = request.getRequestDispatcher("viewtransaction.jsp");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("viewtransaction.jsp");
			out.print("No Transactions!!!");
			rd.include(request, response);
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
