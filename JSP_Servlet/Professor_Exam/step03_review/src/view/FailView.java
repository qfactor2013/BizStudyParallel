package view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FailView extends HttpServlet {
	//request.setAttribute("msg", "�� ������ ��� �����Ѱ�?");
	//response.sendRedirect("fail");
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		/* �����̷�Ʈ�� �̵��� fail�� ���ο� ��û/���� ��ü ����
		 * ���� servelt���� ��û ��ü�� ������ ���� �ߴ� �ϴ��� ��� �Ұ�
		 * ��? �� ��û ��ü�� �̹� ��� �Ұ��� ��ü�� �Ǿ��� ����
		 * �׷��ٸ� �����̷�Ʈ�� page�̵��� ������ ���� ���(���� ������ ���?)
		 * 		- ����/��Ű	 */
		out.println(request.getAttribute("msg") + "------<br>");
		out.println(request.getParameter("id") + "-----<br>");
		out.print("��ȿ");
	}
}







