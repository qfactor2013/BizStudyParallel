//url?
//http://ip:port/project명/실행파일명
/* 보안 고려한 기본 설정
 * 1. HelloServlet -> kosa 이름으로 변경해서 셋팅
 * 2. http://ip:port/step01_basic/kosa
 * 3. 실행 성공
 * 	4. 서버 콘솔창 확인
 * 5. 브라우저 새로고침 여러번 시도(client 가 여러명인듯한 효과의 test)
 * 		- 서버 콘솔창 확인 
 * 	6. 브라우저에 데이터 출력 가능한 코드로 변환
 * 		- 메세지가 blue 색으로 출력
 * 		- 데이터 blue : html <font color 속성>
 */

package step01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
    public HelloServlet() {
    	System.out.println("생성자");
    }

    //client 요청시 자동 실행
    /* ?
     * 1. 이 메소드 호출 주체?
     * 		- client가 url로 요청 시도 -> tomcat(web container) 가 감지 
     * 		-> 해당 객체 존재 확인
     * 		-> 객체 무 : 객체 생성, 객체 유 : 이미 존재하는 객체 지정
     * 		-> doGet()를 web container가 호출
     * 
     * 	2. 메소드가 정상 호출이란 의미 : 이 두개의 객체를 web container가 생성해서 
     * 		매개변수로 반영하면서 호출
     * 	
     * 		HttpServletRequest : 이 객체가 생성되어 연관있는 client만의 요청 정보를 보유한 객체
     * 		HttpServletResponse : "		 	"									"  응답을 위한 객체
     * 
     * 3. web container가 생성 시키는 객체
     * 		HelloServlet
     * 		HttpServletRequest
     * 		HttpServletResponse
     * 
     * 4. 호출 횟수로 보는 객체수 파악해 보기
     * 	- client가 100이가 가정
     * - client : HelloServlet 객체수 : HttpServletRequest 객체수 :  HttpServletResponse 객체수
     * = 100  : 1 : 100 : 100
     * 
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//서버 콘솔창에 출력
		System.out.println("doGet");
		
		//client에 브라우저에 출력
		/* 1. 한글 출력 데이터 인코딩 설정
		 * 2. 데이터를 브라우저에 출력(2byte 출력) 객체 생성
		 * 3. 실제 출력 */
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println("<font color='blue'>안녕하세요</font>");				
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
	}
}
