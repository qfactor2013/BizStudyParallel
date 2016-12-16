package view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SuccessView extends HttpServlet {
	
	/*
	 * ������ name=���缮
	 request.setAttribute("name", "���缮");
	 request.getRequestDispatcher("success").forward(request, response);	  */

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		//��ȿ�� ���� �� ������ ������ ���
		String name = (String) request.getAttribute("name"); // setAttribute �� �����͸� ��ȯ
		String id = request.getParameter("id"); // web query String
		
		out.println(name + "<br>");
		out.println(id);
		
		out.close();
	}

}