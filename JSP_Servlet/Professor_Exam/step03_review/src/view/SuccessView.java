package view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SuccessView extends HttpServlet {
	/*
	 * 데이터 name=유재석
	 request.setAttribute("name", "유재석");
	 request.getRequestDispatcher("success").forward(request, response);	  */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		//유효성 검증후 저장한 데이터 출력
		String name = (String)request.getAttribute("name");//setAttribute로 저장데이터만 반환
		String id = request.getParameter("id");//web query string
		
		out.println(name + "<br>");
		out.println(id);
		
		out.close();
	}

}








