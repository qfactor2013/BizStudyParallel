package com.kosa.day3;

public class Bird2 implements Flyer {

	@Override
	public void takeOff() {
		// TODO Auto-generated method stub
		System.out.println("���� �������� �����մϴ�.");
	}

	@Override
	public void land() {
		// TODO Auto-generated method stub
		System.out.println("���� �����߽��ϴ�.");
	}

	@Override
	public void fly() {
		// TODO Auto-generated method stub
		System.out.println("���� ���� �ֽ��ϴ�.");
	}
	
	public void buildNest(){
		System.out.println("���� ������ ���� �ֽ��ϴ�.");
	}
	
	public void layEggs(){
		System.out.println("���� ���� ���� �ֽ��ϴ�.");
	}

}
