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
			System.out.println("값을 입력하여라 : (String, String, String)");
			String email = sc.nextLine();
			String pwd = sc.nextLine();
			String mname = sc.nextLine();
			model = new TestModel(email, pwd, mname);
			System.out.println(model);
			ts.insert(model);
			break;
		case "s1":
			System.out.println("값을 입력하여라 : ");
			TestView.print(ts.selectOne(sc.nextInt()));
			break;
		case "sa":
			TestView.print(ts.selectAll());
			break;
		case "u":
			System.out.println("수정할 번호를 입력하여라 : ");
			int mno = sc.nextInt();
			model = ts.selectOne(mno);
			if(model != null){
				System.out.println("값을 찾았다.");
				System.out.println(model);
				System.out.println("수정할 항목을 입력하여라 : ");
				sc.nextLine();
				String email1 = sc.nextLine();
				String pwd1 = sc.nextLine();
				String mname1 = sc.nextLine();
				
				model = new TestModel(mno,email1, pwd1, mname1, null, null);
				ts.updateTest(model);
			}else{
				System.out.println("값을 찾을 수 없다. 다시 입력하여라");
			}
			break;
		case "d":
			System.out.println("값을 입력하여라 : ");
			ts.deleteOne(sc.nextInt());
			break;
			
		case "spcall":
			System.out.println("값을 입력하여라 : ");
			System.out.println(ts.spCall(sc.nextInt()));
		case "exit":
			System.exit(0);
		
		default:
			break;
		}
	}
		
	}
	
}
