package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertServlet extends HttpServlet {
	//doGet/doPost의 원조 : get/post 방식
	/* 1단계 : 한글 데이터가 전송 가능성이 있음 따라서 요청 객체에 한글 인코딩 설정
	 * 		- 생략시 client가 전송한 한글 데이터 깨진 상태로 획득 될수 있음
	 * 		- get 방식 : server에 인코딩 설정
	 * 		- post방식 : servlet api만으로 처리 가능
	 * 2단계 :client가 전송한 데이터 획득
	 * 3단계 :  검증
	 * 4단계 : 검증된 내용에 맞게 화면 이동  * 
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1단계 : 요청 객체에 설정 응답 객체와는 무관 
		request.setCharacterEncoding("euc-kr");
		//2단계
		String id = request.getParameter("id");//id=값으로 전송되는 데이터 획득
		String pw = request.getParameter("pw");
		//checkbox로 부터 하나 이상의 데이터 획득 -  배열을 반환하는 메소드로 데이터 획득
		String[] hobbys = request.getParameterValues("hobby");
		
		//3단계 : id가 입력되었나? 검증
		if( id != null && id.length() != 0){
			//이동되는 다음 servlet에서도 사용 가능한 새로운 데이터 저장
			request.setAttribute("name", "유재석");
			//forward 으로 page이동 
			request.getRequestDispatcher("succ.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "이 데이터 사용 가능한가?");
			//리다이렉트로 fail로 page이동 
			response.sendRedirect("fail.jsp");
		}
	
	}

}








 
 
