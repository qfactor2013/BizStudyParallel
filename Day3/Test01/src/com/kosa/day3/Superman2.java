package com.kosa.day3;

public class Superman2 extends Homospien implements Flyer{

	@Override
	public void takeOff() {
		// TODO Auto-generated method stub
		System.out.println("슈퍼맨이 날기 시작했습니다.");
	}

	@Override
	public void land() {
		// TODO Auto-generated method stub
		System.out.println("슈퍼맨이 착지했습니다.");
	}

	@Override
	public void fly() {
		// TODO Auto-generated method stub
		System.out.println("슈퍼맨이 날고 있습니다.");
	}

	public void leepBuilding(){
		System.out.println("슈퍼맨이 건물을 뛰어넘고 있습니다.");
	}
	
	public void stopBullet(){
		System.out.println("슈퍼맨이 총알을 막습니다.");
	}
}
