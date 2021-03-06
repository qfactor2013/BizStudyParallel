package com.kosa.day2;

public class CarTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Car c1 = new Car("s60", "white");   // 객체의 인스턴스를 생성함
		Car c2 = new Car("s90", "black", 80);
		Car c3 = new Car();
		
		c1.name = "제네시스";
		c2.name = "에쿠스"; // 이렇게 안하고 보통 Getter/Setter를 통해 값 주입/반환
		c3.name = "모닝";	// 처음이니까 이렇게도 접근할 수 있다는 걸 보여줌
		
		c1.color = "red";   // c1에 있는 color를 가져온다는 의미
		c2.color = "white";
		c3.color = "green";
		
		c1.speedUp(70);
		c2.speedUp(50);
		c3.speedUp(90);
		
		//현재속도 저장
		int n = c1.getSpeed();
		System.out.println(n);
		String name = c1.getName();
		System.out.println(name);
	}

}
