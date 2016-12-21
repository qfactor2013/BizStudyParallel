WebReview.java

1. http 요청 url
	- http://ip:port/webproject명/파일
	- web project명 : context명 = app~명
	- port는 생략 : http기본 port 80
		http://www.naver.com
		http://www.naver.com:80/index.html
		http://www.daum.net
		http://www.daum.net:80/index.html
	- jsp/html/servlet
		http://ip:port/project/*.jsp
		http://ip:port/project/*.html
		http://ip:port/project/서블릿은확장자적용불가


2. index.html
	- url에 명시하지 않아도 자동 실행되는 사유
	- web.xml
	  <welcome-file-list>
		 <welcome-file>index.html</welcome-file>
	 <welcome-file-list>


3. servlet 주요 API
	1. servlet 개발 방법
		import javax.servlet.http.HttpServlet;
		import javax.servlet.http.HttpServletRequest;
		import javax.servlet.http.HttpServletResponse;
		public class 이름 extends HttpServlet{
			protected void doGet(HttpServletRequest req, HttpServletResponser res) throws IOException, ServletException{}
			protected void doPost(HttpServletRequest req, HttpServletResponser res) throws IOException, ServletException{}
			protected void service(HttpServletRequest req, HttpServletResponser res) throws IOException, ServletException{}
		}
	2. forward 방식으로 page이동
		//요청 객체에 데이터 저장
		요청변수.setAttribute(key, value);
		RequestDispatcher 변수 =  req.getRequestDispatcher("이동 page");
		변수.forward(요청객체, 응답객체);

		//이동된 page에서 데이터 반환
		요청변수.getAttribute(key);

	3. redirect 방식으로 page이동
		응답객체.sendRedirect("이동 page");

	4. 상태 유지를 위한 주요 API
		1. 서버 메모리에 객체 타입으로 저장
			//생성
			HttpSession session = 요청객체.getSession();
			//상태 유지를 위한 데이터 저장
			session.setAttribute(key, value);
			//세션 객체 획득 
			HttpSession session = 요청객체.getSession();
			//데이터 획득
			타입 변수명 = (형변환)session.getAttribute(key);
			//세션 무효화
			session.invalidate();
				
		2. client 시스템에 문자열로만 저장
			//쿠키 생성
			Cookie 변수 = new Cookie("key", "데이터");
			//시간 설정
			변수.setMaxAge(초단위);
			//client에게 전송
			응답.addCookie(변수);
			//쿠키 획득
			Cookie[] 변수 = 요청.getCookies();
			//쿠키 키값 반환
			변수[index].getName()
			//쿠키 value 반환
			변수[index].getValue()
	
	5. client로 인해 전송되는 데이터 : web	query string
		1. String getParameter("key")
		2. String[] getParameterValues("key")

	6. HttpServletRespone 메소드
		1. setContentType("마임타입;인코딩");
		2. getWriter()
		3. sendRedirect()



4. page  이동 방식
	1. html 방식
		1. 링크
		2. 버튼
	2. servlet 이동 page
		1. forward 
			: 요청, 응답 객체 유지, 요청 객체에 데이터 저장후 활용, 주소줄 변동없음
		2. redirect
			: 요청, 응답 객체 소멸, 새롭게 생성, 요청 객체에 데이터 저장해도 사용 불가

5. jsp
	1. scripting tag
		1. page지시자	
				<%@ page import="값" contentType="마임타입;인코딩" %>
		2. 주석
				<%-- client 브라우저에 전송 안 하는 주석 --%>
		3. 선언자
				<%! 멤번변수, 메소드 구현 tag %>
		4. scriptlet
				<% 서비스하고자 하는 순수 자바 코드 로직들 %>
		5. 출력 
				<%= 출력만 %>