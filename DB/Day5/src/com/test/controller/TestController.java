package com.test.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import com.samepage.model.EmpDTO;
import com.test.dao.TestDAO;
import com.test.model.TestModel;
import com.test.service.TestService;
import com.test.service.TestServiceImpl;

public class TestController {
	
	public static void main(String[] args) {
		
		TestService ts = new TestServiceImpl();
		TestModel model = new TestModel();
		Map<String, EmpDTO> map = new HashMap<>();
		Scanner sc = new Scanner(System.in);
		
		System.out.print("CRUD TEST : ? ");
		String biz = sc.nextLine();
		
		switch (biz) {
		case "i":
			System.out.println("값을 입력하여라 : ");
			model.setMno(sc.nextInt());
			model.setEmail(sc.nextLine());
			model.setPwd(sc.nextLine());
			model.setMname(sc.nextLine());
			ts.insert(model);
			break;
		case "s1":
			System.out.println("값을 입력하여라 : ");
			ts.selectOne(sc.nextInt());
			break;
		case "sa":
			ts.selectAll();
			break;
		case "u":
			System.out.println("값을 입력하여라 : ");
			model.setMno(sc.nextInt());
			model.setEmail(sc.nextLine());
			model.setPwd(sc.nextLine());
			model.setMname(sc.nextLine());
			ts.updateTest(model);
			break;
		case "d":
			System.out.println("값을 입력하여라 : ");
			ts.deleteOne(sc.nextInt());
			break;
		default:
			break;
		}
		
	}
	
}
