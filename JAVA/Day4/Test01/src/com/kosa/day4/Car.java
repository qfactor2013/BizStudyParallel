package com.kosa.day4;
/**
 * @author qfactor 2016.10.05
 */
public class Car {
	/**
	 * Car ��ü ����
	 */
	String name;
	String color;				// �Ӽ�
	int speed;

	public Car() {
		// Ŭ������ ������ �κ� ��ü�� ������ �� �ݵ�� ȣ����
		System.out.println("������ �����!!");
		name = "no name";
		color = "no color";
		speed = 0;
	}
	
	public Car(String name, String color) // �޼ҵ� �����ε�
	{
		this.name = name;
		this.color = color;
		speed = 0;
	}
	
	public Car(String name, String color, int speed) // �޼ҵ� �����ε�
	{
		this.name = name;
		this.color = color;
		this.speed = speed;
	}
	
	public void speedUp(int s) {
		speed += s;
//		System.out.println("����ӵ� : " + speed);// ���
	}
	public void speedDown(int s) {
		speed -= s;
//		System.out.println("����ӵ� : " + speed);
	}
	public int getSpeed() {
		return speed;
	}
	public String getName() {
		return name;
	}	
	
	@Override
	public String toString() {
		return "Car [name=" + name + ", color=" + color + ", speed=" + speed + "]";
	}
	
}
