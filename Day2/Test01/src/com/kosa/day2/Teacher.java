/**
 * 
 */
package com.kosa.day2;

/**
 * @author Qfactor 2016-10-05
 *
 */
public class Teacher {

	String name;
	int age;
	String specialiy;

	public Teacher(String name, int age, String specialiy) {
		super();
		this.name = name;
		this.age = age;
		this.specialiy = specialiy;
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

	public String getSpecialiy() {
		return specialiy;
	}

	public void setSpecialiy(String specialiy) {
		this.specialiy = specialiy;
	}

	public void printinfo(){
		System.out.println("교수 정보  이름 : " + name + " 나이 : " + age + " 전공 : " + specialiy );
	}
}
