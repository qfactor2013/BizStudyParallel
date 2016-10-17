package com.test.controller;

import java.util.Scanner;

import com.test.model.TestModel;
import com.test.service.TestService;
import com.test.service.TestServiceImpl;
import com.test.view.TestView;

public class TestController {
	
	public static void main(String[] args) {
		
		TestService ts = new TestServiceImpl();
		TestModel model = null;
		Scanner sc = new Scanner(System.in);
		
		while(true){
		
		System.out.print("CRUD TEST : ? ");
		String biz = sc.nextLine();
		
		switch (biz) {
	
		case "i":
			System.out.println("���� �Է��Ͽ��� : (String, String, String)");
			String email = sc.nextLine();
			String pwd = sc.nextLine();
			String mname = sc.nextLine();
			model = new TestModel(email, pwd, mname);
			System.out.println(model);
			ts.insert(model);
			break;
		case "s1":
			System.out.println("���� �Է��Ͽ��� : ");
			TestView.print(ts.selectOne(sc.nextInt()));
			break;
		case "sa":
			TestView.print(ts.selectAll());
			break;
		case "u":
			System.out.println("������ ��ȣ�� �Է��Ͽ��� : ");
			int mno = sc.nextInt();
			model = ts.selectOne(mno);
			if(model != null){
				System.out.println("���� ã�Ҵ�.");
				System.out.println(model);
				System.out.println("������ �׸��� �Է��Ͽ��� : ");
				sc.nextLine();
				String email1 = sc.nextLine();
				String pwd1 = sc.nextLine();
				String mname1 = sc.nextLine();
				
				model = new TestModel(mno,email1, pwd1, mname1, null, null);
				ts.updateTest(model);
			}else{
				System.out.println("���� ã�� �� ����. �ٽ� �Է��Ͽ���");
			}
			break;
		case "d":
			System.out.println("���� �Է��Ͽ��� : ");
			ts.deleteOne(sc.nextInt());
			break;
			
		case "spcall":
			System.out.println("���� �Է��Ͽ��� : ");
			System.out.println(ts.spCall(sc.nextInt()));
		case "exit":
			System.exit(0);
		
		default:
			break;
		}
	}
		
	}
	
}
