package com.samepage.view;

import java.util.List;
import com.samepage.model.EmpDTO;

public class EmpView {

	public static void print(String title, List<EmpDTO> emplist) {
		System.out.println(title + ">>====������ ���====");

		for (EmpDTO emp : emplist) {
			System.out.println(emp);
		}
	}

	public static void print(String title,
			 EmpDTO emp) {
		System.out.println(title + ">>====�Ѱ� ���====");
        System.out.println(emp);
		 
	}
	
	public static void print(String msg ) {
	     System.out.println(msg);		 
	}
	

}


