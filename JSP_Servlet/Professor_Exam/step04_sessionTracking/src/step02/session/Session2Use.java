package step02.session;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

	
public class Session2Use extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//id/pw값 보유한 해당 client만의 HttpSession 객체 획득
		HttpSession session = request.getSession();
	
		System.out.println("Session2Use에서의 id : " + session.getId());
		System.out.println(session.getAttribute("id"));
		System.out.println(session.getAttribute("pw"));
		
		//세션 무효화
		session.invalidate();		
	}
}





