package guestbook.controller;

import guestbook.model.GuestBookBean;
import guestbook.model.GuestBookDAO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestBookServlet extends HttpServlet
// javax.servlet.http.HttpServlet ���� Ǯ��Ű���� �� �ʿ����.
{
	// ���� ��θ� Ż�Ŷ�� �Ѵ� �ʿ� ����.
	// protected void doGet(HttpServletRequest request, HttpServletResponse
	// response) throws ServletException, IOException {
	// process(request,response);
	// }
	// protected void doPost(HttpServletRequest request, HttpServletResponse
	// response) throws ServletException, IOException {
	// process(request,response);
	// }
	protected void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// post������� ���۵Ǵ� �ѱ� �����Ϳ� ���� ���ڵ� ����
		// get ������� ���۵Ǵ� �ѱ� �����ʹ� ������ ���� ����(server.xml)�� �߰� ����(URIEncoding =
		// "euc-kr")
		request.setCharacterEncoding("euc-kr");

		// ��� ��û�� �ϳ��� servlet�� ���� : command pattern & controller
		String command = request.getParameter("command");

		// guestbook.do �θ� ��û���� �� ��� ���⸦ ���� list�� ����
		if (command == null) {
			command = "list";
		}

		if (command.equals("list")) {

			// GuestBookBean [] list = GuestBookDAO.getAllContents();
			//// ArrayList<GuestBookBean> list;
			// String url = "error.jsp";
			// try {
			// request.setAttribute("list", GuestBookDAO.getAllContents());
			// url = "list.jsp";
			// } catch (SQLException e) {
			// // TODO Auto-generated catch block
			//// e.printStackTrace();
			// request.setAttribute("error", "��� ���� ���� �� ���� �� �ּ���");
			// }
			// request.setAttribute("list", list);
			//
			// //���� rd�� �� �ʿ䰡 ����
			// RequestDispatcher rd=request.getRequestDispatcher("list.jsp");
			// rd.forward(request, response);

			list(request, response);

		} else if (command.equals("write")) {

			// write �޼ҵ�� �̰�
			// String title=request.getParameter("title");
			// String author=request.getParameter("author");
			// String email=request.getParameter("email");
			// String content=request.getParameter("content");
			// String password=request.getParameter("password");
			//
			// if(title == null || title.trim().length() == 0 ||
			// author == null || author.trim().length() == 0 ||
			// email == null || email.trim().length() == 0 ||
			// content == null || content.trim().length() == 0 ||
			// password == null || password.trim().length() == 0 ){
			// response.sendRedirect("write.html");
			// return;

			write(request, response);

		} else if (command.equals("read")) {
			// read �޼ҵ�� �̰�
//			String strNum = request.getParameter("num");
//
//			if (strNum == null) {
//				response.sendRedirect("guestbook.do");
//				return;
//			}
//			int num = Integer.parseInt(strNum);
//
//			GuestBookBean gContent = GuestBookDAO.getContent(num, true);
//			if (gContent == null) {
//				response.sendRedirect("error.jsp");
//				return;
//			} else {
//				request.setAttribute("resultContent", gContent);
//
//				RequestDispatcher rd = request.getRequestDispatcher("/read.jsp");
//				rd.forward(request, response);
//				return;
			read(request, response);
		} else if (command.equals("updateForm")) {
			// update �޼ҵ�� �̰�
//			String strNum = request.getParameter("num");
//			if (strNum == null || strNum.trim().length() == 0) {
//				response.sendRedirect("guestbook.do");
//				return;
//			}
//			int num = Integer.parseInt(strNum);
//			GuestBookBean gContent = GuestBookDAO.getContent(num, false);
//			if (gContent == null) {
//				response.sendRedirect("error.jsp");
//				return;
//			} else {
//				request.setAttribute("resultContent", gContent);
//
//				RequestDispatcher rd = request.getRequestDispatcher("update.jsp");
//				rd.forward(request, response);
//				return;
//			}
			updateForm(request, response);
		} else if (command.equals("update")) {
//			String strNum = request.getParameter("num");
//
//			String title = request.getParameter("title");
//			String author = request.getParameter("author");
//			String email = request.getParameter("email");
//			String content = request.getParameter("content");
//			System.out.println(content);
//			String password = request.getParameter("password");
//
//			if (strNum == null || strNum.trim().length() == 0 || title == null || title.trim().length() == 0
//					|| author == null || author.trim().length() == 0 || email == null || email.trim().length() == 0
//					|| content == null || content.trim().length() == 0 || password == null
//					|| password.trim().length() == 0) {
//				response.sendRedirect("guestbook.do");
//				return;
//			}
//			int num = Integer.parseInt(strNum);
//			GuestBookBean gContent = new GuestBookBean(num, title, author, email, content, password);
//			boolean result = GuestBookDAO.updateContent(gContent);
//			if (result) {
//				response.sendRedirect("guestbook.do");
//				return;
//			} else {
//				response.sendRedirect("error.jsp");
//				return;
//			}
			update(request, response);

		} else if (command.equals("delete")) {
			// delete �޼ҵ�� �̰�
//			String strNum = request.getParameter("num");
//			String password = request.getParameter("password");
//
//			if (strNum == null || strNum.trim().length() == 0 || password == null || password.trim().length() == 0) {
//				response.sendRedirect("guestbook.do");
//				return;
//			}
//			int num = Integer.parseInt(strNum);
//			boolean result = GuestBookDAO.deleteContent(num, password);
//			if (result) {
//				response.sendRedirect("guestbook.do");
//				return;
//			} else {
//				response.sendRedirect("error.jsp");
//				return;
//			}
			delete(request, response);
		}
	}

	/*
	 * ����? ������? ���õ� ��������� �ݿ�
	 */
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// GuestBookBean [] list = GuestBookDAO.getAllContents();
		// ArrayList<GuestBookBean> list;
		String url = "error.jsp";
		try {
			request.setAttribute("list", GuestBookDAO.getAllContents());
			url = "list.jsp";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			request.setAttribute("error", "��� ���� ���� �� ���� �� �ּ���");
		}
		// request.setAttribute("list", list);

		// ���� rd�� �� �ʿ䰡 ����
		// RequestDispatcher rd=request.getRequestDispatcher("list.jsp");
		// rd.forward(request, response);
		// request.getRequestDispatcher("list.jsp").forward(request, response);
		request.getRequestDispatcher(url).forward(request, response);
	}

	//���� �ۼ� : db�� ����
	private void write(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String email = request.getParameter("email");
		String content = request.getParameter("content");
		String password = request.getParameter("password");

		//�����Ͱ� �Է� ������ ��ȿ�� ����
		if (title == null || title.trim().length() == 0 
				|| author == null || author.trim().length() == 0
				|| email == null || email.trim().length() == 0 
				|| content == null || content.trim().length() == 0
				|| password == null || password.trim().length() == 0)
		{
			response.sendRedirect("write.html");
			return;//write() �޼ҵ� ����
		}

		boolean result = false;
		try {
			result = GuestBookDAO.writeContent(new GuestBookBean(title, author, email, content, password));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("error", "�Խñ� ���� �õ� ���� �� �õ� �ϼ���");
		}

		if (result) {
			//db�� ���� ������ guestbook.do�� url ��û : get������� �����̷�Ʈ
			//guestbook.do : web.xml 
			response.sendRedirect("guestbook.do");
		} else {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	private void read(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String strNum = request.getParameter("num");

		if (strNum == null || strNum.length() == 0) {
			response.sendRedirect("guestbook.do");
			return;
		}

		String url = "error.jsp";
		GuestBookBean gContent = null;
		
		try{
			gContent = GuestBookDAO.getContent(Integer.parseInt(strNum), true);			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		if (gContent == null) {
			request.setAttribute("error", "�ش� �Խñ��� �������� �ʽ��ϴ�.");
		} else {
			request.setAttribute("resultContent", gContent);
			url = "/read.jsp";

			request.getRequestDispatcher(url).forward(request, response);
		}
	}
	
	private void updateForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String strNum = request.getParameter("num");
		GuestBookBean gContent = null;
		String url = "error.jsp";
		if (strNum == null || strNum.trim().length() == 0) {
			response.sendRedirect("guestbook.do");
			return;
		}
		try {
			gContent = GuestBookDAO.getContent(Integer.parseInt(strNum), false);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "�����ϰ��� �ϴ� �Խñ� �˻��� �����߽��ϴ�");
		}
		if (gContent == null) {
			request.setAttribute("error", "�����ϰ��� �ϴ� �Խñ��� �������� �ʽ��ϴ�.");
		} else {
			request.setAttribute("resultContent", gContent);
			url = "update.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	/*
	 * ���� ���� �� ��� ���� ����
	 * 		- ������ �����͸� �߰� ������ �ʿ����
	 */
	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		String url = "error.jsp";
		
		String strNum = request.getParameter("num");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String email = request.getParameter("email");
		String content = request.getParameter("content");
		System.out.println(content);
		String password = request.getParameter("password");

		if (strNum == null || strNum.trim().length() == 0 
				|| title == null || title.trim().length() == 0
				|| author == null || author.trim().length() == 0 
				|| email == null || email.trim().length() == 0
				|| content == null || content.trim().length() == 0 
				|| password == null
				|| password.trim().length() == 0) 
		{
			response.sendRedirect("guestbook.do");
			return;
		}
		GuestBookBean gContent = new GuestBookBean(Integer.parseInt(strNum), 
										title, author, email, content, password);
		boolean result = false;
		try {
			result = GuestBookDAO.updateContent(gContent);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("error", "�Խù� ���� ����");
		}
		if (result) {
			response.sendRedirect("guestbook.do");
			return;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
		} else {
			request.getRequestDispatcher(url).forward(request, response);
		}
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
				String strNum=request.getParameter("num");
				String password = request.getParameter("password");
				
				if(strNum == null || strNum.trim().length() == 0 ||
					password == null || password.trim().length() == 0){
					response.sendRedirect("guestbook.do");
					return;				
				}
				boolean result = false;
				try {
					result = GuestBookDAO.deleteContent(Integer.parseInt(strNum),password);
				} catch (SQLException e) {
					e.printStackTrace();
					request.setAttribute("error", "�ش� �Խñ� ���� �����߽��ϴ�. �� �õ� �ϼſ�");
				}
				if(result){
					response.sendRedirect("guestbook.do");			
					return;
				}else{
					request.setAttribute("error", "�����Ϸ��� �Խñ��� �������� �ʽ��ϴ�");
				}
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}

	
	
}
	