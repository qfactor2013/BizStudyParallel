package com.kosa.day3;

public class AnimalTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Dog dog = new Dog();
		Cat cat = new Cat();
		Bird b	= new Bird();
		
		
		dog.setEyes((String)"2��");
		dog.setHair((String)"����");
		dog.setMouse((String)"ū ��");
		dog.setName("������");
		
		dog.ululation();
		dog.run();
		
		System.out.println(dog.toString());
		
		cat.setEyes((String)"���η� ������ ��");
		cat.setHair((String)"������");
		cat.setMouse((String)"���� ��");
		cat.setName("�׷�");
		
		cat.ululation();
		cat.walking();
		
		System.out.println(cat.toString());
		
		b.setEyes((String)"���� 2��");
		b.setHair((String)"ȸ��");
		b.setWing((String)"2���� ū ����");
		b.setMouse((String)"�θ�");
		b.setName("�ߵѱ�");
		
		b.flying();
		b.ululation();
		
		System.out.println(b.toString());
		
	}

}
