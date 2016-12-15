package com.samepage.offjt;

public class EmpController {

	public static void main(String[] args) {
		EmpManage em = new EmpManage();
		System.out.println("======전부조회=======");
		em.selectAll();
		
		System.out.println("======특정부서조회=======");
		em.selectByDept(90);
		
		System.out.println("======특정이름시작~=======");
		em.selectByName("Da");
		
	}

}
