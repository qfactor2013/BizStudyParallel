package com.kosa.day3;

public abstract class Fly {

	public abstract void takeOff(); // abstract를 붙이면 추상메소드가 되어 body가 없어도 된다.

	public abstract void land();

}

class Superman extends Fly {

	@Override
	public void takeOff() {
		// TODO Auto-generated method stub

	}

	@Override
	public void land() {
		// TODO Auto-generated method stub

	}

}

class Birdman extends Fly {

	@Override
	public void takeOff() {
		// TODO Auto-generated method stub

	}

	@Override
	public void land() {
		// TODO Auto-generated method stub

	}

}

class Airplane extends Fly {

	@Override
	public void takeOff() {
		// TODO Auto-generated method stub

	}

	@Override
	public void land() {
		// TODO Auto-generated method stub

	}

}