package com.kosa.day3.test;

public class Fish extends Animal implements Pet {

	private String name;
	
	protected Fish() {
		super(0);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return name;
	}

	@Override
	public void setName(String name) {
		// TODO Auto-generated method stub
		this.name = name;
	}

	@Override
	public void play() {
		// TODO Auto-generated method stub
		System.out.println(name + "Fish swim in their tanks all day.");
	}

	@Override
	public void eat() {
		// TODO Auto-generated method stub
		System.out.println("Fish eat pond scum.");
	}

	@Override
	public void walk() {
		// TODO Auto-generated method stub
		super.walk();
		System.out.println("Fish, of course, can't walk; they swim." );
	}
	
}
