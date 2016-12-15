package com.kosa.day3;

public class Bird2 implements Flyer {

	@Override
	public void takeOff() {
		// TODO Auto-generated method stub
		System.out.println("새가 날개짓을 시작합니다.");
	}

	@Override
	public void land() {
		// TODO Auto-generated method stub
		System.out.println("새가 착지했습니다.");
	}

	@Override
	public void fly() {
		// TODO Auto-generated method stub
		System.out.println("새가 날고 있습니다.");
	}
	
	public void buildNest(){
		System.out.println("새가 둥지를 짓고 있습니다.");
	}
	
	public void layEggs(){
		System.out.println("새가 알을 낳고 있습니다.");
	}

}
