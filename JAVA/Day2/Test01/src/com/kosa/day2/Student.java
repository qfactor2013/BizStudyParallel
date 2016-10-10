package com.kosa.day2;

/**
 * @author qfactor 2016.10.05 학생 클래스 설계하기
 *
 */
public class Student {
	// 학번, 이름, 나이
	int studentNumber;
	String name;
	int age;

	public Student() {
		// TODO Auto-generated constructor stub
	}

	public Student(String name, int age, int studentNumber) {
		super();
		this.studentNumber = studentNumber;
		this.name = name;
		this.age = age;
	}

	// 수강신청한다, 수강취소한다.
	public void applyLecture() {
		System.out.println("수강신청합니다");
	}

	public void cancleLecture() {
		System.out.println("수강취소합니다");
	}

	public void printinfo() {
		System.out.println("학생 정보  이름 : " + name + " 나이 : " + age + " 학번 : " + studentNumber);
	}

}
