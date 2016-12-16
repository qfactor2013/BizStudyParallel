package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// 1단계 : 요청 객체에 설정, 응답 객체와는 무관
		request.setCharacterEncoding("euc-kr");
		// 2단계
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		// checkbos로 부터 하나 이상의 데이터 획득 - 배열을 반환하는 메소드로 데이터 획득
		String[] hobbys = request.getParameterValues("hobby");

		// 3단계 : id가 입력되었나? 검증
		if (id != null && id.length() != 0) {
			//이동되는 다음 servlet에서도 사용 가능한 새로운 데이터 저장
			request.setAttribute("name", "유재석");
			//forward 으로 page 이동
			request.getRequestDispatcher("succ.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "이 데이터 사용 가능한가?");
			response.sendRedirect("fail.jsp");
		}

	}

}
