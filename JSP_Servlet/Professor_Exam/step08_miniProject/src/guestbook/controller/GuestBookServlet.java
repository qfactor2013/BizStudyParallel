package guestbook.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.model.GuestBookBean;
import guestbook.model.GuestBookDAO;

 
 public class GuestBookServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//post������� ���۵Ǵ� �ѱ� �����Ϳ� ���� ���ڵ� ����
		//get������� ���۵Ǵ� �ѱ� �����ʹ� ������ ���� ���Ͽ� �߰� ����
		//server.xml ������ 63line�� URIEncoding="euc-kr" �߰�
		request.setCharacterEncoding("euc-kr");
		
		
		//��� ��û�� �ϳ��� servlet�� ���� : command pattern & controller 		
		String command=request.getParameter("command");
		
		//guestbook.do �θ� ��û�� ��� ���� �Ҽ� �ְڱ� ó���� ����
		if(command == null){
			command = "list";
		}		
		
		if(command.equals("list")){
			list(request, response);
		}else if(command.equals("write")){
			write(request, response);
		}else if(command.equals("read")){
			read(request, response);
		}else if(command.equals("updateForm")){
			updateForm(request, response);
		}else if(command.equals("update")){
			update(request, response);
		}else if(command.equals("delete")){
			delete(request, response);
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
	/* ������� �� ��� ���� ����
	 * 		- ������ �����͸� �߰� ������ �ʿ���� guestbook.do url�� ��û 
	 * ������ ���� ���� error.jsp�� ��Ȳ�޼��� �����ؼ� ����	 */
	private void update(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException{
		String strNum = request.getParameter("num");
		String title=request.getParameter("title");
		String author=request.getParameter("author");				
		String email=request.getParameter("email");				
		String content=request.getParameter("content");
		String password=request.getParameter("password");
		if(strNum == null || strNum.trim().length() == 0 ||
			title == null || title.trim().length() == 0 ||
			author == null || author.trim().length() == 0 ||
			email == null || email.trim().length() == 0 ||
			content == null || content.trim().length() == 0 ||
			password == null || password.trim().length() == 0 ){
				response.sendRedirect("guestbook.do");
				return;
		}
		boolean result = false;
		try {
			result = GuestBookDAO.updateContent(new GuestBookBean(Integer.parseInt(strNum),title,author,email,content,password));
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("error", "�Խñ� ���� ����");
		}
		if(result){
			response.sendRedirect("guestbook.do");
			return;
		}
		request.getRequestDispatcher("error.jsp").forward(request, response);
	}

	private void updateForm(HttpServletRequest request, HttpServletResponse response) 
	throws IOException, ServletException{
		String strNum=request.getParameter("num");
		if(strNum == null || strNum.trim().length() == 0){
			response.sendRedirect("guestbook.do");
			return;				
		}
		String url = "error.jsp";
		GuestBookBean gContent = null;
		try {
			gContent = GuestBookDAO.getContent(Integer.parseInt(strNum), false);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "�����ϰ��� �ϴ� �Խñ� �˻� �����߽��ϴ�");
		}
		if(gContent == null){
			request.setAttribute("error", "�����ϰ��� �ϴ� �Խñ��� �������� �ʽ��ϴ�");
		}else{
			request.setAttribute("resultContent", gContent);
			url = "update.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	private void read(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String strNum=request.getParameter("num");
		if(strNum==null || strNum.length() == 0){
			response.sendRedirect("guestbook.do");
			return;
		}
		String url = "error.jsp";
		GuestBookBean gContent = null;
		try {
			gContent = GuestBookDAO.getContent(Integer.parseInt(strNum), true);
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("error", "�Խñ� �б� ����");
		}
		if(gContent == null){
			request.setAttribute("error", "�ش� �Խñ��� �������� �ʽ��ϴ�");
		}else{
			request.setAttribute("resultContent", gContent);
			url = "/read.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	//���� �ۼ� : db�� ����
	private void write(HttpServletRequest request, HttpServletResponse response) 
				throws IOException, ServletException{
		String title=request.getParameter("title");
		String author=request.getParameter("author");				
		String email=request.getParameter("email");				
		String content=request.getParameter("content");				
		String password=request.getParameter("password");
		
		//�����Ͱ� �Է� ������ ��ȿ�� ����
		if(title == null || title.trim().length() == 0 ||
		author == null || author.trim().length() == 0 ||
		email == null || email.trim().length() == 0 ||
		content == null || content.trim().length() == 0 ||
		password == null || password.trim().length() == 0 ){
			response.sendRedirect("write.html");
			return;//write() �޼ҵ� ����
		}
		boolean result = false;
		try {
			result = GuestBookDAO.writeContent(new GuestBookBean(title,author,email,content,password));
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("error", "�Խñ� ���� �õ� ���� �� �õ� �ϼ���");
		}
		if(result){
			//db�� ���� ������ guestbook.do�� url ��û : get������� �����̷�Ʈ
			//guestbook.do : web.xml 
			response.sendRedirect("guestbook.do"); 
		}else{
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	/* ����? ������? ���õ� ��������� �ݿ�
	 * ������ ������ ��� error.jsp�� �̵� �߰�
	 * error.jsp�� EL tag�� ��Ȳ �޼��� ���
	 */
	private void list(HttpServletRequest request, HttpServletResponse response) 
							throws ServletException, IOException {
		String url = "error.jsp";
		try {
			request.setAttribute("list", GuestBookDAO.getAllContents());
			url = "list.jsp";
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("error", "��� ���� ���� �� ���� �� �ּ���");
		}	
		request.getRequestDispatcher(url).forward(request, response);
	}
}
 
 
 
 
 
 
 
 
 
 