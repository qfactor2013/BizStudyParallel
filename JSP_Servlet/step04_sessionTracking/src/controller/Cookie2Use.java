package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cookie2Use extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// login.html -> Cookie1Save -> Cookie2Use�� �̵�
	/*
	 * client pc�� ���� Cookie ���� ȹ�� key = value ������ ����� ��Ű ������ �����͸� key(id/pw)��
	 * �̿��ؼ� ��ȯ ���̻� client�� ��Ű���� ����
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// �� ���ӵ� ����Ʈ(������)���� ���õ� ��Ű ������ ��ü�� clienjt �ý������� ���� ȹ��
		Cookie[] all = request.getCookies();

		for (int i = 0; i < all.length; i++) {
			String key = all[i].getName();
			if (key.equals("id")) {
				System.out.println("�����ڴ� client id : " + key);
				System.out.println("�����ڴ� client id�� ���ε� value : " + all[i].getValue());
			}
		}
		
		/* 3�ܰ� : client pc �� id�� �ش��ϴ� ��Ű �� ����
		 * API���� ��Ű ���� ���� �޼ҵ� ����
		 * - client �ý��ۿ� ����(addCookie()) ȣ���� �ʼ�
		 */
		
		Cookie delete = new Cookie("id", null);
		response.addCookie(delete);
		
	}
}