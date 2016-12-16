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
		// 1�ܰ� : ��û ��ü�� ����, ���� ��ü�ʹ� ����
		request.setCharacterEncoding("euc-kr");
		// 2�ܰ�
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		// checkbos�� ���� �ϳ� �̻��� ������ ȹ�� - �迭�� ��ȯ�ϴ� �޼ҵ�� ������ ȹ��
		String[] hobbys = request.getParameterValues("hobby");

		// 3�ܰ� : id�� �ԷµǾ���? ����
		if (id != null && id.length() != 0) {
			//�̵��Ǵ� ���� servlet������ ��� ������ ���ο� ������ ����
			request.setAttribute("name", "���缮");
			//forward ���� page �̵�
			request.getRequestDispatcher("succ.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "�� ������ ��� �����Ѱ�?");
			response.sendRedirect("fail.jsp");
		}

	}

}
