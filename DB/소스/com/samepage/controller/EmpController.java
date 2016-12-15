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
		
		InputStream is = System.in ; //ǥ���Է�(Ű����)
        
		Scanner sc = new Scanner(is);
		while(true){
			System.out.print("������ �Է��ϼ���>>");
			String request = sc.nextLine();
			if(request.equals("bye")) break;
			
			switch (request) {
			case "selectall":
				emplist = empDAO.selectAll();
				EmpView.print("���������ȸ", emplist);
				break;
			case "dept":
				System.out.print("��ȸ�� �μ���ȣ�� �Է��ϼ���>>");
				int dept = Integer.parseInt(sc.nextLine());
				emplist = empDAO.selectByDept(dept);
				EmpView.print(dept+ "�μ� ������ȸ", emplist);
				 
				break;
			case "salary":
				System.out.print("�޿������� �Է��ϼ���>>");
				int losal = sc.nextInt();
				int hisal = sc.nextInt();
				sc.nextLine();				
				emplist = empDAO.selectBySalary(losal, hisal);
				EmpView.print(losal +"~" + hisal+ "�޿��� �޴� ������ȸ", emplist);				 
				break;
			case "deptjob":
				System.out.print("�μ��� �Է��ϼ���>>");
				int dept2 = Integer.parseInt(sc.next());//0
				System.out.print("������ �Է��ϼ���>>");
				String job = sc.next(); //all
				sc.nextLine();
				emplist = empDAO.selectByDeptJob(dept2, job);
				EmpView.print(dept2 +"~" + job+ "... ������ȸ", emplist);				 
				break;
			case "insert":
				System.out.print("�Է��� ������ȣ:");
				int employee_id = sc.nextInt();
				System.out.print("�Է��� �̸�:");
				String first_name=sc.next();	
				System.out.print("�Է��� last_name:");
				String last_name=sc.next();
				System.out.print("�Է��� email:");
				String email=sc.next();
				System.out.print("�Է��� hire_date(yyyy/mm/dd):");				
				String dt = sc.next(); 
				//String->java.util.Date->java.sql.Date
				SimpleDateFormat sf = new SimpleDateFormat("yyyy/mm/dd");
				java.util.Date dt2 = sf.parse(dt);	
				Date hire_date = new Date(dt2.getTime());
				
				System.out.print("�Է��� job_id:");
				String job_id = sc.next();
				
				System.out.print("�Է��� salary:");
				int salary = sc.nextInt();
				
				System.out.print("�Է��� department_id:");
				int department_id = sc.nextInt();
				sc.nextLine();
				
				empDTO = new EmpDTO(employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id);
				int result = empDAO.empInsert(empDTO);
				if(result>0){
					EmpView.print(result + "���� ���������� �ԷµǾ����ϴ�.");
				}else{
					EmpView.print("�������� �Է� �����Ͽ����ϴ�.");
				}
			case "update":
				System.out.print("������ ������ȣ:");
				int empid = sc.nextInt();
				sc.nextLine();
				empDTO = empDAO.selectById(empid);
				if(empDTO!=null){
					EmpView.print("������ ������ȣ",empDTO);
				}else{
					EmpView.print(empid + "�� ������ ���������ʽ��ϴ�.");
					break;
				}
				//�̸�, �޿�, �̸���
				System.out.print("������ �̸�:");
				String name=sc.next();	
				System.out.print("������ email:");
				String email2=sc.next();
				System.out.print("������ �޿�:");
				int sal=sc.nextInt(); sc.nextLine();
				empDTO = new EmpDTO();
				empDTO.setFirst_name(name);
				empDTO.setEmail(email2);
				empDTO.setSalary(sal);
				empDTO.setEmployee_id(empid);
				int ret = empDAO.empUpdate(empDTO);
				if(ret>0){
					EmpView.print(empid + "���������� �����Ǿ����ϴ�.");
				}else{
					EmpView.print(empid + "���������� �������� �Ͽ����ϴ�.");
				}
				break;
			case "delete":
				System.out.print("delete�� ������ȣ:");
				int id = sc.nextInt();
				sc.nextLine();
				empDTO = empDAO.selectById(id);
				if(empDTO!=null){
					EmpView.print("delete�� ������ȣ",empDTO);
				}else{
					EmpView.print(id + "�� ������ ���������ʽ��ϴ�.");
					break;
				}
				System.out.print(id + "�� ������ ������ ����?(y/n)");
				String response = sc.nextLine();
				if(!response.equals("y")) break;
				int ret2 = empDAO.empDelete(id);
				if(ret2>0){
					EmpView.print(id + "�� ������ ��������");
				}else{
					EmpView.print(id + "�� ������ ��������");
				}
				
				
			default:
				break;
			}
			
		}
		System.out.println("�ý����� ����Ǿ����ϴ�.");
        
	}

}



