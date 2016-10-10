/**
 * 
 */
package com.kosa.day3;

/**
 * @author Qfactor 2016-10-05
 * 			접근제어자 확인하는 테스트 스텁
 *
 */
public class DateTest {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
			Date d 	= new Date();
//			d.year 	= 2016;
//			d.month = 10;
//			d.day 	= 31;
			
			d.setYear(2016);
			d.setMonth(10);  // 이 세터메소드 안에서 유효성 검증 로직을 짤 수 있어요!
			d.setDay(31);
			
			d.print();
			
			
			System.out.println(d);				// d를 출력하면 컴파일시에 .toString()이 붙음
			System.out.println(d.toString());   // 참조형변수들의 주소값을 출력합니다.
												// 그래서 보통 클래스에서 오버라이딩하여 사용합니다.
			
	}

}
