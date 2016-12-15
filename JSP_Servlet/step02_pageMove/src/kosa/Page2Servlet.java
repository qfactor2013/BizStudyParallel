package kosa;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 실행은 index.html의 3번 항목으로 실행해보기
 * 주소줄 확인 & 콘솔창(서버 실행창) 확인 필수
 */


public class Page2Servlet extends HttpServlet {
	private static final long serialVersionUID = -1626725362926040707L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Page2Servlet doGet()");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Page2Servlet doPost()");
	}

}
