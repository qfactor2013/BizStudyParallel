package com.kosa.day3;

public class Employee2 extends Person2 {

	private String dept;

	public Employee2() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Employee2(String name, int age, String dept) {
		super(name, age);
		this.dept = dept;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

}
