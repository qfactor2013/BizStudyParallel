package com.kosa.day3;
/**
 * 
 * @author Qfactor 2016-10-06
 * 			������ �׽�Ʈ�� ���� 2 �����׽�Ʈ
 *
 */
public class STE_TEST2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Student2 st1	 = new Student2();
		Teacher2 t1   = new Teacher2();
		Employee2 e1	 = new Employee2();

		st1.setAge(23);
		st1.setName("ȫ�浿");
		st1.setId("A001");
		
		t1.setName("�̼���");
		t1.setAge(53);
		t1.setSubject("java");
		
		e1.setAge(30);
		e1.setName("ö��");
		e1.setDept("����");
		
		
//		System.out.println(st1.getName() + " : " + st1.getAge()	+	" : " + st1.getId());
//		System.out.println(t1.getName() + " : " + t1.getAge() + " : " + t1.getSubject());
//		System.out.println(e1.getName() + " : " + e1.getAge() + " : " + e1.getDept());
		
		Person2.printinfo(st1);
		Person2.printinfo(t1);
		Person2.printinfo(e1);
	}

}
