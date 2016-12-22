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
		
		//Page2Servlet으로 forward[page이동으로 간주]
		//page2로 이동 가능한 메소드를 보유한 객체 획득
		RequestDispatcher pageMove = request.getRequestDispatcher("page2");
		
		//container가 생성시킨 요청, 응답객체를 주면서 page이동		
		pageMove.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Page1Servlet doPost()");
		RequestDispatcher pageMove = request.getRequestDispatcher("page2");
		pageMove.forward(request, response);
	}
	
}








