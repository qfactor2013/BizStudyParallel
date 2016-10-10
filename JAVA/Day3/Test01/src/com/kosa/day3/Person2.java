package com.kosa.day3;
/**
 * 
 * @author Qfactor 2016-10-06
 * 			다형성 상속을 위한 부모클래스 설계
 *
 */
public class Person2 {

	String name;
	int age;

	public Person2() {
	}

	public Person2(String name, int age) {
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
	
	public static void printinfo(Person2 p){
		if(p instanceof Student2){
			Student2 s = (Student2) p;
			System.out.println(s.getId());
		}
		if(p instanceof Teacher2){
			Teacher2 s = (Teacher2) p;
			System.out.println(s.getSubject());
		}
		if(p instanceof Employee2){
			Employee2 s = (Employee2) p;
			System.out.println(s.getDept());
		}
	}

	@Override
	public String toString() {
		return "Person [name=" + name + ", age=" + age + "]";
	}
	
}
