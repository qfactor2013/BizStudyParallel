package com.samepage.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.samepage.model.EmpDAO;
import com.samepage.model.EmpDTO;
import com.samepage.view.EmpView;

public class EmpController {

	public static void main(String[] args) throws IOException {
		EmpDAO empDAO = new EmpDAO();
		List<EmpDTO> emplist = null;
		EmpDTO empDTO = null;
		
		InputStream is = System.in ; //표준입력(키보드)
        
		Scanner sc = new Scanner(is);
		while(true){
			System.out.print("업무를 입력하세요>>");
			String request = sc.nextLine();
			if(request.equals("bye")) break;
			
			switch (request) {
			case "selectall":
				emplist = empDAO.selectAll();
				EmpView.print("모든직원조회", emplist);
				break;
			case "dept":
				System.out.print("조회할 부서번호를 입력하세여>>");
				int dept = Integer.parseInt(sc.nextLine());
				emplist = empDAO.selectByDept(dept);
				EmpView.print(dept+ "부서 직원조회", emplist);
				 
				break;
			case "salary":
				System.out.print("급여범위를 입력하세요>>");
				int losal = sc.nextInt();
				int hisal = sc.nextInt();
				sc.nextLine();				
				emplist = empDAO.selectBySalary(losal, hisal);
				EmpView.print(losal +"~" + hisal+ "급여를 받는 직원조회", emplist);				 
				break;
			case "deptjob":
				System.out.print("부서를 입력하세요>>");
				int dept2 = sc.nextInt();
				System.out.print("직업을 입력하세요>>");
				String job = sc.next();
				sc.hasNextLine();
				emplist = empDAO.selectByDeptJob(dept2, job);
				EmpView.print(dept2 +"~" + job+ "... 직원조회", emplist);				 
				break;
			default:
				break;
			}
			
		}
		System.out.println("시스템이 종료되었습니다.");
        
	}

}



