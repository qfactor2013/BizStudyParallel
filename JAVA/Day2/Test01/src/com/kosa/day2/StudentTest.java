package com.kosa.day2;

public class StudentTest {
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Student st1 = new Student();
		Student st2 = new Student();
		Student st3 = new Student();

		st1.studentNumber = 201601;
		st1.name = "ȫ�浿";
		st1.age = 20;

		st2.studentNumber = 201602;
		st2.name = "�����";
		st2.age = 23;

		st3.studentNumber = 201603;
		st3.name = "����Ÿ";
		st3.age = 22;

		st1.applyLecture();
		st1.cancleLecture();
	}

}
