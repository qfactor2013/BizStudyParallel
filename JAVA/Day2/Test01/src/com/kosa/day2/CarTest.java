package com.kosa.day2;

public class CarTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Car c1 = new Car("s60", "white");   // ��ü�� �ν��Ͻ��� ������
		Car c2 = new Car("s90", "black", 80);
		Car c3 = new Car();
		
		c1.name = "���׽ý�";
		c2.name = "����"; // �̷��� ���ϰ� ���� Getter/Setter�� ���� �� ����/��ȯ
		c3.name = "���";	// ó���̴ϱ� �̷��Ե� ������ �� �ִٴ� �� ������
		
		c1.color = "red";   // c1�� �ִ� color�� �����´ٴ� �ǹ�
		c2.color = "white";
		c3.color = "green";
		
		c1.speedUp(70);
		c2.speedUp(50);
		c3.speedUp(90);
		
		//����ӵ� ����
		int n = c1.getSpeed();
		System.out.println(n);
		String name = c1.getName();
		System.out.println(name);
	}

}
