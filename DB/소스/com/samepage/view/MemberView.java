package com.samepage.view;

import java.util.List;

import com.samepage.model.MemberDTO;

public class MemberView {

	public static void print(List<MemberDTO> mlist){
		System.out.println("====�����ȸ====");
		for(MemberDTO m : mlist){
			System.out.println(m);
		}
	}
	public static void print(MemberDTO m){
		System.out.println("====�Ѱ���ȸ====");		
		System.out.println(m);		
	}
	public static void print(String msg){
		 	
		System.out.println("�˸�:" + msg + "*********");		
	}
}






