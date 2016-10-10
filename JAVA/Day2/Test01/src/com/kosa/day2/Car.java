/**
 * 
 */
package com.kosa.day2;
/**
 * @author qfactor 2016.10.05
 */
public class Car {
	/**
	 * Car 객체 설계
	 */
	String name;
	String color;				// 속성
	int speed;

	public Car() {
		// 클래스의 생성자 부분 객체가 생성될 때 반드시 호출함
		System.out.println("생성자 실행됨!!");
		name = "no name";
		color = "no color";
		speed = 0;
	}
	
	public Car(String name, String color) // 메소드 오버로딩
	{
		this.name = name;
		this.color = color;
		speed = 0;
	}
	
	public Car(String name, String color, int speed) // 메소드 오버로딩
	{
		this.name = name;
		this.color = color;
		this.speed = speed;
	}
	
	public void speedUp(int s) {
		speed += s;
//		System.out.println("현재속도 : " + speed);// 기능
	}
	public void speedDown(int s) {
		speed -= s;
//		System.out.println("현재속도 : " + speed);
	}
	public int getSpeed() {
		return speed;
	}
	public String getName() {
		return name;
	}	
}
