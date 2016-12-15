package com.samepage.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.samepage.model.EmpDAO;
import com.samepage.model.EmpDTO;
import com.samepage.view.EmpView;

public class EmpController {

	public static void main(String[] args) throws IOException, ParseException {
		
		EmpDAO 			empDAO = new EmpDAO();
		List<EmpDTO>	emplist = new ArrayList<>();
		
		InputStream is =  System.in; // 표준입력(키보드)
//		int a = is.read(); //1바이트만 읽는다.(아스키코드값)(한글은 안됨 2바이트라)
//		System.out.println(a); 
//		
		Scanner sc = new Scanner(is); // 그래서 편하게 하려고 스캐너를 쓴다.
//		System.out.println(sc.nextLine());
//		
		while(true){
			System.out.print("업무를 입력하세요 : ");
			String request = sc.nextLine(); 
			if(request.equals("bye")){
				System.out.println("종료합니다");
				break;
			}
			
			switch(request){
			case "selectall":
				emplist = empDAO.selectAll();
				EmpView.print(request, emplist);
				break;
				
			case "dept":
				System.out.print("조회할 부서번호를 입력 >>>>>");
				String dept = sc.nextLine();
				System.out.println("");
				emplist = empDAO.selectByDept(Integer.parseInt(dept));
				EmpView.printOne(request, emplist.get(0));
				break;
				
			case "salary":
				emplist = empDAO.selectBySalary();
				EmpView.print(request, emplist);
				break;
			
			case "multiselect":
				System.out.print("조회할 부서번호를 입력 >>>>>");
				String deptid = sc.nextLine();
				System.out.print("조회할 직무를 입력 >>>>>");
				String jobid = sc.nextLine();
				emplist = empDAO.selectByMultiSelect(deptid, jobid);
				EmpView.print(request, emplist);
				break;
			
			case "insert":
				System.out.print("입력할 부서번호를 입력 >>>>>");
				String employee_id = sc.nextLine();
				System.out.print("입력할 이름를 입력 >>>>>");
				String first_name = sc.nextLine();
				System.out.print("입력할 성을 입력 >>>>>");
				String last_name = sc.nextLine();
				System.out.print("입력할 이메일을 입력 >>>>>");
				String email = sc.nextLine();
				System.out.print("입력할 입사일을 입력 >>>>>");
				String hire_date = sc.nextLine();
				System.out.print("입력할 직무를 입력 >>>>>");
				String job_id = sc.nextLine();
				System.out.print("입력할 연봉을 입력 >>>>>");
				String salary = sc.nextLine();
				System.out.print("입력할 부서번호을 입력 >>>>>");
				String department_id = sc.nextLine();
				
				EmpDTO dto = new EmpDTO(employee_id, first_name, last_name, 
						email, hire_date, job_id, salary, department_id);
				
				empDAO.insert(dto);
				
			case "update":
				System.out.println("수정할 사번을 입력하시오 : ");
				int empid = sc.nextInt();
				sc.nextLine();
				if(empDAO.updateByID(empid)>0){
					System.out.println("성공적으로 수정하였습니다");
				}
				else{
					System.out.println("수정실패");
				}
				
				break;
				
			case "delete":
				
				break;
			default:
				break;
			}
		}
		
	}

}
