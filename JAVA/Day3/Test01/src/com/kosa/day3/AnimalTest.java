package com.kosa.day3;

public class AnimalTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Dog dog = new Dog();
		Cat cat = new Cat();
		Bird b	= new Bird();
		
		
		dog.setEyes((String)"2개");
		dog.setHair((String)"갈색");
		dog.setMouse((String)"큰 입");
		dog.setName("진돗개");
		
		dog.ululation();
		dog.run();
		
		System.out.println(dog.toString());
		
		cat.setEyes((String)"세로로 찢어진 눈");
		cat.setHair((String)"검은색");
		cat.setMouse((String)"작은 입");
		cat.setName("네로");
		
		cat.ululation();
		cat.walking();
		
		System.out.println(cat.toString());
		
		b.setEyes((String)"작은 2개");
		b.setHair((String)"회색");
		b.setWing((String)"2개의 큰 날개");
		b.setMouse((String)"부리");
		b.setName("닭둘기");
		
		b.flying();
		b.ululation();
		
		System.out.println(b.toString());
		
	}

}
