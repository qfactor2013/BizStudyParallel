package step01.cookie;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//��Ű ���� -> ������ ���� -> client���� ��Ű ���� -> �ٸ� servlet���� �̵� 
//-> client �� ���� ��Ű ���� ȹ�� -> ���
public class Cookie1Save extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//��Ű ��ü ���� & ���� ������ ����
		Cookie c1 = new Cookie("id", id);
		Cookie c2 = new Cookie("pw", pw);
		
		//client�� ���� �ϰ����ϴ� �ð� ���� : �ʴ���
		c1.setMaxAge(60*60*24*365);
		c1.setMaxAge(60*60*24*365);
		
		//client �ý��ۿ� ���� ����
		response.addCookie(c1);
		response.addCookie(c2);
		
		response.sendRedirect("cookieUse");
	}

}
