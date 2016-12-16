package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cookie2Use extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// login.html -> Cookie1Save -> Cookie2Use로 이동
	/*
	 * client pc로 부터 Cookie 정보 획득 key = value 구조로 저장된 쿠키 정보의 데이터를 key(id/pw)를
	 * 이용해서 반환 더이상 client에 쿠키정보 삭제
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 현 접속된 사이트(도메인)에만 관련된 쿠키 정보만 객체로 clienjt 시스템으로 부터 획득
		Cookie[] all = request.getCookies();

		for (int i = 0; i < all.length; i++) {
			String key = all[i].getName();
			if (key.equals("id")) {
				System.out.println("관리자님 client id : " + key);
				System.out.println("관리자님 client id에 매핑된 value : " + all[i].getValue());
			}
		}
		
		/* 3단계 : client pc 에 id에 해당하는 쿠키 값 삭제
		 * API에는 쿠키 정보 삭제 메소드 없음
		 * - client 시스템에 전송(addCookie()) 호출은 필수
		 */
		
		Cookie delete = new Cookie("id", null);
		response.addCookie(delete);
		
	}
}