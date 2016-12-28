package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DeptDAO;

public class Controller extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		String command = request.getParameter("command");
		try {
			if (command.equals("deptno")) {
				request.setAttribute("msg", "deptno");//어떤 정보인지 구분용 data
				request.setAttribute("data", DeptDAO.getDeptnos());
				
			} else if (command.equals("dname")) {
				request.setAttribute("msg", "dname");
				request.setAttribute("data", DeptDAO.getDnames());
				
			} else if (command.equals("dept")) {
				request.setAttribute("msg", "all");
				request.setAttribute("dept", DeptDAO.getDept());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("deptView.jsp").forward(request, response);
	}
}
