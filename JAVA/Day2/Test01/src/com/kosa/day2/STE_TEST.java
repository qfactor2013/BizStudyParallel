/**
 * 
 */
package com.kosa.day2;

/**
 * @author Qfactor 2016-10-05
 * 			Student, Teacher, Employee 3���� ��ü �����ϴ� �׽�Ʈ ����
 *
 */
public class STE_TEST {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Student st1 = new Student("ȫ�浿", 23, 201601);
		Teacher t1 = new Teacher("�̼���" , 54, "�ڹ�");
		Employee e1 = new Employee("������",	18,	"������");
		
		st1.printinfo();
		t1.printinfo();
		e1.printinfo();
		
		
	}

}
