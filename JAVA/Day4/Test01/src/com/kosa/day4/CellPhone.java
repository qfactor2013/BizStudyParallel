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
				System.out.println("200" + "�� ��ȭ �Ͽ����ϴ�. ���͸��� �����ϴ�.");
				battery = 0;
			}
			else{
			battery -= (time * 0.5);
			System.out.println(time + "�� ��ȭ �Ͽ����ϴ�.");
			}
		}
		else if(time < 0){
			System.out.println("��ȭ�ð� �Է� ����");
		}
	}
	
	public void charge(int time){
		System.out.println(time + "�� �����Ͽ����ϴ�");
		
		if((battery + time * 3) > 100){
			battery = 100;
		}
		else{
			battery += (time * 3);
		}
		
		if(time < 0)
			System.out.println("�����ð� �Է� ����");
	}
	
	
	public void printBattery(){
		if(battery > 0)
			System.out.println("���͸��� " + battery + " �ۼ�Ʈ ���ҽ��ϴ�.");
		else
			System.out.println("���͸��� �����ϴ�");
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
