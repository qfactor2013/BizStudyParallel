package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieSave extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	//쿠키 생성  -> 데이터 저장 -> client에게 쿠키 전송 -> 다른 servlet으로 이동
	// -> client 로부터 쿠키정보 획득 -> 사용
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//쿠키 객체 생성
		
		Cookie cookie = new Cookie("id", id);
		Cookie cookie2 = new Cookie("pw", pw);
		
		// client에 저장하고자하는 시점 생성
		cookie.setMaxAge(60*60*24*365);
		cookie2.setMaxAge(60*60*24*365);
		
		response.addCookie(cookie);
		response.addCookie(cookie2);
		
		response.sendRedirect("cookie2Use");
		
 	}

}
