package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieSave extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	//��Ű ����  -> ������ ���� -> client���� ��Ű ���� -> �ٸ� servlet���� �̵�
	// -> client �κ��� ��Ű���� ȹ�� -> ���
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//��Ű ��ü ����
		
		Cookie cookie = new Cookie("id", id);
		Cookie cookie2 = new Cookie("pw", pw);
		
		// client�� �����ϰ����ϴ� ���� ����
		cookie.setMaxAge(60*60*24*365);
		cookie2.setMaxAge(60*60*24*365);
		
		response.addCookie(cookie);
		response.addCookie(cookie2);
		
		response.sendRedirect("cookie2Use");
		
 	}

}
