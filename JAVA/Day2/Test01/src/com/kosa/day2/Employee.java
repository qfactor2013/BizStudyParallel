/**
 * 
 */
package com.kosa.day2;

/**
 * @author Qfactor 2016-10-05
 *
 */
public class Employee {

	String name;
	int age;
	String department;

	public Employee(String name, int age, String department) {
		super();
		this.name = name;
		this.age = age;
		this.department = department;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public void printinfo(){
		System.out.println("직원 정보  이름 : " + name + " 나이 : " + age + " 부서 : " + department );
	}
}
