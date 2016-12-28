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
		if(name.equals("김하늘")){
			address = "비동기 응답 완료 : 유효한 인물 - 방송국";
		}
		if( address != null){
			out.println(address);
		}else{
			out.println("비동기로 응답 완료 : 정보 없는 사람");
		}
		out.close();
	}	
	
	/*
	 * 한글 깨짐 현상 관리하는 메소드
	 * 1. 데이터 획득 -> byte 단위로 utf-8 형식으로 치환
	 */
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
