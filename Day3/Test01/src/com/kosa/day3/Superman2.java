package com.kosa.day3;

public class Superman2 extends Homospien implements Flyer{

	@Override
	public void takeOff() {
		// TODO Auto-generated method stub
		System.out.println("���۸��� ���� �����߽��ϴ�.");
	}

	@Override
	public void land() {
		// TODO Auto-generated method stub
		System.out.println("���۸��� �����߽��ϴ�.");
	}

	@Override
	public void fly() {
		// TODO Auto-generated method stub
		System.out.println("���۸��� ���� �ֽ��ϴ�.");
	}

	public void leepBuilding(){
		System.out.println("���۸��� �ǹ��� �پ�Ѱ� �ֽ��ϴ�.");
	}
	
	public void stopBullet(){
		System.out.println("���۸��� �Ѿ��� �����ϴ�.");
	}
}
