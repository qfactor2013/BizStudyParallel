package com.kosa.day2;

/**
 * @author qfactor 2016.10.05 �л� Ŭ���� �����ϱ�
 *
 */
public class Student {
	// �й�, �̸�, ����
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

	// ������û�Ѵ�, ��������Ѵ�.
	public void applyLecture() {
		System.out.println("������û�մϴ�");
	}

	public void cancleLecture() {
		System.out.println("��������մϴ�");
	}

	public void printinfo() {
		System.out.println("�л� ����  �̸� : " + name + " ���� : " + age + " �й� : " + studentNumber);
	}

}
