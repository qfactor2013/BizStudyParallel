package com.kosa.day4;

import javax.print.attribute.standard.MediaSize.Other;

public class CellPhone {

	private String model;
	private double battery;
		
	public CellPhone(String model) {
		this.model = model;
	}
	
	public void call (int time){
		
		if(battery > 0 && time > 0){
			if(time * 0.5 > 100){
				System.out.println("200" + "분 통화 하였습니다. 배터리가 꺼집니다.");
				battery = 0;
			}
			else{
			battery -= (time * 0.5);
			System.out.println(time + "분 통화 하였습니다.");
			}
		}
		else if(time < 0){
			System.out.println("통화시간 입력 오류");
		}
	}
	
	public void charge(int time){
		System.out.println(time + "분 충전하였습니다");
		
		if((battery + time * 3) > 100){
			battery = 100;
		}
		else{
			battery += (time * 3);
		}
		
		if(time < 0)
			System.out.println("충전시간 입력 오류");
	}
	
	
	public void printBattery(){
		if(battery > 0)
			System.out.println("배터리가 " + battery + " 퍼센트 남았습니다.");
		else
			System.out.println("배터리가 없습니다");
	}
	
	@Override
	public boolean equals(Object otherObject){
		if(otherObject instanceof CellPhone){
			CellPhone c = (CellPhone)otherObject;
			if(this.model.equals(c.model))
				return true;			
		}
		return false;
	}
	
	
	
	
}
