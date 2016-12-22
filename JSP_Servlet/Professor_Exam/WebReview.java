WebReview.java

1. http ��û url
	- http://ip:port/webproject��/����
	- web project�� : context�� = app~��
	- port�� ���� : http�⺻ port 80
		http://www.naver.com
		http://www.naver.com:80/index.html
		http://www.daum.net
		http://www.daum.net:80/index.html
	- jsp/html/servlet
		http://ip:port/project/*.jsp
		http://ip:port/project/*.html
		http://ip:port/project/������Ȯ��������Ұ�


2. index.html
	- url�� ������� �ʾƵ� �ڵ� ����Ǵ� ����
	- web.xml
	  <welcome-file-list>
		 <welcome-file>index.html</welcome-file>
	 <welcome-file-list>


3. servlet �ֿ� API
	1. servlet ���� ���
		import javax.servlet.http.HttpServlet;
		import javax.servlet.http.HttpServletRequest;
		import javax.servlet.http.HttpServletResponse;
		public class �̸� extends HttpServlet{
			protected void doGet(HttpServletRequest req, HttpServletResponser res) throws IOException, ServletException{}
			protected void doPost(HttpServletRequest req, HttpServletResponser res) throws IOException, ServletException{}
			protected void service(HttpServletRequest req, HttpServletResponser res) throws IOException, ServletException{}
		}
	2. forward ������� page�̵�
		//��û ��ü�� ������ ����
		��û����.setAttribute(key, value);
		RequestDispatcher ���� =  req.getRequestDispatcher("�̵� page");
		����.forward(��û��ü, ���䰴ü);

		//�̵��� page���� ������ ��ȯ
		��û����.getAttribute(key);

	3. redirect ������� page�̵�
		���䰴ü.sendRedirect("�̵� page");

	4. ���� ������ ���� �ֿ� API
		1. ���� �޸𸮿� ��ü Ÿ������ ����
			//����
			HttpSession session = ��û��ü.getSession();
			//���� ������ ���� ������ ����
			session.setAttribute(key, value);
			//���� ��ü ȹ�� 
			HttpSession session = ��û��ü.getSession();
			//������ ȹ��
			Ÿ�� ������ = (����ȯ)session.getAttribute(key);
			//���� ��ȿȭ
			session.invalidate();
				
		2. client �ý��ۿ� ���ڿ��θ� ����
			//��Ű ����
			Cookie ���� = new Cookie("key", "������");
			//�ð� ����
			����.setMaxAge(�ʴ���);
			//client���� ����
			����.addCookie(����);
			//��Ű ȹ��
			Cookie[] ���� = ��û.getCookies();
			//��Ű Ű�� ��ȯ
			����[index].getName()
			//��Ű value ��ȯ
			����[index].getValue()
	
	5. client�� ���� ���۵Ǵ� ������ : web	query string
		1. String getParameter("key")
		2. String[] getParameterValues("key")

	6. HttpServletRespone �޼ҵ�
		1. setContentType("����Ÿ��;���ڵ�");
		2. getWriter()
		3. sendRedirect()



4. page  �̵� ���
	1. html ���
		1. ��ũ
		2. ��ư
	2. servlet �̵� page
		1. forward 
			: ��û, ���� ��ü ����, ��û ��ü�� ������ ������ Ȱ��, �ּ��� ��������
		2. redirect
			: ��û, ���� ��ü �Ҹ�, ���Ӱ� ����, ��û ��ü�� ������ �����ص� ��� �Ұ�

5. jsp
	1. scripting tag
		1. page������	
				<%@ page import="��" contentType="����Ÿ��;���ڵ�" %>
		2. �ּ�
				<%-- client �������� ���� �� �ϴ� �ּ� --%>
		3. ������
				<%! �������, �޼ҵ� ���� tag %>
		4. scriptlet
				<% �����ϰ��� �ϴ� ���� �ڹ� �ڵ� ������ %>
		5. ��� 
				<%= ��¸� %>