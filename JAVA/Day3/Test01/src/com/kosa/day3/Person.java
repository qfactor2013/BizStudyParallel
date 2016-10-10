package com.kosa.day3;
/**
 * 
 * @author Qfactor 2016-10-06
 * 			상속을 위한 부모클래스 설계
 *
 */
public class Person {
	String name;
	int age;

	public Person() {
	}

	public Person(String name, int age) {
		this.name = name;
		this.age = age;
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

}
