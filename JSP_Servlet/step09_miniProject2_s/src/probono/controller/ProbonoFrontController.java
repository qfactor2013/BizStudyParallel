package probono.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import probono.exception.MessageException;
import probono.model.ProbonoService;
import probono.model.dto.ActivistDTO;
import probono.model.dto.RecipientDTO;
public class ProbonoFrontController extends HttpServlet {
    public ProbonoFrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			}else if(command.equals("probonoProjectDetail")){
				probonoProjectDetail(request, response);
			}else if(command.equals("recipientInsert")){
				recipientInsert(request, response);
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
	
	public void probonoProjectDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String url = "showError.jsp";
		try {
			request.setAttribute("probonoProject", 
								ProbonoService.getProbono(request.getParameter("probonoId")));
			url = "probonoProjectDetail.jsp";
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
			request.setAttribute("allActivist", ProbonoService.getAllActivists());
			url = "activistList.jsp";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
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
			boolean result =  ProbonoService.updateActivist(request.getParameter("activistId"),
															request.getParameter("major"));
			if(result == true){
				request.setAttribute("activist", ProbonoService.getActivist(request.getParameter("activistId")));
				url = "activistDetail.jsp";
			}else{
				request.setAttribute("errorMsg", "������ �����Ͽ����ϴ�.");
			}
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
			
	}
	
	//???
	//��� ����� ����[activistList.jsp]
	public void activistDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			boolean result =  ProbonoService.deleteActivist(request.getParameter("activistId"));
			if(result == true){
				request.setAttribute("allActivist", ProbonoService.getAllActivists());
				url = "activistList.jsp";
			}else{
				request.setAttribute("errorMsg", "������ �����Ͽ����ϴ�.");
			}
		}catch(Exception s){
			request.setAttribute("errorMsg", "���� ���� ������Ʈ�� �ֽ��ϴ�. Ȯ���Ͻð� ��û�ϼ���");
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	//��� ������ ���� �޼ҵ�
		protected void recipientInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String url = "showError.jsp";
			
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String pw = request.getParameter("pw");
			String receiveContent = request.getParameter("receiveHopeContent");
			
			RecipientDTO recipient = new RecipientDTO(id, name, pw, receiveContent);
			try{
				boolean result = ProbonoService.addRecipient(recipient);
				if(result){
					request.setAttribute("receiver", recipient);
					request.setAttribute("successMsg", "���� �Ϸ�");
					url = "recipientDetail.jsp";
				}else{
					request.setAttribute("errorMsg", "�ٽ� �õ��ϼ���");
				}
			}catch(Exception s){
				request.setAttribute("errorMsg", s.getMessage());
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
}
