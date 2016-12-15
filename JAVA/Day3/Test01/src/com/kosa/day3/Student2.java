package com.kosa.day3;

public class Student2 extends Person2 {

	private String id;

	public Student2() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Student2(String name, int age, String id) {
		this.name = name;
		this.age = age;
		this.id = id;
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
