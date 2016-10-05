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
	}
	public int speedUp() {
		return speed++;			// 기능
	}
	public int speedDown() {
		return speed--;
	}
}
