package step01;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//�����̷�Ʈ ������� page�̵�(servlet api�� ó��, page2�� �̵�)
public class Page3Servlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Page3Servlet doGet()");
		response.sendRedirect("page2");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Page3Servlet doPost()");
		response.sendRedirect("page2");
	}
}









