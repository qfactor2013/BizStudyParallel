package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertServlet extends HttpServlet {
	//doGet/doPost�� ���� : get/post ���
	/* 1�ܰ� : �ѱ� �����Ͱ� ���� ���ɼ��� ���� ���� ��û ��ü�� �ѱ� ���ڵ� ����
	 * 		- ������ client�� ������ �ѱ� ������ ���� ���·� ȹ�� �ɼ� ����
	 * 		- get ��� : server�� ���ڵ� ����
	 * 		- post��� : servlet api������ ó�� ����
	 * 2�ܰ� :client�� ������ ������ ȹ��
	 * 3�ܰ� :  ����
	 * 4�ܰ� : ������ ���뿡 �°� ȭ�� �̵�  * 
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1�ܰ� : ��û ��ü�� ���� ���� ��ü�ʹ� ���� 
		request.setCharacterEncoding("euc-kr");
		//2�ܰ�
		String id = request.getParameter("id");//id=������ ���۵Ǵ� ������ ȹ��
		String pw = request.getParameter("pw");
		//checkbox�� ���� �ϳ� �̻��� ������ ȹ�� -  �迭�� ��ȯ�ϴ� �޼ҵ�� ������ ȹ��
		String[] hobbys = request.getParameterValues("hobby");
		
		//3�ܰ� : id�� �ԷµǾ���? ����
		if( id != null && id.length() != 0){
			//�̵��Ǵ� ���� servlet������ ��� ������ ���ο� ������ ����
			request.setAttribute("name", "���缮");
			//forward ���� page�̵� 
			request.getRequestDispatcher("succ.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "�� ������ ��� �����Ѱ�?");
			//�����̷�Ʈ�� fail�� page�̵� 
			response.sendRedirect("fail.jsp");
		}
	
	}

}








 
 
