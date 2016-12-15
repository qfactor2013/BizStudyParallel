package com.samepage.controller;

import java.util.List;

import com.samepage.model.MemberDAO;
import com.samepage.model.MemberDTO;
import com.samepage.view.MemberView;

public class MemberController {

	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();

		//SP호출 
		String name = dao.spCall(5);
		MemberView.print("sp호출 결과:" + name);
		

		// 모두조회
		List<MemberDTO> mlist = dao.selectAll();
		MemberView.print(mlist);

		
		//특정 멤버조회 
		MemberDTO m = dao.selectByMno(1);
		MemberView.print(m);
		/*
		 * //특정 멤버조회 MemberDTO m = dao.selectByMno(10);
		 *  MemberView.print(m);
		 * 
		 * //특정멤버 수정 MemberDTO up_Mem = new MemberDTO(); up_Mem.setMno(10);
		 * String email = m.getEmail(); up_Mem.setEmail("zzilre"+
		 * email.substring(email.indexOf("@"))); up_Mem.setPwd("9999");
		 * up_Mem.setMname("이름수정"); dao.updateMember(up_Mem);
		 * System.out.println("=====다시 조회====="); m = dao.selectByMno(10);
		 * MemberView.print(m);
		 * 
		 * 
		 * 
		 * //한건입력 MemberDTO ins_Mem = new MemberDTO(0, "zzilre1009@daum.net",
		 * "1234", "정진"); int result = dao.insetMember(ins_Mem); if(result>0)
		 * MemberView.print("입력성공"); else MemberView.print("입력실패"); //특정멤버 삭제
		 * result = dao.deleteMember(10); if(result>0)
		 * MemberView.print("delete성공"); else MemberView.print("delete실패");
		 */

	}

}
