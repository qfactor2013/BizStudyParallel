package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.domain.Person;

//list url 정보와 매핑된 서블릿
public class Info extends HttpServlet {
	/* biz 로직중 친구 정보를 반환해주는 메소드 호출
	 * 반환받은 정보(친구들정보)를 jsp에게 출력하라 위임
	 * 
	 * 개발자 관점
	 * 1. 데이터 획득
	 * 2. jsp에게 전송할때 어떻게 전송?
	 * 		- 요청 객체 저장 -> forward 방식으로 jsp로 이동
	 * 3. jsp로 이동
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//import 단축키 : ctrl+Shift + O
		ArrayList<Person> all = new ArrayList<Person>();
		all.add(new Person("정찬우", 40));
		all.add(new Person("이영자", 50));
		all.add(new Person("신동엽", 60));
		
		//jsp에서 사용 가능하게 요청 객체에 데이터 저장
		request.setAttribute("datas", all);
		
		//forward방식으로 page이동
		request.getRequestDispatcher("list.jsp").forward(request, response);
	}

}





