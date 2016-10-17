package com.samepage.controller;

import java.util.List;

import com.samepage.model.MemberDAO;
import com.samepage.model.MemberDTO;
import com.samepage.view.MemberView;

public class MemberController {

	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();

		//SPȣ�� 
		String name = dao.spCall(5);
		MemberView.print("spȣ�� ���:" + name);
		

		// �����ȸ
		List<MemberDTO> mlist = dao.selectAll();
		MemberView.print(mlist);

		
		//Ư�� �����ȸ 
		MemberDTO m = dao.selectByMno(1);
		MemberView.print(m);
		/*
		 * //Ư�� �����ȸ MemberDTO m = dao.selectByMno(10);
		 *  MemberView.print(m);
		 * 
		 * //Ư����� ���� MemberDTO up_Mem = new MemberDTO(); up_Mem.setMno(10);
		 * String email = m.getEmail(); up_Mem.setEmail("zzilre"+
		 * email.substring(email.indexOf("@"))); up_Mem.setPwd("9999");
		 * up_Mem.setMname("�̸�����"); dao.updateMember(up_Mem);
		 * System.out.println("=====�ٽ� ��ȸ====="); m = dao.selectByMno(10);
		 * MemberView.print(m);
		 * 
		 * 
		 * 
		 * //�Ѱ��Է� MemberDTO ins_Mem = new MemberDTO(0, "zzilre1009@daum.net",
		 * "1234", "����"); int result = dao.insetMember(ins_Mem); if(result>0)
		 * MemberView.print("�Է¼���"); else MemberView.print("�Է½���"); //Ư����� ����
		 * result = dao.deleteMember(10); if(result>0)
		 * MemberView.print("delete����"); else MemberView.print("delete����");
		 */

	}

}
