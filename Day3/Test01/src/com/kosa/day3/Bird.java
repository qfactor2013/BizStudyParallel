package com.kosa.day3;

public class Bird extends Animal {

	private Object wing;

	@Override
	public void ululation() {
		// TODO Auto-generated method stub
		System.out.println("»õ°¡ ¿ó´Ï´Ù.");
	}

	public void flying() {
		System.out.println("»õ°¡ ³³´Ï´Ù.");
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
