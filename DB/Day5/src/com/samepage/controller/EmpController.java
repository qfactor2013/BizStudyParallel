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
		
		InputStream is =  System.in; // ǥ���Է�(Ű����)
//		int a = is.read(); //1����Ʈ�� �д´�.(�ƽ�Ű�ڵ尪)(�ѱ��� �ȵ� 2����Ʈ��)
//		System.out.println(a); 
//		
		Scanner sc = new Scanner(is); // �׷��� ���ϰ� �Ϸ��� ��ĳ�ʸ� ����.
//		System.out.println(sc.nextLine());
//		
		while(true){
			System.out.print("������ �Է��ϼ��� : ");
			String request = sc.nextLine(); 
			if(request.equals("bye")){
				System.out.println("�����մϴ�");
				break;
			}
			
			switch(request){
			case "selectall":
				emplist = empDAO.selectAll();
				EmpView.print(request, emplist);
				break;
				
			case "dept":
				System.out.print("��ȸ�� �μ���ȣ�� �Է� >>>>>");
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
				System.out.print("��ȸ�� �μ���ȣ�� �Է� >>>>>");
				String deptid = sc.nextLine();
				System.out.print("��ȸ�� ������ �Է� >>>>>");
				String jobid = sc.nextLine();
				emplist = empDAO.selectByMultiSelect(deptid, jobid);
				EmpView.print(request, emplist);
				break;
			
			case "insert":
				System.out.print("�Է��� �μ���ȣ�� �Է� >>>>>");
				String employee_id = sc.nextLine();
				System.out.print("�Է��� �̸��� �Է� >>>>>");
				String first_name = sc.nextLine();
				System.out.print("�Է��� ���� �Է� >>>>>");
				String last_name = sc.nextLine();
				System.out.print("�Է��� �̸����� �Է� >>>>>");
				String email = sc.nextLine();
				System.out.print("�Է��� �Ի����� �Է� >>>>>");
				String hire_date = sc.nextLine();
				System.out.print("�Է��� ������ �Է� >>>>>");
				String job_id = sc.nextLine();
				System.out.print("�Է��� ������ �Է� >>>>>");
				String salary = sc.nextLine();
				System.out.print("�Է��� �μ���ȣ�� �Է� >>>>>");
				String department_id = sc.nextLine();
				
				EmpDTO dto = new EmpDTO(employee_id, first_name, last_name, 
						email, hire_date, job_id, salary, department_id);
				
				empDAO.insert(dto);
				
			case "update":
				System.out.println("������ ����� �Է��Ͻÿ� : ");
				int empid = sc.nextInt();
				sc.nextLine();
				if(empDAO.updateByID(empid)>0){
					System.out.println("���������� �����Ͽ����ϴ�");
				}
				else{
					System.out.println("��������");
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
