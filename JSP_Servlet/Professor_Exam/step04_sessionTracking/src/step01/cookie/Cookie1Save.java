package step01.cookie;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//쿠키 생성 -> 데이터 저장 -> client에게 쿠키 전송 -> 다른 servlet으로 이동 
//-> client 로 부터 쿠키 정보 획득 -> 사용
public class Cookie1Save extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//쿠키 객체 생성 & 저장 데이터 설정
		Cookie c1 = new Cookie("id", id);
		Cookie c2 = new Cookie("pw", pw);
		
		//client에 저장 하고자하는 시간 설정 : 초단위
		c1.setMaxAge(60*60*24*365);
		c1.setMaxAge(60*60*24*365);
		
		//client 시스템에 몰래 저장
		response.addCookie(c1);
		response.addCookie(c2);
		
		response.sendRedirect("cookieUse");
	}

}
