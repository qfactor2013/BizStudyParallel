package com.kosa.day2;

/**
 * @author Qfactor 2016-10-05 접근제어자 확인하는 클래스
 *
 */
public class Date {

	// int year;
	// int month;
	// int day;

	private int year;
	private int month; // private으로 하게되면 여기 변수들 값을 세팅하거나 가져오질 못하니까....
	private int day; // 게터/세터를 이용합니다! (단축키 Alt + Shift + S -> Generate Getters and Setters)
	// 마찬가지로 생성자도 단축키를 이용하여 빠르게 만들 수 있다. Generate Constructor using fields
	// 이렇게 외부에서 감추는 것을 캡슐화라고 합니다.

	public Date(int year, int month, int day) {
		super();
		this.year = year;
		this.month = month;
		this.day = day;
	}

	public Date() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void print() {
		System.out.println(year + " : " + month + " : " + day);
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

}
