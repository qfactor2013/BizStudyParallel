package com.kosa.day3;

public class Airplane2 implements Flyer {

	@Override
	public void takeOff() {
		// TODO Auto-generated method stub
		System.out.println("비행기가 이륙합니다.");
	}

	@Override
	public void land() {
		// TODO Auto-generated method stub
		System.out.println("비행기가 착륙합니다.");
	}

	@Override
	public void fly() {
		// TODO Auto-generated method stub
		System.out.println("비행기가 날고 있습니다.");
	}

}
