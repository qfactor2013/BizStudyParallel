package com.samepage.offjt;

public class EmpController {

	public static void main(String[] args) {
		EmpManage em = new EmpManage();
		System.out.println("======������ȸ=======");
		em.selectAll();
		
		System.out.println("======Ư���μ���ȸ=======");
		em.selectByDept(90);
		
		System.out.println("======Ư���̸�����~=======");
		em.selectByName("Da");
		
	}

}
