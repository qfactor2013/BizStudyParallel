package kosa;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Page1Servlet extends HttpServlet {

	private static final long serialVersionUID = 3809693914948059007L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Page1Servlet doGet()");
		
		RequestDispatcher pageMove = request.getRequestDispatcher("page2");
		pageMove.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Page1Servlet doPost()");
		RequestDispatcher pageMove = req.getRequestDispatcher("page2");
		pageMove.forward(req, resp);
	}

}
