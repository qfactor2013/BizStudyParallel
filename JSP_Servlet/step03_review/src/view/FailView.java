package view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FailView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//request.setAttribute("msg", "이 데이터 사용 가능한가?");
		//response.sendRedirect("fail");

	protected void service (HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		/* 리다이렉트로 이동된 fail은 새로운 요청/응답 객체 생성
		 * 기존 servelt에서 요청 객체에 데이터 저장 했다 하더라도 사용 불가
		 * 왜? 그 요청 객체는 이미 사용 불가한 객체가 되었기 때문
		 * 그렇다면 리다이렉트로 page이동시 데이터 유지 방법(상태 유지는 어떻게?)
		 * 		- 세션/쿠키	 */
		out.println(request.getAttribute("msg") + "------<br>");
		out.println(request.getParameter("id") + "-----<br>");
		out.print("무효");

	}
}
