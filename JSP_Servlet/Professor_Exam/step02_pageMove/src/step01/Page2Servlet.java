package step01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//실행은 index.html 의 3번 항목으로 실행해보기
//주소줄 확인 & 콘솔창(서버 실행창) 확인 필수 
public class Page2Servlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Page2Servlet의 doGet()");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Page2Servlet의 doPost()");
	}

}
