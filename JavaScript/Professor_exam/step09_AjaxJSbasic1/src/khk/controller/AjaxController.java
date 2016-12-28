package khk.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("utf-8");	
		
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();		
		
		String name = toKor(request.getParameter("name").trim());			

		String address = null;
		if(name.equals("���ϴ�")){
			address = "�񵿱� ���� �Ϸ� : ��ȿ�� �ι� - ��۱�";
		}
		if( address != null){
			out.println(address);
		}else{
			out.println("�񵿱�� ���� �Ϸ� : ���� ���� ���");
		}
		out.close();
	}	
	
	
	public String toKor(String value){
		if(value == null){
			return null;
		}
		try{
			return new String(value.getBytes("8859_1"), "utf-8");
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}
