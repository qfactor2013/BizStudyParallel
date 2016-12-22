package step01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginCheck extends HttpServlet {
	
	//http get�̶�� ��� ó�� �޼ҵ�
	//http://localhost:8089/step01_basic/idCheck?idValue=master&pwValue=77
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
		process(request, response);
	}
	
	//http post ��� ��� ó�� �޼ҵ� 
	//http://localhost:8089/step01_basic/idCheck
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()");
		process(request, response);
	}
	
	//id/pw ���� ���� �� ��� ����
	/* 1�ܰ� : id/pw�� ȹ��
	 * 2�ܰ� : ��ȿ�� ����
	 * 3�ܰ� :
	 * 			��ȿ? �ȳ��ϼſ� id��
	 * 			��ȿ? ��ȿ�� �����Դϴ�	 */
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1�ܰ�
		String id = request.getParameter("idValue");
		String pw = request.getParameter("pwValue");
		System.out.println(id + " --- " + pw);
		
		//����� ���� ���� : �ѱ�, html ����, 2byte ���
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		//2�ܰ�
		if(id.equals("master") && pw.equals("77")){
			out.println("�ȳ��ϼ��� - " + id);
		}else{
			out.print("�߸��� id�� �Դϴ�");
		}
	}
}









