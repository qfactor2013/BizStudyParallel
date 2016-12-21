package model.domain;

public class Person {
	private String name;
	private int age;
	
	public Person() {
		System.out.println("Person 기본 생성자");
	}
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	public String getName() {
		System.out.println("getName()");
		return name;
	}
	public void setName(String name) {
		System.out.println("setName()");
		this.name = name;
	}
	public int getAge() {
		System.out.println("getAge()");
		return age;
	}
	public void setAge(int age) {
		System.out.println("setAge()");
		this.age = age;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Person [name=");
		builder.append(name);
		builder.append(", age=");
		builder.append(age);
		builder.append("]");
		return builder.toString();
	}
}
