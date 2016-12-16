package step02.session;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Session2Use extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//id/pw�� ������ �ش� client���� HttpSession ��ü ȹ��
		HttpSession session = request.getSession();
	
		System.out.println("Session2Use������ id : " + session.getId());
		System.out.println(session.getAttribute("id"));
		System.out.println(session.getAttribute("pw"));
		
		//���� ��ȿȭ
		session.invalidate();	
		
	}
}