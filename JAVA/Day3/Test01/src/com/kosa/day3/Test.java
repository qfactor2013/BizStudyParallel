package com.kosa.day3;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		char c = 'A';
//		System.out.println(c);
		System.out.println((int)c);
		System.out.println((char)(c-1));
		
		for(int i = 0; i<128; i++)
		{
			System.out.println(i + " : " + (char)i);
		}
		
	}

}
