package step02.session;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Session1Save extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//id/pw ������ ������ �޸𸮿� ���� ������ ���� ���� ��ü ���� �� ����
		//������ client���� HttpSession ��ü�� container �����ؼ� ����
		//HttpSession ��ü�� client ������ ���� ������ id���� container�� ����
		HttpSession session = request.getSession();
		//container�� �ο��� id�� ��ȯ �޼ҵ� 
		System.out.println(session.getId());
		
		//id/pw�� ����
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		
		response.sendRedirect("sessionUse");
	}
}









