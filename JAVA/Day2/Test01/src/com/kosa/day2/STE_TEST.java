/**
 * 
 */
package com.kosa.day2;

/**
 * @author Qfactor 2016-10-05
 * 			Student, Teacher, Employee 3개의 객체 생성하는 테스트 스텁
 *
 */
public class STE_TEST {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Student st1 = new Student("홍길동", 23, 201601);
		Teacher t1 = new Teacher("이순신" , 54, "자바");
		Employee e1 = new Employee("유관순",	18,	"영업부");
		
		st1.printinfo();
		t1.printinfo();
		e1.printinfo();
		
		
	}

}
