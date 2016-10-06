package com.kosa.day3;

public class Teacher extends Person {

	private String subject;

	public Teacher() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Teacher(String name, int age, String subject) {
		super(name, age);
		this.subject = subject;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

}
