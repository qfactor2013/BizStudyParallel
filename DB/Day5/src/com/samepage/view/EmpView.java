package com.samepage.view;

import java.util.List;

import com.samepage.model.EmpDTO;

public class EmpView {

	public static void print(String title, List<EmpDTO> emplist){
		System.out.println(title + ">>========== ������ ��� ===========<<");
		
		for (EmpDTO empDTO : emplist) {
			System.out.println(empDTO);
		}
	}
	public static void printOne(String title, EmpDTO empDTO){
		System.out.println(title + ">>========== �Ѱ� ��� ===========<<");
		System.out.println(empDTO);
	}
	public static void sysMessage(String message){
		System.out.println(message);
	}
	
}
