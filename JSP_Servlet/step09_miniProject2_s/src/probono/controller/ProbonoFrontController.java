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
			if(command.equals("probonoProjectAll")){//모든 probono project 정보 검색
				probonoProjectAll(request, response);
			}else if(command.equals("activistAll")){//모든 재능 기부자 검색
				activistAll(request, response);
			}else if(command.equals("activist")){//특정 재능 기부자 정보 검색
				activist(request, response);
			}else if(command.equals("activistInsert")){//재능 기부자 추가 등록
				activistInsert(request, response);
			}else if(command.equals("activistUpdateReq")){//재능 기부자 정보 수정요청
				activistUpdateReq(request, response);
			}else if(command.equals("activistUpdate")){//재능 기부자 정보 수정
				activistUpdate(request, response);
			}else if(command.equals("activistDelete")){//재능 기부자 탈퇴[삭제]
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
	

	//모두 ProbonoProject 검색 메소드
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
	//모든 재능 기부자 검색 - 검색된 데이터 출력 화면[activistList.jsp]
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
	
	//재능 기부자 검색 
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
	

	//재능 기부자 가입 메소드
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
				request.setAttribute("successMsg", "가입 완료");
				url = "activistDetail.jsp";
			}else{
				request.setAttribute("errorMsg", "다시 시도하세요");
			}
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	//재능 기부자 수정 요구
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
	//재능 기부자 수정 - 상세정보 확인 jsp[activistDetail.jsp]
	public void activistUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			boolean result =  ProbonoService.updateActivist(request.getParameter("activistId"),
															request.getParameter("major"));
			if(result == true){
				request.setAttribute("activist", ProbonoService.getActivist(request.getParameter("activistId")));
				url = "activistDetail.jsp";
			}else{
				request.setAttribute("errorMsg", "수정에 실패하였습니다.");
			}
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
			
	}
	
	//???
	//재능 기부자 삭제[activistList.jsp]
	public void activistDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			boolean result =  ProbonoService.deleteActivist(request.getParameter("activistId"));
			if(result == true){
				request.setAttribute("allActivist", ProbonoService.getAllActivists());
				url = "activistList.jsp";
			}else{
				request.setAttribute("errorMsg", "삭제에 실패하였습니다.");
			}
		}catch(Exception s){
			request.setAttribute("errorMsg", "진행 중인 프로젝트가 있습니다. 확인하시고 요청하세요");
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	//재능 수혜자 가입 메소드
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
					request.setAttribute("successMsg", "가입 완료");
					url = "recipientDetail.jsp";
				}else{
					request.setAttribute("errorMsg", "다시 시도하세요");
				}
			}catch(Exception s){
				request.setAttribute("errorMsg", s.getMessage());
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
}
