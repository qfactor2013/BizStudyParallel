package com.kosa.day4;

import java.util.*;

public class Test11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Integer n1  =	new Integer(123);
		Integer n2  =	new Integer("123");
		
		System.out.println(n1);
		System.out.println(n2);
		
		String s = "123";
		int i = Integer.parseInt(s);
		System.out.println(i);
		
		
		for (int j = 0; j < 10; j++) {
			System.out.println((int)(Math.random()*10+1));
			}
		
		Date d = new Date();
		
		System.out.println(d);
		
		
	}

}
