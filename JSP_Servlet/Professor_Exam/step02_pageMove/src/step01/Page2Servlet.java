package step01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//������ index.html �� 3�� �׸����� �����غ���
//�ּ��� Ȯ�� & �ܼ�â(���� ����â) Ȯ�� �ʼ� 
public class Page2Servlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Page2Servlet�� doGet()");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Page2Servlet�� doPost()");
	}

}
