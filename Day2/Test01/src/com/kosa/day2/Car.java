/**
 * 
 */
package com.kosa.day2;
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
	}
	public int speedUp() {
		return speed++;			// ���
	}
	public int speedDown() {
		return speed--;
	}
}
