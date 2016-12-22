package step02.api;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ServletContextTest implements ServletContextListener{
// 서버에 등록된 프로젝트 -> web.xml에 <listener> 에 등록, 자동 실행되는 클래스
	public ServletContextTest() {
		System.out.println("--------------생성자");
	}
	
	/*
	 * 모든 user가 공유하는 자원
	 * 가급적 read만 가능한 자원 공유할 때 권장
	 */

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("--------------contextInitialized");
		ServletContext context = arg0.getServletContext();
		//데이터 저장
		context.setAttribute("msg", "모든 user가 공유하는 공지");
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("--------------contextDestroyed");

	}


}
