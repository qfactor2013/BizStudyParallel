package step01;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Page1Servlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Page1Servlet doGet()");
		
		//Page2Servlet���� forward[page�̵����� ����]
		//page2�� �̵� ������ �޼ҵ带 ������ ��ü ȹ��
		RequestDispatcher pageMove = request.getRequestDispatcher("page2");
		
		//container�� ������Ų ��û, ���䰴ü�� �ָ鼭 page�̵�		
		pageMove.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Page1Servlet doPost()");
		RequestDispatcher pageMove = request.getRequestDispatcher("page2");
		pageMove.forward(request, response);
	}
	
}








