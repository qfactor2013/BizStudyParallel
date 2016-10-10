package com.kosa.day3;

public class Student extends Person {

	private String id;

	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Student(String name, int age, String id) {
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
