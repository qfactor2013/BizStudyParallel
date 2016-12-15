package com.samepage.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.samepage.model.EmpDAO;
import com.samepage.model.EmpDTO;
import com.samepage.view.EmpView;

public class EmpController {

	public static void main(String[] args) throws IOException, ParseException {
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
				int dept2 = Integer.parseInt(sc.next());//0
				System.out.print("직업을 입력하세요>>");
				String job = sc.next(); //all
				sc.nextLine();
				emplist = empDAO.selectByDeptJob(dept2, job);
				EmpView.print(dept2 +"~" + job+ "... 직원조회", emplist);				 
				break;
			case "insert":
				System.out.print("입력할 직원번호:");
				int employee_id = sc.nextInt();
				System.out.print("입력할 이름:");
				String first_name=sc.next();	
				System.out.print("입력할 last_name:");
				String last_name=sc.next();
				System.out.print("입력할 email:");
				String email=sc.next();
				System.out.print("입력할 hire_date(yyyy/mm/dd):");				
				String dt = sc.next(); 
				//String->java.util.Date->java.sql.Date
				SimpleDateFormat sf = new SimpleDateFormat("yyyy/mm/dd");
				java.util.Date dt2 = sf.parse(dt);	
				Date hire_date = new Date(dt2.getTime());
				
				System.out.print("입력할 job_id:");
				String job_id = sc.next();
				
				System.out.print("입력할 salary:");
				int salary = sc.nextInt();
				
				System.out.print("입력할 department_id:");
				int department_id = sc.nextInt();
				sc.nextLine();
				
				empDTO = new EmpDTO(employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id);
				int result = empDAO.empInsert(empDTO);
				if(result>0){
					EmpView.print(result + "명의 직원정보가 입력되었습니다.");
				}else{
					EmpView.print("직원정보 입력 실패하였습니다.");
				}
			case "update":
				System.out.print("수정할 직원번호:");
				int empid = sc.nextInt();
				sc.nextLine();
				empDTO = empDAO.selectById(empid);
				if(empDTO!=null){
					EmpView.print("수정할 직원번호",empDTO);
				}else{
					EmpView.print(empid + "번 직원은 존재하지않습니다.");
					break;
				}
				//이름, 급여, 이메일
				System.out.print("수정할 이름:");
				String name=sc.next();	
				System.out.print("수정할 email:");
				String email2=sc.next();
				System.out.print("수정할 급여:");
				int sal=sc.nextInt(); sc.nextLine();
				empDTO = new EmpDTO();
				empDTO.setFirst_name(name);
				empDTO.setEmail(email2);
				empDTO.setSalary(sal);
				empDTO.setEmployee_id(empid);
				int ret = empDAO.empUpdate(empDTO);
				if(ret>0){
					EmpView.print(empid + "직원정보가 수정되었습니다.");
				}else{
					EmpView.print(empid + "직원정보가 수정실패 하였습니다.");
				}
				break;
			case "delete":
				System.out.print("delete할 직원번호:");
				int id = sc.nextInt();
				sc.nextLine();
				empDTO = empDAO.selectById(id);
				if(empDTO!=null){
					EmpView.print("delete할 직원번호",empDTO);
				}else{
					EmpView.print(id + "번 직원은 존재하지않습니다.");
					break;
				}
				System.out.print(id + "번 직원의 정보를 삭제?(y/n)");
				String response = sc.nextLine();
				if(!response.equals("y")) break;
				int ret2 = empDAO.empDelete(id);
				if(ret2>0){
					EmpView.print(id + "번 직원은 삭제성공");
				}else{
					EmpView.print(id + "번 직원은 삭제실패");
				}
				
				
			default:
				break;
			}
			
		}
		System.out.println("시스템이 종료되었습니다.");
        
	}

}



