package com.kosa.day2;

public class TvTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		TV tv1 = new TV("»ï¼º", 50);
		TV tv2 = new TV("LG", 40, true, 1);
		
		tv1.setChannel(50);
		tv1.turnOffTV();
		tv1.turnOnTV();
		tv1.setChannel(50);
		
		tv2.turnOffTV();
		tv2.setChannel(20);
		
		System.out.println(tv1.toString());
		System.out.println(tv2.toString());
		
	}

}
