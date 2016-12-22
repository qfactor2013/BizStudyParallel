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
		
		//id/pw 값으로 서버의 메모리에 상태 유지를 위한 세션 객체 생성 및 저장
		//접속한 client만의 HttpSession 객체를 container 생성해서 제공
		//HttpSession 객체에 client 구분을 위한 고유한 id값을 container가 적용
		HttpSession session = request.getSession();
		//container가 부여한 id값 반환 메소드 
		System.out.println(session.getId());
		
		//id/pw를 저장
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		
		response.sendRedirect("sessionUse");
	}
}









