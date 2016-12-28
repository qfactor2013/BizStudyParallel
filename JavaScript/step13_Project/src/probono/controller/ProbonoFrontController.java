package probono.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import probono.model.ProbonoService;
import probono.model.dto.ActivistDTO;


public class ProbonoFrontController extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String command = request.getParameter("command");
		try{
			if(command.equals("probonoProjectAll")){//��� probono project ���� �˻�
				probonoProjectAll(request, response);
			}else if(command.equals("activistAll")){//��� ��� ����� �˻�
				activistAll(request, response);
			}else if(command.equals("activist")){//Ư�� ��� ����� ���� �˻�
				activist(request, response);
			}else if(command.equals("activistInsert")){//��� ����� �߰� ���
				activistInsert(request, response);
			}else if(command.equals("activistUpdateReq")){//��� ����� ���� ������û
				activistUpdateReq(request, response);
			}else if(command.equals("activistUpdate")){//��� ����� ���� ����
				activistUpdate(request, response);
			}else if(command.equals("activistDelete")){//��� ����� Ż��[����]
				activistDelete(request, response);
			}
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
			request.getRequestDispatcher("showError.jsp").forward(request, response);
			s.printStackTrace();
		}
	}
	

	//��� ProbonoProject �˻� �޼ҵ�
	public void probonoProjectAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			request.setAttribute("probonoProjectAll", ProbonoService.getAllProbonoProjects());
			url = "probonoProjectList.jsp";
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	//???
	//��� ��� ����� �˻� - �˻��� ������ ��� ȭ��[activistList.jsp]
	public void activistAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			request.setAttribute("activistAll", ProbonoService.getAllActivists());
			System.out.println("????");
			url = "activistList.jsp";
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
			s.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	//��� ����� �˻�    
	public void activist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			request.setAttribute("activist", ProbonoService.getActivist(request.getParameter("activistId")));
			url = "activistDetail.jsp";
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	

	//��� ����� ���� �޼ҵ�
	protected void activistInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String major = request.getParameter("major");
		
		ActivistDTO activist = new ActivistDTO(id, name, pw, major);
		try{
			boolean result = ProbonoService.addActivist(activist);
			if(result){
				request.setAttribute("activist", activist);
				request.setAttribute("successMsg", "���� �Ϸ�");
				url = "activistDetail.jsp";
			}else{
				request.setAttribute("errorMsg", "�ٽ� �õ��ϼ���");
			}
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	//��� ����� ���� �䱸
	public void activistUpdateReq(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			request.setAttribute("activist", ProbonoService.getActivist(request.getParameter("activistId")));
			url = "activistUpdate.jsp";
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	//???
	//��� ����� ���� - ������ Ȯ�� jsp[activistDetail.jsp]
	public void activistUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			String activistId = request.getParameter("activistId");
			String major = request.getParameter("major");
			ProbonoService.updateActivist(activistId, major);
			request.setAttribute("activist", ProbonoService.getActivist(request.getParameter("activistId")));
			url = "activistDetail.jsp";
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	//???
	//��� ����� ����
	public void activistDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			String activistId = request.getParameter("activistId");
			if(ProbonoService.deleteActivist(activistId)){
				request.setAttribute("activistAll", ProbonoService.getAllActivists());
				url = "activistList.jsp";
			}else{
				request.setAttribute("errorMsg", "�� ���� �� �ּ���");
			}
		}catch(Exception s){
			request.setAttribute("errorMsg", "�������� Probono Project�� �ֽ��ϴ�");
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
