package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DeptDAO;

public class Controller extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String command = request.getParameter("command");
		
			try{
				if(command.equals("deptno")){
					request.setAttribute("data", DeptDAO.getDeptnos());
				}else if(command.equals("dname")){
					request.setAttribute("data", DeptDAO.getDept());
				}else if(command.equals("dept")){
					request.setAttribute("data", DeptDAO.getDept());
				}else if(command.equals("deptJson")){
					request.setAttribute("deptJson", DeptDAO.getDeptJSON());
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		
		request.getRequestDispatcher("deptView.jsp").forward(request, response);
	}

	
	
}
