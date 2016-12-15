package com.kosa.day2;

/**
 * @author Qfactor 2016-10-05 static의 용법
 */
public class Test07 {
	public static void main(String[] args) { // args arguments 는 자바파일 실행시에 들어간 인자(String 배열)
		Calc c1 = new Calc();
		Calc c2 = new Calc();

		c1.total++;
		c2.total++;
		c1.grandTotal++;
		c2.grandTotal++;

		System.out.println(c1.total);
		System.out.println(c2.total);
		System.out.println(c1.grandTotal);
		System.out.println(c2.grandTotal);

		c1.test1();
		c2.test2();
		
		Calc.test1();
	}
}

class Calc {
	// int total;// c1.total 1 c2.total 1
	// int grandTotal;// c1.grandTotal 1 c2.grandTotal 1

	// 하지만 static을 주게 되면 이 변수를 공유하게 된다.(유일한 변수)
	// 왜? 미리 메모리에 로드되게 되어 stack에 객체 적재 시
	// static으로 지정한 곳은 새로 안 만들고 미리 생성한 그 부분을 가르킴.(class 변수)(반대는 instance 변수)
	// (code 영역, 주소값이 없는 유일한 메모리)
	int total;// c1.total 1 c2.total 1
	static int grandTotal; // c1.grandTotal 2 c2.grandTotal 2

	public static void test1() {
		System.out.println("test1");
	}

	public void test2() {
		System.out.println("test2");
	}

}
