package step02.api;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ServletContextTest implements ServletContextListener{
// ������ ��ϵ� ������Ʈ -> web.xml�� <listener> �� ���, �ڵ� ����Ǵ� Ŭ����
	public ServletContextTest() {
		System.out.println("--------------������");
	}
	
	/*
	 * ��� user�� �����ϴ� �ڿ�
	 * ������ read�� ������ �ڿ� ������ �� ����
	 */

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("--------------contextInitialized");
		ServletContext context = arg0.getServletContext();
		//������ ����
		context.setAttribute("msg", "��� user�� �����ϴ� ����");
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("--------------contextDestroyed");

	}


}
