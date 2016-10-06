package com.kosa.day3;

public class Animal {

	private String name;
	private Object eyes;
	private Object mouse;
	private Object hair;

	public void ululation() {

	}

	public void eat() {

	}

	public Object getEyes() {
		return eyes;
	}

	public void setEyes(Object eyes) {
		this.eyes = eyes;
	}

	public Object getMouse() {
		return mouse;
	}

	public void setMouse(Object mouse) {
		this.mouse = mouse;
	}

	public Object getHair() {
		return hair;
	}

	public void setHair(Object hair) {
		this.hair = hair;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Animal [name=" + name + ", eyes=" + eyes + ", mouse=" + mouse + ", hair=" + hair + "]";
	}

}
