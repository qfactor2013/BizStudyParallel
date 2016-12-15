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
				int dept2 = sc.nextInt();
				System.out.print("������ �Է��ϼ���>>");
				String job = sc.next();
				sc.hasNextLine();
				emplist = empDAO.selectByDeptJob(dept2, job);
				EmpView.print(dept2 +"~" + job+ "... ������ȸ", emplist);				 
				break;
			default:
				break;
			}
			
		}
		System.out.println("�ý����� ����Ǿ����ϴ�.");
        
	}

}



