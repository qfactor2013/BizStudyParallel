package com.samepage.view;

import java.util.List;

import com.samepage.model.MemberDTO;

public class MemberView {

	public static void print(List<MemberDTO> mlist){
		System.out.println("====모두조회====");
		for(MemberDTO m : mlist){
			System.out.println(m);
		}
	}
	public static void print(MemberDTO m){
		System.out.println("====한건조회====");		
		System.out.println(m);		
	}
	public static void print(String msg){
		 	
		System.out.println("알림:" + msg + "*********");		
	}
}






