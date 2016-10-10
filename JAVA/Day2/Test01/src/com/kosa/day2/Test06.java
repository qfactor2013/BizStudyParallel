package com.kosa.day2;

public class Test06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("hello \n java \n bye");
		
		int num = 3;
		if(num%2==0)
		{
			System.out.println("짝수입니다");
		}
		else
		{
			System.out.println("홀수입니다.");
		}
		
	    // 숫자 20 ~ 30사이의 데이터인지 판단
		
		if(num>=20 && num <= 30)
			System.out.println("참");
		else
			System.out.println("거짓");
		
		int num1	=	5;
		int result1	=	num1++;
						++num1;
						
		// 증감연산자의 선후관계는 먼저 증가하거나 후에 증가하거나의 차이이다.
		
		// 3항연산자는 if문의 다른 형태이다.
		// 조건식 ? 식1 : 식2
		// ex) a < b ? a + 1 : b * 2
	}

}
