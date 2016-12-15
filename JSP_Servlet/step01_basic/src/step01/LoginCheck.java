package step01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginCheck extends HttpServlet {
	
	//http get이라는 방식 처리 메소드
	//http://localhost:8089/step01_basic/idCheck?idValue=master&pwValue=77
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
		process(request, response);
	}
	
	//http post 라는 방식 처리 메소드 
	//http://localhost:8089/step01_basic/idCheck
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()");
		process(request, response);
	}
	
	//id/pw 검증 로직 및 출력 로직
	/* 1단계 : id/pw값 획득
	 * 2단계 : 유효성 검증
	 * 3단계 :
	 * 			유효? 안녕하셔요 id님
	 * 			무효? 무효한 정보입니다	 */
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1단계
		String id = request.getParameter("idValue");
		String pw = request.getParameter("pwValue");
		System.out.println(id + " --- " + pw);
		
		//출력을 위한 설정 : 한글, html 형식, 2byte 출력
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		//2단계
		if(id.equals("master") && pw.equals("77")){
			out.println("안녕하세요 - " + id);
		}else{
			out.print("잘못된 id값 입니다");
		}
	}
}









