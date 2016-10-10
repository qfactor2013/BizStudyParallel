package com.kosa.day3;

public class Teacher2 extends Person2 {

	private String subject;

	public Teacher2() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Teacher2(String name, int age, String subject) {
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
