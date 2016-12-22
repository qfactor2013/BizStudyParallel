package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.domain.Person;

//list url ������ ���ε� ����
public class Info extends HttpServlet {
	/* biz ������ ģ�� ������ ��ȯ���ִ� �޼ҵ� ȣ��
	 * ��ȯ���� ����(ģ��������)�� jsp���� ����϶� ����
	 * 
	 * ������ ����
	 * 1. ������ ȹ��
	 * 2. jsp���� �����Ҷ� ��� ����?
	 * 		- ��û ��ü ���� -> forward ������� jsp�� �̵�
	 * 3. jsp�� �̵�
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//import ����Ű : ctrl+Shift + O
		ArrayList<Person> all = new ArrayList<Person>();
		all.add(new Person("������", 40));
		all.add(new Person("�̿���", 50));
		all.add(new Person("�ŵ���", 60));
		
		//jsp���� ��� �����ϰ� ��û ��ü�� ������ ����
		request.setAttribute("datas", all);
		
		//�� ����
		//http://ip:port/step05_JSP/list
		
		
		//forward������� page�̵�
		//http://ip:port/step05_JSP/view/list.jsp
		request.getRequestDispatcher("view/list.jsp").forward(request, response);
	}

}





