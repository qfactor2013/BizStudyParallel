package com.kosa.day3;

public class Bird extends Animal {

	private Object wing;

	@Override
	public void ululation() {
		// TODO Auto-generated method stub
		System.out.println("���� ��ϴ�.");
	}

	public void flying() {
		System.out.println("���� ���ϴ�.");
	}

	public Object getWing() {
		return wing;
	}

	public void setWing(Object wing) {
		this.wing = wing;
	}

	@Override
	public String toString() {
		return "Bird [" + super.toString() + "wing= " + wing + "]";
	}

}
