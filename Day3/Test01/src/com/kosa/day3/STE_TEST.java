package com.kosa.day3;

public class STE_TEST {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Student st1	 = new Student();
		Teacher t1   = new Teacher();
		Employee e1	 = new Employee();

		st1.setAge(23);
		st1.setName("ȫ�浿");
		st1.setId("A001");
		
		t1.setName("�̼���");
		t1.setAge(53);
		t1.setSubject("java");
		
		e1.setAge(30);
		e1.setName("ö��");
		e1.setDept("����");
		
		
		System.out.println(st1.getName() + " : " + st1.getAge()	+	" : " + st1.getId());
		System.out.println(t1.getName() + " : " + t1.getAge() + " : " + t1.getSubject());
		System.out.println(e1.getName() + " : " + e1.getAge() + " : " + e1.getDept());
		
	}

}
