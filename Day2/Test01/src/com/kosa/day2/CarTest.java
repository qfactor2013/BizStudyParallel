package com.kosa.day2;

public class CarTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Car c1 = new Car();   // ��ü�� �ν��Ͻ��� ������
		Car c2 = new Car();
		Car c3 = new Car();
		
		c1.name = "���׽ý�";
		c2.name = "����"; // �̷��� ���ϰ� ���� Getter/Setter�� ���� �� ����/��ȯ
		c3.name = "���";	// ó���̴ϱ� �̷��Ե� ������ �� �ִٴ� �� ������
		
		c1.color = "red";   // c1�� �ִ� color�� �����´ٴ� �ǹ�
		c2.color = "white";
		c3.color = "green";
	}

}
