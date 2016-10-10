package com.kosa.day3;

/**
 * @author Qfactor 2016-10-05 ���������� Ȯ���ϴ� Ŭ����
 *
 */
public class Date {

	// int year;
	// int month;
	// int day;



	private int year;
	private int month; // private���� �ϰԵǸ� ���� ������ ���� �����ϰų� �������� ���ϴϱ�....
	private int day; // ����/���͸� �̿��մϴ�! (����Ű Alt + Shift + S -> Generate Getters and Setters)
	// ���������� �����ڵ� ����Ű�� �̿��Ͽ� ������ ���� �� �ִ�. Generate Constructor using fields
	// �̷��� �ܺο��� ���ߴ� ���� ĸ��ȭ��� �մϴ�.

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
	
	@Override
	public String toString() {
		return "Date [year=" + year + ", month=" + month + ", day=" + day + "]";
	}

}
